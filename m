Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289131A08AF;
	Sun,  7 Jun 2026 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780809950; cv=none; b=tXJ/QRZ/BinWyguPL3L01yy/vi+TqQGaeWaV9IQ98AyRNFbEIWzeMq/TFp1d/APil+eFiuJZvm1XLd30W71o3yAf5Nr8QCTkDKIciuz9J0gX/pLhlumjhWt0+xbP9z3OJMXc9E464MvOvHQvlPSCn2iwxyZlblAJxp2N60cUKSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780809950; c=relaxed/simple;
	bh=B5Js4T9l2FL7TjUsAtXm6+0olKI5I4I3XDylzPUms+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X8qb/E++j78Eqz63eEtGgSSXvcNBEew/Gq3M/x1zfqFYZ8nKWfXAfAlonY7qOMGK6ssUt9vHOWHfkoH7uxRbDSvAmzFAXVTrHvJFoo9lZ68ZyMcD0ez9erTD+MHvld7wBrt5QnHbObjxisVy1S9S3eghbgyrmyC3r2sJqMd+PYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgzMeIGv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgzMeIGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780809948; x=1812345948;
  h=date:from:to:cc:subject:message-id;
  bh=B5Js4T9l2FL7TjUsAtXm6+0olKI5I4I3XDylzPUms+4=;
  b=HgzMeIGvPGebsH/8Vt0OgogUki90tMEku4awLKYEoy7wUutDuBrr6UxQ
   YiX09ajhP4jQnNVo1cioBm3d6jA0/MpkZMKC618I0qi5M3CJTQdK5ARYg
   ErhaAt9HfmHD82mv5yzW+DXjQFYR1k8pMqRYM7yPVEX3ZpQE3mIfvgc2Q
   5DBGRuH5lROgsjrcZxdkez6U6Mp4UQbP2ad7svQVD9uWpvbcXuA2on/zo
   5uuWsw9LrOriF1zPDrbbNDG9PMP5O+KovS8tSXd2Pjl0jEpMEzIpYIYtk
   21FiGNjMD29RWv5aBtv5vnN8JDIFXqu7HZB4MjDMDuQbjKzFMHA2QBzvW
   A==;
X-CSE-ConnectionGUID: g1FA0MVMSsyooOTZAB1gtg==
X-CSE-MsgGUID: elUiDh0DTHezIba+KJZwUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="104242067"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="104242067"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 22:25:48 -0700
X-CSE-ConnectionGUID: lpepg8qoR0G555vvdLnCYA==
X-CSE-MsgGUID: WfZrQu1VRtWC/CFaF5tDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="249541778"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2026 22:25:46 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW611-00000000307-3pa6;
	Sun, 07 Jun 2026 05:25:43 +0000
Date: Sun, 07 Jun 2026 07:25:37 +0200
From: kernel test robot <lkp@intel.com>
To: Potnuri Bharat Teja <bharat@chelsio.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:10420:4: warning:
 variable 'device_id' is uninitialized when used here
Message-ID: <202606070742.woDFezwQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Potnuri-Bharat-Teja/cxgb4-Add-T7-register-definitions-and-core-structures/20260607-024352
head:   44456817300ae710d21eb9fa69f7753c96635ad5
commit: f90f5e1e6e58e1352f090b4119e771286ef6b402 cxgb4: Extend hardware abstraction layer for T7 logs
date:   11 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260607/202606070742.woDFezwQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070742.woDFezwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070742.woDFezwQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:10420:4: warning: variable 'device_id' is uninitialized when used here [-Wuninitialized]
    10420 |                         device_id);
          |                         ^~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:10345:15: note: initialize the variable 'device_id' to silence this warning
    10345 |         u16 device_id;
          |                      ^
          |                       = 0
   1 warning generated.
--
>> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:7316 expecting prototype for t4_get_num_ports(). Prototype was for t4_get_tp_num_ports() instead


vim +/device_id +10420 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c

