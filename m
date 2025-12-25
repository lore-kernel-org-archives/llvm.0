Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCFAD2FB;
	Thu, 25 Dec 2025 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766695643; cv=none; b=ro/yFCQR91VoJ1+27icY8gc58CR8rGO0WorjunNNO93uHCzur6UM3h5GTlycU4JqNjm3m3dJrXrgmrtfNKeM8jDPZpbpDDc8MsatMkOEzbPxnJsU5PDHHWvjzANohZQhJxyRO1UfVHU9MQHkbhCtZnNYJgbVaYp8CSuNKj6Xm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766695643; c=relaxed/simple;
	bh=htfALoQbErNeUwsD+B25lovdbvO1Sy5DDcxwCttPPzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bq5YTIYdUj4G5fIyDrSsi0CnoK7Skcc6neYMVRSU20KPpYMQ3yMR7lQMftgVF7QAOgcqLwj+UGhj0aIDjkGb0kvDYzs5wJsJwJ6n5jMUUqI4A50WjovmkG9bebYUVAChCPYJyIlrZUnwslpdUB82zWC49/+Pp9h5Zy00nhaY3g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccW2P9iz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccW2P9iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766695642; x=1798231642;
  h=date:from:to:cc:subject:message-id;
  bh=htfALoQbErNeUwsD+B25lovdbvO1Sy5DDcxwCttPPzw=;
  b=ccW2P9izjb6rlApyIRo/QMdjbokAAuTPrH9ENgwi+3NQRY8DjhmQ4Qa2
   8+sQjo5P0PjJhQTS7wnwuDLwJD2BWyUOZ8CXYf5PL/PQ/A+OMB5CDCFNO
   LLz7V0Ohem1EnkiImVggqdw6v2c2sT7Lc2IcrX3pC7Aac4DR1YBOTwo48
   tfZ99vqRqXEkJBIaFNNYe47VrNSfxBmWriU40fDiNVTouMGj/D93XpDTz
   K59MiqKR908dHl0ztThIu9SYVaWtgewStD3X5+rhAJ3qtuBBxdXy7a/H3
   2YBFMNqRAXyRy/v70Km2PjOAuqQlih/1k8Bu/B9CI50mqtRXYLStUqzJt
   A==;
X-CSE-ConnectionGUID: bhGEpeLCQEKji+dgMMYEXg==
X-CSE-MsgGUID: B2s1/YboRHWfHrQXf/ubqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68641388"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68641388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 12:47:21 -0800
X-CSE-ConnectionGUID: TlIHMNDLQ9eqDB/CN/RsiA==
X-CSE-MsgGUID: hnFkDKdaQ8ijDdRfUft7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200755583"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 12:47:19 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYsEq-000000004S7-07Rb;
	Thu, 25 Dec 2025 20:47:13 +0000
Date: Fri, 26 Dec 2025 04:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 5/15]
 arch/x86/include/asm/sync_core.h:33:15: error: invalid operand for
 instruction
Message-ID: <202512260435.f670RACW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   16f858473d90ca1f50cd701fcaa7a3a7d58c44f7
commit: 7ab00e870d46ca1ce4ddfbc68a9e36149f22ecf0 [5/15] x86/sync_core: Use RIP-relative addressing
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251226/202512260435.f670RACW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260435.f670RACW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260435.f670RACW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:7:
   In file included from include/linux/pkeys.h:5:
   In file included from include/linux/mm.h:17:
   In file included from include/linux/mmap_lock.h:15:
   In file included from include/linux/sched/mm.h:10:
   In file included from include/linux/sync_core.h:6:
>> arch/x86/include/asm/sync_core.h:33:15: error: invalid operand for instruction
      33 |                 "pushq %q0\n\t"
         |                             ^
   <inline asm>:8:17: note: instantiated into assembly here
       8 |         leaq 1f(%rip), %eax
         |                        ^~~~
   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:7:
   In file included from include/linux/pkeys.h:5:
   In file included from include/linux/mm.h:17:
   In file included from include/linux/mmap_lock.h:15:
   In file included from include/linux/sched/mm.h:10:
   In file included from include/linux/sync_core.h:6:
>> arch/x86/include/asm/sync_core.h:33:15: error: invalid operand for instruction
      33 |                 "pushq %q0\n\t"
         |                             ^
   <inline asm>:8:17: note: instantiated into assembly here
       8 |         leaq 1f(%rip), %eax
         |                        ^~~~
   2 errors generated.
--
   In file included from arch/x86/kernel/static_call.c:2:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:21:
   In file included from include/linux/sched/mm.h:10:
   In file included from include/linux/sync_core.h:6:
>> arch/x86/include/asm/sync_core.h:33:15: error: invalid operand for instruction
      33 |                 "pushq %q0\n\t"
         |                             ^
   <inline asm>:8:17: note: instantiated into assembly here
       8 |         leaq 1f(%rip), %eax
         |                        ^~~~
   1 error generated.


vim +33 arch/x86/include/asm/sync_core.h

ac1ab12a3e6e87 Mathieu Desnoyers 2018-01-29   9  
f69ca629d89d65 Ricardo Neri      2020-07-26  10  #ifdef CONFIG_X86_32
0ef8047b737d74 Juergen Gross     2024-11-29  11  static __always_inline void iret_to_self(void)
f69ca629d89d65 Ricardo Neri      2020-07-26  12  {
f69ca629d89d65 Ricardo Neri      2020-07-26  13  	asm volatile (
f69ca629d89d65 Ricardo Neri      2020-07-26  14  		"pushfl\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  15  		"pushl %%cs\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  16  		"pushl $1f\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  17  		"iret\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  18  		"1:"
f69ca629d89d65 Ricardo Neri      2020-07-26  19  		: ASM_CALL_CONSTRAINT : : "memory");
f69ca629d89d65 Ricardo Neri      2020-07-26  20  }
f69ca629d89d65 Ricardo Neri      2020-07-26  21  #else
0ef8047b737d74 Juergen Gross     2024-11-29  22  static __always_inline void iret_to_self(void)
f69ca629d89d65 Ricardo Neri      2020-07-26  23  {
f69ca629d89d65 Ricardo Neri      2020-07-26  24  	unsigned int tmp;
f69ca629d89d65 Ricardo Neri      2020-07-26  25  
f69ca629d89d65 Ricardo Neri      2020-07-26  26  	asm volatile (
f69ca629d89d65 Ricardo Neri      2020-07-26  27  		"mov %%ss, %0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  28  		"pushq %q0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  29  		"pushq %%rsp\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  30  		"addq $8, (%%rsp)\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  31  		"pushfq\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  32  		"mov %%cs, %0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26 @33  		"pushq %q0\n\t"
7ab00e870d46ca Ard Biesheuvel    2023-04-07  34  		"leaq 1f(%%rip), %0\n\t"
7ab00e870d46ca Ard Biesheuvel    2023-04-07  35  		"pushq %q0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  36  		"iretq\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  37  		"1:"
f69ca629d89d65 Ricardo Neri      2020-07-26  38  		: "=&r" (tmp), ASM_CALL_CONSTRAINT : : "cc", "memory");
f69ca629d89d65 Ricardo Neri      2020-07-26  39  }
f69ca629d89d65 Ricardo Neri      2020-07-26  40  #endif /* CONFIG_X86_32 */
f69ca629d89d65 Ricardo Neri      2020-07-26  41  

:::::: The code at line 33 was first introduced by commit
:::::: f69ca629d89d65737537e05308ac531f7bb07d5c x86/cpu: Refactor sync_core() for readability

:::::: TO: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
