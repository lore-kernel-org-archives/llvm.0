Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F62CA7
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 20:41:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id o12so9028718lfg.12
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 12:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LJGjDTYMuLmHfQpWatQs3kMJ9qbd2ha/UHX5cFngus=;
        b=mvCHYThbHbgCT4TsM9CfI+ZrMCLe2++pHQhdwPeI8vb/8sEb8D65Iom2uXnznuVmVS
         +nGb5Ow23gtXLzerVRkV3f3Uw+Z6842cwIsDw+5dB7yqFKE3AjaTZwN1OxOvhrrjaDh2
         75UtaMM4hS2p9EATTlFqNg0mtAUeJig69pu4EtGEQtcCKDwuG+KfNOM4L3+EXZwrdQ7j
         TaqH65KfdgS3yLgVjAMhReY9jxu4RJWojw24J+Cl2+1KPAHeQ2TmTq2dOeVhSHk7T0DQ
         ikZdyLW3rbZhcNdw2hBGpnM2eaid1iX33aaQTP+GjCBH5HwNygxtlrFmGpLuLQXIMqWG
         Hmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LJGjDTYMuLmHfQpWatQs3kMJ9qbd2ha/UHX5cFngus=;
        b=0Fpry/xZiPIOguHSSkQ2W0mwHXtIh7EYUo02zBRpQlbCqVt8EapmbsnISeZt0wMzOx
         SF/EKihc1qVz00cW8sbM8uK7Z9KCoZhJQp2eUmcBEX/3ANRQA+g4CNggaHGeJmFYMZny
         lji3TNluJVF/Tr7bumY+reSrXRw+zc/VICPbjhSwcdokmBXLtuixdbJ75F5Jc94lAcoX
         T6r8GCGXxfOnVUqAShPtOt7W+KgAbnRr2z7iYsHieneqh4VDoGvlOPgxgI1RIDN4fDPP
         Ym0aP8CYCjJ7qznqOwl8mwL1CTOak02Zx3ZXlCYTqr5DwpOsIovLwUrB4xnsf4toJj+4
         xm9A==
X-Gm-Message-State: AOAM533pU47pa06tkaoknqQTmYyehDPi1Ps1eKdLMreDVRQbVFbPvjPy
	SxewZwRdbkOWW83rUFVOI16k9gXrCZWvshw6/MCXBQ==
X-Google-Smtp-Source: ABdhPJw5wfq7L+SJLcrq8u2A8nE43CCiP3/gypswmbsopPtzGSfHfId+dsvXuFq4G0FIe+wlsrViT3Ke+xM97hf2HYg=
X-Received: by 2002:a05:6512:b0d:: with SMTP id w13mr14398285lfu.240.1643056870722;
 Mon, 24 Jan 2022 12:41:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220120214001.1879469-1-nathan@kernel.org> <20220120214001.1879469-2-nathan@kernel.org>
In-Reply-To: <20220120214001.1879469-2-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jan 2022 12:40:58 -0800
Message-ID: <CAKwvOdmTBUcre5+=kopcyAv3q=55=Z5O65QHmvy3Ra2JqgLNHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Wrap -mno-branch-likely with cc-option
To: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 20, 2022 at 1:40 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This flag is not supported by clang, which results in a warning:
>
>   clang-14: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>
> This breaks cc-option, which adds -Werror to make this warning fatal and
> catch flags that are not supported. Wrap the flag in cc-option so that
> it does not cause cc-option to fail, which can cause randconfigs to be
> really noisy.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

We should convert more of these tests to Kconfig checks that run once
per configuration, rather than multiple times for a build. IIRC Linus
mentioned this somewhere...yeah, the -Wimplicit-fallthrough patches.
See
dee2b702bcf06 ("kconfig: Add support for -Wimplicit-fallthrough")

I wonder if we can check ARCH or SUBARCH in Kconfig to limit invoking
the tool under test for certain arch specific command line flags?

I'll take this patch over such a larger change, but I think towards
the goal of speeding up already configured builds, we eventually want
to be migrating cc-option and ld-option checks to Kconfig.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/loongson64/Platform | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
> index 981d3abc150e..acf9edc9b15d 100644
> --- a/arch/mips/loongson64/Platform
> +++ b/arch/mips/loongson64/Platform
> @@ -26,5 +26,6 @@ cflags-y += $(call cc-option,-mno-loongson-mmi)
>  # Loongson Machines' Support
>  #
>
> -cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
> +cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64
> +cflags-$(CONFIG_MACH_LOONGSON64) += $(call cc-option,-mno-branch-likely)
>  load-$(CONFIG_CPU_LOONGSON64) += 0xffffffff80200000
> --
> 2.34.1
>
>


-- 
Thanks,
~Nick Desaulniers
