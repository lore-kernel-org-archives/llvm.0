Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70572
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 08:45:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MS3rB-1mPlfI085L-00TRTt for <llvm@lists.linux.dev>; Wed, 29 Sep 2021
 10:45:51 +0200
Received: by mail-wm1-f48.google.com with SMTP id c73-20020a1c9a4c000000b0030d040bb895so1141811wme.2
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 01:45:50 -0700 (PDT)
X-Gm-Message-State: AOAM532gpZgdc4Jow3cnzYyp9sxDGwdecJKdxfuu9ZtyGucGI3r3IJ7T
	34DW9WEkGl1zdBqACGDMJ/Z+dZ+fcYDXZt2f4mY=
X-Google-Smtp-Source: ABdhPJzqCwKl127cz2QAIug9k52aEJ4YFVJl10H5ExaqWrNYDMbabj08uEdj8WGiI+vahIxKZLPvws0pQjSbmc21pfc=
X-Received: by 2002:a05:600c:22d4:: with SMTP id 20mr9258111wmg.82.1632905150672;
 Wed, 29 Sep 2021 01:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210928154143.2106903-1-arnd@kernel.org> <20210928154143.2106903-2-arnd@kernel.org>
 <CAK8P3a2mrVOXHzNKnLuHsdNCR3uVePE9W-Yn2CmW3nDpE8J7iA@mail.gmail.com>
In-Reply-To: <CAK8P3a2mrVOXHzNKnLuHsdNCR3uVePE9W-Yn2CmW3nDpE8J7iA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Sep 2021 10:45:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Mxmqj7t4TtYjzae-iCRPs2YtVMR=7v1vvUG-ixuKAtw@mail.gmail.com>
Message-ID: <CAK8P3a3Mxmqj7t4TtYjzae-iCRPs2YtVMR=7v1vvUG-ixuKAtw@mail.gmail.com>
Subject: Re: [PATCH 01/14] ARM: RiscPC needs older gcc version
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AJd6gu8IuiyomzdvOGNAK5EMbwiN65A5mbDN0O0vsIxiQQzDGai
 o0S1x3hyjurj5BjjSQOO6HZ7sSTR6VSVYsoG22duzq5QbDIAMp4gZQCoZaWRtS8V67zYV3x
 M0udDjKPKuSAS02lJEApy40K5CSqGSV8+LbGHbftY0/OysawCP/zZpsaB0UJ0nOYsGhbnDn
 vZ/yfGFIgtyZQJyTac0yQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:992ZU6V5WOA=:Tvhh3hokRVJ6nUQXVRPf6y
 CCbAIpZYs4DFkri3W0bOSJc2VwwCXxKuYLsUCHTLPTYs6ysQaVzQ9oqkRwWy0eS4Joqe/53Wv
 OMHIdqbUC/nECBuQCqqPU0oRuDs13HgXY6fYrd9xGFySi/SNSsv7YWdg+SHrvXEExmy7fNjYr
 2tXyR0e1GPQ1+3I3EsdVYyybxXtEzPh5glXpNJTWPIlWKeJ2U3ORBnwdAU6BFkeYu6t6KGj8h
 W7tLEsXqm5i2/dx45LiQSkHmfeqxyvviFS9RDWQpRTt53oqBjDCNf9E0PP1ukGiaWrUgOHswV
 AxGkHZyCbMLCUtInuXrFjPN/rDNpyjym/Yn7hmQ9vqb1LuPQunOyNScDY3C+Fi67rc4q/c7Be
 ndvdGWCPrp1VLNAC0q0GnsnyXsGLMXzf1LhwOAu6szMWJLIitdy8nwvA3PyzHyM8RyDXurhk9
 wVWlQh7z1Ew9va9lJZPZflIePYAOsZDIxJ2hQzuGb5Ha/2pzG4aDJlmbPtwnY+nxdTk/yo1Yw
 pJn0nFZwosgW83GF6WxNvUJcleQZ0lfPXn1rZEwifLQK0G3xtZY+qyrOOOUitDWd6hp7gj5HF
 xoh63bHR9jobp1Q6xfoAIk+b/EKcaLmBD3oTTBcWTkF42+n7MvrymWzeqcXUoX8qh97iEcLMm
 7KOdDBDndYfMG79IM+kOBOtOnK1PW37YFrOk5W2J+BM+v8+AhSQGUKzJmDeqqoxY23v/sCnkx
 FqPO995HF42dg0HC/x0dxFsGpldzvjf7LM2XKg==

On Tue, Sep 28, 2021 at 6:03 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 28, 2021 at 5:42 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index fc196421b2ce..12a0bd4b315d 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -431,7 +431,7 @@ config ARCH_PXA
> >
> >  config ARCH_RPC
> >         bool "RiscPC"
> > -       depends on MMU
>
> This line was a botched rebase, it obviously has to stay here.
>
> > +       depends on !CC_IS_CLANG || GCC_VERSION < 90100

This line is also wrong, it needs to be '&&', not '||'.

        Arnd
