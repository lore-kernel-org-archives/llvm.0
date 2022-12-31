Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F52903
	for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 15:16:18 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-03.nifty.com with ESMTP id 2BVF6irr032189
	for <llvm@lists.linux.dev>; Sun, 1 Jan 2023 00:06:44 +0900
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 2BVF6Oa9020455
	for <llvm@lists.linux.dev>; Sun, 1 Jan 2023 00:06:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2BVF6Oa9020455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1672499186;
	bh=cPtMT1ikPVY2628/xD0d9Qu971vGxgBBHmwX2fGx46Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qPAUxth/qw93T8XlinZlEZ+TtBTGrTRnuDsJdNUzVpdsp79Wj4a6z1A87z3mzozPt
	 0UquscrCLavkcY+JH7G9wbZgurvCypaS+DZC5LhcsESGmZy7EcSXSyUD9wv5C7d5yj
	 YtDFTO+wWVQ5GrXmObd4LFoaXqPX4u70KP8jc5f0pgnvS2mY/bZm+afIC8bD1lk2Ow
	 ViS+oB1EV39yLPK/1q1ouLVUexfkn37JJmyWNSBKK64z4tt+/YiR4kCb6PHaXT1XJX
	 dug5fLPI7Cv47T/mbXjN2okCfZbfOnMQSNrobrLFpaxPqf+OI4yNuFZO/rKCFz1zoo
	 DECTpZM+99qww==
X-Nifty-SrcIP: [209.85.167.45]
Received: by mail-lf1-f45.google.com with SMTP id cf42so35535449lfb.1
        for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 07:06:25 -0800 (PST)
X-Gm-Message-State: AFqh2koTHuwkmKyQByM3yHiyLg4XjERubmeIbbJfD9CVaOqbd4KEuznT
	FbfXEisc0YLRfHpy5/7xH0ObD7dJ+nLbmhGWRFg=
X-Google-Smtp-Source: AMrXdXtV2tGXh1jtska7YrD89aDiR/6tpAp7znMYCCa6K7MzJDPvlhi8f3ERlPs23u5zAoXo/qR0Ug1SeDa+LVKrW5E=
X-Received: by 2002:a05:6512:462:b0:4b5:706c:ab80 with SMTP id
 x2-20020a056512046200b004b5706cab80mr1681418lfd.226.1672499183563; Sat, 31
 Dec 2022 07:06:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org> <CANiq72m5E1MehfqdrkmJt43fAzUMc9kEKu7x4WaALdgDGJ30-g@mail.gmail.com>
In-Reply-To: <CANiq72m5E1MehfqdrkmJt43fAzUMc9kEKu7x4WaALdgDGJ30-g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Jan 2023 00:05:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOaLHizg24CrMUz7veX0fa0QYwgJzAi5tOT+-CDCmUzw@mail.gmail.com>
Message-ID: <CAK7LNAQOaLHizg24CrMUz7veX0fa0QYwgJzAi5tOT+-CDCmUzw@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: fix dep-file processing for rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 10:34 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Dec 31, 2022 at 7:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Masahiro Yamada (6):
> >   kbuild: specify output names separately for each emission type from
> >     rustc
> >   fixdep: parse Makefile more correctly to handle comments etc.
> >   kbuild: remove sed commands after rustc rules
> >   fixdep: refactor hash table lookup
> >   fixdep: avoid parsing the same file over again
> >   fixdep: do not parse *.so, *.rmeta, *.rlib
>
> These cleanups are great, and it is a pleasure to see proper
> integration with `fixdep` -- thanks a ton! :)
>
> Will you want to take them through the kbuild tree? (I guess so, given
> the bulk of it is on `fixdep`)


Yes, my plan is to get it in the kbuild tree with your ack.




> Cheers,
> Miguel



-- 
Best Regards
Masahiro Yamada
