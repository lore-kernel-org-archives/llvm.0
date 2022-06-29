Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A17A
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 03:00:19 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-01.nifty.com with ESMTP id 25T2kDL6009778
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 11:46:13 +0900
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 25T2jrdJ006246
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 11:45:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 25T2jrdJ006246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1656470754;
	bh=XuRRlV6DEIohD5LwyniED6YKhD1PNvGzty9vC0eaPEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VYAeGbpN0CHJ3SntlK30JJguH7UZgMetFseKlwixXVAtSheRMEWSXpvDkL8IelisQ
	 LdwoNEp/cFLNJgaf4gQkv8iky9sJ5ys8hxmwgHk8P1QCsvKjjGnDmIWWGZOsuXf/tG
	 0wcuFLlP1inhBeS9khIDdraktlpREvr1aK51UPcpZicgCh5oZLN4FOW7pMy0Vd92cl
	 c0fviKw44cIAL8FZklxksUC57eV9sj3AOVj1wq3RqwtN48pIqLgN2AfrGBGz3unn4g
	 FfSZD6sauc6zbW1V/m5pkYgy+YdDqlPTybETtea2cLazk9ALfc9GJaj5/KSF/MLQzX
	 icyZn4KrxmsFg==
X-Nifty-SrcIP: [209.85.128.52]
Received: by mail-wm1-f52.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so6143617wmi.0
        for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 19:45:53 -0700 (PDT)
X-Gm-Message-State: AJIora/e6qT/yqf2yAaV43a8xzamNvixR5G7A0AeNISpIN9BwchzoCJv
	g5OTPWAsN4IzYPFMooZ0sX8ht0XcA+8IynYW8RQ=
X-Google-Smtp-Source: AGRyM1ut30owDvv4LD+D7QwQ8t9dPthCnosocOkLOBSLKfdzxyW9Jyt0o7WQIGA8+R3aSMTrPRKuJ+0eutSDqouMbyo=
X-Received: by 2002:a1c:6a06:0:b0:3a0:5099:f849 with SMTP id
 f6-20020a1c6a06000000b003a05099f849mr2804764wmc.14.1656470752486; Tue, 28 Jun
 2022 19:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628012353.13995-1-jhubbard@nvidia.com> <CAKwvOd=FmKYse9NEvMt5MHev5wRzeZH6AcBd1uQEL5k0GLP+Zw@mail.gmail.com>
In-Reply-To: <CAKwvOd=FmKYse9NEvMt5MHev5wRzeZH6AcBd1uQEL5k0GLP+Zw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 Jun 2022 11:45:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5cmfAvZWy-QrrrBZcOoHwcuRO=JY9SUgBGbOxv=Kt5A@mail.gmail.com>
Message-ID: <CAK7LNAT5cmfAvZWy-QrrrBZcOoHwcuRO=JY9SUgBGbOxv=Kt5A@mail.gmail.com>
Subject: Re: [PATCH v3] gen_compile_commands: handle multiple lines per .mod file
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 29, 2022 at 3:45 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jun 27, 2022 at 6:24 PM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > scripts/clang-tools/gen_compile_commands.py incorrectly assumes that
> > each .mod file only contains one line. That assumption was correct when
> > the script was originally created, but commit 9413e7640564 ("kbuild:
> > split the second line of *.mod into *.usyms") changed the .mod file
> > format so that there is one entry per line, and potentially many lines.
> >
> > The problem can be reproduced by using Kbuild to generate
> > compile_commands.json, like this:
> >
> >     make CC=clang compile_commands.json
> >
> > In many cases, the problem might be overlooked because many subsystems
> > only have one line anyway. However, in some subsystems (Nouveau, with
> > 762 entries, is a notable example) it results in skipping most of the
> > subsystem.
> >
> > Fix this by fully processing each .mod file.
> >
> > Fixes: 9413e7640564 ("kbuild: split the second line of *.mod into *.usyms")
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks for the fix, John!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>



Applied to linux-kbuild/fixes with Nick's reviewed-by.
Thanks.


-- 
Best Regards
Masahiro Yamada
