Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F37A47;
	Thu, 29 Dec 2022 01:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEE3C433D2;
	Thu, 29 Dec 2022 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672276409;
	bh=ftBmQpkmZEtmYKQbiOpCa1Q5mSO5vretvS+SG5xFvnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VGXIWeY0mVPHcoHhD7b/uUojNBWedaXTNr06McpYEVQwQuP1YkFNtahdMbOzFDyKH
	 JEE/2KYbKYtsiJ+XqC8lgHOnlDyyWkbz16HTHN22X5QY6gcfemqr804VgVwqjD65ha
	 FUwtByUwqhLOtvN+uuS4ceEYSsHEeJwh5InCxCRzOBH/0CPML2KzcDkYweusvdC7ao
	 BOrfcBBJP8xf2r3xP1n8fjGAeRTRqkEEeCwFxjfHER6CtVb010gFe85ysWgFXBAbHx
	 pHxUhn18lanBsLp2VRE1C8UoT3cQnh0GqYwYB0AA6Qbs1/mX05HfFtVM//6ns3nS8m
	 2e8MroIoiqg/Q==
Date: Wed, 28 Dec 2022 18:13:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.10.y 9077/9999] ld.lld: error:
 arch/riscv/kernel/vdso/rt_sigreturn.o:(.riscv.attributes):
 rv32i2p1_m2p0_a2p1_c2p0: unsupported version number 2.1 for extension 'i'
Message-ID: <Y6zpt9lSRrJzwEpm@dev-arch.thelio-3990X>
References: <202212282306.PrOqTZyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212282306.PrOqTZyG-lkp@intel.com>

On Wed, Dec 28, 2022 at 11:22:16PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> head:   6081b6cc6ce7747d025057e6a64a66133a33b970
> commit: c0bb600f076832764b43ae4ef6ee003d9a71f7f9 [9077/9999] RISC-V: vdso: Do not add missing symbols to version section in linker script
> config: riscv-randconfig-r001-20221228
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project f5700e7b69048de958172fb513b336564e7f8709)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=c0bb600f076832764b43ae4ef6ee003d9a71f7f9
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.10.y
>         git checkout c0bb600f076832764b43ae4ef6ee003d9a71f7f9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: arch/riscv/kernel/vdso/rt_sigreturn.o:(.riscv.attributes): rv32i2p1_m2p0_a2p1_c2p0: unsupported version number 2.1 for extension 'i'
> >> ld.lld: error: arch/riscv/kernel/vdso/getcpu.o:(.riscv.attributes): rv32i2p1_m2p0_a2p1_c2p0: unsupported version number 2.1 for extension 'i'
> >> ld.lld: error: arch/riscv/kernel/vdso/flush_icache.o:(.riscv.attributes): rv32i2p1_m2p0_a2p1_c2p0: unsupported version number 2.1 for extension 'i'
> >> ld.lld: error: arch/riscv/kernel/vdso/note.o:(.riscv.attributes): rv32i2p1_m2p0_a2p1_c2p0: unsupported version number 2.1 for extension 'i'

I do not think ld.lld works that well on 5.10; it seems like my patch
clears up a previous build error and exposes this one.

It could be an incompatibility with GNU as that maybe we do not see on
newer versions due to using the integrated assembler?

Cheers,
Nathan
