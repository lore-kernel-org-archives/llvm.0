Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594174;
	b=5TR+Cp5LsgpFCjpOaGfveC8p2e4P110V00zcNTcpE4/ov38rxSkG9E5MTSkEm+UdYMfH
	 cYRzD+D8rb7FFHW7ZxN9miLECkFpQH3f7D71FUiNl0cbcoY+aOteRp8580iy45M8UcJiC
	 VZQjec84hrEOLUpUMXJ1Fv9OAoPukXZpeiQ1Nzb6NRjBsUXwRBpzs2V0u8btn9N1Zuizm
	 c2Qs57Wavc6K0tFHoQ1zJlTj2j9wV0kmomrDnufpswJQt11tMuvQ9lxZQi12iaa1RekCB
	 XkHplEdP6DIYYLftmLi1tRF/8haIx45LzYfTbSJA9OOBFjYSNJ/VlXmyed7mTf7Kl9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594174;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eP68cbAqEZ0aZdO/IraHM8siZBFgNnd6TZvBxVtWdf8=;
	b=Wxe/Tb69YuJhkptsco2wVpb0OBacT4snb+8RalTEkpDVESqYcR0KBPHV6JLrUUjozzD4
	 0+rryYSmCFOhJuCp23KmPdlIQpS9LD/4EiT2+YKL05iHdLkLPLUaAi85L9uiyAe1+pT0I
	 7/33xaVXBPaayBDHHpAiBQPIhYdySutBq4qJQbSYSKsdMk+weIvcjZbL1XintTPSWqnPW
	 hFp62gNrL70ika5DSAtKY0uaAdJaSnBnwjZWHLqEwAA6AHfVSFqVvHAgIVdpLA2fTmm7P
	 YKKwVPuQEv6EageLGOe4OHM5HOVj7X1yB4GPrITTfby9bDyw/d+KxD3K/0y90DS8RFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWvkEOPG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA7606A327;
	Fri, 13 Nov 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWvkEOPG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AFE1F000C5;
	Fri, 13 Nov 2026 18:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794594173;
	bh=eP68cbAqEZ0aZdO/IraHM8siZBFgNnd6TZvBxVtWdf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AWvkEOPGS+CS1RBqWl2bBT/Es6i/BO3kI0+XuFq9JQYPyrZDrWP5jHu5dyWuPXm+n
	 UA4pJHA/jsk3ZBQtxoDrMF18gHtug4pzQhFEb1dkUQUELS099GmWdv+hwbblwnJBE3
	 Jjl5y2Mdjx6+Xlk8nR4LZ9EhiRr6FIJgk85rz+4OR8RX7kKkb+iPO6MrKZYC/JYNzA
	 Flq13vJQGzeet9d622mfF6wASG5uwMRln+zi+PLRN7PcRU+sBGGj2hqXSjhMfQLgoC
	 aV5IoGDbLKJp0v8QM529n2CP8SwJ7MjHTM+S7hBp4f1RJn1zD48YWdHassLeSgcSJm
	 clLyYyclO+IFQ==
Date: Fri, 13 Nov 2026 10:22:51 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Chuck Wolber <chuck@wolber.net>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, Marco Elver <elver@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation
 in noinstr code
Message-ID: <avdUyFTijaXU5MwM@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-12-sashal@kernel.org>
 <avVaaxKUA2ArB6RG@jpoimboe>
 <20261112130906.1316655-1-sashal@kernel.org>
 <20261112151232.GC1813469@noisy.programming.kicks-ass.net>
 <avX80WkCFuGyS1y0@jpoimboe>
 <20261113150920.1953634-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113150920.1953634-1-sashal@kernel.org>

On Fri, Nov 13, 2026 at 10:09:20AM -0500, Sasha Levin wrote:
> On Thu, Nov 12, 2026 at 10:41:44AM -0800, Josh Poimboeuf wrote:
> >I must be missing something, if somebody sets a watchpoint in
> >exc_debug_kernel(), don't they get to keep the pieces?
> 
> Fair enough, the watchpoint was just the easiest way to show it. The
> real reason is that noinstr isn't supposed to have compiler
> instrumentation at all, and inlining sneaks the counters back in.

That seems circular though, I'm still trying to figure out what the
actual problem is.

> >It's also not clear why --hack-noinstr can't be extended to either NOP
> >out the affected instructions, or change the address relocation to point
> >to a dummy variable that won't trap.
> 
> I tried it, and I think it works better than patch 4, with some caveats :)
> 
> NOPing alone isn't enough: besides MC/DC, Clang sometimes loads a
> counter address into a register and increments it later. So I NOP the
> plain counter updates and point the rest at a dummy. With GCC that
> gets all of them. With Clang, 230 of about 3500 still go to the dummy.
> 
> Compared to patch 4, a boot covers about 14% more code, since the
> __always_inline helpers it dropped are some of the hottest code we
> have. It also fixes a GCC MC/DC build failure and some objtool UACCESS
> warnings that patch 4 caused, and it handles modules, which this check
> never looked at.
> 
> The catch is that it's x86-64 only. Other architectures would stay
> where they are today: whatever gets inlined into noinstr keeps its gcov
> counters, and nothing checks. Keeping patch 4 just for them doesn't
> look worth it to me. It cleans up Clang on arm64, but GCC still has
> about 190 counters in noinstr there either way, and the GCC MC/DC
> build failure shows up on arm64 too.

FYI, a partial objtool port (without the more controversial CFG
reverse-engineering bits) is likely coming to arm64 soon to support
klp-build, in which case this should be possible there as well.

> Peter, are you OK with fixing this on x86 only and leaving the other
> architectures as they are? If so, I'll switch to this in v3 and drop
> patch 4.
> 
> >And the changelog needs all that background, as the justification is not
> >clear at all (to me).
> 
> Will do.

Thanks!

-- 
Josh
