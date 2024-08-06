Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E71BD015;
	Tue,  6 Aug 2024 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941724; cv=none; b=qYXaqeWpCQUM3USE3Ul9rSVS9Bqm+B0pwgHYGocngZQBRozsmfSBYy20drcBBSTtkZbk1+ihXT77qCOFgLqtQ8lEdVn4zbHi136GAUIcMjMkoStIce9Un7rBIMPP675jrrdoaax0qDS9TGtnfb/DZCS9LK/Wl3EF98vk3nhxV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941724; c=relaxed/simple;
	bh=/MR1ebzW7k9VGiKpMDDzT4sklvuyGgdkkPfc8OJqc+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmJso1oKLFWVo4nhtrc3wzYDEFKgKiVZfiKRPftPveUlnxySXc50Ul0vo5niVA6/+CTw9cZylqK9fjc7TmHcLkC47jPLZ1qfLzhhJaqLiFPuzyXEo1Kr8DlY1Le3Sad0Hvh9+A06bI1plpYNpLTqeYvDwMGUcWyAyEU/MwGCObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyuaFq+T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyuaFq+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722941723; x=1754477723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MR1ebzW7k9VGiKpMDDzT4sklvuyGgdkkPfc8OJqc+I=;
  b=OyuaFq+Tch1RsgeDfDIPQy+tm8wFPe6OWXwTRQZORenUIH6z3yOgh+Sa
   FKpYjfFjY8iRInYZAKx6toFMSlvQRfE+Jg/JfybSynRyp9ex4YHOIgA1I
   DT83nNqomZayl0TGqfja9c1Hloc1A9vC+bp7CJ9cjDDt7pJxF39y7B1Ly
   CRX/c2vzlkHY6tOezAlwMRb7JK9kOFyPe5PGP4jIM/YzmJ0LjsuYxZjis
   PmBrrRJKATjddxR6LfAR894o7aJD8EOB96MI9UVObd5oAFbeJf3S5ZAYO
   N90k1Hzk7r0gwq5xYN3lp+mc9r6PYjP+IX1oKwZUyrxBHaSlBCcrArFGx
   g==;
X-CSE-ConnectionGUID: FUf/PUDGR5ieUGV1IHOStQ==
X-CSE-MsgGUID: RI26Az+ZT86LbGeAYWCLPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21098579"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="21098579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 03:55:22 -0700
X-CSE-ConnectionGUID: z1gMKHkLRaycNOzXp+yROQ==
X-CSE-MsgGUID: LwS90z30SxiEadyw4ayNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="87411340"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2024 03:55:20 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbHqO-0004QA-15;
	Tue, 06 Aug 2024 10:55:11 +0000
Date: Tue, 6 Aug 2024 18:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 2827/3348] mm/numa_memblks.c:427:31: warning:
 implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka
 'unsigned int') changes value from 18446744073709551615 to 4294967295
Message-ID: <202408061849.90foAdAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e391b34f6aa043c7afa40a2103163a0ef06d179
commit: 79776ac67c17335deeaa3e34fb52ef5250730193 [2827/3348] arch_numa: switch over to numa_memblks
config: riscv-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061849.90foAdAx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061849.90foAdAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061849.90foAdAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/numa_memblks.c:6:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2199:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/numa_memblks.c:409:5: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     408 |                         pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
         |                                                 ~~~
         |                                                 %u
     409 |                                 PFN_PHYS(pfn_align) >> 20,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   include/linux/pfn.h:21:21: note: expanded from macro 'PFN_PHYS'
      21 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                         ^
   mm/numa_memblks.c:410:5: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     408 |                         pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
         |                                                             ~~~
         |                                                             %u
     409 |                                 PFN_PHYS(pfn_align) >> 20,
     410 |                                 PFN_PHYS(PAGES_PER_SECTION) >> 20);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   include/linux/pfn.h:21:21: note: expanded from macro 'PFN_PHYS'
      21 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                         ^
>> mm/numa_memblks.c:427:31: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     427 |         WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
         |                 ~~~~~~~~~~~~~~~~~    ^~~~~~~~~~
   include/vdso/limits.h:16:21: note: expanded from macro 'ULLONG_MAX'
      16 | #define ULLONG_MAX      (~0ULL)
         |                          ^~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/numa_memblks.c:429:31: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     429 |         WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
         |                 ~~~~~~~~~~~~~~~~~    ^~~~~~~~~~
   include/vdso/limits.h:16:21: note: expanded from macro 'ULLONG_MAX'
      16 | #define ULLONG_MAX      (~0ULL)
         |                          ^~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/numa_memblks.c:432:36: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     432 |         WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
         |                 ~~~~~~~~~~~~~~~~~~~~~~    ^~~~~~~~~~
   include/vdso/limits.h:16:21: note: expanded from macro 'ULLONG_MAX'
      16 | #define ULLONG_MAX      (~0ULL)
         |                          ^~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   10 warnings generated.


