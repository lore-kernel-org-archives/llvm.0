Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4D4364031;
	Wed,  4 Feb 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210849; cv=none; b=AnQeRzjpDlbWOflUY33cZOGGX9NaCR6NMHHZd3pwQ2D9Ni1J7/nutiFku/2+IPg7puv2twLM5qiI6myCX3jneQuhbAhs6BT+7LnjLa+O2OTFGwlN67kWoHqSz3EOjItTkBZWSANmbJFDUPhjHjtaT+tzU8yY2b3mCez7WE6V/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210849; c=relaxed/simple;
	bh=cFbrXk8pPVGKAhnxC2j5ADvuZUt7TfeiWE/MgoUVu8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUXSICMM3h0oWpMFURVtdMVADLfj2/iX2MzQXmhrFUEgn5g9jQaeIpK3OqambuDvaXe3aElYgQmp0UXaXMkfzN5tgq83zRQjcjF5pKxiF2AdTS3FaRGuXnA+vlV8ASsoR8Ym0Y1rU1RM1PPkotoLJcuj3NMSUs1ygIHXTEkzZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WFAAd/9y; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WFAAd/9y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bJ/9e2DA8SBPV6XQ0gOXCK1heDCNhcbD1ElCKLLyP5Y=; b=WFAAd/9yNOh7RV0efTlEPqxbue
	x8Q0Sctd+c4ROAGh4fPza2KWnZ6NSspi1NkxcWZMYEKdD+djm3RkQBGSvB0S1ZC1LO/hqlLylBf6I
	neHjzbqbnMWfGwDrxCUOQFuhRfjtX4+V4EXokqRhSiDhtjkJz+dZQi1PMf3ATfaDJm/jxy7k/W9W3
	2uuwOfK7dXsmIx1S+wxWUhcw0y3Gz3xiuQ7GeYK9kulncMPLXxkmzR95F0N2LZhlR5mBlBdHZAKRf
	ok4TLbfXUGC6naV7ncg9uCSyEK6b+J2YO+17bNs4rnhlb+f/dPHOi9Joymio581Xd05yFd48PtjSP
	l9QC++HA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnchl-000000026tM-0NwX;
	Wed, 04 Feb 2026 13:14:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73BA5300E8B; Wed, 04 Feb 2026 14:14:00 +0100 (CET)
Date: Wed, 4 Feb 2026 14:14:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck>
 <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck>
 <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>

On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> [...]
> > > > What does GCC do with this? :/
> > >
> > > GCC currently doesn't see it, LTO is clang only.
> >
> > LTO is just one way that a compiler could end up breaking dependency
> > chains, so I really want to maintain the option to enable this path for
> > GCC in case we run into problems caused by other optimisations in future.
> 
> It will work for GCC, but only from GCC 11. Before that __auto_type
> does not drop qualifiers:
> https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> 
> So to summarize, all supported Clang versions deal with __auto_type
> correctly for the fallback; GCC from version 11 does (kernel currently
> supports GCC 8 and above). From GCC 14 and Clang 19 we have
> __typeof_unqual__.
> 
> I really don't see another way forward; there's no other good way to
> solve this issue. I would advise against pessimizing new compilers and
> features because maybe one day we might still want to enable this
> version of READ_ONCE() for GCC 8-10.
> 
> Should we one day choose to enable this READ_ONCE() version for GCC,
> we will (a) either have bumped the minimum GCC version to 11+, or (b)
> we can only do so from GCC 11. At this point GCC 11 was released 5
> years ago!

There is, from this thread:

  https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV

another trick to strip qualifiers:

  #define unqual_non_array(T) __typeof__(((T(*)(void))0)())

which will work from GCC-8.4 onwards. Arguably, it should be possible to
raise the minimum from 8 to 8.4 (IMO).

But yes; in general I think it is fine to have 'old' compilers generate
suboptimal code.
