Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDFB33C4
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 15:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0439FC341C6;
	Fri, 22 Jul 2022 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658503302;
	bh=fLWxxVvMc3uxLxKKIuNyOhffHFGQ30Ep2UbHwLuauOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIA2DH8wTNwGfKafZxWxsAoT0OVZpAnAbJ3ic8IaqrUqfV+njeYNfpSdtvs6Iv84G
	 gL/isyoJN/U7JMgI0kCFW9z/gAOw+N2IBHc0U4jMyFbRV72Rsocx2KXeENbOhmA04r
	 fBjT60LlaFchLw7Tq0tRbSZafhgvD7xGI1gl/6HIqJfEwtk+Aoxu4pAWPuK1UKwmwc
	 e4f2Vydl4iwYBsEO3D/+BzVVssPutq2XJt5JmuUsCtYGSHI4HDDuqqCf1srRRIS7T4
	 Ud+8gOamDl4GKvKU07Ll/nQhRoiQxg8maTLOYX7J3bIenvMwDJf6ezYsI+0d4NEyzE
	 /fQl8GPpHz6/w==
Date: Fri, 22 Jul 2022 08:21:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: help with clang build for mips
Message-ID: <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X>
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
 <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>

Hi Sudip,

On Fri, Jul 22, 2022 at 02:29:01PM +0100, Sudip Mukherjee wrote:
> On Thu, Jul 14, 2022 at 6:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Sudip,
> >
> > On Thu, Jul 14, 2022 at 05:39:39PM +0100, Sudip Mukherjee wrote:
> > > Hi All,
> > >
> > > I am trying to build the kernel for mips architecture with clang. I
> > > see some of the configuration builds properly, but some of the configs
> > > fails with the error (fuloong2e_defconfig):
> > >
> 
> <snip>
> 
> >
> > Unfortunately, I doubt there is much interest in that work, given MIPS
> > as an architecture isn't being developed anymore. Might be an
> > interesting hobbyist project though. It is probably best to just test
> > configurations that work and make sure that those do not regress. Others
> > are more than welcome to weigh in though!
> 
> So, I have now disabled those builds with unsupported CPU. But I do
> see some others with linux-next and will like to have your feedback on
> them please.

Thanks for testing!

> mips clang cavium_octeon_defconfig:
> 
> clang-15: error: unsupported argument '-mfix-cn63xxp1' to option '-Wa,'
> make[1]: *** [scripts/Makefile.build:250: scripts/mod/empty.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1290: prepare0] Error 2
> 
> +++++++++++++++++++++++++++++++++++++
> 
> mips clang decstation_64_defconfig:
> 
> arch/mips/Makefile:281: *** CONFIG_CPU_DADDI_WORKAROUNDS unsupported
> without -msym32.  Stop.
> 
> +++++++++++++++++++++++++++++++++++++
> 
> mips clang ip28_defconfig:
> 
> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
> make[1]: *** [scripts/Makefile.build:118: kernel/bounds.s] Error 1
> make: *** [arch/mips/Makefile:407: archprepare] Error 2

It sounds like these three are all just unsupported flags to the
compiler or assembler:

https://github.com/ClangBuiltLinux/linux/issues/1544

These all appear to be workaround for errata so I am not sure they
should just be wrapped in cc-option; I don't think there is much point
to building kernels that don't have the proper workarounds to actually
run on real hardware.

It looks like the -msym32 one can be worked around with 'KBUILD_SYM32=n'
in your make command though?

> +++++++++++++++++++++++++++++++++++++
> 
> mips clang loongson2k_defconfig:
> 
> error: ABI 'o32' is not supported on CPU 'mips64r2'
> make[1]: *** [Kbuild:48: missing-syscalls] Error 1
> make: *** [arch/mips/Makefile:409: archprepare] Error 2
> 
> +++++++++++++++++++++++++++++++++++++
> 
> mips clang loongson3_defconfig:
> 
> error: ABI 'o32' is not supported on CPU 'mips64r2'
> make[1]: *** [Kbuild:48: missing-syscalls] Error 1
> make: *** [arch/mips/Makefile:409: archprepare] Error 2
> 
> +++++++++++++++++++++++++++++++++++++

The o32 ABI is not supported by LLVM and it sounds like it is unlikely
to without someone stepping up:

https://github.com/ClangBuiltLinux/linux/issues/884

https://llvm.org/pr38063

There was a patch to disable this on the kernel side but it was never
picked up due to what I read as a soft NAK:

https://lore.kernel.org/1614838778-3696-1-git-send-email-yangtiezhu@loongson.cn/

https://lore.kernel.org/alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk/

Cheers,
Nathan
