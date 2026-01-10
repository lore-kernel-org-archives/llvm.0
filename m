Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E2262FC1;
	Sat, 10 Jan 2026 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768060270; cv=none; b=Y3srOwTzZ8gRvozlS7WxKwpsXcvXnaBD7hVWQCS6No7CT10PdBEGmvZPMA+fWOY4euS7QRxDwk1n5IaevOmeSMXmQJtZYR2SJG2bXDMRHdI8G7zK9Hn1mzztZGSQ6cjB9DLV869WnqiSuAYy+E/YCdCGlh01PUNN5/78m7btmtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768060270; c=relaxed/simple;
	bh=7BB6P+t2UJ8Ep0g3s68fxSBYRcTpR5WqcpGZ5f8IRtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mSZqRCXCll74ZT/s3OrK6J0UIl5E7WjYKg0udlp71UXF7aGgLkUBtU1hUPt+GOe8LvU/+IRkrM1e7GFjIOd5lP12NEMbG9WGM96whKRZ4YypaaQzSH7qv3OhsPqXmO+6englojZzGgWPacpSnKc3XMOC0DpNoeuxg4JrxMokbEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZGgNs2R; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZGgNs2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768060267; x=1799596267;
  h=date:from:to:cc:subject:message-id;
  bh=7BB6P+t2UJ8Ep0g3s68fxSBYRcTpR5WqcpGZ5f8IRtw=;
  b=TZGgNs2R4RBzRS+4uqqifOT75D6DwlGblygDzyZ+Z8a1/kmZpJoFsIu5
   KaWDyE0SyIxDiKoIFCggkRLApVV5pt88Dpq+FW4zB8rzEUslRy+nhWZmP
   go3bZ3C+KuhLMFAsFbBSC2Y6a4EAO8obx+wr5T1fhZg+PNC2DI98T1+YE
   7yBV1AdpzAf5XnI7X/4Q+RRi0nM++o5SSbO6ESg/5vSJNyne4eRaCAASt
   960PVEVqaawJstuIVrOvTZ/MYwU+AAE/Wq+WYBmBlVFcdBuzqv/cMiM+x
   9hIthfAqD5GezvCanrgheSICE/WBR1yX42EFDd1qWrSMcxv7u7mxmAsce
   g==;
X-CSE-ConnectionGUID: p1nAlPORTkevs25CibIofQ==
X-CSE-MsgGUID: 0rLq6nQ2TBuqEwnD9M9sBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69309962"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69309962"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 07:51:07 -0800
X-CSE-ConnectionGUID: JLS/i+J2TiecPKvibAstHg==
X-CSE-MsgGUID: u5CSSJBoSVWYP3t+6GnGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208240206"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2026 07:51:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vebF1-000000008pw-29ms;
	Sat, 10 Jan 2026 15:51:03 +0000
Date: Sat, 10 Jan 2026 23:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 59/60]
 arch/riscv/kernel/hw_breakpoint.c:44:16: error: variable has incomplete type
 'struct sbiret'
Message-ID: <202601102332.NDXMQG6M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   5f72f4b05b79e6688ac8385791d1e5b6c4991b0a
commit: d54f1f56f61ff91c3d5bd6953720df6db97d19da [59/60] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-001-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102332.NDXMQG6M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102332.NDXMQG6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601102332.NDXMQG6M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:43:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:43:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:43:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:43:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:43:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/kernel/hw_breakpoint.c:44:16: error: variable has incomplete type 'struct sbiret'
      44 |         struct sbiret ret;
         |                       ^
   arch/riscv/kernel/hw_breakpoint.c:44:9: note: forward declaration of 'struct sbiret'
      44 |         struct sbiret ret;
         |                ^
>> arch/riscv/kernel/hw_breakpoint.c:47:15: error: arithmetic on a pointer to an incomplete type 'union sbi_dbtr_shmem_entry'
      47 |         dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: expanded from macro 'per_cpu_ptr'
     264 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:221:52: note: expanded from macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                     ~~~~~ ^
   arch/riscv/kernel/hw_breakpoint.c:23:14: note: forward declaration of 'union sbi_dbtr_shmem_entry'
      23 | static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
         |              ^
