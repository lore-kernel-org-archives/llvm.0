Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927592570;
	Fri, 24 Feb 2023 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677228525; x=1708764525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNJRK8AoPszEMXDKY8PIlHf3hpT4oQnnGeS2n5oDBo0=;
  b=PgOLINF/QowgjrF8AUeT33wqvkkwCwr97xUHpJLrPx3U39TnEbr1zs9B
   3A/WOyYpV3VZ5fFHTVHTlb8DxXTEnWznhFYfy76VpFUUk+6Esn1yMLkJ1
   5qyKg0578DKsj4pFHd3hKQgQKW6udKOMZ2T7AGe55VECZCz1zFozDKBi8
   QLpFiSVgQzP9ii2Hpg0udkP/UiPvlwiMUAg4+Xx+5QvLBa0TpKQVDj3qX
   Y7hn/b1tzMb3e4PkHNZAyml5I4WsZiDMzXi6jHRaNlgg7LzS5MLvQGRSD
   RBl70rNVy7mKg50iLQUNOIF1zEjQItXnfprgC6p4vCh2wZZofqVlRKvHY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="334849300"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="334849300"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 00:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="705198926"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="705198926"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 00:48:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVTkx-0002GX-0h;
	Fri, 24 Feb 2023 08:48:43 +0000
Date: Fri, 24 Feb 2023 16:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-for-next 5/5] drivers/scsi/scsi_error.c:94:3:
 error: call to undeclared function 'smb_mb'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202302241606.hSF0dXZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-for-next
head:   89fc49edc172725e7ba6fa9cde6e7d0c6b6ded7f
commit: 89fc49edc172725e7ba6fa9cde6e7d0c6b6ded7f [5/5] scsi: core: Simplify the code for waking up the error handler
config: arm-randconfig-r031-20230222 (https://download.01.org/0day-ci/archive/20230224/202302241606.hSF0dXZd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/bvanassche/linux/commit/89fc49edc172725e7ba6fa9cde6e7d0c6b6ded7f
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-for-next
        git checkout 89fc49edc172725e7ba6fa9cde6e7d0c6b6ded7f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241606.hSF0dXZd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:94:3: error: call to undeclared function 'smb_mb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   smb_mb();
                   ^
   1 error generated.


vim +/smb_mb +94 drivers/scsi/scsi_error.c

    75	
    76	/**
    77	 * scsi_schedule_eh - schedule EH for SCSI host
    78	 * @shost:	SCSI host to invoke error handling on.
    79	 *
    80	 * Schedule SCSI EH without scmd.
    81	 */
    82	void scsi_schedule_eh(struct Scsi_Host *shost)
    83	{
    84		unsigned long flags;
    85	
    86		spin_lock_irqsave(shost->host_lock, flags);
    87	
    88		if (scsi_host_set_state(shost, SHOST_RECOVERY) == 0 ||
    89		    scsi_host_set_state(shost, SHOST_CANCEL_RECOVERY) == 0) {
    90			/*
    91			 * Ensure that all tasks observe the host state change before
    92			 * the host_failed change.
    93			 */
  > 94			smb_mb();
    95			shost->host_eh_scheduled++;
    96			scsi_eh_wakeup(shost);
    97		}
    98	
    99		spin_unlock_irqrestore(shost->host_lock, flags);
   100	}
   101	EXPORT_SYMBOL_GPL(scsi_schedule_eh);
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
