Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1AB36493F;
	Thu, 30 Jul 2026 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378228; cv=none; b=rCl1joXO7gqet7ODqDsYfe3fMiD3er9ngohuG6ZQrGOfxL3c2+N1LFtwFRU1KMavg8hP4gIkNfvjfJ89U1IB8HDKIyiGaFsvsXK92p/5+F6EvFiwyyZqCrzY2ofY8ke0Up8rpYXsBxCpIO9YeuVTpPjDOmikuixsFlbYVzHfpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378228; c=relaxed/simple;
	bh=P5EpUQaH2DbBZ6df/qGwvRSNwMkt/6l69zALNrSPUZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FbRE0+3/Kyar1QYouxAgdnFieQrbsoRFhzEoioPOmqjoTpNqSDTf+Cg8UfepwDG8MGAt7IYw+wfdbzQH0e0ahR4IVNMlHY7awOgjf+Muerj1SgIHBJbIzlRKxtWZmgAB5mI5DKB5+0n+01QPay7xBdGZGfrSLsPeCtub63ouiDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQtddymL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQtddymL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785378226; x=1816914226;
  h=date:from:to:cc:subject:message-id;
  bh=P5EpUQaH2DbBZ6df/qGwvRSNwMkt/6l69zALNrSPUZ4=;
  b=hQtddymL6su6zRtuwRRIJNWzejC2d+sSOZ4iQabg4S+4tt0Ck4nN03MJ
   SLltEIzHw/7gxR1o7hq6snJvx1VPXPYk6wziW8WMDiBy+o1ZnluH5arQy
   drC1RFlNKVPlUaIBm9wzebHjbpM1uJqVAVkTABECybp19xCLpuMlKjnfM
   GjJcdL9rBZ6akH8LSYyfZNHQq+u+Awotq6hrgG87bxOvX4c5/tH8QWUQq
   A/9uGY6M95hNNOjwmkr8Pxy0wUQEj9hlvxBTC3pLfMaKTmaA3hzEyfgNk
   BdJ3acUwqZfstiTPzlIGKyveuIJzoUL7yLgEmpHP5js+5DsWH9CGMch9h
   A==;
X-CSE-ConnectionGUID: rTHGBimrQ0ar7b4UY8ghyA==
X-CSE-MsgGUID: lpy3ayNYSBKEiw0iqJc4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89672819"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="89672819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:23:45 -0700
X-CSE-ConnectionGUID: 1Ljtrx4BTwa5zvNSRiYF1g==
X-CSE-MsgGUID: inCIkAc4T6WFOd/C9p0ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="258937403"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2026 19:23:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpGQp-00000000fvW-3Ljo;
	Thu, 30 Jul 2026 02:23:36 +0000
Date: Thu, 30 Jul 2026 10:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [linux-next:master 7971/10444]
 include/linux/kexec_handover.h:47:41: error: use of undeclared identifier
 'HPAGE_PMD_ORDER'
Message-ID: <202607301001.ARjK0D4v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: f476132a8999edf2225185652dce98a42347e8c9 [7971/10444] mm/mm_init: don't rely on memblock to get KHO scratch migratetype
config: x86_64-randconfig-001-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301001.ARjK0D4v-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301001.ARjK0D4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301001.ARjK0D4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/liveupdate/kho_block.c:24:
>> include/linux/kexec_handover.h:47:41: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
      47 |         if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from kernel/liveupdate/kho_block.c:24:
>> include/linux/kexec_handover.h:47:41: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
      47 |         if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from kernel/liveupdate/luo_flb.c:45:
>> include/linux/kexec_handover.h:47:41: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
      47 |         if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from kernel/liveupdate/luo_flb.c:45:
>> include/linux/kexec_handover.h:47:41: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
      47 |         if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from kernel/liveupdate/luo_flb.c:49:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/liveupdate/luo_flb.c:49:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/liveupdate/luo_flb.c:49:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/liveupdate/luo_flb.c:49:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/liveupdate/luo_flb.c:49:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/liveupdate/luo_flb.c:49:
   In file included from include/linux/module.h:20:


vim +/HPAGE_PMD_ORDER +47 include/linux/kexec_handover.h

    43	
    44	static inline enum migratetype kho_scratch_migratetype(unsigned long pfn,
    45							       enum migratetype mt)
    46	{
  > 47		if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
    48			return MIGRATE_CMA;
    49		return mt;
    50	}
    51	#else
    52	static inline bool kho_is_enabled(void)
    53	{
    54		return false;
    55	}
    56	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
