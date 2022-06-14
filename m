Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3BC469C
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655190021; x=1686726021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6PJlJqUjtyZoqp0A9EmoN36ngJBxIcjaQOm7vXmJTg=;
  b=i30y/yMWqjeiSYzEtgxhpRId6O2Vtb6TQq3lke3L1AXyRBnxUkZf374j
   +x2LsSyVI7dU2pl03hOI8cxGM00TeUbwdnlR1VnE8crHWRase61VbEPem
   Nafi5GmVfUvwPAOwbycT8EwgXj/hShAMRcAyrHIN6wnt+Care9d/krWUy
   a5rBiVKnOA6jBe6k/bhKKcC9ULeDQAip3XrI616ngWIBZ+VZ27Gb6ek2l
   6jcG3EcRMWcMO3hxE1U0BG6/bsy7/BS+wMn2PXiEg1NpHaEjPhnko5AAM
   K3l7XvJGsWgVpyzp58SZLnuR5oa7NrupX1ukXyz+lbbods2s5C/VpU5eH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="267217328"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="267217328"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 00:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="582571128"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Jun 2022 00:00:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o10XC-000LbD-7t;
	Tue, 14 Jun 2022 07:00:18 +0000
Date: Tue, 14 Jun 2022 14:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:cex7 89/92] drivers/net/phy/qsfp.c:1229:3: warning:
 misleading indentation; statement is not part of the previous 'if'
Message-ID: <202206141458.CSdyGV60-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   c100f9a83ba091fb3aa1f9f7d2918e903a30be52
commit: 27d0fce1fe5255fb738b355326ffe8be6f8c154b [89/92] net: add qsfp support                              [*experimental*]
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220614/202206141458.CSdyGV60-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm cex7
        git checkout 27d0fce1fe5255fb738b355326ffe8be6f8c154b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/qsfp.c:1229:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                   qsfp_sm_ins_next(qsfp, SFP_MOD_PRESENT, 0);
                   ^
   drivers/net/phy/qsfp.c:1222:2: note: previous statement is here
           if (!qsfp->gpio_irq[GPIO_INTL])
           ^
   1 warning generated.


vim +/if +1229 drivers/net/phy/qsfp.c

  1215	
  1216		if (qsfp->sm_dev_state == SFP_DEV_DETACHED) {
  1217			qsfp_sm_ins_next(qsfp, SFP_MOD_WATTACH, 0);
  1218			return;
  1219		}
  1220	
  1221		// Start the poller if there is no interrupt support if not running
  1222		if (!qsfp->gpio_irq[GPIO_INTL])
  1223			queue_delayed_work(system_wq, &qsfp->poll, poll_jiffies);
  1224	
  1225	//	ret = sfp_module_insert(qsfp->sfp_bus, &id);
  1226	//	if (ret < 0)
  1227	//		qsfp_sm_ins_next(qsfp, SFP_MOD_ERROR, 0);
  1228	//	else
> 1229			qsfp_sm_ins_next(qsfp, SFP_MOD_PRESENT, 0);
  1230	}
  1231	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
