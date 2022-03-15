Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231636AC2
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 23:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647388161; x=1678924161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFt4pEPKFBu6BMT4D8WQSuWOUnp1fCO566yzWJoodYg=;
  b=OHTxBpmuNnauLvLWsOonO/QzZlBry8i+K/VZJWr8Sgb3Aj5UcOzVLcv/
   ZTaaH5+5yyiiFsBKQVMsjtez90BMt6SofNlnxvV/U/Q1g9qMd7v9E6Zk1
   QRsVhJ7wrHaYzJ/bTD7VSUFXDZaL+Rxj6E0vfCanHIp00GxrBahAAJPDs
   buG2suvQ04uqMdFhn0F96nlrXf3UMbPOpE044QEcgjgzmk3uXP9kuSpml
   N4zOqLASuORY+/UZ0QvFgiqcHqYhWhoYJUMJymDqGxa2h1e1gMCGK673m
   NGmUDaUQEkpP0wt3N3lY1t0fOVYkqgBo94elDX2WoMiD4HCDbKKkSa3Lg
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236393791"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
   d="scan'208";a="236393791"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 16:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
   d="scan'208";a="646423025"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2022 16:49:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUGuj-000BeN-VE; Tue, 15 Mar 2022 23:49:17 +0000
Date: Wed, 16 Mar 2022 07:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 626/2335] include/asm-generic/barrier.h:16:10:
 fatal error: 'asm/vdso/processor.h' file not found
Message-ID: <202203160705.I01UYyP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: 708c40d754d1dc6e28031a2c4d86adce8f27b85b [626/2335] headers/deps: Add header dependencies to .h files: <asm/vdso/processor.h>
config: hexagon-buildonly-randconfig-r002-20220313 (https://download.01.org/0day-ci/archive/20220316/202203160705.I01UYyP2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=708c40d754d1dc6e28031a2c4d86adce8f27b85b
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 708c40d754d1dc6e28031a2c4d86adce8f27b85b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:28:
   In file included from arch/hexagon/include/asm/bitops.h:13:
   In file included from arch/hexagon/include/asm/atomic.h:13:
   In file included from ./arch/hexagon/include/generated/asm/barrier.h:1:
>> include/asm-generic/barrier.h:16:10: fatal error: 'asm/vdso/processor.h' file not found
   #include <asm/vdso/processor.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +16 include/asm-generic/barrier.h

    15	
  > 16	#include <asm/vdso/processor.h>
    17	#include <linux/compiler.h>
    18	#include <linux/kcsan-checks.h>
    19	#include <asm/rwonce.h>
    20	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
