Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D963C3A;
	Sun, 26 Mar 2023 17:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CE9C433D2;
	Sun, 26 Mar 2023 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679852358;
	bh=eGgeQKMnb/fdU7QDFFCXdmHAwp00F+aNW7C9IEOHhag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etY33jNnUu2E3h0D80t06GVeKVRVHEy8iVy9y5LKD4n6kG7MzdD69xYbYc77IDJPg
	 tYUzjP3RYHRQd2pLoh31MF1DRiKupBKY0vKIN7eexmHlyoiBB8C4wgjPlnu0aZlJ7e
	 Wp3l2qRKhAW9lyPBXT1/YEM0nNERMOPQeTIjR+Bfcx7fwmLBivNcCB8bYvSVkRmrLt
	 YtH38aKvvcGi0Oh9yp68Ip9Nj89ZMkZNWxMxDYBbOrxT9MeJH4f0u/NwbzSpGd2CIb
	 ThyyopPgTaXnJJLm36+ZsE+ysXrdcWxm6L83jHu9Z8XFVXfP5mvxQxp/3mXnXQc0mY
	 ogAB8oNpm5uhg==
Received: by pali.im (Postfix)
	id 95FE678E; Sun, 26 Mar 2023 19:39:15 +0200 (CEST)
Date: Sun, 26 Mar 2023 19:39:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: error: unknown target CPU '8540'
Message-ID: <20230326173915.twp6s6ximv3fao3b@pali>
References: <202303211707.ogAtY5qJ-lkp@intel.com>
 <20230326163254.ie55gm7nd7aenlzb@pali>
 <124692ef-16b3-a5d0-d6a6-5a54d8878328@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <124692ef-16b3-a5d0-d6a6-5a54d8878328@csgroup.eu>
User-Agent: NeoMutt/20180716

On Sunday 26 March 2023 17:35:29 Christophe Leroy wrote:
> Le 26/03/2023 à 18:32, Pali Rohár a écrit :
> > On Tuesday 21 March 2023 17:59:58 kernel test robot wrote:
> >> CC: linux-kernel@vger.kernel.org
> >> TO: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> CC: Michael Ellerman <mpe@ellerman.id.au>
> >>
> >> Hi Christophe,
> 
> I never received this mail ...
> 
> >>
> >> FYI, the error/warning still remains.
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   17214b70a159c6547df9ae204a6275d983146f6b
> >> commit: 45f7091aac3546ef8112bf62836650ca0bbf0b79 powerpc/64: Set default CPU in Kconfig
> >> date:   7 weeks ago
> >> config: powerpc-tqm8560_defconfig (https://download.01.org/0day-ci/archive/20230321/202303211707.ogAtY5qJ-lkp@intel.com/config)
> >> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> >> reproduce (this is a W=1 build):
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          # install powerpc cross compiling tool for clang build
> >>          # apt-get install binutils-powerpc-linux-gnu
> >>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=45f7091aac3546ef8112bf62836650ca0bbf0b79
> >>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >>          git fetch --no-tags linus master
> >>          git checkout 45f7091aac3546ef8112bf62836650ca0bbf0b79
> >>          # save the config file
> >>          mkdir build_dir && cp config build_dir/.config
> >>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
> >>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare
> >>
> >> If you fix the issue, kindly add following tag where applicable
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Link: https://lore.kernel.org/oe-kbuild-all/202303211707.ogAtY5qJ-lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>     clang: error: unsupported argument '-me500' to option '-Wa,'
> >>     make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
> >>>> error: unknown target CPU '8540'
> >>     note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
> > 
> > Hello! This is expected error because LLVM does not support e500v1
> > (8540) powerpc cores. LLVM supports e500v2 (8548) cores via LLVM
> > target cpu value "e500".
> > 
> > You should switch compiler from LLVM to GCC when compiling Linux for
> > e500v1/8540 powerpc cores.
> 
> Hum ... That should have been fixed with commit 4b10306e9845 ("powerpc: 
> Disable CPU unknown by CLANG when CC_IS_CLANG")
> 
> Apparently I missed it. Maybe because clang supports 8548. Is that 
> different from 8540 ?

Yes! e500v1 core (named 8540 in gcc) is older version of e500v2 core
(named 8548 in gcc). IIRC e500v2 is backward compatible with e500v1.
