Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A575C2877CE;
	Fri,  8 Aug 2025 19:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754683086; cv=none; b=uk3IWoGEHefegdT5sZluQrXlRXo5nEbNEaJ/YvL5AX6cN33pr4xxGPA0DbwcxlRxwwLDBLerOHul4/+cdJhMh7DctsUOh5ASaZxeDbZemhURFPKBd2dlINf249PopZEKk9NOrxWiFCZ7+W53jv6PMxjwJuEyl7uNN9uq7onlMJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754683086; c=relaxed/simple;
	bh=GpA7kW7faEkTua29BzB+q/0vkLZHLhMRdYWBaaKwXtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sk0F06K/Be/n0pRLfrH5ivlmOfdFoV7eAalB/gIV+U2uMNZfDHkWrnAlwsaH/ynbn2ZrgS0sTTE/AvTHmhXC4D88fHBWV5+cyU/mpRMMrXaBB6eGVmGB1TeOld4GBsAHcnIJI59UzQTbiYktvREHZRgdwKJ38kT1wwnxFXZtfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKwWPmEA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKwWPmEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754683084; x=1786219084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GpA7kW7faEkTua29BzB+q/0vkLZHLhMRdYWBaaKwXtQ=;
  b=kKwWPmEAlS21LFtLk67jKW68Rj6Cba+qzEgTgPODPfhouQlaTU8BlD6j
   x6iSIVdlhwXIzrmeibg7XXo0+lrqugAKXOFbsiI+IRGtFao7Qe4e1fKdP
   KjPRG0lcMxl9bxNL9vlRG8y0BGcuDx5EUIuG+q0SbD4hKLAARk+EwXQ6k
   NGehn+m8dx+pRNjoipe0XY5UTj9Q06+EzUxSUEhfYeADfKnuChwW4TCxQ
   jxgad8XiV7/+getzsZTa3SFJX6yTGNXBvQqWQj3Og+uDUXSuuBL/obPMW
   zYoFcS+EtBi5CqSZv7od9hhX/29PmMYHxxzsQV/dxjQLfLNw2x64a1M1h
   g==;
X-CSE-ConnectionGUID: UupH6BK+Tc2OTBgZd6jV7Q==
X-CSE-MsgGUID: tVViHFcKS46w+doCJVGG3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56750867"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56750867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 12:58:04 -0700
X-CSE-ConnectionGUID: V9eikaoFS3S8j9Nw2zL+9A==
X-CSE-MsgGUID: lt9i5VRGQOas1QPoYkXKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164629457"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2025 12:58:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukTE0-0004G0-2d;
	Fri, 08 Aug 2025 19:58:00 +0000
Date: Sat, 9 Aug 2025 03:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v4] ethtool: add FEC bins
 histogramm report
Message-ID: <202508090307.VECVHHAP-lkp@intel.com>
References: <20250807155924.2272507-1-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807155924.2272507-1-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue net/main net-next/main linus/master v6.16 next-20250808]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/ethtool-add-FEC-bins-histogramm-report/20250808-000418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20250807155924.2272507-1-vadfed%40meta.com
patch subject: [Intel-wired-lan] [RFC PATCH v4] ethtool: add FEC bins histogramm report
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250809/202508090307.VECVHHAP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090307.VECVHHAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090307.VECVHHAP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:1287:18: warning: declaration of 'struct ethtool_fec_histe' will not be visible outside of this function [-Wvisibility]
    1287 |                                struct ethtool_fec_histe *hist)
         |                                       ^
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c:1353:20: error: incompatible function pointer types initializing 'void (*)(struct net_device *, struct ethtool_fec_stats *, struct ethtool_fec_hist *)' with an expression of type 'void (struct net_device *, struct ethtool_fec_stats *, struct ethtool_fec_histe *)' [-Wincompatible-function-pointer-types]
    1353 |         .get_fec_stats          = otx2_get_fec_stats,
         |                                   ^~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +1353 drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c

