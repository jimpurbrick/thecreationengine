Title: buckd
Date: 2014-08-18 21:13
Tags: java, software, development, tools, build, test
Slug: buckd

<a href="https://www.flickr.com/photos/jimpurbrick/14775755047" title="BuckGraffiti by Jim Purbrick, on Flickr"><img src="https://farm6.staticflickr.com/5583/14775755047_47b31b3854_c.jpg" width="800" height="600" alt="BuckGraffiti"></a>

One of the things I’ve been working on since joining Facebook is
[Buck](http://facebook.github.io/buck/), an open source Android & Java
build tool which is significantly faster than many other Java build
tools for a [number of
reasons](http://facebook.github.io/buck/concept/what_makes_buck_so_fast.html).

As well as being fast, Buck gains a lot of power and flexibility by
using Python to generate build rules. Once projects become very large,
however, this can become a problem as Buck has to execute thousands of
python scripts to build its dependency graph before it can start its
parallel build process. When I started working on Buck this parse
phase could last tens of seconds. Buck was already much faster than
Ant, but [test driven
development](http://c2.com/cgi/wiki?TestDrivenDevelopment) could be
painful.

Our initial work focussed on making the parsing step faster and after
some experimentation with [Jython](http://www.jython.org/) we
discovered that bigger improvements could be made by running a long
lived Python process which could be handed build files to execute as
required.

As is often the case, the bulk of the improvements could be made by
caching. Build files change far less often than source files, so
caching the build file output avoids the need to spend a lot of time
parsing in the common case when only a small number of source files
change. After spending some time looking at serialising the build file
output to disk it became clear that a more effective approach would be
to cache the output in memory by running Buck as a long lived server
process using Nailgun.

[Nailgun](http://www.martiansoftware.com/nailgun/) is a client,
protocol, and server for running Java programs without incurring the
JVM startup overhead. Nailgun makes converting Java applications to
client-server architectures as simple as passing the name of the class
containing your <code>Main</code> method to the nailgun Server and
client application. Early experiments running Buck with Nailgun showed
a lot of promise, allowing us to reduce parse time to close to zero,
but running buck as a server invalidated several assumptions that
required a non-trivial amount of work to fix.

The environment had to be threaded through from the client and calls
to <code>System.getenv()</code> replaced, <code>System.exit()</code>
could no longer be used for garbage collection, so resource lifetimes
had to be managed with
[try-with-resources](http://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)
blocks and Nailgun needed to be extended to detect client
disconnections which could be thrown as
[InterruptedException](http://docs.oracle.com/javase/7/docs/api/java/lang/InterruptedException.html)s
to ensure that killing the Nailgun client cancelled builds as
expected. It’s also worth noting that for large, long running
applications like Buck the JVM started overhead saved by Nailgun is
not significant, but the time saved by the long running process being
able to maintain a JIT cache of Java class files is.

With Buck running as a long running server process the next step was
to make it correctly invalidate cached build rules when build files
changed. In order to avoid building outputs each time a file is
touched, buck hashes the contents of input files to see if they have
actually changed. While this saves a lot of time when switching
between similar source control branches it requires reading each input
file each time a build is run: something which was adding several
seconds to the per-build overhead that we were trying to reduce.

To avoid this overhead we switched to a composite approach which
watches the file system for changes and then checks the hashes of the
contents of changed files. In the case where a few files are edited
only a few hashes are generated and compared, in the case where source
control systems touch many files without changing their contents
comparing hashes avoids unnecessary rebuilding.

Initially we used the standard [Java
WatchService](http://docs.oracle.com/javase/tutorial/essential/io/notification.html)
to generate file change events, but found that in practice the latency
between changing a file and the FileWatcher generating events was far
too high. Luckily [wez](https://github.com/wez),
[sid0](https://github.com/sid0) and friends had built
[Watchman](https://github.com/facebook/watchman) which provides very
low latency file change events and an easy to use JSON based interface
which only took a day to wire in to Buck. Watchman is an amazing piece
of technology, but requires some tweaking of OS settings to work well,
so if you notice Buck taking a long time to parse project files you
may need to check the [system specific
preparation](https://facebook.github.io/watchman/docs/install.html#system-specific-preparation).

When combined with exopackage and a number of other optimisations, the
benefits of the Buck daemon are significant. Trivial builds now take a
small fraction of the time they used to and in some cases it’s
possible to incrementally build and install of an app in [less time
than it takes some build systems to do a no-op
build](http://facebook.github.io/buck/article/exopackage.html).

I’ve had a great time working with the amazingly talented Buck team
and I’m very happy to see buckd improving build times within Facebook
and beyond.

Now it’s time to go back to writing a test, watching it fail and
making it pass: with a lot less waiting around.