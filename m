Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B579DD;
	Mon, 27 Mar 2023 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679954979; x=1711490979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BHbMQs1pxGDMwXVK/xTlLZeRHbo+B3K718wGX0LvpU=;
  b=mq93P9nwXm9vdhUun9P4HT6PW44hIyBxreZF0RVYReRM2QLR3KOc1Rdx
   y2587uNNPXG2p3chA8ndtL38tFhsKszUHVVFbi5cIS4iNSbBW84hnZnLd
   KsU/no84FX1taByPc7hvlc+ZCqqSQBwmPCwTI1v/cF6Ess39wUAlSj7Li
   FX/09Cq3vfEKpRjIIvzxZZ+TxYsoYa378VhF/Ia4SRRd7KzVxKG5heXv3
   aaCDrBGnM2agVfb9g8S+/RYCZyexg1btA6RvBRVjuGSMflcLQrpU/4BOE
   YfyEZi6/fRyqp2HxWSJVObDGuCHwMH2U7Wsgjkhutv8nq5rP4GjwjUqB7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="403005174"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="403005174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 15:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="929624944"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="929624944"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2023 15:09:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgv1z-000I3D-2y;
	Mon, 27 Mar 2023 22:09:35 +0000
Date: Tue, 28 Mar 2023 06:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/include/asm/glue-cache.h:126:2: error: Unknown cache maintenance
 model
Message-ID: <202303280632.SyiLf8ne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   ab3e3486789d73658a4137c4d337e9c57e2be0de
commit: 7a001f49d2e36c8feef08fec4b9c283af6a71df4 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-c002-20230327 (https://download.01.org/0day-ci/archive/20230328/202303280632.SyiLf8ne-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git/commit/?id=7a001f49d2e36c8feef08fec4b9c283af6a71df4
        git remote add gerg-m68knommu https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
        git fetch --no-tags gerg-m68knommu armnommu
        git checkout 7a001f49d2e36c8feef08fec4b9c283af6a71df4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280632.SyiLf8ne-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:7:
   arch/arm/include/asm/atomic.h:28:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ >= 6
       ^
   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:13:
   In file included from include/linux/bug.h:5:
   In file included from arch/arm/include/asm/bug.h:7:
   In file included from arch/arm/include/asm/opcodes.h:86:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   In file included from arch/arm/include/asm/swab.h:19:
   arch/arm/include/uapi/asm/swab.h:27:29: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if !defined(__KERNEL__) || __LINUX_ARM_ARCH__ < 6
                               ^
   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:13:
   In file included from include/linux/bug.h:5:
   In file included from arch/arm/include/asm/bug.h:7:
   In file included from arch/arm/include/asm/opcodes.h:86:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/arm/include/asm/swab.h:21:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ >= 6
       ^
   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:10:
   In file included from include/linux/time64.h:5:
   In file included from include/linux/math64.h:6:
   In file included from include/linux/math.h:6:
   In file included from arch/arm/include/asm/div64.h:107:
   In file included from include/asm-generic/div64.h:55:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
   arch/arm/include/asm/bitops.h:218:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ < 5
       ^
   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/arm/include/asm/thread_info.h:13:
   arch/arm/include/asm/fpstate.h:29:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ < 6
       ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   arch/arm/include/asm/uaccess.h:302:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ >= 6
       ^
   arch/arm/include/asm/uaccess.h:404:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ >= 6
       ^
   In file included from arch/arm/kernel/asm-offsets.c:13:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   arch/arm/include/asm/io.h:53:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ < 6
       ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from arch/arm/include/asm/cacheflush.h:12:
>> arch/arm/include/asm/glue-cache.h:126:2: error: Unknown cache maintenance model
   #error Unknown cache maintenance model
    ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from arch/arm/include/asm/cacheflush.h:14:
   arch/arm/include/asm/cachetype.h:29:5: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #if __LINUX_ARM_ARCH__ >= 7
       ^
   arch/arm/include/asm/cachetype.h:34:7: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #elif __LINUX_ARM_ARCH__ >= 6
         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   arch/arm/include/asm/cacheflush.h:197:7: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #elif __LINUX_ARM_ARCH__ >= 7 && defined(CONFIG_SMP)
         ^
   arch/arm/include/asm/cacheflush.h:199:7: warning: '__LINUX_ARM_ARCH__' is not defined, evaluates to 0 [-Wundef]
   #elif __LINUX_ARM_ARCH__ == 6 && defined(CONFIG_ARM_ERRATA_411920)
         ^
   In file included from arch/arm/kernel/asm-offsets.c:16:
>> arch/arm/include/asm/glue-df.h:96:2: error: Unknown data abort handler type
   #error Unknown data abort handler type
    ^
   In file included from arch/arm/kernel/asm-offsets.c:17:
>> arch/arm/include/asm/glue-pf.h:51:2: error: Unknown prefetch abort handler type
   #error Unknown prefetch abort handler type
    ^
   24 warnings and 3 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +126 arch/arm/include/asm/glue-cache.h

55bdd694116597 Catalin Marinas 2010-05-21  124  
753790e713d80b Russell King    2011-02-06  125  #if !defined(_CACHE) && !defined(MULTI_CACHE)
25985edcedea63 Lucas De Marchi 2011-03-30 @126  #error Unknown cache maintenance model
753790e713d80b Russell King    2011-02-06  127  #endif
753790e713d80b Russell King    2011-02-06  128  

:::::: The code at line 126 was first introduced by commit
:::::: 25985edcedea6396277003854657b5f3cb31a628 Fix common misspellings

:::::: TO: Lucas De Marchi <lucas.demarchi@profusion.mobi>
:::::: CC: Lucas De Marchi <lucas.demarchi@profusion.mobi>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
