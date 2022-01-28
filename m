Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA629CA
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 19:10:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id u11so6936054plh.13
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 11:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qBrhGKhqGDo3ZZGcfTOvBOKxFA+ZreyYbNcf2efMXZM=;
        b=eCZT8ZHOAxpHWEDrUQItUG+sx9VZ3ivRTx1df1Hb5Ao4XU7bhUL0XL2KBld709fVmg
         IDG1SPPN7PGddHggtZ7UvMZKXPII86162snNhV14EycqAolc90+QaWRv3QLntN6Dm1Pl
         nUkCG8lpzib1yRSSeLP62nAkHwE+KizSFaUN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qBrhGKhqGDo3ZZGcfTOvBOKxFA+ZreyYbNcf2efMXZM=;
        b=QLLNvflkTjYuEiX8q03R3jDS0LqSiKlQX9y6439G9uaWKFJIVrQoZ4BnveXt1SArUW
         4jxn0tBTK31tMCa1TQTElMlFpPpoth0dhMhis51YgUWfXEW/LxKeDHvKc6lyzXVvm2V2
         uI5JOXpQoBY38yVInom9zZM4GD7UVSUldXXVt+RRoq1tqHdO4VxV4QUWiFVMxHSvMpsX
         SYcdaa2OvWr3UDUyUBOdim6MI5IxPxcIwHiKVEI7DqG3dshHaFLA0O0XG45c0NIbdRWG
         gyayGZ8GXLctYJN4ib9mo6eEdj40VrNI2c8RFIi4tz6oqnwkeEIKWzBtvEXBhNyXbNel
         ceiA==
X-Gm-Message-State: AOAM532lZHtmWoci3+OK9FJjJhPIBmw1Kw5NXuWMJXdakXIYH7Ss6D/0
	7eGOHRg7DXV46rmbeLmhgOCCow==
X-Google-Smtp-Source: ABdhPJwkfZT7H5g+ncTdGNx1L3u8QiZklleP3FKxab6bzRDhnivkR2Cau7R+nbnX7dJOZ7yw7amTDg==
X-Received: by 2002:a17:90a:5890:: with SMTP id j16mr11399493pji.185.1643397021641;
        Fri, 28 Jan 2022 11:10:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm3142742pju.2.2022.01.28.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 11:10:21 -0800 (PST)
Date: Fri, 28 Jan 2022 11:10:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] stack: Constrain stack offset randomization with
 Clang builds
Message-ID: <202201281058.83EC9565@keescook>
References: <20220128114446.740575-1-elver@google.com>
 <20220128114446.740575-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128114446.740575-2-elver@google.com>

On Fri, Jan 28, 2022 at 12:44:46PM +0100, Marco Elver wrote:
> All supported versions of Clang perform auto-init of __builtin_alloca()
> when stack auto-init is on (CONFIG_INIT_STACK_ALL_{ZERO,PATTERN}).
> 
> add_random_kstack_offset() uses __builtin_alloca() to add a stack
> offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
> enabled, add_random_kstack_offset() will auto-init that unused portion
> of the stack used to add an offset.
> 
> There are several problems with this:
> 
> 	1. These offsets can be as large as 1023 bytes. Performing
> 	   memset() on them isn't exactly cheap, and this is done on
> 	   every syscall entry.
> 
> 	2. Architectures adding add_random_kstack_offset() to syscall
> 	   entry implemented in C require them to be 'noinstr' (e.g. see
> 	   x86 and s390). The potential problem here is that a call to
> 	   memset may occur, which is not noinstr.
> 
> A x86_64 defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:
> 
>  | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
> 
> Clang 14 (unreleased) will introduce a way to skip alloca initialization
> via __builtin_alloca_uninitialized() (https://reviews.llvm.org/D115440).
> 
> Constrain RANDOMIZE_KSTACK_OFFSET to only be enabled if no stack
> auto-init is enabled, the compiler is GCC, or Clang is version 14+. Use
> __builtin_alloca_uninitialized() if the compiler provides it, as is done
> by Clang 14.
> 
> Link: https://lkml.kernel.org/r/YbHTKUjEejZCLyhX@elver.google.com
> Fixes: 39218ff4c625 ("stack: Optionally randomize kernel stack offset each syscall")
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/Kconfig                     |  1 +
>  include/linux/randomize_kstack.h | 14 ++++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 2cde48d9b77c..c5b50bfe31c1 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1163,6 +1163,7 @@ config RANDOMIZE_KSTACK_OFFSET
>  	bool "Support for randomizing kernel stack offset on syscall entry" if EXPERT
>  	default y
>  	depends on HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> +	depends on INIT_STACK_NONE || !CC_IS_CLANG || CLANG_VERSION >= 140000

This makes it _unavailable_ for folks with Clang < 14, which seems
too strong, especially since it's run-time off by default. I'd prefer
dropping this hunk and adding some language to the _DEFAULT help noting
the specific performance impact on Clang < 14.

>  	help
>  	  The kernel stack offset can be randomized (after pt_regs) by
>  	  roughly 5 bits of entropy, frustrating memory corruption
> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> index 91f1b990a3c3..5c711d73ed10 100644
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -17,8 +17,18 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * alignment. Also, since this use is being explicitly masked to a max of
>   * 10 bits, stack-clash style attacks are unlikely. For more details see
>   * "VLAs" in Documentation/process/deprecated.rst
> + *
> + * The normal alloca() can be initialized with INIT_STACK_ALL. Initializing the
> + * unused area on each syscall entry is expensive, and generating an implicit
> + * call to memset() may also be problematic (such as in noinstr functions).
> + * Therefore, if the compiler provides it, use the "uninitialized" variant.

Can you include the note that GCC doesn't initialize its alloca()?

Otherwise, yeah, looks good to me.

-Kees

>   */
> -void *__builtin_alloca(size_t size);
> +#if __has_builtin(__builtin_alloca_uninitialized)
> +#define __kstack_alloca __builtin_alloca_uninitialized
> +#else
> +#define __kstack_alloca __builtin_alloca
> +#endif
> +
>  /*
>   * Use, at most, 10 bits of entropy. We explicitly cap this to keep the
>   * "VLA" from being unbounded (see above). 10 bits leaves enough room for
> @@ -37,7 +47,7 @@ void *__builtin_alloca(size_t size);
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
>  		u32 offset = raw_cpu_read(kstack_offset);		\
> -		u8 *ptr = __builtin_alloca(KSTACK_OFFSET_MAX(offset));	\
> +		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
>  		/* Keep allocation even after "ptr" loses scope. */	\
>  		asm volatile("" :: "r"(ptr) : "memory");		\
>  	}								\
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 

-- 
Kees Cook
