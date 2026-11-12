Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509498;
	b=qpNgolNfLjSb+NFuS6M4hxxJvDd/WyJb+t8/OZvGYmkN3Odz8L0QcrSw+V3ASQDJ0ZAl
	 s6YEATafDvZjyeKmPFGL4rQBHIXqMwwu4PDasLwAdQIBy9NlfyoSMV2DHZNIyRFzbmPqK
	 WmTtNz37WLSRjvjMm2tYdZSVOTon3DQ9ibnLqmmbePUSeeFAnmWUc4WW438GEFMe/kP8P
	 JHOJuloJEOrPPOCxd34kx/aKIiuoboZEkVL98TimIsogdRPjzfLuLMM2NreAmgevQ7xGw
	 6II3TPdMO/6CvVys7i/K52NqbPgt4TRD7m0USUIA2fY2S5a5GttK6MZ03JgadW1f3kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4xVHSeXVlTNL8cXpBWwwHLnxqxvdgrZ2bQM0fDX8Muc=;
	b=zog3wsNk1YypM+XiPoN0GipSR+/5Gv0rYxUicRWG3qkvaHYu4zYBZAM+ih5jSZZRuR/R
	 /9IhOjAPNTngSFcvrqtIihS3r1PGc+alNZVt+rtxeuPmkT9jDomPteS8rdQ+K55Uc7UWS
	 QAdw8zmDDCH8ILR06viLNflD9MM7faZtnXPaNt+x12UFHHDBeUSk0V8YijCkeyDW46HGA
	 Q9l4k3Rm9u08aW/jBGwVhv98sTXPShkU/ooA+SPTWROjx1gCS5gwZb3ohbrm231Z03LDI
	 9eg3H9Sz5I6UFGjkZftqQj8na5Vupk1NKgim+sSd4F+b3ATxXB+Ee25pht34WinC5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8mFqony;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6029360A6F76;
	Thu, 12 Nov 2026 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8mFqony
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D42E1F000C5;
	Thu, 12 Nov 2026 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794509498;
	bh=4xVHSeXVlTNL8cXpBWwwHLnxqxvdgrZ2bQM0fDX8Muc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8mFqony48+NyZyu/ogiuM/AI6enaJ7oE5GibiH5ydQ2+w0bzL5Rn1LWLGMBlfXrK
	 68n57Yf2cpHDbK5iW3nA0ylKl4HyERljOFNUDjHwwAZkQicG7fc34yGGe7HdOhmNoZ
	 k701I5HhH0yORA9s+MWCyZ1qWeqfVJlktS+cslLnUkhLY+cDAOv5XZ/yREyNdpZCjz
	 13UFJ6PPGVTGLqbqdPelD6qm55jUI8VPvW5DgDRPwPqyFnhvdll8E4UMoowrQzKDVn
	 QVESiq5akwr0+1n8iDsIbYx9r0shfhRXm436LCsk1TBo/7jUHMX8/GnzSG3ETl2QXR
	 mbl6AMX2YjKAw==
Date: Thu, 12 Nov 2026 10:51:35 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Chuck Wolber <chuck@wolber.net>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, Marco Elver <elver@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation
 in noinstr code
Message-ID: <avYKUgK8eeFQ2rS_@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-12-sashal@kernel.org>
 <avVaaxKUA2ArB6RG@jpoimboe>
 <20261112130906.1316655-1-sashal@kernel.org>
 <20261112151232.GC1813469@noisy.programming.kicks-ass.net>
 <avX80WkCFuGyS1y0@jpoimboe>
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
In-Reply-To: <avX80WkCFuGyS1y0@jpoimboe>

On Thu, Nov 12, 2026 at 10:41:46AM -0800, Josh Poimboeuf wrote:
> On Thu, Nov 12, 2026 at 04:12:32PM +0100, Peter Zijlstra wrote:
> > On Thu, Nov 12, 2026 at 08:09:06AM -0500, Sasha Levin wrote:
> > > On Wed, Nov 11, 2026 at 10:23:41PM -0800, Josh Poimboeuf wrote:
> > > >What exactly is the problem with noinstr code incrementing counters
> > > >inline?
> > > 
> > > The counter is a memory write, and a memory write can trap. In noinstr
> > > code that can happen before we're ready to take another exception.
> > > 
> > > With GCOV_PROFILE_ALL today, exc_debug_kernel() bumps a counter before
> > > it clears DR7. Set a watchpoint on that counter and the next kernel #DB
> > > never returns, it just keeps re-entering the handler. I tried it on
> > > v7.4-rc1 in a VM and it hangs.
> > > 
> > > noinstr is already supposed to keep these out, it has had __no_profile
> > > for years. But that doesn't cover what gets inlined into it, and nothing
> > > checks. This patch adds the check.
> > 
> > Right, strictly speaking this is a toolchain bug, but since we need to
> > build with existing tools we need to bodge it somewhat :/
> 
> I must be missing something, if somebody sets a watchpoint in
> exc_debug_kernel(), don't they get to keep the pieces?

Or rather, sets a watchpoint on a counter specific to
exc_debug_kernel()...  Still, why would somebody do that.

> It's also not clear why --hack-noinstr can't be extended to either NOP
> out the affected instructions, or change the address relocation to point
> to a dummy variable that won't trap.
>
> And the changelog needs all that background, as the justification is not
> clear at all (to me).

-- 
Josh
