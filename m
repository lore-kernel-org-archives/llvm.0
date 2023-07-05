Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B510946;
	Wed,  5 Jul 2023 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688569561; x=1720105561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2eKCNfTLx5X9CGvvYZcLg4TrP7wEz2lmlRmDhRNA5Oc=;
  b=hyvxd/FcakFWgNSYFeGg13hs3tWZrD8dNIgBJBOEatV+PZ65aGXUmAED
   PggwvQ6XqgTcGGFwBoBkIXP/MnBxkpChqFSOjdBJzwAkO5Hbw39KBF31G
   DVW4QrUlRodO9dPdTXR5Q8yLZncX2T6lJpIBrlyW7m3B/7z8nVU9QEzAE
   GC1ZaeujMA5jkacghO2saeg7W/QH7eZgnCW1yiV0wMnMPsNMD8Fm7xz9C
   oyJYo0rz7tcJfuLLUPj+nX4X6jsmS/2111GEdxRNJKaDuiZ4+o5KXyn/f
   eqfIhVJU6W9PwUn4VPlAZtzP0lYPv+PElCjjRGwZDKoHE1BJfsm+s4qRq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429400593"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="429400593"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 08:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843314593"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="843314593"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jul 2023 08:05:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH43v-0000gk-1m;
	Wed, 05 Jul 2023 15:04:59 +0000
Date: Wed, 5 Jul 2023 23:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1571:6:
 warning: variable 'ret' set but not used
Message-ID: <202307052242.iiAtRcgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   e3ed55ca947e67fac029ec3917d1f2ca6371d360
commit: 42ffc8978cdb02ee0131e1315bd7548f92f09690 [3/4] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-randconfig-r024-20230705 (https://download.01.org/0day-ci/archive/20230705/202307052242.iiAtRcgJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307052242.iiAtRcgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307052242.iiAtRcgJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/apple/atc.c:1571:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1571 |         int ret = 0;
         |             ^
   1 warning generated.


vim +/ret +1571 drivers/phy/apple/atc.c

  1566	
  1567	static int atcphy_usb3_power_on(struct phy *phy)
  1568	{
  1569		struct apple_atcphy *atcphy = phy_get_drvdata(phy);
  1570		enum atcphy_pipehandler_state state;
> 1571		int ret = 0;
  1572	
  1573		/*
  1574		 * Both usb role switch and mux set work will be running concurrently.
  1575		 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
  1576		 * trying to switch dwc3 to the correct PHY.
  1577		 */
  1578		mutex_lock(&atcphy->lock);
  1579		if (atcphy->mode != atcphy->target_mode) {
  1580			reinit_completion(&atcphy->atcphy_online_event);
  1581			mutex_unlock(&atcphy->lock);
  1582			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1583						msecs_to_jiffies(1000));
  1584			mutex_lock(&atcphy->lock);
  1585		}
  1586	
  1587		if (atcphy->mode != atcphy->target_mode) {
  1588			dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
  1589			return -EINVAL;
  1590		}
  1591	
  1592		atcphy->dwc3_online = true;
  1593		state = atcphy_modes[atcphy->mode].pipehandler_state;
  1594		switch (state) {
  1595		case ATCPHY_PIPEHANDLER_STATE_USB2:
  1596		case ATCPHY_PIPEHANDLER_STATE_USB3:
  1597			ret = atcphy_configure_pipehandler(atcphy, state);
  1598			break;
  1599	
  1600		case ATCPHY_PIPEHANDLER_STATE_INVALID:
  1601		default:
  1602			dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
  1603				 state);
  1604			ret = -EINVAL;
  1605		}
  1606	
  1607		mutex_unlock(&atcphy->lock);
  1608	
  1609		return 0;
  1610	}
  1611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
