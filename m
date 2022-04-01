Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D8C1367
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 13:11:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 231DB4nv028930
	for <llvm@lists.linux.dev>; Fri, 1 Apr 2022 22:11:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 231DB4nv028930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1648818665;
	bh=/kI3lQPTgEygcI7vmBN005HvGRQcbjUBTIDFX8fCsok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vlVvQCkO5HP+kKJ2zs9SP8MYR167xK8MnHYtRrF8iD825i5ZfWXP5RezshrudtHAV
	 ekNu4WL0lCFYRrEgYQEJeIxhAcgstnWdT9D9JoO1wOrJuNKjkOsfXvX3+ERh+ReWR5
	 HQ6BMJ7JIXAWqsB8Yykil5Ju8sWVTrjS5e0MguhbWdw1vpXoHDwmu1P+gdVoBe5E5s
	 0KGsc1Of/ErmaSOaQXa9+bic1VtjolCwhJx7rPrHAI4Pk7TUadqCdN87UPnCV04gVq
	 p7QtxVnt43izdvv7CyDDopnwkCa2mkAlsq7wwOzgO+BjeLvZ0oQUmZtjdBYXoDiCm6
	 Lms+rHpPPX9YA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id gb19so2397185pjb.1
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 06:11:04 -0700 (PDT)
X-Gm-Message-State: AOAM531JDOiR0Txv49SRHMWbNtVvfF/fWGriRZNJl0+D8NWNm6UxiwS7
	y1mE0PcliLIJWzTdVsnUiWSf4fkAQtQMqibR2+4=
X-Google-Smtp-Source: ABdhPJxIay5Z8UU92lADQCkERH4RVzsDhwr+Hx1SjiWIoiMOqBVc5jaSrmPEqdxc4cMxCGnuhdAN/qfPy2s6hzVNF1M=
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr10211008plp.162.1648818664197; Fri, 01
 Apr 2022 06:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220322173547.677760-1-nathan@kernel.org> <CAK7LNAT8TcDy=iKaWZ7_+MbT84vOVEBzHxJY8Bx54Ju5fur8-w@mail.gmail.com>
 <Yj9wyNwZWkilNbJM@dev-arch.thelio-3990X>
In-Reply-To: <Yj9wyNwZWkilNbJM@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Apr 2022 22:10:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKg87aZTTF7heXnh1sWFm9Stxsu5unRw_rSbKB=jCr9g@mail.gmail.com>
Message-ID: <CAK7LNASKg87aZTTF7heXnh1sWFm9Stxsu5unRw_rSbKB=jCr9g@mail.gmail.com>
Subject: Re: [PATCH] um: Fix filtering '-mno-global-merge'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Gow <davidgow@google.com>, linux-um@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 27, 2022 at 5:00 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sat, Mar 26, 2022 at 12:29:55PM +0900, Masahiro Yamada wrote:
> > On Wed, Mar 23, 2022 at 2:39 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When booting a clang compiled UML kernel, the kernel panics when trying
> > > to run init:
> > >
> > >   wait_stub_done : failed to wait for SIGTRAP, pid = 651294, n = 651294, errno = 0, status = 0xb7f
> > >   Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> > >
> > > After the commit in Fixes, many flags from KBUILD_CFLAGS do not appear
> > > in USER_CFLAGS, likely due to USER_CFLAGS initially being a recursive
> > > variable ("VAR =") then being switched to a simple ("VAR :=") variable.
> > > For example, diffing arch/x86/um/.ptrace_user.o.cmd shows flags such as
> > > '-Os' and '-fno-delete-null-pointer-checks' getting dropped, which both
> > > impact code generation.
> > >
> > > Rework the filtering to use filter-out instead of patsubst, which allows
> > > all the patterns that USER_CFLAGS cares about to be excluded in one
> > > command and ensures all flags from KBUILD_CFLAGS are transferred over to
> > > USER_CFLAGS properly, which resolves the boot issue noted above.
> > >
> > > Fixes: 6580c5c18fb3 ("um: clang: Strip out -mno-global-merge from USER_CFLAGS")
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> >
> >
> > Can we remove -mno-global-merge entirely?
> >
> >
> > 61163efae02040f66a95 was a very old commit,
> > without enough explanation.
> >
> > Shall we remove  -mno-global-merge, and do compile-tests.
> > If we are hit by problems for arm/arm64, we can re-add it.
>
> Yes, I think that was the conversation that we had on the commit that
> this fixes:
>
> https://lore.kernel.org/r/YiD7R2wRxoWxtVq7@dev-arch.thelio-3990X/
>
> I can test that on my Raspberry Pi 3 and 4 on Monday, although I would
> like for this patch to be picked up in the meantime so that it is
> possible to test UML on -next with clang. We can remove
> -mno-global-merge in a follow up change, if you do not have any
> objections?
>
> Cheers,
> Nathano


This patch is unneeded now
because I picked up the alternative:

https://lore.kernel.org/all/CAK7LNAS6C6Uj9cCQ0o=bYF1F-EVD=VgdR8YYx-1PJc9toX_HZA@mail.gmail.com/



-- 
Best Regards
Masahiro Yamada
