Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE343148DD;
	Thu, 17 Sep 2026 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666766; cv=none; b=DC7PMvKGn9Jjk4Pg3IvJiRYVhAaz+bYe7Aeld6dYS9ss3SyytJ1eG7JIcQq8Z92XRLOPvN9fPng6H8EdbQ/EBG0mi1GYQ/oiV603+ra1pa7QMducfP1iEuoM84lxMlNETIzI7CHnMAfVtgsHj5mTMwkoxE2eWyJCnw11a11SsJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666766; c=relaxed/simple;
	bh=xfpUhlZAyJoBpf6pv4c1SUq3FwUijP5vw5nWQIVQT6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYqV3BvU8cw5HxlcSuB8CU1ZsuyWdDV9IBvuVeZQ9pRhinP/HodqN6/etlvfF9/rGD+Bp1lYzW2CRwphTExhYufyuw2QasLirU8OcNDRU7JX2t2vRkAU5PbUff79t36AtxjZ/ruce1BRCSqsfb/KVzw19ZRisY9M28iHJ3wW0qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOdbnhbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOdbnhbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79951F00893;
	Thu, 17 Sep 2026 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666764;
	bh=AaoMw5MW05VP9pgJkkIWGK2Mn42G01qD9yVc/ObiDTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XOdbnhbt0Z72MpH2noPoRJefbbEg0jPBJ1fXUZz+H0kFYB8AE2qYEU93Y3rVY5Osw
	 tgzbjdoIB0WJhMtcYI2tgNz31fatUgP7CiQtbSbUSaQQU5PWX1toRp0EJzN4zbslfB
	 f1vqSB3n29XQ3CN/ZMyYWXpZVUc9eh6/cCUVZtM67JQ2LJXAaui0YWtoXexmHz3GSW
	 DNhyBoGwKXpWSj4EiARAr+VZmxI1dKrzGxsL9Q+xj4oRXUEO9oJ0q7Oi5OmE2/1vBo
	 f8FU4ApFuW4ZU79fY4jsnc7V2q6O+jyDj4dTFRjch9ZIeacHjdISaRz8W+h4PbEjvo
	 tqGaMlaQMQrvA==
Date: Thu, 17 Sep 2026 10:39:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260917173920.GB356152@ax162>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aquyVkdYceiWdckX@zx2c4.com>

On Thu, Sep 17, 2026 at 11:26:46AM +0200, Jason A. Donenfeld wrote:
> I don't suspect this is the right change. On x86_64, this changes to
> code from:
> 
>     rep stosq
> 
> into:
> 
>     loc_2D9:
>     mov     dword ptr [rbx+rax*4+0Ch], 0
>     add     rax, 1
>     cmp     rax, 0Ch
>     jbe     short loc_2D9
> 
> Which is a lot less compact. It seems like the actual solution is for
> gcc&clang to emit this inline memset mnemonic when the platform has a
> good one, and otherwise not. But disabling optimizations for all
> platforms, because it's broken on one, seems bad.

Yes, that is certainly fair criticism. That said, this optimization
happens in the middle end as far as I can tell, so I am not sure how
much target specific knowledge is available at that point.
Additionally...

> In this case, the compiler is being smart: it identifies a loop and
> rightly turns it into memset. But if this isn't a compilation
> environment that has an outline function, it should do something else.

As I mentioned in the commit message, compilers require all environments
(hosted or not) to provide memset(), so the "doing something else" is
nothing :)

  GCC requires the freestanding environment provide memcpy, memmove,
  memset and memcmp.

I guess another option is to just include a basic memset() like the one
in lib/string.c so that it is only used if the compiler makes this sort
of transformation, while leaving all other architectures alone.

-- 
Cheers,
Nathan
