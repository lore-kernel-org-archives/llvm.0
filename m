Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A56C6FD3;
	Mon,  6 Feb 2023 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675725691; x=1707261691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CegStI2OdNPOSLc16MGHcE2ZWQ9IgspkA7bHYrCrqg=;
  b=KrBKSnzjE/IXLZFv2OxHQTyBleZMlRh2vwzGYDZ/+j8YbipUAcRVyikB
   bIZn6cStqJT8j2dOSSBqColRr7BexgHcL2zRy/7iXNJhInkH0SvYrsGgm
   TIPSDXMLyMcX/1gShTe7QbU9j7udcKOGi2BSunDdU3c3sE7WDvuqGnRPR
   leqMH2un9GVjqaqI8iJdS8kSw6Ea+W9UksD6piYVftG5aLvVNeRZZLY8d
   C8SaR7VTZ/HAjw+gbNYVCO9o9UjnTTePsEfuHaeHvtqeGH3uacl7uHg9m
   Q4JNla/+xewprZiZ5IkMMUMYhl4gx3NdEVhkIdLl10mAg+be6oPEnkYoc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="393941089"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393941089"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 15:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="666639643"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="666639643"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Feb 2023 15:21:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPAnY-0002qh-0H;
	Mon, 06 Feb 2023 23:21:20 +0000
Date: Tue, 7 Feb 2023 07:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:x86/vdso 3/4] arch/x86/entry/vdso/vdso32/../vgetcpu.c:13:1:
 warning: no previous prototype for function '__vdso_getcpu'
Message-ID: <202302070751.uhpE2V7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/vdso
head:   5646bbd6684acf5c9b9dedb863b7d2f6f5a330fb
commit: 92d33063c081a82d25dd08a9cce03947c8ed9164 [3/4] x86/vdso: Provide getcpu for x86-32.
config: x86_64-randconfig-r031-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070751.uhpE2V7R-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=92d33063c081a82d25dd08a9cce03947c8ed9164
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/vdso
        git checkout 92d33063c081a82d25dd08a9cce03947c8ed9164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/vdso/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
   In file included from arch/x86/entry/vdso/vdso32/../vgetcpu.c:8:
   In file included from include/linux/kernel.h:22:
   In file included from include/linux/bitops.h:68:
   In file included from arch/x86/include/asm/bitops.h:420:
   arch/x86/include/asm/arch_hweight.h:49:15: error: invalid input size for constraint 'D'
                            : REG_IN (w));
                                      ^
   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
   In file included from arch/x86/entry/vdso/vdso32/../vgetcpu.c:8:
   In file included from include/linux/kernel.h:25:
   In file included from include/linux/math.h:6:
   arch/x86/include/asm/div64.h:85:34: error: invalid output size for constraint '=a'
           asm ("mulq %2; divq %3" : "=a" (q)
                                           ^
   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:2:
>> arch/x86/entry/vdso/vdso32/../vgetcpu.c:13:1: warning: no previous prototype for function '__vdso_getcpu' [-Wmissing-prototypes]
   __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
   ^
   arch/x86/entry/vdso/vdso32/../vgetcpu.c:12:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
   notrace long
           ^
           static 
   1 warning and 2 errors generated.


vim +/__vdso_getcpu +13 arch/x86/entry/vdso/vdso32/../vgetcpu.c

2aae950b21e4bc arch/x86_64/vdso/vgetcpu.c    Andi Kleen     2007-07-21  11  
23adec554a7648 arch/x86/vdso/vgetcpu.c       Steven Rostedt 2008-05-12  12  notrace long
23adec554a7648 arch/x86/vdso/vgetcpu.c       Steven Rostedt 2008-05-12 @13  __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
2aae950b21e4bc arch/x86_64/vdso/vgetcpu.c    Andi Kleen     2007-07-21  14  {
22245bdf0ad805 arch/x86/entry/vdso/vgetcpu.c Ingo Molnar    2018-10-08  15  	vdso_read_cpunode(cpu, node);
ec3a94188df7d2 arch/x86/entry/vdso/vgetcpu.c Ingo Molnar    2018-10-08  16  
2aae950b21e4bc arch/x86_64/vdso/vgetcpu.c    Andi Kleen     2007-07-21  17  	return 0;
2aae950b21e4bc arch/x86_64/vdso/vgetcpu.c    Andi Kleen     2007-07-21  18  }
2aae950b21e4bc arch/x86_64/vdso/vgetcpu.c    Andi Kleen     2007-07-21  19  

:::::: The code at line 13 was first introduced by commit
:::::: 23adec554a7648f99c8acc0caf49c66320cd2b84 x86: add notrace annotations to vsyscall.

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
