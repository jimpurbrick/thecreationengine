Title: m0cxx0r on Windows
Date: 2008-10-27 21:32
Tags: agile, cplusplus, cxx, dynamicmock, m0cxx0r, mock, stop, testing
Slug: m0cxx0r-windows

In order for m0cxx0r to be useful for writing tests at Linden Lab, it
needs to work on all of the platforms that we target with C++
applications, so today I tried building and running m0cxx0r on Windows.

</p>

Initially it looked good: m0cxx0r built in the default Visual Studio
Debug configuration, but then crashed on construction of Mock objects
due to accessing unitialised memory. This was relatively easy to fix,
just requiring a call to memset to zero out the memory that would become
the m0cxx0r::Mock object.

</p>

The next problem was harder to fix. One of the hacks at the core of
m0cxx0r is pointing the mock object’s vptr at a donor vtable populated
with methods that record calls to the methods. The problem is that the
signatures of the original and replacement methods may not match, so
multiple parameters may be passed to a method expecting a single
parameter. This shouldn’t be a problem as long as the caller manages the
stack unwinding: the caller just pushes parameters on to the stack which
are ignored and then popped the back off again.

</p>

Although m0cxx0r just worked when compiled with
<span class="caps">GCC</span> on darwin, the run time checks performed
in Debug by Visual Studio caught the stack pointer mismatch and stopped
execution. In Release the situation was even worse: the tests just
crashed out without error. Luckily after some poking around I was able
to turn of the stack pointer run time check in Debug and after some
trial and error I found that disabling optimisations in the Release
configuration with the default \_\_cdecl calling convention allowed the
tests to run without error in Release.

</p>

With these property changes made, m0cxx0r built and ran it’s tests fine
in Visual Studio 2005 on Windows. Get the Visual Studio 2005 project and
solution files along with the m0cxx0r code from [Google Code][].

</p>

  [Google Code]: http://code.google.com/p/m0cxx0r/
