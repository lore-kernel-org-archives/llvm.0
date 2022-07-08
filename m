Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8178B29A9
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657296983; x=1688832983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8Q/JDShkN96zOSvjLaUmT9NJN1lPPjA0YfUSeO2/BM=;
  b=ZpfP56nUivj5F2T+JhgmpQqOhBDiMs3CiCvJrECnEB/U7JhZur7Umn2l
   c0vqAOol2ZyurxLriRXlGmuzNgM7uXoxDcGjA9aRGFY6M18hG1gHkFazp
   3zEqndnjSW7tXPETv7AxI9sZpIlqhu5llLn5BRyPuLBSC55eNCRWzF1A0
   6NsruawNlg5dq7SiWCdZNoPz/KC61guH8AtZ7vQyABD0jfEgtutWIHQx3
   znGaaiP+QfV/yoZkF4xLs6LsvEhzdJOpJ1QDJ0QJiMeByRSGBVglb8gG7
   1sXB+h1R/XXK5dfamHBP7oCq10YZmBWE9K+3ktL4u6Gs+LChtNkZv8GFx
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="283065026"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="283065026"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 09:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="544260506"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jul 2022 09:15:58 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9qe5-000NgU-R2;
	Fri, 08 Jul 2022 16:15:57 +0000
Date: Sat, 9 Jul 2022 00:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.19-rc1 27/35] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
Message-ID: <202207090002.wns3emYw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.19-rc1
head:   144435741b0a6f31403d3084103678da3b4f9d11
commit: 67a0731f120a735a7d6f8685d1fed092e460902e [27/35] powerpc: Make virt_to_pfn() a static inline
config: powerpc-mpc8315_rdb_defconfig (https://download.01.org/0day-ci/archive/20220709/202207090002.wns3emYw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=67a0731f120a735a7d6f8685d1fed092e460902e
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.19-rc1
        git checkout 67a0731f120a735a7d6f8685d1fed092e460902e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
   >>> static inline unsigned long virt_to_pfn(const volatile void *kaddr)
   >>> ^
   clang-15: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [arch/powerpc/kernel/vdso/Makefile:66: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:422: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