>> arch/riscv/kernel/hw_breakpoint.c:55:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |               ^
>> arch/riscv/kernel/hw_breakpoint.c:55:18: error: use of undeclared identifier 'SBI_EXT_DBTR'
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:55:32: error: use of undeclared identifier 'SBI_EXT_DBTR_SETUP_SHMEM'
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:60:8: error: use of undeclared identifier 'SBI_ERR_DENIED'
      60 |                 case SBI_ERR_DENIED:
         |                      ^~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:66:8: error: use of undeclared identifier 'SBI_ERR_INVALID_PARAM'
      66 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:67:8: error: use of undeclared identifier 'SBI_ERR_INVALID_ADDRESS'
      67 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:73:8: error: use of undeclared identifier 'SBI_ERR_ALREADY_AVAILABLE'
      73 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/hw_breakpoint.c:79:8: error: use of undeclared identifier 'SBI_ERR_FAILURE'
      79 |                 case SBI_ERR_FAILURE:
         |                      ^~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:99:16: error: variable has incomplete type 'struct sbiret'
      99 |         struct sbiret ret;
         |                       ^
   arch/riscv/kernel/hw_breakpoint.c:99:9: note: forward declaration of 'struct sbiret'
      99 |         struct sbiret ret;
         |                ^
   arch/riscv/kernel/hw_breakpoint.c:102:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |               ^
   arch/riscv/kernel/hw_breakpoint.c:102:18: error: use of undeclared identifier 'SBI_EXT_DBTR'
     102 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:102:32: error: use of undeclared identifier 'SBI_EXT_DBTR_SETUP_SHMEM'
     102 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:107:8: error: use of undeclared identifier 'SBI_ERR_DENIED'
     107 |                 case SBI_ERR_DENIED:
         |                      ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:112:8: error: use of undeclared identifier 'SBI_ERR_INVALID_PARAM'
     112 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:113:8: error: use of undeclared identifier 'SBI_ERR_INVALID_ADDRESS'
     113 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:118:8: error: use of undeclared identifier 'SBI_ERR_ALREADY_AVAILABLE'
     118 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:122:8: error: use of undeclared identifier 'SBI_ERR_FAILURE'
     122 |                 case SBI_ERR_FAILURE:
         |                      ^~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +44 arch/riscv/kernel/hw_breakpoint.c

    39	
    40	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    41	{
    42		union sbi_dbtr_shmem_entry *dbtr_shmem;
    43		unsigned long shmem_pa;
  > 44		struct sbiret ret;
    45		int rc = 0;
    46	
  > 47		dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
    48		if (!dbtr_shmem) {
    49			pr_err("Invalid per-cpu shared memory for debug triggers\n");
    50			return -ENODEV;
    51		}
    52	
    53		shmem_pa = __pa(dbtr_shmem);
    54	
  > 55		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
    56				MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
    57	
    58		if (ret.error) {
    59			switch (ret.error) {
  > 60			case SBI_ERR_DENIED:
    61				pr_warn("%s: Access denied for shared memory at %lx\n",
    62					__func__, shmem_pa);
    63				rc = -EPERM;
    64				break;
    65	
  > 66			case SBI_ERR_INVALID_PARAM:
  > 67			case SBI_ERR_INVALID_ADDRESS:
    68				pr_warn("%s: Invalid address parameter (%lu)\n",
    69					__func__, ret.error);
    70				rc = -EINVAL;
    71				break;
    72	
  > 73			case SBI_ERR_ALREADY_AVAILABLE:
    74				pr_warn("%s: Shared memory is already set\n",
    75					__func__);
    76				rc = -EADDRINUSE;
    77				break;
    78	
  > 79			case SBI_ERR_FAILURE:
    80				pr_err("%s: Internal sdtrig state error\n",
    81				       __func__);
    82				rc = -ENXIO;
    83				break;
    84	
    85			default:
    86				pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
    87				rc = -ENXIO;
    88				break;
    89			}
    90		}
    91	
    92		pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    93	
    94		return rc;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
