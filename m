Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469C29E116;
	Wed, 10 Jun 2026 03:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062712; cv=none; b=ADZQpFONUL+RjH1A3YfnFfFPDLLji4JfJfSKo2FHRu3h32oP9Bkg4jG5CM8K/taCCP8grXL9gwKRLKbUO1cLY3y81PskzWRYEEjfgBzlEvNgybNF2JaMsooCjewZnOxPD2mR7VQVN7gapCWj2592FMSdxMQY09/D3eBCYFSyIWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062712; c=relaxed/simple;
	bh=/mSBNSHU/9CK2rUIN+QV6/0wvyFdNeR8jeJadlDUBU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nL2feMuHRz44UyRr3Bkpz9cIGuBuqfgE+9TwLie6GD2WcNYw0QARmd8vzHu5k/jMAvzjJdL1YcobCtWwDY2Z4FsOtczKyEHrGzeR+7kNxvfOnWiS7ao2Q3HxQR2NHcTBalHEnV3EW7dZfzOm5dDdzW/TvBX383NIhgTL88/QQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRTWWkTD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRTWWkTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781062710; x=1812598710;
  h=date:from:to:cc:subject:message-id;
  bh=/mSBNSHU/9CK2rUIN+QV6/0wvyFdNeR8jeJadlDUBU4=;
  b=fRTWWkTDkiIXawExcviMv7I69XSgVd1eMD8Q8c7MQexLq2/HYFzURkDT
   JPoBfjU4Bw/sF5Jq0cIMq9kdSU2Dv14mHhqwMGVNAzI0eY5wx3RZv6rVJ
   eKsqJuu0rb6PbiT5XkeUueIcOFcF+ARzK9KARZOwpCOy3/Pxnb4O5i4Mc
   AZ1vjTXoCwgpdxxWEok52iBwGAewm+d5vmLsTama48dLdMB9IMIh1T6di
   BG3H2bSaeczqCTkqSNa69bgZ096EveQ3AnWQVyVU5AXpTL3u8mCcax+/t
   2VRCvisVXyknLfUGs7sRN1vMmaEm9dUjkt0E3JhWAeqwVd3OONkHJ8IuK
   w==;
X-CSE-ConnectionGUID: 8lXNMrbURoepDDY/Rjem8A==
X-CSE-MsgGUID: e/5Xl1SkRFm2K0plLqw9Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80862639"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80862639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:38:30 -0700
X-CSE-ConnectionGUID: EmwTvBMZQPq8Uk3mlK5xHA==
X-CSE-MsgGUID: Oxv/nvN1Q+6m6eLdWpUkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241618247"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2026 20:38:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX9lq-000000003bp-2l8m;
	Wed, 10 Jun 2026 03:38:26 +0000
Date: Wed, 10 Jun 2026 05:38:23 +0200
From: kernel test robot <lkp@intel.com>
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/scsi/megaraid/megaraid_mbox.c:623:51: error: use of
 undeclared identifier 'pdev'
Message-ID: <202606100515.4ene4mEh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sumit-Saxena/scsi-scan-allocate-sdev-and-starget-on-the-NUMA-node-of-the-host-adapter/20260609-195849
head:   1a119c6869ad0a915e9c86e65a8a3d0b0c4b21d2
commit: 7479f1902d058cd6e51b1f7f9b23241d8fd588cd scsi: host: allocate struct Scsi_Host on the NUMA node of the host adapter
date:   16 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260610/202606100515.4ene4mEh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100515.4ene4mEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100515.4ene4mEh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ata/libata-scsi.c:4619:57: error: too few arguments to function call, expected 3, have 2
    4619 |                 shost = scsi_host_alloc(sht, sizeof(struct ata_port *));
         |                         ~~~~~~~~~~~~~~~                               ^
   include/scsi/scsi_host.h:799:26: note: 'scsi_host_alloc' declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     800 |                                          int privsize, struct device *dev);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/usb/storage/usb.c:1034:41: error: too few arguments to function call, expected 3, have 2
    1034 |         host = scsi_host_alloc(sht, sizeof(*us));
         |                ~~~~~~~~~~~~~~~                 ^
   include/scsi/scsi_host.h:799:26: note: 'scsi_host_alloc' declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     800 |                                          int privsize, struct device *dev);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/ufs/core/ufshcd.c:10945:27: error: too few arguments to function call, expected 3, have 2
    10944 |         host = scsi_host_alloc(&ufshcd_driver_template,
          |                ~~~~~~~~~~~~~~~
    10945 |                                 sizeof(struct ufs_hba));
          |                                                       ^
   include/scsi/scsi_host.h:799:26: note: 'scsi_host_alloc' declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     800 |                                          int privsize, struct device *dev);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/scsi/megaraid/megaraid_mbox.c:623:51: error: use of undeclared identifier 'pdev'
     623 |         host = scsi_host_alloc(&megaraid_template_g, 8, &pdev->dev);
         |                                                          ^~~~
   1 error generated.


vim +/pdev +623 drivers/scsi/megaraid/megaraid_mbox.c

   609	
   610	
   611	/**
   612	 * megaraid_io_attach - attach a device with the IO subsystem
   613	 * @adapter		: controller's soft state
   614	 *
   615	 * Attach this device with the IO subsystem.
   616	 */
   617	static int
   618	megaraid_io_attach(adapter_t *adapter)
   619	{
   620		struct Scsi_Host	*host;
   621	
   622		// Initialize SCSI Host structure
 > 623		host = scsi_host_alloc(&megaraid_template_g, 8, &pdev->dev);
   624		if (!host) {
   625			con_log(CL_ANN, (KERN_WARNING
   626				"megaraid mbox: scsi_host_alloc failed\n"));
   627	
   628			return -1;
   629		}
   630	
   631		SCSIHOST2ADAP(host)	= (caddr_t)adapter;
   632		adapter->host		= host;
   633	
   634		host->irq		= adapter->irq;
   635		host->unique_id		= adapter->unique_id;
   636		host->can_queue		= adapter->max_cmds;
   637		host->this_id		= adapter->init_id;
   638		host->sg_tablesize	= adapter->sglen;
   639		host->max_sectors	= adapter->max_sectors;
   640		host->cmd_per_lun	= adapter->cmd_per_lun;
   641		host->max_channel	= adapter->max_channel;
   642		host->max_id		= adapter->max_target;
   643		host->max_lun		= adapter->max_lun;
   644	
   645	
   646		// notify mid-layer about the new controller
   647		if (scsi_add_host(host, &adapter->pdev->dev)) {
   648	
   649			con_log(CL_ANN, (KERN_WARNING
   650				"megaraid mbox: scsi_add_host failed\n"));
   651	
   652			scsi_host_put(host);
   653	
   654			return -1;
   655		}
   656	
   657		scsi_scan_host(host);
   658	
   659		return 0;
   660	}
   661	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
