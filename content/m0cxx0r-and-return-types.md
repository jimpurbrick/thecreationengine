Title: m0cxx0r And Return Types
Date: 2008-12-03 22:04
Tags: agile, cplusplus, cxx, dynamicmock, m0cxx0r, mock, stop, testing
Slug: m0cxx0r-and-return-types

The core of [m0cxx0r][] is the creation of an object that records method
calls and compares them to expectations. This is done by using C++
placement new to create a VTableDonor object in allocated memory the
same size as the object being mocked and then returning the memory as a
m0cxx0r::Mock class which inherits from T, the class of the object
being mocked.

</p>

When methods are called on the mock object instead of invoking the
methods in T, the virtual methods in VTableDonor are called instead and
are able to record the calls made and compare them to expectations. The
problem is that the signature of the original method and the VTableDonor
method may not match.

</p>

In order to be able to find and compare parameters the VTableDonor
methods take a single parameter which they can use as a fix point to
find other parameters that may be passed to the call via pointer
arithmetic. Luckily the rules for parameter layout are fairly simple, so
if you know the address of the first parameter, it’s easy to find
the others.

</p>

Unfortunately the same isn’t true for return values. Depending on the
return type, space for the return value might be pushed on to the stack
as a hidden parameter, a pointer to a heap location might be pushed or
the caller may expect the return to be saved in a register. The rules
for which mechanism is used depends on some combination of the compiler,
platform and sometimes which C++ features the return type uses. To make
matters worse the this pointer is also pushed as a hidden parameter
which can become corrupted when there is a return type mismatch. All of
this makes it very difficult to call a VTableDonor virtual method with a
void return type in place of a virtual method on T with a non-void
return type and have everything work correctly. You can see why people
generally use the much simpler C <span class="caps">ABI</span> to nail
binaries together.

</p>

After a [lot][] [of][] [research][] and some trial and error I’ve
managed to get m0cxx0r working with virtual methods returning primitive
types and non-<span class="caps">POD</span> types by value in Visual
Studio 2005 on Windows and using g++ 3.3 on Linux. The new code can be
found [here][m0cxx0r]. I’m still having trouble getting it working on
g++ 4.0.1 on Darwin where dyld seems to be noticing my monkeying around,
causing the process to exit with a \_dyld\_misaligned\_stack\_error —
hopefully it will be possible to work around.

</p>

A potentially better solution is used by [mockitopp][], a brand new
dynamic mock framework for C++ that I found on my travels around the
internet today. Where m0cxx0r uses a compiler generated VTableDonor
class and then attempts to work around the signature mismatch problems,
mockitopp builds the mock vtable at run time which has the advantage
that the entries can be made to match the signatures in the class being
mocked. It looks to be a promising approach and I’m looking forward to
investigating mockitopp further.

</p>

  [m0cxx0r]: http://code.google.com/p/m0cxx0r/
  [lot]: http://www.programmersheaven.com/2/Calling-conventions
  [of]: http://en.wikipedia.org/wiki/X86_calling_conventions
  [research]: http://www.agner.org/optimize/
  [mockitopp]: http://code.google.com/p/mockitopp/
