Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0E1E494;
	Sun, 14 Jul 2024 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720985068; cv=none; b=GrryrAqnHm2zPPJs7b9o37Cq1uGJ6XllHmqdp8jfUIvmCH9eOCGexyoq5s1HLhd1lZQSZMRNWRjXys5hTxTu7EDIIVnYeqMlZCbLfdXajeaniKmxY1bqnbGXbhsLC6B/Wd+DSQbzXSSlpo6EiXTSQBCatDBwKAGX/mQQG2S+dNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720985068; c=relaxed/simple;
	bh=0zAe+PU7QXqYCgPwr+yxqSzo0qvhzKMAMkFymOKQLK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5GdNDqqRkl7/rK/+o0Bo0P2UJMvzTCJMTb8nIdoo55Is91OJOyRrUnkYhT0VZQgkh49hCc3jbvcwsyZU1I/4++dhNOUOGsvsTDsT9rk7sqBdkIBqHOMNFkc3iblgyyR0r5Hhb7RQy0CokhM4MhNa40d62vCnI+3pk3HV3tj0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I142BiQ4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I142BiQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720985067; x=1752521067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zAe+PU7QXqYCgPwr+yxqSzo0qvhzKMAMkFymOKQLK8=;
  b=I142BiQ4XwyW1IqEW568wxjzFgnl9st8PphDvd4O55afYNInFZmah6kO
   PvEjYN7R/rPYutVtlT2EJQuWgMVI2ZtitWGlmzW2tLGJXDL6HmkJxFoVU
   HS05fiL1sPokQ9obOPfPFxWyA0JQUeux/e7U02kq3QamIeaBdWkVRglq3
   qAiO/qckMwsHx3E6o67PBYgoe3jPcWoiQUgT2F+/Lec5Z5MfZHFkm43Qe
   P6mrHBmhEcRVHCqy92uYDX5zy1c6Qx7iV6u64WXS7BkLCJvoikWEKqRIe
   uju27n+wxcSSqvxv3/yE723JYGEj6zKynWbgLTFYNDFJcP/NkBYqkw5o8
   w==;
X-CSE-ConnectionGUID: N9LepH8mSoCsCWF32VQCxg==
X-CSE-MsgGUID: cZeQ7wZtQoafH4ZF1wNxgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18512536"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18512536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 12:24:26 -0700
X-CSE-ConnectionGUID: V8J8yr2BSOKglTZTXp+sCw==
X-CSE-MsgGUID: FQ6w2TvaS4+52jRAK+xw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="53965964"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2024 12:24:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT4pb-000dgA-0F;
	Sun, 14 Jul 2024 19:24:23 +0000
Date: Mon, 15 Jul 2024 03:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-static-calls-v1 2/2] kernel/dma/mapping.c:746:12:
 warning: variable 'sgt' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202407150312.GTJusNmx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls-v1
head:   3acafa88e3e0ffeb1d7d2ae1e78d5c669edb55b6
commit: 3acafa88e3e0ffeb1d7d2ae1e78d5c669edb55b6 [2/2] dma: Add IOMMU static calls with clear default ops
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240715/202407150312.GTJusNmx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150312.GTJusNmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150312.GTJusNmx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:746:12: warning: variable 'sgt' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     746 |                 else if (ops->alloc_noncontiguous)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:753:6: note: uninitialized use occurs here
     753 |         if (sgt) {
         |             ^~~
   kernel/dma/mapping.c:746:8: note: remove the 'if' if its condition is always true
     746 |                 else if (ops->alloc_noncontiguous)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     747 |                         sgt = ops->alloc_noncontiguous(dev, size, dir, gfp,
   kernel/dma/mapping.c:735:22: note: initialize the variable 'sgt' to silence this warning
     735 |         struct sg_table *sgt;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +746 kernel/dma/mapping.c

   730	
   731	struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
   732			enum dma_data_direction dir, gfp_t gfp, unsigned long attrs)
   733	{
   734		const struct dma_map_ops *ops = get_dma_ops(dev);
   735		struct sg_table *sgt;
   736	
   737		if (WARN_ON_ONCE(attrs & ~DMA_ATTR_ALLOC_SINGLE_PAGES))
   738			return NULL;
   739		if (WARN_ON_ONCE(gfp & __GFP_COMP))
   740			return NULL;
   741	
   742		if (ops) {
   743			if (dma_is_default_iommu(ops))
   744				sgt = iommu_dma_alloc_noncontiguous(dev, size, dir, gfp,
   745								    attrs);
 > 746			else if (ops->alloc_noncontiguous)
   747				sgt = ops->alloc_noncontiguous(dev, size, dir, gfp,
   748							       attrs);
   749		}
   750		else
   751			sgt = alloc_single_sgt(dev, size, dir, gfp);
   752	
   753		if (sgt) {
   754			sgt->nents = 1;
   755			debug_dma_map_sg(dev, sgt->sgl, sgt->orig_nents, 1, dir, attrs);
   756		}
   757		return sgt;
   758	}
   759	EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
