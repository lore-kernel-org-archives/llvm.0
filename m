Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC546BF
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 17:50:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t18so2598485wro.1
        for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 09:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkPUzmIL2fg/MvyyWLb6tinuS50K3pK6hYAgc0T2+s8=;
        b=NBZOpMEBTrmxoY573C2rIV1+WFHrF7t54vHVGpeiae3CTKpq6v14lleLjo+5m290n3
         mRs2o/9t+Hgw+h4ezcQ7s6By8SLHy/PBqGd2aJUFqMq4oXP6Nga5r6wGdWdA32kW2iwP
         EdAUskvmSL1QwojAnuVOPkEoeZJzoXcUpWEaQ+ujl3pV9YcMbx7Rb4aoVBFSggB+ILwe
         T3nlIP0dhXt0ucVY9IBd26prZPprpCRDqTssYTLkSyD7JzuHaypOZBheAE/w5HKWWyko
         OaMrez2lpyOEhTnE2JZ7jrQZwGczV/OOQLZFarnitI1IKPmkmCkRg+19vzV5VG51oE39
         rFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkPUzmIL2fg/MvyyWLb6tinuS50K3pK6hYAgc0T2+s8=;
        b=INAVDkXHmtyXhea+OnqXYxLj7a2v5qPuKcLHFrl2ydsVC+1iBPiiHHTbZ5odUDcEvP
         X9eq3IsTAsYpM6gg8kmWFPIHPtDKoDjzMg7tMv02kKiaSw486LMWxdDasU4TaaJcXxIP
         qcCGlbnEN/5P4z1ya4DpOlfqGSg5KzJpHbgPF9RDryMqaAl4T7owklPk2192Wa4QnLG5
         ZHc2dVnws9bbq4IlKFwStfe2wBXjNlg6zCC9SH7huOcrJdqHsblup6SklqOrulhVML7f
         soglLAqm5cVfAg2Xnwxy5M3fPqinYRPC3Bix5SxG6THEGrRnljJ8ZOJxPm8J/VmYEjhU
         m0Eg==
X-Gm-Message-State: AO0yUKUhhw9FSErt5D6aAytL7ma1FrjUbAOGBL1zOPNOF+NVInbvtZ2Z
	uyA7NK7RXiKZrx4tL5Q2wymImY9rd8R/aUDkateXWw==
X-Google-Smtp-Source: AK7set96SN+k54COFF5tDwqJWr4JZS401ZYPjG9vDitL+hqRkJjhIu4vSMlqmGjzQ9TUltVOHxIH7fRrhMG3oYUYd8c=
X-Received: by 2002:a5d:5341:0:b0:2bf:b79f:73f0 with SMTP id
 t1-20020a5d5341000000b002bfb79f73f0mr333641wrv.654.1674755457356; Thu, 26 Jan
 2023 09:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230105090155.357604-1-irogers@google.com> <20230105090155.357604-2-irogers@google.com>
 <20230126014606.idgutoohowyel6ei@treble>
In-Reply-To: <20230126014606.idgutoohowyel6ei@treble>
From: Ian Rogers <irogers@google.com>
Date: Thu, 26 Jan 2023 09:50:44 -0800
Message-ID: <CAP-5=fXQXSV7yWLbnrV-KY4M=bgUwKJtn1sxH7MShz7KLNJ3yQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] objtool: Install libsubcmd in build
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 5:46 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Thu, Jan 05, 2023 at 01:01:53AM -0800, Ian Rogers wrote:
> > Including from tools/lib can create inadvertent dependencies. Install
> > libsubcmd in the objtool build and then include the headers from
> > there.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> After a make, "git status" shows:
>
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
>         tools/objtool/libsubcmd/
>
> So tools/objtool/.gitignore needs an update.

Done.

> > --- a/tools/objtool/Makefile
> > +++ b/tools/objtool/Makefile
> > @@ -12,9 +12,15 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
> >  srctree := $(patsubst %/,%,$(dir $(srctree)))
> >  endif
> >
> > -SUBCMD_SRCDIR                = $(srctree)/tools/lib/subcmd/
> > -LIBSUBCMD_OUTPUT     = $(or $(OUTPUT),$(CURDIR)/)
> > -LIBSUBCMD            = $(LIBSUBCMD_OUTPUT)libsubcmd.a
> > +LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
> > +ifneq ($(OUTPUT),)
> > +  LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
> > +else
> > +  LIBSUBCMD_OUTPUT = $(CURDIR)/libsubcmd
> > +endif
> > +LIBSUBCMD_DESTDIR = $(LIBSUBCMD_OUTPUT)
>
> Similar to Nicolas' comment, it's confusing to have two variables with
> the same value.  Please s/LIBSUBCMD_DESTDIR/LIBSUBCMD_OUTPUT/

Done. I feel this is more of a meta question for the standard in the
current build. DESTDIR is related to installation, in this case header
files, OUTPUT is a build directory. Anyway, LIBSUBCMD_DESTDIR is gone
in v4.

> > +LIBSUBCMD = $(LIBSUBCMD_OUTPUT)/libsubcmd.a
> > +CFLAGS += -I$(LIBSUBCMD_OUTPUT)/include
>
> As far as I can tell, this CFLAGS addition is both ineffective (it's
> overwritten later) and unnecessary (it's made redundant by the same
> addition to the INCLUDES variable).

Agreed, removed in v4.

> --
> Josh
