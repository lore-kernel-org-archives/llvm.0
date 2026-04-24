Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2D927FB2E
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031874; cv=none; b=dOwM2NU90KsbgfhQv1llMC5oEbZgYtqzHvWWIjUcNTjWz2kNxq5u4X0VPNz9AggELcWEWNj83cy6uUZRDvDqL30pZ3MbXxHv6+mUOU7iqzox2HflmaSlXOpXaAoN8OQUtSYZuVt0EHRA1IznMj9lqyIRXSAJc52AGDetZ2+LN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031874; c=relaxed/simple;
	bh=MYK1fWgR91ZYqs435Qv9paY5FhralssDhU5Ykv0Bby0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sf6Z90fQoMkKvRCG0KHkByRoeLPneur07k2EdpRNkMAcKtoiD+lpPUMxdiuYCQKrRmn/2Y5axTuMOZT9RNVOhuaQRAIA4H3tT0wfZKHOpbQCLNdqpPQQZLP4o6Dr+KhXaordKs25W4Qcog2U6JVd14xiFMaxPGWssFmIDCyR02I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 63OBvJ0f186057;
	Fri, 24 Apr 2026 06:57:19 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 63OBvCZI186048;
	Fri, 24 Apr 2026 06:57:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 24 Apr 2026 06:57:12 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
        jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
        ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
        ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
        bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
        tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, tamird@kernel.org, arnd@arndb.de,
        nsc@kernel.org, simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
        Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <aetamPA_SsWcwC4M@gate>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <aetZ3VX_Y9sop-SO@gate>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aetZ3VX_Y9sop-SO@gate>

On Fri, Apr 24, 2026 at 06:54:05AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, Apr 24, 2026 at 11:17:40AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > The core crate currently depends on these two functions for i64/u64/
> > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > the kernel so let’s panic if they are ever called.
> > 
> > This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
> > build on PPC32.
> 
> GCC uses calls to functions like even __addsi3 whenever the (sub-)target
> does not implement some RTL, doesn't have a define_insn and the like for
> it.  When you write a new port you only *have* to implement a very few
> things, the rest is done in libgcc (you might still have to write some
> of that for your target, no free lunch etc.)
> 
> 32-bit PowerPC has no instructions for 64-bit divisions, nor
> instructions that help implementing it in software.  It still very often
> helps to hand-write machine code for it, it very easily can usually be
> more than twice as fast for example (for example if the divisor is less
> than half a word big, the common case -- it can be made tens of times
> faster then).
> 
> There can be many reasons why a GCC backend decides to call a libgcc
> routine.  For __udivdi3 on -m32 rs6000 you'll be good AFAICS :-)
> (but poisoning functions like you do is a terrible idea in general!)

Whoopsie, I forgot to mention:

Approved for trunk.


Segher
