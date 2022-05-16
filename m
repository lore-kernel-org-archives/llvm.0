Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5E138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:16:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id d15so28006417lfk.5
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=taU/hUD3/ufte0tfHzaIWkxvcj/kb00DlM0cTL8DYc4=;
        b=fao8W61kROCoLN34/0UJx0LWczKrPvRvLoArxOnmD9RwpXvw3LmYXvkU+xHkR20Sgk
         /WoJ7kt2pdd7nsK0/bOL1gDMjgw5i3wBqxw1+o/jQzaiUQlEEuuUk4ar9/K0eek9nhXs
         Albvvo3nWSyTiq/MZcu9m1b92MthaAmcaVdx7yX7EQF8ccUwIJdev6AjYwr+bVZXNFxl
         9jqYQHmDTlQowYarspQNab/i/8YHQUX3Gb7EowCmossdJ7LB/wrixlVn5Xf9vromb/ax
         TeeCC0ilNDRcAy4YmSjEs2WH/Q6KeYetwr0M0GQPVfwka5jpKQTp5fmLFVTcBJUonzZ3
         gudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=taU/hUD3/ufte0tfHzaIWkxvcj/kb00DlM0cTL8DYc4=;
        b=iTdCJYblyBKyYNKAG99d1uSiDbDb0JY4Don/MEYwzWTrsOaBSrud/PCYljl3eTAJJY
         JIqSb5pqvOWVuJ343GQS5mBM13AakVMvbHrkzAbMDhFjasbOqBuClIeQ32k8q1tXIZZL
         n2t+IV3vPVE3oIEr3jiMh8aSpLz2Fo6GH3o20a2uxfmG5jl3PSLmD8biYNGH0ACBJ9hw
         Cr7TAsjW7t3dfNov7flCgcL6io30HgLnmEj2ToyrJeGT49szHNm5VAucIlL6hk7jq0RL
         pjeSqaubBSbyg49eUsMETbAnkexQeUAtUKNhqp2PU4w2mj6TGmoqXpuJtWcsdizEicgc
         gRsg==
X-Gm-Message-State: AOAM530LowlDN/0n28bOc7DTAyaCyIpHZcaOnjqOIL6ARBcX+fawj1T3
	atwitoo/VcOudBbIHF5gy4Tkvxelx+zyecUUtFFsCg==
X-Google-Smtp-Source: ABdhPJxzuIyFcE4yC2OeJUE7+9uBTrXFez9RQNxTW9YYpUW/UXkXVdoy62EWMSr8jnbsGql2e47IkuPCWRjGOzCgLNs=
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id
 b6-20020ac25e86000000b00473d04460f5mr14284864lfq.87.1652735787367; Mon, 16
 May 2022 14:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220516210954.1660716-1-ndesaulniers@google.com> <20220516210954.1660716-5-ndesaulniers@google.com>
In-Reply-To: <20220516210954.1660716-5-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 May 2022 14:16:16 -0700
Message-ID: <CAKwvOd=Fmb5NTFPuc8EhELoysj9zz0pthccOUmTvx_G6zdUB7g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: pass -march= only to compiler
To: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+ Ard (I messed up my command line invocation of git send-email, sorry
for more noise)
https://lore.kernel.org/llvm/20220516210954.1660716-1-ndesaulniers@google.com/

