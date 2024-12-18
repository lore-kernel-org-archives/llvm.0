Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECB1F63E7;
	Wed, 18 Dec 2024 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539411; cv=none; b=FkFXu1IJKqdKbOjrRIEBLqROkMARJ2Vi/hTyonItQWZZ1yXvBa7ZvJOVlf5t0znfmS8Mi8aBtW30Q7L7uWX54JD2rMQiqBAwoKWqYIx8kjY9XlNipfuIn4H9CHreuk9D9oZzjCIODsRdUOw4PLOaZ7e2ku9IzK5kQvD7d8hIlXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539411; c=relaxed/simple;
	bh=VW9Ag9Yu/wJHeedrdLwTnvXGP697c6Bf8E3Dxe7xPok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sG5TaU5qbVZrpIms94iIeCNXQaI2Hbi07mNf3XLXI8Dm8U0ameSVIoXPFiEAsHm+ygG4sqzi7Bgu7TuvW2yIeQAMYkNjH4Txr13mATn90HXU//NG+xggy/VfSH6F0Z3FEqgjjoCc7egmGpX1jPeIe0aOuO7eHKtNlrAjYs7nbCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvjtEaOV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvjtEaOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734539408; x=1766075408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VW9Ag9Yu/wJHeedrdLwTnvXGP697c6Bf8E3Dxe7xPok=;
  b=ZvjtEaOVzfg9RI6IsfkniTFpngI8dWdC1lj2eIoOSsam3nlXh7ax8Uga
   HGdPzRrIsB1HexkZEaQCdOXSxPIIQgeEaR4lf9ixYOTZcPNcF1rDzcSay
   OTJSGphfxCyA/8XacSqHnEZ6OFU3d76nSm9IYnMeF2HNd8rxxNZVxRV7D
   +PhpxKhLpfZbFEWS//kmgRDT7OI4jnNiWyiQ5MiJy97EbyrhUb6bXXaVU
   BVETRtHg3C7CVWeMznHCtcpy0EkQIPmJNJqGORkzi6Re4pFmftIjeOyRm
   2gMCOlMDReDk4EjWSEE1qEYsn+G9Ekuij/Aa4nAWGApfTAmYI6Fx+jyzk
   A==;
X-CSE-ConnectionGUID: vJA2Uh5/Q2egAT39qXtt4A==
X-CSE-MsgGUID: 1w9Q5I03TaGNkAM5390Wpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22611322"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="22611322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 08:30:06 -0800
X-CSE-ConnectionGUID: 84c1srdNRWif1SZs6gDQxw==
X-CSE-MsgGUID: y+72Z7nRR0WlUEFtfAK1jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102058127"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 08:30:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNwvz-000GU0-0d;
	Wed, 18 Dec 2024 16:30:03 +0000
Date: Thu, 19 Dec 2024 00:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Cohen <amcohen@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 46/59]
 drivers/net/ethernet/mellanox/mlxsw/pci.c:2539:7: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202412190046.DlPYWIKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   67f57c974213a49868d8eabd492bd7446ae62abb
commit: f060e27d09ce98effbe55f69411e8cbb90f9921a [46/59] mlxsw: Handle DMA mapping in mlxsw_pci_xdp_frame_transmit()
config: arm-randconfig-003-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190046.DlPYWIKy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190046.DlPYWIKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190046.DlPYWIKy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/pci.c:2539:7: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    2539 |         for (i++; i < MLXSW_PCI_WQE_SG_ENTRIES; i++)
         |              ^
   drivers/net/ethernet/mellanox/mlxsw/pci.c:2495:16: note: initialize the variable 'i' to silence this warning
    2495 |         int err = 0, i;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/i +2539 drivers/net/ethernet/mellanox/mlxsw/pci.c

