Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A42C23A3
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 23:06:06 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so11423351pjj.4
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 15:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CVTYF+siE7mPtrMDw8SN4lrmh2h4F+GDmmLhXk98fA=;
        b=Fp8t4mN5XBq2ZAbrbns8S/ghiLp66DrY/knFr24tO2TBIqJVPkF2Is8LhmtEtWKkCj
         4k3FlBBFHxZItXcxKiT25Z+b1mOn0KTod4/vHIkLxG6/HfMovDovyxQFbVw6DrwH45D9
         95B2jczsZYv+SVrrQSvJJX2rVfzrFuBR+ZhvlVqXFkHJ36Dzwbu/IsHcT0YRBTeYNDWy
         7GUSw7vLqR7zrF+VEyKAFAF8x2a0DWw/HLS8xE4b8H9kX81NCfX/4BGggRTRF6BtbI7T
         kUYk8+eW47s9tuJbVmoF87cVXTBkrIBpSxEugfpQY7OSXxlAA4ZQ+v+vXzV6LAT82isb
         wsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CVTYF+siE7mPtrMDw8SN4lrmh2h4F+GDmmLhXk98fA=;
        b=puyjkPWs56MCRz+O0/rVuj2mUpfpzSvJoE+6Zl1Go9hb6cHD5dQHM1dkvC1iJ8FXn0
         EdhJL2b6c/dmBc3qVk3CHUNVN49+hrmD3t/TvjMWjJw9RY6CDbr1fSic6yGvVJr5OCVN
         SUduf7U4tR0oCq1NukjwRHLAqw5WBB8zy16zQBOu8neKfTKJCMEVhsg46332/DnLLw6b
         1rLWTv78O3wk3m/6nb2A9VCflQqcKE9dfFOnhhwIOpYPE6M0DDBYWQnnFVK7jRmwMcpc
         g52J6a5DBtyImSnIu+lJaDHlbmFURWkiXUfF6lHQZH6Ii3RxjZ/q4ISSqDTvB7jpdXQf
         7wyw==
X-Gm-Message-State: AFqh2kpuzHWjkkB0fpXR10ITiaHRZdASlsvcR4Sr4FV7SUapcTt4Zxrr
	SaDHGNrE0gFZ5cTRuC7nEuRbNijGlI1RQQIP52FNqA==
X-Google-Smtp-Source: AMrXdXtLf4clZ35d0wcG2QlDT2iO2pcdvqPMYc0WlGFotr/edxFfq6YMrQVGvGV7TKNRFXsFBlRIFdvxfzgXwINoY30=
X-Received: by 2002:a17:90b:a18:b0:227:202b:8eaa with SMTP id
 gg24-20020a17090b0a1800b00227202b8eaamr360967pjb.147.1673305565227; Mon, 09
 Jan 2023 15:06:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230105090155.357604-1-irogers@google.com> <20230105090155.357604-4-irogers@google.com>
In-Reply-To: <20230105090155.357604-4-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 15:05:53 -0800
Message-ID: <CAKwvOdnagfhgdi7LoggNwu5hjj1NHqCSF6oqe=CR5SgUwEX8UQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] objtool: Alter how HOSTCC is forced
To: Ian Rogers <irogers@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 1:02 AM Ian Rogers <irogers@google.com> wrote:
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
> the objtool CFLAGS are determined with the exception of
> EXTRA_WARNINGS. HOSTCFLAGS is added to these so that command line
> flags can add to the CFLAGS.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Thanks Ian, and happy new year! Sorry for delays reviewing this; I'm
just getting back online today.  Assuming Peter and Josh may be too,
otherwise can Peter or Josh PTAL?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

(I'm happy that this allows me to now pass HOSTCFLAGS on to objtool
successfully)

> ---
>  tools/objtool/Makefile | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 61a00b7acae9..49956f4f58b9 100644
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
> @@ -37,12 +33,19 @@ INCLUDES := -I$(srctree)/tools/include \
>             -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
>             -I$(LIBSUBCMD_OUTPUT)/include
>  WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> -CFLAGS   := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
> -LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
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
> 2.39.0.314.g84b9a713c41-goog
>


-- 
Thanks,
~Nick Desaulniers
