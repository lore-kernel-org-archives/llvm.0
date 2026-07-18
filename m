Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3436CDE3;
	Sat, 18 Jul 2026 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377735; cv=none; b=ifz52EMWUpOCra5c9V7hvTngVuO14BJr5pXQaGi+ZWbi2psbXDNuqcnLqDMFsM+F/ceSNgFrRHkvzkmxMsDxYshfPRPKmfVHNP3bMXe93m6f8G6ctx2MwwplQNVVRNVxb6+yniZgnuWPfkcc1cScDkV7bpytyFll7aUNo09wL88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377735; c=relaxed/simple;
	bh=FmFdu/UMfqc3t4pARMc6OEnjD/kFQLdRo55N0KE5WBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JVVEUoBmzyvwn3TRYklDRbQaiKURgEBaM0HKX8KN+szvVd7hJTMLoiCGq6HDffB3Q0gG4KQyOzbp15eBa+MCGoXjJfIhKSBH2/LTwzcT4vxV4K0XF/eaF2m/ISdEFr9uDlRlRhuihh8gQK5GukfsV6aYPllTdm02XotNAYKzvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/BmOh0G; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/BmOh0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784377733; x=1815913733;
  h=date:from:to:cc:subject:message-id;
  bh=FmFdu/UMfqc3t4pARMc6OEnjD/kFQLdRo55N0KE5WBk=;
  b=Z/BmOh0GGq1aSdPZ0326LoTbRiM+9zFvnNbS2Y9NixEHkn7kDzullORu
   BqX2YxgX2McLmyu7v22wZK2aGYB76BHYoVrk85DekA7/qbz81GCOG3TaQ
   lYiOC3rLHjBkv5aSau8dQPM+O3ZXBrKlTGhL9FFmSBLojjtEMU/QRkM4N
   fYWDkMV8J7I2kAeqUXOmHEpKhJKewohtlnAE4RvzXk/nX4eAvzFL+pTVD
   dOUnpPNt1BZY6UKT1OuTLKYLYKh2ar5hXv+QzybVb+TfkH5z1aeiTbymq
   6jzxP16YF7KB+2nNwMM09qgEM9pWVe1NNbmvixdlf9kwPHuBRQyyCwzGB
   A==;
X-CSE-ConnectionGUID: 7p7dssKHQPW6Tapx6i3V2Q==
X-CSE-MsgGUID: lmtr31hWRs6X15orPqu5BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88848866"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="88848866"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 05:28:52 -0700
X-CSE-ConnectionGUID: x7BwO69OQUSGoPUSN0U1lA==
X-CSE-MsgGUID: ksjUBmmcQLWguzZ0wBZHZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="295207772"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2026 05:28:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl49r-00000000UlO-36q6;
	Sat, 18 Jul 2026 12:28:44 +0000
Date: Sat, 18 Jul 2026 20:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 5820/7584]
 drivers/infiniband/hw/mlx5/mr.c:928:8: error: passing 'const struct
 dma_buf_attach_ops *' to parameter of type 'struct dma_buf_attach_ops *'
 discards qualifiers
Message-ID: <202607181922.3eQD54gC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: dcae56cfecc6e17c9aa4e6bb6057d18efadf2132 [5820/7584] RDMA/mlx5: Constify struct ib_frmr_pool_ops and dma_buf_attach_ops
config: i386-randconfig-007-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181922.3eQD54gC-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181922.3eQD54gC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181922.3eQD54gC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/mr.c:928:8: error: passing 'const struct dma_buf_attach_ops *' to parameter of type 'struct dma_buf_attach_ops *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     928 |                                                  &mlx5_ib_dmabuf_attach_ops);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/ib_umem.h:253:35: note: passing argument to parameter 'ops' here
     253 |                                           struct dma_buf_attach_ops *ops)
         |                                                                      ^
   1 error generated.


vim +928 drivers/infiniband/hw/mlx5/mr.c

