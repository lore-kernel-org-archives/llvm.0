Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29267131E2D;
	Mon, 14 Jul 2025 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501616; cv=none; b=awBw53D9aksZh1n5qYyQ+eCwT7gsm1ewD4zvGXABF5J1C0cYPqLzfHXjhXlsCB7y4sViZdsHRVmTCUqAoDDI6ddQgZdN2/WnjlTjr0LhnIO46a/xOTUVAedSrNnPZNGo3ntHR19OTK/pvHUX+BKh8HNoYTb/Ty5DThvt00ilxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501616; c=relaxed/simple;
	bh=0OHBHOaeitjmYXv6ZyQcXRxe3hCOOBKSYHo+Aw9d+10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGIqCEUIHRsratQU2NGY6Rz1SwNhhNUPIQTm/b4ruhNilQ0MEmDg/U5oN5YSN+heELDTAO1SJxX88JhTdA68ur9u7WmusMv1SyoKQlE+goLwG8zrNK5S1bLZ+DZPEHBTGitdRuSpTu6zas4E1C7nFwpORk/3mSXnQNMwXc9HYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsVnz1MV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsVnz1MV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752501616; x=1784037616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0OHBHOaeitjmYXv6ZyQcXRxe3hCOOBKSYHo+Aw9d+10=;
  b=bsVnz1MVBYcd051VF96DzPnEwqmHBwq0bSOkmTLdOv7vo2AVDY6s72Nm
   WHtOL/so53qqag4NwLFw3/5M7LLIkuN1lsq6MImzTLHbMdUOPY9z6qutE
   FK1DUljh1XSlrWnq6yQGovs+KmRXorz1aoaD7JbEOYfQ0SXRujsI4S5/q
   LicJRVAfmimYli0RnaB+N4KLYLYWEcH9ATH+NKViKZik9l35/BUdH+DXo
   uRG31yJGDdLMmYHFCF38n6CIX/Yd/KJ84fZbUHRDaUiO0+F9jxFrKZzXX
   CM7AFnRfgYtj7W63EN8RE8pG8hmZ65B0vQt/jZsYZtK6LAYfRDnTRFijH
   w==;
X-CSE-ConnectionGUID: Td4U2JFvTDq1Mhi927k7fA==
X-CSE-MsgGUID: c0JKA6UdQXiX54a4+i1EbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64953508"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="64953508"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 07:00:15 -0700
X-CSE-ConnectionGUID: hEsmJhDERByfzl043+rpIw==
X-CSE-MsgGUID: W84Xa9L1TbuhgpWDQkGKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="157041204"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2025 07:00:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubJj1-0008xT-01;
	Mon, 14 Jul 2025 14:00:11 +0000
Date: Mon, 14 Jul 2025 21:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [leon-rdma:dmabuf-vfio 20/20]
 drivers/vfio/pci/vfio_pci_dmabuf.c:75:2: warning: variable 'i' is used
 uninitialized whenever switch default is taken
