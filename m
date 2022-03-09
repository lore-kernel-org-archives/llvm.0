Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E335107
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 18:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9305C340E8;
	Wed,  9 Mar 2022 18:45:17 +0000 (UTC)
Date: Wed, 9 Mar 2022 18:45:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kernel-team@android.com, James Morse <james.morse@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] arm64: Paper over ARM_SMCCC_ARCH_WORKAROUND_3 Clang issue
Message-ID: <Yij1uUwvnsxjbvR+@arm.com>
References: <20220309155716.3988480-1-maz@kernel.org>
 <YijftpaApSJWuZ3m@dev-arch.thelio-3990X>
 <Yijo7Nmt3AiP1uLH@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yijo7Nmt3AiP1uLH@dev-arch.thelio-3990X>

On Wed, Mar 09, 2022 at 10:50:36AM -0700, Nathan Chancellor wrote:
> This diff seems like a somewhat proper solution, as __READ_ONCE() cannot
> be used in assembly, but I am open to other suggestions.
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 1bce62fa908a..56f7b1d4d54b 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -5,7 +5,7 @@
>  #ifndef __ASM_RWONCE_H
>  #define __ASM_RWONCE_H
>  
> -#ifdef CONFIG_LTO
> +#if defined(CONFIG_LTO) && !defined(__ASSEMBLY__)
>  
>  #include <linux/compiler_types.h>
>  #include <asm/alternative-macros.h>
> @@ -66,7 +66,7 @@
>  })
>  
>  #endif	/* !BUILD_VDSO */
> -#endif	/* CONFIG_LTO */
> +#endif	/* CONFIG_LTO && !__ASSEMBLY__ */

Thanks Nathan. Would you please send a proper patch for this? I'd go
with your proposal as it seems more related to LTO than Marc's patch ;).

-- 
Catalin
