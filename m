Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C042F999F;
	Mon, 26 Jan 2026 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439000; cv=none; b=hrCCy5NP7TtrwhP81jGjIwNHVkSHWRIIrIJz8KImbobcQZX0Z+LPtlil/+zueQRabBdxim8P8D4plzWdzA8cD5gjzpV58vV06wiuKGB7X3v1FNnGiXo85m/lDM+Xo4d2AknE/rVxB+Ja8D8eDh3tn5iPPy96sgFXnndPBArSz/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439000; c=relaxed/simple;
	bh=U/bi4GQBZ8XFonhoMZG/nx0/UOKCcUDC6iSkEVpfXWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV/JPuUFTKaNSJ2iHz+ebTWksSaqs0aNhqWlHOB3pBP0gijX783moqMHGXExC3Dr1YZLCjbLXTn+v4C8bnDumlLTG7ju2byj+YS/G2ECK9elSO9VhFFenRP4PlMJvGJpweqHOPHcGBCBFKt0jEhNlszQQyPV9L/0I2ppZdns3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsKv2MUd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsKv2MUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769438999; x=1800974999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U/bi4GQBZ8XFonhoMZG/nx0/UOKCcUDC6iSkEVpfXWw=;
  b=UsKv2MUdy0JrosttOqvRUmmk0xrKpApB4DI69pIVwcT+3PtxH3Ruo5Ua
   /eRkgCBkEwz/T99nUE130rkjw+g+E9WdwX6qUz3VIbxjgTVJd+XMpWEz3
   +8vpOLw4/zTD/1/Ys1ohA+Xv8Y0zbQGGZwfLq77zOB8kkyI0gSgyaSXnT
   zoekXXrRj2vI2x/SFXlzBpfiHSIGf/R5PBBsWOvGHG5v7HWCETXqcVPpq
   LjL6+irlKraL+UunEZYubDcSqcErJF1l6OTfgL0PAkrPVlDG9fbmJ6PmW
   O4pjUGDol9qEJ0sxdDS2bpcXhmh9gV8UbTctbjBVh/AgZXGHzYG0BvZ7X
   w==;
X-CSE-ConnectionGUID: OVe4kCw9Q+Sy7WnAsuiSfg==
X-CSE-MsgGUID: RAuFiU0+TMernR6/A4wPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81334805"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="81334805"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:49:58 -0800
X-CSE-ConnectionGUID: G8PsNTRnRCeEoqEXEuacvA==
X-CSE-MsgGUID: Pe+7CoAYQpuqF2KYOmpdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207720977"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2026 06:49:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNua-00000000XPK-2l9W;
	Mon, 26 Jan 2026 14:49:52 +0000
Date: Mon, 26 Jan 2026 22:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, kenny@panix.com,
	linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH v10 2/2] usb: xhci: enable secondary interrupters and
 route
Message-ID: <202601262208.UybEjc9X-lkp@intel.com>
References: <1FCECDEA86461C52+20260126085828.803972-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1FCECDEA86461C52+20260126085828.803972-1-raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.19-rc7 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/usb-xhci-refactor-IRQ-interrupter-plumbing-for/20260126-170049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1FCECDEA86461C52%2B20260126085828.803972-1-raoxu%40uniontech.com
patch subject: [PATCH v10 2/2] usb: xhci: enable secondary interrupters and route
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260126/202601262208.UybEjc9X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262208.UybEjc9X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262208.UybEjc9X-lkp@intel.com/

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
