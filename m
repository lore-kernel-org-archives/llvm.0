Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561B18AFD;
	Mon,  2 Mar 2026 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409644; cv=none; b=OVyjsnIqEuoonyX7OO5qEhdtefBQ0UKuiW7p48BwS8oFv2MtZKQCFxjJKynJ3TPzMhziiMn7j7k4C5YmtD5s1edML1FCJ3xrFsqdTwQGnHHjw2xsxWw7rFJ4Uhgk5MHolE+lvV4BhBvisMM0GValU1eHN0dZhQlbhfci0l6ZdUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409644; c=relaxed/simple;
	bh=ReCx5p5lZyrNkKV0RFC6uJz0TZ89yFkoDm81L29FTNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H/qCKwvKXh4pGxAG+1ISN5v97aLT+zzCBeY4vd3e6dRwtnriMpxkcvTmxdmv2ZQvAPasrIM7aRmgwiZWWkzaXhpG4LGojti8R8i8z3YylWGZzrpERCAl3iQwHb+h/VvzwrhdYX92bq7L9+4ikl6JKnr6f+zqbQTc4+ruF926tjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmZD9OZc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmZD9OZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772409642; x=1803945642;
  h=date:from:to:cc:subject:message-id;
  bh=ReCx5p5lZyrNkKV0RFC6uJz0TZ89yFkoDm81L29FTNc=;
  b=kmZD9OZcOg4YqSXkgu7SaltVt0d83txEXJxHb0XlEeI2Cd7FJARf074f
   jrAaulfHYXtZfNNTbl4ddY4Js08pMlhzSBbLcdWVtWXDbdHvSAkbLgATg
   4WcerQQrmxBrbl7CHn7I36iyl/nJGH12f5RDCR/btN1LgV9D95lDFcVtR
   vOupzSIH/VeFrbtPo1iG4Dc/lUZgkYOos3O1Vk9lNxIc7s1QFZeT1X3Kz
   SqHj9X4kKnPS/QeaMKOBK4L/ElBQnAdMDI4saViPY8osH8+HWwkNHQvv/
   aPVAVHmyYoLrP+o23Rx84fytUzhomRBkLlLosH/1MU4rlcxtseK1qqeuW
   w==;
X-CSE-ConnectionGUID: ht+23WpsQEmDq2yPbp2V7w==
X-CSE-MsgGUID: zx89T2xqRVKNPI0bZTJpTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="98884732"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="98884732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 16:00:41 -0800
X-CSE-ConnectionGUID: nktT5OOxSMCvK0Rd0xv5eQ==
X-CSE-MsgGUID: azA1pwAMTEW5KCsdziM4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217373080"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2026 16:00:40 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwqiD-0000000006T-0hBT;
	Mon, 02 Mar 2026 00:00:37 +0000
Date: Mon, 02 Mar 2026 08:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 23/34]
 drivers/gpu/drm/panfrost/panfrost_gem.c:321:37: error: no member named 'dev'
 in 'struct dma_buf_attachment'
Message-ID: <202603020735.IwBngksR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   c37cf2824740d833b21eb816e21f94836100291f
commit: fb1ad2473a301163042d16dffa08e2481716b218 [23/34] dma-buf: Remove unused SGT stuff from the common structures
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260302/202603020735.IwBngksR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603020735.IwBngksR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603020735.IwBngksR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panfrost/panfrost_gem.c:321:37: error: no member named 'dev' in 'struct dma_buf_attachment'
     321 |                         dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
         |                                                  ~~~~~~  ^
   drivers/gpu/drm/panfrost/panfrost_gem.c:342:40: error: no member named 'dev' in 'struct dma_buf_attachment'
     342 |                         dma_sync_sgtable_for_device(attach->dev, sgt, dir);
         |                                                     ~~~~~~  ^
