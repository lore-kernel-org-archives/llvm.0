Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F4B63E
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649426433; x=1680962433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78WNNQHpZeCy40Glp267cNtQcvJrwMK/5ojbi1sX/lY=;
  b=G+2YIVL5hLbZTvSAaSlAPmCGd1RUsuu0s4XoZ9DSyRzopNx2IjnOcBtB
   QG0XiZ8yqv+tZzZu0/NTe/7pybvNkhwqw4vkq4vLuPa9vGsZvmjeSD2dx
   zLiILVhK5TSSnNlWFY0eip6C9EBYL5kn7tmmmC+dsh36HAACMoMzahmom
   d+AW9ryiqlYMe6JKrnPLZ75YFaOiYZWSVCsFF1LDLkt8o587egfpZThIk
   /I4hOJ6hrcpY1CPCONqqkjUj6NderqH6Nra0vA8wukJRTUXeTwhR7WLN5
   0oer6KcKUBvaVMA7u4ipjXqCIRw7eotj1kLDshZid13HB7qk7eHqmr7Fu
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322285677"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="322285677"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 07:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="609762247"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2022 07:00:31 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncpA6-0000Kh-Da;
	Fri, 08 Apr 2022 14:00:30 +0000
Date: Fri, 8 Apr 2022 21:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:cex7 143/148] drivers/net/phy/qsfp.c:1229:3: warning:
 misleading indentation; statement is not part of the previous 'if'
Message-ID: <202204082118.wYOkk4aT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git cex7
head:   d4b5e6687e034b7408f75fcbeccda90fd424b853
commit: 15b70689e8853e6983ab01bad883aca045d7b4ae [143/148] net: add qsfp support                              [*experimental*]
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220408/202204082118.wYOkk4aT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm cex7
        git checkout 15b70689e8853e6983ab01bad883aca045d7b4ae
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/ethernet/microchip/lan966x/ drivers/net/phy/

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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
