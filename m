Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910E7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 23:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E957C433C1;
	Mon,  1 Aug 2022 23:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659394998;
	bh=hmnaAFL9blqfQs5JS/2/kc/IHMMF1YcLguTNdtX/2cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs1kh/Dfa05U9xSDhJLWQjjDU0FdNuYbuuBzKkyrKOOMmCqP5Vq6glt1TPbJIA9jT
	 rjHMDvD6fERFY8B+7pJOrjsRYvEDLBqmehu879CV8daWnw+Ud39herge/ekfLy4x8H
	 FmKMHw08DyCCN7+TtLcKwTAl8STT/5auU61ol6Va745+nMiHaXQOqs8MVBVCgv9vwI
	 eKHAk57DMK83Rk6dwb6UfGNutJ8jvQIdq9OOsh8HtKanofeH9c5pDbzxvHtmNSzLAE
	 NGz+MmVfyxdMo8y5bdJi0EpvNTj7pEOuc1v4xJa053OFI58NFpKz9LiZzsCtjP+ABd
	 aYMzTNHfQEZtw==
Date: Mon, 1 Aug 2022 16:03:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: arm ixp4xx_defconfig build failure with linux-next and mainline
Message-ID: <YuhbtB9+1rTYtT23@dev-arch.thelio-3990X>
References: <CADVatmPNCUXqKBoLCpwBA90ocZA6-u+=y1_jz=3C+KwEmN54AA@mail.gmail.com>
 <YuLqQrKtDnTuJdZK@dev-arch.thelio-3990X>
 <CAK8P3a341-H8uo9oABQCeRvhmKDs5eBwTGxsuZhO6Pt+WD8v6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a341-H8uo9oABQCeRvhmKDs5eBwTGxsuZhO6Pt+WD8v6Q@mail.gmail.com>

On Sun, Jul 31, 2022 at 01:57:04PM +0200, Arnd Bergmann wrote:
> On Thu, Jul 28, 2022 at 9:57 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Jul 28, 2022 at 06:33:07PM +0100, Sudip Mukherjee wrote:
> > > Hi All,
> > >
> > > Not sure if its reported, builds of arm ixp4xx_defconfig has been
> > > failing with clang with the error:
> > >
> > > <instantiation>:1:10: error: invalid hexadecimal number
> > > ldr r7, =0x
> > >          ^
> > > arch/arm/kernel/head.S:319:2: note: while in macro instantiation
> > >  addruart r7, r3, r0
> > >  ^
> > > <instantiation>:2:12: error: invalid hexadecimal number
> > >   ldr r3, =0x
> > >            ^
> > > arch/arm/kernel/head.S:319:2: note: while in macro instantiation
> > >  addruart r7, r3, r0
> > >
> > >
> > > I tried to find it in the issue tracker but could not find it.
> >
> > Thanks for the report! We have not tested all of the configs in
> > arch/arm/configs so I am not surprised to find one that has an error.
> >
> > I see multiple definitions of addruart. If I preprocess
> > arch/arm/kernel/head.S with this configuration, I see it comes from
> > arch/arm/include/debug/8250.S:
> >
> >                 .macro  addruart, rp, rv, tmp
> >                 ldr     \rp, =CONFIG_DEBUG_UART_PHYS
> >                 ldr     \rv, =CONFIG_DEBUG_UART_VIRT
> >                 .endm
> >
> > CONFIG_DEBUG_UART_PHYS and CONFIG_DEBUG_UART_VIRT are both empty for
> > this configuration with LLVM=1:
> >
> > $ make -skj"$(nproc)" ARCH=arm LLVM=1 ixp4xx_defconfig
> >
> > $ rg "CONFIG_DEBUG_UART_(PHYS|VIRT)=" .config
> > 3036:CONFIG_DEBUG_UART_PHYS=
> > 3037:CONFIG_DEBUG_UART_VIRT=
> 
> I had a patch for this a long time ago, to ensure that there is always
> some default value for these. I wonder if we are just missing something
> in the long list of defaults.

I kind of outlined what I think is happening below but I'll see if I can
rephrase in case I missed something.

