Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9D138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:15:30 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 16so19598347lju.13
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UFmqTLgXbpwczKLduq38plLQ/lr1F/TDBh8Um5vXqc=;
        b=T1jQobclTkKYDgkSunmYEk3nEUB51TTo++yg5EY8pb49+10Wic0i/7MuHzA/C/SoMX
         RJVPoxTGvaIbpuagafGcHTx56zin7buxpmjWTQlD9biskxGrmqwc19Lsq6YQFOuotZED
         31m/3vXsGTQ+rbrmut52Z9OxlpDFp40iyKdtbTo7mG1Mjj1zNjYkR50468bp/XUa2fI+
         ccCh1XYyZ5lmk012tWRcrtgyYCFFR4pIjNgoZEEjz8HEObelcHdM1x5xeQfNVbHFm69J
         zw+42P8cF8SpXqnA3mK3Di+uuUKCPt8vrSoVhKkBgjaVs0Nt4kLDAMprIAnUOI1+ySa5
         CNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UFmqTLgXbpwczKLduq38plLQ/lr1F/TDBh8Um5vXqc=;
        b=PvW/oPbFTQ4ogwsMBQqpXxUz+SOLCV2dVLylDXrlTtVbomw6+xkQ4T04sOqD3/i15S
         CkKLfY94I7GScw4lRyZt7JNS3dOAfYcuHNnu4FlSs5sKGTxjIIHrTXlAs/E4YDkp/4nH
         wPO0CfnQX32Fz86C8rGComjcPdoiWube4C3svncGVjQQJa352QJoLEdhbMtwWkUiTRnT
         9525Yc66BrrN5DXvQvsyKBzx9WGJOJ4DQtKWecNpmYhE6NLktPKyNGBWisa4eP6LklSC
         c9pFrtw/5VGh90D0PRbRKVxIKDiWdJP6IQduyzbpjCXK3jE6kGVC3i10yQFZKj6eZ7VW
         I7XA==
X-Gm-Message-State: AOAM530wiDaMHqluHbHKa9jxpWXXvOBxaOpVTfnvVGexATdfvQe1g8hH
	69AQb2ea5Wu/viAq/7dyFz2dz9xkoY4tgkPTfX2MNw==
X-Google-Smtp-Source: ABdhPJwm7F6X+9wpW0K3DncDBuAm7g8hl5NtdF6Kl9htkJ4pkvaiH7FiVDJt5swiCxD7xV3JVddGLoXuenJ9BNZrK3A=
X-Received: by 2002:a2e:aa8e:0:b0:251:f929:3e7d with SMTP id
 bj14-20020a2eaa8e000000b00251f9293e7dmr12029409ljb.352.1652735728750; Mon, 16
 May 2022 14:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220516210954.1660716-1-ndesaulniers@google.com> <20220516210954.1660716-2-ndesaulniers@google.com>
