Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA8A922
	for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 16:12:14 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z5so2352242wrt.6
        for <llvm@lists.linux.dev>; Thu, 19 Jan 2023 08:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc6LHz9ja4vNZNoyKAs9kC/e4Vo4ndC3e3Y/kURZ1ck=;
        b=ET/ZDO+lEWi5w2siCmWChJo4RnjAXoJq6sX4Whb88vF4ZrSua9hko3Zty3glcrofwe
         b3nOI4ygcifnKm7jevzM9bORtR8Cg1t8YNhkLrH1Y87fz2Ifb++FltXK9cHW1OBQNU7z
         8J+RUimQYWfsf7LcmpB9B1il9TWXmhCnQ9KXVLPg2grGEcIdPuqNr+A/iyci1xHKIUCQ
         0sk5l40KzMmYSH5giXF0Hymp7m6yL4TwQfgvsblbcyKxfPwbRy6ZHlK3JtaSXIW5Wp99
         8tZFKd/+9KhIKpJB2PJzhOiylbrzHvm4Fmlxaupm2/lNdgMnMpDDggEur6bGo5718fo2
         ZHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc6LHz9ja4vNZNoyKAs9kC/e4Vo4ndC3e3Y/kURZ1ck=;
        b=tlyMWOU8m3TaaW44UUAt0xpGJZOCW3MTWSkRlWngsbK/jMbw9zeBO6Q5sGJUAVvhu6
         3yyJ1Rwlg0NMlOUW7BZPTVYbvwTzz3sW+dLgCyUgjxbnx0mdo04HxPJW79UtSy8nCBgS
         shZ+aQLtSjE+WnIL3aRW2IyrdqoTC4M+Sc9UWjvc5oPfaPGXEsyO8HEc7tYXuqNgyztU
         V4lA1YgsnDZEwzFtrqMbPhs5aXi0bLVFPeD91ZKqbWP5KoqVT4cma4umkOforlK36QSY
         8cHphmU6bawvadtlZbrHYsSBmg1uyN939CcMoFvjhn17bnBnhxM1XpkCr2WbcUrCuf+s
         rX3Q==
X-Gm-Message-State: AFqh2krBqqcp3fOknwDCnFVgd4xNfpFsMZ9CveMqe8FWgahkHzfMPX6n
	ikHmVbXSN6kYAfI365Eqo/npBv5+UCYma1F06ortNg==
X-Google-Smtp-Source: AMrXdXu8SLX9ZiJVh2bB2TpjWAXXCTqS7RBI/VZsbkXt6U5w2uJ11Nxa/L2K8RZo96a0rp4m518z8pMDSmValNBmqjU=
X-Received: by 2002:adf:e2cd:0:b0:2bd:f8da:9be0 with SMTP id
 d13-20020adfe2cd000000b002bdf8da9be0mr388588wrj.375.1674144732404; Thu, 19
 Jan 2023 08:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230105090155.357604-1-irogers@google.com> <CAP-5=fUmJutjku92vn_6OxLJZKJ60yhkS_XLbL7C7p_ska+xZw@mail.gmail.com>
In-Reply-To: <CAP-5=fUmJutjku92vn_6OxLJZKJ60yhkS_XLbL7C7p_ska+xZw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 Jan 2023 08:12:00 -0800
Message-ID: <CAP-5=fWMnSgV73Vc6HcAi+8XFTXizOpsQo5+HKq+tae58v=FCQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] objtool build improvements
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 9:41 AM Ian Rogers <irogers@google.com> wrote:
>
> On Thu, Jan 5, 2023 at 1:02 AM Ian Rogers <irogers@google.com> wrote:
> >
> > Install libsubcmd and then get headers from there, this avoids
> > inadvertent dependencies on things in tools/lib. Fix V=1
> > support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> > being set for say gcc, and then CC being overridden to clang. Support
> > HOSTCFLAGS as a make option.
> >
> > v3. Is a rebase that removes the merged "tools lib subcmd: Add install
> >     target" patch. In:
> > https://lore.kernel.org/lkml/CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com/
> >     Nick rightly points out that:
> > WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> >     became:
> > WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> >     losing the EXTRA_WARNINGS which v3 now adds back in. Previous
> >     testing had added the warnings to the end rather than the
> >     beginning, thereby causing unexpected build issues that aren't present in v3.
> > v2. Include required "tools lib subcmd: Add install target" that is
> >     already in Arnaldo's tree:
> > https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
> > https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
> >     When building libsubcmd.a from objtool's Makefile, clear the
> >     subdir to avoid it being appended onto OUTPUT and breaking the
> >     build.
> >
> > Ian Rogers (3):
> >   objtool: Install libsubcmd in build
> >   objtool: Properly support make V=1
> >   objtool: Alter how HOSTCC is forced
> >
> >  tools/objtool/Build    |  2 --
> >  tools/objtool/Makefile | 66 ++++++++++++++++++++++++++++++------------
> >  2 files changed, 47 insertions(+), 21 deletions(-)
>
> Ping. Relatively small set of patches, with Reviewed-by and Tested-by,
> would be nice to land. Thanks!
>
> Ian

Ping2. Small set of patches, 2x Reviewed-by and 1x Tested-by.

Thanks,
Ian

>
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >
