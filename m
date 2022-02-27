Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB32F2F
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 01:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645926796; x=1677462796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uvDqArwC09R6lFC53Xcn6vZTmk2HrLbjvMGEicphUU=;
  b=E1e+Tn35gCqRnENBJHF9q7Nq5ORIvHMOL5+AB350BCiBpcBQ0CltOaZt
   XMDC5YHVCjijbyW4+RAY7FRlVexWg6tMj+lI31octFOV3fffz2n9l4x9Y
   M7sXkqRcz8UZKsjOWKZAbhcpAHpQyy01sGymCWgl0F015XoaTWKtL/dAi
   PC50GrKf9QCZ4PVX86TlGkoPcyyNdb1QwLLbzw402SrSomg/2WxjzIDgN
   G7WEb0gn4XLqQoW/ll0peknN2beacLwHJJYuaea9aZWBNb3NRvLNXQ4MQ
   rvKxEUUBTcYcArsgrpn3HcSyZox0o3iiDE0tLdsehRBgOjcdnCxVBx4Vi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="232668163"
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; 
   d="scan'208";a="232668163"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2022 17:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; 
   d="scan'208";a="684993607"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2022 17:53:14 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nO8kL-000689-Nl; Sun, 27 Feb 2022 01:53:13 +0000
Date: Sun, 27 Feb 2022 09:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:cex7 184/189] drivers/net/phy/qsfp.c:1229:3: warning:
 misleading indentation; statement is not part of the previous 'if'
Message-ID: <202202270903.js3KOFR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   f53b9594a2bfdd612aca57e15167da1f64e62404
commit: 1fb157e3d601a392c0d17d2c6a8367e799859e81 [184/189] net: add qsfp support                              [*experimental*]
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220227/202202270903.js3KOFR5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm cex7
        git checkout 1fb157e3d601a392c0d17d2c6a8367e799859e81
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag as appropriate
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
