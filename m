Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B347228CB8;
	Thu, 30 Apr 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545020; cv=none; b=VYUs9HP7VwDVFNdbVyJRpNbLjaD6xvqLFc3aSLIrpdXpSSqY6o+kXtwXpkwnPHNzVYHi0dEaHsbaECl1d+hhm2Nel41+lyRB0S/h+4Orh6Lq4aHRM3lJP2ziXLZxPrkKfF0OOLlBXIXjfm76EOWZVVrXAVtORIdYo/NAIVal8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545020; c=relaxed/simple;
	bh=Lgf2r3J+ySkKuEDNm0dawLdk7AJMr39miziM6Ko5Pik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kASIKAYYWT4RmDSkzk2A2/ld+VYgbWHf8WmG73QcAffb7MHfWs/fuctksi801bQEXN1ubhHgmUrRXaDD3vtOOMdz+VGzct1A2ZC+x+pWQIxflwIOscy9yzI3RrCdQgX0Pd2Gz2AaRxr0YXLk/b7En5CGwJFP+63LyzCrChn65CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad7Xb+s1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad7Xb+s1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777545019; x=1809081019;
  h=date:from:to:cc:subject:message-id;
  bh=Lgf2r3J+ySkKuEDNm0dawLdk7AJMr39miziM6Ko5Pik=;
  b=ad7Xb+s11FUILOvukvR04fqXSrycpLq0GjVNqtvHOe1hn7Bev5EFRuUF
   nztGjIV1PA3eFUI/gZK+esn49e7xN86LWzjj83ZlYcjZUIzhR69Yr7Cpk
   P64vCRLJz3lI10ZO6QI29v68POeNmNFQNWDJUD6jb/f5uNaSbk8Gv7lJ+
   uPNrfSyKq7Ff6HqkIm2p97xfgeFqeEFyy+mEvWfl4O5B+vBIKwEUZ15fU
   +fcSTA2dOSpUWCv57P6A6rhQe7rw0DEo1LzZbo6TG7x9Oylc4kJkZ2MJf
   g0UChoRC/97cQ3Hgfe3O3Cc0JL8tTIjFgSpiL2hnr011Mz872MQiBPnf/
   g==;
X-CSE-ConnectionGUID: LFfy2a/iRXKS/2I4ZJ/75A==
X-CSE-MsgGUID: +ppIsgaETFO2/BB84vbIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96057599"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="96057599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 03:30:18 -0700
X-CSE-ConnectionGUID: WI0SvSYxSKi9X0XuJE14rA==
X-CSE-MsgGUID: 9PSt8TsmQQeutZtyp9yNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="264917477"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2026 03:30:16 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIOer-00000000CHs-0j7A;
	Thu, 30 Apr 2026 10:30:13 +0000
Date: Thu, 30 Apr 2026 18:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v3 32/33]
 arch/riscv/kernel/hw_breakpoint.c:44:16: error: variable has incomplete type
 'struct sbiret'
Message-ID: <202604301857.K5W6rdKg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v3
head:   3f4817f41d4bddd9f389eacf4919824cd8bfdff4
commit: 619225e881de0229a4211b9b058154bd85619886 [32/33] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301857.K5W6rdKg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301857.K5W6rdKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301857.K5W6rdKg-lkp@intel.com/

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
