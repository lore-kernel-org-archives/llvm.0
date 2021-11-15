Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2042C80
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 02:26:02 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-10.nifty.com with ESMTP id 1AF2HrgB026145
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 11:17:53 +0900
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 1AF2HPYC027275
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 11:17:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1AF2HPYC027275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1636942646;
	bh=zc50JpZynEpA7OOKlhPwk+0GNvGQo8rHuZdBYL+q53Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=khxVupkACbDQr76B6w9wiQ1s+K0FCF4Lqnd2fP/hjHTWjVfU0tClKPa/WjrnTx7M8
	 nVewtUDY6fTLqtj3Oef5giEIlQICZaLAqN9iiBhTUUooDNjp3BIdjDNQp0oVZJDRFn
	 ktnJfJpHp4w4Q9cnGBkhOX/XMsB6T5BE2NBU8tGDABlP1yKcQUIQsIiE7wvEeM2TNj
	 v1caQp7Cl88Fb+1DkvzRLYV8aoShj6ZvOQNRekbUOGTCgUhgGz9lGw57ycGmL7rBLG
	 GpZvWJ9klcwAOMmgauw4kWv3KQLxffXj8Lb/DzHuUPO/4hvhyKylOAiBRBy2LzGlZQ
	 vBf+9+NC6A3qA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so11746449pjb.5
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 18:17:25 -0800 (PST)
X-Gm-Message-State: AOAM5306EtdMz85ZNcK5jdnY30PSrhQOTdoPbUATGIW56EMEMjVDs7Dj
	cOiBGDL9va8HQSsL/PAT6GREQsYD3/tL+r3MTzo=
X-Google-Smtp-Source: ABdhPJyFikcVi3ql5mZhpThJGUWZwvtHlezWtB27iVfwekznHJ1Oq05ojyhxuOyrcGZmIXNqJDJhl7JPd/gM3LprToM=
X-Received: by 2002:a17:902:c7d5:b0:143:72b7:2ca5 with SMTP id
 r21-20020a170902c7d500b0014372b72ca5mr31119559pla.20.1636942645141; Sun, 14
 Nov 2021 18:17:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211114005725.GA27075@embeddedor> <YZF9MY6rRLQwdTgM@archlinux-ax161>
 <YZGnL3nfA5876hX3@archlinux-ax161> <20211115003501.GA43686@embeddedor>
 <CAK7LNAQY4Y-wnY8wQOuHh5eyVdUBGGP58Uu2aZSe+zdxt7km-A@mail.gmail.com> <20211115010001.GA44147@embeddedor>
In-Reply-To: <20211115010001.GA44147@embeddedor>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Nov 2021 11:16:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOWJgoSqUgyrz3QLKjw9uj=PXcKEH7AOrwmNA9jNpVGw@mail.gmail.com>
Message-ID: <CAK7LNASOWJgoSqUgyrz3QLKjw9uj=PXcKEH7AOrwmNA9jNpVGw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 15, 2021 at 9:54 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Mon, Nov 15, 2021 at 09:44:40AM +0900, Masahiro Yamada wrote:
> > On Mon, Nov 15, 2021 at 9:30 AM Gustavo A. R. Silva
> > <gustavoars@kernel.org> wrote:
> > >
> >
> > Please use a subject prefix different than "kconfig:"
> >
> > I want to see "kconfig:' only for changes in scripts/kconfig/.
>
> How about kbuild for this case, instead?

Sounds good to me.



-- 
Best Regards
Masahiro Yamada
