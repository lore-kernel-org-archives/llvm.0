Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F58F44
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 20:54:59 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id co23so19321668wrb.4
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1l2nJvkOMhf/Q6N3HmLSKyOtgxFfcSynbTgFlzQDiFk=;
        b=i7zPfI1s6CYytk6lWGPrP8CLKhu5KppwB4Hin/v8r4IXv34PypNj92GKWH1EOSRi4p
         4oraSwQAEm4b+M15QRiIqoEKTna1YolT16s/BMD4AsIPQqG9wVIuNSH58/r+iZQoBIVG
         6mwkTRKJx1TPRFlQyVl+gy3wuKXpz5mLkbJlqaWftImBj3KWxYeqE5qntpqRNAsz9kI3
         qTpaYV/QRsYLkei4Z8FK21P2zzwwTOLEkpQPUQxQXo8hRg1DLsnyNxa5jXpza5fTj+Hj
         o/U9rW5lGJ5Zq7ca7PsohBTZwsWbM09H1ERgOjdN9auI7jxsuHpim3TE/JBvk6aMu1eD
         ID4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1l2nJvkOMhf/Q6N3HmLSKyOtgxFfcSynbTgFlzQDiFk=;
        b=enbIRDQr66v2uAEEt7zlbZjBDpDYOp4xoc+l+vSVHALoe78FL3Jayn7xW92Y0NKRnH
         ov4hL+uRhMLrVT9Za48UEjXwD53yCPZp4IGSyU94OLL9X4Ca4ABfDaDVwQfWtKPueQO3
         6xnOATVwB9ZFR2FyDNj/L4NXileP8tfK73tEvXoMbIRFd5pZHA97E8pNh7z9JJBKq/m2
         ttLj9daRh7ke+hxDG2/F7xogNLL5jf9yjI5ft5hoNkLWowHq6fLBd5RYwygDpELnax2O
         ohSBDqz6iVNSJYTZY49nv4+phcnO64xMnsZes7y6Pc1Gpsf9sszkG0SRqNwbYexGT7cU
         EGUQ==
X-Gm-Message-State: AFqh2kq4k7d7Kzp8K2QOtuD0olRnOoZLsTh0ZvIDkZzRtN+AuRz0/OIx
	hfBo1vKTWdlWjyqtjqiGPk1NRskXjjTbpciXF7pbsw==
X-Google-Smtp-Source: AMrXdXsYwjPZS4ox+2H3rYj/QQgBSwzO3H4oIQRT2gZTOuh5fIi6BNpysWWO7nt1I1ptsE2hVc85zlMZnIjIGDNHEQY=
X-Received: by 2002:a05:6000:12cb:b0:28c:459a:d5d with SMTP id
 l11-20020a05600012cb00b0028c459a0d5dmr1888523wrx.654.1673556897672; Thu, 12
 Jan 2023 12:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230105090155.357604-1-irogers@google.com> <20230105090155.357604-2-irogers@google.com>
 <Y8BsqN/HfOf+vKZP@fjasle.eu>
In-Reply-To: <Y8BsqN/HfOf+vKZP@fjasle.eu>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Jan 2023 12:54:45 -0800
Message-ID: <CAP-5=fVEcuWbfO2NoTPanUmXXF6bejnN1s8Lm704P8TvKc1yKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] objtool: Install libsubcmd in build
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 12:32 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> On Thu, Jan 05, 2023 at 01:01:53AM -0800 Ian Rogers wrote:
> > Including from tools/lib can create inadvertent dependencies. Install
> > libsubcmd in the objtool build and then include the headers from
> > there.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  tools/objtool/Build    |  2 --
> >  tools/objtool/Makefile | 33 +++++++++++++++++++++++++--------
> >  2 files changed, 25 insertions(+), 10 deletions(-)
> >
> [...]
> > diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> > index a3a9cc24e0e3..fd9b3e3113c6 100644
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
> Hi Ian,
>
> Is there a reason for distinguishing between $(LIBSUBCMD_DESTDIR) and
> $(LIBSUBCMD_OUTPUT)?

I believe the naming aligns with their use when passed to the
corresponding sub-make variable, so "DESTDIR=$(LIBSUBCMD_DESTDIR)". It
is possible to do other this, a slightly different convention is in
some BPF related code:
https://lore.kernel.org/lkml/20230112004024.1934601-1-irogers@google.com/

Thanks,
Ian

> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
