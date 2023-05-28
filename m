Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A68366;
	Sun, 28 May 2023 05:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685252697; x=1716788697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M++YtRVxrxBH6ti0Syi84LMXeJAnD3hEO9a/cwKbBeU=;
  b=VLN4shqpqVe9FVUF+MMMDV454l+FandLm25ZvgZDWtKjcRiooXPE6QZa
   1tOCY540FQne6BlmZn203BvxDw63PftKj9kUIhBZMxe+ZV0cZTgNtMKqY
   AcHNsXj6/HAfatAujoW2VnKc1W9KhrU/C577IF1BihiKCcHd4W8fVDtwn
   Y7Cwb/p03Kc6Iyva4QJZ8RgYH+I7T03HfYyHXDd1KYbocu/VNAjBlt2Rg
   6i0j2ClEzOkGrSFoxblBj+TSM5865wUd0h5aJFMZ1hoNerAJCucJfBTYj
   IvoXu6+yTxlE8mNvGIZKI3k6wi3Y6PtdUkI5iYOwHis3+qVP2gH9UqMC+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="357733541"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="357733541"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 22:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="879976506"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="879976506"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 22:44:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q39D4-000KS2-37;
	Sun, 28 May 2023 05:44:54 +0000
Date: Sun, 28 May 2023 13:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:mm/mremap-pmd-warning-3 6/6]
 arch/um/include/asm/pgtable-3level.h:27:9: warning: 'PMD_SIZE' macro
 redefined
Message-ID: <202305281351.87LR5ty4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git mm/mremap-pmd-warning-3
head:   37d3506ee4cd098f2c741051cbab4328f95ae4b7
commit: 37d3506ee4cd098f2c741051cbab4328f95ae4b7 [6/6] debug: prints in code and tests
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230528/202305281351.87LR5ty4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install um cross compiling tool for clang build
        # apt-get install binutils-um-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=37d3506ee4cd098f2c741051cbab4328f95ae4b7
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern mm/mremap-pmd-warning-3
        git checkout 37d3506ee4cd098f2c741051cbab4328f95ae4b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281351.87LR5ty4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/um/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/um/include/asm/thread_info.h:15:
>> arch/um/include/asm/page.h:57:39: error: typedef redefinition with different types ('struct pte_t' vs 'struct pte_t')
   typedef struct { unsigned long pte; } pte_t;
                                         ^
   arch/x86/include/asm/pgtable_64_types.h:21:34: note: previous definition is here
   typedef struct { pteval_t pte; } pte_t;
                                    ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/um/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/um/include/asm/thread_info.h:15:
>> arch/um/include/asm/page.h:61:39: error: typedef redefinition with different types ('struct pmd_t' vs 'struct pmd_t')
   typedef struct { unsigned long pmd; } pmd_t;
                                         ^
   arch/x86/include/asm/pgtable_64_types.h:22:34: note: previous definition is here
   typedef struct { pmdval_t pmd; } pmd_t;
                                    ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:25:9: warning: '_PAGE_SWP_EXCLUSIVE' macro redefined [-Wmacro-redefined]
   #define _PAGE_SWP_EXCLUSIVE     0x400
           ^
   arch/x86/include/asm/pgtable_64_types.h:215:9: note: previous definition is here
   #define _PAGE_SWP_EXCLUSIVE     _PAGE_PWT
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
   In file included from arch/um/include/asm/pgtable-3level.h:10:
   include/asm-generic/pgtable-nopud.h:18:9: warning: 'PUD_SHIFT' macro redefined [-Wmacro-redefined]
   #define PUD_SHIFT       P4D_SHIFT
           ^
   arch/x86/include/asm/pgtable_64_types.h:84:9: note: previous definition is here
   #define PUD_SHIFT       30
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
   In file included from arch/um/include/asm/pgtable-3level.h:10:
   include/asm-generic/pgtable-nopud.h:19:9: warning: 'PTRS_PER_PUD' macro redefined [-Wmacro-redefined]
   #define PTRS_PER_PUD    1
           ^
   arch/x86/include/asm/pgtable_64_types.h:85:9: note: previous definition is here
   #define PTRS_PER_PUD    512
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
   In file included from arch/um/include/asm/pgtable-3level.h:10:
   include/asm-generic/pgtable-nopud.h:20:9: warning: 'PUD_SIZE' macro redefined [-Wmacro-redefined]
   #define PUD_SIZE        (1UL << PUD_SHIFT)
           ^
   arch/x86/include/asm/pgtable_64_types.h:101:9: note: previous definition is here
   #define PUD_SIZE        (_AC(1, UL) << PUD_SHIFT)
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
   In file included from arch/um/include/asm/pgtable-3level.h:10:
   include/asm-generic/pgtable-nopud.h:21:9: warning: 'PUD_MASK' macro redefined [-Wmacro-redefined]
   #define PUD_MASK        (~(PUD_SIZE-1))
           ^
   arch/x86/include/asm/pgtable_64_types.h:102:9: note: previous definition is here
   #define PUD_MASK        (~(PUD_SIZE - 1))
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
>> arch/um/include/asm/pgtable-3level.h:15:9: warning: 'PGDIR_SHIFT' macro redefined [-Wmacro-redefined]
   #define PGDIR_SHIFT     30
           ^
   arch/x86/include/asm/pgtable_64_types.h:75:9: note: previous definition is here
   #define PGDIR_SHIFT             39
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
>> arch/um/include/asm/pgtable-3level.h:19:9: warning: 'PGDIR_SIZE' macro redefined [-Wmacro-redefined]
   #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)
           ^
   arch/x86/include/asm/pgtable_64_types.h:103:9: note: previous definition is here
   #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
