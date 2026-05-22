Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77D3E5A22;
	Fri, 22 May 2026 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449580; cv=none; b=XvCI6mHkspZr1YwF1anpLy0+2ZEEQyw1F0Yb2GqGYPLwhpmIUs2+sW/xgpUGmdieA88/G8v6kwPUXIDzI3xeJKT3F+hSVB66hmrzrayKtVUrbN0+C+aomw3CQ7tUsPMbpclgaiojOlY6I4ef5QZW1MdHDhzwgAnG5tzO4Uz0EWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449580; c=relaxed/simple;
	bh=BCL9WKYP3XMNvDMEg/BhcgYwLWvyWXnom3jjSNbDs7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+YjJLoNRUDQJdQTzNeE+xBM5eBUUVoR6J8VgvNTW/ABaflim0uh5gNAl2Q7h6XL+3el8c1qn8qEyggOwB1moY01EEsTX0WjlCX6C/gAP1KbCUH0mUt3ecsyhfX54/MSmvqKmWbDiUTdXlId0mj0yZ/NON8SNNj3RrhkDStYI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BC8KtE4m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BC8KtE4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779449578; x=1810985578;
  h=date:from:to:cc:subject:message-id;
  bh=BCL9WKYP3XMNvDMEg/BhcgYwLWvyWXnom3jjSNbDs7o=;
  b=BC8KtE4mMIYcd0P/QrMNILO9U2zw+Q7fa2z+nn2LT49KkPrVNOejKRj8
   WDy8eUb3jSutbUi4eHSO43pxznpMR0WEOrx5D+pIHWRtuj32j2AT5PCAS
   TX+Io+92TC+qEqWgyg7y4NeXVHPudTRD3FhwMDrm6GGAwS4ZLp9y0P0fv
   5OAq5WlMNRciS9FRoiEaWd1Te0PdBP6YuJ6Z+469s8QzH02v3rnhmx4ql
   YfvHU//16cM97Psn9y+0kSoPyhF+KjRiPaInTgy9MWMGfdbUyf+ZVgBMx
   jq4WcawF74TqEshzDZDYlha3f5dwbEtUlYIWOVpTLuuf5IvVCk8pECsD4
   w==;
X-CSE-ConnectionGUID: xYcBcsNZQ7iDaXTFInTnwQ==
X-CSE-MsgGUID: 2GsAqhJHR3yDGEsGXdHx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91067876"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91067876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:32:58 -0700
X-CSE-ConnectionGUID: q7XVEPR5R4enBujiIfIFtA==
X-CSE-MsgGUID: L7lwV0XJQ2mlLQYDTLK9QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="238289808"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2026 04:32:56 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQO7Z-000000002ID-472J;
	Fri, 22 May 2026 11:32:53 +0000
Date: Fri, 22 May 2026 19:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 564/1197]
 arch/loongarch/kernel/smp.c:402:22: error: incompatible integer to pointer
 conversion passing 'unsigned long' to parameter of type 'const volatile void
 *'
Message-ID: <202605221957.S6VvvX7u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: c705a2a26db042bb193041c1c5ada8edc3fa4376 [564/1197] cheri: Use uintptr_t in page related headers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221957.S6VvvX7u-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221957.S6VvvX7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221957.S6VvvX7u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/smp.c:402:22: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const volatile void *' [-Wint-conversion]
     402 |         entry = __pa_symbol((unsigned long)&smpboot_entry);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:118:48: note: expanded from macro '__pa_symbol'
     118 | #define __pa_symbol(x)  __pa(RELOC_HIDE(__c_pa(x), 0))
         |                                                ^
   include/linux/compiler.h:158:35: note: expanded from macro 'RELOC_HIDE'
     158 |      __ptr = (uintptr_t __force) (ptr);                         \
         |                                   ^~~
   arch/loongarch/include/asm/page.h:66:27: note: expanded from macro '__pa'
      66 | #define __pa(x)         PHYSADDR(x)
         |                                  ^
   arch/loongarch/include/asm/addrspace.h:127:34: note: expanded from macro 'PHYSADDR'
     127 | #define PHYSADDR(a)             ((_ACAST64_(a)) & TO_PHYS_MASK)
         |                                             ^
   include/linux/cheri.h:222:29: note: passing argument to parameter 'ptr' here
     222 | __c_pa(const volatile void *ptr)
         |                             ^
>> arch/loongarch/kernel/smp.c:402:22: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const volatile void *' [-Wint-conversion]
     402 |         entry = __pa_symbol((unsigned long)&smpboot_entry);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:118:48: note: expanded from macro '__pa_symbol'
     118 | #define __pa_symbol(x)  __pa(RELOC_HIDE(__c_pa(x), 0))
         |                                                ^
   include/linux/compiler.h:159:13: note: expanded from macro 'RELOC_HIDE'
     159 |     (typeof(ptr) __force) (__ptr + (off)); })
         |             ^~~
   arch/loongarch/include/asm/page.h:66:27: note: expanded from macro '__pa'
      66 | #define __pa(x)         PHYSADDR(x)
         |                                  ^
   arch/loongarch/include/asm/addrspace.h:127:34: note: expanded from macro 'PHYSADDR'
     127 | #define PHYSADDR(a)             ((_ACAST64_(a)) & TO_PHYS_MASK)
         |                                             ^
   include/linux/cheri.h:222:29: note: passing argument to parameter 'ptr' here
     222 | __c_pa(const volatile void *ptr)
         |                             ^
   2 errors generated.


vim +402 arch/loongarch/kernel/smp.c

46859ac8af52ae Huacai Chen 2022-05-31  392  
46859ac8af52ae Huacai Chen 2022-05-31  393  /*
46859ac8af52ae Huacai Chen 2022-05-31  394   * Setup the PC, SP, and TP of a secondary processor and start it running!
46859ac8af52ae Huacai Chen 2022-05-31  395   */
c56ab8e85d6de5 Huacai Chen 2022-11-21  396  void loongson_boot_secondary(int cpu, struct task_struct *idle)
46859ac8af52ae Huacai Chen 2022-05-31  397  {
46859ac8af52ae Huacai Chen 2022-05-31  398  	unsigned long entry;
46859ac8af52ae Huacai Chen 2022-05-31  399  
46859ac8af52ae Huacai Chen 2022-05-31  400  	pr_info("Booting CPU#%d...\n", cpu);
46859ac8af52ae Huacai Chen 2022-05-31  401  
46859ac8af52ae Huacai Chen 2022-05-31 @402  	entry = __pa_symbol((unsigned long)&smpboot_entry);
46859ac8af52ae Huacai Chen 2022-05-31  403  	cpuboot_data.stack = (unsigned long)__KSTK_TOS(idle);
46859ac8af52ae Huacai Chen 2022-05-31  404  	cpuboot_data.thread_info = (unsigned long)task_thread_info(idle);
46859ac8af52ae Huacai Chen 2022-05-31  405  
46859ac8af52ae Huacai Chen 2022-05-31  406  	csr_mail_send(entry, cpu_logical_map(cpu), 0);
46859ac8af52ae Huacai Chen 2022-05-31  407  
316863cb62fe7a Bibo Mao    2024-05-06  408  	loongson_send_ipi_single(cpu, ACTION_BOOT_CPU);
46859ac8af52ae Huacai Chen 2022-05-31  409  }
46859ac8af52ae Huacai Chen 2022-05-31  410  

:::::: The code at line 402 was first introduced by commit
:::::: 46859ac8af52ae599e1b51992ddef3eb43f295fc LoongArch: Add multi-processor (SMP) support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