In-Reply-To: <20220516210954.1660716-2-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 May 2022 14:15:17 -0700
Message-ID: <CAKwvOd=UX8FXJzAZ_KYiaCMYiuwz3TQa04_Fj4FC8+QWkXBVpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ARM: remove lazy evaluation in Makefile
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
> arch-y and tune-y used lazy evaluation since they used to contain
> cc-option checks. They don't any longer, so just eagerly evaluate these
> command line flags.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/arm/Makefile | 60 +++++++++++++++++++++--------------------------
>  1 file changed, 27 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index a2391b8de5a5..99a7ed7e9f09 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -60,44 +60,38 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-ipa-sra)
>  # Note that GCC does not numerically define an architecture version
>  # macro, but instead defines a whole series of macros which makes
>  # testing for a specific architecture or later rather impossible.
> -arch-$(CONFIG_CPU_32v7M)       =-D__LINUX_ARM_ARCH__=7 -march=armv7-m
> -arch-$(CONFIG_CPU_32v7)                =-D__LINUX_ARM_ARCH__=7 -march=armv7-a
> -arch-$(CONFIG_CPU_32v6)                =-D__LINUX_ARM_ARCH__=6 -march=armv6
> -# Only override the compiler option if ARMv6. The ARMv6K extensions are
> +arch-$(CONFIG_CPU_32v7M)       :=-D__LINUX_ARM_ARCH__=7 -march=armv7-m
> +arch-$(CONFIG_CPU_32v7)                :=-D__LINUX_ARM_ARCH__=7 -march=armv7-a
> +arch-$(CONFIG_CPU_32v6)                :=-D__LINUX_ARM_ARCH__=6 -march=armv6
> +# Only override the compiler opt:ion if ARMv6. The ARMv6K extensions are
>  # always available in ARMv7
>  ifeq ($(CONFIG_CPU_32v6),y)
> -arch-$(CONFIG_CPU_32v6K)       =-D__LINUX_ARM_ARCH__=6 -march=armv6k
> +arch-$(CONFIG_CPU_32v6K)       :=-D__LINUX_ARM_ARCH__=6 -march=armv6k
>  endif
> -arch-$(CONFIG_CPU_32v5)                =-D__LINUX_ARM_ARCH__=5 -march=armv5te
> -arch-$(CONFIG_CPU_32v4T)       =-D__LINUX_ARM_ARCH__=4 -march=armv4t
> -arch-$(CONFIG_CPU_32v4)                =-D__LINUX_ARM_ARCH__=4 -march=armv4
> -arch-$(CONFIG_CPU_32v3)                =-D__LINUX_ARM_ARCH__=3 -march=armv3m
> -
> -# Evaluate arch cc-option calls now
> -arch-y := $(arch-y)
> +arch-$(CONFIG_CPU_32v5)                :=-D__LINUX_ARM_ARCH__=5 -march=armv5te
> +arch-$(CONFIG_CPU_32v4T)       :=-D__LINUX_ARM_ARCH__=4 -march=armv4t
> +arch-$(CONFIG_CPU_32v4)                :=-D__LINUX_ARM_ARCH__=4 -march=armv4
> +arch-$(CONFIG_CPU_32v3)                :=-D__LINUX_ARM_ARCH__=3 -march=armv3m
>
>  # This selects how we optimise for the processor.
> -tune-$(CONFIG_CPU_ARM7TDMI)    =-mtune=arm7tdmi
> -tune-$(CONFIG_CPU_ARM720T)     =-mtune=arm7tdmi
> -tune-$(CONFIG_CPU_ARM740T)     =-mtune=arm7tdmi
> -tune-$(CONFIG_CPU_ARM9TDMI)    =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_ARM940T)     =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_ARM946E)     =-mtune=arm9e
> -tune-$(CONFIG_CPU_ARM920T)     =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_ARM922T)     =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_ARM925T)     =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_ARM926T)     =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_FA526)       =-mtune=arm9tdmi
> -tune-$(CONFIG_CPU_SA110)       =-mtune=strongarm110
> -tune-$(CONFIG_CPU_SA1100)      =-mtune=strongarm1100
> -tune-$(CONFIG_CPU_XSCALE)      =-mtune=xscale
> -tune-$(CONFIG_CPU_XSC3)                =-mtune=xscale
> -tune-$(CONFIG_CPU_FEROCEON)    =-mtune=xscale
> -tune-$(CONFIG_CPU_V6)          =-mtune=arm1136j-s
> -tune-$(CONFIG_CPU_V6K)         =-mtune=arm1136j-s
> -
> -# Evaluate tune cc-option calls now
> -tune-y := $(tune-y)
> +tune-$(CONFIG_CPU_ARM7TDMI)    :=-mtune=arm7tdmi
> +tune-$(CONFIG_CPU_ARM720T)     :=-mtune=arm7tdmi
> +tune-$(CONFIG_CPU_ARM740T)     :=-mtune=arm7tdmi
> +tune-$(CONFIG_CPU_ARM9TDMI)    :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_ARM940T)     :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_ARM946E)     :=-mtune=arm9e
> +tune-$(CONFIG_CPU_ARM920T)     :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_ARM922T)     :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_ARM925T)     :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_ARM926T)     :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_FA526)       :=-mtune=arm9tdmi
> +tune-$(CONFIG_CPU_SA110)       :=-mtune=strongarm110
> +tune-$(CONFIG_CPU_SA1100)      :=-mtune=strongarm1100
> +tune-$(CONFIG_CPU_XSCALE)      :=-mtune=xscale
> +tune-$(CONFIG_CPU_XSC3)                :=-mtune=xscale
> +tune-$(CONFIG_CPU_FEROCEON)    :=-mtune=xscale
> +tune-$(CONFIG_CPU_V6)          :=-mtune=arm1136j-s
> +tune-$(CONFIG_CPU_V6K)         :=-mtune=arm1136j-s
>
>  ifeq ($(CONFIG_AEABI),y)
>  CFLAGS_ABI     :=-mabi=aapcs-linux -mfpu=vfp
> --
> 2.36.0.550.gb090851708-goog
>


-- 
Thanks,
~Nick Desaulniers
