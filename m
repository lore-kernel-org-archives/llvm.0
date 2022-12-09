Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865566D24
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 18:27:42 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so5822384pjm.2
        for <llvm@lists.linux.dev>; Fri, 09 Dec 2022 10:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gIgOD4wswhYFoONZnkGpnT9Fb5RY+TP6tHyxkVws9g=;
        b=podaF/exWcGGx/OfgyRwWibmT7w7cgfPONQ55bPT/RukR4RdJ3oLP8BtPHAXlpMuQU
         4EbLe4xubbmd2Isk6+pbqxHqaYooBCQmy3G2+XjrTZ4cCWFec+A6ahs1VJeHOCtwG0/W
         UNcc0lyRrt5nHmnVoNT/7aOY9N3EHNvB+VvEDeBWRIOsygmYMxLxHyMSDEVjor9AThmT
         cngODjR923ruf8mw74f9S0mUawB8A3dviNLvYnZCLFLjuas0T9E/WcRA2CbPQD0+ck6z
         e7PushbybebKiDq4+pyEPMNfuCs3e6RvpqZuGjwEONRtjQiXdsaFV+glvQu5IsVsbCUj
         0Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gIgOD4wswhYFoONZnkGpnT9Fb5RY+TP6tHyxkVws9g=;
        b=1sdNNXlqpqr6xj7DumzCnFQsFBFWqGab44Mvd6hEBQTe0ncKDLNSC6ZckZslLlO8Gf
         v/UCsClvyLYqxxIEyy04DjgVBAC788+Eel6faUnNMuWJ3l+4P8r/BmsO0zXgVoYr6xIr
         OErfQ4904RM2wf4qBKbd56rXgrVhfDIxKIv7cAFHBR+DeQ6wYHPnE49Qy++JosuFhxB1
         fwa4YW5QWnqm4NtnqxjwFGNXz/pGBVflJ4Qo6h8+5oSzI6X8qsFx9Nfio+jq+4R985Wk
         G7muOYHC45eDHbDuq557g56/utFiTi54L5X1Y1tj+aVm7Nm0qtMdyssIocBCNVFo5Jv5
         Y/yA==
X-Gm-Message-State: ANoB5pk+WAKox43gAoWoaG+tumq1dVqbt1B2h+7WY11odK3cYmlvPfRF
	Ur612uPls1/1F7pOqsvoXOCwTXcOakHuTYXdNpF/pQ==
X-Google-Smtp-Source: AA0mqf7/s6f8fvn45C5p0KJifVNXCAkl232CBj3A49DUBuPorsuAcOiLgacl7cmyAqtHsysvaq6vWLYEbQzmwebPLxY=
X-Received: by 2002:a17:90b:2743:b0:20d:4173:faf9 with SMTP id
 qi3-20020a17090b274300b0020d4173faf9mr108648571pjb.147.1670610461644; Fri, 09
 Dec 2022 10:27:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com> <CAKwvOd=fEc=f++NFJpb+QOynC8vRrRp3wFT1KpQNwVcG9WWdrQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=fEc=f++NFJpb+QOynC8vRrRp3wFT1KpQNwVcG9WWdrQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Dec 2022 10:27:30 -0800
Message-ID: <CAKwvOdnXH_wSCXNJ=ozdJWEOj9E6EvL60bqz1Cw-DU0ojV7VsA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] objtool build improvements
To: Ian Rogers <irogers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 9, 2022 at 10:17 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Nov 21, 2022 at 4:11 PM Ian Rogers <irogers@google.com> wrote:
> >
> > Install libsubcmd and then get headers from there, this avoids
> > inadvertent dependencies on things in tools/lib. Fix V=1
> > support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> > being set for say gcc, and then CC being overridden to clang. Support
> > HOSTCFLAGS as a make option.
>
> Ian, I'm terribly sorry about the delay in reviewing this; usually my
> turnaround time is much lower on code review...
>
> Anyways, the patchset LGTM; thanks for the work that went into this.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Sorry, I just spotted a potential issue in patch 4/4.  You may retain
my above tags for the first three patches if you send a v3.

>
> >
> > v2. Include required "tools lib subcmd: Add install target" that is
> >     already in Arnaldo's tree:
> > https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
> > https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
> >     When building libsubcmd.a from objtool's Makefile, clear the
> >     subdir to avoid it being appended onto OUTPUT and breaking the
> >     build.
> >
> > Ian Rogers (4):
> >   tools lib subcmd: Add install target
> >   objtool: Install libsubcmd in build
> >   objtool: Properly support make V=1
> >   objtool: Alter how HOSTCC is forced
> >
> >  tools/lib/subcmd/Makefile | 49 ++++++++++++++++++++++++++++
> >  tools/objtool/Build       |  2 --
> >  tools/objtool/Makefile    | 68 +++++++++++++++++++++++++++------------
> >  3 files changed, 97 insertions(+), 22 deletions(-)
> >
> > --
> > 2.38.1.584.g0f3c55d4c2-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
