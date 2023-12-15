Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8B53BA;
	Fri, 15 Dec 2023 04:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmV/4MtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702615968; x=1734151968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1sK5A9juIqh9wbDZfAu6XfLHOfjggmzG4OCju+NBy0=;
  b=mmV/4MtBpPv6825tYNT1uR1RkbSSnpnG8ZDG7p6kkpnXmRajDizPiTqP
   Z+YrGeg0Oo2ptfWOlYhHyjCKyq12NxSnvkNk/seo+OkZuo+NhCfw9aVhW
   UrjbN4ncYWLFGdWAgiPy8ChjI1RKesV0Iq6imz6q3dUEgt3kyj31POlyZ
   9rizBMUma6scwtEXSMvk8Wm22NMwEQqNJTI8UxeOAyu/SsZvzuo9p/GEt
   1pVWAVw/7+QiC0ro2rsLR82HobBpsUDIjcj9OczTaFs7vOsOQGy9m96Vv
   2P7cDfbyk8OYYZOCLDE9k0NIhMathqu4WVwUmkLIsDtau0nBWc1GI0cG5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461693256"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="461693256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 20:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="774632490"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="774632490"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2023 20:52:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE0Bo-000N6c-0l;
	Fri, 15 Dec 2023 04:52:44 +0000
Date: Fri, 15 Dec 2023 12:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 35/35]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:3213: warning: Function
 parameter or member 'dma' not described in 'idpf_xdp_tx_xmit'
Message-ID: <202312151246.oVbOrEQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   3bd358daafd19b00cfd2caa30d72f6ae1bb1b611
commit: 3bd358daafd19b00cfd2caa30d72f6ae1bb1b611 [35/35] idpf: add support for XDP_PASS, XDP_DROP, XDP_TX, XDP_REDIRECT
config: arm-randconfig-002-20231215 (https://download.01.org/0day-ci/archive/20231215/202312151246.oVbOrEQm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151246.oVbOrEQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151246.oVbOrEQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3213: warning: Function parameter or member 'dma' not described in 'idpf_xdp_tx_xmit'
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3213: warning: Function parameter or member 'len' not described in 'idpf_xdp_tx_xmit'
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3213: warning: Function parameter or member 'sq' not described in 'idpf_xdp_tx_xmit'
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3213: warning: expecting prototype for idpf_xmit_xdp_buff(). Prototype was for idpf_xdp_tx_xmit() instead


vim +3213 drivers/net/ethernet/intel/idpf/idpf_txrx.c

  3202	
  3203	/**
  3204	 * idpf_xmit_xdp_buff - submit single buffer to XDP queue for transmission
  3205	 * @xdp: XDP buffer pointer
  3206	 * @xdpq: XDP queue for transmission
  3207	 * @map: whether to map the buffer
  3208	 *
  3209	 * Returns negative on failure, 0 on success.
  3210	 */
  3211	static void idpf_xdp_tx_xmit(dma_addr_t dma, u32 len,
  3212				     const struct libie_tx_queue *sq)
> 3213	{
  3214		union idpf_tx_flex_desc *tx_desc = sq->desc_ring;
  3215		struct idpf_tx_splitq_params tx_params = {
  3216			.dtype		= IDPF_TX_DESC_DTYPE_FLEX_L2TAG1_L2TAG2,
  3217			.eop_cmd	= IDPF_TX_DESC_CMD_EOP,
  3218		};
  3219	
  3220		tx_desc = &tx_desc[sq->next_to_use];
  3221		tx_desc->q.buf_addr = cpu_to_le64(dma);
  3222	
  3223		idpf_tx_splitq_build_desc(tx_desc, &tx_params,
  3224					  tx_params.eop_cmd | tx_params.offload.td_cmd,
  3225					  len);
  3226	}
  3227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
