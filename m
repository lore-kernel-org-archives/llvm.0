Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762737F3;
	Tue,  5 Sep 2023 05:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693891387; x=1725427387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6P8VLEIdAkAKzxmZWGh/yeOmwcWKwoVqBVxP9FSvgNA=;
  b=aaB158YK0tmzM8Z+b/HA8yo6VESImSaYIpmqSM/VKi3xeDtJw8RXW0Ag
   5tA+JxrLuhNEq6Zt6I2CCq1z2G01iG1AwMatPRwepQnNdZctPjVN/H9HZ
   WeViN7X5eCEmRzY5yrJSvaMD3MCQqvPeDFbTH3Kic2gf5w669eAmMflXP
   MhXuoZP9UXZ4X/RDS8uTFn0ocei7yHWs8bCprEpCkKzvfLssRqVSIg7t7
   CR0Z3vvnewaw1QwmIGIG0e+TGYAPuLifZ+isgJrCUfxyQ8SvOAfejAp15
   EL3pKicB2eYychxY2IoZ1bGYuZUvH6v4FsgsxfjG7GCqE45NUIkkvsOVN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="440687402"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="440687402"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 22:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071837134"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="1071837134"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Sep 2023 22:23:04 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdOWh-0001Hj-2y;
	Tue, 05 Sep 2023 05:23:00 +0000
Date: Tue, 5 Sep 2023 13:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 15/21]
 arch/riscv/kernel/probes/rethook.h:6:6: error: conflicting types for
 'arch_rethook_prepare'
Message-ID: <202309051342.vOAalN1R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   dfbc336030a06d337cd7c979774eb34c741db6e9
commit: 21f9b814d7f9703d6118985b1499f2c1b89f3343 [15/21] fprobe: rethook: Use ftrace_regs in fprobe exit handler and rethook
config: riscv-randconfig-r004-20230905 (https://download.01.org/0day-ci/archive/20230905/202309051342.vOAalN1R-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051342.vOAalN1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051342.vOAalN1R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/probes/rethook.c:8:
>> arch/riscv/kernel/probes/rethook.h:6:6: error: conflicting types for 'arch_rethook_prepare'
   void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
        ^
   include/linux/rethook.h:73:6: note: previous declaration is here
   void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
        ^
>> arch/riscv/kernel/probes/rethook.c:13:36: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct ftrace_regs *' [-Werror,-Wincompatible-pointer-types]
           return rethook_trampoline_handler(regs, regs->s0);
                                             ^~~~
   include/linux/rethook.h:92:62: note: passing argument to parameter 'regs' here
   unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
                                                                ^
>> arch/riscv/kernel/probes/rethook.c:18:6: error: conflicting types for 'arch_rethook_prepare'
   void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
        ^
   include/linux/rethook.h:73:6: note: previous declaration is here
   void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
        ^
   13 warnings and 3 errors generated.


vim +/arch_rethook_prepare +6 arch/riscv/kernel/probes/rethook.h

b57c2f124098459 Binglei Wang 2022-10-25  4  
b57c2f124098459 Binglei Wang 2022-10-25  5  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
b57c2f124098459 Binglei Wang 2022-10-25 @6  void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
b57c2f124098459 Binglei Wang 2022-10-25  7  

:::::: The code at line 6 was first introduced by commit
:::::: b57c2f124098459a4acc15d5044f87cba31c87f0 riscv: add riscv rethook implementation

:::::: TO: Binglei Wang <l3b2w1@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
