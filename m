Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796758;
	b=LUjvOZxTIp2MbV3nFlwQN/k6OpXjrasif/3FBKLdP+lb9cZzh2qo78pi3L0PUnIZLqUL
	 vKffO+K4jP++B31FuzCUrP8UYOrAv5or7I71abZzavzq3tjMCYquy4hR+sPFKuu1ELTXV
	 NY7A/0//U3Ia4geGqjgEbPqunHN45cAwe/8hb2B0mTBBF8zAI2N63W3kuE+aDn8+74YPS
	 I6zFAnMVTAueLMr9oS7rigdJ3Kc9NSN77s8kkLIadBDYTGOj9Cg2bJgSZ1OOGNP4fg/cT
	 wCwN0cfezbVvLxTcktHOKaX045tczVRnuD/poNVg/c0Y66KgivFsqMTB5RDtMHlaJsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5D8E6sgAGZcvXyy4KCMwZFhhzI4sH2rXQMbzx8Ep4mI=;
	b=4jYvAu90Ew+eqHLy9zZ1k0BSOkrtLoGvBkHHg8ceNfctO3NjNjS+gPn+xaZqcLT6LZqd
	 m/JY7+8tI37Rf0rBCu1wMTgf/csWi+DFLhBETHSL0dF3j/jXvwdsmZ2N/vldbCtcN3KGe
	 0H0FSZDT8YO2qJ2PEEnkEHseqUd+DlrazpQGfjtO2q3wiwfyHDLxzILbK8ojfeNnGgBoI
	 Zh1RRmB4gk+/rDnuUqTO/v4ffTd490wIy6k9GB6J6LakYFbPTboNdeVJxEtn7vlzDSdvq
	 DIDB7bnx9tPElJwjQ9WRScBiyGAusopK9Zd+6vP5LRp1c/KTLp0zep+TZ38RlGeAJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CV0mEbWM;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C39606A326;
	Wed,  4 Nov 2026 12:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C39606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CV0mEbWM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793796756; x=1825332756;
  h=date:from:to:cc:subject:message-id;
  bh=XpsF+Tv44bOAmJot5vWhomA8pWzRjzVY5oZq3Vgg3Do=;
  b=CV0mEbWMdhqWC3JpDjjS6FB22CooVvqblbVNxafTR4HIASCECXAEBzEP
   o/VV6RHqKJW8wWUlAL5WkX6cQRlhUL79t3gzpab9Gyn5Slk7GiGydbexw
   UsqKkiGISaNGWELulra2ErJHlBWeBEDJJh/Lp39KudXj4s0u9Bw/3Uw+T
   lyHfb6FuVg34oAtFMdNX+wFcoOHS2St/o4InQYfBosNL+sHT3WiaHGX8i
   PR4HCJFN+e3uE4K11cP8CuXqEBnThf9pKbYooOnF4RopRAtZSjpdQV2ni
   yJhJ0oIm8JnOHFtGwO7kT3OU1D/8Jv+JcyCP5bflNA5N/eW91Jch2vroJ
   w==;
X-CSE-ConnectionGUID: cILAfLlQRXGrSiKTFZdD9Q==
X-CSE-MsgGUID: pK00Yy+ZSIOa++t4QlIW6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2581239"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2581239"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:52:35 -0800
X-CSE-ConnectionGUID: svBiaCMcSTeRp7R2w1aAAA==
X-CSE-MsgGUID: eWz9uHL1SPO7RuHv5wz6mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7261460"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 04:52:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOaTf-00000000kKB-3UEf;
	Wed, 04 Nov 2026 12:52:31 +0000
Date: Wed, 04 Nov 2026 20:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 23/34]
 drivers/gpu/drm/panfrost/panfrost_gem.c:321:37: error: no member named 'dev'
 in 'struct dma_buf_attachment'
Message-ID: <202611041904.QPas3r4M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   c37cf2824740d833b21eb816e21f94836100291f
commit: 83c52177f4161f8f77f9b8c7020eb77fe3361e02 [23/34] dma-buf: Remove unused SGT stuff from the common structures
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261104/202611041904.QPas3r4M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041904.QPas3r4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041904.QPas3r4M-lkp@intel.com/

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
