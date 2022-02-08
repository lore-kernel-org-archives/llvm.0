Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE072F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 04:35:33 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-02.nifty.com with ESMTP id 2184OR1V008317
	for <llvm@lists.linux.dev>; Tue, 8 Feb 2022 13:24:27 +0900
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2184O8ah021841
	for <llvm@lists.linux.dev>; Tue, 8 Feb 2022 13:24:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2184O8ah021841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1644294249;
	bh=19uR+JQrTDSNjb/M+uvq075l3b28UXxtfZ5ZKrtYtzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k640Df3SrCi6fK+IspeoU5KOGEeWwlg3V0VARZ5jpH+hr622BV+dar0DE7tkD4ftM
	 Nl8bp7u1erlyxLSu7DOS28i/BOL9BBocT+yIqqO7x9ZpcSkjsj+n9yvxR4KvIayebH
	 8CvETzc3aKM1ewcrZCpzZ5q3npOMgarvQjNQzmwWYbLHbozp/qZbEIQP8kVXptxpts
	 YzYU6N2O/jGo/3gqJdnr2ZkNdRl1cEtBqTBLLrtZIsfzqTvO7xvhq6S6y1SidE9aV4
	 /LCU14Cc8LW50UKekJ/LMXcHcDbfM8FCjJDb6kxxozk8tZvjnq2yCERk2OTRQgr0Yd
	 L7TBqmYiSvgPA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso1096959pjg.0
        for <llvm@lists.linux.dev>; Mon, 07 Feb 2022 20:24:09 -0800 (PST)
X-Gm-Message-State: AOAM530ADJGbNpK0PHqL03KNF37RUJgHBSKQwvTx4uk+lmpz3Liejc4a
	Y1NsFp5BzgrPz/egD9bNMUlRARt5H6LZHvh0cT4=
X-Google-Smtp-Source: ABdhPJz2z9KXlrVLO5E7bA267/kU9GqMyolRq34mQQWWV79UiH2n6X5+/PWBXovs/xUvLsayHJ/bKqkNLxzPi6m7E1k=
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr2866496plt.136.1644294248161;
 Mon, 07 Feb 2022 20:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202230515.2931333-1-nathan@kernel.org> <CAKwvOdkQ__2A3NohrcJgF+JABSDnSyEKzD97qVa4cpM==GPONQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkQ__2A3NohrcJgF+JABSDnSyEKzD97qVa4cpM==GPONQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 8 Feb 2022 13:23:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCGbLWkDXYqyCf08sFHjGqvqSgmFsJ741MHGSKzkifLg@mail.gmail.com>
Message-ID: <CAK7LNASCGbLWkDXYqyCf08sFHjGqvqSgmFsJ741MHGSKzkifLg@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.extrawarn: Move -Wunaligned-access to W=1
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 8:12 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Wed, Feb 2, 2022 at 3:07 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > -Wunaligned-access is a new warning in clang that is default enabled for
> > arm and arm64 under certain circumstances within the clang frontend (see
> > LLVM commit below). On v5.17-rc2, an ARCH=arm allmodconfig build shows
> > 1284 total/70 unique instances of this warning (most of the instances
> > are in header files), which is quite noisy.
> >
> > To keep a normal build green through CONFIG_WERROR, only show this
> > warning with W=1, which will allow automated build systems to catch new
> > instances of the warning so that the total number can be driven down to
> > zero eventually since catching unaligned accesses at compile time would
> > be generally useful.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://github.com/llvm/llvm-project/commit/35737df4dcd28534bd3090157c224c19b501278a
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1569
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1576
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks to you and Arnd for working out whether this is important to
> pursue. Sounds like it is.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > ---


I assume this should be considered as a bug fix
to avoid the error for the combination of CONFIG_WERROR=y
and the latest Clang.

Applied to linux-kbuild/fixes.
Thanks.



> >
> > v1 -> v2: https://lore.kernel.org/r/20220201232229.2992968-1-nathan@kernel.org/
> >
> > * Move to W=1 instead of W=2 so that new instances are caught (Arnd).
> > * Add links to the ClangBuiltLinux issue tracker.
> >
> >  scripts/Makefile.extrawarn | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index d53825503874..8be892887d71 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -51,6 +51,7 @@ KBUILD_CFLAGS += -Wno-sign-compare
> >  KBUILD_CFLAGS += -Wno-format-zero-length
> >  KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
> >  KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
> > +KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
> >  endif
> >
> >  endif
> >
> > base-commit: 26291c54e111ff6ba87a164d85d4a4e134b7315c
> > --
> > 2.35.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
