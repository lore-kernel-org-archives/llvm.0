Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E0428382;
	Wed, 15 May 2024 18:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715797802; cv=none; b=KuzEvixtHOttZp2ooXGVSQoikNJkWCft6B4+gAjitKWTLU7TniRRRaM5lpoWNS2JcV4vSdaqoynMsCfb+A1qZz08h5MTv+0yfSw6Vhr6sGS/zJyIek9vd8rOnbtBjdTdmLxfL9Ubq+ERTbHgjStdzsKlPRX9XZgCnbrrcP9jsjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715797802; c=relaxed/simple;
	bh=Hznvrbw2gFkVJdhmDSVLI2HstkFtLp0w+kC277fjVvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xsyj00yRM6d7MX+GUu96fid3oqjAotLy2fbPbbzVbhVB3v9Z3ML8uwE4xITHIJENLrsxq0O9DSmQW3vqJOClStFZXyYPag1yn9y4LBXDTPhACCO6Ub2/mQ1d3sIY3AeroGSsdNuSzuhlaHdDO69YanvgTFv6l8XLgcl+vmxMERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaxtKBEa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaxtKBEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715797801; x=1747333801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hznvrbw2gFkVJdhmDSVLI2HstkFtLp0w+kC277fjVvc=;
  b=ZaxtKBEaGGBvs8mAHoxAqRq75s+FDuKfFw4UoVDzGSc+ygD3BW8zYMIr
   zqOKvkUSF4a82AVLvVhmu1PY7J1fUZv9gNJo87jfCVgQg3rF4cehXtQmM
   +F89ub5wcgOo1ay38wB/HyWhnLPMcy1mudbIkrXSerDYR5HMnYksjUQbP
   bdcFXXLiZDg8Gw6Hz+Fcep7kU9U7wJvgR8tGBhwSp90ojv8nEflK/KtMf
   oS275N0vYx1/OFjdFqAEEdg2HEDwmX940IKiCVi6WX39JXRIH56Y6pG8E
   jsHL2Yk6S8jj6LjKD4eAZpK8x7Dxz5l3gR52pmNIw6ZU/H7KHl2LIQnVb
   g==;
X-CSE-ConnectionGUID: AbehlR8wRcKCUItZ8RQvIw==
X-CSE-MsgGUID: PXM7IA5KQ3ymr/QES2S7UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37251088"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="37251088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 11:30:00 -0700
X-CSE-ConnectionGUID: Qt/939piTbKst1KwjEhCzw==
X-CSE-MsgGUID: IlawGVXRSq685ZdH2nzQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31572578"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2024 11:29:59 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7JO0-000D9H-0F;
	Wed, 15 May 2024 18:29:56 +0000
Date: Thu, 16 May 2024 02:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [jic23-cxl-staging:arm-numa-fixes 6/11] arch/arm64/mm/init.c:75:5:
 error: redefinition of 'phys_to_target_node'
Message-ID: <202405160205.q9HRVkxO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/cxl-staging.git arm-numa-fixes
head:   d077bf9570e8024f6d670d5662b62778715084fc
commit: 67c8bdd7ebb95e48944e4ebffe0a6ce6b68d1663 [6/11] arm64: memblock: Introduce a generic phys_addr_to_target_node()
config: arm64-randconfig-002-20240515 (https://download.01.org/0day-ci/archive/20240516/202405160205.q9HRVkxO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160205.q9HRVkxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160205.q9HRVkxO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/mm/init.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/arm64/mm/init.c:63:5: error: redefinition of 'memory_add_physaddr_to_nid'
      63 | int memory_add_physaddr_to_nid(u64 start)
         |     ^
   arch/arm64/include/asm/sparsemem.h:32:36: note: expanded from macro 'memory_add_physaddr_to_nid'
      32 | #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
         |                                    ^
   include/linux/numa.h:47:19: note: previous definition is here
      47 | static inline int memory_add_physaddr_to_nid(u64 start)
         |                   ^
>> arch/arm64/mm/init.c:75:5: error: redefinition of 'phys_to_target_node'
      75 | int phys_to_target_node(phys_addr_t start)
         |     ^
   arch/arm64/include/asm/sparsemem.h:34:29: note: expanded from macro 'phys_to_target_node'
      34 | #define phys_to_target_node phys_to_target_node
         |                             ^
   include/linux/numa.h:51:19: note: previous definition is here
      51 | static inline int phys_to_target_node(u64 start)
         |                   ^
   1 warning and 2 errors generated.


vim +/phys_to_target_node +75 arch/arm64/mm/init.c

    62	
  > 63	int memory_add_physaddr_to_nid(u64 start)
    64	{
    65		int nid = __memory_add_physaddr_to_nid(start);
    66	
    67		/* Default to node0 as not all callers are prepared for this to fail */
    68		if (nid == NUMA_NO_NODE)
    69			return 0;
    70	
    71		return nid;
    72	}
    73	EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
    74	
  > 75	int phys_to_target_node(phys_addr_t start)
    76	{
    77		unsigned long start_pfn, end_pfn, pfn = PHYS_PFN(start);
    78		int nid = __memory_add_physaddr_to_nid(start);
    79	
    80		if (nid != NUMA_NO_NODE)
    81			return nid;
    82	
    83		/*
    84		 * Search reserved memory ranges since the memory address does
    85		 * not appear to be online
    86		 */
    87		for_each_node_state(nid, N_POSSIBLE) {
    88			get_reserved_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
    89			if (pfn >= start_pfn && pfn <= end_pfn)
    90				return nid;
    91		}
    92	
    93		return NUMA_NO_NODE;
    94	}
    95	EXPORT_SYMBOL(phys_to_target_node);
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
