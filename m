Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38DA2C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 16:38:01 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-05.nifty.com with ESMTP id 21EGTjeD017333
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 01:29:45 +0900
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 21EGTWQM026336
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 01:29:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 21EGTWQM026336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1644856173;
	bh=IWFhsdLGwPufdKVvo3WtqAatdIfuhannZRdJWn555Yc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=0RL0kBfqbzxPVKxJsQmPwNvCEGIW6HXB5/mG6rgnadphGLGCNmiF979icb3eyhSlw
	 zhd+Ajsyry0nmjFDJ5KYk/VSo8fm+5BcPST4bAiuSThsrPOugH8vZtQ2sZ5SNq/Jvv
	 9dJ1JbXnAdt7Bs0AaUi1Ea3smhMstSFa3SQz5rfG74ZA83SSu03139HrEUwU6GvvVf
	 Okm3zu3HajctHMS+sllWtiOdwpnz4mkp57FByXL+cZrn240xkk18guwWzAqZigNck3
	 fEllsOEIvTNelwvvJCFqVq6ZHSGnfwHUiqWTqVxfKghN5EVcQ/BzKSDsctdSYCDIZj
	 24DgzK48EHr/A==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id w1so10941786plb.6
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 08:29:33 -0800 (PST)
X-Gm-Message-State: AOAM530qvxy8OBQ1EU4ZnPbAYR/nC4HEcSKb0K7zasgM8wvnF8EfFkmE
	6bwnq865QT72Z5i/hYNbR0vi9U3qeVczFc17UWk=
X-Google-Smtp-Source: ABdhPJzxQHF4cinPPIl9bm6owtf4MwDNSk6CAk+XE1RC+gweWqCzyEpRUV8mgMriTv8NVC4aQv4lZH9qsuF18CwAo4w=
X-Received: by 2002:a17:903:22c5:: with SMTP id y5mr498336plg.99.1644856172109;
 Mon, 14 Feb 2022 08:29:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202202132037.4aN017dU-lkp@intel.com> <20220214102000.1d3af66e@gandalf.local.home>
 <Ygp64CsyyKyRykqE@dev-arch.archlinux-ax161>
In-Reply-To: <Ygp64CsyyKyRykqE@dev-arch.archlinux-ax161>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 15 Feb 2022 01:28:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmztEn7nN_R05zhXWc-5S44Y5nGQQjzdByTPxgDH13wA@mail.gmail.com>
Message-ID: <CAK7LNAQmztEn7nN_R05zhXWc-5S44Y5nGQQjzdByTPxgDH13wA@mail.gmail.com>
Subject: Re: kernel/trace/ftrace.c:7157:20: error: unused function 'ftrace_startup_enable'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, kernel test robot <lkp@intel.com>,
        chongjiapeng <jiapeng.chong@linux.alibaba.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 12:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Steve,
>
> On Mon, Feb 14, 2022 at 10:20:00AM -0500, Steven Rostedt wrote:
> > On Sun, 13 Feb 2022 21:03:29 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> kernel/trace/ftrace.c:7157:20: error: unused function 'ftrace_startup_enable' [-Werror,-Wunused-function]
> > >    static inline void ftrace_startup_enable(int command) { }
> > >                       ^
> > >    1 error generated.
> >
> > Strange. I always thought that static inline functions do not cause
> > warnings when not used? Especially, since they are often in headers when
> > things are turned off. Or is it because this is in a C file?
>
> With -Wunused-function, clang will warn about unused static inline
> functions within a .c file (but not .h), whereas GCC will not warn for
> either. The unused attribute was added to the definition of inline to
> make clang's behavior match GCC's.
>
> > Is this a new warning caused by a commit, or is it a new warning because
> > the compiler now complains about it?
>
> However, in commit 6863f5643dd7 ("kbuild: allow Clang to find unused
> static inline functions for W=1 build"), Masahiro made it so that the
> unused attribute does not get added at W=1 so that instances of unused
> static inline functions can be caught and eliminated (or put into use,
> if the function should have been used), hence this report.

BTW, my hope was to move this warning to W=0 someday.
(that is, remove __inline_maybe_unused entirely).

I do not know how many warnings are still remaining, though.
Is it now more difficult due to CONFIG_WERROR?



> I will be honest, I don't know why the robot flagged 172f7ba9772c as the
> commit that introduced this warning but it seems legitimate if
> CONFIG_DYNAMIC_FTRACE is not enabled, since ftrace_startup_enable() is
> only ever used within an '#ifdef CONFIG_DYNAMIC_FTRACE' block so I guess
> the stub is unnecessary?
>
> Cheers,
> Nathan



-- 
Best Regards
Masahiro Yamada
