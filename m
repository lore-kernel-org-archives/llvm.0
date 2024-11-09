Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01513DBBE;
	Sat,  9 Nov 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731142366; cv=none; b=Hax+/DvEnNxeK91raascdNnGOffjxuAfciSMaixc3VCHL2Qs3y7603Db4MBNxIctY5d9lp0jdlWlt9Y8eFNwax9tHaFk0Ccq7F6SZH5IX8slysawr/sYz1glvJUyDt+epJrgOJBtTc9kQj9B4Vm2oCIlkJ3kSG6zS5DNjQQ6R3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731142366; c=relaxed/simple;
	bh=BchPLZPtgzlcarw4o9OoZCkI7Vwd4jrxVAYxPnr5eHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfoszZ8ACVJlRrgdoi91qjFtNUxPuZLbDTGzkYKF4C2/Ydjtr1VhHTLSbjBViCrEtgAFSamSPWvmt2GMnqhZLsuheUyJFZ9FmEHDTFe/4Mse+UCWkaSDRuuGvNqWu6V5cU4EFIaeNp+dZm/7DYy/liQs1C2JMHZM8TcUIoDp04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tplw29uR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tplw29uR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731142364; x=1762678364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BchPLZPtgzlcarw4o9OoZCkI7Vwd4jrxVAYxPnr5eHU=;
  b=Tplw29uRAKBkNwLkew+iY9kDIaKBMTrIQB2XfHbpVWb4Zg9gSFbXTfGA
   UKs83W8Po6EneyTFZ/gK1p7RmKx+zMNsRG942WqQgmIDXL9MNFjBP+SCS
   ILlBT1c7BMOXqXmedA9erzZRma6q9BRD/VNnXuCZG2ID4B+jtp0FV6sfV
   CFpViABvT/Luc0Pm96LRVwa5RbYkkHYJzdDDftZ+D5A4Uuk6iAhpO86NQ
   4jU53olq0nhrrMcG9NDMe7D3L8hpoHJUEzfWX2farwfJK2R7XNQuhNJh5
   IXmgqzT2WOsrUaNF7ofyJQxs5SJdoyFLki0gjzLcs+GDvjU0ZinTGhIK1
   A==;
X-CSE-ConnectionGUID: 7iw+ZsK1Rb6HHMx5cfIvdQ==
X-CSE-MsgGUID: qQ7PJuvITPCLc8brwNLzjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18646742"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="18646742"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 00:52:41 -0800
X-CSE-ConnectionGUID: x0zDbvrmTZGZVmhzdY1HZQ==
X-CSE-MsgGUID: JIBWEN6eShC2OBb8U9+Omg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="109243721"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2024 00:52:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9hCv-000sEw-1z;
	Sat, 09 Nov 2024 08:52:37 +0000
Date: Sat, 9 Nov 2024 16:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 18/19]
 arch/arm64/kernel/ftrace.c:147:15: warning: no previous prototype for
 function 'arch_ftrace_get_symaddr'
Message-ID: <202411091642.i8f92qD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   45b6f29f12043a3d5cb155ac4e09fa61229ebb00
commit: e71b9c51db1c3f9c80041c2c90b66f04ea7c27e1 [18/19] ftrace: Add ftrace_get_symaddr to convert fentry_ip to symaddr
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241109/202411091642.i8f92qD9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091642.i8f92qD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091642.i8f92qD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/ftrace.c:9:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ftrace.c:147:15: warning: no previous prototype for function 'arch_ftrace_get_symaddr' [-Wmissing-prototypes]
     147 | unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
         |               ^
   arch/arm64/kernel/ftrace.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
         | ^
         | static 
   5 warnings generated.


vim +/arch_ftrace_get_symaddr +147 arch/arm64/kernel/ftrace.c

   145	
   146	/* Convert fentry_ip to the symbol address without kallsyms */
 > 147	unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
   148	{
   149		u32 insn;
   150	
   151		/*
   152		 * When using patchable-function-entry without pre-function NOPS, ftrace
   153		 * entry is the address of the first NOP after the function entry point.
   154		 *
   155		 * The compiler has either generated:
   156		 *
   157		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   158		 * func+04:		NOP		// To be patched to BL <caller>
   159		 *
   160		 * Or:
   161		 *
   162		 * func-04:		BTI	C
   163		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   164		 * func+04:		NOP		// To be patched to BL <caller>
   165		 *
   166		 * The fentry_ip is the address of `BL <caller>` which is at `func + 4`
   167		 * bytes in either case.
   168		 */
   169		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
   170			return fentry_ip - AARCH64_INSN_SIZE;
   171	
   172		/*
   173		 * When using patchable-function-entry with pre-function NOPs, BTI is
   174		 * a bit different.
   175		 *
   176		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
   177		 * func+04:		NOP		// To be patched to BL <caller>
   178		 *
   179		 * Or:
   180		 *
   181		 * func+00:	func:	BTI	C
   182		 * func+04:		NOP		// To be patched to MOV X9, LR
   183		 * func+08:		NOP		// To be patched to BL <caller>
   184		 *
   185		 * The fentry_ip is the address of `BL <caller>` which is at either
   186		 * `func + 4` or `func + 8` depends on whether there is a BTI.
   187		 */
   188	
   189		/* If there is no BTI, the func address should be one instruction before. */
   190		if (!IS_ENABLED(CONFIG_ARM64_BTI_KERNEL))
   191			return fentry_ip - AARCH64_INSN_SIZE;
   192	
   193		/* We want to be extra safe in case entry ip is on the page edge,
   194		 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
   195		 */
   196		if ((fentry_ip & ~PAGE_MASK) < AARCH64_INSN_SIZE * 2) {
   197			if (get_kernel_nofault(insn, (u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2)))
   198				return 0;
   199		} else {
   200			insn = *(u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2);
   201		}
   202	
   203		if (aarch64_insn_is_bti(le32_to_cpu((__le32)insn)))
   204			return fentry_ip - AARCH64_INSN_SIZE * 2;
   205	
   206		return fentry_ip - AARCH64_INSN_SIZE;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