Prior to commit 5d6f52671e76 ("ARM: rework endianess selection"),
CONFIG_ARCH_IXP4XX could be selected with either
CONFIG_CPU_LITTLE_ENDIAN or CONFIG_CPU_BIG_ENDIAN, meaning that the
"default" values with "if ARCH_IXP4XX" in CONFIG_DEBUG_UART_{PHYS,VIRT}
would be used, depending on the endianess.

After commit 5d6f52671e76 ("ARM: rework endianess selection"),
CONFIG_ARCH_IXP4XX can only be selected with CONFIG_CPU_BIG_ENDIAN
enabled due to the "depends on". When 'LD=ld.lld' is passed to 'make',
CONFIG_CPU_BIG_ENDIAN is not visible so CONFIG_ARCH_IXP4XX cannot be
selected, which means neither of the "default" values with "if
ARCH_IXP4XX" will trigger nor will any of the other "default" values,
resulting in empty CONFIG_DEBUG_UART_{PHYS,VIRT} like above.

Adding a "fallthrough" default value would prevent the build error that
Sudip noted in his original report but to me, this build error is good
because it shows us that building ipx4xx_defconfig is entirely useless
with 'LD=ld.lld' because CONFIG_ARCH_IXP4XX cannot be selected,
defeating the purpose of building a kernel for this platform.

> Which option is the one that gets selected in the 'choice' statement
> below CONFIG_DEBUG_LL in this config?

I see

  CONFIG_DEBUG_LL_UART_8250=y

enabled with this configuration.

> > Looking at arch/arm/Kconfig.debug, I see:
> >
> > config DEBUG_UART_PHYS
> > ...
> >         default 0xc8000000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
> >         default 0xc8000003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
> > ...
> >
> > config DEBUG_UART_VIRT
> > ...
> >         default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
> >         default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
> > ...
> >
> > Digging further, I don't see how this configuration can work with
> > LD=ld.lld (implied by LLVM=1). Commit 5d6f52671e76 ("ARM: rework
> > endianess selection") made it so that CONFIG_ARCH_IXP4XX cannot be
> > selected without CONFIG_CPU_BIG_ENDIAN due to the "depends" but
> > CONFIG_CPU_BIG_ENDIAN in turn cannot be selected with LD=ld.lld due to
> > commit 28187dc8ebd9 ("ARM: 9025/1: Kconfig: CPU_BIG_ENDIAN depends on
> > !LD_IS_LLD"), meaning that none of these "default" statements can
> > trigger.
> >
> > I see two solutions for the immediate future (I've CC'd Arnd in case he
> > has any thoughts):
> >
> > * Use LD=arm-linux-gnueabi-ld (or whatever your triple is) with this
> >   configuration if you want to keep testing it.
> >
> > * Don't build this configuration altogether.
> 
> Right, these are both good options. In the long run, we probably
> want the second one if this is the only thing that can build with
> clang but not lld.
> 
> > Maybe we could hack up a sane default value for these configurations but
> > that is just going to give the false impression that this kernel will
> > work because it builds, when it can't because the ARCH config is not
> > even selectable to get all of the other configurations that are needed
> > for everything to work properly.
> >
> > The real solution is either:
> >
> > * Make ixp4xx work in little endian mode (but commit 3d427228f7370 casts
> >   some doubts about whether or not that is possible).
> 
> It clearly worked in the distant past, so it should be possible, I just doubt
> that it's worth doing this for a 20 year old platform, as there are no
> new users and the existing users are probably not planning to replace
> their user space. On the other hand, it is possible that there are users
> that are only waiting to move to a recent debian armel build.

Right, I don't think there is a point in making this platform work in
little endian mode just for the sake of the build problem; it should be
done if there are other users that will take advantage of it because I
doubt people are going to be using clang to build kernels for this
platform.

> > * Make ld.lld work properly with CONFIG_CPU_BIG_ENDIAN but given how
> >   little use big endian sees for ARM targets, that probably won't happen
> >   for a while, if at all.
> >
> > As always, I am happy to be proven wrong if I have missed something :)
> 
> For lld, I don't think there is any point in working on the old BE32 format
> that ixp4xx uses and that I think involves extra work in the linker.
> If anyone would want to make CONFIG_CPU_BIG_ENDIAN work, they
> should start with the modern BE8 format that is used on ARMv6 and
> newer, and should be less work to do in the linker because it does not
> involve byte-swapping the .text segment.

Ah, good to know!

Cheers,
Natham
