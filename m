Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C230D3FE;
	Mon,  3 Aug 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773529; cv=none; b=cdTRDgHtqz3OZpWTiNJlH8kNvjeOeXyuD48i9nlWZGwfoi3hpdnO+QcJzRVfreCyiTP4R5l8Sh+l141C5/+U3wIHhTQCgbrm2/scs3B1HWUQvifRpFiM/ZOihMtSwEMD/WUIwRz29XyLFjFsXKdsXa/IOVLa2iuudeMPZJC95as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773529; c=relaxed/simple;
	bh=13q5wDg1RmgPvl1z8qKDzbtTaoOy9HGSm50Qqdfw+6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6rQv5rOH7fxNddF5J8FcdRDCWW9BrfLwQBTMfg4mlcUhPQW6deLiQGYVA1LEXRUHxC80hXaQSViqKQFNSy1PWUZ5lKX4TqK81xSIdC1NgXujykaKAq4L2l/jrfHHa5YZoQ/aR/4fNjx3+cGMYB4/JzNitM521V8lTht1Rxxu/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e267Y0OK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e267Y0OK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3148B1F000E9;
	Mon,  3 Aug 2026 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773528;
	bh=e8JjNFL20nK9ji7G+GFiWaZM19p7Ewn1gMcxZGafd4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e267Y0OKMKk92xRbHSsHlgL6L+nakgtvHjuXJ+K6mbBMupxxsxdK/IxMhoX838hzM
	 ZhZrAbrmpOydKUpSxCyJexD1Yx9zJoDca1Dvk2wKwbkEFQQy12J7bj4DjzHImFNysQ
	 CfDIQVnEsUcN9V1qV0dTtv5orR/Z1WiQnDxf2QgcMV4WkAe8C9j/14UqUdbaagZJ48
	 DEPqO+16kXCoVQaUD9Ue/1/bYAIPnHd3pzZFwNW9EF1zmPB/BtMN8BIWfwS30nkRTd
	 D6CCWcaWV0fN6up3WrLfz9yAzTMKgjsBfgNfZ3/yhQkMHkjHCkBawUnBcvsfG3K006
	 +asmdi0pXkvjw==
Date: Mon, 3 Aug 2026 09:12:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <i@maskray.me>
Cc: Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv/runtime-const: Disable linker relaxation for
 RUNTIME_MAGIC
Message-ID: <20260803161203.GA953175@ax162>
References: <20260802174342.597092-1-i@maskray.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802174342.597092-1-i@maskray.me>

On Sun, Aug 02, 2026 at 10:43:42AM -0700, Fangrui Song wrote:
> Commit ee10b1028129 ("riscv/runtime-const: Replace open-coded
> placeholder with RUNTIME_MAGIC") switched the lui + addi[w] placeholder
> from hand-encoded immediates to %hi()/%lo() of RUNTIME_MAGIC.
> 
> GNU Assembler folds %hi()/%lo() of an absolute expression at assembly
> time. LLVM's integrated assembler since 21.1 defers it to the linker
> instead, which range checks it: on riscv64 R_RISCV_HI20 must fit a
> signed 20-bit field, and RUNTIME_MAGIC (0x89ABCDEF) is a positive 64-bit
> value rather than a sign-extended 32-bit one, so it does not:
> 
>     ld.lld: error: relocation R_RISCV_HI20 out of range: 563901 is not in
>     [-524288, 524287]
> 
> The sequence is patched at runtime and its instruction offsets are
> recorded via ".long 1b - .", so the linker must not touch it in the
> first place. Add ".option norelax", as is already done for
> ALTERNATIVE() and static keys; the integrated assembler then resolves
> %hi()/%lo() itself and emits no relocation, restoring the exact
> encoding the open-coded placeholder produced.
> 
> Fixes: ee10b1028129 ("riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2179
> Signed-off-by: Fangrui Song <i@maskray.me>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks a lot for the quick fix!

> ---
> Applies to tip/locking/core; the RISC-V tree (riscv/linux.git) does not
> carry ee10b1028129.
> 
>  arch/riscv/include/asm/runtime-const.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index a472ebbf0971..ce2008bb5227 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -23,6 +23,7 @@
>  	typeof(sym) __ret;						\
>  	asm_inline(".option push\n\t"					\
>  		".option norvc\n\t"					\
> +		".option norelax\n\t"					\
>  		"1:\t"							\
>  		"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
>  		"addi	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
> @@ -47,6 +48,7 @@
>  #define RISCV_RUNTIME_CONST_64_PREAMBLE				\
>  	".option push\n\t"					\
>  	".option norvc\n\t"					\
> +	".option norelax\n\t"					\
>  	"1:\t"							\
>  	"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
>  	"lui	%[__tmp], %%hi(" RUNTIME_MAGIC ")\n\t"		\
> 
> base-commit: 5e601ab3615c86be7c4068ce992f94654693a032
> -- 
> 2.43.0
> 
> 

-- 
Cheers,
Nathan
