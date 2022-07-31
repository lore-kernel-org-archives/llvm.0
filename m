Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF123C2
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 11:57:24 +0000 (UTC)
Received: from mail-ed1-f49.google.com ([209.85.208.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MkprN-1nb2Rp1zqh-00mICO for <llvm@lists.linux.dev>; Sun, 31 Jul 2022
 13:57:22 +0200
Received: by mail-ed1-f49.google.com with SMTP id z22so10573226edd.6
        for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 04:57:22 -0700 (PDT)
X-Gm-Message-State: AJIora8a8MSEnp2Kuy3v5HtwCVLe2r1C8bbj79nzUckS5KY8Tzi10K0b
	GZB7LizxCdiTc4nJdt1D7zXizsadedwcx//TgXQ=
X-Google-Smtp-Source: AGRyM1vWnVzNPGTYYKMFljKbMOkRuANrNVYPj/sNGBRkWy0kMcRFDGfljdBT6ATgKkO1cE2ueAeaMi4yAbWyRgy+QnY=
X-Received: by 2002:a05:6402:28c4:b0:43a:cdde:e047 with SMTP id
 ef4-20020a05640228c400b0043acddee047mr11533009edb.368.1659268642018; Sun, 31
 Jul 2022 04:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmPNCUXqKBoLCpwBA90ocZA6-u+=y1_jz=3C+KwEmN54AA@mail.gmail.com>
 <YuLqQrKtDnTuJdZK@dev-arch.thelio-3990X>
In-Reply-To: <YuLqQrKtDnTuJdZK@dev-arch.thelio-3990X>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 31 Jul 2022 13:57:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a341-H8uo9oABQCeRvhmKDs5eBwTGxsuZhO6Pt+WD8v6Q@mail.gmail.com>
Message-ID: <CAK8P3a341-H8uo9oABQCeRvhmKDs5eBwTGxsuZhO6Pt+WD8v6Q@mail.gmail.com>
Subject: Re: arm ixp4xx_defconfig build failure with linux-next and mainline
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6QA9vl1ndrwrx3PR+SG5adgxklDjmR/a+kwXhMvkKWf+P4USN6E
 2BkxC3CK43UVMmJ6NSetY5NVj6YFGNto9KktTwAHm4j4fLo1Q3KYpS1iQLV4Xn6Xt8D+uvo
 hF0SqG3PhoUgwRHOWVjA7bURO+XtJSRO48H/ALrK0XnlsLZVFtoaB5WAfwmkm6axq6I/0X2
 6//yPghf+PIqwUJuCFZ5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JjWZMcgx9qg=:N2cE/WwatFZXH29iRLHt5j
 5uf4SoFoFsTYWafkgfvjATLgYFieq/rLEJvh0akvXvRgeD7tXac0wnF7mT9FeDOoTCTMAZqxQ
 ysE2nVtHkMXlQzwF5HhJW8r83+8QAVZ78It5y0PXyQXC02XGTWUFuUK+dcfX0FSFFbtbJ0/WN
 0FboMJ2GNTReeXI57G+n5sdSTlYXtihHulipmGmbrcNhaWHK4YNbi8BNd53QwhogOvavl1r1D
 27bx4SyTRvtVQLzGplJoBmvUJBGyK1l9n2py/Jqoj9JvLP5xWpYT5X0eSygikIlKNSsKCDxG3
 5pHoj+Fv9Y0iiAQPUnDjukyCHeSn92cl96OvF2aPFFQVA4SFpPY+DRYizkVtRcAiAXmHlmILV
 1yYRz69pJtaEC8CLAv/oLf2EVZBxSnnMte9bEikUPev9Ij+S4+0/NMoKFspuqw0/Hl0kt1VNn
 bEQ+c7rUUtvP8kMWFg5tqHpMM+7gC6m1dMiuq60PCHKIjnley5+F1ib73C0MYkhZtsbH8HUj6
 7L4gKZ1bmqhxfRO96T2UtCukqVnVdfF3PPy7VGddggaqQN/3zAYeIAh+WlPlRETLiLmfZ2wwT
 5Rkmsl68lANlWd7dWhhw++sbCuxdPsvllmaIFdeAPxZvPJZmZZ2BgUhEPN79AHe9xhp65qUAS
 KnadMOe94VsO2iuQKSMzoHss5WkFWd2rPZPr6lqfOShnl95ZA3/GMXFCBedcExiuat8DhyF1C
 BVYUZFX90IskoG5Lb1db9/Eq99NsEoahf9tgtasxBoNVPPK631CNeKVJp71fCE71t/ac6mHR1
 V5SXSOI10L74xyzbXWeku19dxpjsxJyJsyxsm6kb7hVsenDa0gn0UbJEGB3+wqBrk8RNEln/n
 B6bMn52Es24+XsAaoVnw==

On Thu, Jul 28, 2022 at 9:57 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jul 28, 2022 at 06:33:07PM +0100, Sudip Mukherjee wrote:
> > Hi All,
> >
> > Not sure if its reported, builds of arm ixp4xx_defconfig has been
> > failing with clang with the error:
> >
> > <instantiation>:1:10: error: invalid hexadecimal number
> > ldr r7, =0x
> >          ^
> > arch/arm/kernel/head.S:319:2: note: while in macro instantiation
> >  addruart r7, r3, r0
> >  ^
> > <instantiation>:2:12: error: invalid hexadecimal number
> >   ldr r3, =0x
> >            ^
> > arch/arm/kernel/head.S:319:2: note: while in macro instantiation
> >  addruart r7, r3, r0
> >
> >
> > I tried to find it in the issue tracker but could not find it.
>
> Thanks for the report! We have not tested all of the configs in
> arch/arm/configs so I am not surprised to find one that has an error.
>
> I see multiple definitions of addruart. If I preprocess
> arch/arm/kernel/head.S with this configuration, I see it comes from
> arch/arm/include/debug/8250.S:
>
>                 .macro  addruart, rp, rv, tmp
>                 ldr     \rp, =CONFIG_DEBUG_UART_PHYS
>                 ldr     \rv, =CONFIG_DEBUG_UART_VIRT
>                 .endm
>
> CONFIG_DEBUG_UART_PHYS and CONFIG_DEBUG_UART_VIRT are both empty for
> this configuration with LLVM=1:
>
> $ make -skj"$(nproc)" ARCH=arm LLVM=1 ixp4xx_defconfig
>
> $ rg "CONFIG_DEBUG_UART_(PHYS|VIRT)=" .config
> 3036:CONFIG_DEBUG_UART_PHYS=
> 3037:CONFIG_DEBUG_UART_VIRT=

I had a patch for this a long time ago, to ensure that there is always
some default value for these. I wonder if we are just missing something
in the long list of defaults.

Which option is the one that gets selected in the 'choice' statement
below CONFIG_DEBUG_LL in this config?

> Looking at arch/arm/Kconfig.debug, I see:
>
> config DEBUG_UART_PHYS
> ...
>         default 0xc8000000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
>         default 0xc8000003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
> ...
>
> config DEBUG_UART_VIRT
> ...
>         default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
>         default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
> ...
>
> Digging further, I don't see how this configuration can work with
> LD=ld.lld (implied by LLVM=1). Commit 5d6f52671e76 ("ARM: rework
> endianess selection") made it so that CONFIG_ARCH_IXP4XX cannot be
> selected without CONFIG_CPU_BIG_ENDIAN due to the "depends" but
> CONFIG_CPU_BIG_ENDIAN in turn cannot be selected with LD=ld.lld due to
> commit 28187dc8ebd9 ("ARM: 9025/1: Kconfig: CPU_BIG_ENDIAN depends on
> !LD_IS_LLD"), meaning that none of these "default" statements can
> trigger.
>
> I see two solutions for the immediate future (I've CC'd Arnd in case he
> has any thoughts):
>
> * Use LD=arm-linux-gnueabi-ld (or whatever your triple is) with this
>   configuration if you want to keep testing it.
>
> * Don't build this configuration altogether.

Right, these are both good options. In the long run, we probably
want the second one if this is the only thing that can build with
clang but not lld.

> Maybe we could hack up a sane default value for these configurations but
> that is just going to give the false impression that this kernel will
> work because it builds, when it can't because the ARCH config is not
> even selectable to get all of the other configurations that are needed
> for everything to work properly.
>
> The real solution is either:
>
> * Make ixp4xx work in little endian mode (but commit 3d427228f7370 casts
>   some doubts about whether or not that is possible).

It clearly worked in the distant past, so it should be possible, I just doubt
that it's worth doing this for a 20 year old platform, as there are no
new users and the existing users are probably not planning to replace
their user space. On the other hand, it is possible that there are users
that are only waiting to move to a recent debian armel build.

> * Make ld.lld work properly with CONFIG_CPU_BIG_ENDIAN but given how
>   little use big endian sees for ARM targets, that probably won't happen
>   for a while, if at all.
>
> As always, I am happy to be proven wrong if I have missed something :)

For lld, I don't think there is any point in working on the old BE32 format
that ixp4xx uses and that I think involves extra work in the linker.
If anyone would want to make CONFIG_CPU_BIG_ENDIAN work, they
should start with the modern BE8 format that is used on ARMv6 and
newer, and should be less work to do in the linker because it does not
involve byte-swapping the .text segment.

          Arnd
