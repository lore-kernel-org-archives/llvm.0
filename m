Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198529A5;
	Sun, 26 Mar 2023 16:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00982C433A1;
	Sun, 26 Mar 2023 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679848377;
	bh=MFtwJoaiaMmU47hUJLTqYCV1D5njDckHxzeUqLWDr2w=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Wm/gkb5qqEEPWesXEqFEgrIaGukhLzuct50DX88Yl3p0txLylcuzRVNK13ZtnSnl7
	 jNozqrw/T83EABoFP5FgDolGFByo9WOZ40piddPhom1woueY+FvVadoZxB7kn5K8AH
	 5HjR41hHDOPtokzD7n3Z7WbWYfMIEGA5ouzNx1RV4pfFOpeCkJ7q53qh4P9If5aNUs
	 aqz+b1AmsUNZnfud/cjUDJUgxi5iuCyjnlSvTUVycydiEyeJ/jTeQQ3sZ3ZnAGTmaL
	 zaIeMjkVYAOumbJYshm8Tn64VDiIQLlrVOKnxLRf+faRUSGaTjOxQoncCUVz1yO8Y3
	 wEXAx6QkJXMGw==
Received: by pali.im (Postfix)
	id 2419478E; Sun, 26 Mar 2023 18:32:54 +0200 (CEST)
Date: Sun, 26 Mar 2023 18:32:54 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: error: unknown target CPU '8540'
Message-ID: <20230326163254.ie55gm7nd7aenlzb@pali>
References: <202303211707.ogAtY5qJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303211707.ogAtY5qJ-lkp@intel.com>
User-Agent: NeoMutt/20180716

On Tuesday 21 March 2023 17:59:58 kernel test robot wrote:
> CC: linux-kernel@vger.kernel.org
> TO: Christophe Leroy <christophe.leroy@csgroup.eu>
> CC: Michael Ellerman <mpe@ellerman.id.au>
> 
> Hi Christophe,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   17214b70a159c6547df9ae204a6275d983146f6b
> commit: 45f7091aac3546ef8112bf62836650ca0bbf0b79 powerpc/64: Set default CPU in Kconfig
> date:   7 weeks ago
> config: powerpc-tqm8560_defconfig (https://download.01.org/0day-ci/archive/20230321/202303211707.ogAtY5qJ-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=45f7091aac3546ef8112bf62836650ca0bbf0b79
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 45f7091aac3546ef8112bf62836650ca0bbf0b79
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303211707.ogAtY5qJ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    clang: error: unsupported argument '-me500' to option '-Wa,'
>    make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
> >> error: unknown target CPU '8540'
>    note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future

Hello! This is expected error because LLVM does not support e500v1
(8540) powerpc cores. LLVM supports e500v2 (8548) cores via LLVM
target cpu value "e500".

You should switch compiler from LLVM to GCC when compiling Linux for
e500v1/8540 powerpc cores.

>    make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
>    make[2]: Target 'scripts/mod/' not remade because of errors.
>    make[1]: *** [Makefile:1285: prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:242: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
