Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B62F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 22:02:57 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id a191so10710590pge.2
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zzwdQrYIZGbhuKxn6txtvucH/uZdk818++RBQ6GUaIw=;
        b=PxaWEdjbiW3JJXRUQ37LWZGFGOX28YHe5IpymM9E99ZFyLMgSvUA3NBHsZObvhXgFf
         2rSt5fPeIJL4ESJKx0qQpcgg/M9mCP/rqQ0EpVAzLrP45fXGzYzDvoJcilx+iH6k2PKL
         O9RY0oKUBzUCas2uurOWQcA3eKgqRAdDanq50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zzwdQrYIZGbhuKxn6txtvucH/uZdk818++RBQ6GUaIw=;
        b=kr+w2wMb0Z6tTy+dQ8nS+GWH+2f81CSYUEzAO4dfHNF+i/BL7Pfon7UiFGVJuBOBPA
         xkSyT3QS6bUIoi1+G+RKGSexP0HgeRh/YHINfk6VSY10rQcD9F09Rk+2pLRJWN5nqBsm
         mufBKnbPTcoD30Th5kHVQA8Xk0jJE19BHs25Vrf6MIx1ibg7FenNK6RaEvJIH2HKx1Zi
         alScywO599trMZwECsYfvOr8yt3bnoKtkr5StzkYmvO1jNbaQXspco0vvDFOfF9+bGBo
         9l1/jhHRUeCNSqzhDLXh008hnXrvwaESMKbXxGNCjT9xRejyU8s6m0vS1quI+s8rirZj
         Yf1g==
X-Gm-Message-State: AOAM5321Lz/DX+P5C65bBLfWXLX9o13bMKN/0WFJqBs282b+N0/z/hwt
	s1eNt4yvSNwhViIbpqGih5ddbA==
X-Google-Smtp-Source: ABdhPJyVRydg9q5jS2e39x/pb7g7MLyUIeUrS1+CgeSiKUxdoQuQFP8o17cuLiwbXArXOMToLiZy9A==
X-Received: by 2002:a63:561c:0:b0:3c1:42fb:cd81 with SMTP id k28-20020a63561c000000b003c142fbcd81mr9701649pgb.104.1652565777327;
        Sat, 14 May 2022 15:02:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p25-20020a62b819000000b0050dc7628182sm4169865pfe.92.2022.05.14.15.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 15:02:57 -0700 (PDT)
Date: Sat, 14 May 2022 15:02:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
Message-ID: <202205141501.92A22264B4@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220513202159.1550547-21-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:58PM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler injects a type preamble
> immediately before each function and a check to validate the target
> function type before indirect calls:
> 
>   ; type preamble
>   __cfi_function:
>     int3
>     int3
>     mov <id>, %eax
>     int3
>     int3
>   function:
>     ...
>   ; indirect call check
>     cmpl    <id>, -6(%r11)
>     je      .Ltmp1
>     ud2
>   .Ltmp1:
>     call    __x86_indirect_thunk_r11
> 
> Define the __CFI_TYPE helper macro for manual type annotations in
> assembly code, add error handling for the CFI ud2 traps, and allow
> CONFIG_CFI_CLANG to be selected on x86_64.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/x86/Kconfig               |  2 ++
>  arch/x86/include/asm/linkage.h | 12 +++++++
>  arch/x86/kernel/traps.c        | 60 +++++++++++++++++++++++++++++++++-
>  3 files changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 4bed3abf444d..2e73d0792d48 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -108,6 +108,8 @@ config X86
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if X86_64
>  	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
>  	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
> +	select ARCH_SUPPORTS_CFI_CLANG		if X86_64
> +	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI_CLANG
>  	select ARCH_SUPPORTS_LTO_CLANG
>  	select ARCH_SUPPORTS_LTO_CLANG_THIN
>  	select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.h
> index 85865f1645bd..0ee4a0af3974 100644
> --- a/arch/x86/include/asm/linkage.h
> +++ b/arch/x86/include/asm/linkage.h
> @@ -25,6 +25,18 @@
>  #define RET	ret
>  #endif
>  
> +#ifdef CONFIG_CFI_CLANG
> +#define __CFI_TYPE(name)					\
> +	.fill 7, 1, 0xCC ASM_NL					\
> +	SYM_START(__cfi_##name, SYM_L_LOCAL, SYM_A_NONE)	\
> +	int3 ASM_NL						\
> +	int3 ASM_NL						\
> +	mov __kcfi_typeid_##name, %eax ASM_NL			\
> +	int3 ASM_NL						\
> +	int3 ASM_NL						\
> +	SYM_FUNC_END(__cfi_##name)
> +#endif
> +
>  #else /* __ASSEMBLY__ */
>  
>  #ifdef CONFIG_SLS
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 1563fb995005..320e257eb4be 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -40,6 +40,7 @@
>  #include <linux/hardirq.h>
>  #include <linux/atomic.h>
>  #include <linux/ioasid.h>
> +#include <linux/cfi.h>
>  
>  #include <asm/stacktrace.h>
>  #include <asm/processor.h>
> @@ -295,6 +296,62 @@ static inline void handle_invalid_op(struct pt_regs *regs)
>  		      ILL_ILLOPN, error_get_trap_addr(regs));
>  }
>  
> +#ifdef CONFIG_CFI_CLANG
> +static void decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
> +			    unsigned long *type)
> +{
> +	char buffer[MAX_INSN_SIZE];
> +	struct insn insn;
> +	int offset;
> +
> +	*target = *type = 0;

Should report_cfi_failure() have some additional hinting for the case
where target/type are zero? Like, "hey, got an inexplicable CFI failure
here, but preamble decode failed. Yikes!"

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
