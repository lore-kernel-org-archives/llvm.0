Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018657CF
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646118692; x=1677654692;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Vj728xrKK0qaDtp7wvtKguiX/Y4NrmvtlyEfH0lLsKM=;
  b=Zc9aKCrQ9Ix2hoZAC9Rk/yCz1v6Y537o3Ew8CWj/+ZjZxz3BXOcPFW2u
   qzQbyZqy42nj7uK4UTWACeEDsJ6/N2UKXoAmecRpoeX1WApobGRM7OZ9G
   gVnBFSMFKQkowmlcXOu39yqbOEOXtTBmoow5s/M7/HbwYwZ+Ss8YfOVL3
   Tr+a84c+B8Taxnekb9A8ZB8RqfH+4UQUCrjw1LXUpPmd8iQC2ixqA2dg9
   SRyKUIZMhkT8K1c76GN6wk4jA0nOD82M2ULSgy4DwHprwc/+uOSIIpNZU
   px3PoscPDrj2FbYYraRfnH3T/3tk7DLbAsRW/j0xqHZxq2qynkmlYrN3f
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240486582"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; 
   d="scan'208";a="240486582"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 23:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; 
   d="scan'208";a="593502817"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 23:11:31 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOwfS-00006L-F4; Tue, 01 Mar 2022 07:11:30 +0000
Date: Tue, 1 Mar 2022 15:11:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2e'
Message-ID: <202203011553.e0vvsCHS-lkp@intel.com>
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
head:   719fce7539cd3e186598e2aed36325fe892150cf
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   3 months ago
config: mips-buildonly-randconfig-r002-20220301 (https://download.01.org/0day-ci/archive/20220301/202203011553.e0vvsCHS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
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

All errors (new ones prefixed by >>):

   clang-15: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2e'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>> error: unknown target CPU 'loongson2e'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
