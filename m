Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31613AF9;
	Sat,  9 Dec 2023 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/+PEgLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702137284; x=1733673284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfJwR/SGMCYUAuPEGJ0/Oym4fLVR3iKuAFetXDvWIs4=;
  b=S/+PEgLpfxKRS+4pzGfjotZuq9HNIleVPCFcpBAQMaPWsgd9FpQlZ8Eb
   XI/8bXmdICmji8x3dK5BF4pfSKa2xRZJjsbjpSPwEaQxs+TXdTsaiX09c
   243bmbZjv2buHjLZcBa7APFOX0eHJOYNM6HJ6DfuWJryqvjFZsA/wEPK/
   ycMGywsP1K9H4dCl38Z48UcAf1+bbNAb2M1WcN3dTmhu0NACScvR3PdX1
   0WnVyBz9mU6qDaLLDDueZz4WppF4tv0MTk5HMQXNMxZ64niVjzkHVqiyC
   YbA1R2qx3G755fifrXo/pPtugjrKMujjhpgyduJq/C0c5Bxf8JCCjx2kH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="397308999"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="397308999"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 07:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1019676505"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1019676505"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2023 07:54:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBzf6-000FXt-0D;
	Sat, 09 Dec 2023 15:54:40 +0000
Date: Sat, 9 Dec 2023 23:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 26/27]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:755: warning: expecting
 prototype for idpf_xdp_rxq_info_init(). Prototype was for
 idpf_xdp_rxq_info_deinit() instead
Message-ID: <202312092341.4WEhvmIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   30de646961d910ded1d31d2d98c021ea839255b4
commit: 545feeffdc3f0d66797108318ab732cc4927ffe2 [26/27] idpf: prepare structures to support xdp
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231209/202312092341.4WEhvmIw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092341.4WEhvmIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092341.4WEhvmIw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:755: warning: expecting prototype for idpf_xdp_rxq_info_init(). Prototype was for idpf_xdp_rxq_info_deinit() instead


vim +755 drivers/net/ethernet/intel/idpf/idpf_txrx.c

   749	
   750	/**
   751	 * idpf_xdp_rxq_info_init - Deinit XDP RxQ info for a given Rx queue
   752	 * @rxq: Rx queue for which the resources are destroyed
   753	 */
   754	static void idpf_xdp_rxq_info_deinit(struct idpf_queue *rxq)
 > 755	{
   756		/* Memory model is managed by libie */
   757		memset(&rxq->xdp_rxq, 0, sizeof(rxq->xdp_rxq));
   758	}
   759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
