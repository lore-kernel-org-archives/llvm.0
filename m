Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F85D3385B2;
	Mon, 26 Jan 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437045; cv=none; b=XyvS1Xkhh6t0SbfAGogTyPDW0SCf6rGjsX9LLeUHMaoaZ7ry+YSP2rmHp0MzqXdZZl+nw55dbWQ0Wv8kUBJhyjP1y1eYs0nm97OtvKKn7Ei/6pd5HaL4U6eU6Z9Jry6rrX9AU1SMxGFMP0/oMRM3GE665QHwaHO/Sa2xpGQdeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437045; c=relaxed/simple;
	bh=eYx1D931YWCRlQn/o4fF20JfGMSZqrh3DVTKazRQpU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ej2tckFiQRRpVkrvf7dXvgg4kzQCAjITI9aDD9Q8pryZlBougI82QgKEAoQLaZ6umfnSGDXCfUXIzEVTOuj/4UPNQBV7p3OJ1q4IZad1XXG52UVQwOdnmXirg05UGBjGHNtaQ5g5i9UDft89I6wOgxxgAKIP68MplHZUfIjHldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0l8Orh4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0l8Orh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437044; x=1800973044;
  h=date:from:to:cc:subject:message-id;
  bh=eYx1D931YWCRlQn/o4fF20JfGMSZqrh3DVTKazRQpU0=;
  b=A0l8Orh4gLAl/b8rf4mGW6cm5FNSFl8vnlKnPmCkMT2HogpXyPs52feg
   OErkNDIuF518CaCZ9vTeNr+kMKHF2V/824E7k6IWSJn6h/k4RnzKYtPUG
   XXKLyHiyvako/vuTWcvNTZRFxpNZV7JQIYchI00lz+N677uLkqF96YSip
   1BW//61YY0SUxr/xZu9o5VXBxAIgmx9AAHHxHN2FdNz1VR6+tPFOyawi4
   dRsUJ0NCmBgRXGVDCesp2dmAFkmWso25N2h+f6i7mSpgU6R6ACGHHa8Lz
   4i9hiEzx0kvLjHXdgsnixdlMCi7Wgc8g7Fh3EpFXrxr756mR3g+4OJKbp
   g==;
X-CSE-ConnectionGUID: eQzyfpJESuSlZvDzvRn6eQ==
X-CSE-MsgGUID: w0fKyAMERvi/BNRhpziqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82045010"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="82045010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:17:24 -0800
X-CSE-ConnectionGUID: XnfW30uFQjilfJAGBc5DeA==
X-CSE-MsgGUID: 08An2dkFT3yWyGBNKVxTIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212230860"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2026 06:17:22 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNP5-000000001Xt-08df;
	Mon, 26 Jan 2026 14:17:19 +0000
Date: Mon, 26 Jan 2026 15:16:27 +0100
From: kernel test robot <lkp@intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/usb/host/xhci-mem.c:2513:6: warning: variable
 'secondary_intr_num' is used uninitialized whenever 'if' condition is false
