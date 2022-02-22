Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2C625
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 05:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645509056; x=1677045056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpTtmPw41hisDff68vmLmLvhusiJ3pxgDtt1JI9XhxU=;
  b=n0+ER/6I+X+hlgH7ZtRf+SnrrYxSWTAljAE7GLg9xKpiWF+DkTFYeNcD
   cLBqY1LAVngPbhQPn0elSdrcM+2/c0DNWWDYI9c1IyNBhcoNv4WOjfV6s
   yanPsXZIfQ73IrRQzjRqQDTCypkCKSZbdw884gn1mjwgaGM4+n/i5ukKv
   m2Tv3aiCorRdrtlJ6gsN5k+1zqENUnESdXjL5CP960zYMGegde7Neoiu4
   3VGtf+Ve9u+VG3VIZNTLDxhVFUNI67wa4A6fJIKEjFyo+FnxN099GKN54
   b6LA6ZJPcxvT3wpGZDzIaO8AwrY9NSNsKnbOOE8+FJyjm/JY5ghgHgqbP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250438012"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="250438012"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 21:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="706484527"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2022 21:50:53 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMO4a-0002Nn-Pt; Tue, 22 Feb 2022 05:50:52 +0000
Date: Tue, 22 Feb 2022 13:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 641/2541]
 include/asm-generic/barrier.h:16:10: fatal error: 'asm/vdso/processor.h'
 file not found
Message-ID: <202202221335.rSY1P2K8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   601144c0da5edfa67a9654158370da19c67e17e2
commit: 09a297eeea223eb1785cb3680149c82f6407fbd1 [641/2541] headers/deps: Add header dependencies to .h files: <asm/vdso/processor.h>
config: hexagon-randconfig-r045-20220221 (https://download.01.org/0day-ci/archive/20220222/202202221335.rSY1P2K8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=09a297eeea223eb1785cb3680149c82f6407fbd1
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 09a297eeea223eb1785cb3680149c82f6407fbd1
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
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
