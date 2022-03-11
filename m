Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387F258E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 23:31:33 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id q11so11908610iod.6
        for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 15:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Crfg5p3u8iOjVMjNQSoRE5tSoR+VziHj4ctmIY8Vq5Y=;
        b=OFv3TefVhiVY/87I7RmhlHM9WNvjDUVHqD2l7pOU+AOp4Eiq7vZYluTW8Z2exjLlht
         /jFRA3c/ExxJXiFVZGeDHhVa8ULbUCj1KZ6R2q6LnoUG9FbkARoZVErbKfvdo6rBiCib
         vOiwv6K5k4KSKLp18hLgwS/AW8LJspgsZY9YgJ23zF5DQHuvq9uLYQsa5eHH6wpeYeEq
         z95A6Zrr0ysM9dWENLCDlTmrzdolg0jregmDNn074G+4dJeB4v6QEKQ7ma+DFy3Pvr6W
         8t8IFr45/nOOFvKkiuu9H8ugcH7roeEGDkVx5C+ymy67xV3nAu6N7X+HNhDihzg3AANP
         6xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Crfg5p3u8iOjVMjNQSoRE5tSoR+VziHj4ctmIY8Vq5Y=;
        b=xC6/e+APqpQVqIy1nhJiPuandhfW3xB//9/um/bH9FSSpbxHx8ZXyCCWo9onmmEKE3
         VKWBMWVljhAoCKA/teNe0/XCTE9hNS2j5cLw0UBsrGITPif+Wq/j7C1+b9xjsh7HKNDc
         75ySb9QvQaBHNivNfSRH09H3oe+ITT+P1KnLawL7CGXaesC6AAhvGVGVmJNH6wpCMLAB
         eCz78Fu1WyKCLH24TOiDRjmf/AGN8bV1GRJOPNBn4szAFvmHeHRH7Vvi6BHkjgbYzZe8
         +fqV0nMilDP2XvBvo1DH1ULZEYTXJMyBwd0Y+Jj3PUVctNm0JiJz7nrivO9FcCzbkT66
         4hzg==
X-Gm-Message-State: AOAM532/L9vnNGA4g3D1ForyWiJXXkjnQn34DB4wCxoL28JZJm9lMhQC
	/W3a7v2icma3PrK+GjqR50ebTNA4X3htlc1Zf7k=
X-Google-Smtp-Source: ABdhPJw2dTC/Q+jNz8Q1iPs7I5wa9Y9NLalzPXgZnBmVEV5rYgKugqoxoH82xz+H6yi5k+S3SrapbwqsFcQkvUnj9K8=
X-Received: by 2002:a05:6638:204:b0:319:1b34:1c57 with SMTP id
 e4-20020a056638020400b003191b341c57mr10420432jaq.80.1647041492205; Fri, 11
 Mar 2022 15:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220310061909.20166-1-sedat.dilek@gmail.com> <Yis41ykyJq1fHYSx@krava>
In-Reply-To: <Yis41ykyJq1fHYSx@krava>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 12 Mar 2022 00:30:56 +0100
Message-ID: <CA+icZUVzQwGSS9hcMMP-HeOAFYxrMH9oCRbxLEdcEUwEJ8Wa3Q@mail.gmail.com>
Subject: Re: [PATCH] tools: feature/test-libperl.c: Sync PERL_EMBED_CCOPTS
 with perf
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Ian Rogers <irogers@google.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Fangrui Song <maskray@google.com>, Jiri Olsa <jolsa@redhat.com>, 
	Michael Petlan <mpetlan@redhat.com>, Leo Yan <leo.yan@linaro.org>, 
	John Keeping <john@metanate.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 11, 2022 at 12:56 PM Jiri Olsa <olsajiri@gmail.com> wrote:
