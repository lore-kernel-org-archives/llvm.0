Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9B30FC12;
	Thu, 17 Sep 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637215; cv=none; b=ryqcVGKibwGLa5auOSAoqCKWba9BdBdmprKPQiGzL697IB0an5ORW/dkrJRjfz6EiCFsLteTl17ThN4NCum2OajmjiB1CeJK82i/edCKULfih5jfrBCwfPaIdxXTxuzV3uz9rLWVetVobfz8UCWB4/RXWD/sgFzd3kiluM1Je/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637215; c=relaxed/simple;
	bh=IlkVNj0xXsCkfHxpySBZylsZvremuEWoImLA/ZCEce0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2tWNjMLsVqnGcX1Si3GGZb11bVfpV4W2tuSj4BeLtwxorXTJ7E120blyi5yjVF4bM+o1NUMw5vudqjovseiiIF40NiAUct9HluXGBYJwUjxFpWVHOGRHNzbUdk5ve3zPE2R4D0KIv/KyRzDIpKr6n6kcOHdTm8xnIdJ6LmWtjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=KHefL30V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="KHefL30V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A8A1F000FF;
	Thu, 17 Sep 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=KHefL30V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789637209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jpBl8heh2AUjAK7nqjbj+dLxsHfYhkzcFdRIp3Lhe9o=;
	b=KHefL30VfIdRRzRgpzfGCTC7UfjBfpad88CSeVHC0T3jB5NbFbOtfNpk+LpYkQWGKWsMok
	Kthgz7zwZHbgHtECh7mo6raQ/0LzmxzI8nOVHiUsFBU1g2sG971bDWa15QayURg1WW+ijt
	642iznjahC3hByBVY8lBpyLx6LKXMvQ=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id aacbc655 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 17 Sep 2026 09:26:49 +0000 (UTC)
Date: Thu, 17 Sep 2026 11:26:46 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <aquyVkdYceiWdckX@zx2c4.com>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>

On Wed, Sep 16, 2026 at 02:58:44PM -0700, Nathan Chancellor wrote:
> After a recent change in LLVM [1], RISC-V builds fail when checking the
> vDSO:
> 
>   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
>   make[4]: *** [arch/riscv/kernel/vdso/Makefile:78: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1
> 
> memset() is now generated when zeroing params->reserved because LLVM has
> an optimization (now run in more instances) that can recognize at
> compile time when it is assigning a static value to a contiguous area of
> memory and turn that into a call to memset(). Both clang and GCC assume
> memset() is always available [2].
> 
> Hide the value of the iterator variable from the optimizer using
> OPTIMIZER_HIDE_VAR to inhibit this optimization since it can no longer
> assume that the zeroing is contiguous.
> 
> Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd359bdf00cb44b1c2439 [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#index-ffreestanding [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  lib/vdso/getrandom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..d48d1fdb3351 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/array_size.h>
> +#include <linux/compiler.h>
>  #include <linux/minmax.h>
>  #include <vdso/datapage.h>
>  #include <vdso/getrandom.h>
> @@ -83,8 +84,11 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
>  		params->size_of_opaque_state = sizeof(*state);
>  		params->mmap_prot = PROT_READ | PROT_WRITE;
>  		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> -		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i)
> +		for (size_t i = 0; i < ARRAY_SIZE(params->reserved); ++i) {
> +			/* prevent compiler from turning loop into memset() */
> +			OPTIMIZER_HIDE_VAR(i);
>  			params->reserved[i] = 0;
> +		}
>  		return 0;
>  	}
 
I don't suspect this is the right change. On x86_64, this changes to
code from:

    rep stosq

into:

    loc_2D9:
    mov     dword ptr [rbx+rax*4+0Ch], 0
    add     rax, 1
    cmp     rax, 0Ch
    jbe     short loc_2D9

Which is a lot less compact. It seems like the actual solution is for
gcc&clang to emit this inline memset mnemonic when the platform has a
good one, and otherwise not. But disabling optimizations for all
platforms, because it's broken on one, seems bad.

In this case, the compiler is being smart: it identifies a loop and
rightly turns it into memset. But if this isn't a compilation
environment that has an outline function, it should do something else.

Jason