vim +427 mm/numa_memblks.c

31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  373) 
c197ac49b602c0 Mike Rapoport (Microsoft  2024-08-01  374) static int __init numa_register_meminfo(struct numa_meminfo *mi)
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  375) {
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  376) 	int i;
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  377) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  378) 	/* Account for nodes with cpus and no memory */
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  379) 	node_possible_map = numa_nodes_parsed;
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  380) 	numa_nodemask_from_meminfo(&node_possible_map, mi);
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  381) 	if (WARN_ON(nodes_empty(node_possible_map)))
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  382) 		return -EINVAL;
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  383) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  384) 	for (i = 0; i < mi->nr_blks; i++) {
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  385) 		struct numa_memblk *mb = &mi->blk[i];
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  386) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  387) 		memblock_set_node(mb->start, mb->end - mb->start,
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  388) 				  &memblock.memory, mb->nid);
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  389) 	}
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  390) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  391) 	/*
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  392) 	 * At very early time, the kernel have to use some memory such as
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  393) 	 * loading the kernel image. We cannot prevent this anyway. So any
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  394) 	 * node the kernel resides in should be un-hotpluggable.
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  395) 	 *
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  396) 	 * And when we come here, alloc node data won't fail.
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  397) 	 */
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  398) 	numa_clear_kernel_node_hotplug();
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  399) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  400) 	/*
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  401) 	 * If sections array is gonna be used for pfn -> nid mapping, check
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  402) 	 * whether its granularity is fine enough.
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  403) 	 */
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  404) 	if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  405) 		unsigned long pfn_align = node_map_pfn_alignment();
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  406) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  407) 		if (pfn_align && pfn_align < PAGES_PER_SECTION) {
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  408) 			pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01 @409) 				PFN_PHYS(pfn_align) >> 20,
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  410) 				PFN_PHYS(PAGES_PER_SECTION) >> 20);
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  411) 			return -EINVAL;
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  412) 		}
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  413) 	}
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  414) 
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  415) 	return 0;
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  416) }
31d21d671fdc31 Mike Rapoport (Microsoft  2024-08-01  417) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  418) int __init numa_memblks_init(int (*init_func)(void),
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  419) 			     bool memblock_force_top_down)
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  420) {
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  421) 	int ret;
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  422) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  423) 	nodes_clear(numa_nodes_parsed);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  424) 	nodes_clear(node_possible_map);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  425) 	nodes_clear(node_online_map);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  426) 	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01 @427) 	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  428) 				  NUMA_NO_NODE));
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  429) 	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  430) 				  NUMA_NO_NODE));
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  431) 	/* In case that parsing SRAT failed. */
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  432) 	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  433) 	numa_reset_distance();
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  434) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  435) 	ret = init_func();
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  436) 	if (ret < 0)
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  437) 		return ret;
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  438) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  439) 	/*
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  440) 	 * We reset memblock back to the top-down direction
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  441) 	 * here because if we configured ACPI_NUMA, we have
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  442) 	 * parsed SRAT in init_func(). It is ok to have the
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  443) 	 * reset here even if we did't configure ACPI_NUMA
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  444) 	 * or acpi numa init fails and fallbacks to dummy
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  445) 	 * numa init.
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  446) 	 */
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  447) 	if (memblock_force_top_down)
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  448) 		memblock_set_bottom_up(false);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  449) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  450) 	ret = numa_cleanup_meminfo(&numa_meminfo);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  451) 	if (ret < 0)
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  452) 		return ret;
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  453) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  454) 	numa_emulation(&numa_meminfo, numa_distance_cnt);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  455) 
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  456) 	return numa_register_meminfo(&numa_meminfo);
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  457) }
d971e58110f7f8 Mike Rapoport (Microsoft  2024-08-01  458) 

:::::: The code at line 427 was first introduced by commit
:::::: d971e58110f7f8a3869d75578d245fcd9759c947 mm: numa_memblks: introduce numa_memblks_init

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
