Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D692C80
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 00:57:36 +0000 (UTC)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-01.nifty.com with ESMTP id 1AF0jZXA018307
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 09:45:35 +0900
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 1AF0jIHG012162
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 09:45:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1AF0jIHG012162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1636937119;
	bh=BDNnbaPpJe9BFpTF3r+8GF3xHfpNb7Yh5VjSBgkHV7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=0ZGrm5Lg7gKubut7sXV5iBfmPyxcROMnjS7+iIs/wt9Bfr5RGs/MNHsa5wqzKsGya
	 J2q7Bsyor2xchNq0VmFXXge1srTRSevsOzlBib7Z7leRF3Vh+K9e9b4i73aoYYEdk3
	 k3HnloWDCW32tlame2Si8rlqo/yMLXu4Cc5fIrGWrm8fJFPmXqkJIJO3CVcnvB7MwP
	 h34zGnaF9akRmiBegTmZlkfeXz3mNTGVo16YzWtg/K4Se+kgZ9jb/bTNkjiAeZdL+l
	 /tpSwvb+Xe0nRVShaGWxt8ToHLzidLz0S9nqcvL4JJGXrW+tymPgkNocIHeqJzWSas
	 V3b6eVjFoWuzw==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso12526047pjb.0
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 16:45:19 -0800 (PST)
X-Gm-Message-State: AOAM531C7CQBCBw8Is/cFfGosS47AgTRDSSZYiSmM1Ja6KoTvovtnjqQ
	t9cMi2Q+kYEdjJqg/vQb6SBy8zwJ3Ns+S6MkcHw=
X-Google-Smtp-Source: ABdhPJzWlxO7tKAeGWWpBEW4aiEsR5LQzVCSj/YBcTFH7giCKfYIodz+oMBYesYnkGQiojEt0qH4HiwLi0pWQY671vs=
X-Received: by 2002:a17:90a:ce02:: with SMTP id f2mr40937817pju.77.1636937118368;
 Sun, 14 Nov 2021 16:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211114005725.GA27075@embeddedor> <YZF9MY6rRLQwdTgM@archlinux-ax161>
 <YZGnL3nfA5876hX3@archlinux-ax161> <20211115003501.GA43686@embeddedor>
In-Reply-To: <20211115003501.GA43686@embeddedor>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Nov 2021 09:44:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQY4Y-wnY8wQOuHh5eyVdUBGGP58Uu2aZSe+zdxt7km-A@mail.gmail.com>
Message-ID: <CAK7LNAQY4Y-wnY8wQOuHh5eyVdUBGGP58Uu2aZSe+zdxt7km-A@mail.gmail.com>
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

On Mon, Nov 15, 2021 at 9:30 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Sun, Nov 14, 2021 at 05:17:51PM -0700, Nathan Chancellor wrote:
> > On Sun, Nov 14, 2021 at 02:18:41PM -0700, Nathan Chancellor wrote:
> > > On Sat, Nov 13, 2021 at 06:57:25PM -0600, Gustavo A. R. Silva wrote:
> > > > Add Kconfig support for -Wimplicit-fallthrough for both GCC and Clang.
> > > >
> > > > The compiler option is under configuration CC_IMPLICIT_FALLTHROUGH,
> > > > which is enabled by default.
> > > >
> > > > Special thanks to Nathan Chancellor who fixed the Clang bug[1][2]. This
> > > > bugfix only appears in Clang 14.0.0, so older versions still contain
> > > > the bug and -Wimplicit-fallthrough won't be enabled for them, for now.
> > > >
> > > > This concludes a long journey and now we are finally getting rid
> > > > of the unintentional fallthrough bug-class in the kernel, entirely. :)
> > > >
> > > > [1] https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
> > > > [2] https://bugs.llvm.org/show_bug.cgi?id=51094
> > > >
> > > > Link: https://github.com/KSPP/linux/issues/115
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/236
> > > > Co-developed-by: Kees Cook <keescook@chromium.org>
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > Co-developed-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > > Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > >
> > > This appears to do the right thing with both clang-13 and clang-14.
> >
> > Now that I gave this a look for the GCC side, I think it is wrong.
> >
> > -Wimplicit-fallthrough=5 was under cc-option because it was only
> > available in GCC 7.x and newer so the build is now broken for GCC 5.x
> > and 6.x:
> >
> > gcc: error: unrecognized command line option '-Wimplicit-fallthrough=5';
> > did you mean '-Wno-fallthrough'?
>
> I'll send a patch for this right away. Thanks for the report, Nathan! :)


Please use a subject prefix different than "kconfig:"

I want to see "kconfig:' only for changes in scripts/kconfig/.



--
Best Regards
Masahiro Yamada
