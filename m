Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4BE7E574;
	Wed, 25 Sep 2024 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253377; cv=none; b=c63UYC4BcUFV7e817S2YFdP/HRlwGjB2RMyqsMZ07oFAwqjP+FTd3MH0TJQ9MA0UgC0IzlBEapadpOvd7P9Auqqq1QhVAvxSC7aqUL4vliT7cK9C1trnEJVezrpaYhk+S8R1pTmQu5Kx1hUXJpm/UAQye1fPnoZvyuY+GSnrbls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253377; c=relaxed/simple;
	bh=PXZEeRQuWyEKTrUVGhxWEzb8LnPVAVEgwtJ+VJd0aPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZDX0CeihPKj0X2FUeFAk0CXgKLcMzRULdEOIH/nOjdQE3MMgPWEQgI+3smybQx1FujCRTJ57Ywp457UByEzMYEqoRIZYwABpcX2LRQx3KrTW+QrWlkk6OENjyeuv7Qg3zbvJKldawnDAGt8TIWZCVzB9Hk0d50toVYoXwg2dDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLuEkXaB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLuEkXaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727253375; x=1758789375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXZEeRQuWyEKTrUVGhxWEzb8LnPVAVEgwtJ+VJd0aPk=;
  b=PLuEkXaBYLtY7BcrNGwngOvM0wfUj37IoP27ninElKSnXSI/ZebMA8yY
   OtB8gGgcS7G+Va5qDnciX3HOzV5lasDEjeaiysY68GItgbjCuXkCTLQbz
   hoElYedKC3aHP2MeAlA/fI5N5JFImEELPdwQegQFnTPis6XMBka8rFYh7
   2YPcYWYFLB/PKFOQFl733qXH2+nSO+YXC9zIapkLYRWS/LN79Zl5hIWof
   ol/ov8UfSdtxWzqPPzfj0IeYBTQ3sBxujdTu1AzdYhFLp/3RVizKKOYJd
   uc+h0I3j+pil13KspEb+NPj/Ik4MBxeFMduqUbIjY22rBrrLnWNo2mPTp
   w==;
X-CSE-ConnectionGUID: ZjDk7eSdR36QdZ3/wI22Zw==
X-CSE-MsgGUID: 5qg8z8sOSv6TjSkDy1qEqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26440105"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26440105"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 01:36:12 -0700
X-CSE-ConnectionGUID: h+C3WhUOS4uZWPZ0XyWqRA==
X-CSE-MsgGUID: nyT+KYmURD2BeDtmqjJATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71846619"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 01:36:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stNVI-000JN1-0Q;
	Wed, 25 Sep 2024 08:36:08 +0000
Date: Wed, 25 Sep 2024 16:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 3/5]
 drivers/scsi/aacraid/linit.c:390: warning: Function parameter or struct
 member 'lim' not described in 'aac_device_configure'
Message-ID: <202409251653.GKl8RXkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   a5fded69fb0f4a49c1de7e7b4f83bc68a1cc99d3
commit: 74de896b64c86b8ef567baeaed830a36d9cb4ba9 [3/5] scsi: Convert SCSI drivers to .device_configure()
config: x86_64-buildonly-randconfig-001-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251653.GKl8RXkM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251653.GKl8RXkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251653.GKl8RXkM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/aacraid/linit.c:390: warning: Function parameter or struct member 'lim' not described in 'aac_device_configure'
--
>> drivers/scsi/lpfc/lpfc_scsi.c:6357: warning: Function parameter or struct member 'lim' not described in 'lpfc_device_configure'


