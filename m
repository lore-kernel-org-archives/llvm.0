Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598457A
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 19:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFBDC433C1;
	Thu, 28 Jul 2022 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659038276;
	bh=XOlNLuLdm4ZvUFld4ACY5k6/rEG+ZPPIVQP34aG2ZA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3+rkhOPLhlkHWcj0SEQXjkRU5xU3kCdfKgI8ERQZACQbEKirqS7HqL3s+JZVqjMe
	 /sb/10gig2l8yGR2+5V9abVvCuxBm9REBEIRaMLKurGREW+jlCwvCSJevcarcxBeW7
	 pBBbn0clTTi9z6kBBGsfiAWWDnxvJtJdttGO+99rFJw2eRfSPyRMGCtnFrUnGbVXs8
	 kEFcrH81kcQI2P/RrAMBNByz2gLyFvFpSSOoscIP8P7mjIOm82Vsf8A3WOaA/tDylO
	 SVYXVzMpPqMhwyhKkMm3+4mPW4wqTUO0IqDIdCre02eryzKj28x660f2y0S20GhfwZ
	 ykzyzdhwDToag==
Date: Thu, 28 Jul 2022 12:57:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: arm ixp4xx_defconfig build failure with linux-next and mainline
Message-ID: <YuLqQrKtDnTuJdZK@dev-arch.thelio-3990X>
References: <CADVatmPNCUXqKBoLCpwBA90ocZA6-u+=y1_jz=3C+KwEmN54AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVatmPNCUXqKBoLCpwBA90ocZA6-u+=y1_jz=3C+KwEmN54AA@mail.gmail.com>

On Thu, Jul 28, 2022 at 06:33:07PM +0100, Sudip Mukherjee wrote:
> Hi All,
> 
> Not sure if its reported, builds of arm ixp4xx_defconfig has been
> failing with clang with the error:
> 
> <instantiation>:1:10: error: invalid hexadecimal number
> ldr r7, =0x
>          ^
> arch/arm/kernel/head.S:319:2: note: while in macro instantiation
>  addruart r7, r3, r0
>  ^
> <instantiation>:2:12: error: invalid hexadecimal number
>   ldr r3, =0x
>            ^
> arch/arm/kernel/head.S:319:2: note: while in macro instantiation
>  addruart r7, r3, r0
> 
> 
> I tried to find it in the issue tracker but could not find it.

Thanks for the report! We have not tested all of the configs in
arch/arm/configs so I am not surprised to find one that has an error.

I see multiple definitions of addruart. If I preprocess
arch/arm/kernel/head.S with this configuration, I see it comes from
arch/arm/include/debug/8250.S:

		.macro	addruart, rp, rv, tmp
		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
		ldr	\rv, =CONFIG_DEBUG_UART_VIRT
		.endm

CONFIG_DEBUG_UART_PHYS and CONFIG_DEBUG_UART_VIRT are both empty for
this configuration with LLVM=1:

$ make -skj"$(nproc)" ARCH=arm LLVM=1 ixp4xx_defconfig

$ rg "CONFIG_DEBUG_UART_(PHYS|VIRT)=" .config
3036:CONFIG_DEBUG_UART_PHYS=
3037:CONFIG_DEBUG_UART_VIRT=

Looking at arch/arm/Kconfig.debug, I see:

config DEBUG_UART_PHYS
...
	default 0xc8000000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
	default 0xc8000003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
...

config DEBUG_UART_VIRT
...
	default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
	default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
...

Digging further, I don't see how this configuration can work with
LD=ld.lld (implied by LLVM=1). Commit 5d6f52671e76 ("ARM: rework
endianess selection") made it so that CONFIG_ARCH_IXP4XX cannot be
selected without CONFIG_CPU_BIG_ENDIAN due to the "depends" but
CONFIG_CPU_BIG_ENDIAN in turn cannot be selected with LD=ld.lld due to
commit 28187dc8ebd9 ("ARM: 9025/1: Kconfig: CPU_BIG_ENDIAN depends on
!LD_IS_LLD"), meaning that none of these "default" statements can
trigger.

I see two solutions for the immediate future (I've CC'd Arnd in case he
has any thoughts):

* Use LD=arm-linux-gnueabi-ld (or whatever your triple is) with this
  configuration if you want to keep testing it.

* Don't build this configuration altogether.

Maybe we could hack up a sane default value for these configurations but
that is just going to give the false impression that this kernel will
work because it builds, when it can't because the ARCH config is not
even selectable to get all of the other configurations that are needed
for everything to work properly.

The real solution is either:

* Make ixp4xx work in little endian mode (but commit 3d427228f7370 casts
  some doubts about whether or not that is possible).

* Make ld.lld work properly with CONFIG_CPU_BIG_ENDIAN but given how
  little use big endian sees for ARM targets, that probably won't happen
  for a while, if at all.

As always, I am happy to be proven wrong if I have missed something :)

Cheers,
Nathan
