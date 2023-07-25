Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258F1D2FD;
	Tue, 25 Jul 2023 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690312578; x=1721848578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ian9jaZ0nxGz+KOw6iIdQHpp9S1+cRBkOOZV0S2W5jc=;
  b=E11zMFIfVALJwOl5Qb8gicGl6Cn1PkmsIwEpRrhZYLB4kiXU6d+I3p2U
   eQMIqRfQ56QKNsNGUxGhd5Mmcqlsw5+jIw3eDEVWskejDi4JxcNdI+/6+
   uk54724N5ynPfGsPdLTCiCowSHO32YAhzTp84sVglUgDLurBM3h4Ik0D9
   Cosv9GIyXYWB8y0gUTqxSOdftkcOFSIHj6zK6WC8joQSM5IibGghWiZRx
   GJrZAQg/QqfKustYfpRaFx3bPpL8SPQC0hKDMPKDZI59QKxHCDe74vHq6
   uPGy0OaZozfv1YC0Qkp+R2m2JRlPQhyLJ2Ad95MbzTxQIyZxkvgl5KtG5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371432538"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="371432538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761330320"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="761330320"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 12:16:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qONW0-0000HX-0y;
	Tue, 25 Jul 2023 19:16:12 +0000
Date: Wed, 26 Jul 2023 03:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:ffa_notify 15/16]
 drivers/firmware/arm_ffa/test_driver.c:28:6: warning: no previous prototype
 for function 'test_ffa_notif_cb'
Message-ID: <202307260318.Rzeu5Stp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git ffa_notify
head:   50176e212a1e52a7fc37c2ea8f7e0d5937c62955
commit: 8fb5efdabdb94f98ab0fa1e1c5d34bb158953a03 [15/16] firmware: arm_ffa: Add test driver
config: arm64-randconfig-r032-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260318.Rzeu5Stp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260318.Rzeu5Stp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260318.Rzeu5Stp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_ffa/test_driver.c:28:6: warning: no previous prototype for function 'test_ffa_notif_cb' [-Wmissing-prototypes]
      28 | void test_ffa_notif_cb(u16 partition_id, int notification_id, void *data)
         |      ^
   drivers/firmware/arm_ffa/test_driver.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | void test_ffa_notif_cb(u16 partition_id, int notification_id, void *data)
         | ^
         | static 
   1 warning generated.


vim +/test_ffa_notif_cb +28 drivers/firmware/arm_ffa/test_driver.c

    26	
    27	
  > 28	void test_ffa_notif_cb(u16 partition_id, int notification_id, void *data)
    29	{
    30		pr_info("%x %x %p\n", partition_id, notification_id, data);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
