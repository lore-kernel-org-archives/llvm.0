Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A71447F45;
	Wed, 15 May 2024 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715793420; cv=none; b=rrVuHAEbftktaif+hdkLqxWy86BUujwPnVfscukZEOky/MnLZdhLXCKI2JY4oeGCRIL5st+eMMX158kDo0T+N6p+6fcE6lodfyIvuDGhpn5EPRiQVb6WAfHOyanfFc58aIGb4yaV/IizNTk3tobh2HpxzK4FP1A2aFKB5084C6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715793420; c=relaxed/simple;
	bh=Cv8cQhiuRLnjyCdZV8VgcPNeCf+Rc51G5AztwEIPyio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRzsz8hs1CHfgka5bdBXgCmArTNizZBnaJ1nIwN1knRYjI405PPlrKGRpLTa/DMm6jf/PE4iZyd81vPydIl5sP+7PitnI53sM3ukjCuvVx6qMOOc1aOEii45L3I0DOqyJ5oajh7gugA/3GgAyeoLdQRc94c5YAfEFCartGj4k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnW4G6Tt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnW4G6Tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715793419; x=1747329419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cv8cQhiuRLnjyCdZV8VgcPNeCf+Rc51G5AztwEIPyio=;
  b=mnW4G6TtazLzejycN1gC+oAT+00gmI02rvLrfwCNlOUofuUJvNWSEgCi
   +Mi4OOQ70RZK0v9vpfo+2TRx3Zr/dHLSzoyEhM//HdBVuQ3eB3/9awyS6
   pES+Fn710ozWBdQkpTE3Qza4kHSPhkAtFn7SVQxHXkJGCWXDal+KkOGwV
   srM9NNKjzglII+xMNb0bBRc4P2DmThSsTODl4VlKmO3qUF7O+MBjyH8ba
   Q1p14tWBqptzCag/Q+4Ep4xaCBcAojC8cBOy6GIQ9AjYaSEUIKu1Apf2w
   OJ1oNIRy444mPBjFHH8IIG8WY6iFljtz/1cBmgC4eyBmpVk6lE17zcE4u
   A==;
X-CSE-ConnectionGUID: WtBvba9xSAie1V4SGNRUcA==
X-CSE-MsgGUID: ZUwBqKn4SJSjsm029+dFEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23262276"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23262276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:16:56 -0700
X-CSE-ConnectionGUID: BWUyZyXCQXeAAD2tCgmYfg==
X-CSE-MsgGUID: xL+qTyB5TqGUs/QExiGrnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35678648"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2024 10:16:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7IFI-000D4y-3D;
	Wed, 15 May 2024 17:16:52 +0000
Date: Thu, 16 May 2024 01:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [jic23-cxl-staging:arm-numa-fixes 5/11] arch/arm64/mm/init.c:63:5:
 error: redefinition of 'memory_add_physaddr_to_nid'
Message-ID: <202405160106.sIy16AlA-lkp@intel.com>
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
commit: c17c987d979cab4f0118c1d025fd0c7e096c77f1 [5/11] arm64: numa: Introduce a memory_add_physaddr_to_nid()
config: arm64-randconfig-002-20240515 (https://download.01.org/0day-ci/archive/20240516/202405160106.sIy16AlA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160106.sIy16AlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160106.sIy16AlA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/mm/init.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/mm/init.c:63:5: error: redefinition of 'memory_add_physaddr_to_nid'
      63 | int memory_add_physaddr_to_nid(u64 start)
         |     ^
   arch/arm64/include/asm/sparsemem.h:31:36: note: expanded from macro 'memory_add_physaddr_to_nid'
      31 | #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
         |                                    ^
   include/linux/numa.h:47:19: note: previous definition is here
      47 | static inline int memory_add_physaddr_to_nid(u64 start)
         |                   ^
   1 warning and 1 error generated.


vim +/memory_add_physaddr_to_nid +63 arch/arm64/mm/init.c

  > 12	#include <linux/swap.h>
    13	#include <linux/init.h>
    14	#include <linux/cache.h>
    15	#include <linux/mman.h>
    16	#include <linux/nodemask.h>
    17	#include <linux/initrd.h>
    18	#include <linux/gfp.h>
    19	#include <linux/math.h>
    20	#include <linux/memblock.h>
    21	#include <linux/sort.h>
    22	#include <linux/of.h>
    23	#include <linux/of_fdt.h>
    24	#include <linux/dma-direct.h>
    25	#include <linux/dma-map-ops.h>
    26	#include <linux/efi.h>
    27	#include <linux/swiotlb.h>
    28	#include <linux/vmalloc.h>
    29	#include <linux/mm.h>
    30	#include <linux/kexec.h>
    31	#include <linux/crash_dump.h>
    32	#include <linux/hugetlb.h>
    33	#include <linux/acpi_iort.h>
    34	#include <linux/kmemleak.h>
    35	
    36	#include <asm/boot.h>
    37	#include <asm/fixmap.h>
    38	#include <asm/kasan.h>
    39	#include <asm/kernel-pgtable.h>
    40	#include <asm/kvm_host.h>
    41	#include <asm/memory.h>
    42	#include <asm/numa.h>
    43	#include <asm/sections.h>
    44	#include <asm/setup.h>
    45	#include <linux/sizes.h>
    46	#include <asm/tlb.h>
    47	#include <asm/alternative.h>
    48	#include <asm/xen/swiotlb-xen.h>
    49	
    50	static int __memory_add_physaddr_to_nid(u64 addr)
    51	{
    52		unsigned long start_pfn, end_pfn, pfn = PHYS_PFN(addr);
    53		int nid;
    54	
    55		for_each_online_node(nid) {
    56			get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
    57			if (pfn >= start_pfn && pfn <= end_pfn)
    58				return nid;
    59		}
    60		return NUMA_NO_NODE;
    61	}
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
