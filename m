Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1180322301;
	Sat,  1 Feb 2025 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738397559; cv=none; b=peBvPKNqPNMzXv5bSTP8F3ubFXgmoV11nsKpKsMkcM9A3fJG+VNHeiBt+akMsc1VkRGnUU1UidHKsgQ15P2WEAbI++Oid183dlD3qIwYx4NpAHWvX6XILaWxAnt0HpAG6a1V3KwZ6gSeqEROOVqeriyApx77lAxDXTq8fKOsuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738397559; c=relaxed/simple;
	bh=gKMu9XAUNUpGesOaCus54NPVzMNYn6h92javP5DhDl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=guwZNgGZDFiAfsZA4MjVvFsyqh5bc9tikJKdipNQXCwr/jVzlKOsB0FlwcxfgNh742u/1g5HqtTzcFGuaIJMxKhhEYDZBsK6U1RT2fBACv7mBMjS35vwdJpfRl1nZyPt0vH2xHWZfuHN8lZd0CWzvewVZSKl37l3x+d9ybQ57VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvGWQ0L7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvGWQ0L7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738397556; x=1769933556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKMu9XAUNUpGesOaCus54NPVzMNYn6h92javP5DhDl0=;
  b=EvGWQ0L7DXSgo3cRMVW1QTuCFczq394ZBdsRLovfrtpYBm1xMjP6Woeb
   f7NZkIMPfWAyQ6XASerLL1Os4hkbEf6gxjolkosrm0Fhy7VHD+j4o1bDH
   dEUf1KQxGk3cXANZ3xm8UAYn+EV09X6Eboax7HReTPNZRdYqHjkWlt0L1
   hzC0qbV48LMiG79kEJCizCMC4wmx2o/dNN0tVaX8CEMdvWfw3TVoQ7qxQ
   x7ukWuh8ckB65rsVTLSi++cB+GrA60u7v0pUAHVaUigH73+DTLzH+e7ht
   gj5EHA4gEfOdtyrDziaGgOIwKK3/UmG5jSpnu6/9VGIu8/937GDcwQ0z1
   w==;
X-CSE-ConnectionGUID: ppkQOulLT6O5bpXW/9rqzg==
X-CSE-MsgGUID: NaDixWlNQui5ELQ+x862Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39122419"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="39122419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 00:12:35 -0800
X-CSE-ConnectionGUID: FSbTPK2cTgOn9KUgLQBDxQ==
X-CSE-MsgGUID: snizhOTjSWKlVfocsn6dqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="114835060"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2025 00:12:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te8cB-000nt9-1E;
	Sat, 01 Feb 2025 08:12:31 +0000
Date: Sat, 1 Feb 2025 16:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 54/58]
 arch/riscv/kernel/hw_breakpoint.c:44:16: error: variable has incomplete type
 'struct sbiret'
Message-ID: <202502011623.UShwIlU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   3c36c2e5ee25e308dc9d70db4ea160fc24a975a9
commit: 0cc4dc1c6266fb24c3d84dfa87d431ccd4d5569a [54/58] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-001-20250201 (https://download.01.org/0day-ci/archive/20250201/202502011623.UShwIlU8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011623.UShwIlU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011623.UShwIlU8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:52:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:52:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:52:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:52:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:52:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/kernel/hw_breakpoint.c:44:16: error: variable has incomplete type 'struct sbiret'
      44 |         struct sbiret ret;
         |                       ^
   arch/riscv/kernel/hw_breakpoint.c:44:9: note: forward declaration of 'struct sbiret'
      44 |         struct sbiret ret;
         |                ^
>> arch/riscv/kernel/hw_breakpoint.c:47:15: error: arithmetic on a pointer to an incomplete type 'struct sbi_dbtr_shmem_entry'
      47 |         dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:262:2: note: expanded from macro 'per_cpu_ptr'
     262 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:52: note: expanded from macro '__verify_pcpu_ptr'
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                     ~~~~~ ^
   arch/riscv/kernel/hw_breakpoint.c:23:15: note: forward declaration of 'struct sbi_dbtr_shmem_entry'
      23 | static struct sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
         |               ^
>> arch/riscv/kernel/hw_breakpoint.c:55:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |               ^
>> arch/riscv/kernel/hw_breakpoint.c:55:18: error: use of undeclared identifier 'SBI_EXT_DBTR'
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                         ^
>> arch/riscv/kernel/hw_breakpoint.c:55:32: error: use of undeclared identifier 'SBI_EXT_DBTR_SETUP_SHMEM'
      55 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^
>> arch/riscv/kernel/hw_breakpoint.c:60:8: error: use of undeclared identifier 'SBI_ERR_DENIED'
      60 |                 case SBI_ERR_DENIED:
         |                      ^
>> arch/riscv/kernel/hw_breakpoint.c:66:8: error: use of undeclared identifier 'SBI_ERR_INVALID_PARAM'
      66 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^
>> arch/riscv/kernel/hw_breakpoint.c:67:8: error: use of undeclared identifier 'SBI_ERR_INVALID_ADDRESS'
      67 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^
>> arch/riscv/kernel/hw_breakpoint.c:73:8: error: use of undeclared identifier 'SBI_ERR_ALREADY_AVAILABLE'
      73 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^
>> arch/riscv/kernel/hw_breakpoint.c:79:8: error: use of undeclared identifier 'SBI_ERR_FAILURE'
      79 |                 case SBI_ERR_FAILURE:
         |                      ^
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
         |                         ^
   arch/riscv/kernel/hw_breakpoint.c:102:32: error: use of undeclared identifier 'SBI_EXT_DBTR_SETUP_SHMEM'
     102 |         ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
         |                                       ^
   arch/riscv/kernel/hw_breakpoint.c:107:8: error: use of undeclared identifier 'SBI_ERR_DENIED'
     107 |                 case SBI_ERR_DENIED:
         |                      ^
   arch/riscv/kernel/hw_breakpoint.c:112:8: error: use of undeclared identifier 'SBI_ERR_INVALID_PARAM'
     112 |                 case SBI_ERR_INVALID_PARAM:
         |                      ^
   arch/riscv/kernel/hw_breakpoint.c:113:8: error: use of undeclared identifier 'SBI_ERR_INVALID_ADDRESS'
     113 |                 case SBI_ERR_INVALID_ADDRESS:
         |                      ^
   arch/riscv/kernel/hw_breakpoint.c:118:8: error: use of undeclared identifier 'SBI_ERR_ALREADY_AVAILABLE'
     118 |                 case SBI_ERR_ALREADY_AVAILABLE:
         |                      ^
   arch/riscv/kernel/hw_breakpoint.c:122:8: error: use of undeclared identifier 'SBI_ERR_FAILURE'
     122 |                 case SBI_ERR_FAILURE:
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +44 arch/riscv/kernel/hw_breakpoint.c

    39	
    40	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    41	{
    42		struct sbi_dbtr_shmem_entry *dbtr_shmem;
    43		unsigned long shmem_pa;
  > 44		struct sbiret ret;
    45		int rc;
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
    59			switch(ret.error) {
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
    92		pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    93	
    94		return rc;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
