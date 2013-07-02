Title: m0cxx0r - Compiler Generated Mock Objects For C++
Date: 2008-10-26 23:45
Tags: cplusplus, cxx, dynamicmockobjects, mocks, testing
Slug: m0cxx0r-compiler-generated-mock-objects-c

A few weeks ago at [JAOO](http://jaoo.dk/aarhus-2008/conference/) I felt insanely jealous while watching [Erik Doernenburg](http://jaoo.dk/aarhus-2008/speaker/Erik+D%C3%B6rnenburg) demo [Mockito](http://code.google.com/p/mockito/): I wanted dynamic mock objects in C++. It turns out that it's really hard. However, after a few days hacking around I found that it's not completely impossible. The results of my hacking are now available under a [BSD license](http://www.opensource.org/licenses/bsd-license.php) [here](http://code.google.com/p/m0cxx0r/). m0cxx0r lets you write tests like this in C++:

    :::c++
    typedef m0cxx0r::Mock<ProductionClass> MockClass;
    MockClass* mock = MockClass::create();
    mock->expect("foo", &ProductionClass::foo);
    mock->expect("bar", &ProductionClass::bar, 42);
    mock->expect("baz", &ProductionClass::baz);
    mock->foo();
    mock->bar(3);                                                     
    mock->verify();
    MockClass::destroy(&mock);

Most importantly you don't need to hand code a test double for ProductionClass: m0cxx0r generates it for you. The code needs lots of love: it's all in a single file and the interface will need iterating a few times, but I think it's a good start. Please download it, have a play and let me know what you come up with. I've only tested it on gcc version 4.0.1 on darwin, so I'd be interested to know if it works on other platforms as it uses some code layout assumptions that might not be portable. I'll write some blog posts over the next few days that explain how it all works.