>
> On Thu, Mar 10, 2022 at 07:19:09AM +0100, Sedat Dilek wrote:
> > When trying to build perf with a LLVM/Clang toolchain people see errors
> > when testing for libperl feature.
> >
> > Jiri reports:
> >
> > > I'm getting some other lto related error:
> > >
> > >         $ cat test-libperl.make.output
> > >         clang-13: error: optimization flag '-ffat-lto-objects' is not supported [-Werror,-Wignored-optimization-argument]
> > >
> >
> > The reason is PERL_EMBED_CCOPTS is defined in two places:
> >
> > tools/build/feature/Makefile
> > tools/perf/Makefile.config
> >
> > As an result FLAGS_PERL_EMBED is set differently.
> >
> > For building perf '-ffat-lto-objects' is filtered-out:
> >
> > $ git grep ffat-lto-objects tools/perf/
> > tools/perf/Makefile.config:  PERL_EMBED_CCOPTS := $(filter-out -flto=auto -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
> >
> > Sync PERL_EMBED_CCOPTS in tools/build/feature/Makefile to fix this.
> >
> > For a minimal fix for Linux v5.17 this here was preferred by Arnaldo.
> >
> > Link: https://marc.info/?t=164646683300002&r=1&w=2
> > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > Reported-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> > Tested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> > Suggested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> > Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> > ---
> >  tools/build/feature/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> > index 1480910c792e..869073cf8449 100644
> > --- a/tools/build/feature/Makefile
> > +++ b/tools/build/feature/Makefile
> > @@ -218,6 +218,7 @@ PERL_EMBED_LDOPTS = $(shell perl -MExtUtils::Embed -e ldopts 2>/dev/null)
> >  PERL_EMBED_LDFLAGS = $(call strip-libs,$(PERL_EMBED_LDOPTS))
> >  PERL_EMBED_LIBADD = $(call grep-libs,$(PERL_EMBED_LDOPTS))
> >  PERL_EMBED_CCOPTS = `perl -MExtUtils::Embed -e ccopts 2>/dev/null`
> > +PERL_EMBED_CCOPTS := $(filter-out -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
>
> it looks like this is not enough, at least on fedora 35
>
> I had to add changes below on top of your patch, it fixed the perl
> feature detection and perf build itself, but I'm still getting error
> with perf/python.so:
>

Correct. This patch simply fixes the perl feature detection.

>         $ CC=clang make JOBS=1
>         ...
>           GEN     python/perf.so
>         python_ext_build/tmp/home/jolsa/kernel/linux-perf/tools/perf/util/python.o: file not recognized: file format not recognized
>         clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
>         error: command 'clang' failed with exit status 1
>         cp: cannot stat 'python_ext_build/lib/perf*.so': No such file or directory
>
> with:
>
>         $ file python_ext_build/tmp/home/jolsa/kernel/linux-perf/tools/perf/util/python.o
>         python_ext_build/tmp/home/jolsa/kernel/linux-perf/tools/perf/util/python.o: LLVM IR bitcode
>
> do you get clean compile with python lang enabled?
>
> jirka
>
>
> ---
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index 869073cf8449..86df0fe11ee5 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -217,9 +217,9 @@ strip-libs = $(filter-out -l%,$(1))
>  PERL_EMBED_LDOPTS = $(shell perl -MExtUtils::Embed -e ldopts 2>/dev/null)
>  PERL_EMBED_LDFLAGS = $(call strip-libs,$(PERL_EMBED_LDOPTS))
>  PERL_EMBED_LIBADD = $(call grep-libs,$(PERL_EMBED_LDOPTS))
> -PERL_EMBED_CCOPTS = `perl -MExtUtils::Embed -e ccopts 2>/dev/null`
> +PERL_EMBED_CCOPTS := $(shell perl -MExtUtils::Embed -e ccopts 2>/dev/null)
>  PERL_EMBED_CCOPTS := $(filter-out -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
> -FLAGS_PERL_EMBED=$(PERL_EMBED_CCOPTS) $(PERL_EMBED_LDOPTS)
> +FLAGS_PERL_EMBED  := $(PERL_EMBED_CCOPTS) $(PERL_EMBED_LDOPTS) -Wno-unused-command-line-argument -Wno-compound-token-split-by-macro
>
>  $(OUTPUT)test-libperl.bin:
>         $(BUILD) $(FLAGS_PERL_EMBED)
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 96ad944ca6a8..38b0b0e7a168 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -778,7 +778,7 @@ else
>    PERL_EMBED_LIBADD = $(call grep-libs,$(PERL_EMBED_LDOPTS))
>    PERL_EMBED_CCOPTS = $(shell perl -MExtUtils::Embed -e ccopts 2>/dev/null)
>    PERL_EMBED_CCOPTS := $(filter-out -specs=%,$(PERL_EMBED_CCOPTS))
> -  PERL_EMBED_CCOPTS := $(filter-out -flto=auto -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
> +  PERL_EMBED_CCOPTS := $(filter-out -flto=auto -ffat-lto-objects, $(PERL_EMBED_CCOPTS)) -Wno-unused-command-line-argument -Wno-compound-token-split-by-macro
>    PERL_EMBED_LDOPTS := $(filter-out -specs=%,$(PERL_EMBED_LDOPTS))
>    FLAGS_PERL_EMBED=$(PERL_EMBED_CCOPTS) $(PERL_EMBED_LDOPTS)
>

I fixed that differently by (see [1]),

--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -213,7 +213,7 @@ endif

# Treat warnings as errors unless directed not to
ifneq ($(WERROR),0)
-  CORE_CFLAGS += -Werror
+  CORE_CFLAGS += -Werror -Wno-compound-token-split-by-macro
  CXXFLAGS += -Werror
  HOSTCFLAGS += -Werror
endif

This was sufficient here to build perf successfully.
And maybe ifdef-ed for clang?

But all this is a follow-up?

[1] https://lore.kernel.org/lkml/CA+icZUUCO+gOPLZumu_rTOJz1_v7gRRYVzzEZ+RZPOZBmkqCQg@mail.gmail.com/

> diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
> index 483f05004e68..cfbb03babf63 100644
> --- a/tools/perf/util/setup.py
> +++ b/tools/perf/util/setup.py
> @@ -43,7 +43,7 @@ class install_lib(_install_lib):
>
>  cflags = getenv('CFLAGS', '').split()
>  # switch off several checks (need to be at the end of cflags list)
> -cflags += ['-fno-strict-aliasing', '-Wno-write-strings', '-Wno-unused-parameter', '-Wno-redundant-decls', '-DPYTHON_PERF' ]
> +cflags += ['-fno-strict-aliasing', '-Wno-write-strings', '-Wno-unused-parameter', '-Wno-redundant-decls', '-Wno-ignored-optimization-argument', '-DPYTHON_PERF' ]
>  if not cc_is_clang:
>      cflags += ['-Wno-cast-function-type' ]
>

Cannot say much to that.

Do we want to fix perf building with LLVM/Clang for Linux v5.17 final or later?
Arnaldo?

- Sedat -
