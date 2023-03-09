Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4EF7E6;
	Thu,  9 Mar 2023 05:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678339333; x=1709875333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xoeQ4/zEY7mPx1hA5Xkna9630NKqhwYISSLbkfBIFVM=;
  b=bodsU8HieLjl5x/UogOeWWLJ2NNfnVrPR6C/GhI3h8kneM22fqgXft7k
   P/INwEFhmLvT2awmxLBdyHSqrGiSKq9jLlm4ae+6jlHGk6uNhfUFvqv1Q
   dnBviu3R1KybdYkvTDpUZ/cFYj6LbeIECSAaobFfJTEhaNzrNWIWfSLTL
   Vh/Kgh5PEMfkFtRG4DQMXDfARpmRyu67tS9AVWL82sykCOcuiFqpPqFlW
   fgC19QNKD+QgiS6uO88Cdd4KogwIwICsCpxWKzCwjJj2fm0wlp0fDAxEb
   8rlbiKiP34umNZoELor5SZngGXN0PHZJw6dZTxVNXVT7urN1XixaCj66R
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320184768"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="320184768"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 21:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820477942"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="820477942"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 21:22:11 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa8jC-0002ft-2p;
	Thu, 09 Mar 2023 05:22:10 +0000
Date: Thu, 9 Mar 2023 13:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1568:6:
 warning: variable 'ret' set but not used
Message-ID: <202303091328.mMDBpiMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   8f9e579d464e5177c80afd27daccf6fd83ee7d83
commit: a733dfba96c49ca607193fe85342aa2e4a526a34 [3/4] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-randconfig-r023-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091328.mMDBpiMk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/a733dfba96c49ca607193fe85342aa2e4a526a34
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/170-atcphy
        git checkout a733dfba96c49ca607193fe85342aa2e4a526a34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091328.mMDBpiMk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/apple/atc.c:1568:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret = 0;
               ^
   1 warning generated.


vim +/ret +1568 drivers/phy/apple/atc.c

  1563	
  1564	static int atcphy_usb3_power_on(struct phy *phy)
  1565	{
  1566		struct apple_atcphy *atcphy = phy_get_drvdata(phy);
  1567		enum atcphy_pipehandler_state state;
> 1568		int ret = 0;
  1569	
  1570		/*
  1571		 * Both usb role switch and mux set work will be running concurrently.
  1572		 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
  1573		 * trying to switch dwc3 to the correct PHY.
  1574		 */
  1575		mutex_lock(&atcphy->lock);
  1576		if (atcphy->mode != atcphy->target_mode) {
  1577			reinit_completion(&atcphy->atcphy_online_event);
  1578			mutex_unlock(&atcphy->lock);
  1579			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1580						msecs_to_jiffies(1000));
  1581			mutex_lock(&atcphy->lock);
  1582		}
  1583	
  1584		if (atcphy->mode != atcphy->target_mode) {
  1585			dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
  1586			return -EINVAL;
  1587		}
  1588	
  1589		atcphy->dwc3_online = true;
  1590		state = atcphy_modes[atcphy->mode].pipehandler_state;
  1591		switch (state) {
  1592		case ATCPHY_PIPEHANDLER_STATE_USB2:
  1593		case ATCPHY_PIPEHANDLER_STATE_USB3:
  1594			ret = atcphy_configure_pipehandler(atcphy, state);
  1595			break;
  1596	
  1597		case ATCPHY_PIPEHANDLER_STATE_INVALID:
  1598		default:
  1599			dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
  1600				 state);
  1601			ret = -EINVAL;
  1602		}
  1603	
  1604		mutex_unlock(&atcphy->lock);
  1605	
  1606		return 0;
  1607	}
  1608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
