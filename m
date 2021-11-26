Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7972
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 07:46:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215650525"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="215650525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 23:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="741944695"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2021 23:46:19 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqVw2-0007mD-EF; Fri, 26 Nov 2021 07:46:18 +0000
Date: Fri, 26 Nov 2021 15:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 143/161] drivers/net/dsa/qca8k.c:965:47: error: use of
 undeclared identifier 'port'
Message-ID: <202111261546.78a2l3tk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   1c86335a03ee0102daaefede1fb25cdbb367b14c
commit: 0d8c1cd8070d6743a8ea65e3b620c454d10a870f [143/161] net: dsa: qca8k: convert to use phylink_pcs
config: x86_64-randconfig-a002-20211124 (https://download.01.org/0day-ci/archive/20211126/202111261546.78a2l3tk-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 0d8c1cd8070d6743a8ea65e3b620c454d10a870f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca8k.c:965:47: error: use of undeclared identifier 'port'
           ret = qca8k_read(priv, QCA8K_REG_PORT_STATUS(port), &reg);
                                                        ^
>> drivers/net/dsa/qca8k.c:1026:22: error: use of undeclared identifier 'ds'
           if (dsa_is_cpu_port(ds, port)) {
                               ^
   drivers/net/dsa/qca8k.c:1026:26: error: use of undeclared identifier 'port'
           if (dsa_is_cpu_port(ds, port)) {
                                   ^
>> drivers/net/dsa/qca8k.c:1030:13: error: use of undeclared identifier 'state'
           } else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
                      ^
   drivers/net/dsa/qca8k.c:1033:13: error: use of undeclared identifier 'state'
           } else if (state->interface == PHY_INTERFACE_MODE_1000BASEX) {
                      ^
   drivers/net/dsa/qca8k.c:1281:11: warning: unused variable 'val' [-Wunused-variable]
           u32 reg, val;
                    ^
   drivers/net/dsa/qca8k.c:1282:6: warning: unused variable 'ret' [-Wunused-variable]
           int ret;
               ^
   2 warnings and 5 errors generated.


vim +/port +965 drivers/net/dsa/qca8k.c

   957	
   958	static void qca8k_pcs_get_state(struct phylink_pcs *pcs,
   959					struct phylink_link_state *state)
   960	{
   961		struct qca8k_priv *priv = pcs_to_qca8k_pcs(pcs)->priv;
   962		u32 reg;
   963		int ret;
   964	
 > 965		ret = qca8k_read(priv, QCA8K_REG_PORT_STATUS(port), &reg);
   966		if (ret < 0) {
   967			state->link = false;
   968			return;
   969		}
   970	
   971		state->link = !!(reg & QCA8K_PORT_STATUS_LINK_UP);
   972		state->an_complete = state->link;
   973		state->an_enabled = !!(reg & QCA8K_PORT_STATUS_LINK_AUTO);
   974		state->duplex = (reg & QCA8K_PORT_STATUS_DUPLEX) ? DUPLEX_FULL :
   975								   DUPLEX_HALF;
   976	
   977		switch (reg & QCA8K_PORT_STATUS_SPEED) {
   978		case QCA8K_PORT_STATUS_SPEED_10:
   979			state->speed = SPEED_10;
   980			break;
   981		case QCA8K_PORT_STATUS_SPEED_100:
   982			state->speed = SPEED_100;
   983			break;
   984		case QCA8K_PORT_STATUS_SPEED_1000:
   985			state->speed = SPEED_1000;
   986			break;
   987		default:
   988			state->speed = SPEED_UNKNOWN;
   989			break;
   990		}
   991	
   992		state->pause = MLO_PAUSE_NONE;
   993		if (reg & QCA8K_PORT_STATUS_RXFLOW)
   994			state->pause |= MLO_PAUSE_RX;
   995		if (reg & QCA8K_PORT_STATUS_TXFLOW)
   996			state->pause |= MLO_PAUSE_TX;
   997	}
   998	
   999	static int qca8k_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
  1000				    phy_interface_t interface,
  1001				    const unsigned long *advertising,
  1002				    bool permit_pause_to_mac)
  1003	{
  1004		struct qca8k_priv *priv = pcs_to_qca8k_pcs(pcs)->priv;
  1005		u32 val;
  1006		int ret;
  1007	
  1008		/* Enable/disable SerDes auto-negotiation as necessary */
  1009		ret = qca8k_read(priv, QCA8K_REG_PWS, &val);
  1010		if (ret)
  1011			return ret;
  1012		if (phylink_autoneg_inband(mode))
  1013			val &= ~QCA8K_PWS_SERDES_AEN_DIS;
  1014		else
  1015			val |= QCA8K_PWS_SERDES_AEN_DIS;
  1016		qca8k_write(priv, QCA8K_REG_PWS, val);
  1017	
  1018		/* Configure the SGMII parameters */
  1019		ret = qca8k_read(priv, QCA8K_REG_SGMII_CTRL, &val);
  1020		if (ret)
  1021			return ret;
  1022	
  1023		val |= QCA8K_SGMII_EN_PLL | QCA8K_SGMII_EN_RX |
  1024		       QCA8K_SGMII_EN_TX | QCA8K_SGMII_EN_SD;
  1025	
> 1026		if (dsa_is_cpu_port(ds, port)) {
  1027			/* CPU port, we're talking to the CPU MAC, be a PHY */
  1028			val &= ~QCA8K_SGMII_MODE_CTRL_MASK;
  1029			val |= QCA8K_SGMII_MODE_CTRL_PHY;
> 1030		} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
  1031			val &= ~QCA8K_SGMII_MODE_CTRL_MASK;
  1032			val |= QCA8K_SGMII_MODE_CTRL_MAC;
  1033		} else if (state->interface == PHY_INTERFACE_MODE_1000BASEX) {
  1034			val &= ~QCA8K_SGMII_MODE_CTRL_MASK;
  1035			val |= QCA8K_SGMII_MODE_CTRL_BASEX;
  1036		}
  1037	
  1038		qca8k_write(priv, QCA8K_REG_SGMII_CTRL, val);
  1039	
  1040		return 0;
  1041	}
  1042	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
