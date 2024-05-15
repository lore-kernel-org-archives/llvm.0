Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16A93BBEA;
	Wed, 15 May 2024 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715802126; cv=none; b=ZFExpZ3heoTojCV21Rp+PIOmlYUibxl2lPRIEJl748+kgllfB0rga6S71i5R248lvsSepjr1tYL+aRCTzbCnn2j8JmqSFnA1j1257B/5tH2pHdEz1XTlOJnC4S8M8CnzJx8/IxeOl+IV2lLliFG8EVZJTZpkO4+zeJcrMe5V1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715802126; c=relaxed/simple;
	bh=CtwBuYhdtNF/tSedOPtlrGMFthimmguPrRv9lXRZ1j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XORY1alzJRWeKUW4GNB7FKKmiqaBfl9RInHE2nHebnNrY3nOPwQiR4Y5ZuuZquRxp3QjhO5/UqAkwMNHquVdapgngHepJwqrxC5Cg7BtQyRZb5uXFBpEfYP0EUqbMizZ82MSMCb37YJoAf5uVRlb8jUCtJU+ZCQ+3A9JVKmy3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xem8QH4e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xem8QH4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715802124; x=1747338124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CtwBuYhdtNF/tSedOPtlrGMFthimmguPrRv9lXRZ1j8=;
  b=Xem8QH4ean5K3mr/3dlmVBvhegt2STRMWGggxe/KsjwMnb8/LVzgPl02
   M2A8x5lXjzs/zqeBcTuGzbRgPVpkXtxpxPjehavf9Q80GifcbeHuNebcz
   RmrmcJCjkmjqp4/KT9WSIVmKR84iq2IR97SVZpAzMwm5gl7/eg6wgJ0MM
   pucvFHuVUUZ8paXO8A12EIrcFgGpiVlsI1xhqv306RyQfBd/soO9OMjp7
   OfqdW4mJOoucldVWYn7SnejV8tU4t/dZGiLlk3RdZScjlO5jVt8ugfLD7
   Dz7xFeTEQGUbTDxtFSvYBG/+EL2cIg/aAwCd2gxdvpw0WmAP19VWNkoD7
   Q==;
X-CSE-ConnectionGUID: MycJs/4NQkm/OHCsfAQOXQ==
X-CSE-MsgGUID: Fc4WQ04yQ1OBil9OcSNsCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34385761"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="34385761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 12:42:03 -0700
X-CSE-ConnectionGUID: myTNst6yRDiUUNmPfpPD4g==
X-CSE-MsgGUID: yEbwpkFNSkuh6hI81iEhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35699691"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2024 12:42:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7KVj-000DCd-1J;
	Wed, 15 May 2024 19:41:59 +0000
Date: Thu, 16 May 2024 03:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jic23-cxl-staging:arm-numa-fixes 10/11] arch/arm64/mm/init.c:54:12:
 warning: no previous prototype for function 'numa_fill_memblks'
Message-ID: <202405160319.ggK7PjJZ-lkp@intel.com>
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
commit: f4ce7f00375d478828eebf7618d56dce35607227 [10/11] arm64: mm: numa_fill_memblks() to add a memblock.reserved region if match.
config: arm64-randconfig-002-20240515 (https://download.01.org/0day-ci/archive/20240516/202405160319.ggK7PjJZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160319.ggK7PjJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160319.ggK7PjJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/mm/init.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/mm/init.c:54:12: warning: no previous prototype for function 'numa_fill_memblks' [-Wmissing-prototypes]
      54 | int __init numa_fill_memblks(u64 start, u64 end)
         |            ^
   arch/arm64/mm/init.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | int __init numa_fill_memblks(u64 start, u64 end)
         | ^
         | static 
   arch/arm64/mm/init.c:89:5: error: redefinition of 'memory_add_physaddr_to_nid'
      89 | int memory_add_physaddr_to_nid(u64 start)
         |     ^
   arch/arm64/include/asm/sparsemem.h:32:36: note: expanded from macro 'memory_add_physaddr_to_nid'
      32 | #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
         |                                    ^
   include/linux/numa.h:47:19: note: previous definition is here
      47 | static inline int memory_add_physaddr_to_nid(u64 start)
         |                   ^
   arch/arm64/mm/init.c:101:5: error: redefinition of 'phys_to_target_node'
     101 | int phys_to_target_node(phys_addr_t start)
         |     ^
   arch/arm64/include/asm/sparsemem.h:34:29: note: expanded from macro 'phys_to_target_node'
      34 | #define phys_to_target_node phys_to_target_node
         |                             ^
   include/linux/numa.h:51:19: note: previous definition is here
      51 | static inline int phys_to_target_node(u64 start)
         |                   ^
   2 warnings and 2 errors generated.


vim +/numa_fill_memblks +54 arch/arm64/mm/init.c

    49	
    50	/*
    51	 * Scan existing memblocks and if this region overlaps with a region with
    52	 * a nid set, add a reserved memblock.
    53	 */
  > 54	int __init numa_fill_memblks(u64 start, u64 end)
    55	{
    56		struct memblock_region *region;
    57	
    58		for_each_mem_region(region) {
    59			int nid = memblock_get_region_node(region);
    60	
    61			if (nid == NUMA_NO_NODE)
    62				continue;
    63			if (!(end < region->base || start >= region->base + region->size)) {
    64				memblock_add_reserved_node(start, end - start, nid,
    65							   MEMBLOCK_RSRV_NOINIT);
    66				return 0;
    67			}
    68		}
    69	
    70		memblock_add_reserved_node(start, end - start, NUMA_NO_NODE,
    71					   MEMBLOCK_RSRV_NOINIT);
    72	
    73		return NUMA_NO_MEMBLK;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
