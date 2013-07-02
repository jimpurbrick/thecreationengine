Title: Lang.NET 3 Years On
Date: 2009-04-27 11:12
Tags: boo, cli, clr, csharp, fsharp, languages, lsl, mono, second life, software engineering
Slug: langnet-3-years

It was incredibly satisfying to be able to go back to
Lang.<span class="caps">NET</span> 3 years on to be able to say that we
actually managed to make [all the crazy plans we had for Mono in 2006][]
work. My talk is now [online here][]. Lots of people hadn’t seen the
2006 talk and were blown away with us adding support for continuations
on the <span class="caps">CLR</span> and enough new stuff to keep those
that had seen the first talk interested. In particular the anecdote
about flywheel exploits for the Mono scheduler got a laugh from
Anders Hejlsberg.

</p>

The other highlights on Tuesday were [Mads Torgeson’s talk][], which
gave some nice insights in to the process that led up to the final C\#
4.0 Dynamic design. Mads did a good job capturing some of the concerns
that static advocates have with dynamic languages. Gilad Bracha’s talk
on [Newspeak and the Hopscotch <span class="caps">IDE</span>][] showed
what’s possible with a really dynamic language: extending the
<span class="caps">IDE</span> and debugging it from inside itself. The
access that newspeak has to it’s call stack was particularly
interesting: it would be much easier to move a newspeak stack around
than build the infrastructure we needed to move a
<span class="caps">CLI</span> stack. I spoke to Gilad about his
experiences building newspeak on Sqeak afterwards. His impression is
that Squeak is runtime mostly used for education and has no support for
security or running untrusted code. Having spent a decade seeing the
various security problems with bytecode verification in Java, Gilad
isn’t convinced that a bytecode level sandbox is the right approach, but
although he has some ideas for object capability based security for the
post squeak Newspeak implementation it seems a long way off.

</p>

The highlight on Wednesday was definitely [Lars Bak’s talk on V8][],
which I had missed last year at <span class="caps">JAOO</span>. The
mechanism for discovering emergent types in dynamic languages to allow
indexed lookup instead of hash table lookup is a very nice hack. Lar’s
super competitive heckling of everyone at Microsoft for the rest of the
day was also fun. Other highlights included Erik Meijer throwing coins
around while talking about mathematical duality and [Amanda Lauter][]
and [Luke Hoban][] talking about F\#. Potentially relevant to Linden Lab
if we get to the point where we can support debugging scripts in Second
Life was Herman Venter’s talk on the [Common Compiler Infrastructure][]
a newly open sourced library which can allow
<span class="caps">CLI</span> assembly rewriting while preserving
debug information.

</p>

The [Meta Introduction to Domain Specific Languages][] was a really good
opening for the DevCon, but the talk most relevant to Second Life was
Paul Cowan talking about [DSLs in the Horn Package Manager][]. Paul
talked about creating DSLs by extending [Boo][], something that should
be possible when we get to the point where Second Life can accept
arbitrary <span class="caps">CLI</span> assemblies. I got a first Boo
script compiling against the Second Life assemblies at the DevCon and
have some plans to experiment building a <span class="caps">DSL</span>
for virtual ecosystems in Second Life over the next few weeks.
Supporting C\# as a general purpose language and Boo as a meta language
for building DSLs in Second Life would be an excellent combination.

</p>

A lot of the talks at the DevCon seemed to involve doing terrifying
language somersaults to create more natural DSLs that run on the
<span class="caps">JVM</span> or <span class="caps">CLI</span> which
then can’t be easily debugged due to the huge chained expressions or
nested types that the languages boil down to. There seems to be a large
opportunity for disaster here when these DSLs need to be extended or
maintained in 10 years time after the original authors have moved on.
Although Martin deflected a lot of these questions by saying you can get
bad frameworks as easily as bad DSLs, I feel a lot more comfortable
unpicking a bad framework or wrapping a library than trying to fix or
extend a broken language (maybe several years reimplementing
<span class="caps">LSL</span>’s quirks did that).

</p>

The ultimate promise of DSLs was hinted at by [Magnus Christerson’s
talk][] which demoed Intentional’s amazing Domain Workbench. Instead of
building DSLs on top of mainstream runtimes, the Domain Workbench models
the domain and can then project the model as code or using domain
specific projections like interactive circuit diagrams that can be
manipulated and debugged interactively. Magnus started his talk saying
that we used to have to enter programs on punch cards that evolved in to
sequential programs and that we don’t need to do that any more. If the
Domain Workbench’s promise is fulfilled it could change the way we
develop software forever.

</p>

  [all the crazy plans we had for Mono in 2006]: http://download.microsoft.com/download/9/4/1/94138e2a-d9dc-435a-9240-bcd985bf5bd7/Jim-Cory-SecondLife.wmv
  [online here]: http://download.microsoft.com/download/B/F/0/BF0DAE51-F096-4DB4-8707-ACBDB7680BC0/17-JimPurbrick-SecondLife.wmv
  [Mads Torgeson’s talk]: http://download.microsoft.com/download/B/F/0/BF0DAE51-F096-4DB4-8707-ACBDB7680BC0/02-MadsTorgersen-CSharp4Dynamic.wmv
  [Newspeak and the Hopscotch <span class="caps">IDE</span>]: http://download.microsoft.com/download/B/F/0/BF0DAE51-F096-4DB4-8707-ACBDB7680BC0/08-GiladBracha-Hopscotch.wmv
  [Lars Bak’s talk on V8]: http://download.microsoft.com/download/7/6/A/76A69AE5-72B5-4005-BBD9-7EA5F4795014/18-LarsBak-JavaScript.wmv
  [Amanda Lauter]: http://download.microsoft.com/download/7/6/A/76A69AE5-72B5-4005-BBD9-7EA5F4795014/21-AmanderLauter-FSharpConcurrency.wmv
  [Luke Hoban]: http://download.microsoft.com/download/7/6/A/76A69AE5-72B5-4005-BBD9-7EA5F4795014/25-LukeHoban-FSharpProductization.wmv
  [Common Compiler Infrastructure]: http://download.microsoft.com/download/7/6/A/76A69AE5-72B5-4005-BBD9-7EA5F4795014/26-HermanVenter-CCI.wmv
  [Meta Introduction to Domain Specific Languages]: http://msdn.microsoft.com/en-us/oslo/dd727707.aspx
  [DSLs in the Horn Package Manager]: http://msdn.microsoft.com/en-us/oslo/dd727726.aspx
  [Boo]: http://boo.codehaus.org/
  [Magnus Christerson’s talk]: http://msdn.microsoft.com/en-us/oslo/dd727740.aspx