f060e27d09ce98e Amit Cohen 2024-12-10  2485  
f060e27d09ce98e Amit Cohen 2024-12-10  2486  int __mlxsw_pci_xdp_frame_transmit(struct mlxsw_pci *mlxsw_pci,
45cbc637d94b343 Amit Cohen 2024-11-27  2487  				   struct xdp_frame *xdpf,
f060e27d09ce98e Amit Cohen 2024-12-10  2488  				   const struct mlxsw_txhdr_info *txhdr_info,
f060e27d09ce98e Amit Cohen 2024-12-10  2489  				   bool dma_map)
45cbc637d94b343 Amit Cohen 2024-11-27  2490  {
45cbc637d94b343 Amit Cohen 2024-11-27  2491  	struct mlxsw_pci_queue_elem_info *elem_info;
45cbc637d94b343 Amit Cohen 2024-11-27  2492  	struct pci_dev *pdev = mlxsw_pci->pdev;
45cbc637d94b343 Amit Cohen 2024-11-27  2493  	struct skb_shared_info *sinfo;
45cbc637d94b343 Amit Cohen 2024-11-27  2494  	struct mlxsw_pci_queue *q;
45cbc637d94b343 Amit Cohen 2024-11-27  2495  	int err = 0, i;
45cbc637d94b343 Amit Cohen 2024-11-27  2496  	char *wqe;
45cbc637d94b343 Amit Cohen 2024-11-27  2497  
45cbc637d94b343 Amit Cohen 2024-11-27  2498  	if (xdpf->headroom < MLXSW_TXHDR_LEN) {
45cbc637d94b343 Amit Cohen 2024-11-27  2499  		dev_err_ratelimited(&pdev->dev,
45cbc637d94b343 Amit Cohen 2024-11-27  2500  				    "Failed to transmit XDP frame, not enough headroom for Tx header\n");
45cbc637d94b343 Amit Cohen 2024-11-27  2501  		return -EINVAL;
45cbc637d94b343 Amit Cohen 2024-11-27  2502  	}
45cbc637d94b343 Amit Cohen 2024-11-27  2503  
45cbc637d94b343 Amit Cohen 2024-11-27  2504  	sinfo = xdp_get_shared_info_from_frame(xdpf);
45cbc637d94b343 Amit Cohen 2024-11-27  2505  	if (unlikely(sinfo->nr_frags > MLXSW_PCI_WQE_SG_ENTRIES - 1)) {
45cbc637d94b343 Amit Cohen 2024-11-27  2506  		dev_err_ratelimited(&pdev->dev,
45cbc637d94b343 Amit Cohen 2024-11-27  2507  				    "Failed to transmit XDP frame, %d fragments are not supported\n", sinfo->nr_frags);
45cbc637d94b343 Amit Cohen 2024-11-27  2508  		return -EINVAL;
45cbc637d94b343 Amit Cohen 2024-11-27  2509  	}
45cbc637d94b343 Amit Cohen 2024-11-27  2510  
45cbc637d94b343 Amit Cohen 2024-11-27  2511  	xdpf->data -= MLXSW_TXHDR_LEN;
45cbc637d94b343 Amit Cohen 2024-11-27  2512  	xdpf->headroom -= MLXSW_TXHDR_LEN;
45cbc637d94b343 Amit Cohen 2024-11-27  2513  	xdpf->len += MLXSW_TXHDR_LEN;
45cbc637d94b343 Amit Cohen 2024-11-27  2514  
45cbc637d94b343 Amit Cohen 2024-11-27  2515  	mlxsw_pci_txhdr_construct(xdpf->data, txhdr_info);
45cbc637d94b343 Amit Cohen 2024-11-27  2516  
45cbc637d94b343 Amit Cohen 2024-11-27  2517  	q = mlxsw_pci_sdq_get(mlxsw_pci, MLXSW_PCI_SDQ_RESERVED_INDEX_XDP);
45cbc637d94b343 Amit Cohen 2024-11-27  2518  	spin_lock(&q->lock);
45cbc637d94b343 Amit Cohen 2024-11-27  2519  
45cbc637d94b343 Amit Cohen 2024-11-27  2520  	elem_info = mlxsw_pci_tx_elem_info_get(q);
45cbc637d94b343 Amit Cohen 2024-11-27  2521  	if (!elem_info) {
45cbc637d94b343 Amit Cohen 2024-11-27  2522  		err = -EAGAIN;
45cbc637d94b343 Amit Cohen 2024-11-27  2523  		goto unlock;
45cbc637d94b343 Amit Cohen 2024-11-27  2524  	}
45cbc637d94b343 Amit Cohen 2024-11-27  2525  
45cbc637d94b343 Amit Cohen 2024-11-27  2526  	elem_info->sdq.xdpf = xdpf;
45cbc637d94b343 Amit Cohen 2024-11-27  2527  
45cbc637d94b343 Amit Cohen 2024-11-27  2528  	wqe = elem_info->elem;
45cbc637d94b343 Amit Cohen 2024-11-27  2529  
f060e27d09ce98e Amit Cohen 2024-12-10  2530  	if (dma_map) {
f060e27d09ce98e Amit Cohen 2024-12-10  2531  		err = mlxsw_pci_xdp_frame_wqe_map(mlxsw_pci, elem_info, xdpf);
f060e27d09ce98e Amit Cohen 2024-12-10  2532  		if (err)
f060e27d09ce98e Amit Cohen 2024-12-10  2533  			goto unlock;
f060e27d09ce98e Amit Cohen 2024-12-10  2534  	} else {
f060e27d09ce98e Amit Cohen 2024-12-10  2535  		mlxsw_pci_xdp_frame_wqe_set(mlxsw_pci, wqe, xdpf);
45cbc637d94b343 Amit Cohen 2024-11-27  2536  	}
45cbc637d94b343 Amit Cohen 2024-11-27  2537  
45cbc637d94b343 Amit Cohen 2024-11-27  2538  	/* Set unused sq entries byte count to zero. */
45cbc637d94b343 Amit Cohen 2024-11-27 @2539  	for (i++; i < MLXSW_PCI_WQE_SG_ENTRIES; i++)
45cbc637d94b343 Amit Cohen 2024-11-27  2540  		mlxsw_pci_wqe_byte_count_set(wqe, i, 0);
45cbc637d94b343 Amit Cohen 2024-11-27  2541  
eea8ab714dbebb8 Amit Cohen 2024-12-10  2542  	/* Increase the counter, ringing the doorbell will be done later for
eea8ab714dbebb8 Amit Cohen 2024-12-10  2543  	 * several frames.
eea8ab714dbebb8 Amit Cohen 2024-12-10  2544  	 */
45cbc637d94b343 Amit Cohen 2024-11-27  2545  	q->producer_counter++;
45cbc637d94b343 Amit Cohen 2024-11-27  2546  
45cbc637d94b343 Amit Cohen 2024-11-27  2547  unlock:
45cbc637d94b343 Amit Cohen 2024-11-27  2548  	spin_unlock(&q->lock);
45cbc637d94b343 Amit Cohen 2024-11-27  2549  	return err;
45cbc637d94b343 Amit Cohen 2024-11-27  2550  }
45cbc637d94b343 Amit Cohen 2024-11-27  2551  

:::::: The code at line 2539 was first introduced by commit
:::::: 45cbc637d94b34316ad74857c3ea6fcd7dd44439 mlxsw: pci: Support transmitting XDP frame

:::::: TO: Amit Cohen <amcohen@nvidia.com>
:::::: CC: Petr Machata <petrm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
