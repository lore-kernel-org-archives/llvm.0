Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBC2CA8
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 20:31:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id z19so15715939lfq.13
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+d4eE8vTSmnTfcsF06A9ijaErxq3MGUA0JFQlf6Ufdo=;
        b=iGTTMnQUe6uCwdHf5Y3Mp1+38vh4KuCC/+c8hZNfhXimk0D0Ayh2BU70jO35jFEpcK
         cOCeEvEQ/Iraq9AGogYQpDBg9mbz93t+A86PMxJjW/CWDucXsgesD2+Tv37M9X6yB42r
         oPQ/Wbltm6WTxGzZ4T8pnqtIReASplBaKYxk/kaH4hF4UeEYZN0/G79oE7sRD7//rrfd
         ixrXNgbKQmnOKvkmf+amiE4RxQeQY1LgUmnSGznOHsOKgzquLg03V1MyNBpe0Z1F4JSV
         m1ayHjlKDHflrMB6jVZ4FApQ7CpB0So9LjO8/+TwRhvQMe0SPR61YdGgKWXFBpXOWlrD
         hkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+d4eE8vTSmnTfcsF06A9ijaErxq3MGUA0JFQlf6Ufdo=;
        b=w2h0/ZOMRpS//tVS5AYm5lkjlWVmZuPijTX2luedlRZQm9jD06OSjkrT7V36WiOiMw
         PK06XoW/dPaU7fFTBxmj1LoM3KkEP3d8nYo/yjDvLJwzANDNysGBY8iT7DdODiy1ltmh
         FE6W/6MNn+1/2g55ZNjmTsFjffOMoII+S9dYweFaLVqnDefCEc69omAiWEFHaatZ5Wg4
         xtK+YuboHufapwZWdAsk8ZeAr6MDIBFbmOJsmvch47wbno7OJppz4QGUW5SEHPOB2JTu
         vBKzU5ie5dpK/J2+4NkEHw/tbVltvGjrxx2aPlH4PiC3VisKFT8lFZFnq112I4BcBhd3
         gqeA==
X-Gm-Message-State: AOAM532yyz50k1geFfVfMhPwrJSfU7H0EzK79XdxE0XD8kM22nZWzT7R
	WwlkWImoGMlDhcqXiV/SncFRIjTpQt7Motxpt72bUg==
X-Google-Smtp-Source: ABdhPJwKfa6Ns5aNibD/NX7BlH7zp+cXMKbhPhjC0LcBq64TG0tqzj8/gnpWVJ+3dgyOXXYYuTSKDsNwY9wFloSu3bk=
X-Received: by 2002:a05:6512:308d:: with SMTP id z13mr13958467lfd.523.1643056303222;
 Mon, 24 Jan 2022 12:31:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220120214001.1879469-1-nathan@kernel.org>
In-Reply-To: <20220120214001.1879469-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jan 2022 12:31:31 -0800
Message-ID: <CAKwvOd=4QBW5uFLM7zbHfG+5499tT_zqBTaZQgzqegmuq_5+MQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson64: Clean up use of cc-ifversion
To: Nathan Chancellor <nathan@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 20, 2022 at 1:40 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This Makefile checks that GCC is 4.9 or newer, which is redundant after
> commit 76ae847497bc ("Documentation: raise minimum supported version of
> GCC to 5.1"), so cc-option can be removed.
>
> Clang does not support -march=loongson3a so it needs to continue to use
> -march=mips64r2, along with binutils less than 2.25, so check that both
> GCC and binutils 2.25 or newer are being used before using
> -march=loongson3a. These flags do not need to be checked with cc-option
> anymore because all GCC versions support -march=loongson3a and
> -march=mips64r2 and all clang versions support -march=mips64r2.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch. I wonder why `_MIPS_ISA` only seems to be set at
all for `-march=loongson3a` AFAICT, though that question is orthogonal
to this patch. Perhaps the Loongson or MIPS maintainers know more?
Otherwise seems like most uses of _MIPS_ISA can either be deleted or
simplified now.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/loongson64/Platform | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
> index 3e660d6d3c2b..981d3abc150e 100644
> --- a/arch/mips/loongson64/Platform
> +++ b/arch/mips/loongson64/Platform
> @@ -12,17 +12,10 @@ cflags-$(CONFIG_CPU_LOONGSON64)     += -Wa,--trap
>  # by GAS.  The cc-option can't probe for this behaviour so -march=loongson3a
>  # can't easily be used safely within the kbuild framework.
>  #
> -ifeq ($(call cc-ifversion, -ge, 0409, y), y)
> -  ifeq ($(call ld-ifversion, -ge, 22500, y), y)
> -    cflags-$(CONFIG_CPU_LOONGSON64)  += \
> -      $(call cc-option,-march=loongson3a -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
> -  else
> -    cflags-$(CONFIG_CPU_LOONGSON64)  += \
> -      $(call cc-option,-march=mips64r2,-mips64r2 -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
> -  endif
> +ifeq ($(CONFIG_CC_IS_GCC)$(call ld-ifversion, -ge, 22500, y), yy)
> +  cflags-$(CONFIG_CPU_LOONGSON64) += -march=loongson3a -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64
>  else
> -    cflags-$(CONFIG_CPU_LOONGSON64)  += \
> -      $(call cc-option,-march=mips64r2,-mips64r2 -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
> +  cflags-$(CONFIG_CPU_LOONGSON64) += -march=mips64r2
>  endif
>
>  # Some -march= flags enable MMI instructions, and GCC complains about that
>
> base-commit: 2c271fe77d52a0555161926c232cd5bc07178b39
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
