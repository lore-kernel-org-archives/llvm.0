Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CD7E
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=65REOusaJPaPEBjW9i2M1+OoIBEIzBECH8es2CherDs=; b=vLWKCExDE6KV1qz8aDVDTtRXLO
	IcWF3ge3TJ+gEwuyphEAHR+pQTp0tW37DQP04r5gopSQPxiN+0GDsVvLk5LTuqVNMi3lsLOuJyccJ
	dFVMwjsR+Qaj293Gq/Z9QBUyA74Ll0iellr7Y6R3mlUAoC1aQ9OFB2PuFvRHz6N8VMaiiONTb0tF/
	9G5DIFABMxE13ka1jZAO1jxEiLdum9jzLDJIwa2UTEbySJadngIzEUhGOIADh+DRd3ougXYlZVmJu
	SOOGjH0A/TtD8yYgBG4OuI03qmwvVMZkB1qXh3zrqcx8Ze7ibHrTiGy5lHt72hhSVwegTBFBvA0V4
	a79n4+SQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrNQ9-00Bz5J-Us; Wed, 18 May 2022 17:25:14 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 88732980E1C; Wed, 18 May 2022 19:25:13 +0200 (CEST)
Date: Wed, 18 May 2022 19:25:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: objtool "no non-local symbols" error with tip of tree LLVM
Message-ID: <20220518172513.GH10117@worktop.programming.kicks-ass.net>
References: <YoK4U9RgQ9N+HhXJ@dev-arch.thelio-3990X>
 <20220516214005.GQ76023@worktop.programming.kicks-ass.net>
 <YoPAZ6JfsF0LrQNc@hirez.programming.kicks-ass.net>
 <YoPCTEYjoPqE4ZxB@hirez.programming.kicks-ass.net>
 <20220518012429.4zqzarvwsraxivux@treble>
 <YoSEXii2v0ob/8db@hirez.programming.kicks-ass.net>
 <20220518161725.2bkzavre2bg4xu72@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518161725.2bkzavre2bg4xu72@treble>

On Wed, May 18, 2022 at 09:17:25AM -0700, Josh Poimboeuf wrote:
> On Wed, May 18, 2022 at 07:30:06AM +0200, Peter Zijlstra wrote:
> > On Tue, May 17, 2022 at 06:24:29PM -0700, Josh Poimboeuf wrote:
> > > On Tue, May 17, 2022 at 05:42:04PM +0200, Peter Zijlstra wrote:
> > > > +	for (;;) {
> > > > +		symtab_data = elf_getdata(s, symtab_data);
> > > > +		if (t)
> > > > +			shndx_data = elf_getdata(t, shndx_data);
> > > >  
> > > > +		if (!symtab_data) {
> > > > +			if (!idx) {
> > > > +				void *buf;
> > > 
> > > I'm confused by whatever this is doing, how is !symtab_data possible,
> > > i.e. why would symtab not have data?
> > 
> > Elf_Data *elf_getdata(Elf_Scn *scn, Elf_Data *data);
> > 
> > is an iterator, if @data is null it will return the first element, which
> > you then feed into @data the next time to get the next element, once it
> > returns NULL, you've found the end.
> > 
> > In our specific case, we iterate the data sections, if idx fits inside
> > the current section, we good, otherwise we lower idx by however many did
> > fit and try the next.
> 
> Ok, I think I see.  But why are there multiple data blocks to begin
> with?  It's because of a previous call to elf_newdata() right?

Correct.

> If so then I don't see how it would "fit" in an existing data block,
> since each block should already be full.  Or... is the hole the one you
> just made, by moving the old symbol out?

Yeah, the hole can be in an arbitrary data block, also the case of not
having any global symbols, but see below...

> If so, the function seems weirdly generalized for the two distinct cases
> and the loop seems unnecessary.  When adding a symbol at the end, just
> use elf_newdata().  When adding a symbol in the middle, the hole should
> be in the first data block.

I tried that, but there's a number of weird cases that made a right mess
of that.

Consider for instance the case where there is 1 global symbol and we
need to add 2 local symbols. We start with a single data block:

 -  L	s1
 |  L	s2
 -  G	g1

So then we add one, say s3:

 -  L	s1
 |  L	s2
 -  L	s3
 -  G	g1

and we see we got a new data-block for g1, but then we add another local
symbol, s4, we move our g1 to a new data block but then find that our
hole is not in the original data block:

 -  L	s1
 |  L	s2
 -  L	s3
 -  <hole>
 -  G   g1

So while writing the global symbol can always use the new data section,
writing the new symbol can need arbitrary iteration of the data blocks.

Something somewhat similar is when there's no global symbols, then the
new symbol needs to go in the new data block instead of the old.

So it all became a tangled mess and I ended up with the one generic
function that could do it all (which is both simpler and less code than
trying to deal with all the weird cases).
