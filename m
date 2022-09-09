Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA94612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:07:01 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 289L6lTm031332
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 06:06:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 289L6lTm031332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662757607;
	bh=DvVjZAUBnzPdzYN9rjZzo+TIJCdrmJ3YhUlFxpG7vGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yfh9jqhI5hsqYe7zKl4XSiasR47N2385i6NT9wpSeGlWrMLvBDoevC0jg127i7k0w
	 275kRhGoy4B5UGlOlqlMWTjISjafDVWm9TioXEbwO2rbEo3Kvm0+p4Fg2Ig8g1AluT
	 7xhH315A5EvIYNqaNN4ejBiL1Cci4wI0xlAq2wyjMoXFQWeDZz2ykkYZrddjK3XdAH
	 XLiqKC4soAF04OU3ozG1kln8L0t7sZoQ5s4TMEDrQwObUZH4CY2ASlHbWcyJcWJ7PV
	 gYfOGH93nPvrNgF6D/fqDNv4zJ1cRwtNQcNLq5qrZwM1b877wH0ZJpHlWJScJ7yuSf
	 +Vu6hgjIeQCFQ==
X-Nifty-SrcIP: [209.85.160.50]
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1274ec87ad5so7227834fac.0
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:06:47 -0700 (PDT)
X-Gm-Message-State: ACgBeo08vJKCfXsMvm4d3ynORTW6aLvbP4R06h4JwPfG6U/tjDKqF7vl
	CDtQp1osDkHyFyi8tvA17hO7WOmN95j3rKn0kRI=
X-Google-Smtp-Source: AA6agR4y2JcV0EsyjVkDa6p8pvwM4sY7V8jOR09Bz5w0m7vWO0Itq4SKFTWHNC0vbVHJ/VE4SXL8VeOx9uH4eMX5lOo=
X-Received: by 2002:a05:6870:f626:b0:10d:a798:f3aa with SMTP id
 ek38-20020a056870f62600b0010da798f3aamr5974490oab.194.1662757606749; Fri, 09
 Sep 2022 14:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com> <20220907045907.484043-3-ndesaulniers@google.com>
In-Reply-To: <20220907045907.484043-3-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Sep 2022 06:06:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0e2sA4QMssbMf8B0459_LoB9ykfTmFmFVXOjqBea4-w@mail.gmail.com>
Message-ID: <CAK7LNAR0e2sA4QMssbMf8B0459_LoB9ykfTmFmFVXOjqBea4-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 1:59 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
> cause as-option to fail unexpectedly when CONFIG_WERROR is set, because
> clang will emit -Werror,-Wunused-command-line-argument for various -m
> and -f flags for assembler sources.
>
> Callers of as-option (and as-instr) likely want to be adding flags to
> KBUILD_AFLAGS/aflags-y, not KBUILD_CFLAGS/cflags-y.
>
> Also, change as-option and as-instr to use -x assembler-with-cpp since
> kernel sources are .S files that use the compiler as the driver. And
> then add -Werror as well.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1699
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---



01 and 02, applied to linux-kbuild/fixes.
Thanks.




> Changes v2 -> v1:
> * Add -x assembler-with-cpp -Werror to both as-option and (new)
>   as-instr, as per Masahiro.
> * Add Masahiro's SB tag.
>
> Changes v1 -> v2:
> * Split off changes to arch/x86/boot/compressed/Makefile into parent
>   patch, as per Masahiro.
>
>  scripts/Makefile.compiler | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 94d0d40cddb3..a66638b5f4a5 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -29,16 +29,16 @@ try-run = $(shell set -e;           \
>         fi)
>
>  # as-option
> -# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> +# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
>
>  as-option = $(call try-run,\
> -       $(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
> +       $(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
>
>  # as-instr
> -# Usage: cflags-y += $(call as-instr,instr,option1,option2)
> +# Usage: aflags-y += $(call as-instr,instr,option1,option2)
>
>  as-instr = $(call try-run,\
> -       printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
> +       printf "%b\n" "$(1)" | $(CC) -Werror $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
>
>  # __cc-option
>  # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
> --
> 2.37.2.789.g6183377224-goog
>


-- 
Best Regards
Masahiro Yamada