>> drivers/gpu/drm/panfrost/panfrost_gem.c:358:3: error: field designator 'map_dma_buf' does not refer to any field in type 'const struct dma_buf_ops'
     358 |         .map_dma_buf = panfrost_gem_prime_map_dma_buf,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panfrost/panfrost_gem.c:359:3: error: field designator 'unmap_dma_buf' does not refer to any field in type 'const struct dma_buf_ops'
     359 |         .unmap_dma_buf = panfrost_gem_prime_unmap_dma_buf,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> drivers/gpu/drm/panthor/panthor_gem.c:280:37: error: no member named 'dev' in 'struct dma_buf_attachment'
     280 |                         dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
         |                                                  ~~~~~~  ^
   drivers/gpu/drm/panthor/panthor_gem.c:301:40: error: no member named 'dev' in 'struct dma_buf_attachment'
     301 |                         dma_sync_sgtable_for_device(attach->dev, sgt, dir);
         |                                                     ~~~~~~  ^
>> drivers/gpu/drm/panthor/panthor_gem.c:317:3: error: field designator 'map_dma_buf' does not refer to any field in type 'const struct dma_buf_ops'
     317 |         .map_dma_buf = panthor_gem_prime_map_dma_buf,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_gem.c:318:3: error: field designator 'unmap_dma_buf' does not refer to any field in type 'const struct dma_buf_ops'
     318 |         .unmap_dma_buf = panthor_gem_prime_unmap_dma_buf,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +321 drivers/gpu/drm/panfrost/panfrost_gem.c

