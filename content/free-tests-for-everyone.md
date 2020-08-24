Title: Free Tests For Everyone!
Date: 2015-06-11 17:00
Tags: software, development, tools, test, testing, staticanalysis, infer
Slug: free-tests-for-everyone

<img src="https://fbinfer.com/img/logo.png" width="400">

Modern software development is sometimes colourfully described as
being similar to firing tracer bullets at a target. Rather than
spending time doing a lot of research, design and specification up
front, the smallest, simplest version of the software is built and the
feedback gathered from its use is used to improve the next
version. Being able to continuously integrate, test and deploy
software means that we can make this feedback loop incredibly tight
but because the same engineers are developing the software and the
tests we constantly have to think carefully about the testing
investments we make and their opportunity costs.

Software engineers allow themselves to use knowledge of how the
software works to pick good white box tests. They rely on code
reviewers to catch important test cases that they've missed. They rely
on unit tests to exercise pathological cases which are hard to
exercise in end-to-end or integration tests. They use bugs discovered
in previous releases to inform tests cases developed for the next. The
goal is to ensure that the next version of the software provides
feedback on how close it is to the target rather than just exploding
on impact.

The decisions around which tests to write are hard because tests have
costs. They take time to write and maintain and need to be changed and
updated along with the software they test. What would happen if some
or all of the tests could be free?

This question has tantalised computer scientists since Turing’s work
on the [halting problem](https://en.wikipedia.org/wiki/Halting_problem)
in the 1930s and while academic progress has been made, tools based on
that work have tended to either only work on small codebases; perform
trivial analysis; generate a high percentage of false positives;
produce difficult to understand reports or impose other overheads on
the development process that make the resulting testing pretty far
from free. As a result while we theoretically know how to do
sophisticated analysis, in practice we tend to rely mostly on linters
doing trivial checks alongside automated tests which check a handful
of paths through the software written by engineers.

So it was wonderful when my mixture of hope, anticipation and
scepticism gave way to delight when the Infer static analyser
delivered on the promise of useful, non-trivial static analysis at
Facebook. While Infer currently only reports on a small subset of the
errors that it can detect, for those classes of errors Infer's output
is generally as useful as seeing a failing test case: Infer's 80% fix
rate on the non-trivial bugs it finds and reports on is extraordinary
in an environment like Facebook's.

Infer and tools like it won't completely replace test cases written by
engineers. To paraphrase Cristiano, without application specific
information, no formula will be able to determine whether a piece of
software is working as intended. As a companion to test suites though,
static analysis will be transformative. It's likely that sophisticated
static analysers will soon be used by everyone from the smallest
software engineering teams to the biggest tech companies. When high
quality tests are free, why wouldn't you run them?

Working with Infer in production at Facebook over the last year has
been like living in the future. It has changed the way I think about
testing and about the testing investments that should be made. I’m
incredibly excited to see its public release as an [open
source](https://github.com/facebook/infer) tool that can be used by
everyone and very grateful to have been able to help distribute this
future more widely.
