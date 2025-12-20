Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046EE1D9A54;
	Sat, 20 Dec 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242756; cv=none; b=b/K8HD5snhDDn6Zp3lmFO6eLT/xRcyfLIs5MpHKrtXrH4UNcHOyy45qxBQ2xlLgpcB6cZWeZoVGawOzaVohbsRKISH3LFqs0AlJsa+xYUoJc5OSuVr0I7ZiMhA5ZpPvlobtFj9UdhfjjK8efUJGu+8b36lew6GG48jqFYKf4FRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242756; c=relaxed/simple;
	bh=HfwTzM2N8W7veZx/2FQ+XEG7DuIkth/vqkPQuxlJx2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anEDHpqxfHfIpYp4I7NTS2EYpygt8q7IesxVHjlTbEqJ0dw5jGeatpO7J0oijO+EDy5PcM5UajjIWpcY0Sz8y5oP7XYq0PoOqexfH+CFTIxcgrkjzWDH2OyGBaN9vmOp+rJIyRZ8P1/hlPn4gmiD+0avnHG5VZK8qXhkiJUtRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciuiNrlr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciuiNrlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242756; x=1797778756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfwTzM2N8W7veZx/2FQ+XEG7DuIkth/vqkPQuxlJx2c=;
  b=ciuiNrlr6UBVjOcjkmBFUFDW/UXdRZ5e73cMhPtHqj9mal0C/zSgTfpv
   6K8gwG+/qYwhRR5ZJWH2BJM2ps43gPXtnu0BgzBY33UD4wOkOeBrSHshN
   Hbl6BXu+oWlWvn8MzNX+3eLDKLxgn9LTw+Al03uMg4sZkXm14Pz1IX2Gz
   dSUJQrtUO501v4yO5kSAJ52YJN4UDYcTJ85TADcYlwzeXL+Yp4HHTcwrf
   cwO74REhwsjqFQr7KzV/cgyHB+jZJPKEIksW8W+60jBXzQXybh3JOO0Op
   xBHZwINQAsQcm/6+EGkwQQxXfXvwHrHCoFACObfM3jhzcXtWwD1+vu5/H
   Q==;
X-CSE-ConnectionGUID: uyhBVHowS5SUH9WsX5ZctQ==
X-CSE-MsgGUID: 59fgKQkJRjum33UGObwEFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78493910"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78493910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:59:13 -0800
X-CSE-ConnectionGUID: 82GaXzRHQJqmaeMIAjznzA==
X-CSE-MsgGUID: KpmoHXnzTluDbV0vacTAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203639803"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 06:59:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyQH-000000004hP-0Cao;
	Sat, 20 Dec 2025 14:59:09 +0000
Date: Sat, 20 Dec 2025 22:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:hugetlb-init/v0 15/26] arch/powerpc/mm/mem.c:223:19: error:
 use of undeclared identifier 'zone_dma_bits'; did you mean 'zone_dma_limit'?
Message-ID: <202512202240.GHqlQPrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v0
head:   8f1fbf04ce5ef30eb770231992ca055d4f45e5a7
commit: c4213ce62b5b611f3c28bdd8be9b6f0b15130071 [15/26] powerpc: introduce arch_zone_limits_init()
config: powerpc-pmac32_defconfig (https://download.01.org/0day-ci/archive/20251220/202512202240.GHqlQPrw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202240.GHqlQPrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202240.GHqlQPrw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/mem.c:223:19: error: use of undeclared identifier 'zone_dma_bits'; did you mean 'zone_dma_limit'?
     223 |                                       1UL << (zone_dma_bits - PAGE_SHIFT));
         |                                               ^~~~~~~~~~~~~
         |                                               zone_dma_limit
   include/linux/minmax.h:105:41: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                               ^
   include/linux/minmax.h:98:28: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                   ^
   include/linux/minmax.h:92:28: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/dma-direct.h:15:12: note: 'zone_dma_limit' declared here
      15 | extern u64 zone_dma_limit;
         |            ^
   1 error generated.


vim +223 arch/powerpc/mm/mem.c

   206	
   207	/*
   208	 * Zones usage:
   209	 *
   210	 * We setup ZONE_DMA to be 31-bits on all platforms and ZONE_NORMAL to be
   211	 * everything else. GFP_DMA32 page allocations automatically fall back to
   212	 * ZONE_DMA.
   213	 *
   214	 * By using 31-bit unconditionally, we can exploit zone_dma_limit to inform the
   215	 * generic DMA mapping code.  32-bit only devices (if not handled by an IOMMU
   216	 * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
   217	 * ZONE_DMA.
   218	 */
   219	void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
   220	{
   221	#ifdef CONFIG_ZONE_DMA
   222		max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
 > 223					      1UL << (zone_dma_bits - PAGE_SHIFT));
   224	#endif
   225		max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
   226	#ifdef CONFIG_HIGHMEM
   227		max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
   228	#endif
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