Message-ID: <202601261558.spvT07v2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/raoxu/usb-xhci-refactor-IRQ-interrupter-plumbing-for/20260126-170049
head:   d70c6257e1bb83bae7e67e2576ee4f03e0b6be10
commit: d70c6257e1bb83bae7e67e2576ee4f03e0b6be10 usb: xhci: enable secondary interrupters and route
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260126/202601261558.spvT07v2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261558.spvT07v2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261558.spvT07v2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-mem.c:2513:6: warning: variable 'secondary_intr_num' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2513 |         if (xhci->max_interrupters > 1)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2518:19: note: uninitialized use occurs here
    2518 |         for (i = 1; i <= secondary_intr_num; i++) {
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2513:2: note: remove the 'if' if its condition is always true
    2513 |         if (xhci->max_interrupters > 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2514 |                 secondary_intr_num = min_t(unsigned int,
   drivers/usb/host/xhci-mem.c:2414:33: note: initialize the variable 'secondary_intr_num' to silence this warning
    2414 |         unsigned int    secondary_intr_num;
         |                                           ^
         |                                            = 0
   1 warning generated.


vim +2513 drivers/usb/host/xhci-mem.c

  2409	
  2410	int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
  2411	{
  2412		struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
  2413		dma_addr_t	dma;
  2414		unsigned int	secondary_intr_num;
  2415		int		i;
  2416	
  2417		/*
  2418		 * xHCI section 5.4.6 - Device Context array must be
  2419		 * "physically contiguous and 64-byte (cache line) aligned".
  2420		 */
  2421		xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma, flags);
  2422		if (!xhci->dcbaa)
  2423			goto fail;
  2424	
  2425		xhci->dcbaa->dma = dma;
  2426		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
  2427			       "Device context base array address = 0x%pad (DMA), %p (virt)",
  2428			       &xhci->dcbaa->dma, xhci->dcbaa);
  2429	
  2430		/*
  2431		 * Initialize the ring segment pool.  The ring must be a contiguous
  2432		 * structure comprised of TRBs.  The TRBs must be 16 byte aligned,
  2433		 * however, the command ring segment needs 64-byte aligned segments
  2434		 * and our use of dma addresses in the trb_address_map radix tree needs
  2435		 * TRB_SEGMENT_SIZE alignment, so we pick the greater alignment need.
  2436		 */
  2437		if (xhci->quirks & XHCI_TRB_OVERFETCH)
  2438			/* Buggy HC prefetches beyond segment bounds - allocate dummy space at the end */
  2439			xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
  2440					TRB_SEGMENT_SIZE * 2, TRB_SEGMENT_SIZE * 2, xhci->page_size * 2);
  2441		else
  2442			xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
  2443					TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE, xhci->page_size);
  2444		if (!xhci->segment_pool)
  2445			goto fail;
  2446	
  2447		/* See Table 46 and Note on Figure 55 */
  2448		xhci->device_pool = dma_pool_create("xHCI input/output contexts", dev, 2112, 64,
  2449						    xhci->page_size);
  2450		if (!xhci->device_pool)
  2451			goto fail;
  2452	
  2453		/*
  2454		 * Linear stream context arrays don't have any boundary restrictions,
  2455		 * and only need to be 16-byte aligned.
  2456		 */
  2457		xhci->small_streams_pool = dma_pool_create("xHCI 256 byte stream ctx arrays",
  2458							   dev, SMALL_STREAM_ARRAY_SIZE, 16, 0);
  2459		if (!xhci->small_streams_pool)
  2460			goto fail;
  2461	
  2462		/*
  2463		 * Any stream context array bigger than MEDIUM_STREAM_ARRAY_SIZE will be
  2464		 * allocated with dma_alloc_coherent().
  2465		 */
  2466	
  2467		xhci->medium_streams_pool = dma_pool_create("xHCI 1KB stream ctx arrays",
  2468							    dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
  2469		if (!xhci->medium_streams_pool)
  2470			goto fail;
  2471	
  2472		/*
  2473		 * refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
  2474		 * refer to xhci rev1_2 protocol 6.4.3.14 port bandwidth buffer need
  2475		 * to be 16-byte aligned.
  2476		 */
  2477		xhci->port_bw_pool = dma_pool_create("xHCI 256 port bw ctx arrays",
  2478						     dev, GET_PORT_BW_ARRAY_SIZE, 16, 0);
  2479		if (!xhci->port_bw_pool)
  2480			goto fail;
  2481	
  2482		/* Set up the command ring to have one segments for now. */
  2483		xhci->cmd_ring = xhci_ring_alloc(xhci, 1, TYPE_COMMAND, 0, flags);
  2484		if (!xhci->cmd_ring)
  2485			goto fail;
  2486	
  2487		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
  2488		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
  2489			       &xhci->cmd_ring->first_seg->dma);
  2490	
  2491		/*
  2492		 * Reserve one command ring TRB for disabling LPM.
  2493		 * Since the USB core grabs the shared usb_bus bandwidth mutex before
  2494		 * disabling LPM, we only need to reserve one TRB for all devices.
  2495		 */
  2496		xhci->cmd_ring_reserved_trbs++;
  2497	
  2498		/* Allocate and set up primary interrupter 0 with an event ring. */
  2499		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating primary event ring");
  2500		xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
  2501						  flags, dev_to_node(dev));
  2502		if (!xhci->interrupters)
  2503			goto fail;
  2504	
  2505		xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
  2506		if (!xhci->interrupters[0])
  2507			goto fail;
  2508	
  2509		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
  2510				"Allocating secondary event ring");
  2511		xhci->secondary_irqs_alloc = 0;
  2512	
> 2513		if (xhci->max_interrupters > 1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
