Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F76D24
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 18:26:32 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so8854712pjb.0
        for <llvm@lists.linux.dev>; Fri, 09 Dec 2022 10:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y0tIk3sqFNpbfHpA1sauvw8a7wXa2Xcms6EuyEYhvRk=;
        b=ZAFgp4eeuB30KsOgzpkTWhKYP4oe59cgyqai7KuZpD1LLjw00yzO7fINeDtWdZaIz1
         N5s+469IBqPdFDVZhfH92bc4fyR1YWmFSToug5cPNFwqj46koW4vG3I8XPMeFZdaZhRf
         U93lqGZ5wfiQGH2ucaECSaiFfHxIze+3VIOr0yrEUmqJciGcmk7VyyTDS4FGQZvNDbbv
         qvjpLVp52U2y6qMVQ5az73XIluTz2Vx9fJrY04gsxKyHa4ODqS0IJfnUuqfF0HMqj98d
         gyaGfmunZHNABei21Bzs/q51SZiuQhRuQM1b+RRJUlPrR05BfymnfTIXVunt+036i0L8
         LTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0tIk3sqFNpbfHpA1sauvw8a7wXa2Xcms6EuyEYhvRk=;
        b=2B5UcN5TXXye4JiGS5++VuDZUNClY9oT7L47EKMvW58dPHbEPYo9Hqi/Ioqh1Oc2q3
         t2xOnmdtcMe5ihFuC4izz1i6i88bZ88ELSdSNypoSzrRojWBesY4kxh/Q7Ih6wIpV607
         ce3CXXPMb4shsMBIGiaksJCLMayNLmYV7uRVooCUdD8RWyPePXkLYffW8y20X2MLKT3D
         /GVK7lvFnLNfAngCbiCqn/3jmMvks39z30mTwyUp/TAUlA85gKMVJ8gyTSfYthEGwL8Q
         uLfrNxTfsfBogqRRlJ00hCQhXMDxq5ytGdQPJ1/UMLXpQyHwwxoVHW+JhJ+aLEz80SPE
         j5uw==
X-Gm-Message-State: ANoB5ploO88OWUcPVW8mgDEMuZ5euZEs+rmXavEEGCIe9WL8Uxc3K7ju
	MWK0ZH2dN0/6FgCvWmLg06dMw9NbxCwNb0GjzKVJSQ==
X-Google-Smtp-Source: AA0mqf7Irxffe4OQflHuywnqDb6sN/nLBFJocgSX8td1o1PYS66eHUpd/ohf1Fhb2Uth0n8S14TGTCuoadwcmR6m4ys=
X-Received: by 2002:a17:90a:ab84:b0:213:343:9873 with SMTP id
 n4-20020a17090aab8400b0021303439873mr109320494pjq.102.1670610391716; Fri, 09
 Dec 2022 10:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com> <20221122001125.765003-5-irogers@google.com>
In-Reply-To: <20221122001125.765003-5-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Dec 2022 10:26:20 -0800
Message-ID: <CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] objtool: Alter how HOSTCC is forced
To: Ian Rogers <irogers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 4:12 PM Ian Rogers <irogers@google.com> wrote:
>
> HOSTCC is always wanted when building objtool. Setting CC to HOSTCC
> happens after tools/scripts/Makefile.include is included, meaning
> flags are set assuming say CC is gcc, but then it can be later set to
> HOSTCC which may be clang. tools/scripts/Makefile.include is needed
> for host set up and common macros in objtool's Makefile. Rather than
> override CC to HOSTCC, just pass CC as HOSTCC to Makefile.build, the
> libsubcmd builds and the linkage step. This means the Makefiles don't
> see things like CC changing and tool flag determination, and similar,
> work properly. To avoid mixing CFLAGS from different compilers just
> the objtool CFLAGS are determined. HOSTCFLAGS is added to these so
> that command line flags can add to the CFLAGS.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/objtool/Makefile | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 61a00b7acae9..e550a98e2dd9 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -2,16 +2,12 @@
>  include ../scripts/Makefile.include
>  include ../scripts/Makefile.arch
>
> -# always use the host compiler
> -AR      = $(HOSTAR)
> -CC      = $(HOSTCC)
> -LD      = $(HOSTLD)
> -
>  ifeq ($(srctree),)
>  srctree := $(patsubst %/,%,$(dir $(CURDIR)))
>  srctree := $(patsubst %/,%,$(dir $(srctree)))
>  endif
>
> +MAKE = make -S
>  LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
>  ifneq ($(OUTPUT),)
>    LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
> @@ -36,13 +32,20 @@ INCLUDES := -I$(srctree)/tools/include \
>             -I$(srctree)/tools/objtool/include \
>             -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
>             -I$(LIBSUBCMD_OUTPUT)/include
> -WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs

Looking closer at the V=1 diff in meld, I think this is dropping
EXTRA_WARNINGS.  I think you want to add those back to OBJTOOL_CFLAGS.

> -CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
> -LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
> +WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> +OBJTOOL_CFLAGS := -Werror $(WARNINGS) -g $(INCLUDES) $(LIBELF_FLAGS) $(HOSTCFLAGS)
> +OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD)
>
>  # Allow old libelf to be used:
>  elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
> -CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
> +OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
> +
> +# Always want host compilation.
> +HOST_OVERRIDES := CC="$(HOSTCC)" EXTRA_CFLAGS="$(OBJTOOL_CFLAGS)" \
> +                 LD="$(HOSTLD)" AR="$(HOSTAR)"
> +BUILD_HOST_OVERRIDES := CC="$(HOSTCC)" CFLAGS="$(OBJTOOL_CFLAGS)" \
> +                       LD="$(HOSTLD)" LDFLAGS="$(OBJTOOL_LDFLAGS)" \
> +                       AR="$(HOSTAR)"
>
>  AWK = awk
>  MKDIR = mkdir
> @@ -65,10 +68,11 @@ include $(srctree)/tools/build/Makefile.include
>
>  $(OBJTOOL_IN): fixdep FORCE
>         $(Q)$(CONFIG_SHELL) ./sync-check.sh
> -       $(Q)$(MAKE) $(build)=objtool
> +       $(Q)$(MAKE) $(build)=objtool $(BUILD_HOST_OVERRIDES)
> +
>
>  $(OBJTOOL): $(LIBSUBCMD) $(OBJTOOL_IN)
> -       $(QUIET_LINK)$(CC) $(OBJTOOL_IN) $(LDFLAGS) -o $@
> +       $(QUIET_LINK)$(HOSTCC) $(OBJTOOL_IN) $(KBUILD_HOSTLDFLAGS) $(OBJTOOL_LDFLAGS) -o $@
>
>
>  $(LIBSUBCMD_OUTPUT):
> @@ -77,6 +81,7 @@ $(LIBSUBCMD_OUTPUT):
>  $(LIBSUBCMD): fixdep FORCE $(LIBSUBCMD_OUTPUT)
>         $(Q)$(MAKE) -C $(LIBSUBCMD_DIR) O=$(LIBSUBCMD_OUTPUT) \
>                 DESTDIR=$(LIBSUBCMD_DESTDIR) prefix= subdir= \
> +               $(HOST_OVERRIDES) \
>                 $@ install_headers
>
>  $(LIBSUBCMD)-clean:
> --
> 2.38.1.584.g0f3c55d4c2-goog
>


-- 
Thanks,
~Nick Desaulniers
