Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2B52459DC;
	Sat, 13 Jun 2026 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781368171; cv=none; b=ZKCgQ42KStlXQJaZMYbBvRQKyznERS/hd60ke1PHc3KqV9FjfS8u9iUVPJQuvsOYZYFXarOaoSCggtz4jiIF5cVFNROSTmerr1Pd0gc+qC3F7K0fV/Wihz1+4iBle6Za2+Q0jGRp1HV0x5ynhmiZPfoIno8Qzr+veYpZJJ8isYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781368171; c=relaxed/simple;
	bh=w1HQDViHzxBXDnV1wlcypgRtQfjQu0Fa3eGGcfXZzyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um+kbW1gzlB/U5FpYGiox+D+OAV0dwEoHpCDhGuGhBeTuUK3aEQ252HsYooB8bAcDZnwxNK4ttjybEZE9V++a9f1PXfZwIB1NpEXVHVd7ITIez2sKhKCdXkD2oXnmVncntPRraFlSmHZOK3uZuDfCp+e4LiPI1UasVqAlT99ppc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIQDRxBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIQDRxBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF6B1F000E9;
	Sat, 13 Jun 2026 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781368169;
	bh=KjoxrIpGlbvek4mBaF4dxNQvMWKcJ8Beq92VaUt6am0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIQDRxBmGjPf0qnQkARZJCmB80fIpsnt1m2PtLWdQord+x8cURZ37zaEt7Nh9qmwA
	 EAKsxROHW4V5vMpHJkFqVu+YGS7o5/XgbFfspLOr9XCsCfPtzCp8gUAW75IQZnvWVs
	 j4rsmBEqoPhq0uXpLo3esuCB4TtJZimJuAFEweRKcCfyQNssofK6+c9CmOBD7JuJ/O
	 DqkEteFOMsPuOqVkWnO5hIL3ZfUEFDPH3Ww+9DdXls+qLICoFD/wLCpeZLWz49m9gc
	 GgqnV/GUkMCHjDig+CUcfeUJrJ9Ly2zMlTmJpypXxwN2R6xvRgWW0LgF/tromvdkxT
	 0SDexYDvhAvLw==
Date: Sat, 13 Jun 2026 12:29:23 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Jens Remus <jremus@linux.ibm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Heiko Carstens <hca@linux.ibm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] x86/cfi: Use symmetric SYM_START and SYM_END in
 __CFI_TYPE()
Message-ID: <20260613162923.GB2697431@ax162>
References: <20260611155716.830563-1-jremus@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611155716.830563-1-jremus@linux.ibm.com>

On Thu, Jun 11, 2026 at 05:57:15PM +0200, Jens Remus wrote:
> Commit ccace936eec7 ("x86: Add types to indirectly called assembly
> functions") introduced a x86-specific implementation of __CFI_TYPE()
> using an asymmetric combination of SYM_START() and SYM_FUNC_END() to
> add a symbol to the KCFI type identifier that precedes a function.
> 
> This asymmetric combination is an issue if SYM_FUNC_END() ever gets
> extended in a way that requires it to be used symmetrically with
> SYM_FUNC_START*().  For instance to emit DWARF CFI directives that
> denote the start/end of a function. [1]
> 
> Use SYM_END() with SYM_T_FUNC instead.  No functional change, as the
> generic implementation of SYM_FUNC_END(name) expands into
> SYM_END(name, SYM_T_FUNC).
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260522110427.2816637-1-jremus@linux.ibm.com?part=3 [1]
> Signed-off-by: Jens Remus <jremus@linux.ibm.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Notes (jremus):
>     This patch applies on top of linus' tree (9716c086c8e8):
>     
>       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  master
>     
>     I verified as follows that in x86-64 builds of vmlinux using Clang with
>     kCFI enabled without and with my patch applied vmlinux.o only differs in
>     relocations targeting .rodata.str* and a few symbols in .rodata shifted
>     (both likely due to differences in string merging):
>     
>     $ objdump -d vmlinux.o > vmlinux.o.{old|new}.objdump
>     $ readelf -Wa vmlinux.o > vmlinux.o.{old|new}.readelf
>     $ diff -u vmlinux.o.old.objdump vmlinux.o.new.objdump
>     [no differences]
>     $ diff -u0 vmlinux.o.old.readelf vmlinux.o.new.readelf | \
>       grep --invert-match -E "\.rodata\.str|@@"
>     [see above]
> 
>  arch/x86/include/asm/linkage.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.h
> index a7294656ad90..c9769a7b6e66 100644
> --- a/arch/x86/include/asm/linkage.h
> +++ b/arch/x86/include/asm/linkage.h
> @@ -103,7 +103,7 @@
>  	.byte 0xb8 ASM_NL					\
>  	.long __kcfi_typeid_##name ASM_NL			\
>  	CFI_POST_PADDING					\
> -	SYM_FUNC_END(__cfi_##name)
> +	SYM_END(__cfi_##name, SYM_T_FUNC)
>  
>  /* UML needs to be able to override memcpy() and friends for KASAN. */
>  #ifdef CONFIG_UML
> -- 
> 2.53.0
> 

-- 
Cheers,
Nathan
