Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3617260F;
	Thu, 16 Oct 2025 02:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580022; cv=none; b=MiC/+0Swo2VjetzcMHm3PlzHtXBef6NVrfXHvX8xZpyuUmXXPrBPvaIAOFdsgd3qZCwSGu121WZ2SUKDqNIfn1YOlwjSAWpSpkkkhdyXdhFKL16Ktlp4TajKRQdNZMn4QIXGZjjKG1SU5+F1mrQew9kD3CW2F598k011TS0EogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580022; c=relaxed/simple;
	bh=jO3JswL0csmVDCQPNgfXnDR6XJ8PZL/mFSD4Ro97stU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHrji3gyOlzGaa+10N4EWMylOSXNb69Dy3xFaNofepulLjIL+AKBqKUoMQsZdPYPbB00CgPS0GE2f9lsvSkHHRgpuT8ps9FkyADs3qK29yFsyLCHebfUWx4iexTcMl4RjDm+0lc28/Nx98kTHbsPhu+InqZNdE+j/X4yuaPrX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgFs9A5O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgFs9A5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760580020; x=1792116020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jO3JswL0csmVDCQPNgfXnDR6XJ8PZL/mFSD4Ro97stU=;
  b=hgFs9A5OupxbTd22fAgWyVu0GS1rTZ71ecuhxvnJ+eWXUivS4+YguUfN
   z0/iMz324KnyRHKUnoyRz5RRTvqssJCb8H8dMDld+ifkNQLQ6LJtL6cH3
   k2oRiNzDGlx1rcVxJrCs6VxdkPj1wI2PQcZYIxYa34gErvBHfiubWsimy
   olMHmuIzBrTPVUvE/MfJp7H6MjrPWhOA0xSGayw8py5MvS8gIpm+keoCm
   QsGHA4DiPSe9xpIFImMKWXAZG2JDmb1rS7Ql5heK94agNbV9pMtjD5D6K
   9JjvgkpJ2+LxBnMb2BFkOAyBbPGFxv4hXkQfojWd0qZtSWya8K3UZuQhe
   Q==;
X-CSE-ConnectionGUID: We6PPm0eTlqi1P6NFXkJCQ==
X-CSE-MsgGUID: zDopXcJhRayWxYHfo2bApQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73875683"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="73875683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 19:00:20 -0700
X-CSE-ConnectionGUID: 3LD9q7DWRl2ypKw5n2Wngg==
X-CSE-MsgGUID: zHWhHVMeQHu/ZjKfsg5CQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="212929217"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2025 19:00:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9DHG-0004NT-1O;
	Thu, 16 Oct 2025 01:59:43 +0000
Date: Thu, 16 Oct 2025 09:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Kirsher <jeff.kirsher@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [jkirsher-net-queue:master 2/4]
 drivers/net/ethernet/ti/icssg/icssg_prueth.c:814:3: error: call to
 undeclared function 'emac_adjust_link'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510160937.sIdot6dn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   c9a8544415241209a476e56cc98a09ab074e29a8