90da7dc8206a599 Jianxin Xiong   2020-12-15  905  
de8f847a5114ff7 Yishai Hadas    2024-08-01  906  static struct ib_mr *
de8f847a5114ff7 Yishai Hadas    2024-08-01  907  reg_user_mr_dmabuf(struct ib_pd *pd, struct device *dma_device,
de8f847a5114ff7 Yishai Hadas    2024-08-01  908  		   u64 offset, u64 length, u64 virt_addr,
e1bed9a94da86a7 Yishai Hadas    2025-07-17  909  		   int fd, int access_flags, int access_mode,
e1bed9a94da86a7 Yishai Hadas    2025-07-17  910  		   struct ib_dmah *dmah)
90da7dc8206a599 Jianxin Xiong   2020-12-15  911  {
de8f847a5114ff7 Yishai Hadas    2024-08-01  912  	bool pinned_mode = (access_mode == MLX5_MKC_ACCESS_MODE_KSM);
90da7dc8206a599 Jianxin Xiong   2020-12-15  913  	struct mlx5_ib_dev *dev = to_mdev(pd->device);
90da7dc8206a599 Jianxin Xiong   2020-12-15  914  	struct mlx5_ib_mr *mr = NULL;
90da7dc8206a599 Jianxin Xiong   2020-12-15  915  	struct ib_umem_dmabuf *umem_dmabuf;
e1bed9a94da86a7 Yishai Hadas    2025-07-17  916  	u16 st_index = MLX5_MKC_PCIE_TPH_NO_STEERING_TAG_INDEX;
e1bed9a94da86a7 Yishai Hadas    2025-07-17  917  	u8 ph = MLX5_IB_NO_PH;
90da7dc8206a599 Jianxin Xiong   2020-12-15  918  	int err;
90da7dc8206a599 Jianxin Xiong   2020-12-15  919  
638420115cc4ad6 Jianbo Liu      2024-06-03  920  	err = mlx5r_umr_resource_init(dev);
638420115cc4ad6 Jianbo Liu      2024-06-03  921  	if (err)
638420115cc4ad6 Jianbo Liu      2024-06-03  922  		return ERR_PTR(err);
638420115cc4ad6 Jianbo Liu      2024-06-03  923  
de8f847a5114ff7 Yishai Hadas    2024-08-01  924  	if (!pinned_mode)
de8f847a5114ff7 Yishai Hadas    2024-08-01  925  		umem_dmabuf = ib_umem_dmabuf_get(&dev->ib_dev,
de8f847a5114ff7 Yishai Hadas    2024-08-01  926  						 offset, length, fd,
90da7dc8206a599 Jianxin Xiong   2020-12-15  927  						 access_flags,
90da7dc8206a599 Jianxin Xiong   2020-12-15 @928  						 &mlx5_ib_dmabuf_attach_ops);
522a5c1c56fbf71 Leon Romanovsky 2026-01-04  929  	else if (dma_device)
de8f847a5114ff7 Yishai Hadas    2024-08-01  930  		umem_dmabuf = ib_umem_dmabuf_get_pinned_with_dma_device(&dev->ib_dev,
de8f847a5114ff7 Yishai Hadas    2024-08-01  931  				dma_device, offset, length,
de8f847a5114ff7 Yishai Hadas    2024-08-01  932  				fd, access_flags);
522a5c1c56fbf71 Leon Romanovsky 2026-01-04  933  	else
522a5c1c56fbf71 Leon Romanovsky 2026-01-04  934  		umem_dmabuf = ib_umem_dmabuf_get_pinned(
522a5c1c56fbf71 Leon Romanovsky 2026-01-04  935  			&dev->ib_dev, offset, length, fd, access_flags);
de8f847a5114ff7 Yishai Hadas    2024-08-01  936  
90da7dc8206a599 Jianxin Xiong   2020-12-15  937  	if (IS_ERR(umem_dmabuf)) {
4b6b6233f50f723 Leon Romanovsky 2025-09-18  938  		mlx5_ib_dbg(dev, "umem_dmabuf get failed (%pe)\n", umem_dmabuf);
90da7dc8206a599 Jianxin Xiong   2020-12-15  939  		return ERR_CAST(umem_dmabuf);
90da7dc8206a599 Jianxin Xiong   2020-12-15  940  	}
90da7dc8206a599 Jianxin Xiong   2020-12-15  941  
e1bed9a94da86a7 Yishai Hadas    2025-07-17  942  	if (dmah) {
e1bed9a94da86a7 Yishai Hadas    2025-07-17  943  		struct mlx5_ib_dmah *mdmah = to_mdmah(dmah);
e1bed9a94da86a7 Yishai Hadas    2025-07-17  944  
e1bed9a94da86a7 Yishai Hadas    2025-07-17  945  		ph = dmah->ph;
e1bed9a94da86a7 Yishai Hadas    2025-07-17  946  		if (dmah->valid_fields & BIT(IB_DMAH_CPU_ID_EXISTS))
e1bed9a94da86a7 Yishai Hadas    2025-07-17  947  			st_index = mdmah->st_index;
e1bed9a94da86a7 Yishai Hadas    2025-07-17  948  	}
e1bed9a94da86a7 Yishai Hadas    2025-07-17  949  
90da7dc8206a599 Jianxin Xiong   2020-12-15  950  	mr = alloc_cacheable_mr(pd, &umem_dmabuf->umem, virt_addr,
e1bed9a94da86a7 Yishai Hadas    2025-07-17  951  				access_flags, access_mode,
e1bed9a94da86a7 Yishai Hadas    2025-07-17  952  				st_index, ph);
90da7dc8206a599 Jianxin Xiong   2020-12-15  953  	if (IS_ERR(mr)) {
90da7dc8206a599 Jianxin Xiong   2020-12-15  954  		ib_umem_release(&umem_dmabuf->umem);
90da7dc8206a599 Jianxin Xiong   2020-12-15  955  		return ERR_CAST(mr);
90da7dc8206a599 Jianxin Xiong   2020-12-15  956  	}
90da7dc8206a599 Jianxin Xiong   2020-12-15  957  
90da7dc8206a599 Jianxin Xiong   2020-12-15  958  	mlx5_ib_dbg(dev, "mkey 0x%x\n", mr->mmkey.key);
90da7dc8206a599 Jianxin Xiong   2020-12-15  959  
90da7dc8206a599 Jianxin Xiong   2020-12-15  960  	atomic_add(ib_umem_num_pages(mr->umem), &dev->mdev->priv.reg_pages);
90da7dc8206a599 Jianxin Xiong   2020-12-15  961  	umem_dmabuf->private = mr;
de8f847a5114ff7 Yishai Hadas    2024-08-01  962  	if (!pinned_mode) {
93e64c7a33ff667 Jason Gunthorpe 2026-06-03  963  		err = mlx5r_odp_create_eq(dev, &dev->odp_pf_eq);
93e64c7a33ff667 Jason Gunthorpe 2026-06-03  964  		if (err)
93e64c7a33ff667 Jason Gunthorpe 2026-06-03  965  			goto err_dereg_mr;
93e64c7a33ff667 Jason Gunthorpe 2026-06-03  966  
db72438c9319cfd Yishai Hadas    2021-02-02  967  		err = mlx5r_store_odp_mkey(dev, &mr->mmkey);
90da7dc8206a599 Jianxin Xiong   2020-12-15  968  		if (err)
90da7dc8206a599 Jianxin Xiong   2020-12-15  969  			goto err_dereg_mr;
de8f847a5114ff7 Yishai Hadas    2024-08-01  970  	} else {
de8f847a5114ff7 Yishai Hadas    2024-08-01  971  		mr->data_direct = true;
de8f847a5114ff7 Yishai Hadas    2024-08-01  972  	}
90da7dc8206a599 Jianxin Xiong   2020-12-15  973  
c9bf47d2051ad7e Jason Gunthorpe 2026-06-03  974  	err = mlx5_ib_init_dmabuf_mr(mr, pd);
90da7dc8206a599 Jianxin Xiong   2020-12-15  975  	if (err)
90da7dc8206a599 Jianxin Xiong   2020-12-15  976  		goto err_dereg_mr;
90da7dc8206a599 Jianxin Xiong   2020-12-15  977  	return &mr->ibmr;
90da7dc8206a599 Jianxin Xiong   2020-12-15  978  
90da7dc8206a599 Jianxin Xiong   2020-12-15  979  err_dereg_mr:
de8f847a5114ff7 Yishai Hadas    2024-08-01  980  	__mlx5_ib_dereg_mr(&mr->ibmr);
de8f847a5114ff7 Yishai Hadas    2024-08-01  981  	return ERR_PTR(err);
de8f847a5114ff7 Yishai Hadas    2024-08-01  982  }
de8f847a5114ff7 Yishai Hadas    2024-08-01  983  

:::::: The code at line 928 was first introduced by commit
:::::: 90da7dc8206a5999a23af719733f1cda26b5f815 RDMA/mlx5: Support dma-buf based userspace memory region

:::::: TO: Jianxin Xiong <jianxin.xiong@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
