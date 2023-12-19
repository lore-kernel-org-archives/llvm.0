Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB937D07;
	Tue, 19 Dec 2023 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyLDq8Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703005650; x=1734541650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7CCydjYpVFyCE1NmWRWu9KhqfwmO/JAH6rhqygekUeY=;
  b=hyLDq8XdkGB700CRHoM7J+LYHWFemiU3Ro91rdLMi3E2LUkxhKBrp3hk
   amdOFB+UbJFDoNY8bL8XQh+7Cz2+6WcQjHSvLZkifHbTBGCBCv/INdrPR
   0nX7WutNsSKQfWRGfcFb1RXGgkJEekNkJjL9D49/NFL/jdcL2uGbB5++l
   DL/bf0/bfRCC8VoCRYkrADkmVojRbVs8piBwlu/xF9VVr+RFKIzTDB3h8
   hnUIHbmDQuD5ZvafN07gxwLOu80p0iOTkKou+siIPeC1al2JdTw3k0cCS
   JY2rPF6RdY2Q+zjk6cWnc58zQ/bJfwQiWdrOBNk2BFOur6nvx+NlVCkms
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="462142440"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="462142440"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 09:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="752223097"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="752223097"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Dec 2023 09:07:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFdYh-0005iP-2u;
	Tue, 19 Dec 2023 17:07:07 +0000
Date: Wed, 20 Dec 2023 01:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 32/36]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:747: warning: Function parameter
 or member 'arg' not described in 'idpf_xdp_rxq_info_init'
Message-ID: <202312200100.eqIFXLJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   53bb970b70f1017bf36da5a9067d2e04617b4f49
commit: ded9bfd3402769c0e3ef15041f46b55ce22c590d [32/36] idpf: prepare structures to support xdp
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231220/202312200100.eqIFXLJr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312200100.eqIFXLJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200100.eqIFXLJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:747: warning: Function parameter or member 'arg' not described in 'idpf_xdp_rxq_info_init'
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:747: warning: Excess function parameter 'splitq' description in 'idpf_xdp_rxq_info_init'
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:777: warning: Function parameter or member 'arg' not described in 'idpf_xdp_rxq_info_deinit'


vim +747 drivers/net/ethernet/intel/idpf/idpf_txrx.c

   738	
   739	/**
   740	 * idpf_xdp_rxq_info_init - Setup XDP RxQ info for a given Rx queue
   741	 * @rxq: Rx queue for which the resources are setup
   742	 * @splitq: flag indicating if the HW works in split queue mode
   743	 *
   744	 * Return: 0 on success, negative on failure.
   745	 */
   746	static int idpf_xdp_rxq_info_init(struct idpf_queue *rxq, void *arg)
 > 747	{
   748		const struct idpf_vport *vport = rxq->vport;
   749		const struct page_pool *pp;
   750		struct xdp_mem_info *mem;
   751		int err;
   752	
   753		err = __xdp_rxq_info_reg(&rxq->xdp_rxq, vport->netdev, rxq->idx,
   754					 rxq->q_vector->napi.napi_id,
   755					 rxq->rx_buf_size);
   756		if (err)
   757			return err;
   758	
   759		pp = arg ? rxq->rxq_grp->splitq.bufq_sets[0].bufq.pp : rxq->pp;
   760	
   761		/* Memory model is already registered by libie, just copy the ID */
   762		mem = &rxq->xdp_rxq.mem;
   763		mem->type = MEM_TYPE_PAGE_POOL;
   764		mem->id = pp->xdp_mem_id;
   765	
   766		rxq->xdpqs = vport->txqs[vport->xdp_txq_offset];
   767		rxq->num_xdp_txq = vport->num_xdp_txq;
   768	
   769		return 0;
   770	}
   771	
   772	/**
   773	 * idpf_xdp_rxq_info_deinit - Deinit XDP RxQ info for a given Rx queue
   774	 * @rxq: Rx queue for which the resources are destroyed
   775	 */
   776	static int idpf_xdp_rxq_info_deinit(struct idpf_queue *rxq, void *arg)
 > 777	{
   778		rxq->xdpqs = NULL;
   779		rxq->num_xdp_txq = 0;
   780	
   781		/* Memory model is managed by libie */
   782		memset(&rxq->xdp_rxq, 0, sizeof(rxq->xdp_rxq));
   783	
   784		return 0;
   785	}
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