Message-ID: <202507142120.MYCaqBb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   a9132812d3a56c63b90f052dc2aa8d7500a65fec
commit: a9132812d3a56c63b90f052dc2aa8d7500a65fec [20/20] vfio/pci: Allow MMIO regions to be exported through dma-buf
config: i386-buildonly-randconfig-002-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142120.MYCaqBb7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142120.MYCaqBb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142120.MYCaqBb7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_dmabuf.c:75:2: warning: variable 'i' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
      75 |         default:
         |         ^~~~~~~
   drivers/vfio/pci/vfio_pci_dmabuf.c:121:7: note: uninitialized use occurs here
     121 |         if (!i || bus_addr)
         |              ^
   drivers/vfio/pci/vfio_pci_dmabuf.c:46:7: note: initialize the variable 'i' to silence this warning
      46 |         int i, ret;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +75 drivers/vfio/pci/vfio_pci_dmabuf.c

    31	
    32	static struct sg_table *
    33	vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
    34			     enum dma_data_direction dir)
    35	{
    36		struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
    37		struct p2pdma_provider **provider = priv->provider;
    38		struct phys_vec *phys_vec = priv->phys_vec;
    39		unsigned int mapped_len = 9;
    40		unsigned long attrs = 0;
    41		struct scatterlist *sgl;
    42		unsigned int nr_ranges;
    43		bool bus_addr = false;
    44		struct sg_table *sgt;
    45		dma_addr_t addr;
    46		int i, ret;
    47	
    48		dma_resv_assert_held(priv->dmabuf->resv);
    49	
    50		if (priv->revoked)
    51			return ERR_PTR(-ENODEV);
    52	
    53		sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
    54		if (!sgt)
    55			return ERR_PTR(-ENOMEM);
    56	
    57		if (dma_iova_try_alloc(attachment->dev, &attachment->state, 0,
    58				       priv->size))
    59			nr_ranges = 1;
    60		else
    61			nr_ranges = priv->nr_ranges;
    62	
    63		ret = sg_alloc_table(sgt, nr_ranges, GFP_KERNEL | __GFP_ZERO);
    64		if (ret)
    65			goto err_kfree_sgt;
    66	
    67		/* All map types are the same for all BARs */
    68		switch (pci_p2pdma_map_type(provider[0], attachment->dev)) {
    69		case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
    70			attrs = DMA_ATTR_SKIP_CPU_SYNC;
    71			break;
    72		case PCI_P2PDMA_MAP_BUS_ADDR:
    73			bus_addr = true;
    74			break;
  > 75		default:
    76			ret = -EINVAL;
    77			goto err_unmap_dma;
    78		}
    79	
    80		sgl = sgt->sgl;
    81	
    82		for (i = 0; i < priv->nr_ranges; i++) {
    83			if (bus_addr) {
    84				addr = pci_p2pdma_bus_addr_map(provider[i],
    85							       phys_vec[i].paddr);
    86				fill_sg_entry(sgl, phys_vec[i].len, addr);
    87				sgl = sg_next(sgl);
    88			} else if (dma_use_iova(&attachment->state)) {
    89				ret = dma_iova_link(attachment->dev, &attachment->state,
    90						    phys_vec[i].paddr, mapped_len,
    91						    phys_vec[i].len, dir, attrs);
    92				if (ret)
    93					goto err_unmap_dma;
    94	
    95				mapped_len += phys_vec[i].len;
    96			} else {
    97				addr = dma_map_phys(attachment->dev, phys_vec[i].paddr,
    98						    phys_vec[i].len, dir, attrs);
    99				ret = dma_mapping_error(attachment->dev, addr);
   100				if (ret)
   101					goto err_unmap_dma;
   102	
   103				fill_sg_entry(sgl, phys_vec[i].len, addr);
   104				sgl = sg_next(sgl);
   105			}
   106		}
   107	
   108		if (dma_use_iova(&attachment->state) && !bus_addr) {
   109			WARN_ON_ONCE(mapped_len != priv->size);
   110			ret = dma_iova_sync(attachment->dev, &attachment->state, 0,
   111					    mapped_len);
   112			if (ret)
   113				goto err_unmap_dma;
   114	
   115			fill_sg_entry(sgl, mapped_len, attachment->state.addr);
   116		}
   117	
   118		return sgt;
   119	
   120	err_unmap_dma:
   121		if (!i || bus_addr)
   122			; /* Do nothing */
   123		else if (dma_use_iova(&attachment->state))
   124			dma_iova_destroy(attachment->dev, &attachment->state,
   125					 mapped_len, dir, attrs);
   126		else
   127			for_each_sgtable_dma_sg(sgt, sgl, i)
   128				dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
   129					       sg_dma_len(sgl), dir, attrs);
   130		sg_free_table(sgt);
   131	err_kfree_sgt:
   132		kfree(sgt);
   133		return ERR_PTR(ret);
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
