Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447861A3140
	for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 04:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739854394; cv=none; b=PJvSD18ehDC48DwT6BHTduRTddGNzig+0qK3F04jqLm60cQsrR6vguiD6QeXpG8Qoz8+bR+/9TpXIjCS6fhmwKf8oqmerX0wNZeym67iMNOzukwhU8QbRYz86NMHbQ1axDxp4oT8NH+d9CWf4ZpR+/WN/6V5J0jc7pf1rB7h7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739854394; c=relaxed/simple;
	bh=d85r5XVFsMQ03YgLNpDb+lOD+FFPsn41+mUyCC6e9Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kldBy8GO63nFiKcWK6jt1l2199fBOrQm4avQgfSkPrSvFzPvrlxaQM0H5uQZjrnnhPYh3Cy76mmA4ftZKSxspwYz2Ed2ai1Q0/FkhYe/ZR8YdHy0yfB+xum4flL9nNHIkmzkNZUmoJjr+cE6iUPO/jur+dqh0HGupdZYsfhLHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 51I4qqbw008526;
	Tue, 18 Feb 2025 05:52:52 +0100
Date: Tue, 18 Feb 2025 05:52:52 +0100
From: Willy Tarreau <w@1wt.eu>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Shuah Khan <shuah@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-mips@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] tools/nolibc: add support for N64 and N32 ABIs
Message-ID: <20250218045252.GA8134@1wt.eu>
References: <20250212-nolibc-mips-n32-v1-1-6892e58d1321@weissschuh.net>
 <alpine.DEB.2.21.2502161523290.65342@angie.orcam.me.uk>
 <3080562c-7cfd-4f66-9f62-9a99552d283f@t-8ch.de>
 <alpine.DEB.2.21.2502172208570.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502172208570.65342@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Mi Maciej,

On Mon, Feb 17, 2025 at 11:23:11PM +0000, Maciej W. Rozycki wrote:
> > >  Why is this code breaking stack alignment just to have to fix it up two 
> > > instructions down the line?  Or is it that the incoming $sp is not aligned 
> > > in the first place (in which case we're having a deeper problem).
> > 
> > nolibc itself does not assume that $sp is aligned.
> > Maybe Willy can explain the historical background.
> 
>  I'm all ears.

I had a look, that's interesting. Actually this started in the very
early i386 code in nolibc, where we already use the stack in the entry
code, and simply fix it up before calling main. Then we pursued this
with x86_64 (which also uses the stack and needs to fix it up), then
arm (where we use and fix the stack), then the MIPS entry code was
simply written based on the same construct while it does not use the
stack thus does indeed not need to be fixed. Here are the links, it
predates kernel inclusion:

    arm: https://github.com/wtarreau/nolibc/commit/af968b1
   mips: https://github.com/wtarreau/nolibc/commit/e04cd25

Thus we can shave 4 more bytes from the MIPS entry code ;-)

> > > > +#endif
> > > > +
> > > >  		"jalr $t9\n"             /* transfer to c runtime
> > > > */
> > > >  		" nop\n"                 /* delayed slot
> > > 
> > >  On an unrelated matter JALR above ought to be JAL (or otherwise there's 
> > > no point in using the .cprestore pseudo-op).  And I fail to see why this 
> > > code has to be "noreorder" (except for the .cpload piece, of course), it's 
> > > just asking for troubles.
> > 
> > Thanks for the hints.
> > 
> > Without "noreorder", is the manually addition of the delayed slot "nop"
> > still necessary?
> 
>  It's not.  It's for the `.set noreorder' mode only, to fill the branch 
> delay slot by hand.  Otherwise it'll become just a useless instruction 
> following the call sequence and executed after return.

Similarly I had ".set noreorder" and the nop in the initial code from 2017.
I remember that it took me a long while to get that init code to work on
my MIPS boxes, and it's extremely likely that I found the noreorder trick
long after I placed the nop and did not remove it.

> > These points also apply to the existing O32 implementation, right?
> 
>  Correct.  Sadly it's the first time I see this code.
> 
>  Overall I find it a bit of a chimera: it uses `.set noreorder' and 
> explicit relocations on one hand, and then high-level assembly `.cpload' 
> and `.cprestore' pseudo-ops on the other, effectively mixing the two 
> styles of assembly.
> 
>  The pseudo-ops come from times when using assembly macros was the norm 
> and are there to support that coding model where macros rely on these 
> pseudo-ops, and before the use of explicit relocations became the norm at 
> least for GCC.  In the absence of assembly macros you can write code 
> expansions for these pseudo-ops by hand, just as what GCC does nowadays 
> (in the `-mexplicit-relocs' mode, which is usually the default).
> 
>  But due to architecture variations it's very hard to write handcoded 
> assembly in the `.set noreorder' mode: you need to take care of all the 
> data dependencies that appear due to the lack of interlocking between 
> pipeline stages, which results in code that either works correctly 
> everywhere, but is suboptimal for newer architecture revisions, or code 
> that works better with newer architecture revisions, but is actually 
> broken with earlier ones.
> 
>  About the only typical case where you do want to use `.set noreorder' is 
> to schedule a branch delay slot by hand due to a data anti-dependency 
> between the two instructions.  Patchable/self-modifying code is a less 
> frequent case.  And I had literally one case in my entire career where I 
> wanted to actually jump to a branch delay slot instruction (it's still 
> there in arch/mips/include/asm/div64.h, in do_div64_32(); see label #2).
> 
>  Also it appears no code in this function actually relies on $gp having 
> been set up, so perhaps this stuff can just be discarded in the first 
> place?

All of this is very helpful. For example we did face an issue with
noreorder here, that required to then add ".set push" then ".set pop"
as it was polluting the rest of the code:

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=184177c3d6e0

But I'm pretty sure that I didn't invent this ".set noreorder" and if I
had found how to get rid of it, I'd happily done it. Like often with such
code, it was produced by trial and error, and it's very possible that one
solution was added to cover the problem caused by another one, and was
not optimal. For me by then, the code was considered OK enough when my
preinit program would work fine on all my machines (mostly mips-24Kc and
mips-1004Kc that I daily have access to).

In any case that's something that's easy to try again if we want to clean
that up to normalize it.

Thanks!
Willy
