Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C24920F7
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 05:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651642736; x=1683178736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9tG3SXKs0FY6/8Enp14/1nQegyW5MhoV10nEN/hBMA=;
  b=bqR7Q4SBVMbpNle4/nQ4UltH980U5qbdKkgsXx4Qz6p5OBOZUyGcT9Aa
   LuUJqgu1uZHlYdwvmrBz3I9d+8k6bH3lv0wyhaR0Ew6HGZ6d4ouo6/LD2
   KLx0MYSHuojpqV7sjpGhr8EJHb8I/mLgAA4npTvzkoCzhKzhSZkaPosSh
   f5eA69GQq569HTQaoR4UC7iQ/u5l0Do2Unn3RRAyKTeJ7C2QSHh+AlC0T
   vaOCjsPiFARs2Vru4vs23IpsCB6E3AGBmyJp69/+DEhCW2fiyDQcnT4cP
   m+/RqRi5tOBK3C6VljMiD8OlLewBWFNXQv//hhFy5SrcScZ4uFD0o8s+u
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="249648494"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="249648494"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 22:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="734242383"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2022 22:38:47 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm7io-000B63-Cf;
	Wed, 04 May 2022 05:38:46 +0000
Date: Wed, 4 May 2022 13:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [niks:has_ioport_v3 39/39] include/asm-generic/io.h:737:9: warning:
 'insb' macro redefined
Message-ID: <202205041331.P2Djdwnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v3
head:   45df38c1492340a5c06ff7ad2966735c1f5c4d94
commit: 45df38c1492340a5c06ff7ad2966735c1f5c4d94 [39/39] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: riscv-randconfig-r003-20220501 (https://download.01.org/0day-ci/archive/20220504/202205041331.P2Djdwnj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=45df38c1492340a5c06ff7ad2966735c1f5c4d94
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v3
        git checkout 45df38c1492340a5c06ff7ad2966735c1f5c4d94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/target/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:737:9: warning: 'insb' macro redefined [-Wmacro-redefined]
   #define insb insb
           ^
   arch/riscv/include/asm/io.h:104:9: note: previous definition is here
   #define insb(addr, buffer, count) __insb((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:740:9: warning: 'insw' macro redefined [-Wmacro-redefined]
   #define insw insw
           ^
   arch/riscv/include/asm/io.h:105:9: note: previous definition is here
   #define insw(addr, buffer, count) __insw((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:743:9: warning: 'insl' macro redefined [-Wmacro-redefined]
   #define insl insl
           ^
   arch/riscv/include/asm/io.h:106:9: note: previous definition is here
   #define insl(addr, buffer, count) __insl((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:746:9: warning: 'outsb' macro redefined [-Wmacro-redefined]
   #define outsb outsb
           ^
   arch/riscv/include/asm/io.h:118:9: note: previous definition is here
   #define outsb(addr, buffer, count) __outsb((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:749:9: warning: 'outsw' macro redefined [-Wmacro-redefined]
   #define outsw outsw
           ^
   arch/riscv/include/asm/io.h:119:9: note: previous definition is here
   #define outsw(addr, buffer, count) __outsw((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:752:9: warning: 'outsl' macro redefined [-Wmacro-redefined]
   #define outsl outsl
           ^
   arch/riscv/include/asm/io.h:120:9: note: previous definition is here
   #define outsl(addr, buffer, count) __outsl((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_configfs.c:28:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1081:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.
--
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:737:9: warning: 'insb' macro redefined [-Wmacro-redefined]
   #define insb insb
           ^
   arch/riscv/include/asm/io.h:104:9: note: previous definition is here
   #define insb(addr, buffer, count) __insb((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:740:9: warning: 'insw' macro redefined [-Wmacro-redefined]
   #define insw insw
           ^
   arch/riscv/include/asm/io.h:105:9: note: previous definition is here
   #define insw(addr, buffer, count) __insw((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:743:9: warning: 'insl' macro redefined [-Wmacro-redefined]
   #define insl insl
           ^
   arch/riscv/include/asm/io.h:106:9: note: previous definition is here
   #define insl(addr, buffer, count) __insl((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:746:9: warning: 'outsb' macro redefined [-Wmacro-redefined]
   #define outsb outsb
           ^
   arch/riscv/include/asm/io.h:118:9: note: previous definition is here
   #define outsb(addr, buffer, count) __outsb((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:749:9: warning: 'outsw' macro redefined [-Wmacro-redefined]
   #define outsw outsw
           ^
   arch/riscv/include/asm/io.h:119:9: note: previous definition is here
   #define outsw(addr, buffer, count) __outsw((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:752:9: warning: 'outsl' macro redefined [-Wmacro-redefined]
   #define outsl outsl
           ^
   arch/riscv/include/asm/io.h:120:9: note: previous definition is here
   #define outsl(addr, buffer, count) __outsl((void __iomem *)(long)addr, buffer, count)
           ^
   In file included from drivers/target/target_core_spc.c:16:
   In file included from include/scsi/scsi_tcq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1081:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   drivers/target/target_core_spc.c:223:6: warning: variable 'prod_len' set but not used [-Wunused-but-set-variable]
           u32 prod_len;
               ^
   drivers/target/target_core_spc.c:224:6: warning: variable 'unit_serial_len' set but not used [-Wunused-but-set-variable]
           u32 unit_serial_len, off = 0;
               ^
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   9 warnings and 20 errors generated.


vim +/insb +737 include/asm-generic/io.h

   736	
 > 737	#define insb insb
   738	void insb(unsigned long addr, void *buffer, unsigned int count)
   739		__compiletime_error("insb()/insb_p() requires CONFIG_HAS_IOPORT");
 > 740	#define insw insw
   741	void insw(unsigned long addr, void *buffer, unsigned int count)
   742		__compiletime_error("insw()/insw_p() requires CONFIG_HAS_IOPORT");
 > 743	#define insl insl
   744	void insl(unsigned long addr, void *buffer, unsigned int count)
   745		__compiletime_error("insl()/insl_p() requires CONFIG_HAS_IOPORT");
 > 746	#define outsb outsb
   747	void outsb(unsigned long addr, const void *buffer, unsigned int count)
   748		__compiletime_error("outsb()/outsb_p() requires CONFIG_HAS_IOPORT");
 > 749	#define outsw outsw
   750	void outsw(unsigned long addr, const void *buffer, unsigned int count)
   751		__compiletime_error("outsw()/outsw_p() requires CONFIG_HAS_IOPORT");
 > 752	#define outsl outsl
   753	void outsl(unsigned long addr, const void *buffer, unsigned int count)
   754		__compiletime_error("outsl()/outsl_p() requires CONFIG_HAS_IOPORT");
   755	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