commit: a0b07da0d5c468fbcbfcb2a394cf89b9bb12feee [2/4] net: ti: icssg-prueth: Fix signedness bug in prueth_init_rx_chns()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251016/202510160937.sIdot6dn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160937.sIdot6dn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160937.sIdot6dn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssg/icssg_prueth.c:55:13: error: static declaration of 'prueth_cleanup_rx_chns' follows non-static declaration
      55 | static void prueth_cleanup_rx_chns(struct prueth_emac *emac,
         |             ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:449:6: note: previous declaration is here
     449 | void prueth_cleanup_rx_chns(struct prueth_emac *emac,
         |      ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:66:13: error: static declaration of 'prueth_cleanup_tx_chns' follows non-static declaration
      66 | static void prueth_cleanup_tx_chns(struct prueth_emac *emac)
         |             ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:452:6: note: previous declaration is here
     452 | void prueth_cleanup_tx_chns(struct prueth_emac *emac);
         |      ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:86:13: error: static declaration of 'prueth_ndev_del_tx_napi' follows non-static declaration
      86 | static void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
         |             ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:453:6: note: previous declaration is here
     453 | void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num);
         |      ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:99:13: error: static declaration of 'prueth_xmit_free' follows non-static declaration
      99 | static void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
         |             ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:454:6: note: previous declaration is here
     454 | void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
         |      ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:135:12: error: static declaration of 'emac_tx_complete_packets' follows non-static declaration
     135 | static int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |            ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:456:5: note: previous declaration is here
     456 | int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |     ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:204:68: error: too few arguments to function call, expected 4, have 3
     204 |         num_tx_packets = emac_tx_complete_packets(emac, tx_chn->id, budget);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~                         ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:456:5: note: 'emac_tx_complete_packets' declared here
     456 | int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     457 |                              int budget, bool *tdown);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:225:12: error: static declaration of 'prueth_ndev_add_tx_napi' follows non-static declaration
     225 | static int prueth_ndev_add_tx_napi(struct prueth_emac *emac)
         |            ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:458:5: note: previous declaration is here
     458 | int prueth_ndev_add_tx_napi(struct prueth_emac *emac);
         |     ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:251:12: error: static declaration of 'prueth_init_tx_chns' follows non-static declaration
     251 | static int prueth_init_tx_chns(struct prueth_emac *emac)
         |            ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:459:5: note: previous declaration is here
     459 | int prueth_init_tx_chns(struct prueth_emac *emac);
         |     ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:331:12: error: static declaration of 'prueth_init_rx_chns' follows non-static declaration
     331 | static int prueth_init_rx_chns(struct prueth_emac *emac,
         |            ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:460:5: note: previous declaration is here
     460 | int prueth_init_rx_chns(struct prueth_emac *emac,
         |     ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:472:12: error: static declaration of 'icssg_ts_to_ns' follows non-static declaration
     472 | static u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns)
         |            ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:495:5: note: previous declaration is here
     495 | u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns);
         |     ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:487:13: error: static declaration of 'emac_rx_timestamp' follows non-static declaration
     487 | static void emac_rx_timestamp(struct prueth_emac *emac,
         |             ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:468:6: note: previous declaration is here
     468 | void emac_rx_timestamp(struct prueth_emac *emac,
         |      ^
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:814:3: error: call to undeclared function 'emac_adjust_link'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     814 |                 emac_adjust_link(emac->ndev);
         |                 ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:863:13: error: static declaration of 'emac_adjust_link' follows non-static declaration
     863 | static void emac_adjust_link(struct net_device *ndev)
         |             ^
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:814:3: note: previous implicit declaration is here
     814 |                 emac_adjust_link(emac->ndev);
         |                 ^
   13 errors generated.


vim +/emac_adjust_link +814 drivers/net/ethernet/ti/icssg/icssg_prueth.c

01792bc3e5bdaf MD Danish Anwar 2025-08-14  783  
9facce84f4062f MD Danish Anwar 2024-12-23  784  static int prueth_emac_common_start(struct prueth *prueth)
9facce84f4062f MD Danish Anwar 2024-12-23  785  {
9facce84f4062f MD Danish Anwar 2024-12-23  786  	struct prueth_emac *emac;
9facce84f4062f MD Danish Anwar 2024-12-23  787  	int ret = 0;
9facce84f4062f MD Danish Anwar 2024-12-23  788  	int slice;
9facce84f4062f MD Danish Anwar 2024-12-23  789  
9facce84f4062f MD Danish Anwar 2024-12-23  790  	if (!prueth->emac[ICSS_SLICE0] && !prueth->emac[ICSS_SLICE1])
9facce84f4062f MD Danish Anwar 2024-12-23  791  		return -EINVAL;
9facce84f4062f MD Danish Anwar 2024-12-23  792  
9facce84f4062f MD Danish Anwar 2024-12-23  793  	/* clear SMEM and MSMC settings for all slices */
9facce84f4062f MD Danish Anwar 2024-12-23  794  	memset_io(prueth->msmcram.va, 0, prueth->msmcram.size);
9facce84f4062f MD Danish Anwar 2024-12-23  795  	memset_io(prueth->shram.va, 0, ICSSG_CONFIG_OFFSET_SLICE1 * PRUETH_NUM_MACS);
9facce84f4062f MD Danish Anwar 2024-12-23  796  
9facce84f4062f MD Danish Anwar 2024-12-23  797  	icssg_class_default(prueth->miig_rt, ICSS_SLICE0, 0, false);
9facce84f4062f MD Danish Anwar 2024-12-23  798  	icssg_class_default(prueth->miig_rt, ICSS_SLICE1, 0, false);
9facce84f4062f MD Danish Anwar 2024-12-23  799  
9facce84f4062f MD Danish Anwar 2024-12-23  800  	if (prueth->is_switch_mode || prueth->is_hsr_offload_mode)
9facce84f4062f MD Danish Anwar 2024-12-23  801  		icssg_init_fw_offload_mode(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  802  	else
9facce84f4062f MD Danish Anwar 2024-12-23  803  		icssg_init_emac_mode(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  804  
9facce84f4062f MD Danish Anwar 2024-12-23  805  	for (slice = 0; slice < PRUETH_NUM_MACS; slice++) {
9facce84f4062f MD Danish Anwar 2024-12-23  806  		emac = prueth->emac[slice];
9facce84f4062f MD Danish Anwar 2024-12-23  807  		if (!emac)
9facce84f4062f MD Danish Anwar 2024-12-23  808  			continue;
9facce84f4062f MD Danish Anwar 2024-12-23  809  		ret = icssg_config(prueth, emac, slice);
9facce84f4062f MD Danish Anwar 2024-12-23  810  		if (ret)
9facce84f4062f MD Danish Anwar 2024-12-23  811  			goto disable_class;
06feac15406f4f MD Danish Anwar 2025-08-05  812  
06feac15406f4f MD Danish Anwar 2025-08-05  813  		mutex_lock(&emac->ndev->phydev->lock);
06feac15406f4f MD Danish Anwar 2025-08-05 @814  		emac_adjust_link(emac->ndev);
06feac15406f4f MD Danish Anwar 2025-08-05  815  		mutex_unlock(&emac->ndev->phydev->lock);
9facce84f4062f MD Danish Anwar 2024-12-23  816  	}
9facce84f4062f MD Danish Anwar 2024-12-23  817  
9facce84f4062f MD Danish Anwar 2024-12-23  818  	ret = prueth_emac_start(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  819  	if (ret)
9facce84f4062f MD Danish Anwar 2024-12-23  820  		goto disable_class;
9facce84f4062f MD Danish Anwar 2024-12-23  821  
9facce84f4062f MD Danish Anwar 2024-12-23  822  	emac = prueth->emac[ICSS_SLICE0] ? prueth->emac[ICSS_SLICE0] :
9facce84f4062f MD Danish Anwar 2024-12-23  823  	       prueth->emac[ICSS_SLICE1];
9facce84f4062f MD Danish Anwar 2024-12-23  824  	ret = icss_iep_init(emac->iep, &prueth_iep_clockops,
9facce84f4062f MD Danish Anwar 2024-12-23  825  			    emac, IEP_DEFAULT_CYCLE_TIME_NS);
9facce84f4062f MD Danish Anwar 2024-12-23  826  	if (ret) {
9facce84f4062f MD Danish Anwar 2024-12-23  827  		dev_err(prueth->dev, "Failed to initialize IEP module\n");
9facce84f4062f MD Danish Anwar 2024-12-23  828  		goto stop_pruss;
9facce84f4062f MD Danish Anwar 2024-12-23  829  	}
9facce84f4062f MD Danish Anwar 2024-12-23  830  
9facce84f4062f MD Danish Anwar 2024-12-23  831  	return 0;
9facce84f4062f MD Danish Anwar 2024-12-23  832  
9facce84f4062f MD Danish Anwar 2024-12-23  833  stop_pruss:
9facce84f4062f MD Danish Anwar 2024-12-23  834  	prueth_emac_stop(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  835  
9facce84f4062f MD Danish Anwar 2024-12-23  836  disable_class:
9facce84f4062f MD Danish Anwar 2024-12-23  837  	icssg_class_disable(prueth->miig_rt, ICSS_SLICE0);
9facce84f4062f MD Danish Anwar 2024-12-23  838  	icssg_class_disable(prueth->miig_rt, ICSS_SLICE1);
128d5874c08221 Roger Quadros   2023-08-01  839  
128d5874c08221 Roger Quadros   2023-08-01  840  	return ret;
128d5874c08221 Roger Quadros   2023-08-01  841  }
128d5874c08221 Roger Quadros   2023-08-01  842  

:::::: The code at line 814 was first introduced by commit
:::::: 06feac15406f4f66f4c0c6ea60b10d44775d4133 net: ti: icssg-prueth: Fix emac link speed handling

:::::: TO: MD Danish Anwar <danishanwar@ti.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
