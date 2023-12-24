Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00B6D2F0;
	Sun, 24 Dec 2023 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgaUL3qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703445515; x=1734981515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDaHKaW6vmpep3N7TE1ZK/AZZZU0WR5heUzRguAgQzo=;
  b=ZgaUL3qhg6pO083I9miltm3ebzSD+AZuQwtgI5AwhAIUUAbKKaW97GG3
   hoe+AWBSJQxACOJaCZy2KR95FIBypEuN5GiTZS5muzIbcgL9hi43whUP0
   sBQLnFBgIuMNhQrPEmLkB/bLctdwCvDJN0md5epTUHLvYWxdvMpCKmx82
   YitJQ3CE4cUwTCjavbOkTorMbax1JJeBvKNEB9jtAhdAX/htBdO25z40z
   Js2PijB0YIOEobA6+F8yk1ZKcXRMn9I0j5++VhJuTfQim5M6UcqL7L0ej
   qLPeBh4xORcFQEgz8ZimYPLs8bNOc1IZG11YVzFJ5CObQrEj70YcbKFF4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="400072292"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="400072292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 11:18:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="19281280"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2023 11:18:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHTzY-000CYZ-0w;
	Sun, 24 Dec 2023 19:18:28 +0000
Date: Mon, 25 Dec 2023 03:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 47/48]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:709: warning: Excess function
 parameter 'adapter' description in 'idpf_check_alloc_rx_buffers_zc'
Message-ID: <202312250310.N6gsghdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   2ad48b3813615378a8dc05f601405904a3e11ad5
commit: a0df6ad991bdbcdaece769718ac90357330b3692 [47/48] idpf: implement Rx path for AF_XDP
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231225/202312250310.N6gsghdG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250310.N6gsghdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250310.N6gsghdG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Function parameter or member 't' not described in 'idpf_xsk_setup_queue'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:502: warning: Excess function parameter 'pool' description in 'idpf_xsk_pool_enable'
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:709: warning: Excess function parameter 'adapter' description in 'idpf_check_alloc_rx_buffers_zc'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:911: warning: Function parameter or member 'sq' not described in 'idpf_xsk_xmit_pkt'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:911: warning: expecting prototype for idpf_xmit_pkt(). Prototype was for idpf_xsk_xmit_pkt() instead


vim +709 drivers/net/ethernet/intel/idpf/idpf_xsk.c

   699	
   700	/**
   701	 * idpf_check_alloc_rx_buffers_zc - allocate a number of Rx buffers with logs
   702	 * @adapter: board private structure
   703	 * @rxbufq: buffer queue
   704	 *
   705	 * Wrapper for internal allocation routine; Prints out logs, if allocation
   706	 * did not go as expected
   707	 */
   708	int idpf_check_alloc_rx_buffers_zc(struct idpf_queue *rxbufq)
 > 709	{
   710		struct net_device *netdev = rxbufq->vport->netdev;
   711		struct xsk_buff_pool *pool = rxbufq->xsk_rx;
   712		u32 count = IDPF_DESC_UNUSED(rxbufq);
   713	
   714		rxbufq->xsk = kcalloc(rxbufq->desc_count, sizeof(*rxbufq->xsk),
   715				      GFP_KERNEL);
   716		if (!rxbufq->xsk)
   717			return -ENOMEM;
   718	
   719		if (!xsk_buff_can_alloc(pool, count)) {
   720			netdev_warn(netdev, "XSK buffer pool does not provide enough addresses to fill %d buffers on Rx queue %d\n",
   721				    count, rxbufq->idx);
   722			netdev_warn(netdev, "Change Rx queue/fill queue size to avoid performance issues\n");
   723		}
   724	
   725		if (!idpf_alloc_rx_buffers_zc(rxbufq, count))
   726			netdev_warn(netdev, "Failed to allocate some buffers on XSK buffer pool enabled Rx queue %d\n",
   727				    rxbufq->idx);
   728	
   729		rxbufq->rx_buf_size = xsk_pool_get_rx_frame_size(pool);
   730	
   731		return 0;
   732	}
   733	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
