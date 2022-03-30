Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329C625
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648634841; x=1680170841;
  h=date:from:cc:subject:message-id:mime-version;
  bh=s1df5RVelfbj2jJGYQwL91ibJqsHw/90yBIyrJA70wI=;
  b=QX7BU5UfnFCmnWrkAbwwdM9SQZxn5QhGBPpyR/uyXseOTNY4JMBSlvsd
   QBHp5wws8Tnmtw792/hk7SfmFFQjHbU9m3yuxzVk5Q5bECgEtkJmN7kmv
   y6AxVueKsFYF1TTcvixzLNkS/zfY2pAlJTkZGgacfPMwDT5Cbg9HfiGjr
   eKb1dGm+B2H5mYY6fIOKt9U5EJVc4EjJTUv/5hktRmjkQCu8esi+LUdbV
   yBP2nuIQ5EFhFC99G4/uCtkKYpFLNiKA8ktkuyrUlpZJg2zKB7W3awChW
   WyxvdpjFswuzw3BS903QhnpK9LLL40MSMA0JJNob3oPa972j4OVRbiWYs
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259690480"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="259690480"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 03:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="546801711"
Received: from lkp-server02.sh.intel.com (HELO 7a008980c4ea) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2022 03:07:18 -0700
Received: from kbuild by 7a008980c4ea with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZVEU-0000Gh-4f; Wed, 30 Mar 2022 10:07:18 +0000
Date: Wed, 30 Mar 2022 18:07:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2f'
Message-ID: <202203301829.RywKaqAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d888c83fcec75194a8a48ccd283953bdba7b2550
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   4 months ago
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20220330/202203301829.RywKaqAh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13ceb48bc19c563e05f407e663aaa4105fdfd408
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 13ceb48bc19c563e05f407e663aaa4105fdfd408
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> clang-15: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
