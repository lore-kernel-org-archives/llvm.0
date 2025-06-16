Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3080B274659;
	Mon, 16 Jun 2025 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069727; cv=none; b=Paqc8tPN0rBQOVi+Ho+tHvh/m70j3dti9ci5Jv0z+wwaE5U/LRufTTpZ0jv50As6WGM9l1XXeRz88f6z2ffcmaoCWCe6Brp+rv2xGwHJEFNqmKBTE57/tKTtSIVTagKzMXKLUA+cXHr9s5HDkYflwk/CDhDwAPDzeqwm6JT1f24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069727; c=relaxed/simple;
	bh=KHEAU5O0QP+O/8j4Bf5vQY32xESSw3TMzoN1cnMZl+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXuErdwTRmwNaoc24GY7I4mCeTZlFC+C168Wg9Zv5FpYh3tV6HpDmVd0ElONWW/p15Xhw6uw6ZKJ0bM81YLLVLg9Q29BNG9jhLA9UpdSmF3KpYqPnpbNi645QWY1zcGtOja71KLvnAcnHLIc2EeNnSiOwO7jv2UoeFkWT/6esAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WO13c9K1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WO13c9K1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750069725; x=1781605725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHEAU5O0QP+O/8j4Bf5vQY32xESSw3TMzoN1cnMZl+w=;
  b=WO13c9K1aCh3TcN41euRZK7jLQpAWVfbv8tQuu4f/ttUjCexeg9em0Pv
   DCsSOC0pUQ5B5SeX4gUREZgrO033yaZ7jHhty3xNirX4mUP9Ufxeoi7bx
   AxoP60DXhBw/vW5ljfgQqSdM13gnFSSZNG7RgWtpc0z1BpVaJFEOhagp6
   RxTFq2pyBWTMdI9iVKQuf5EGcZfeHqIDnAPAA11zDm605DV2gXqcepJ07
   Q+CIILZNrjNT92kb4XhOhZGRsR7qoxdZ/xalfE2w2zwHhuj8tsd/yDr/v
   mpL7Sq/4gAa4xg5a2BjOTM5haWDYi5WbOlTGdju0FWgmWr7JyYP8oq4Us
   Q==;
X-CSE-ConnectionGUID: znzGDs1dQ1WIOTFyVV65Xg==
X-CSE-MsgGUID: kbrkvKimTbiZyZn+RbdIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62816607"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62816607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 03:28:44 -0700
X-CSE-ConnectionGUID: kaesmaPMSBS8x615fJR+6A==
X-CSE-MsgGUID: BK8iHcJFSr+O+izsDFqTSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149312179"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jun 2025 03:28:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR74y-000Evs-2G;
	Mon, 16 Jun 2025 10:28:40 +0000
Date: Mon, 16 Jun 2025 18:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-direct-pfn-type 2/5]
 include/linux/dma-mapping.h:318:30: error: too many arguments to function
 call, expected 5, have 6
Message-ID: <202506161804.JCPHPIaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-direct-pfn-type
head:   87481a3ed31857c530009e3a934f3b0a5e069f9e
commit: c04b832c0cfbddf0ed0f7c4409d190b85a976ddb [2/5] dma-mapping: Refactor dma_map_page() to rely on physical address
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250616/202506161804.JCPHPIaZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161804.JCPHPIaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161804.JCPHPIaZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:45:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:318:30: error: too many arguments to function call, expected 5, have 6
     317 |         return dma_map_phys(dev, page_to_phys(page) + offset, size, dir,
         |                ~~~~~~~~~~~~
     318 |                             DMA_MAPPING_CPU_HOST, attrs);
         |                                                   ^~~~~
   include/linux/dma-mapping.h:183:26: note: 'dma_map_phys' declared here
     183 | static inline dma_addr_t dma_map_phys(struct device *dev, phys_addr_t paddr,
         |                          ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                 size_t size, enum dma_data_direction dir, unsigned long attrs)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:323:61: error: too many arguments to function call, expected 5, have 6
     323 |         dma_unmap_phys(dev, addr, size, dir, DMA_MAPPING_CPU_HOST, attrs);
         |         ~~~~~~~~~~~~~~                                             ^~~~~
   include/linux/dma-mapping.h:188:20: note: 'dma_unmap_phys' declared here
     188 | static inline void dma_unmap_phys(struct device *dev, dma_addr_t addr,
         |                    ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     189 |                 size_t size, enum dma_data_direction dir, unsigned long attrs)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7667:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7667 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7642:1: note: array 'preempt_modes' declared here
    7642 | const char *preempt_modes[] = {
         | ^
   1 warning and 2 errors generated.


vim +318 include/linux/dma-mapping.h

   312	
   313	static inline dma_addr_t dma_map_page_attrs(struct device *dev,
   314			struct page *page, size_t offset, size_t size,
   315			enum dma_data_direction dir, unsigned long attrs)
   316	{
   317		return dma_map_phys(dev, page_to_phys(page) + offset, size, dir,
 > 318				    DMA_MAPPING_CPU_HOST, attrs);
   319	}
   320	static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
   321			size_t size, enum dma_data_direction dir, unsigned long attrs)
   322	{
   323		dma_unmap_phys(dev, addr, size, dir, DMA_MAPPING_CPU_HOST, attrs);
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