On Mon, May 16, 2022 at 2:10 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> When both -march= and -Wa,-march= are specified for assembler or
> assembler-with-cpp sources, GCC and Clang will prefer the -Wa,-march=
> value but Clang will warn that -march= is unused.
>
> warning: argument unused during compilation: '-march=armv6k'
> [-Wunused-command-line-argument]
>
> This is the top group of warnings we observe when using clang to
> assemble the kernel via `ARCH=arm make LLVM=1`.
>
> Split the arch-y make variable into two, so that -march= flags only get
> passed to the compiler, not the assembler. -D flags are added to
> KBUILD_CPPFLAGS which is used for both C and assembler-with-cpp sources.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1315
> Link: https://github.com/ClangBuiltLinux/linux/issues/1587
> Link: https://lore.kernel.org/llvm/628249e8.1c69fb81.d20fd.02ea@mx.google.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/Makefile | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 1029c2503aef..47a300f6f99c 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -57,21 +57,34 @@ endif
>  KBUILD_CFLAGS  += $(call cc-option,-fno-ipa-sra)
>
>  # This selects which instruction set is used.
> +arch-$(CONFIG_CPU_32v7M)       :=-march=armv7-m
> +arch-$(CONFIG_CPU_32v7)                :=-march=armv7-a
> +arch-$(CONFIG_CPU_32v6)                :=-march=armv6
> +# Only override the compiler option if ARMv6. The ARMv6K extensions are
> +# always available in ARMv7
> +ifeq ($(CONFIG_CPU_32v6),y)
> +arch-$(CONFIG_CPU_32v6K)       :=-march=armv6k
> +endif
> +arch-$(CONFIG_CPU_32v5)                :=-march=armv5te
> +arch-$(CONFIG_CPU_32v4T)       :=-march=armv4t
> +arch-$(CONFIG_CPU_32v4)                :=-march=armv4
> +arch-$(CONFIG_CPU_32v3)                :=-march=armv3m
> +
>  # Note that GCC does not numerically define an architecture version
>  # macro, but instead defines a whole series of macros which makes
>  # testing for a specific architecture or later rather impossible.
> -arch-$(CONFIG_CPU_32v7M)       :=-D__LINUX_ARM_ARCH__=7 -march=armv7-m
> -arch-$(CONFIG_CPU_32v7)                :=-D__LINUX_ARM_ARCH__=7 -march=armv7-a
> -arch-$(CONFIG_CPU_32v6)                :=-D__LINUX_ARM_ARCH__=6 -march=armv6
> -# Only override the compiler opt:ion if ARMv6. The ARMv6K extensions are
> +cpp-$(CONFIG_CPU_32v7M)                :=-D__LINUX_ARM_ARCH__=7
> +cpp-$(CONFIG_CPU_32v7)         :=-D__LINUX_ARM_ARCH__=7
> +cpp-$(CONFIG_CPU_32v6)         :=-D__LINUX_ARM_ARCH__=6
> +# Only override the compiler option if ARMv6. The ARMv6K extensions are
>  # always available in ARMv7
>  ifeq ($(CONFIG_CPU_32v6),y)
> -arch-$(CONFIG_CPU_32v6K)       :=-D__LINUX_ARM_ARCH__=6 -march=armv6k
> +cpp-$(CONFIG_CPU_32v6K)                :=-D__LINUX_ARM_ARCH__=6
>  endif
> -arch-$(CONFIG_CPU_32v5)                :=-D__LINUX_ARM_ARCH__=5 -march=armv5te
> -arch-$(CONFIG_CPU_32v4T)       :=-D__LINUX_ARM_ARCH__=4 -march=armv4t
> -arch-$(CONFIG_CPU_32v4)                :=-D__LINUX_ARM_ARCH__=4 -march=armv4
> -arch-$(CONFIG_CPU_32v3)                :=-D__LINUX_ARM_ARCH__=3 -march=armv3m
> +cpp-$(CONFIG_CPU_32v5)         :=-D__LINUX_ARM_ARCH__=5
> +cpp-$(CONFIG_CPU_32v4T)                :=-D__LINUX_ARM_ARCH__=4
> +cpp-$(CONFIG_CPU_32v4)         :=-D__LINUX_ARM_ARCH__=4
> +cpp-$(CONFIG_CPU_32v3)         :=-D__LINUX_ARM_ARCH__=3
>
>  # This selects how we optimise for the processor.
>  tune-$(CONFIG_CPU_ARM7TDMI)    :=-mtune=arm7tdmi
> @@ -123,8 +136,9 @@ AFLAGS_ISA  :=$(CFLAGS_ISA)
>  endif
>
>  # Need -Uarm for gcc < 3.x
> +KBUILD_CPPFLAGS        +=$(cpp-y)
>  KBUILD_CFLAGS  +=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
> -KBUILD_AFLAGS  +=$(CFLAGS_ABI) $(AFLAGS_ISA) $(arch-y) $(tune-y) -include asm/unified.h -msoft-float
> +KBUILD_AFLAGS  +=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
>
>  CHECKFLAGS     += -D__arm__
>
> --
> 2.36.0.550.gb090851708-goog
>


-- 
Thanks,
~Nick Desaulniers
