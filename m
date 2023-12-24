Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD7CC8C4;
	Sun, 24 Dec 2023 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXPgtLn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703438431; x=1734974431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7GTl5UOjD76A7rE64TOiq/zCew96+KC2a0udaah6Kc=;
  b=WXPgtLn65p6mGFxaQmDZR9tSp9lnD6CU53YtXOFg5AmNKeMy9cTw5Uke
   hIz3zM+tuOd3aBQzld2oIGFirQ1TZPwJ7m8H+1jcHTCIQojzhr4XxnyR5
   KFkYas8Ff8bVkZTA2+ZdOtXF4r9Bu56RgrH8Cai5NVtweXV3g7DfOCv75
   KI0mVvDTJ22g4ZazCfDgYo0CzMS+NDCwvgxSHZH9bQCYBXm1QDw+sEbkT
   pz0esENsR4BIoBvYbmTz5cxYrUgLH3db4WKZOwKOky/R0FoiNe7SCBHd+
   priY8+1zNkmPkxmj9RwNIn9/toK0WOlHKiuBmFsGHZpN8WnTiZUUER6tt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="462677123"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="462677123"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 09:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="777561852"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="777561852"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Dec 2023 09:20:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHS8j-000CS7-1m;
	Sun, 24 Dec 2023 17:20:09 +0000
Date: Mon, 25 Dec 2023 01:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 46/48]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Function parameter
 or member 't' not described in 'idpf_xsk_setup_queue'
Message-ID: <202312250104.SOH220SS-lkp@intel.com>
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
commit: 7c386a212c9515a25b6b568d5c09a3d449cfc24f [46/48] idpf: implement Tx path for AF_XDP
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231225/202312250104.SOH220SS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250104.SOH220SS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250104.SOH220SS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Function parameter or member 't' not described in 'idpf_xsk_setup_queue'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:502: warning: Excess function parameter 'pool' description in 'idpf_xsk_pool_enable'
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:722: warning: Function parameter or member 'sq' not described in 'idpf_xsk_xmit_pkt'
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:722: warning: expecting prototype for idpf_xmit_pkt(). Prototype was for idpf_xsk_xmit_pkt() instead


vim +17 drivers/net/ethernet/intel/idpf/idpf_xsk.c

     8	
     9	/**
    10	 * idpf_xsk_setup_queue - set xsk_pool pointer from netdev to the queue structure
    11	 * @q: queue to use
    12	 *
    13	 * Assigns pointer to xsk_pool field in queue struct if it is supported in
    14	 * netdev, NULL otherwise.
    15	 */
    16	void idpf_xsk_setup_queue(struct idpf_queue *q, enum virtchnl2_queue_type t)
  > 17	{
    18		struct idpf_vport_user_config_data *cfg_data;
    19		struct idpf_vport *vport = q->vport;
    20		struct xsk_buff_pool *pool;
    21		bool is_rx = false;
    22		int qid;
    23	
    24		__clear_bit(__IDPF_Q_XSK, q->flags);
    25	
    26		if (!idpf_xdp_is_prog_ena(q->vport))
    27			return;
    28	
    29		switch (t) {
    30		case VIRTCHNL2_QUEUE_TYPE_RX:
    31			is_rx = true;
    32			qid = q->idx;
    33			break;
    34		case VIRTCHNL2_QUEUE_TYPE_RX_BUFFER:
    35			is_rx = true;
    36			qid = q->rxq_grp->splitq.rxq_sets[0]->rxq.idx;
    37			break;
    38		case VIRTCHNL2_QUEUE_TYPE_TX:
    39			qid = q->idx - q->vport->xdp_txq_offset;
    40			break;
    41		case VIRTCHNL2_QUEUE_TYPE_TX_COMPLETION:
    42			qid = q->txq_grp->txqs[0]->idx - q->vport->xdp_txq_offset;
    43			break;
    44		default:
    45			return;
    46		}
    47	
    48		if (!is_rx && !test_bit(__IDPF_Q_XDP, q->flags))
    49			return;
    50	
    51		cfg_data = &vport->adapter->vport_config[vport->idx]->user_config;
    52	
    53		if (!test_bit(qid, cfg_data->af_xdp_zc_qps))
    54			return;
    55	
    56		pool = xsk_get_pool_from_qid(q->vport->netdev, qid);
    57	
    58		if (pool && is_rx && !xsk_buff_can_alloc(pool, 1))
    59			return;
    60	
    61		if (is_rx)
    62			q->xsk_rx = pool;
    63		else
    64			q->xsk_tx = pool;
    65	
    66		__set_bit(__IDPF_Q_XSK, q->flags);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