>> arch/um/include/asm/pgtable-3level.h:20:9: warning: 'PGDIR_MASK' macro redefined [-Wmacro-redefined]
   #define PGDIR_MASK      (~(PGDIR_SIZE-1))
           ^
   arch/x86/include/asm/pgtable_64_types.h:104:9: note: previous definition is here
   #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
>> arch/um/include/asm/pgtable-3level.h:27:9: warning: 'PMD_SIZE' macro redefined [-Wmacro-redefined]
   #define PMD_SIZE        (1UL << PMD_SHIFT)
           ^
   arch/x86/include/asm/pgtable_64_types.h:99:9: note: previous definition is here
   #define PMD_SIZE        (_AC(1, UL) << PMD_SHIFT)
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:28:
>> arch/um/include/asm/pgtable-3level.h:28:9: warning: 'PMD_MASK' macro redefined [-Wmacro-redefined]
   #define PMD_MASK        (~(PMD_SIZE-1))
           ^
   arch/x86/include/asm/pgtable_64_types.h:100:9: note: previous definition is here
   #define PMD_MASK        (~(PMD_SIZE - 1))
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:49:9: warning: 'VMALLOC_START' macro redefined [-Wmacro-redefined]
   #define VMALLOC_START ((end_iomem + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1))
           ^
   arch/x86/include/asm/pgtable_64_types.h:138:10: note: previous definition is here
   # define VMALLOC_START          __VMALLOC_BASE_L4
            ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:51:9: warning: 'VMALLOC_END' macro redefined [-Wmacro-redefined]
   #define VMALLOC_END     (FIXADDR_START-2*PAGE_SIZE)
           ^
   arch/x86/include/asm/pgtable_64_types.h:152:9: note: previous definition is here
   #define VMALLOC_END             VMEMORY_END
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:52:9: warning: 'MODULES_VADDR' macro redefined [-Wmacro-redefined]
   #define MODULES_VADDR   VMALLOC_START
           ^
   arch/x86/include/asm/pgtable_64_types.h:190:9: note: previous definition is here
   #define MODULES_VADDR           (__START_KERNEL_map + KERNEL_IMAGE_SIZE)
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:53:9: warning: 'MODULES_END' macro redefined [-Wmacro-redefined]
   #define MODULES_END     VMALLOC_END
           ^
   arch/x86/include/asm/pgtable_64_types.h:193:10: note: previous definition is here
   # define MODULES_END            _AC(0xffffffffff000000, UL)
            ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:54:9: warning: 'MODULES_LEN' macro redefined [-Wmacro-redefined]
   #define MODULES_LEN     (MODULES_VADDR - MODULES_END)
           ^
   arch/x86/include/asm/pgtable_64_types.h:197:9: note: previous definition is here
   #define MODULES_LEN             (MODULES_END - MODULES_VADDR)
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm.h:855:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:


vim +/PMD_SIZE +27 arch/um/include/asm/pgtable-3level.h

^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  13  
655e4ed0c521dcf include/asm-um/pgtable-3level.h Jeff Dike      2008-02-04  14  #ifdef CONFIG_64BIT
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16 @15  #define PGDIR_SHIFT	30
655e4ed0c521dcf include/asm-um/pgtable-3level.h Jeff Dike      2008-02-04  16  #else
655e4ed0c521dcf include/asm-um/pgtable-3level.h Jeff Dike      2008-02-04  17  #define PGDIR_SHIFT	31
655e4ed0c521dcf include/asm-um/pgtable-3level.h Jeff Dike      2008-02-04  18  #endif
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16 @19  #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16 @20  #define PGDIR_MASK	(~(PGDIR_SIZE-1))
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  21  
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  22  /* PMD_SHIFT determines the size of the area a second-level page table can
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  23   * map
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  24   */
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  25  
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  26  #define PMD_SHIFT	21
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16 @27  #define PMD_SIZE	(1UL << PMD_SHIFT)
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16 @28  #define PMD_MASK	(~(PMD_SIZE-1))
^1da177e4c3f415 include/asm-um/pgtable-3level.h Linus Torvalds 2005-04-16  29  

:::::: The code at line 27 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
