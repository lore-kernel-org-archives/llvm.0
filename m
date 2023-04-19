Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A83320C
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 23:01:57 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-517bfdf55c3so204644a12.2
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 16:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681945317; x=1684537317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5FZbEuLPEba8rPcluAsC6ixzhvfsFfoHO9sfW3zN38=;
        b=uB33jRMOsh8Ag9+IcRCZ0dL69lg9NphJA+0ZiNUtp2TXceT9w54VIrahIW+5XA+sgv
         cLtSa1GE68NCl2nBzHAE1T2bO0DNRyg/CFDwkwR1Klb5h3YYVgu4XWGmZaLvoJyQFW+P
         Evqesc0TTUu8L0cD0MO1jbrG3h729UiKPor5klzZD8fKhMSuWoheOgLa7CKtTi7n3oYP
         c4H+84dToBUEdtLKLkvCCDSy1UT+BtfBg9AeM7hAmoFoYxjVNz9CFb4fylh83YZ39RQz
         Zs1lWDZ9PNLRh1p/ne5Q+BH7flgtKX+HYe+ieSIX2eSdYZmIGH5ne9gqpt5xdSzIwnPS
         FPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681945317; x=1684537317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5FZbEuLPEba8rPcluAsC6ixzhvfsFfoHO9sfW3zN38=;
        b=h09x8WQ3M4hcys03oZzK41gfOHFf5mZHHE+MNGJLozRdVFR77gGUBEqZWdLmHRLLN6
         eOOs4CGBXqHmB9OTvoGDG2BVmHkceDcgJMVwmkuJBhknwUng5PyV5DwDBOuK5Lw7IKQL
         ZepkyChiMAxPEhnCyZUpqWgSxR+FDOeevy86mOABB0AFrsi4Jv0Y84/B5mZ5FS19M92z
         IoCqENU+DUCMwpAUmz5XuFGAeZ48rRWEyOXVD7OPQLkxjgwlqh3mDqbbDbNZRZxBFgr2
         KSdrlxQ4tf1xWQHwDOvrctjBDSxUCGAZ0uGeoOmgy/H+oY1sHWw2cem5fwEp/6dQu625
         7peQ==
X-Gm-Message-State: AAQBX9eEUlclrnFEnT9H0Mnd42l63xRi0fZQIonBvpmK/qcVwVfYz4LQ
	diLG+ltKowAymfQ5j9V2ziFTWYG6n13V5yybYNoccA==
X-Google-Smtp-Source: AKy350Z07sfMiUFpEccZ3g5+kPuYI4IuMUqzBNmCLDqLSpQ+Oz8wKiBFnopdr2eveirWFgBMhzi0xVHY4pu5kn0GVTU=
X-Received: by 2002:a17:90b:3b46:b0:237:97a3:1479 with SMTP id
 ot6-20020a17090b3b4600b0023797a31479mr4401121pjb.28.1681945317258; Wed, 19
 Apr 2023 16:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-3-jiaxun.yang@flygoat.com> <20230418130823.GA12456@alpha.franken.de>
In-Reply-To: <20230418130823.GA12456@alpha.franken.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 16:01:45 -0700
Message-ID: <CAKwvOd=ye9jA0-3QRpD76waZCSX=ayFeE2ZNAPPM-fLdyCq1FQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] MIPS: Add toolchain feature dependency for
 microMIPS smartMIPS
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, Borislav Petkov <bp@alien8.de>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 6:13=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Apr 14, 2023 at 09:06:56AM +0100, Jiaxun Yang wrote:
> > microMIPS smartMIPS kernel can only be compiled if they are supported
> > by toolchain.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Question: won't the lack of this (patch and rest of the series) hurt
our ability to test randconfig builds of ARCH=3Dmips with clang? See
also the 0day report from Boris:
https://lore.kernel.org/llvm/202304170748.Fg9VIgGd-lkp@intel.com/

i.e. randconfig will continue to select options that can't be built yet.

> > ---
> >  arch/mips/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 41ac4dc5aae4..0b270562c3eb 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -2360,7 +2360,7 @@ config CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS
> >         Select this if you want neither microMIPS nor SmartMIPS support
> >
> >  config CPU_HAS_SMARTMIPS
> > -     depends on SYS_SUPPORTS_SMARTMIPS
> > +     depends on SYS_SUPPORTS_SMARTMIPS && CC_HAS_SMARTMIPS
> >       bool "SmartMIPS"
> >       help
> >         SmartMIPS is a extension of the MIPS32 architecture aimed at
> > @@ -2373,6 +2373,7 @@ config CPU_HAS_SMARTMIPS
> >
> >  config CPU_MICROMIPS
> >       depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
> > +     depends on CC_HAS_MICROMIPS
> >       bool "microMIPS"
> >       help
> >         When this option is enabled the kernel will be built using the
>
> hmm, with this change the options will silently be dropped. I prefer
> the error message, that the compiler doesn't support what is configured.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]



--=20
Thanks,
~Nick Desaulniers
