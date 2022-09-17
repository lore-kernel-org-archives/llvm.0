Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77C46AA
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663445768; x=1694981768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfa9UvImNSYWty5auXAb32wOFF+iFjiOi2xLEC0h5Co=;
  b=b3S9HQx7lvScClwN7LR5VBCH/BX4dQDEnezmTokTeqQhJGWHMFjz7e6w
   l0aLfMOnLHgKLaVDuA5IJWX8Yt9ssUuWPBpeqSwYXtR1Z+I16SEN7MuJK
   xc/l/0C3dcXDuxKYTtQKQNY0oSLIo9tmpsc8SFfLJ69Xp+ClgcqnnTRMk
   FfiouSrRHPjjLp+S6Fqq2XvNJ6McF/44LVeluASInaytGPA+If7Mo4J7f
   mDfGD+bRpP1xEFVCC8a/miRDpsTtToXLVUdEBw+6BmA3Gw93PEfliNsv5
   GctVT/cC2//qXunpUK4QMCxj/Y9CPZ766UVGQdzST80vbvC57mvMwSrgI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="385469787"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="385469787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 13:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="651222694"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Sep 2022 13:16:06 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZeEP-0000Zh-1R;
	Sat, 17 Sep 2022 20:16:05 +0000
Date: Sun, 18 Sep 2022 04:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/7] powerpc/build: move got, toc, plt, branch_lt
 sections to read-only
Message-ID: <202209180437.4U3soljK-lkp@intel.com>
References: <20220916040755.2398112-4-npiggin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916040755.2398112-4-npiggin@gmail.com>

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/powerpc-build-linker-improvements/20220916-121310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20220918/202209180437.4U3soljK-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6c034c08f8d0addb6fecba38c9c428b1c4df7c29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nicholas-Piggin/powerpc-build-linker-improvements/20220916-121310
        git checkout 6c034c08f8d0addb6fecba38c9c428b1c4df7c29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/powerpc/kernel/vmlinux.lds:46: { expected, but got SPECIAL
   >>>  .got : AT(ADDR(.got) - (0xc0000000 -0x00000000)) SPECIAL {
   >>>                                                   ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
