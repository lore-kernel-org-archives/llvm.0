Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A72820AC;
	Tue,  3 Feb 2026 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152107; cv=none; b=mqTWDOxvDYmWW0PRv711bEdXuQWc1LneJeocLdQ1fhehpuuNlOuyp2ALobyIU1rEGJEg53bKefyVyKpN+OPQMmNmr9uVfrnlAZ4K0+1OVK5C4DsE/+RX0QGF30kFr34gC24uEvBM04qDKwgwmSxqszzcRiBhlrHP/9WVVCt7iLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152107; c=relaxed/simple;
	bh=qNVKdNlvBI2upvfPnIIgcVTzRhdg8ywM2HpUBMwe0vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyZaCMeQyuvGP9MVR2OKHvNkX9pq4QnVPfJp6s2BgodM+O1atnRJFWps95zUvwi+T2OvyhiDTMB8zhWbl9CFU4gat0yWyHpmsAUZtzrtVrdokbCx+YAN+Efgu+RPO3NlxjWHMQw1Rww/wF0gkdiYHUUbe3ub49Us313fCSf2jsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POWNce9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POWNce9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E095C116D0;
	Tue,  3 Feb 2026 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770152106;
	bh=qNVKdNlvBI2upvfPnIIgcVTzRhdg8ywM2HpUBMwe0vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POWNce9Uce38XpZ7U2P46dhJuFXkGCnJDzv1qQ7fO+ohlM18AjxAR9TBIe6tAXdl5
	 PtKfRHKTYSLnla8zkDLT3odsYw90qWhaAtHzzpfQdcJHvtAKPq4e+jlGPJWGWFkk+l
	 XY6kO7rDIdleV7uKpQxL3QjMowb493+3u7SpFPJAh+RXIpAi6J2S5cKbK12Niazlip
	 Gcp86Os96EG3x8+RuErxGPng+g31nIgq9udndxB32r7QeKfOYLFMmtfIhv+qL76Kic
	 rJt3k424VOBVbbVJS9z6aHpldW0kJjzd+wo4VD4BR8BPryApHapNepBCQ2Mi+Bjaay
	 kgOdVzMPG/HpA==
Date: Tue, 3 Feb 2026 13:55:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on
 PPC32
Message-ID: <20260203205501.GC3573384@ax162>
References: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>

On Tue, Feb 03, 2026 at 08:30:41AM +0100, Christophe Leroy (CS GROUP) wrote:
> Test robot reports the following error with clang-16.0.6:
> 
>    In file included from kernel/rseq.c:75:
>    include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
>                    unsafe_get_user(offset, &ucs->post_commit_offset, efault);
>                    ^
>    include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
>            arch_unsafe_get_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
>            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>            ^
>    arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
>            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>            ^
>    arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
>            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
>                    "       li %1+1,0\n"                    \
>                     ^
>    <inline asm>:7:5: note: instantiated into assembly here
>            li 31+1,0
>               ^
>    1 error generated.
> 
> On PPC32, for 64 bits vars a pair of registers is used. Usually the
> lower register in the pair is the high part and the higher register is
> the low part. GCC uses r3/r4 ... r11/r12 ... r14/r15 ... r30/r31
> 
> In older kernel code inline assembly was using %1 and %1+1 to represent
> 64 bits values. However here it looks like clang uses r31 as high part,
> allthough r32 doesn't exist hence the error.
> 
> Allthoug %1+1 should work, most places now use %L1 instead of %1+1, so
> let's do the same here.
> 
> With that change, the build doesn't fail anymore and a disassembly shows
> clang uses r17/r18 and r31/r14 pair when GCC would have used r16/r17 and
> r30/r31:
> 
> 	Disassembly of section .fixup:
> 
> 	00000000 <.fixup>:
> 	   0:	38 a0 ff f2 	li      r5,-14
> 	   4:	3a 20 00 00 	li      r17,0
> 	   8:	3a 40 00 00 	li      r18,0
> 	   c:	48 00 00 00 	b       c <.fixup+0xc>
> 				c: R_PPC_REL24	.text+0xbc
> 	  10:	38 a0 ff f2 	li      r5,-14
> 	  14:	3b e0 00 00 	li      r31,0
> 	  18:	39 c0 00 00 	li      r14,0
> 	  1c:	48 00 00 00 	b       1c <.fixup+0x1c>
> 				1c: R_PPC_REL24	.text+0x144
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602021825.otcItxGi-lkp@intel.com/
> Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
> I set Fixes: tag to the commit that recently replaced %1+1 by %L1 in the main part of the macro as the fix would be uncomplete otherwise but the problem has been there since commit 2df5e8bcca53 ("powerpc: merge uaccess.h")
> ---
>  arch/powerpc/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index ba1d878c3f404..570b3d91e2e40 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -255,7 +255,7 @@ __gus_failed:								\
>  		".section .fixup,\"ax\"\n"		\
>  		"4:	li %0,%3\n"			\
>  		"	li %1,0\n"			\
> -		"	li %1+1,0\n"			\
> +		"	li %L1,0\n"			\
>  		"	b 3b\n"				\
>  		".previous\n"				\
>  		EX_TABLE(1b, 4b)			\
> -- 
> 2.49.0
> 
