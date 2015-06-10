Title: Investing In Testing
Date: 2015-06-10 20:22
Tags: software, development, tools, test, testing
Slug: investing-in-testing

![Droidcon London](http://uk.droidcon.com/2014/wp-content/themes/droidcon/assets/img/ShardDroid.png "Droidcon London")

Last year I was talking to an engineer at [Droidcon
London](http://uk.droidcon.com/2015/) who was working on an Android
app with 100% test coverage. I immediately asked whether he thought
100% test coverage was worthwhile: many software engineering teams
strive to achieve 100% test coverage, but few succeed because it's an
enormous investment and one that I'm not sure often pays off.

As with [technical debt](http://en.wikipedia.org/wiki/Technical_debt),
I think it's useful to think of tests as technical investments. Time
is invested writing and maintaining tests and the expected return is
in time saved writing and debugging code or shipping
hotfixes. However, in many cases that payoff doesn't happen. It's easy
to write tests which never fail or slow down the software development
process they were intended to speed up. Large software systems tend to
accumulate lots of connective tissue in the form of methods which
simply pass a call along to another object. If the software builds and
starts these tests will always pass and so deliver little value, but
they fail when the code is changed, requiring an engineer to
investigate the failure and change or remove the test. Even good test
investments incur an opportunity cost as time spent writing tests is
time not spent improving the software being tested.

An [alpha](http://en.wikipedia.org/wiki/Alpha_%28finance%29) software
engineer then is one that can pick the investments that pay off while
avoiding spending time writing tests that don't. There are lots of
useful investment strategies that can be employed. In some cases test
driven development can save more development time than it costs to
write the tests, meaning that the the investment can pay off in
hours. In other cases the past can be a useful guide to the future: if
a bug is discovered then writing a test to ensure that it can't occur
again is often a good bet. Similarly, if changes to one part of a
system cause failures in another then writing tests for those
dependencies can avoid similar breakages in the future. In both cases
it's easier to add the tests later if the code is designed to be
testable, which in turn means that it's often a good idea to write at
least one test for each part of the system, to ensure that more tests
can be added when needed. Adding tests to code that you need to change
can be a good strategy as it prioritises parts of the system that are
changing while allowing parts that just work to keep running without
tests. However, if those parts of the system continually change the
tests being added can add maintenence cost without having time to
deliver a return on their investment. In a system where the user
interface behaviour changes less frequently than its implementation,
investing in end-to-end tests can be worthwhile. The end-to-end tests
have the opportunity to find many different bugs in different
revisions of the software, which is changing faster than the user
interface, but this needs to be weighed against the high maintenence
costs of end-to-end tests and the difficulty of diagnosing problems
when they fail.

In all of these cases the goal is to write the tests with the highest
expected return, or at least write those tests first. The problem with
just striving for 100% code coverage as an investment strategy is that
it values all tests equally. Any test which adds to code coverage is
considered valuable: even those which will never fail and just add
maintenance overhead. As the tests which can't fail are the easiest to
write they can often end up being written first. As more of these
tests are added, the costs mount without benefits being realised and
eventually tests stop being written with 80% code coverage, but with
many of the most valuable tests missing and a demoralized and
dissilusioned team.

When it comes to investing in testing it pays to invest in alpha.