cff713ce6c1307 Christina Jacob   2021-02-09  1284  
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1285  static void otx2_get_fec_stats(struct net_device *netdev,
3d498d3cb4dd5c Vadim Fedorenko   2025-08-07  1286  			       struct ethtool_fec_stats *fec_stats,
3d498d3cb4dd5c Vadim Fedorenko   2025-08-07 @1287  			       struct ethtool_fec_histe *hist)
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1288  {
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1289  	struct otx2_nic *pfvf = netdev_priv(netdev);
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1290  	struct cgx_fw_data *rsp;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1291  
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1292  	otx2_update_lmac_fec_stats(pfvf);
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1293  
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1294  	/* Report MAC FEC stats */
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1295  	fec_stats->corrected_blocks.total     = pfvf->hw.cgx_fec_corr_blks;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1296  	fec_stats->uncorrectable_blocks.total = pfvf->hw.cgx_fec_uncorr_blks;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1297  
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1298  	rsp = otx2_get_fwdata(pfvf);
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1299  	if (!IS_ERR(rsp) && rsp->fwdata.phy.misc.has_fec_stats &&
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1300  	    !otx2_get_phy_fec_stats(pfvf)) {
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1301  		/* Fetch fwdata again because it's been recently populated with
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1302  		 * latest PHY FEC stats.
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1303  		 */
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1304  		rsp = otx2_get_fwdata(pfvf);
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1305  		if (!IS_ERR(rsp)) {
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1306  			struct fec_stats_s *p = &rsp->fwdata.phy.fec_stats;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1307  
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1308  			if (pfvf->linfo.fec == OTX2_FEC_BASER) {
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1309  				fec_stats->corrected_blocks.total = p->brfec_corr_blks;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1310  				fec_stats->uncorrectable_blocks.total = p->brfec_uncorr_blks;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1311  			} else {
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1312  				fec_stats->corrected_blocks.total = p->rsfec_corr_cws;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1313  				fec_stats->uncorrectable_blocks.total = p->rsfec_uncorr_cws;
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1314  			}
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1315  		}
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1316  	}
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1317  }
b441c4ac5ea372 Hariprasad Kelam  2022-12-05  1318  
d45d8979840d9c Christina Jacob   2020-01-27  1319  static const struct ethtool_ops otx2_ethtool_ops = {
af7fcbbd2229cc Jakub Kicinski    2020-03-12  1320  	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
6e144b47f560ed Suman Ghosh       2022-05-17  1321  				     ETHTOOL_COALESCE_MAX_FRAMES |
6e144b47f560ed Suman Ghosh       2022-05-17  1322  				     ETHTOOL_COALESCE_USE_ADAPTIVE,
68258596cbc9a6 Subbaraya Sundeep 2022-02-23  1323  	.supported_ring_params  = ETHTOOL_RING_USE_RX_BUF_LEN |
68258596cbc9a6 Subbaraya Sundeep 2022-02-23  1324  				  ETHTOOL_RING_USE_CQE_SIZE,
62e01d8c4170f3 Jakub Kicinski    2025-07-07  1325  	.rxfh_max_num_contexts	= MAX_RSS_GROUPS,
6e92d71bf88208 Sunil Goutham     2020-01-27  1326  	.get_link		= otx2_get_link,
d45d8979840d9c Christina Jacob   2020-01-27  1327  	.get_drvinfo		= otx2_get_drvinfo,
d45d8979840d9c Christina Jacob   2020-01-27  1328  	.get_strings		= otx2_get_strings,
d45d8979840d9c Christina Jacob   2020-01-27  1329  	.get_ethtool_stats	= otx2_get_ethtool_stats,
d45d8979840d9c Christina Jacob   2020-01-27  1330  	.get_sset_count		= otx2_get_sset_count,
d45d8979840d9c Christina Jacob   2020-01-27  1331  	.set_channels		= otx2_set_channels,
d45d8979840d9c Christina Jacob   2020-01-27  1332  	.get_channels		= otx2_get_channels,
d45d8979840d9c Christina Jacob   2020-01-27  1333  	.get_ringparam		= otx2_get_ringparam,
d45d8979840d9c Christina Jacob   2020-01-27  1334  	.set_ringparam		= otx2_set_ringparam,
d45d8979840d9c Christina Jacob   2020-01-27  1335  	.get_coalesce		= otx2_get_coalesce,
d45d8979840d9c Christina Jacob   2020-01-27  1336  	.set_coalesce		= otx2_set_coalesce,
6e92d71bf88208 Sunil Goutham     2020-01-27  1337  	.get_rxnfc		= otx2_get_rxnfc,
6e92d71bf88208 Sunil Goutham     2020-01-27  1338  	.set_rxnfc              = otx2_set_rxnfc,
6e92d71bf88208 Sunil Goutham     2020-01-27  1339  	.get_rxfh_key_size	= otx2_get_rxfh_key_size,
6e92d71bf88208 Sunil Goutham     2020-01-27  1340  	.get_rxfh_indir_size	= otx2_get_rxfh_indir_size,
6e92d71bf88208 Sunil Goutham     2020-01-27  1341  	.get_rxfh		= otx2_get_rxfh,
6e92d71bf88208 Sunil Goutham     2020-01-27  1342  	.set_rxfh		= otx2_set_rxfh,
f99ff3c2a3285b Jakub Kicinski    2025-06-16  1343  	.get_rxfh_fields	= otx2_get_rss_hash_opts,
f99ff3c2a3285b Jakub Kicinski    2025-06-16  1344  	.set_rxfh_fields	= otx2_set_rss_hash_opts,
62e01d8c4170f3 Jakub Kicinski    2025-07-07  1345  	.create_rxfh_context	= otx2_create_rxfh,
62e01d8c4170f3 Jakub Kicinski    2025-07-07  1346  	.modify_rxfh_context	= otx2_modify_rxfh,
62e01d8c4170f3 Jakub Kicinski    2025-07-07  1347  	.remove_rxfh_context	= otx2_remove_rxfh,
6e92d71bf88208 Sunil Goutham     2020-01-27  1348  	.get_msglevel		= otx2_get_msglevel,
6e92d71bf88208 Sunil Goutham     2020-01-27  1349  	.set_msglevel		= otx2_set_msglevel,
75f36270990c78 Geetha sowjanya   2020-03-02  1350  	.get_pauseparam		= otx2_get_pauseparam,
75f36270990c78 Geetha sowjanya   2020-03-02  1351  	.set_pauseparam		= otx2_set_pauseparam,
c9c12d339d9336 Aleksey Makarov   2020-08-24  1352  	.get_ts_info		= otx2_get_ts_info,
b441c4ac5ea372 Hariprasad Kelam  2022-12-05 @1353  	.get_fec_stats		= otx2_get_fec_stats,
d0cf9503e908ee Christina Jacob   2021-02-09  1354  	.get_fecparam		= otx2_get_fecparam,
d0cf9503e908ee Christina Jacob   2021-02-09  1355  	.set_fecparam		= otx2_set_fecparam,
1a50280c25ecfb Christina Jacob   2021-02-09  1356  	.get_link_ksettings     = otx2_get_link_ksettings,
cff713ce6c1307 Christina Jacob   2021-02-09  1357  	.set_link_ksettings     = otx2_set_link_ksettings,
d45d8979840d9c Christina Jacob   2020-01-27  1358  };
d45d8979840d9c Christina Jacob   2020-01-27  1359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
