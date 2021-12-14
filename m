Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FE173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:43:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id k37so38970630lfv.3
        for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/WNtdOExba0UareLlKons7fVsJWCyGRdBiOkJewabLU=;
        b=qP9k2WtsLwhadv7Z98sXBcbuVgdLVZLF1yEoSBINi3s2x/zcZdiBiWTBshsR0ZCvHp
         sWf3vM7oxiubP1xPpjtywPgHffA5ufiabkRBoqEB8MAQHzYqxCuCSg2zOvnsFrvPQqaY
         yz1bSnDT9cBMlgT4wqhZ0CwoWxu1C11xIoXk1/KmX8xHN6hKV9RJ7i7VI2b3Of6PneW9
         5FiwZmfjQZvJ5aX2o/r1fV9SMdFFFBAZqJB/c7pk1yBSC85m69rttz0tbIgeCM9rGen4
         gwWRLYlf4F5c+AGEuxRNnNT5HNgHtZ3Mnjxz9JzmwtxrzR9PrNH8d7XMvIkvpIZJKWyB
         F/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/WNtdOExba0UareLlKons7fVsJWCyGRdBiOkJewabLU=;
        b=1tc8KHnO+9oywVAi/HZDykC9SsOWQrVJSgziFS/MsDa6Iwl3nYw9z0mT/QIUnBExrO
         cnKEcBhBdYxFoY0UdGnxOPAqRqr2FTGwEGTOhXaCpv4sxtdfO+4WdKlaOdcqGXb+TjTM
         5LqQnAhWMcWJhyfKjqcY579HpoqBoSGfdz0qAoO/FYh+SKFzYJIgye9B8sXigAQPHOfx
         W1y7+F+gipyqaN1XohDAFxoFO2BZ27LEiE/3l0ET/TPN+iFJESadixWEyHgHKT8HXq/C
         R18QwzgQ3GDr8kfBSKplJwvJ66VyLgdVyQ8r7CkxkGRtqBQbTc8lcVkylGq0oTvHAKgA
         WZTg==
X-Gm-Message-State: AOAM530flmemwRsFNJkhgtX2a1MnTyKW72D5XY19Z6mZjMk2Id1vqTbf
	bTz0gP87ILC1bwlR+bjY+UfhKIGdSYS9bZ2l7NJfKQ==
X-Google-Smtp-Source: ABdhPJynoNYKno0o5Fc6TQq4M/7CoCk7fH7s/cK99AIXq3P6Mr1V2cvRGwyXL+wfaPmWTd+SLmaQp7RNHm0IJSN51FY=
X-Received: by 2002:a05:6512:b1f:: with SMTP id w31mr6648969lfu.240.1639511019704;
 Tue, 14 Dec 2021 11:43:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213224914.1501303-1-paul@crapouillou.net> <20211213224914.1501303-3-paul@crapouillou.net>
In-Reply-To: <20211213224914.1501303-3-paul@crapouillou.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Dec 2021 11:43:28 -0800
Message-ID: <CAKwvOdm3x7pot9+DgujUrO795ip_nxd_LGtoAuePRzc=td90jQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: boot/compressed: Build without LTO
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nathan Chancellor <nathan@kernel.org>, list@opendingux.net, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 13, 2021 at 2:49 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> We need a valid ELF object for dummy.o, so that objcopy can insert the
> vmlinuz payload.
>
> Therefore, we must build the decompresser program without LTO, otherwise
> dummy.o will be LLVM bytecode instead of a ELF object file.

While the below may work and follows the pattern observed in
drivers/firmware/efi/libstub/Makefile
43:KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))

I can't help but wonder whether we should instead be doing something like:
arch/x86/power/Makefile
9:CFLAGS_REMOVE_cpu.o := $(CC_FLAGS_LTO)
scripts/mod/Makefile
3:CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
drivers/misc/lkdtm/Makefile
19:CFLAGS_REMOVE_rodata.o               += $(CC_FLAGS_LTO)

but for dummy.o?  ie.
CFLAGS_REMOVE_dummy.o += $(CC_FLAGS_LTO)

Can you please try that rather than disabling LTO for a large subset of files?

>
> Building the decompresser with LTO wouldn't make much sense anyway,
> unlike building the vmlinuz itself with LTO.

Why not? We do it for x86 and arm64 AFAICT.

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/compressed/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index 4c9ecfbb0ef4..2d01c50fb0b1 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -27,6 +27,9 @@ ifdef CONFIG_CPU_LOONGSON64
>  KBUILD_CFLAGS := $(filter-out -march=loongson3a, $(KBUILD_CFLAGS)) -march=mips64r2
>  endif
>
> +# Disable LTO
> +KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> +
>  KBUILD_CFLAGS := $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__ -D__DISABLE_EXPORTS \
>         -DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
>
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
