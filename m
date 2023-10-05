Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B57E;
	Thu,  5 Oct 2023 03:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0Es+Bcd"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696476584; x=1728012584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PZY7vycAM/9gFEbm47qiaeDOYmyaVNwTV98A3QicJE=;
  b=J0Es+BcdyneW+MjA9oBX8kdBBQq1w0xgzPJE1vBscIuIHJLaUgJGgAoN
   rgmfwQGm+EZZBCRXyy9vL/FkovC3oNU87ahk6eeRVFT38YDHCqWn0A3c2
   98Loq5d6b2O2uw2Ah+vUcwWyQfX34KpRgWjIDQAYQt+VPPDZJbkiLj3BS
   6YjqWOwGVHZq19Pn+IHNGhcMPw8cBSBQMmm+WRgrUGpp/Kahp/IPMSIi0
   Kulg+6BXPoZgxZ+b5CV56wb9jRYtKjuKwHSNpmZXTGXgMUUsLtS0X0kA3
   ZoxUsRKji9ZB9yZn8vn9OTaisiAzbpikVwdlz+DUU2YC69IoNCN/3qWk3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447567554"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="447567554"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 20:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786789228"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="786789228"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Oct 2023 20:29:41 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoF3T-000Kwp-1P;
	Thu, 05 Oct 2023 03:29:39 +0000
Date: Thu, 5 Oct 2023 11:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-sideband.c:74:1: warning: no previous prototype for
 function '__xhci_sideband_remove_endpoint'
Message-ID: <202310051159.tvz1CpfL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   bb0c831ce413e570838e479ef5603d0230418798
commit: bb0c831ce413e570838e479ef5603d0230418798 [4/4] xhci: sideband: add initial api to register a sideband entity
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051159.tvz1CpfL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051159.tvz1CpfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051159.tvz1CpfL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:74:1: warning: no previous prototype for function '__xhci_sideband_remove_endpoint' [-Wmissing-prototypes]
      74 | __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
         | ^
   drivers/usb/host/xhci-sideband.c:73:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      73 | void
         | ^
         | static 
