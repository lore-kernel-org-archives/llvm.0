Received: from condef-07.nifty.com (condef-07.nifty.com [202.248.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA217C1
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 03:40:46 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-07.nifty.com with ESMTP id 24C3ahjI028003
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 12:36:43 +0900
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 24C3aGpg020265
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 12:36:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 24C3aGpg020265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652326576;
	bh=VfPskzDmMntcl9mOqDJFkJyKAm5vxKV4Z3wLx5ippe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=wczmTP5mRu9Q317XJvLADN30/rapQ66Vfla6MIyrp18RHxIaKFeAT4+xr4zeIISQq
	 oGFMJr+2+heyZtd3YgKLMEbPMOBkiN6nQptq+2B3WvQQdXRhulos+pFiuVp2N5HV0E
	 R/sGhpELffEpxbJfvkejvFoaD/raChJoWGo0ojHfZai5Tsx0alQMNhUZCLI9vkuxhk
	 bydVjwohwSrac2NzoG9lrJDJvopGWUxlLRNkQXkvddB2aMgya3T0WlRKIWXa4wDEI7
	 HZLJQi923Fv3P0XSIH3QQXAQURvpmPmIcLeK26RbFEIANAizUGnltOaGFZMtREQYCV
	 tvc17ZeCQB7zw==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id y41so3622058pfw.12
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 20:36:16 -0700 (PDT)
X-Gm-Message-State: AOAM533KSJay3hTLXEtNrDndG/4or2iVgD2UFTjtXwxG6FV6R4MuJcYD
	R25kXdt0FKkJCWUp92dC+BA3O+Q6HO8dwWW/NkQ=
X-Google-Smtp-Source: ABdhPJwUO93A4rM+aSh1Xly4NyDaW5KDkFVzu77d9cJuQFpEQOKPBQtyfzCWZaOT5taGjU3JP75XcJ9pj9AegKGofJA=
X-Received: by 2002:a63:6989:0:b0:3c2:3c19:d661 with SMTP id
 e131-20020a636989000000b003c23c19d661mr23420542pgc.352.1652326575675; Wed, 11
 May 2022 20:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511164514.2741934-1-masahiroy@kernel.org>
 <20220511164514.2741934-2-masahiroy@kernel.org> <CAKwvOdkMqyssbZ9imYM8Re+NL4U1K2tYj37_1XUtmjj8LSt5GQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkMqyssbZ9imYM8Re+NL4U1K2tYj37_1XUtmjj8LSt5GQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 May 2022 12:35:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASToQxJsySjvpdkr_aHKBh1ZrECwswWpgCezDHcpRHVgQ@mail.gmail.com>
Message-ID: <CAK7LNASToQxJsySjvpdkr_aHKBh1ZrECwswWpgCezDHcpRHVgQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] modpost: split the section mismatch checks into section-check.c
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 7:31 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, May 11, 2022 at 9:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > -/* sections that we do not want to do full section mismatch check on */
> > -static const char *const section_white_list[] =
> > -{
> > -       ".comment*",
> > -       ".debug*",
> > -       ".cranges",             /* sh64 */
> > -       ".zdebug*",             /* Compressed debug sections. */
> > -       ".GCC.command.line",    /* record-gcc-switches */
> > -       ".mdebug*",        /* alpha, score, mips etc. */
> > -       ".pdr",            /* alpha, score, mips etc. */
> > -       ".stab*",
> > -       ".note*",
> > -       ".got*",
> > -       ".toc*",
> > -       ".xt.prop",                              /* xtensa */
> > -       ".xt.lit",         /* xtensa */
> > -       ".arcextmap*",                  /* arc */
> > -       ".gnu.linkonce.arcext*",        /* arc : modules */
> > -       ".cmem*",                       /* EZchip */
> > -       ".fmt_slot*",                   /* EZchip */
> > -       ".gnu.lto*",
> > -       ".discard.*",
> > -       NULL
> > -};
>
>
> > -/**
> > - * Whitelist to allow certain references to pass with no warning.
> > - *
> > - * Pattern 1:
> > - *   If a module parameter is declared __initdata and permissions=0
> > - *   then this is legal despite the warning generated.
> > - *   We cannot see value of permissions here, so just ignore
> > - *   this pattern.
> > - *   The pattern is identified by:
> > - *   tosec   = .init.data
> > - *   fromsec = .data*
> > - *   atsym   =__param*
> > - *
> > - * Pattern 1a:
> > - *   module_param_call() ops can refer to __init set function if permissions=0
> > - *   The pattern is identified by:
> > - *   tosec   = .init.text
> > - *   fromsec = .data*
> > - *   atsym   = __param_ops_*
> > - *
> > - * Pattern 2:
> > - *   Many drivers utilise a *driver container with references to
> > - *   add, remove, probe functions etc.
> > - *   the pattern is identified by:
> > - *   tosec   = init or exit section
> > - *   fromsec = data section
> > - *   atsym = *driver, *_template, *_sht, *_ops, *_probe,
> > - *           *probe_one, *_console, *_timer
> > - *
> > - * Pattern 3:
> > - *   Whitelist all references from .head.text to any init section
> > - *
> > - * Pattern 4:
> > - *   Some symbols belong to init section but still it is ok to reference
> > - *   these from non-init sections as these symbols don't have any memory
> > - *   allocated for them and symbol address and value are same. So even
> > - *   if init section is freed, its ok to reference those symbols.
> > - *   For ex. symbols marking the init section boundaries.
> > - *   This pattern is identified by
> > - *   refsymname = __init_begin, _sinittext, _einittext
> > - *
> > - * Pattern 5:
> > - *   GCC may optimize static inlines when fed constant arg(s) resulting
> > - *   in functions like cpumask_empty() -- generating an associated symbol
> > - *   cpumask_empty.constprop.3 that appears in the audit.  If the const that
> > - *   is passed in comes from __init, like say nmi_ipi_mask, we get a
> > - *   meaningless section warning.  May need to add isra symbols too...
> > - *   This pattern is identified by
> > - *   tosec   = init section
> > - *   fromsec = text section
> > - *   refsymname = *.constprop.*
> > - *
> > - * Pattern 6:
> > - *   Hide section mismatch warnings for ELF local symbols.  The goal
> > - *   is to eliminate false positive modpost warnings caused by
> > - *   compiler-generated ELF local symbol names such as ".LANCHOR1".
> > - *   Autogenerated symbol names bypass modpost's "Pattern 2"
> > - *   whitelisting, which relies on pattern-matching against symbol
> > - *   names to work.  (One situation where gcc can autogenerate ELF
> > - *   local symbols is when "-fsection-anchors" is used.)
> > - **/
>
> Losing the ability to git blame (from the top level) the above lines
> does cause me grief and mental anguish though. It's not gone, just
> buried a bit deeper.


According to 'man git-blame', -C option is needed
to follow the code move between files.

git blame -C  scripts/mod/section-check.c

showed me the origin commit of each line.





> --
> Thanks,
> ~Nick Desaulniers



--
Best Regards
Masahiro Yamada
