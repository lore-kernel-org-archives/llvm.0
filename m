Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E29180;
	Sat,  6 May 2023 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683332253; x=1714868253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZW9ZtHsUEiTq+g6FyEBhSTAohjTPES2pU9UScx28TA=;
  b=j1Vww5F0Hcp3kVtB48CWcO28P2E1sDEifqfMyGImvySmeEiKp7jKrz1L
   Y8zS/gfWPQ3d4LluoV+XIvxWk687H26z+M00eBNw6JwOMsv7eb2yWk1t1
   50QuFKnTuAG05rcAT0I+sqff7cT2LFD8FIY2r6YWw8rNuGA5WWD8lhiTP
   EbMHVfAVWdeWUgJAuUnWG7VWQXbeMe+Mv37Dv3pIs+oAW6+n8RETtMcTC
   pVcbecZ8U4XSUUFHVUrNEAQUqpA126habsPx+QHSlhWjubQttI1s+Ryl1
   45ncepR6UH6UTFoTcQxbYm4z0yRjvu67nscwK/m8faG8+RAAnlBP9WYWR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="435644600"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="435644600"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 17:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="648092641"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="648092641"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 May 2023 17:17:31 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv5cA-0000xJ-2q;
	Sat, 06 May 2023 00:17:30 +0000
Date: Sat, 6 May 2023 08:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 2/20] arch/arm64/include/asm/memory.h:211:9: error: use
 of undeclared identifier 'PGDIR_SIZE'
Message-ID: <202305060826.H9djflqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   d46570e26ed804d5d89e71c20a8c17362984c52e
commit: 9a882e7990de2897f942aff351cae150c77bde60 [2/20] arm64: place kernel in its own L0 page table entry
config: arm64-buildonly-randconfig-r005-20230504 (https://download.01.org/0day-ci/archive/20230506/202305060826.H9djflqW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm ktext
        git checkout 9a882e7990de2897f942aff351cae150c77bde60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060826.H9djflqW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:36:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:11:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:78:
   In file included from arch/arm64/include/asm/preempt.h:6:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/arm64/include/asm/thread_info.h:17:
>> arch/arm64/include/asm/memory.h:211:9: error: use of undeclared identifier 'PGDIR_SIZE'
           return kaslr_offset() >= MIN_KIMG_ALIGN;
                  ^
   arch/arm64/include/asm/memory.h:202:56: note: expanded from macro 'kaslr_offset'
   #define kaslr_offset()  ((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
                                                           ^
   arch/arm64/include/asm/memory.h:46:49: note: expanded from macro 'KIMAGE_VADDR'
   #define KIMAGE_VADDR            (_PAGE_END(VA_BITS_MIN) + PGDIR_SIZE)
                                                             ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:


vim +/PGDIR_SIZE +211 arch/arm64/include/asm/memory.h

7ede8665f27cde Alexander Popov 2016-12-19  203  
010338d729c109 Ard Biesheuvel  2023-02-23  204  static inline bool kaslr_enabled(void)
010338d729c109 Ard Biesheuvel  2023-02-23  205  {
010338d729c109 Ard Biesheuvel  2023-02-23  206  	/*
010338d729c109 Ard Biesheuvel  2023-02-23  207  	 * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
010338d729c109 Ard Biesheuvel  2023-02-23  208  	 * placement of the image rather than from the seed, so a displacement
010338d729c109 Ard Biesheuvel  2023-02-23  209  	 * of less than MIN_KIMG_ALIGN means that no seed was provided.
010338d729c109 Ard Biesheuvel  2023-02-23  210  	 */
010338d729c109 Ard Biesheuvel  2023-02-23 @211  	return kaslr_offset() >= MIN_KIMG_ALIGN;
010338d729c109 Ard Biesheuvel  2023-02-23  212  }
010338d729c109 Ard Biesheuvel  2023-02-23  213  

:::::: The code at line 211 was first introduced by commit
:::::: 010338d729c1090036eb40d2a60b7b7bce2445b8 arm64: kaslr: don't pretend KASLR is enabled if offset < MIN_KIMG_ALIGN

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
