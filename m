Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0D4A0A;
	Sun, 20 Jul 2025 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753010946; cv=none; b=sD0VUm9cOtdmRqp0clEXa53OBj7il5MTHXwu+bAe66xZbBsXQfsm13Hy/GauIVnB/ce+8qx8ZZLXgec/+8L37QZeOYcrvV+ajeSq8cmqhAQUVfU+pABKkURGkx8TjgxA74MZZp0k4v81/MpV5X/qkh7tKn+bQEMkIqHpy+PPrOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753010946; c=relaxed/simple;
	bh=8lJvcex6Lfc5XPAf4cYhtHBPt2+vEF8TOSJR9tX6fyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj4NAKw8ZYidMh5rxnv9eJTQLhw3R7X29IdNuUFc/E77JGKk0xNVb4S6khciEaght79QZ7gv5ZZrgpSYXJo/UyUHFY5Uxrt+ETaT6CHexhhvaKwOIsy7rrtR6RAPNtw3cSLDuObA/vLX4H8gj9Owglj5UVEU4bumBuBgjUr2urg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNMA3tIz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNMA3tIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753010945; x=1784546945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8lJvcex6Lfc5XPAf4cYhtHBPt2+vEF8TOSJR9tX6fyA=;
  b=iNMA3tIzpdzPPmadriNazdr7sKJXWjDBS0iCkTPELnyrDFIiWZfGGSGH
   30nVKriuQ9vec2XKLJdzomy0WuufeVKthQrsbZiX1D+X4LyiZNP/6vzGF
   gI2atw5mTPUd2HZF7EPS5+H1u2+Vru9vnRyTFMgXmW3A3BLMhEUDa1h9u
   anHr4YbH5qYOg0wjYnaMbYrtRrC9GNNz9M422Kx57Y0VcLWrPP0x6mKXD
   SkQvNqagrDlUocIyaiPzjpMmAoZmtk2ahPd+j7omZjebYQiE7gxko9YfS
   KZOF7IZN10mqq4WGi5KJEtO7/ryNfcj8+3uSDPxYdLDfnoRqoxr9I8zjr
   g==;
X-CSE-ConnectionGUID: BxmxJX7SRjieebj08u2Wdg==
X-CSE-MsgGUID: tHj78W9lQDyO2aJ8sxa/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55185814"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="55185814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 04:29:05 -0700
X-CSE-ConnectionGUID: BA6RQFMFQxmO7aRtryKUWA==
X-CSE-MsgGUID: jk5Dt04oTDWLrj5JYApD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="158710268"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jul 2025 04:29:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udSE0-000G4n-30;
	Sun, 20 Jul 2025 11:29:00 +0000
Date: Sun, 20 Jul 2025 19:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/2] dma-mapping: prepare dma_map_ops to conversion to
 physical address
Message-ID: <202507201935.hwB4Ebxp-lkp@intel.com>
References: <184fc9bda626efc62c5022ace01a20b80d1dc93b.1753003879.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184fc9bda626efc62c5022ace01a20b80d1dc93b.1753003879.git.leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250718]
[cannot apply to linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4 v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/dma-mapping-prepare-dma_map_ops-to-conversion-to-physical-address/20250720-173726
base:   next-20250718
patch link:    https://lore.kernel.org/r/184fc9bda626efc62c5022ace01a20b80d1dc93b.1753003879.git.leon%40kernel.org
patch subject: [PATCH v1 1/2] dma-mapping: prepare dma_map_ops to conversion to physical address
config: s390-randconfig-001-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201935.hwB4Ebxp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201935.hwB4Ebxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201935.hwB4Ebxp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:192:12: warning: variable 'addr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     192 |                 else if (ops->map_page)
         |                          ^~~~~~~~~~~~~
   kernel/dma/mapping.c:198:32: note: uninitialized use occurs here
     198 |         trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
         |                                       ^~~~
   kernel/dma/mapping.c:192:8: note: remove the 'if' if its condition is always true
     192 |                 else if (ops->map_page)
         |                      ^~~~~~~~~~~~~~~~~~
     193 |                         addr = ops->map_page(dev, page, offset, size, dir,
   kernel/dma/mapping.c:159:17: note: initialize the variable 'addr' to silence this warning
     159 |         dma_addr_t addr;
         |                        ^
         |                         = 0
   1 warning generated.


vim +192 kernel/dma/mapping.c

   154	
   155	dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
   156			enum dma_data_direction dir, unsigned long attrs)
   157	{
   158		const struct dma_map_ops *ops = get_dma_ops(dev);
   159		dma_addr_t addr;
   160	
   161		BUG_ON(!valid_dma_direction(dir));
   162	
   163		if (WARN_ON_ONCE(!dev->dma_mask))
   164			return DMA_MAPPING_ERROR;
   165	
   166		if (dma_map_direct(dev, ops) ||
   167		    arch_dma_map_phys_direct(dev, phys + size))
   168			addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
   169		else if (use_dma_iommu(dev))
   170			addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
   171		else {
   172			struct page *page = phys_to_page(phys);
   173			size_t offset = offset_in_page(phys);
   174			bool is_pfn_valid = true;
   175	
   176			if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
   177				is_pfn_valid = pfn_valid(PHYS_PFN(phys));
   178	
   179				/* We shouldn't have both functions */
   180				WARN_ON_ONCE(ops->map_page && ops->map_phys);
   181			}
   182	
   183			if (unlikely(!is_pfn_valid))
   184				return DMA_MAPPING_ERROR;
   185	
   186			/*
   187			 * All platforms which implement .map_page() don't support
   188			 * non-struct page backed addresses.
   189			 */
   190			if (ops->map_phys)
   191				addr = ops->map_phys(dev, phys, size, dir, attrs);
 > 192			else if (ops->map_page)
   193				addr = ops->map_page(dev, page, offset, size, dir,
   194						     attrs);
   195		}
   196	
   197		kmsan_handle_dma(phys, size, dir);
   198		trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
   199		debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
   200	
   201		return addr;
   202	}
   203	EXPORT_SYMBOL_GPL(dma_map_phys);
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