f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10333  
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10334  /**
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10335   *	t4_prep_adapter - prepare SW and HW for operation
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10336   *	@adapter: the adapter
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10337   *
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10338   *	Initialize adapter SW state for the various HW modules, set initial
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10339   *	values for some adapter tunables, take PHYs out of reset, and
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10340   *	initialize the MDIO interface.
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10341   */
91744948659a5c drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Bill Pemberton       2012-12-03  10342  int t4_prep_adapter(struct adapter *adapter)
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10343  {
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10344  	int ret, ver;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10345  	u16 device_id;
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10346  
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10347  	get_pci_mode(adapter, &adapter->params.pci);
96ac18f14a5a72 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Ganesh Goudar        2017-10-10  10348  	ret = t4_get_flash_params(adapter);
900a659687aa63 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-06-18  10349  	if (ret < 0) {
900a659687aa63 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-06-18  10350  		dev_err(adapter->pdev_dev, "error %d identifying flash\n", ret);
900a659687aa63 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-06-18  10351  		return ret;
900a659687aa63 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-06-18  10352  	}
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10353  	/* Retrieve adapter's device ID
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10354  	 */
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10355  	pci_read_config_word(adapter->pdev, PCI_DEVICE_ID,
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10356  			     &adapter->params.pci.device_id);
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10357  	pci_read_config_word(adapter->pdev, PCI_VENDOR_ID,
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10358  			     &adapter->params.pci.vendor_id);
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10359  	ver = CHELSIO_CHIP_VERSION(adapter->params.chip);
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10360  	switch (ver) {
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10361  	case CHELSIO_T4:
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10362  		adapter->params.arch.sge_fl_db = DBPRIO_F;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10363  		adapter->params.arch.mps_tcam_size =
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10364  				 NUM_MPS_CLS_SRAM_L_INSTANCES;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10365  		adapter->params.arch.mps_rplc_size = 128;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10366  		adapter->params.arch.nchan = NCHAN;
44588560d95c10 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10367  		adapter->params.arch.pm_stats_cnt = PM_NSTATS;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10368  		adapter->params.arch.vfcount = 128;
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10369  		/* Congestion map is for 4 channels so that
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10370  		 * MPS can have 4 priority per port.
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10371  		 */
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10372  		adapter->params.arch.cng_ch_bits_log = 2;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10373  		adapter->params.cim_la_size = CIMLA_SIZE;
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10374  		break;
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10375  	case CHELSIO_T5:
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10376  		adapter->params.arch.sge_fl_db = DBPRIO_F | DBTYPE_F;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10377  		adapter->params.arch.mps_tcam_size =
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10378  				 NUM_MPS_T5_CLS_SRAM_L_INSTANCES;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10379  		adapter->params.arch.mps_rplc_size = 128;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10380  		adapter->params.arch.nchan = NCHAN;
44588560d95c10 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10381  		adapter->params.arch.pm_stats_cnt = PM_NSTATS;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10382  		adapter->params.arch.vfcount = 128;
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10383  		adapter->params.arch.cng_ch_bits_log = 2;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10384  		adapter->params.cim_la_size = CIMLA_SIZE;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10385  		break;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10386  	case CHELSIO_T6:
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10387  		adapter->params.arch.sge_fl_db = 0;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10388  		adapter->params.arch.mps_tcam_size =
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10389  				 NUM_MPS_T5_CLS_SRAM_L_INSTANCES;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10390  		adapter->params.arch.mps_rplc_size = 256;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10391  		adapter->params.arch.nchan = 2;
44588560d95c10 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10392  		adapter->params.arch.pm_stats_cnt = T6_PM_NSTATS;
3ccc6cf74d8c00 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-02  10393  		adapter->params.arch.vfcount = 256;
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10394  		/* Congestion map will be for 2 channels so that
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10395  		 * MPS can have 8 priority per port.
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10396  		 */
2216d01432cb15 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-12-23  10397  		adapter->params.arch.cng_ch_bits_log = 3;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10398  		adapter->params.cim_la_size = CIMLA_SIZE_T6;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10399  		break;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10400  	case CHELSIO_T7:
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10401  		adapter->params.arch.sge_fl_db = 0;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10402  		adapter->params.arch.mps_tcam_size =
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10403  			is_t7(adapter->params.chip)
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10404  				/* In T7 there 3 TCAM each of 512 size*/
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10405  				?
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10406  				NUM_MPS_T5_CLS_SRAM_L_INSTANCES * 3 :
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10407  				NUM_MPS_T5_CLS_SRAM_L_INSTANCES;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10408  		adapter->params.arch.mps_rplc_size = 256;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10409  		adapter->params.arch.nchan = NCHAN;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10410  		adapter->params.arch.pm_stats_cnt = T6_PM_NSTATS;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10411  		adapter->params.arch.vfcount = 256;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10412  		/* Congestion map will be for 4 channels so that
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10413  		 * MPS can have 4 priority per port.
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10414  		 */
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10415  		adapter->params.arch.cng_ch_bits_log = 2;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10416  		adapter->params.cim_la_size = CIMLA_SIZE_T6;
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10417  		break;
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10418  	default:
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10419  		dev_err(adapter->pdev_dev, "Device %d is not supported\n",
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14 @10420  			device_id);
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10421  		return -EINVAL;
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10422  	}
0a57a5366a9878 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Santosh Rastapur     2013-03-14  10423  
f1ff24aa95f561 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-01-07  10424  	adapter->params.cim_la_size = CIMLA_SIZE;
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10425  	init_cong_ctrl(adapter->params.a_wnd, adapter->params.b_wnd);
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10426  
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10427  	/*
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10428  	 * Default port for debugging in case we can't reach FW.
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10429  	 */
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10430  	adapter->params.nports = 1;
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10431  	adapter->params.portvec = 1;
636f9d371f70f2 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Vipul Pandya         2012-09-26  10432  	adapter->params.vpd.cclk = 50000;
eca0f6eeadec74 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Hariprasad Shenai    2015-06-05  10433  
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10434  	ret = t4_get_flash_params(adapter);
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10435  	if (ret < 0) {
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10436  		dev_err(adapter->pdev_dev, "error %d identifying flash\n", ret);
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10437  		return ret;
f90f5e1e6e58e1 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c Potnuri Bharat Teja  2026-06-06  10438  	}
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10439  	return 0;
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10440  }
56d36be4dd5fc7 drivers/net/cxgb4/t4_hw.c                  Dimitris Michailidis 2010-04-01  10441  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