vim +390 drivers/scsi/aacraid/linit.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  378  
^1da177e4c3f41 Linus Torvalds           2005-04-16  379  /**
74de896b64c86b Bart Van Assche          2024-07-12  380   *	aac_device_configure		-	compute queue depths
^1da177e4c3f41 Linus Torvalds           2005-04-16  381   *	@sdev:	SCSI device we are considering
^1da177e4c3f41 Linus Torvalds           2005-04-16  382   *
^1da177e4c3f41 Linus Torvalds           2005-04-16  383   *	Selects queue depths for each target device based on the host adapter's
^1da177e4c3f41 Linus Torvalds           2005-04-16  384   *	total capacity and the queue depth supported by the target device.
^1da177e4c3f41 Linus Torvalds           2005-04-16  385   *	A queue depth of one automatically disables tagged queueing.
^1da177e4c3f41 Linus Torvalds           2005-04-16  386   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  387  
74de896b64c86b Bart Van Assche          2024-07-12  388  static int aac_device_configure(struct scsi_device *sdev,
74de896b64c86b Bart Van Assche          2024-07-12  389  				struct queue_limits *lim)
^1da177e4c3f41 Linus Torvalds           2005-04-16 @390  {
b18268fc631034 Salyzyn, Mark            2008-01-08  391  	struct aac_dev *aac = (struct aac_dev *)sdev->host->hostdata;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  392  	int chn, tid;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  393  	unsigned int depth = 0;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  394  	unsigned int set_timeout = 0;
e2fd90dd2ed87b Balsundar P              2019-10-15  395  	int timeout = 0;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  396  	bool set_qd_dev_type = false;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  397  	u8 devtype = 0;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  398  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  399  	chn = aac_logical_to_phys(sdev_channel(sdev));
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  400  	tid = sdev_id(sdev);
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  401  	if (chn < AAC_MAX_BUSES && tid < AAC_MAX_TARGETS && aac->sa_firmware) {
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  402  		devtype = aac->hba_map[chn][tid].devtype;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  403  
0015437cc046e5 Sagar Biradar            2019-03-07  404  		if (devtype == AAC_DEVTYPE_NATIVE_RAW) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  405  			depth = aac->hba_map[chn][tid].qd_limit;
0015437cc046e5 Sagar Biradar            2019-03-07  406  			set_timeout = 1;
0015437cc046e5 Sagar Biradar            2019-03-07  407  			goto common_config;
0015437cc046e5 Sagar Biradar            2019-03-07  408  		}
0015437cc046e5 Sagar Biradar            2019-03-07  409  		if (devtype == AAC_DEVTYPE_ARC_RAW) {
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  410  			set_qd_dev_type = true;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  411  			set_timeout = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  412  			goto common_config;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  413  		}
0015437cc046e5 Sagar Biradar            2019-03-07  414  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  415  
a4576b5da67156 Mark Salyzyn             2008-04-30  416  	if (aac->jbod && (sdev->type == TYPE_DISK))
a4576b5da67156 Mark Salyzyn             2008-04-30  417  		sdev->removable = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  418  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  419  	if (sdev->type == TYPE_DISK
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  420  	 && sdev_channel(sdev) != CONTAINER_CHANNEL
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  421  	 && (!aac->jbod || sdev->inq_periph_qual)
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  422  	 && (!aac->raid_scsi_mode || (sdev_channel(sdev) != 2))) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  423  
e37ee4bec6c6d6 Mark Haverkamp           2007-01-26  424  		if (expose_physicals == 0)
e37ee4bec6c6d6 Mark Haverkamp           2007-01-26  425  			return -ENXIO;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  426  
b18268fc631034 Salyzyn, Mark            2008-01-08  427  		if (expose_physicals < 0)
bb08f92ebd7570 Mark Haverkamp           2006-02-01  428  			sdev->no_uld_attach = 1;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  429  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  430  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  431  	if (sdev->tagged_supported
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  432  	 &&  sdev->type == TYPE_DISK
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  433  	 &&  (!aac->raid_scsi_mode || (sdev_channel(sdev) != 2))
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  434  	 && !sdev->no_uld_attach) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  435  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  436  		struct scsi_device * dev;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  437  		struct Scsi_Host *host = sdev->host;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  438  		unsigned num_lsu = 0;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  439  		unsigned num_one = 0;
b18268fc631034 Salyzyn, Mark            2008-01-08  440  		unsigned cid;
7c00ffa314bf0f Mark Haverkamp           2005-05-16  441  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  442  		set_timeout = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  443  
b18268fc631034 Salyzyn, Mark            2008-01-08  444  		for (cid = 0; cid < aac->maximum_num_containers; ++cid)
b18268fc631034 Salyzyn, Mark            2008-01-08  445  			if (aac->fsa_dev[cid].valid)
b18268fc631034 Salyzyn, Mark            2008-01-08  446  				++num_lsu;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  447  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  448  		__shost_for_each_device(dev, host) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  449  			if (dev->tagged_supported
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  450  			 && dev->type == TYPE_DISK
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  451  			 && (!aac->raid_scsi_mode || (sdev_channel(sdev) != 2))
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  452  			 && !dev->no_uld_attach) {
cb1042f285c216 Salyzyn, Mark            2008-01-17  453  				if ((sdev_channel(dev) != CONTAINER_CHANNEL)
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  454  				 || !aac->fsa_dev[sdev_id(dev)].valid) {
bb08f92ebd7570 Mark Haverkamp           2006-02-01  455  					++num_lsu;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  456  				}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  457  			} else {
bb08f92ebd7570 Mark Haverkamp           2006-02-01  458  				++num_one;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  459  			}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  460  		}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  461  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  462  		if (num_lsu == 0)
bb08f92ebd7570 Mark Haverkamp           2006-02-01  463  			++num_lsu;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  464  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  465  		depth = (host->can_queue - num_one) / num_lsu;
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  466  
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  467  		if (sdev_channel(sdev) != NATIVE_CHANNEL)
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  468  			goto common_config;
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  469  
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  470  		set_qd_dev_type = true;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  471  
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  472  	}
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  473  
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  474  common_config:
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  475  
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  476  	/*
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  477  	 * Check if SATA drive
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  478  	 */
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  479  	if (set_qd_dev_type) {
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  480  		if (strncmp(sdev->vendor, "ATA", 3) == 0)
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  481  			depth = 32;
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  482  		else
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  483  			depth = 64;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  484  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  485  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  486  	/*
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  487  	 * Firmware has an individual device recovery time typically
e2fd90dd2ed87b Balsundar P              2019-10-15  488  	 * of 35 seconds, give us a margin. Thor devices can take longer in
e2fd90dd2ed87b Balsundar P              2019-10-15  489  	 * error recovery, hence different value.
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  490  	 */
e2fd90dd2ed87b Balsundar P              2019-10-15  491  	if (set_timeout) {
e2fd90dd2ed87b Balsundar P              2019-10-15  492  		timeout = aac->sa_firmware ? AAC_SA_TIMEOUT : AAC_ARC_TIMEOUT;
e2fd90dd2ed87b Balsundar P              2019-10-15  493  		blk_queue_rq_timeout(sdev->request_queue, timeout * HZ);
e2fd90dd2ed87b Balsundar P              2019-10-15  494  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  495  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  496  	if (depth > 256)
bb08f92ebd7570 Mark Haverkamp           2006-02-01  497  		depth = 256;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  498  	else if (depth < 1)
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  499  		depth = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  500  
db5ed4dfd5dd01 Christoph Hellwig        2014-11-13  501  	scsi_change_queue_depth(sdev, depth);
7c00ffa314bf0f Mark Haverkamp           2005-05-16  502  
6bf3b630d0a733 Raghava Aditya Renukunta 2016-02-03  503  	sdev->tagged_supported = 1;
6bf3b630d0a733 Raghava Aditya Renukunta 2016-02-03  504  
^1da177e4c3f41 Linus Torvalds           2005-04-16  505  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  506  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  507  

:::::: The code at line 390 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
