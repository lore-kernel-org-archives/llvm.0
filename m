Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C915441B
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 18:41:29 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-333a4a5d495so57148147b3.10
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lPP8ZIOLS6D+TcMlycR/OR+lDE15x2XXqZgNT5DKzz4=;
        b=BVoMBeOyrKSnw5NxEVstnntoqejvil646ntiJcHVzelMDsUyoG4srhTizGO05tCtK+
         CE0IZGiImHFzl1kLyh714dY5gNVaPOf8nQmzWq/if8zDPgdu9BprwDZ4WLIk6zLefVMJ
         6RRoxnlM2kFggt+ANGnUVzLD9OzLvjQXb+hW9jKKiWjkJ8qM7f9lA3Re7Lw++7VKuZdB
         EF8/CHvz/TrzEl/T6gsE1yHmkY90PncBgphWcS1QLuAj0+P4F6Tsr74swhuEiaVvBNfX
         lcQL/sPlxOc+t/BvST3O6GOemuTzNMLWae3vts46vCKVZqdN/9Wg/sx1lYQDGI0j6MNK
         xF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lPP8ZIOLS6D+TcMlycR/OR+lDE15x2XXqZgNT5DKzz4=;
        b=hTMCP0cQav+pLLbyZCSpsJobGD9rb965ZIvpEDNaBr4hrcoKmbRo8myGUt2FK/Rwfv
         oWne+KBb76wCiLEAFAdCmP+bAu39yw+qeeZhxtMclGFUWadf633lD7wafYyobC4fbU5c
         4d6emPb+7KAr+klRfHrtvyja+OzLiKj5BPoqSaDHzoXvGlUFyJl8hxIO8wsD9T0a5Zhs
         2TZOomDHVC7J+K/l+Ypy+I8rcb+ClFVc8ZDIuV3izKKaa9x1w33d1VcJzgpBxHHFz1Ih
         RtVeE4Ed8KEkOQRGdOWR0myseahGaZTBeoydVXUrD5kzBAHiqgjJ5pxwdIXTOeZAzE8v
         tKZg==
X-Gm-Message-State: ACgBeo07YNwKSRJtFItx0dsPabRpQ8jfSQRhsbGLJ5nZUHTc62OQtwqi
	hctlrqM+n2s3t4wytOLo21TAXfH9V01RmXeLrnXZ
X-Google-Smtp-Source: AA6agR5MtS59v09QYLLx6jYr4V9/pL3zI66lHd0PcVCw+PDNHvxhf3OxtN3YY9xkS3yHZTo8pd69rqgZk8naUfex53Y=
X-Received: by 2002:a25:6ec5:0:b0:676:d7ec:65c5 with SMTP id
 j188-20020a256ec5000000b00676d7ec65c5mr982536ybc.610.1661539288470; Fri, 26
 Aug 2022 11:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com> <20220826181035.859042-3-ndesaulniers@google.com>
In-Reply-To: <20220826181035.859042-3-ndesaulniers@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 26 Aug 2022 11:41:17 -0700
Message-ID: <CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Makefile.debug: re-enable debug info for .S files
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, 
	Fangrui Song <maskray@google.com>, Alexey Alexandrov <aalexand@google.com>, 
	Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 11:10 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Alexey reported that the fraction of unknown filename instances in
> kallsyms grew from ~0.3% to ~10% recently; Bill and Greg tracked it down
> to assembler defined symbols, which regressed as a result of:
>
> commit b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
>
> In that commit, I allude to restoring debug info for assembler defined
> symbols in a follow up patch, but it seems I forgot to do so in
>
> commit a66049e2cf0e ("Kbuild: make DWARF version a choice")
>
> This patch does a few things:
> 1. Add -g to KBUILD_AFLAGS. This will instruct the compiler to instruct
>    the assembler to emit debug info. But this can cause an issue for
>    folks using a newer compiler but older assembler, because the
>    implicit default DWARF version changed from v4 to v5 in gcc-11 and
>    clang-14.
> 2. If the user is using CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT, use a
>    version check to explicitly set -Wa,-gdwarf-<version> for the
>    assembler. There's another problem with this; GAS only gained support
>    for explicit DWARF versions 3-5 in the 2.36 GNU binutils release.
> 3. Wrap -Wa,-gdwarf-<version> in as-option call to test whether the
>    assembler supports that explicit DWARF version.
>
> Link: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
> Fixes: b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
> Reported-by: Alexey Alexandrov <aalexand@google.com>
> Reported-by: Bill Wendling <morbo@google.com>
> Reported-by: Greg Thelen <gthelen@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  scripts/Makefile.debug | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index 9f39b0130551..a7a6da7f6e7d 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -4,18 +4,32 @@ ifdef CONFIG_DEBUG_INFO_SPLIT
>  DEBUG_CFLAGS   += -gsplit-dwarf
>  else
>  DEBUG_CFLAGS   += -g
> +KBUILD_AFLAGS  += -g
>  endif
>
> -ifndef CONFIG_AS_IS_LLVM
> -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> +# gcc-11+, clang-14+
> +ifeq ($(shell [ $(CONFIG_GCC_VERSION) -ge 110000 -o $(CONFIG_CLANG_VERSION) -ge 140000 ] && echo y),y)

Do you think this would be better as a macro? Maybe something like:

if $(call cc-min-version,110000,140000)

where the first argument is GCC's min version and second Clang's min
version. It would be more readable and reusable.

-bw

> +dwarf-version-y := 5
> +else
> +dwarf-version-y := 4
>  endif
> -
> -ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> +else # !CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
>  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
>  DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
>  endif
>
> +# Binutils 2.35+ (or clang) required for -gdwarf-{4|5}.
> +# https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
> +ifneq ($(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y)),)
> +KBUILD_AFLAGS  += -Wa,-gdwarf-$(dwarf-version-y)
> +else
> +ifndef CONFIG_AS_IS_LLVM
> +KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +endif
> +endif
> +
>  ifdef CONFIG_DEBUG_INFO_REDUCED
>  DEBUG_CFLAGS   += -fno-var-tracking
>  ifdef CONFIG_CC_IS_GCC
> --
> 2.37.2.672.g94769d06f0-goog
>
