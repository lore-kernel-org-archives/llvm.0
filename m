Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF4648;
	Tue,  4 Apr 2023 05:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680587477; x=1712123477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1dl8LcdvjKgJAczhF2gT8pL3ogY7GxKgELsiVHn4wU=;
  b=GPznkezzpDGfSsEI/oL/D4nnHZ9151a8YV4kxoWWuFG2INT1wQZKcxSB
   Q8FFIVO6BMcubBSnMB78zHTZde3d+HAWi1PIC98WzPgmymFCc/Wx0SXib
   wMNNUu4QHKwokkw1VNB0tAYKhE2TGTu79rni8TiOSXo3zqo9Y8oW+DXzV
   SnO2/NE51gG4Gq8tYvPqPco7xMq3xPcpbzkOtVb2Ax79DEsVrcTdtR9Mi
   9GJdxlWPZNicT0MB8Ruz3K9pnyR8Ck5Hf5UQs9eEmBosRTu1+acxNaL8K
   amMnua8bGHlV99VhFhNs2urxmMLb/gDRpnijDdEk2JeAx2PU4w3z9cogR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322489023"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="322489023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="750793440"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="750793440"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Apr 2023 22:51:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjZZT-000PG4-2t;
	Tue, 04 Apr 2023 05:51:07 +0000
Date: Tue, 4 Apr 2023 13:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1568:6:
 warning: variable 'ret' set but not used
Message-ID: <202304041309.SD7FvIC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   da07f9d3f701c3bc19ad994b291b6808f36ed542
commit: be52206a8e1804d0b783b504d9723814ad2025d6 [3/4] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-randconfig-r032-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041309.SD7FvIC1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/be52206a8e1804d0b783b504d9723814ad2025d6
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/170-atcphy
        git checkout be52206a8e1804d0b783b504d9723814ad2025d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041309.SD7FvIC1-lkp@intel.com/

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
