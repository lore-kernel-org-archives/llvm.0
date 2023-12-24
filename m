Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E0B2592;
	Sun, 24 Dec 2023 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/k5GwG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703421634; x=1734957634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7V19JLwyz+zT3d0ooDxLLioV1M+ypblmXNtEMDPivIA=;
  b=j/k5GwG7qQxGPAoAyUi6tWt25IM4HA83GFpOca2+D4qZO4patS8vuGDd
   AbIZdg10BybqpVD2LddpiZ4gPcYMat+r9tWqd5HodQ48Sj9usDqtTV6X7
   9bqbI0nyQpZ/sAOtG0EZYfY1O5LCH2E18wdzzPTs8ZeENaHWa1m6xu1x+
   yv8ugmgXTGg5c8HgyoBLoQts83hs4ViTSs8xmkw0g5VpCgZ9/slcoLcws
   Yhy22uToaOTaLU2GJyoffY422bL9jYO+WavAE5Pmi3lS1uH5CJ7dtoyNg
   ptAefSeS+UyRV3jZ1c94BVwAnPKaRwEfg11VTdgCnGpfhChyEo14PiLzK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="482412923"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="482412923"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 04:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="900973289"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="900973289"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Dec 2023 04:40:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHNmN-000CG3-2r;
	Sun, 24 Dec 2023 12:40:28 +0000
Date: Sun, 24 Dec 2023 20:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 35/48]
 drivers/net/ethernet/intel/idpf/idpf_xdp.c:48: warning: Function parameter
 or member 'arg' not described in 'idpf_xdp_rxq_info_init'
Message-ID: <202312242053.kJQRjSQS-lkp@intel.com>
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
commit: df0d24ed69efc96b8884224c87d7d4c5950b5e11 [35/48] idpf: prepare structures to support xdp
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231224/202312242053.kJQRjSQS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312242053.kJQRjSQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312242053.kJQRjSQS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:48: warning: Function parameter or member 'arg' not described in 'idpf_xdp_rxq_info_init'
>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:48: warning: Excess function parameter 'splitq' description in 'idpf_xdp_rxq_info_init'
>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:88: warning: Function parameter or member 'arg' not described in 'idpf_xdp_rxq_info_deinit'


vim +48 drivers/net/ethernet/intel/idpf/idpf_xdp.c

    39	
    40	/**
    41	 * idpf_xdp_rxq_info_init - Setup XDP RxQ info for a given Rx queue
    42	 * @rxq: Rx queue for which the resources are setup
    43	 * @splitq: flag indicating if the HW works in split queue mode
    44	 *
    45	 * Return: 0 on success, negative on failure.
    46	 */
    47	static int idpf_xdp_rxq_info_init(struct idpf_queue *rxq, void *arg)
  > 48	{
    49		const struct idpf_vport *vport = rxq->vport;
    50		const struct page_pool *pp;
    51		int err;
    52	
    53		err = __xdp_rxq_info_reg(&rxq->xdp_rxq, vport->netdev, rxq->idx,
    54					 rxq->q_vector->napi.napi_id,
    55					 rxq->rx_buf_size);
    56		if (err)
    57			return err;
    58	
    59		pp = arg ? rxq->rxq_grp->splitq.bufq_sets[0].bufq.pp : rxq->pp;
    60		xdp_rxq_info_attach_page_pool(&rxq->xdp_rxq, pp);
    61	
    62		rxq->xdpqs = &vport->txqs[vport->xdp_txq_offset];
    63		rxq->num_xdp_txq = vport->num_xdp_txq;
    64	
    65		return 0;
    66	}
    67	
    68	/**
    69	 * idpf_xdp_rxq_info_init_all - initialize RxQ info for all Rx queues in vport
    70	 * @vport: vport to setup the info
    71	 *
    72	 * Return: 0 on success, negative on failure.
    73	 */
    74	int idpf_xdp_rxq_info_init_all(const struct idpf_vport *vport)
    75	{
    76		void *arg;
    77	
    78		arg = (void *)(size_t)idpf_is_queue_model_split(vport->rxq_model);
    79	
    80		return idpf_rxq_for_each(vport, idpf_xdp_rxq_info_init, arg);
    81	}
    82	
    83	/**
    84	 * idpf_xdp_rxq_info_deinit - Deinit XDP RxQ info for a given Rx queue
    85	 * @rxq: Rx queue for which the resources are destroyed
    86	 */
    87	static int idpf_xdp_rxq_info_deinit(struct idpf_queue *rxq, void *arg)
  > 88	{
    89		rxq->xdpqs = NULL;
    90		rxq->num_xdp_txq = 0;
    91	
    92		xdp_rxq_info_detach_mem_model(&rxq->xdp_rxq);
    93		xdp_rxq_info_unreg(&rxq->xdp_rxq);
    94	
    95		return 0;
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
