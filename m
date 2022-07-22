Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63415A5
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 04:24:28 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-01.nifty.com with ESMTP id 26M4IfAY019183
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 13:18:41 +0900
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 26M4IWNp027255
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 13:18:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 26M4IWNp027255
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658463514;
	bh=Ok0nOaP8oSs4IsxJgNmxPBZo8Rj007X6d6MNVegX7o4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LILVG5vXh/gx1pg20dkI23AA+joRtwJIvR4opJPw/Wl4OavC6gbljUAo7XGEum154
	 eyJbT0ofZkTI7qVX1hRJA3UtEV/EkZdIktTXJWX2a0tk3xEWx0NbjsLnqNtI5UINfp
	 DDNS/gycvdXIlucqTcYJeIBYDweRCLmfyBE2JylmXLhHqKGR8Jb0lusuOgMronzbIf
	 CBEIKc7irOCA0pQctVPNnaoqcuOkFDkSmDwWq7ae8IjOTWuG8JhQkAjD6JEirK033l
	 YoIMiEAZcdOFje7hcyI4ij5QJRp1dWSceBg1r9Wnzcd2CE/YHp+a1Cmv47aKps8f8+
	 SOyrOumC9zAxg==
X-Nifty-SrcIP: [209.85.221.43]
Received: by mail-wr1-f43.google.com with SMTP id d8so4868027wrp.6
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:18:33 -0700 (PDT)
X-Gm-Message-State: AJIora8KMBb1bHx42WAPD0/Wee4b0+/fpURacH7ewkczpnyfgjQ+e0kh
	GCpQKOAP7GaNiEzoO52jSzIy61SfsItGdU3PeR8=
X-Google-Smtp-Source: AGRyM1u5nfm43QHHmAHAOm+9cxM7c8Tn1/hWbXKtPajhve+bG846G4KjqKggTUGEwubKaGd3M8kNT3hnvqT8ZbqPwlg=
X-Received: by 2002:adf:d1e2:0:b0:21d:d40b:d816 with SMTP id
 g2-20020adfd1e2000000b0021dd40bd816mr953262wrd.682.1658463512097; Thu, 21 Jul
 2022 21:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720232332.2720091-1-justinstitt@google.com>
 <CAKwvOdnSjyOdCZZ9AegCyfns3bvH3fbtbVgdThO2+rJAE=1bag@mail.gmail.com> <YtlsY2A2ZWK97Y8O@dev-arch.thelio-3990X>
In-Reply-To: <YtlsY2A2ZWK97Y8O@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 22 Jul 2022 13:17:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASi_yrPhf0wv+0nqRcNhhbwUn-PzHvuiV2W1EsTqd_D8Q@mail.gmail.com>
Message-ID: <CAK7LNASi_yrPhf0wv+0nqRcNhhbwUn-PzHvuiV2W1EsTqd_D8Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 12:10 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 07:27:34AM -0700, Nick Desaulniers wrote:
> > On Wed, Jul 20, 2022 at 4:23 PM Justin Stitt <justinstitt@google.com> wrote:
> > >
> > > There's been an ongoing mission to re-enable the -Wformat warning for
> > > Clang. A previous attempt at enabling the warning showed that there were
> > > many instances of this warning throughout the codebase. The sheer amount
> > > of these warnings really polluted builds and thus -Wno-format was added
> > > to _temporarily_ toggle them off.
> > >
> > > After many patches the warning has largely been eradicated for x86,
> > > x86_64, arm, and arm64 on a variety of configs. The time to enable the
> > > warning has never been better as it seems for the first time we are
> > > ahead of them and can now solve them as they appear rather than tackling
> > > from a backlog.
> > >
> > > As to the root cause of this large backlog of warnings, Clang seems to
> > > pickup on some more nuanced cases of format warnings caused by implicit
> > > integer conversion as well as default argument promotions from
> > > printf-like functions.
> > >
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > > Previous attempt: (https://patchwork.kernel.org/project/linux-kbuild/patch/20190201210853.244043-1-jflat@chromium.org/)
> > >
> > > Note:
> > > For this patch to land on its feet, the plethora of supporting patches that
> > > fixed various -Wformat warnings need to be picked up. Thanfully, a lot
> > > of them have!
> > >
> > > Here are the patches still waiting to be picked up:
> > > * https://lore.kernel.org/all/20220718230626.1029318-1-justinstitt@google.com/
> > > * https://lore.kernel.org/all/20220711222919.2043613-1-justinstitt@google.com/
> >
> > Hi Masahiro, Nathan, and Tom,
> > What are your thoughts for _when_ in the release cycle this should be
> > picked up?  I worry that if we don't remove this soon, we will
> > backslide, and more -Wformat issues will crop up making removing this
> > in the future like digging in sand.  Justin has chased down many
> > instances of this warning, and I'm happy to help clean up fallout from
> > landing this.
>
> Let me do a series of builds with the two patches above against
> next-20220721 to see if there are any instances of this warning across
> the less frequently tested architectures then I will review/ack this.
>
> I don't think we need to worry much about backslide, as -Wformat is
> enabled with W=1, which the 0day folks already test with, so new
> instances of this warning should get reported to the authors when they
> are introduced so they can be fixed immediately. However, I would still
> like to see this applied sooner rather than later, although I would also
> like us to be completely warning clean before doing so, especially with
> -Werror now being selected with all{mod,yes}config. -rc8 is this Sunday
> and final should be July 31st so I think this could be applied at some
> point between those two dates then maybe sent to Linus for a late pull
> request once all other trees have been merged but that is ultimately up
> to Masahiro.

OK, I think that will be good timing.
Please ping me if I forget to pick it up.

I still worry about my pull request being rejected.





>
> Cheers,
> Nathan
>
> > >
> > >  scripts/Makefile.extrawarn | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > index f5f0d6f09053..9bbaf7112a9b 100644
> > > --- a/scripts/Makefile.extrawarn
> > > +++ b/scripts/Makefile.extrawarn
> > > @@ -47,7 +47,6 @@ else
> > >
> > >  ifdef CONFIG_CC_IS_CLANG
> > >  KBUILD_CFLAGS += -Wno-initializer-overrides
> > > -KBUILD_CFLAGS += -Wno-format
> > >  KBUILD_CFLAGS += -Wno-sign-compare
> > >  KBUILD_CFLAGS += -Wno-format-zero-length
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
> > > --
> > > 2.37.0.170.g444d1eabd0-goog
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
