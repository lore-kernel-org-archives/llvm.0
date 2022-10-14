Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF52440C
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 20:22:15 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 29EKM2vT029714
	for <llvm@lists.linux.dev>; Sat, 15 Oct 2022 05:22:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 29EKM2vT029714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1665778923;
	bh=xTx+bgNXH/Fgx7SZvLDBVdxgS24swRdByi1EBKam2Hc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FZQ7snVQ6iMOMKybn2mSil3m6GbmknkNa9vVCbJ9JBrMoDuyN9JxhXYPwkS8rLDgQ
	 s19yFPMrWqZtKNotX61oV5QdxhJmFNzIC6E7dTQgM8O2vZMPpfKijEyYxjGC55Owg0
	 sNy+Dkf2B2sou0tUL7lrYOYaydsJAKKFQQ1xP+4VClFC9AGuxrWgIXYbrcH+CtPNGX
	 per2nB0phJEVR5CaCyIb0EQugX3mfnFuPV6iGonCTHKqy0VpsPUGMhfZRQfSN0Df8/
	 AR4mHpC6JA2StpKVskCvXajXh665tbQzNfkZK8oow6c2eEZQ2I4dKF7gFDK9X3meyX
	 VYp+da3MFcTyg==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1321a1e94b3so7189519fac.1
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:22:03 -0700 (PDT)
X-Gm-Message-State: ACrzQf1dnyK3Ks9hW15gHHGcIhcnFMEDx9o5HbRo0tPQUeDir5Ds/QLw
	eqjqMTOkMTFYvra25anO4c1P2f8822dAbAI6678=
X-Google-Smtp-Source: AMsMyM5aFsbnQKUW4y9cb4lYkQbkX9mQtUYqLaAZzaSl9w8cZteahvSQsCsznpp3h/tenXSLS44Ewr3Zkf9KGXY1RYQ=
X-Received: by 2002:a05:6870:8a09:b0:132:554d:2f3d with SMTP id
 p9-20020a0568708a0900b00132554d2f3dmr9384231oaq.194.1665778922129; Fri, 14
 Oct 2022 13:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012180118.331005-1-masahiroy@kernel.org> <Y0mIUW7Ozx9tseeG@dev-arch.thelio-3990X>
In-Reply-To: <Y0mIUW7Ozx9tseeG@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Oct 2022 05:21:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATzu2-1WshgtH6_VRes7x+YuQ0Ly7Tp33ALgsd3Cri-9w@mail.gmail.com>
Message-ID: <CAK7LNATzu2-1WshgtH6_VRes7x+YuQ0Ly7Tp33ALgsd3Cri-9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: move -Werror from KBUILD_CFLAGS to KBUILD_CPPFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 15, 2022 at 1:03 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Oct 13, 2022 at 03:01:17AM +0900, Masahiro Yamada wrote:
> > CONFIG_WERROR turns warnings into errors, which  happens only for *.c
> > files because -Werror is added to KBUILD_CFLAGS.
> >
> > Adding it to KBUILD_CPPFLAGS makes more sense because preprocessors
> > understand the -Werror option.
> >
> > For example, you can put a #warning directive in any preprocessed code.
> >
> >     warning: #warning "this is a warning message" [-Wcpp]
> >
> > If -Werror is added, it is promoted to an error.
> >
> >     error: #warning "this is a warning message" [-Werror=cpp]
> >
> > This commit moves -Werror to KBUILD_CPPFLAGS so it works in the same way
> > for *.c, *.S, *.lds.S or whatever needs preprocessing.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >
> > (no changes since v1)
> >
> >  Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 85a63a1d29b3..790760d26ea0 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -859,7 +859,8 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> >
> >  KBUILD_CFLAGS += $(stackp-flags-y)
> >
> > -KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
> > +KBUILD_CPPFLAGS-$(CONFIG_WERROR) += -Werror
> > +KBUILD_CPPFLAGS += $(KBUILD_CPPFLAGS-y)
> >  KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
> >
> >  KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
> > --
> > 2.34.1
> >
> >
>
> For what it's worth, this is going to break 32-bit ARM builds with clang
> plus the integrated assembler due to
> https://github.com/ClangBuiltLinux/linux/issues/1315:
>
> clang-16: error: argument unused during compilation: '-march=armv7-a' [-Werror,-Wunused-command-line-argument]
>
> Ultimately, I want -Wunused-command-line-argument to be an error anyways
> (https://github.com/ClangBuiltLinux/linux/issues/1587) but it would be
> nice to get these cleaned up before this goes in.
>
> Cheers,
> Nathan


OK, I will postpone this patch.
Thanks.



-- 
Best Regards
Masahiro Yamada
