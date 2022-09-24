Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE57B
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 02:20:15 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id t190so1776766pgd.9
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 19:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OqGIr83avsKieKKHgb8l4/PvPv6lvnyXb0Oxt5Keb0M=;
        b=QQ2mfUv7p7UJJ/wu8hdvLQLwax8cFTF5n3JslE8afwFsUqYiwWTNLPOeahX66KI2xU
         pDfYguqdCC25fWFqX2NyI3GapDMuvIx7JnjqNeg5p7nERCDN8qqACmMANbPZvfLbno6d
         Mv0d3NK+8Rfsq2ZbmkjIAB8CdE5ZKYkis64UD7ZU05IeWUCpOE0LmsJWNC7hxvOnsdiE
         /79BRdEO43VapKsi/VjSkpTtPEWap2sP+h/UjmdXxhZ8bwpswhbzCPh1cBSfXew0yzZm
         gIiYt10YcviacZxs3sT+HrJNhaypCeeqjN2z6FpaAfXnvaL7YtYTk1SgGadaY7NGE8YG
         Tyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OqGIr83avsKieKKHgb8l4/PvPv6lvnyXb0Oxt5Keb0M=;
        b=caw5Fj6Z/1jR8kexzvmICU97wYHe4NTkn7Jf28W7HCPuhTxQNgryiMXzYsdpvUwYz4
         Gan1PbNcgeT/isz2gIgvGFf0omVjXir+ZefXlPaBs9rcRL01WFDIvzifFfFrXaAKJdZS
         YKwlCDjZT+jDjPVfb4gAE7vbzgG4tbaZ3Zawongyx0IOAh6WEwMG7hfLNXY7avJZj+eY
         VULknvj3otWIqdVjXdfXRQBNY69wYtA0WNuAnYJA45BxBBsif3IkeURoJWgqSxvEWkuS
         0bQJ9f3a+WPihqGpk9S2EkgfNX7jsxDP1xURNxRUOOH+sE1fEbJVMQsM+IqWQ4jGOTl4
         uoMg==
X-Gm-Message-State: ACrzQf35ruZbgh61pp3e/uh48lKpi2WdxNDN8i3aUsss8b9693vS1lzR
	TlwRgauIcKT7P+F31ylgiluR58piftumM3qkR2Gv4Q==
X-Google-Smtp-Source: AMsMyM47XGX6nnzq5zmVPJ7WKLYQDZAJKqYRNc7f22QCqvjJW0pgWzz/uaUULwJ59wBC0CNTwE+37EAtcRnqsyT4LFw=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr10283997pgi.403.1663986014944; Fri, 23
 Sep 2022 19:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919174547.3730737-1-ndesaulniers@google.com> <CAK7LNAS5xSQTjDuu+dsNW2fOz1-s7x0gsCLmfQOnGpb5CY06KA@mail.gmail.com>
In-Reply-To: <CAK7LNAS5xSQTjDuu+dsNW2fOz1-s7x0gsCLmfQOnGpb5CY06KA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Sep 2022 19:20:03 -0700
Message-ID: <CAKwvOdk-oj24MQs-W0Xs6p33f+Ei7Wu3wwCX+d34T=xoOPxOiw@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.debug: re-enable debug info for .S files
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 23, 2022 at 7:12 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This patch still misses the debug info for *.S files
> for the combination of LLVM_IAS=0 and
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> because, as the comment says, Clang does not pass -g down to GAS.
>
>
> With "[v4] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT"
> and this one applied,
>
>
>
> $ grep CONFIG_DEBUG_INFO_DWARF .config
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> $ make LLVM=1 LLVM_IAS=0 arch/x86/kernel/irqflags.o
>   SYNC    include/config/auto.conf.cmd
>   SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>   SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
>   HOSTCC  arch/x86/tools/relocs_32.o
>   [snip]
>   AS      arch/x86/kernel/irqflags.o
> $ objdump  -h arch/x86/kernel/irqflags.o | grep debug
> $
>
>
>
>
>
>
>
>
> I think the following fix-up is needed on top.
>
>
>
>
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index d6aecd78b942..8cf1cb22dd93 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -1,4 +1,5 @@
> -DEBUG_CFLAGS   := -g
> +DEBUG_CFLAGS   :=
> +debug-flags-y  := -g
>
>  ifdef CONFIG_DEBUG_INFO_SPLIT
>  DEBUG_CFLAGS   += -gsplit-dwarf
>
>
>
>
> Then, I can see the debug sections.
>
>
>
> $ make LLVM=1 LLVM_IAS=0 arch/x86/kernel/irqflags.o
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   AS      arch/x86/kernel/irqflags.o
> $ objdump -h arch/x86/kernel/irqflags.o | grep debug
>   6 .debug_line   00000050  0000000000000000  0000000000000000  0000008f  2**0
>   7 .debug_info   0000002e  0000000000000000  0000000000000000  000000f8  2**0
>   8 .debug_abbrev 00000014  0000000000000000  0000000000000000  000001d0  2**0
>   9 .debug_aranges 00000030  0000000000000000  0000000000000000  000001f0  2**4
>  10 .debug_str    0000004d  0000000000000000  0000000000000000  00000250  2**0
>
>
>
>
>
> If you agree, I can locally fix it up as such.

Ah, sorry I missed testing that combination. Thanks for your
thoroughness. Yes please apply that diff on top.
-- 
Thanks,
~Nick Desaulniers
