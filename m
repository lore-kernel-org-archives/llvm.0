Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8C510EE;
	Wed, 30 Aug 2023 06:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693378016; x=1724914016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/Bt4UKopPrDGkYsc8O6FGPAPIdCUBiJ6puxnY+Qscw=;
  b=bTJRl+vuzLUqOY9LcbMynLvdcbCR6ND2QF8dT3ySG5E4Jr/fFuY3TIrP
   t8cMB1jlRuAFjlHJ90e/VC/rQmVtbT6/vMQEkJyjo47Jv0v31CGHhT6MH
   LZEV1Qmm94jWGaYonLYbbgHugWrzo5i0S+qaAmmSZI6m/IV7QXXkUcxma
   AA9j8FxjWuffzlv0TZtfpKv9ufYUzg0yN2Ji/OIVyNyXO0WssGeLi6KOq
   GenYGbffnCAlU6RmoI9fS6qeS5Jpe3GaM4lWQsC2K8Wsadjcd9or/6RYG
   vit4QPQHbjDjqcelqmJZ/kCC02haX8hD3L2hFs6Je3uwQ5fea+wQsZhxT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439512764"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="439512764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 23:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882613093"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2023 23:46:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbEyW-0009Wn-0z;
	Wed, 30 Aug 2023 06:46:50 +0000
Date: Wed, 30 Aug 2023 14:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 18/18] drivers/scsi/scsi_error.c:2215:29:
 error: use of undeclared identifier 'cmd'; did you mean 'scmd'?
Message-ID: <202308301454.kOfpCAT8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   8f962917de3a0440dcc581b6d5642c2fe2d3d313
commit: 8f962917de3a0440dcc581b6d5642c2fe2d3d313 [18/18] prepare-resubmit-fix
config: arm-randconfig-r013-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301454.kOfpCAT8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301454.kOfpCAT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301454.kOfpCAT8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:2215:29: error: use of undeclared identifier 'cmd'; did you mean 'scmd'?
    2215 |                 struct scsi_driver *uld = cmd->device->sdev_gendev.driver ?
         |                                           ^~~
         |                                           scmd
   drivers/scsi/scsi_error.c:2212:20: note: 'scmd' declared here
    2212 |         struct scsi_cmnd *scmd;
         |                           ^
   drivers/scsi/scsi_error.c:2255:29: error: use of undeclared identifier 'cmd'; did you mean 'scmd'?
    2255 |                 struct scsi_driver *uld = cmd->device->sdev_gendev.driver ?
         |                                           ^~~
         |                                           scmd
   drivers/scsi/scsi_error.c:2242:20: note: 'scmd' declared here
    2242 |         struct scsi_cmnd *scmd, *next;
         |                           ^
   2 errors generated.


vim +2215 drivers/scsi/scsi_error.c

  2205	
  2206	/*
  2207	 * Returns true if .eh_prepare_resubmit should be called for the commands in
  2208	 * @done_q.
  2209	 */
  2210	static bool scsi_needs_preparation(struct list_head *done_q)
  2211	{
  2212		struct scsi_cmnd *scmd;
  2213	
  2214		list_for_each_entry(scmd, done_q, eh_entry) {
> 2215			struct scsi_driver *uld = cmd->device->sdev_gendev.driver ?
  2216							  scsi_cmd_to_driver(scmd) :
  2217							  NULL;
  2218			bool (*npr)(struct scsi_cmnd *) = uld->eh_needs_prepare_resubmit;
  2219	
  2220			if (npr && npr(scmd))
  2221				return true;
  2222		}
  2223	
  2224		return false;
  2225	}
  2226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
