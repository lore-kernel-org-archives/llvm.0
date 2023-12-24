Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B15663;
	Sun, 24 Dec 2023 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2KC4nj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703429703; x=1734965703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8upH4h+ydesTW9EE2ichDjlWcgSj5zQ0VTbr0Pf4Bms=;
  b=D2KC4nj8/dTBTyr0tVuvn/kLNPSVZciZkHIQy2vNpCjBVs/UyXRlyLd8
   g1cACGn1qEvrIGylNlQoXw9Mb/sg9CdBuL7uOFcTn67S4jz9RbYwqEGga
   shTr4yi5QDXW/XwYdAHhw5rFO/8gD0A9ND2TbrYvqD/ABmMvUaUnydf4A
   7wsFtMtU5bb/4QuMnjtrG+jR6t6JERNGS6/fQpsj7QYXTo4HdA6lNhiHa
   k/FwtCYGB7+axpWw+ENVeHPX45Ng80S9r3GMPY0Fgy19/gbjfU4EB9pea
   iJkENFyvtuLsUkZmTz7NTKskAPV1/n90yHzirRSB/SRL/CMHN5n/nO4Bj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="482417353"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="482417353"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 06:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="806475966"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="806475966"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Dec 2023 06:55:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHPsC-000CM5-1E;
	Sun, 24 Dec 2023 14:54:39 +0000
Date: Sun, 24 Dec 2023 22:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 45/48]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:402: warning: Excess function
 parameter 'pool' description in 'idpf_xsk_pool_enable'
Message-ID: <202312242233.onWAiHR3-lkp@intel.com>
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
commit: 434c89dbb5af328460429a9f731c91b7d6830ef7 [45/48] idpf: add XSk pool initialization
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231224/202312242233.onWAiHR3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312242233.onWAiHR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312242233.onWAiHR3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:402: warning: Excess function parameter 'pool' description in 'idpf_xsk_pool_enable'


vim +402 drivers/net/ethernet/intel/idpf/idpf_xsk.c

   373	
   374	/**
   375	 * idpf_xsk_pool_disable - disables a BUFF POOL region
   376	 * @vport: vport to allocate the buffer pool on
   377	 * @qid: queue id
   378	 *
   379	 * Returns 0 on success, negative on error
   380	 */
   381	static int idpf_xsk_pool_disable(struct idpf_vport *vport, u16 qid)
   382	{
   383		struct idpf_vport_user_config_data *cfg_data;
   384	
   385		if (!vport->rxq_grps)
   386			return -EINVAL;
   387	
   388		cfg_data = &vport->adapter->vport_config[vport->idx]->user_config;
   389	
   390		return libie_xsk_disable_pool(vport->netdev, qid,
   391					      cfg_data->af_xdp_zc_qps);
   392	}
   393	/**
   394	 * idpf_xsk_pool_enable - enables a BUFF POOL region
   395	 * @vport: vport to allocate the buffer pool on
   396	 * @pool: pointer to a requested BUFF POOL region
   397	 * @qid: queue id
   398	 *
   399	 * Returns 0 on success, negative on error
   400	 */
   401	static int idpf_xsk_pool_enable(struct idpf_vport *vport, u16 qid)
 > 402	{
   403		struct idpf_vport_user_config_data *cfg_data;
   404	
   405		cfg_data = &vport->adapter->vport_config[vport->idx]->user_config;
   406	
   407		return libie_xsk_enable_pool(vport->netdev, qid,
   408					     cfg_data->af_xdp_zc_qps);
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
