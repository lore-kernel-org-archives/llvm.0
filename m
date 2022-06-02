Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9C7E
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654171408; x=1685707408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q9mkvTh5S60FjSe5FSqb32kkfol5w3Mp5LDwfwTITAA=;
  b=DHliW3sgO7HI51Z75ptkkg9ztO7LkPul2CAP4Ko1OhlVzxw2+hxoWG0q
   yDE8V/18UlvIFzX6M+LE6G13hw6rJ8v3gu9CzJCTls0l1sfpREcmXhSdH
   DIjEGa3bVgbBqGqPuvsw0KnlUycvrpFywcaKF+z2fVbnIFd3IwTUr1dNX
   fmtkFn223B/5NsTzZVH1jDQBJ5nuPmsr0RsADd5LNnfmQYjffx1/DbLUC
   DVFoPKlN3YAShdLFSExjCuhiCtBCiOOXamS6jA1+bON8hirdiWpSbtmP/
   d3oznz3smDxxnRIsxDE/fAEWiBPOD+I/rBNLooM6jZhPYssvdB+NjaSZR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273494131"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="273494131"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 05:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="707537769"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jun 2022 05:03:25 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwjXw-00052v-95;
	Thu, 02 Jun 2022 12:03:24 +0000
Date: Thu, 2 Jun 2022 20:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 20/31]
 arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier
 'PAGE_OFFSET'
Message-ID: <202206021932.SvXQtG2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.18-rc1
head:   9083f89a58302e92fad7f144986e307db2350aad
commit: 591e0e614af53ee26dec3179fb3e6e028cecd386 [20/31] Hexagon: Make virt_to_pfn() a static inline
config: hexagon-randconfig-r041-20220531 (https://download.01.org/0day-ci/archive/20220602/202206021932.SvXQtG2F-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=591e0e614af53ee26dec3179fb3e6e028cecd386
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.18-rc1
        git checkout 591e0e614af53ee26dec3179fb3e6e028cecd386
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/power/supply/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/ds2760_battery.c:22:
   In file included from include/linux/module.h:14:
   In file included from include/linux/buildid.h:5:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:16:
>> arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier 'PAGE_OFFSET'
           return __pa(kaddr) >> PAGE_SHIFT;
                  ^
   arch/hexagon/include/asm/page.h:86:39: note: expanded from macro '__pa'
   #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
                                         ^
>> arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier 'PHYS_OFFSET'
   arch/hexagon/include/asm/page.h:86:53: note: expanded from macro '__pa'
   #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
                                                       ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/ds2760_battery.c:30:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
--
   In file included from drivers/power/supply/ds2780_battery.c:12:
   In file included from include/linux/module.h:14:
   In file included from include/linux/buildid.h:5:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:16:
>> arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier 'PAGE_OFFSET'
           return __pa(kaddr) >> PAGE_SHIFT;
                  ^
   arch/hexagon/include/asm/page.h:86:39: note: expanded from macro '__pa'
   #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
                                         ^
>> arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier 'PHYS_OFFSET'
   arch/hexagon/include/asm/page.h:86:53: note: expanded from macro '__pa'
   #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
                                                       ^
   2 errors generated.
--
   In file included from drivers/power/supply/twl4030_charger.c:12:
   In file included from include/linux/module.h:14:
   In file included from include/linux/buildid.h:5:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:16:
>> arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier 'PAGE_OFFSET'
           return __pa(kaddr) >> PAGE_SHIFT;
                  ^
   arch/hexagon/include/asm/page.h:86:39: note: expanded from macro '__pa'
   #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
                                         ^
>> arch/hexagon/include/asm/page.h:131:9: error: use of undeclared identifier 'PHYS_OFFSET'
   arch/hexagon/include/asm/page.h:86:53: note: expanded from macro '__pa'
   #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
                                                       ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/power/supply/twl4030_charger.c:17:
   In file included from include/linux/mfd/twl.h:15:
   In file included from include/linux/input/matrix_keypad.h:6:
   In file included from include/linux/input.h:20:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \


vim +/PAGE_OFFSET +131 arch/hexagon/include/asm/page.h

   128	
   129	static inline unsigned long virt_to_pfn(const void *kaddr)
   130	{
 > 131		return __pa(kaddr) >> PAGE_SHIFT;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
