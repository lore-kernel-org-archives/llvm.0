Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E55A38
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 20:59:40 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id l12so9455482ljh.12
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hF2vs9NjbnbTdElM7rjadc3y+URyZ5G/GV8Xp9q1mTc=;
        b=jTZl4VzzG5Q/ZojFtK0EuWylpf+MnbQerQTQQNfnAaCNKZymDKsEAKa5Fj3TO2YKsC
         QTpys3btqW2Pvkks/qOmvvXxNAMrCpZlFVTKykLpxMFVxI6Q/DuCp0UkrAYh2PMd73NY
         LnVj2uYkUal0uVXSSwNUzosRY7Ulu0YgBKzfJvz/rIODlteH479tBcaXz9YyiJzslCdy
         bQDR6HjFtB1GaBxAFkEdscDkleuxvw6HlA7REQJUYS3V11pkTJ0Z4RsVOjHsE/zv1N/w
         uTlucTGl2lViLrmHFOya2MO5LmjoE+qk9PO376fPxjuUhJRlbHF5W4XM5Pt7LDk2t25x
         hYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hF2vs9NjbnbTdElM7rjadc3y+URyZ5G/GV8Xp9q1mTc=;
        b=vtW+g79V2DNn6Mq7aHf+dZXLzpt7ceYVwIdW+JnkNNY1ZiX7jfUd9MJtg2wJcWXbNn
         0/lKzcY1riLL+eYG9VNIDzbxQnm1DI9x0kY4llAmsit1g5P5T3KQiGdW0XzbFiKXmUhD
         WjE4Pb113B1ZBIrUrcN05oSti9BqbV8tsH0b3r4I9ulpc+iKcSDcQNioxL6cJ0rFOTMd
         PK2JAgbyjrGF+4AGHMPCggplAAR5recLoZWhlr3zlDgjWYqzXdElJzrougva8hzmN6RM
         nffsX61qnWt6MtXX2PZ0ITjkPGwT0ubLQdsFroF9snApmYaO1k+8Ccl1itqEGAFyhqPV
         SMpg==
X-Gm-Message-State: AOAM532VhdC+ZclrrwKuTfpzvFLuTsIdVWo7iXMTYiId5tCALRO6DDfG
	iiyeth1IEGdq+Fl1evQ6gxeul5ck8QT60WYApxQzDw==
X-Google-Smtp-Source: ABdhPJz7LqBzuCq1k8LyUcOYgy42GVU7SXtVjTWf+4IKEBb+ZOjwaRVTp+GH1VGP7i0urW9HLCHLpuocaa3JTpZ+XhI=
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr4080754ljb.468.1646945978202; Thu, 10
 Mar 2022 12:59:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220310061909.20166-1-sedat.dilek@gmail.com>
In-Reply-To: <20220310061909.20166-1-sedat.dilek@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Mar 2022 12:59:26 -0800
Message-ID: <CAKwvOdnAbU8gpPAba9g1ptZxSdOOTe7edT1OV_n1f=zAwp9y_g@mail.gmail.com>
Subject: Re: [PATCH] tools: feature/test-libperl.c: Sync PERL_EMBED_CCOPTS
 with perf
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Ian Rogers <irogers@google.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Fangrui Song <maskray@google.com>, Jiri Olsa <jolsa@redhat.com>, 
	Michael Petlan <mpetlan@redhat.com>, Leo Yan <leo.yan@linaro.org>, 
	John Keeping <john@metanate.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Jiri Olsa <olsajiri@gmail.com>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 10:19 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> When trying to build perf with a LLVM/Clang toolchain people see errors
> when testing for libperl feature.
>
> Jiri reports:
>
> > I'm getting some other lto related error:
> >
> >         $ cat test-libperl.make.output
> >         clang-13: error: optimization flag '-ffat-lto-objects' is not supported [-Werror,-Wignored-optimization-argument]
> >
>
> The reason is PERL_EMBED_CCOPTS is defined in two places:
>
> tools/build/feature/Makefile
> tools/perf/Makefile.config
>
> As an result FLAGS_PERL_EMBED is set differently.

s/an/a/

>
> For building perf '-ffat-lto-objects' is filtered-out:
>
> $ git grep ffat-lto-objects tools/perf/
> tools/perf/Makefile.config:  PERL_EMBED_CCOPTS := $(filter-out -flto=auto -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
>
> Sync PERL_EMBED_CCOPTS in tools/build/feature/Makefile to fix this.
>
> For a minimal fix for Linux v5.17 this here was preferred by Arnaldo.
>
> Link: https://marc.info/?t=164646683300002&r=1&w=2

Hey Sedat, we prefer lore links now to external mirrors!

Link: https://lore.kernel.org/lkml/CA+icZUWHd4VTKNwBtuxt9-fHoiYV+Q7tQ809Cn83k8sbQ_uNHw@mail.gmail.com/

> Reported-by: Jiri Olsa <olsajiri@gmail.com>
> Reported-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> Tested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> Suggested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  tools/build/feature/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index 1480910c792e..869073cf8449 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -218,6 +218,7 @@ PERL_EMBED_LDOPTS = $(shell perl -MExtUtils::Embed -e ldopts 2>/dev/null)
>  PERL_EMBED_LDFLAGS = $(call strip-libs,$(PERL_EMBED_LDOPTS))
>  PERL_EMBED_LIBADD = $(call grep-libs,$(PERL_EMBED_LDOPTS))
>  PERL_EMBED_CCOPTS = `perl -MExtUtils::Embed -e ccopts 2>/dev/null`
> +PERL_EMBED_CCOPTS := $(filter-out -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
>  FLAGS_PERL_EMBED=$(PERL_EMBED_CCOPTS) $(PERL_EMBED_LDOPTS)
>
>  $(OUTPUT)test-libperl.bin:
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
