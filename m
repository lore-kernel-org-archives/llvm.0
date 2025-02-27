Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84E2343AB;
	Thu, 27 Feb 2025 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740680686; cv=none; b=FRXK6kDi18lyYrQoFSDES8BjrrFHj5vb9AcFpZPEdeKj3wQ9qpuPck9xXzPZeyY/uhYdWZvZ71oLo12LgaJYZvvWaPlnB1WUfyjVHQyQ4/y5FvZIdZjgtrIdyqgaqIAh32ws8yo8ED8lZFVlVZUNiuu9WkaXnBZzUD0+WBQWkpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740680686; c=relaxed/simple;
	bh=zPUUPGfsMFDLfNpeAj4WeNja2vPXH/eEx/pu/bLxEd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY/2dSslaLJVZg6OYDxJ7KLH8xhyZQ6HgV7ORzRqv7nRZ6CvyTw3FQsoe6acP++hcPwSAuyj+/hoA1v+SUseiCPEBxnWqz2cieNKgTMP7RX7cNFMLtRD+UpopjF3rOWY3ERIDs/+6V6caCOFmAK57gc1jinp43zSEoVzQYQWXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RioJvzWr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RioJvzWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740680684; x=1772216684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zPUUPGfsMFDLfNpeAj4WeNja2vPXH/eEx/pu/bLxEd8=;
  b=RioJvzWrkfxM7QZoP3Hdkx23+OgSah8HL0dhkuXrX0GjsQF7m89ikdGR
   xgCkLBxSKhjPIH3XECV84QYXVlZ8WKhFtA1jvEIvykzhLzLwyXqd+3Bx2
   qlaxlQjJgij1iG62F0r052Us4SUVIu+GEkhZi8eY7EUbA5ih9DYM27u20
   aI2GUrf3N2K4NkrFf5VCtCylGefQB4BchK+RFYeXTi34Z/BrvSiLTiNB6
   4Zyohw0j/lHMPas1+7LKwr688XmGBc0/fxSIz4mq+m6lwxLy8NHSIMSID
   PeZix/esVjm9iM47UOBPiY6O46jVDf8g3u0OM+DyUu3RHMGz3Tyh7gr4w
   g==;
X-CSE-ConnectionGUID: 1ny/v3NjQLyHCDJnOQz+dg==
X-CSE-MsgGUID: uanI0yQLRoCETIKo1dQZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41471302"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41471302"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:24:42 -0800
X-CSE-ConnectionGUID: XttSR939TSSneW3vfouBag==
X-CSE-MsgGUID: 6pbHwY5HR/yRZ0BDgag4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117102576"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2025 10:24:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tniYo-000Dqo-2M;
	Thu, 27 Feb 2025 18:24:38 +0000
Date: Fri, 28 Feb 2025 02:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v10 2/4] page_pool: fix IOMMU crash when driver
 has already unbound
Message-ID: <202502280250.Bp3jD6ZE-lkp@intel.com>
References: <20250226110340.2671366-3-linyunsheng@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226110340.2671366-3-linyunsheng@huawei.com>