>> drivers/usb/host/xhci-sideband.c:189:1: warning: no previous prototype for function 'xhci_sideband_endpoint_buffer' [-Wmissing-prototypes]
     189 | xhci_sideband_endpoint_buffer(struct xhci_sideband *sb,
         | ^
   drivers/usb/host/xhci-sideband.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     188 | struct sg_table *
         | ^
         | static 
>> drivers/usb/host/xhci-sideband.c:217:1: warning: no previous prototype for function 'xhci_sideband_event_buffer' [-Wmissing-prototypes]
     217 | xhci_sideband_event_buffer(struct xhci_sideband *sb)
         | ^
   drivers/usb/host/xhci-sideband.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     216 | struct sg_table *
         | ^
         | static 
   3 warnings generated.


vim +/__xhci_sideband_remove_endpoint +74 drivers/usb/host/xhci-sideband.c

    72	
    73	void
  > 74	__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
    75	{
    76		ep->sideband = NULL;
    77		sb->eps[ep->ep_index] = NULL;
    78	}
    79	
    80	/* sideband api functions */
    81	
    82	/**
    83	 * xhci_sideband_add_endpoint - add endpoint to sideband access list
    84	 * @sb: sideband instance for this usb device
    85	 * @host_ep: usb host endpoint
    86	 *
    87	 * Adds an endpoint to the list of sideband accessed endpoints for this usb
    88	 * device.
    89	 * After an endpoint is added the sideband client can get the endpoint transfer
    90	 * ring buffer by calling xhci_sideband_endpoint_buffer()
    91	 *
    92	 * Return: 0 on success, negative error otherwise.
    93	 */
    94	int
    95	xhci_sideband_add_endpoint(struct xhci_sideband *sb,
    96				   struct usb_host_endpoint *host_ep)
    97	{
    98		struct xhci_virt_ep *ep;
    99		unsigned int ep_index;
   100	
   101		ep_index = xhci_get_endpoint_index(&host_ep->desc);
   102		ep = &sb->vdev->eps[ep_index];
   103	
   104		if (ep->ep_state & EP_HAS_STREAMS)
   105			return -EINVAL;
   106	
   107		/*
   108		 * Note, we don't know the DMA mask of the audio DSP device, if its
   109		 * smaller than for xhci it won't be able to access the endpoint ring
   110		 * buffer. This could be solved by not allowing the audio class driver
   111		 * to add the endpoint the normal way, but instead offload it immediately,
   112		 * and let this function add the endpoint and allocate the ring buffer
   113		 * with the smallest common DMA mask
   114		 */
   115	
   116		if (sb->eps[ep_index] || ep->sideband)
   117			return -EBUSY;
   118	
   119		ep->sideband = sb;
   120		sb->eps[ep_index] = ep;
   121	
   122		return 0;
   123	}
   124	
   125	/**
   126	 * xhci_sideband_remove_endpoint - remove endpoint from sideband access list
   127	 * @sb: sideband instance for this usb device
   128	 * @host_ep: usb host endpoint
   129	 *
   130	 * Removes an endpoint from the list of sideband accessed endpoints for this usb
   131	 * device.
   132	 * sideband client should no longer touch the endpoint transfer buffer after
   133	 * calling this.
   134	 *
   135	 * Return: 0 on success, negative error otherwise.
   136	 */
   137	int
   138	xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
   139				      struct usb_host_endpoint *host_ep)
   140	{
   141		struct xhci_virt_ep *ep;
   142		unsigned int ep_index;
   143	
   144		ep_index = xhci_get_endpoint_index(&host_ep->desc);
   145		ep = sb->eps[ep_index];
   146	
   147		if (!ep || !ep->sideband)
   148			return -ENODEV;
   149	
   150		/*
   151		 * FIXME, ring deq, enq and other info should be reset, flushed, zeroed,
   152		 * or synced
   153		 */
   154	
   155		__xhci_sideband_remove_endpoint(sb, ep);
   156		return 0;
   157	}
   158	
   159	int
   160	xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
   161				    struct usb_host_endpoint *host_ep)
   162	{
   163		struct xhci_virt_ep *ep;
   164		unsigned int ep_index;
   165	
   166		ep_index = xhci_get_endpoint_index(&host_ep->desc);
   167		ep = sb->eps[ep_index];
   168	
   169		if (!ep || ep->sideband != sb)
   170			return -EINVAL;
   171	
   172		return xhci_stop_endpoint_sync(sb->xhci, ep, 0);
   173	}
   174	
   175	/**
   176	 * xhci_sideband_endpoint_buffer - gets the endpoint transfer buffer address
   177	 * @sb: sideband instance for this usb device
   178	 * @host_ep: usb host endpoint
   179	 *
   180	 * Returns the address of the endpoint buffer where xHC controller reads queued
   181	 * transfer TRBs from. This is the starting address of the ringbuffer where the
   182	 * sidband cliend should write TRBs to.
   183	 *
   184	 * Caller needs to free the returned sg_table
   185	 *
   186	 * Return: struct sg_table * if successful. NULL otherwise.
   187	 */
   188	struct sg_table *
 > 189	xhci_sideband_endpoint_buffer(struct xhci_sideband *sb,
   190				      struct usb_host_endpoint *host_ep)
   191	{
   192		struct xhci_virt_ep *ep;
   193		unsigned int ep_index;
   194	
   195		ep_index = xhci_get_endpoint_index(&host_ep->desc);
   196		ep = sb->eps[ep_index];
   197	
   198		if (!ep)
   199			return NULL;
   200	
   201		return xhci_ring_to_sgtable(sb, ep->ring);
   202	}
   203	
   204	/**
   205	 * xhci_sideband_event_buffer - return the event buffer for this device
   206	 * @sb: sideband instance for this usb device
   207	 *
   208	 * If a secondary xhci interupter is set up for this usb device then this
   209	 * function returns the address of the event buffer where xHC writes
   210	 * the transfer completion events.
   211	 *
   212	 * Caller needs to free the returned sg_table
   213	 *
   214	 * Return: struct sg_table * if successful. NULL otherwise.
   215	 */
   216	struct sg_table *
 > 217	xhci_sideband_event_buffer(struct xhci_sideband *sb)
   218	{
   219		if (!sb->ir)
   220			return NULL;
   221	
   222		return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
