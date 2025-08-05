Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09C32E3718;
	Tue,  5 Aug 2025 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404963; cv=none; b=UC5DRV55sLydG7yMOCH0acZN65wV0gyWmjrXxmbRi8Js727Rt6tmqCXku42icJT266AV7By1MiSkvnZ7Htown46/nYhBOlmHfhh6mRTN7zxzLMrHjqzuExaEslErejTMT2kJO1NglQ3Y78jQ335UkBoEtt4XPHOSsr+j0SdckBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404963; c=relaxed/simple;
	bh=au2w/VYtpWTNjkiQHLqO2Gzfoytbh+ksBZQXrtHvKkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tr3adOaDzkgiMTwHLmLmLbfmQdrquxgfHKXSLgbJN3/8sqlLFqWi/wVIgOT6ZbeeunuumyYf7TNmxlPq2Vij6nc3eD85ld5CKsF9aOA2OhjP3L5wEzENmBsZZpDXDWpvz7Eklhb+JuHwDe+BGaz5IeRYoyQhvJzkEgfiGnk1NEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghxzO+oo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghxzO+oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754404962; x=1785940962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=au2w/VYtpWTNjkiQHLqO2Gzfoytbh+ksBZQXrtHvKkA=;
  b=ghxzO+oojWATivQWBqZB1R8aeZhgOONAZyyN35tfp75fV8LmIjlPmEG0
   w0DKdaK/9aK4jPwkVVBsAewiaEOJ4AwpdP/4tdDncEA9xjQ9RCVK7WtkY
   6VJ4fkBZzlGU9RASM2sOBCQJJ1OAL7uO4NdYWfXkaWkZWe6Bw3we2SvBD
   +KN6bPQAfYVg2BTspQN3BjoPbfYGVsoYZbymkBFzDQEwHGAxHcubt/iC8
   spniP0IALYJ5ug+TEKSiOnN3Tuw0cC8+nWWz+lFiFbHJ7GjtC3FVfUoRL
   uokEddMKdtD0tB2+86KFMBaZV9nlJ1p0a87OXC67r724W0qPeVeQFNWBR
   w==;
X-CSE-ConnectionGUID: gixuHit8TIOQt7/lT6c8gg==
X-CSE-MsgGUID: mOkWTgLLQJC5xOSk2clohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56662831"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56662831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 07:42:42 -0700
X-CSE-ConnectionGUID: lZzNtukZR6GCfqmR7FVkTA==
X-CSE-MsgGUID: gCbhqbhGTc6fdFdV68fYUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="168759320"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2025 07:42:40 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujIs9-000215-2D;
	Tue, 05 Aug 2025 14:42:37 +0000
Date: Tue, 5 Aug 2025 16:42:30 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 27/27]
 drivers/vfio/pci/vfio_pci_dmabuf.c:91:10: error: incompatible integer to
 pointer conversion returning 'int' from a function with result type 'struct
 sg_table *'
Message-ID: <202508051612.U6YyQGtR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   42b93c638f0566da54b97856bde0b304ea659c12
commit: 42b93c638f0566da54b97856bde0b304ea659c12 [27/27] FOLD: Close race with flipping revoke decision
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250805/202508051612.U6YyQGtR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051612.U6YyQGtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051612.U6YyQGtR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_dmabuf.c:91:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct sg_table *' [-Wint-conversion]
      91 |                 return -ENODEV;
         |                        ^~~~~~~
   1 error generated.


vim +91 drivers/vfio/pci/vfio_pci_dmabuf.c

    72	
    73	static struct sg_table *
    74	vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
    75			     enum dma_data_direction dir)
    76	{
    77		struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
    78		struct p2pdma_provider *provider = priv->vdev->provider;
    79		struct dma_iova_state *state = attachment->priv;
    80		struct phys_vec *phys_vec = priv->phys_vec;
    81		unsigned long attrs = DMA_ATTR_MMIO;
    82		unsigned int mapped_len = 9;
    83		struct scatterlist *sgl;
    84		struct sg_table *sgt;
    85		dma_addr_t addr;
    86		int ret, i;
    87	
    88		dma_resv_assert_held(priv->dmabuf->resv);
    89	
    90		if (priv->revoked)
  > 91			return -ENODEV;
    92	
    93		sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
    94		if (!sgt)
    95			return ERR_PTR(-ENOMEM);
    96	
    97		ret = sg_alloc_table(sgt, 1, GFP_KERNEL | __GFP_ZERO);
    98		if (ret)
    99			goto err_kfree_sgt;
   100	
   101		sgl = sgt->sgl;
   102	
   103		for (i = 0; i < priv->nr_ranges; i++) {
   104			if (!state) {
   105				addr = pci_p2pdma_bus_addr_map(provider,
   106							       phys_vec[i].paddr);
   107			} else if (dma_use_iova(state)) {
   108				ret = dma_iova_link(attachment->dev, state,
   109						    phys_vec[i].paddr, 0,
   110						    phys_vec[i].len, dir, attrs);
   111				if (ret)
   112					goto err_unmap_dma;
   113	
   114				mapped_len += phys_vec[i].len;
   115			} else {
   116				addr = dma_map_phys(attachment->dev, phys_vec[i].paddr,
   117						    phys_vec[i].len, dir, attrs);
   118				ret = dma_mapping_error(attachment->dev, addr);
   119				if (ret)
   120					goto err_unmap_dma;
   121			}
   122	
   123			if (!state || !dma_use_iova(state)) {
   124				/*
   125				 * In IOVA case, there is only one SG entry which spans
   126				 * for whole IOVA address space. So there is no need
   127				 * to call to sg_next() here.
   128				 */
   129				fill_sg_entry(sgl, phys_vec[i].len, addr);
   130				sgl = sg_next(sgl);
   131			}
   132		}
   133	
   134		if (state && dma_use_iova(state)) {
   135			WARN_ON_ONCE(mapped_len != priv->size);
   136			ret = dma_iova_sync(attachment->dev, state, 0, mapped_len);
   137			if (ret)
   138				goto err_unmap_dma;
   139			fill_sg_entry(sgl, mapped_len, state->addr);
   140		}
   141	
   142		return sgt;
   143	
   144	err_unmap_dma:
   145		if (!i || !state)
   146			; /* Do nothing */
   147		else if (dma_use_iova(state))
   148			dma_iova_destroy(attachment->dev, state, mapped_len, dir,
   149					 attrs);
   150		else
   151			for_each_sgtable_dma_sg(sgt, sgl, i)
   152				dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
   153						sg_dma_len(sgl), dir, attrs);
   154		sg_free_table(sgt);
   155	err_kfree_sgt:
   156		kfree(sgt);
   157		return ERR_PTR(ret);
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
