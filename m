Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5554DC6B;
	Tue,  1 Aug 2023 20:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A9BC433C8;
	Tue,  1 Aug 2023 20:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690921565;
	bh=o+GGNladbdx2kp8eQhSljKZ3INej0rVxKtZNbs3nPPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK/8lICo1Ew127Vt6r89Y4jqMSFBwvaNsSt2nwB3lxk2LX0rviYVdAn41oU0tgzzj
	 3jfG7CWuFOvp4DBjzVTOSdA2kGAUXYPAwMDLNyq4J+rgdC3IiM7ij+qkLNQlI0bz7j
	 ULPCU6V3Ps3pkw49dUNsOMoWOWZj8dCFcqjijKPYUXl8JNHBTx3hrXKuTLVNU0m0VC
	 sRd+X8zVJ0z3Zbgp1KG+Uwj7behchRi7eejD/vKJ6Wm6p+th/7xhCYtBNI8lwZpu0R
	 i49Xdha7W3TABWDYdNxkKpRzMNZh6cF7ZVTNn2Y+Fe+hv6aHlhn2ex26B/04crcwZI
	 IpHd/uz3S6LNQ==
Date: Tue, 1 Aug 2023 13:26:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Fangrui Song <maskray@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [stable:linux-4.19.y 2317/9999]
 lib/mpi/generic_mpih-mul2.c:49:24: error: invalid use of a cast in a inline
 asm context requiring an lvalue: remove the cast or build with
 -fheinous-gnu-extensions
Message-ID: <20230801202602.GA2589710@dev-arch.thelio-3990X>
References: <202307311111.jPEdYIJR-lkp@intel.com>
 <CAKwvOdmgunghdn9fpfXcz8O0+tDuK7GgNrKCUF+-7=nTHOp2nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmgunghdn9fpfXcz8O0+tDuK7GgNrKCUF+-7=nTHOp2nQ@mail.gmail.com>

On Tue, Aug 01, 2023 at 01:15:30PM -0700, Nick Desaulniers wrote:
> On Sun, Jul 30, 2023 at 8:57 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Fangrui,
> >
> > First bad commit (maybe != root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> > head:   767049cead76cf699707290d5aeefb3e4d0d5b43
> > commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
> 
> These aren't a result of Fangrui's change.  Fangrui's change probably
> allows this config to mostly build, modulo the below error in
> lib/mpi/generic_mpih-mul2.c.
> 
> > config: mips-randconfig-r036-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311111.jPEdYIJR-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311111.jPEdYIJR-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307311111.jPEdYIJR-lkp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> > >> drivers/net/netdevsim/netdev.c:167:35: warning: unused variable 'nsim_switchdev_ops' [-Wunused-const-variable]
> >      167 | static const struct switchdev_ops nsim_switchdev_ops = {
> >          |                                   ^
> >    1 warning generated.
> 
> ^ fixed by
> commit e58df56c8564 ("netdevsim: Implement ndo_get_port_parent_id()")
> in v5.1-rc1 (this report is against 4.19.y)
> Florian, does it make sense for the stable maintainers to cherry-pick
> e58df56c8564 to 4.19.y in isolation?
> 
> > --
> > >> lib/mpi/generic_mpih-mul2.c:49:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
> >       49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
> >          |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Looks like randconfig found and outstanding issue. Filed:
> https://github.com/ClangBuiltLinux/linux/issues/1898 to follow up+fix.

Actually, this is fixed with commit b0c091ae04f6 ("lib/mpi: Eliminate
unused umul_ppmm definitions for MIPS"), which applies cleanly to 4.19
and should be fine because 4.19 contains commit cafa0010cd51 ("Raise the
minimum required gcc version to 4.6").

Greg and Sasha, could b0c091ae04f6 be applied to 4.19 to resolve this
randconfig failure?

Cheers,
Nathan