3ae6637378e64e5 Boris Brezillon 2025-12-08  300  
3ae6637378e64e5 Boris Brezillon 2025-12-08  301  static int
3ae6637378e64e5 Boris Brezillon 2025-12-08  302  panfrost_gem_prime_begin_cpu_access(struct dma_buf *dma_buf,
3ae6637378e64e5 Boris Brezillon 2025-12-08  303  				    enum dma_data_direction dir)
3ae6637378e64e5 Boris Brezillon 2025-12-08  304  {
3ae6637378e64e5 Boris Brezillon 2025-12-08  305  	struct drm_gem_object *obj = dma_buf->priv;
3ae6637378e64e5 Boris Brezillon 2025-12-08  306  	struct drm_device *dev = obj->dev;
3ae6637378e64e5 Boris Brezillon 2025-12-08  307  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
3ae6637378e64e5 Boris Brezillon 2025-12-08  308  	struct dma_buf_attachment *attach;
3ae6637378e64e5 Boris Brezillon 2025-12-08  309  
3ae6637378e64e5 Boris Brezillon 2025-12-08  310  	dma_resv_lock(obj->resv, NULL);
3ae6637378e64e5 Boris Brezillon 2025-12-08  311  	if (shmem->sgt)
3ae6637378e64e5 Boris Brezillon 2025-12-08  312  		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
3ae6637378e64e5 Boris Brezillon 2025-12-08  313  
3ae6637378e64e5 Boris Brezillon 2025-12-08  314  	if (shmem->vaddr)
3ae6637378e64e5 Boris Brezillon 2025-12-08  315  		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
3ae6637378e64e5 Boris Brezillon 2025-12-08  316  
3ae6637378e64e5 Boris Brezillon 2025-12-08  317  	list_for_each_entry(attach, &dma_buf->attachments, node) {
3ae6637378e64e5 Boris Brezillon 2025-12-08  318  		struct sg_table *sgt = attach->priv;
3ae6637378e64e5 Boris Brezillon 2025-12-08  319  
3ae6637378e64e5 Boris Brezillon 2025-12-08  320  		if (sgt)
3ae6637378e64e5 Boris Brezillon 2025-12-08 @321  			dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
3ae6637378e64e5 Boris Brezillon 2025-12-08  322  	}
3ae6637378e64e5 Boris Brezillon 2025-12-08  323  	dma_resv_unlock(obj->resv);
3ae6637378e64e5 Boris Brezillon 2025-12-08  324  
3ae6637378e64e5 Boris Brezillon 2025-12-08  325  	return 0;
3ae6637378e64e5 Boris Brezillon 2025-12-08  326  }
3ae6637378e64e5 Boris Brezillon 2025-12-08  327  
3ae6637378e64e5 Boris Brezillon 2025-12-08  328  static int
3ae6637378e64e5 Boris Brezillon 2025-12-08  329  panfrost_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
3ae6637378e64e5 Boris Brezillon 2025-12-08  330  				  enum dma_data_direction dir)
3ae6637378e64e5 Boris Brezillon 2025-12-08  331  {
3ae6637378e64e5 Boris Brezillon 2025-12-08  332  	struct drm_gem_object *obj = dma_buf->priv;
3ae6637378e64e5 Boris Brezillon 2025-12-08  333  	struct drm_device *dev = obj->dev;
3ae6637378e64e5 Boris Brezillon 2025-12-08  334  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
3ae6637378e64e5 Boris Brezillon 2025-12-08  335  	struct dma_buf_attachment *attach;
3ae6637378e64e5 Boris Brezillon 2025-12-08  336  
3ae6637378e64e5 Boris Brezillon 2025-12-08  337  	dma_resv_lock(obj->resv, NULL);
3ae6637378e64e5 Boris Brezillon 2025-12-08  338  	list_for_each_entry(attach, &dma_buf->attachments, node) {
3ae6637378e64e5 Boris Brezillon 2025-12-08  339  		struct sg_table *sgt = attach->priv;
3ae6637378e64e5 Boris Brezillon 2025-12-08  340  
3ae6637378e64e5 Boris Brezillon 2025-12-08  341  		if (sgt)
3ae6637378e64e5 Boris Brezillon 2025-12-08  342  			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
3ae6637378e64e5 Boris Brezillon 2025-12-08  343  	}
3ae6637378e64e5 Boris Brezillon 2025-12-08  344  
3ae6637378e64e5 Boris Brezillon 2025-12-08  345  	if (shmem->vaddr)
3ae6637378e64e5 Boris Brezillon 2025-12-08  346  		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
3ae6637378e64e5 Boris Brezillon 2025-12-08  347  
3ae6637378e64e5 Boris Brezillon 2025-12-08  348  	if (shmem->sgt)
3ae6637378e64e5 Boris Brezillon 2025-12-08  349  		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
3ae6637378e64e5 Boris Brezillon 2025-12-08  350  
3ae6637378e64e5 Boris Brezillon 2025-12-08  351  	dma_resv_unlock(obj->resv);
3ae6637378e64e5 Boris Brezillon 2025-12-08  352  	return 0;
3ae6637378e64e5 Boris Brezillon 2025-12-08  353  }
3ae6637378e64e5 Boris Brezillon 2025-12-08  354  
3ae6637378e64e5 Boris Brezillon 2025-12-08  355  static const struct dma_buf_ops panfrost_dma_buf_ops = {
3ae6637378e64e5 Boris Brezillon 2025-12-08  356  	.attach = drm_gem_map_attach,
3ae6637378e64e5 Boris Brezillon 2025-12-08  357  	.detach = drm_gem_map_detach,
3ae6637378e64e5 Boris Brezillon 2025-12-08 @358  	.map_dma_buf = panfrost_gem_prime_map_dma_buf,
3ae6637378e64e5 Boris Brezillon 2025-12-08 @359  	.unmap_dma_buf = panfrost_gem_prime_unmap_dma_buf,
3ae6637378e64e5 Boris Brezillon 2025-12-08  360  	.release = drm_gem_dmabuf_release,
3ae6637378e64e5 Boris Brezillon 2025-12-08  361  	.mmap = drm_gem_dmabuf_mmap,
3ae6637378e64e5 Boris Brezillon 2025-12-08  362  	.vmap = drm_gem_dmabuf_vmap,
3ae6637378e64e5 Boris Brezillon 2025-12-08  363  	.vunmap = drm_gem_dmabuf_vunmap,
3ae6637378e64e5 Boris Brezillon 2025-12-08  364  	.begin_cpu_access = panfrost_gem_prime_begin_cpu_access,
3ae6637378e64e5 Boris Brezillon 2025-12-08  365  	.end_cpu_access = panfrost_gem_prime_end_cpu_access,
3ae6637378e64e5 Boris Brezillon 2025-12-08  366  };
3ae6637378e64e5 Boris Brezillon 2025-12-08  367  

:::::: The code at line 321 was first introduced by commit
:::::: 3ae6637378e64e56634ce257cb354636ada96d69 drm/panfrost: Provide a custom dma_buf implementation

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
