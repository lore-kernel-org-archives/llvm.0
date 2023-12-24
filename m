Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD723AA;
	Sun, 24 Dec 2023 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbu3eb9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703411177; x=1734947177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DCQYUDmOsWEf8MjW97RAd60Vzrz+A4Ss90v1zABU24g=;
  b=mbu3eb9GEZsUTcwuejQIuh6HMubGtlp1LRk3ULVjrvE25UTC6LzqdY/r
   hGNCa4ML+0HCSIxkzC+xp5D/zQu20XtuMngElhw8x4QQ5UsaNApAGM/Dd
   O/A9H3YoYfjPBD89FZvcIKiaSwsDk8lUxOmdrhzKQehyqd3G3ao0IDkZ3
   rbhK2A76rUAslEeIwVjeFlBqFXHKbl/KIHABYlL+2vbeDQMH4DaEEjJEx
   74REHWXN77ISx5VIeB5grrWViIu1fOplKKrvOqrg/Vo4RiaHtcM3v6gwN
   rdQWsQSr8kkGFO17A5faLwGBIwZlrxq5c4UsY+HbWHUJEXZ6pL2Q0n/3X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="9623548"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="9623548"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 01:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="843428343"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="843428343"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Dec 2023 01:46:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHL3X-000C6N-0k;
	Sun, 24 Dec 2023 09:46:05 +0000
Date: Sun, 24 Dec 2023 17:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Diogo Ivo <diogo.ivo@siemens.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 5/8] net: ti: icssg-config: Add SR1.0
 configuration functions
Message-ID: <202312241720.x9O6KZST-lkp@intel.com>
References: <20231219174548.3481-6-diogo.ivo@siemens.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219174548.3481-6-diogo.ivo@siemens.com>

Hi Diogo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Diogo-Ivo/dt-bindings-net-Add-support-for-AM65x-SR1-0-in-ICSSG/20231220-015112
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231219174548.3481-6-diogo.ivo%40siemens.com
patch subject: [RFC PATCH net-next 5/8] net: ti: icssg-config: Add SR1.0 configuration functions
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231224/202312241720.x9O6KZST-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241720.x9O6KZST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241720.x9O6KZST-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssg/icssg_config.c:255:6: warning: no previous prototype for function 'icssg_config_sr1' [-Wmissing-prototypes]
     255 | void icssg_config_sr1(struct prueth *prueth, struct prueth_emac *emac,
         |      ^
   drivers/net/ethernet/ti/icssg/icssg_config.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | void icssg_config_sr1(struct prueth *prueth, struct prueth_emac *emac,
         | ^
         | static 
   1 warning generated.


vim +/icssg_config_sr1 +255 drivers/net/ethernet/ti/icssg/icssg_config.c

   231	
   232	/* SR1: Set buffer sizes for the pools. There are 8 internal queues
   233	 * implemented in firmware, but only 4 tx channels/threads in the Egress
   234	 * direction to firmware. Need a high priority queue for management
   235	 * messages since they shouldn't be blocked even during high traffic
   236	 * situation. So use Q0-Q2 as data queues and Q3 as management queue
   237	 * in the max case. However for ease of configuration, use the max
   238	 * data queue + 1 for management message if we are not using max
   239	 * case.
   240	 *
   241	 * Allocate 4 MTU buffers per data queue.  Firmware requires
   242	 * pool sizes to be set for internal queues. Set the upper 5 queue
   243	 * pool size to min size of 128 bytes since there are only 3 tx
   244	 * data channels and management queue requires only minimum buffer.
   245	 * i.e lower queues are used by driver and highest priority queue
   246	 * from that is used for management message.
   247	 */
   248	
   249	static int emac_egress_buf_pool_size[] = {
   250		PRUETH_EMAC_BUF_POOL_SIZE_SR1, PRUETH_EMAC_BUF_POOL_SIZE_SR1,
   251		PRUETH_EMAC_BUF_POOL_SIZE_SR1, PRUETH_EMAC_BUF_POOL_MIN_SIZE_SR1,
   252		PRUETH_EMAC_BUF_POOL_MIN_SIZE_SR1, PRUETH_EMAC_BUF_POOL_MIN_SIZE_SR1,
   253		PRUETH_EMAC_BUF_POOL_MIN_SIZE_SR1, PRUETH_EMAC_BUF_POOL_MIN_SIZE_SR1};
   254	
 > 255	void icssg_config_sr1(struct prueth *prueth, struct prueth_emac *emac,
   256			      int slice)
   257	{
   258		struct icssg_config_sr1 *config;
   259		void __iomem *va;
   260		int i, index;
   261	
   262		va = prueth->shram.va + slice * ICSSG_CONFIG_OFFSET_SLICE1;
   263		config = &prueth->config[slice];
   264		memset(config, 0, sizeof(*config));
   265		config->addr_lo = cpu_to_le32(lower_32_bits(prueth->msmcram.pa));
   266		config->addr_hi = cpu_to_le32(upper_32_bits(prueth->msmcram.pa));
   267		config->num_tx_threads = 0;
   268		config->rx_flow_id = emac->rx_flow_id_base; /* flow id for host port */
   269		config->rx_mgr_flow_id = emac->rx_mgm_flow_id_base; /* for mgm ch */
   270		config->rand_seed = get_random_u32();
   271	
   272		for (i = PRUETH_EMAC_BUF_POOL_START_SR1; i < PRUETH_NUM_BUF_POOLS_SR1; i++) {
   273			index =  i - PRUETH_EMAC_BUF_POOL_START_SR1;
   274			config->tx_buf_sz[i] = cpu_to_le32(emac_egress_buf_pool_size[index]);
   275		}
   276	
   277		memcpy_toio(va, &prueth->config[slice], sizeof(prueth->config[slice]));
   278	
   279		emac->speed = SPEED_1000;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
