Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C519E;
	Wed, 19 Apr 2023 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681900491; x=1713436491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JzzJoT3wUpopbqqaghHHi9Wn1EdvBRnCXmZDU3J13uI=;
  b=AGyl5MA1ULP0Tzwd4EdMjPtypC5UeQ+ufi86BbIhuReTOryK/IbFP6pa
   hXNaGcZPDFDt6UJHanTJ53WeLYsGEpRfiZxlaKfIk6kI33QkmJkAJrDMn
   +3I0MZSXmaSMyiuWDj7y8e+tLh2IiUJdlmrIAZ9mK0FrtOvA/XF+ZQ3s1
   IwxjEGZSTuj8T3ub1ZTeCY2mFECSanRFi/Bms+tgmQW0fqX1H2BLm7rRV
   AbAa6HjBEsh2ZqMBd7yxA7e+TGhqH7SiEahwLVcig/LpkfbfdnI5h6Zge
   58P93Ah+hgg+mri6l8dI3H6zf/fipDGK/yxOlruyAfUX5xc0RtUZarch2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348165362"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="348165362"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 03:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="760700825"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="760700825"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 03:34:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp59D-000eof-0K;
	Wed, 19 Apr 2023 10:34:47 +0000
Date: Wed, 19 Apr 2023 18:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:ufs-for-next 1/5] drivers/scsi/sd.c:3724:22: warning:
 variable 'q' is uninitialized when used here
Message-ID: <202304191843.Pby2PeEq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   2adb0245e0fe00d8d51c32cea617a7cb8992289d
commit: 553ecaab1b05eca6508a07386fa30916cbcca8cc [1/5] scsi: sd: Let sd_shutdown() fail future I/O
config: x86_64-randconfig-a013-20230417 (https://download.01.org/0day-ci/archive/20230419/202304191843.Pby2PeEq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/553ecaab1b05eca6508a07386fa30916cbcca8cc
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche ufs-for-next
        git checkout 553ecaab1b05eca6508a07386fa30916cbcca8cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191843.Pby2PeEq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sd.c:3724:22: warning: variable 'q' is uninitialized when used here [-Wuninitialized]
           blk_mq_freeze_queue(q);
                               ^
   drivers/scsi/sd.c:3702:25: note: initialize the variable 'q' to silence this warning
           struct request_queue *q;
                                  ^
                                   = NULL
   1 warning generated.


vim +/q +3724 drivers/scsi/sd.c

  3693	
  3694	/*
  3695	 * Send a SYNCHRONIZE CACHE instruction down to the device through
  3696	 * the normal SCSI command structure.  Wait for the command to
  3697	 * complete.
  3698	 */
  3699	static void sd_shutdown(struct device *dev)
  3700	{
  3701		struct scsi_disk *sdkp = dev_get_drvdata(dev);
  3702		struct request_queue *q;
  3703	
  3704		if (!sdkp)
  3705			return;         /* this can happen */
  3706	
  3707		if (pm_runtime_suspended(dev))
  3708			goto fail_future_io;
  3709	
  3710		if (sdkp->WCE && sdkp->media_present) {
  3711			sd_printk(KERN_NOTICE, sdkp, "Synchronizing SCSI cache\n");
  3712			sd_sync_cache(sdkp, NULL);
  3713		}
  3714	
  3715		if (system_state != SYSTEM_RESTART && sdkp->device->manage_start_stop) {
  3716			sd_printk(KERN_NOTICE, sdkp, "Stopping disk\n");
  3717			sd_start_stop_device(sdkp, 0);
  3718		}
  3719	
  3720	fail_future_io:
  3721		smp_store_release(&sdkp->device->shut_down, true);
  3722		if (!scsi_host_busy(sdkp->device->host))
  3723			return;
> 3724		blk_mq_freeze_queue(q);
  3725		blk_mq_unfreeze_queue(q);
  3726	}
  3727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
