Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5835B385D76;
	Tue, 12 May 2026 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627676; cv=none; b=lucLeuluUTqyXeDQTg4a1AkjWKNe/s9PkDjRliQYdZ7m2dQDKW7JECZ+h1pxYs8ngJLdoNteox7tp4TGvLNrLsirtYUMpbEpCM90o4cOP5ZXDqGL1/Ru+TJU3kAYgfyGYaOim9LTmcbrLsSmAU0v3xDYQ7Zh67Uk3Bq319DxvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627676; c=relaxed/simple;
	bh=b0ENG//FPkb6K2DSAb2rZczO6VRgznnTxENiAqfKDDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNblTmXXrLJRHW+OFO+KdHSgOIfi6FHhtTA68/UZjfDpqhUm8zXEPXF5oQ8SroIpk+VfaynZQa9DSXRaP5Db+1mtfr5EG7Lry2Pgzv0elsdQtvCYaAQEoKoVhVq6T7P0C7PEQ99RC79YnqGBUQyCOAnUc/GL0Ux3YPSqi0gXIxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+PvVjKB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+PvVjKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778627674; x=1810163674;
  h=date:from:to:cc:subject:message-id;
  bh=b0ENG//FPkb6K2DSAb2rZczO6VRgznnTxENiAqfKDDQ=;
  b=X+PvVjKBKUmaAbXoUlDMIAWtRZgaCf0fHQBPOK08x6QZPRLxLgIuqnjQ
   hzJGtQAESYBfAKMwehRy8r/43QXmZpd6+t2QWmZDWagwiYIGEfaojofh9
   SFG1nchO2+RqNaE0ZoQGvfFpNcNwJQOEDBwloJgVsa/1yFW2KnmrSSUUE
   MYHK1aCn63PA5b8ueOPkSQAMq52e/hV5bDNeSukecgFGrtxL+S0kakH8S
   donQsODbBAEBWXHYgKbQX3BbgvAaEqo5URDYdDgCNHKb73QHy7pfjTPa0
   yXOjrD1y0O29XIkdDUlH2pAEGoq2uiQ/X4WMpO5Zj+u4/0JL0QE911OpD
   A==;
X-CSE-ConnectionGUID: /jEa6GcMRIee+IUwjxlzjw==
X-CSE-MsgGUID: u/uZaFzrQwatCRME0+sK/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79727510"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79727510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 16:14:33 -0700
X-CSE-ConnectionGUID: XYXRE/GyQjCifjkcsUKo3A==
X-CSE-MsgGUID: KW7w8JxPT6ifSC/+tmKknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242882580"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 16:14:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMwJ4-000000008NN-1Rf2;
	Tue, 12 May 2026 23:14:30 +0000
Date: Wed, 13 May 2026 01:14:26 +0200
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/mr.c:913:20: error: no member
 named 'tph_req_type' in 'struct pci_dev'
Message-ID: <202605130114.zFnPmvo1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/vfio-add-dma-buf-get_tph-callback-and-DMA_BUF_TPH-feature/20260505-063643
head:   b58a906ae381ef91f4e88afd4862bee58a0c7bf2
commit: b58a906ae381ef91f4e88afd4862bee58a0c7bf2 RDMA/mlx5: get tph for p2p access when registering dma-buf mr
date:   8 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260513/202605130114.zFnPmvo1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130114.zFnPmvo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130114.zFnPmvo1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/mr.c:913:20: error: no member named 'tph_req_type' in 'struct pci_dev'
     913 |         st_width = (pdev->tph_req_type == PCI_TPH_REQ_EXT_TPH) ? 16 : 8;
         |                     ~~~~  ^
   1 error generated.


vim +913 drivers/infiniband/hw/mlx5/mr.c

   903	
   904	static void get_tph_mr_dmabuf(struct mlx5_ib_dev *dev, int fd, u16 *st_index,
   905				      u8 *ph)
   906	{
   907		struct pci_dev *pdev = dev->mdev->pdev;
   908		struct dma_buf *dmabuf;
   909		u16 steering_tag;
   910		u8 st_width;
   911		int ret;
   912	
 > 913		st_width = (pdev->tph_req_type == PCI_TPH_REQ_EXT_TPH) ? 16 : 8;
   914	
   915		dmabuf = dma_buf_get(fd);
   916		if (IS_ERR(dmabuf))
   917			return;
   918	
   919		if (!dmabuf->ops->get_tph)
   920			goto end_dbuf_put;
   921	
   922		ret = dmabuf->ops->get_tph(dmabuf, &steering_tag, ph, st_width);
   923		if (ret) {
   924			mlx5_ib_dbg(dev, "get_tph failed (%d)\n", ret);
   925			goto end_dbuf_put;
   926		}
   927	
   928		ret = mlx5_st_alloc_index_by_tag(dev->mdev, steering_tag, st_index);
   929		if (ret) {
   930			*ph = MLX5_IB_NO_PH;
   931			mlx5_ib_dbg(dev, "st_alloc_index_by_tag failed (%d)\n", ret);
   932		}
   933	
   934	end_dbuf_put:
   935		dma_buf_put(dmabuf);
   936	}
   937	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
