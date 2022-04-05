Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1E67A
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 16:23:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB32C23A;
	Tue,  5 Apr 2022 09:23:18 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.8.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B3C23F718;
	Tue,  5 Apr 2022 09:23:16 -0700 (PDT)
Date: Tue, 5 Apr 2022 17:23:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: Drop the inline assembly implementation of
 function_nocfi
Message-ID: <Ykxs8YmNBtst8DM5@FVFF77S0Q05N>
References: <20220401201916.1487500-1-samitolvanen@google.com>
 <20220401201916.1487500-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401201916.1487500-4-samitolvanen@google.com>

On Fri, Apr 01, 2022 at 01:19:16PM -0700, Sami Tolvanen wrote:
> Drop the inline assembly version of function_nocfi() now that
> CONFIG_CFI_CLANG depends on __builtin_function_start(), which allows
> this macro to be implemented more cleanly and in a way that works also
> with static initializers.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/arm64/include/asm/compiler.h | 16 ----------------
>  1 file changed, 16 deletions(-)

It's very nice to see the asm go here!

I grabbed the LLVM 14.0.0 binary release from llvm.org and gave this a spin. I
tested with ThinLTO and CFI_CLANG, and verified that CPU hotplug and ftrace
worked as expected (given those rely on function_nocfi()), and that the LKDTM
CFI_FORWARD_PROTO caught the mismatched prototype as expected.

FWIW:

Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com>

As noted on patch 2 I think we should squash the series together, but those
tags apply either way.

Thanks,
Mark.

> 
> diff --git a/arch/arm64/include/asm/compiler.h b/arch/arm64/include/asm/compiler.h
> index dc3ea4080e2e..6fb2e6bcc392 100644
> --- a/arch/arm64/include/asm/compiler.h
> +++ b/arch/arm64/include/asm/compiler.h
> @@ -23,20 +23,4 @@
>  #define __builtin_return_address(val)					\
>  	(void *)(ptrauth_clear_pac((unsigned long)__builtin_return_address(val)))
>  
> -#ifdef CONFIG_CFI_CLANG
> -/*
> - * With CONFIG_CFI_CLANG, the compiler replaces function address
> - * references with the address of the function's CFI jump table
> - * entry. The function_nocfi macro always returns the address of the
> - * actual function instead.
> - */
> -#define function_nocfi(x) ({						\
> -	void *addr;							\
> -	asm("adrp %0, " __stringify(x) "\n\t"				\
> -	    "add  %0, %0, :lo12:" __stringify(x)			\
> -	    : "=r" (addr));						\
> -	addr;								\
> -})
> -#endif
> -
>  #endif /* __ASM_COMPILER_H */
> -- 
> 2.35.0
> 
