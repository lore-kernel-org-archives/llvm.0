Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C551E1A31;
	Wed, 12 Mar 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768024; cv=none; b=jMjog537Z3fOSngdxG3NG+qWshlOAzLWJTD3Qy6BPqqIAqrzQj4mPTYZ2Yb31R4F+XmCHGBwUjfzhgyCvfxwUCXMCkKT+71osho0ZdIUjEHZ3LqJPz3gLtUxyVrifZf7MuGipJ1p/KXirMQ2SlJOnZfW5CLDvA06ialLWNBVozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768024; c=relaxed/simple;
	bh=4+BkIq/xhPWzW9X0/HenlKotDxcI5KfxG54wawgvm2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSO1AHG0pRxyqS62G+U2CQURo/A3W9Sh8TUyot/aS4G5KGA0/3fKmxYMcQB3fa/3f1aILcDICFt5g/2zCFXfAmeP4tsx82bMuOZcY8urqaP5Rn3udUFShIZ6z23r01Q1Mhs/hjLY4aJgWwjXCLfLQlcmRlrPJIQYOYtuo5ofgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq1E2oJH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq1E2oJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741768022; x=1773304022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+BkIq/xhPWzW9X0/HenlKotDxcI5KfxG54wawgvm2I=;
  b=Fq1E2oJHzs49DHj5ffIFSGTkPp0zKhGfPNkKQE9UFV4MFdYh3rOVg5dk
   /BpTlaXf/DLZndCG29L9MXPl75OVwmIbjft14npfDz4SLRK5iVuNwN8rX
   lC/d5YF/DdyLsM+FgfPbSiWJFypmlvfUgsZ+mo3TblZWiVekYMBfBOu4m
   kdOyB4lTLxnpO6O5JRI42+jC/eNFvGWVUW+wXXtgUk5CUN2lEwtSvh8i8
   ylMZcpUqiQ6ddzJaJCUkAp46+a0fr2K8pinVU89lFN6gt2Gro3z70UT2h
   FBwLVo7DjeY84HWy7m69lZiFkbCo94OGJ10bGrsoJb8u0sLglKqUoaD8y
   w==;
X-CSE-ConnectionGUID: LPMVp2rjSbOGsts8bIqd4A==
X-CSE-MsgGUID: QZOUR8nqTly676J0QSRlFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42968001"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42968001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 01:27:02 -0700
X-CSE-ConnectionGUID: moC/yCgPRNmdBGWeTUYELA==
X-CSE-MsgGUID: eMTVckL7Q+uX88LCsUzzng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125762012"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2025 01:27:00 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsHQY-0008Gg-2B;
	Wed, 12 Mar 2025 08:26:58 +0000
Date: Wed, 12 Mar 2025 16:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mem_init/v2 10/13] mm/mm_init.c:1768:52: error: use of
 undeclared identifier 'ZONE_HIGHMEM'
Message-ID: <202503121623.zH8HRZdp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mem_init/v2
head:   3e32ff055084020fd5780bfed058a34c2547c325
commit: efdddb6d337877b5467b46600472df230dda03b2 [10/13] arch, mm: set high_memory in free_area_init()
config: arm-randconfig-001-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121623.zH8HRZdp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121623.zH8HRZdp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121623.zH8HRZdp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mm_init.c:33:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/mm_init.c:1768:52: error: use of undeclared identifier 'ZONE_HIGHMEM'
    1768 |         unsigned long pfn = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
         |                                                           ^
   2 warnings and 1 error generated.


vim +/ZONE_HIGHMEM +1768 mm/mm_init.c

  1765	
  1766	static void set_high_memory(void)
  1767	{
> 1768		unsigned long pfn = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
  1769		phys_addr_t highmem = memblock_end_of_DRAM();
  1770	
  1771		/*
  1772		 * Some architecutures (e.g. ARM) set high_memory very early and
  1773		 * use it in arch setup code.
  1774		 * If an architecure already set high_memory don't overwrite it
  1775		 */
  1776		if (high_memory)
  1777			return;
  1778	
  1779		if (IS_ENABLED(CONFIG_HIGHMEM) &&
  1780		    (arch_has_descending_max_zone_pfns() || highmem > PFN_PHYS(pfn)))
  1781			highmem = PFN_PHYS(pfn);
  1782	
  1783		high_memory = phys_to_virt(highmem - 1) + 1;
  1784	}
  1785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