Hi Yunsheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunsheng-Lin/page_pool-introduce-page_pool_get_pp-API/20250226-191457
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250226110340.2671366-3-linyunsheng%40huawei.com
patch subject: [PATCH net-next v10 2/4] page_pool: fix IOMMU crash when driver has already unbound
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250228/202502280250.Bp3jD6ZE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280250.Bp3jD6ZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280250.Bp3jD6ZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:8:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:8:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:8:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:1567:20: error: no member named 'pp' in 'struct page'
    1567 |                 } else if (page->pp) {
         |                            ~~~~  ^
   12 warnings and 1 error generated.


vim +1567 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c

06059a1a9a4a58 Geetha sowjanya           2021-09-29  1480  
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1481  static bool otx2_xdp_rcv_pkt_handler(struct otx2_nic *pfvf,
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1482  				     struct bpf_prog *prog,
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1483  				     struct nix_cqe_rx_s *cqe,
70b2b6892645e5 Sebastian Andrzej Siewior 2023-09-18  1484  				     struct otx2_cq_queue *cq,
70b2b6892645e5 Sebastian Andrzej Siewior 2023-09-18  1485  				     bool *need_xdp_flush)
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1486  {
efabce29015189 Suman Ghosh               2025-02-13  1487  	struct xdp_buff xdp, *xsk_buff = NULL;
04f647c8e456fc Geetha sowjanya           2024-01-30  1488  	unsigned char *hard_start;
94c80f74887351 Suman Ghosh               2025-02-13  1489  	struct otx2_pool *pool;
94c80f74887351 Suman Ghosh               2025-02-13  1490  	struct xdp_frame *xdpf;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1491  	int qidx = cq->cq_idx;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1492  	struct page *page;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1493  	u64 iova, pa;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1494  	u32 act;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1495  	int err;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1496  
94c80f74887351 Suman Ghosh               2025-02-13  1497  	pool = &pfvf->qset.pool[qidx];
efabce29015189 Suman Ghosh               2025-02-13  1498  
efabce29015189 Suman Ghosh               2025-02-13  1499  	if (pool->xsk_pool) {
efabce29015189 Suman Ghosh               2025-02-13  1500  		xsk_buff = pool->xdp[--cq->rbpool->xdp_top];
efabce29015189 Suman Ghosh               2025-02-13  1501  		if (!xsk_buff)
efabce29015189 Suman Ghosh               2025-02-13  1502  			return false;
efabce29015189 Suman Ghosh               2025-02-13  1503  
efabce29015189 Suman Ghosh               2025-02-13  1504  		xsk_buff->data_end = xsk_buff->data + cqe->sg.seg_size;
efabce29015189 Suman Ghosh               2025-02-13  1505  		act = bpf_prog_run_xdp(prog, xsk_buff);
efabce29015189 Suman Ghosh               2025-02-13  1506  		goto handle_xdp_verdict;
efabce29015189 Suman Ghosh               2025-02-13  1507  	}
efabce29015189 Suman Ghosh               2025-02-13  1508  
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1509  	iova = cqe->sg.seg_addr - OTX2_HEAD_ROOM;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1510  	pa = otx2_iova_to_phys(pfvf->iommu_domain, iova);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1511  	page = virt_to_page(phys_to_virt(pa));
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1512  
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1513  	xdp_init_buff(&xdp, pfvf->rbsize, &cq->xdp_rxq);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1514  
04f647c8e456fc Geetha sowjanya           2024-01-30  1515  	hard_start = (unsigned char *)phys_to_virt(pa);
04f647c8e456fc Geetha sowjanya           2024-01-30  1516  	xdp_prepare_buff(&xdp, hard_start, OTX2_HEAD_ROOM,
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1517  			 cqe->sg.seg_size, false);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1518  
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1519  	act = bpf_prog_run_xdp(prog, &xdp);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1520  
efabce29015189 Suman Ghosh               2025-02-13  1521  handle_xdp_verdict:
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1522  	switch (act) {
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1523  	case XDP_PASS:
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1524  		break;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1525  	case XDP_TX:
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1526  		qidx += pfvf->hw.tx_queues;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1527  		cq->pool_ptrs++;
94c80f74887351 Suman Ghosh               2025-02-13  1528  		xdpf = xdp_convert_buff_to_frame(&xdp);
53616af09b5a55 Suman Ghosh               2025-02-13  1529  		return otx2_xdp_sq_append_pkt(pfvf, xdpf,
53616af09b5a55 Suman Ghosh               2025-02-13  1530  					      cqe->sg.seg_addr,
53616af09b5a55 Suman Ghosh               2025-02-13  1531  					      cqe->sg.seg_size,
53616af09b5a55 Suman Ghosh               2025-02-13  1532  					      qidx, OTX2_XDP_TX);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1533  	case XDP_REDIRECT:
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1534  		cq->pool_ptrs++;
efabce29015189 Suman Ghosh               2025-02-13  1535  		if (xsk_buff) {
efabce29015189 Suman Ghosh               2025-02-13  1536  			err = xdp_do_redirect(pfvf->netdev, xsk_buff, prog);
efabce29015189 Suman Ghosh               2025-02-13  1537  			if (!err) {
efabce29015189 Suman Ghosh               2025-02-13  1538  				*need_xdp_flush = true;
efabce29015189 Suman Ghosh               2025-02-13  1539  				return true;
efabce29015189 Suman Ghosh               2025-02-13  1540  			}
efabce29015189 Suman Ghosh               2025-02-13  1541  			return false;
efabce29015189 Suman Ghosh               2025-02-13  1542  		}
efabce29015189 Suman Ghosh               2025-02-13  1543  
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1544  		err = xdp_do_redirect(pfvf->netdev, &xdp, prog);
70b2b6892645e5 Sebastian Andrzej Siewior 2023-09-18  1545  		if (!err) {
70b2b6892645e5 Sebastian Andrzej Siewior 2023-09-18  1546  			*need_xdp_flush = true;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1547  			return true;
70b2b6892645e5 Sebastian Andrzej Siewior 2023-09-18  1548  		}
94c80f74887351 Suman Ghosh               2025-02-13  1549  
94c80f74887351 Suman Ghosh               2025-02-13  1550  		otx2_dma_unmap_page(pfvf, iova, pfvf->rbsize,
94c80f74887351 Suman Ghosh               2025-02-13  1551  				    DMA_FROM_DEVICE);
94c80f74887351 Suman Ghosh               2025-02-13  1552  		xdpf = xdp_convert_buff_to_frame(&xdp);
94c80f74887351 Suman Ghosh               2025-02-13  1553  		xdp_return_frame(xdpf);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1554  		break;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1555  	default:
c8064e5b4adac5 Paolo Abeni               2021-11-30  1556  		bpf_warn_invalid_xdp_action(pfvf->netdev, prog, act);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1557  		break;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1558  	case XDP_ABORTED:
efabce29015189 Suman Ghosh               2025-02-13  1559  		if (xsk_buff)
efabce29015189 Suman Ghosh               2025-02-13  1560  			xsk_buff_free(xsk_buff);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1561  		trace_xdp_exception(pfvf->netdev, prog, act);
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1562  		break;
06059a1a9a4a58 Geetha sowjanya           2021-09-29  1563  	case XDP_DROP:
94c80f74887351 Suman Ghosh               2025-02-13  1564  		cq->pool_ptrs++;
efabce29015189 Suman Ghosh               2025-02-13  1565  		if (xsk_buff) {
efabce29015189 Suman Ghosh               2025-02-13  1566  			xsk_buff_free(xsk_buff);
efabce29015189 Suman Ghosh               2025-02-13 @1567  		} else if (page->pp) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
