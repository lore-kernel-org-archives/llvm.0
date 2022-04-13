Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E63205
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649894162; x=1681430162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YTCAEizeWjGFYCoBtdwEc+NIm7elQZ3mWkhxu6jtrwY=;
  b=Ly8y2G2XE9TgmemEvGUD5626ubBsNyTszhLb8IN9Su0ZI+Kg7BNcg16+
   KWXZbV/BkSXBVLtUwYYFadEhdZ2AmNjLstOP77djSuewyvClGoarvAC+j
   ReBhZNSZdfoo+Ya71BPnDosWmUtQkzHsbjeT9bEMctLo8uRD15DEmsrhc
   NCJMq+AVY8W/DvHCbxEGcNZYIHQF2wwvXw6BME3Qy0prPiofzNn5LBeow
   l3WeifVBJEQR+yKMoeA3L3g8OPqoZQjmVkS0P4m9T+fbtnqC33JAImYUk
   kVwWhlHczKZ4fS32VV5Z5A35UoLIfGozTwiC6c74fRHpi3kqfiBXjMPu5
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="325714206"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="325714206"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 16:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="725112851"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2022 16:56:00 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nemq7-0000iV-Do;
	Wed, 13 Apr 2022 23:55:59 +0000
Date: Thu, 14 Apr 2022 07:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 29/148] drivers/net/dsa/qca8k.c:2019:35: error: use of
 undeclared identifier 'QCA8K_PORT_HDR_CTRL_TX_S'
Message-ID: <202204140713.JrQRjyn9-lkp@intel.com>
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
head:   f7f457316668e27df5e5cefed714c7f5d02f36a2
commit: 7fc30ee3ac28c33836657fa660f8bc904e67a6c7 [29/148] net: dsa: qca8k: move qca8k_setup()
config: hexagon-buildonly-randconfig-r006-20220413 (https://download.01.org/0day-ci/archive/20220414/202204140713.JrQRjyn9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 7fc30ee3ac28c33836657fa660f8bc904e67a6c7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca8k.c:2019:35: error: use of undeclared identifier 'QCA8K_PORT_HDR_CTRL_TX_S'
                                             QCA8K_PORT_HDR_CTRL_ALL << QCA8K_PORT_HDR_CTRL_TX_S |
                                                                        ^
>> drivers/net/dsa/qca8k.c:2020:35: error: use of undeclared identifier 'QCA8K_PORT_HDR_CTRL_RX_S'
                                             QCA8K_PORT_HDR_CTRL_ALL << QCA8K_PORT_HDR_CTRL_RX_S);
                                                                        ^
>> drivers/net/dsa/qca8k.c:2037:23: error: use of undeclared identifier 'QCA8K_GLOBAL_FW_CTRL1_IGMP_DP_S'
                             BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_IGMP_DP_S |
                                              ^
>> drivers/net/dsa/qca8k.c:2038:23: error: use of undeclared identifier 'QCA8K_GLOBAL_FW_CTRL1_BC_DP_S'
                             BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_BC_DP_S |
                                              ^
>> drivers/net/dsa/qca8k.c:2039:23: error: use of undeclared identifier 'QCA8K_GLOBAL_FW_CTRL1_MC_DP_S'
                             BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_MC_DP_S |
                                              ^
>> drivers/net/dsa/qca8k.c:2040:23: error: use of undeclared identifier 'QCA8K_GLOBAL_FW_CTRL1_UC_DP_S'
                             BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_UC_DP_S);
                                              ^
>> drivers/net/dsa/qca8k.c:2124:7: error: use of undeclared identifier 'QCA8K_PORT_HOL_CTRL1_ING_BUF'
                                     QCA8K_PORT_HOL_CTRL1_ING_BUF |
                                     ^
>> drivers/net/dsa/qca8k.c:2147:6: error: use of undeclared identifier 'QCA8K_GLOBAL_FC_GOL_XON_THRES_S'
                             QCA8K_GLOBAL_FC_GOL_XON_THRES_S |
                             ^
>> drivers/net/dsa/qca8k.c:2148:6: error: use of undeclared identifier 'QCA8K_GLOBAL_FC_GOL_XOFF_THRES_S'
                             QCA8K_GLOBAL_FC_GOL_XOFF_THRES_S,
                             ^
   9 errors generated.


vim +/QCA8K_PORT_HDR_CTRL_TX_S +2019 drivers/net/dsa/qca8k.c

  1948	
  1949	static int
  1950	qca8k_setup(struct dsa_switch *ds)
  1951	{
  1952		struct qca8k_priv *priv = (struct qca8k_priv *)ds->priv;
  1953		int cpu_port, ret, i;
  1954		u32 mask;
  1955	
  1956		cpu_port = qca8k_find_cpu_port(ds);
  1957		if (cpu_port < 0) {
  1958			dev_err(priv->dev, "No cpu port configured in both cpu port0 and port6");
  1959			return cpu_port;
  1960		}
  1961	
  1962		/* Parse CPU port config to be later used in phy_link mac_config */
  1963		ret = qca8k_parse_port_config(priv);
  1964		if (ret)
  1965			return ret;
  1966	
  1967		mutex_init(&priv->reg_mutex);
  1968	
  1969		/* Start by setting up the register mapping */
  1970		priv->regmap = devm_regmap_init(ds->dev, NULL, priv,
  1971						&qca8k_regmap_config);
  1972		if (IS_ERR(priv->regmap))
  1973			dev_warn(priv->dev, "regmap initialization failed");
  1974	
  1975		ret = qca8k_setup_mdio_bus(priv);
  1976		if (ret)
  1977			return ret;
  1978	
  1979		ret = qca8k_setup_of_pws_reg(priv);
  1980		if (ret)
  1981			return ret;
  1982	
  1983		ret = qca8k_setup_mac_pwr_sel(priv);
  1984		if (ret)
  1985			return ret;
  1986	
  1987		/* Make sure MAC06 is disabled */
  1988		ret = regmap_clear_bits(priv->regmap, QCA8K_REG_PORT0_PAD_CTRL,
  1989					QCA8K_PORT0_PAD_MAC06_EXCHANGE_EN);
  1990		if (ret) {
  1991			dev_err(priv->dev, "failed disabling MAC06 exchange");
  1992			return ret;
  1993		}
  1994	
  1995		/* Enable CPU Port */
  1996		ret = regmap_set_bits(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0,
  1997				      QCA8K_GLOBAL_FW_CTRL0_CPU_PORT_EN);
  1998		if (ret) {
  1999			dev_err(priv->dev, "failed enabling CPU port");
  2000			return ret;
  2001		}
  2002	
  2003		/* Enable MIB counters */
  2004		ret = qca8k_mib_init(priv);
  2005		if (ret)
  2006			dev_warn(priv->dev, "mib init failed");
  2007	
  2008		/* Initial setup of all ports */
  2009		for (i = 0; i < QCA8K_NUM_PORTS; i++) {
  2010			/* Disable forwarding by default on all ports */
  2011			ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(i),
  2012					QCA8K_PORT_LOOKUP_MEMBER, 0);
  2013			if (ret)
  2014				return ret;
  2015	
  2016			/* Enable QCA header mode on all cpu ports */
  2017			if (dsa_is_cpu_port(ds, i)) {
  2018				ret = qca8k_write(priv, QCA8K_REG_PORT_HDR_CTRL(i),
> 2019						  QCA8K_PORT_HDR_CTRL_ALL << QCA8K_PORT_HDR_CTRL_TX_S |
> 2020						  QCA8K_PORT_HDR_CTRL_ALL << QCA8K_PORT_HDR_CTRL_RX_S);
  2021				if (ret) {
  2022					dev_err(priv->dev, "failed enabling QCA header mode");
  2023					return ret;
  2024				}
  2025			}
  2026	
  2027			/* Disable MAC by default on all user ports */
  2028			if (dsa_is_user_port(ds, i))
  2029				qca8k_port_set_status(priv, i, 0);
  2030		}
  2031	
  2032		/* Forward all unknown frames to CPU port for Linux processing
  2033		 * Notice that in multi-cpu config only one port should be set
  2034		 * for igmp, unknown, multicast and broadcast packet
  2035		 */
  2036		ret = qca8k_write(priv, QCA8K_REG_GLOBAL_FW_CTRL1,
> 2037				  BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_IGMP_DP_S |
> 2038				  BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_BC_DP_S |
> 2039				  BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_MC_DP_S |
> 2040				  BIT(cpu_port) << QCA8K_GLOBAL_FW_CTRL1_UC_DP_S);
  2041		if (ret)
  2042			return ret;
  2043	
  2044		/* Setup connection between CPU port & user ports
  2045		 * Configure specific switch configuration for ports
  2046		 */
  2047		for (i = 0; i < QCA8K_NUM_PORTS; i++) {
  2048			/* CPU port gets connected to all user ports of the switch */
  2049			if (dsa_is_cpu_port(ds, i)) {
  2050				ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(i),
  2051						QCA8K_PORT_LOOKUP_MEMBER, dsa_user_ports(ds));
  2052				if (ret)
  2053					return ret;
  2054			}
  2055	
  2056			/* Individual user ports get connected to CPU port only */
  2057			if (dsa_is_user_port(ds, i)) {
  2058				int shift = 16 * (i % 2);
  2059	
  2060				ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(i),
  2061						QCA8K_PORT_LOOKUP_MEMBER,
  2062						BIT(cpu_port));
  2063				if (ret)
  2064					return ret;
  2065	
  2066				/* Enable ARP Auto-learning by default */
  2067				ret = regmap_set_bits(priv->regmap, QCA8K_PORT_LOOKUP_CTRL(i),
  2068						      QCA8K_PORT_LOOKUP_LEARN);
  2069				if (ret)
  2070					return ret;
  2071	
  2072				/* For port based vlans to work we need to set the
  2073				 * default egress vid
  2074				 */
  2075				ret = qca8k_rmw(priv, QCA8K_EGRESS_VLAN(i),
  2076						0xfff << shift,
  2077						QCA8K_PORT_VID_DEF << shift);
  2078				if (ret)
  2079					return ret;
  2080	
  2081				ret = qca8k_write(priv, QCA8K_REG_PORT_VLAN_CTRL0(i),
  2082						  QCA8K_PORT_VLAN_CVID(QCA8K_PORT_VID_DEF) |
  2083						  QCA8K_PORT_VLAN_SVID(QCA8K_PORT_VID_DEF));
  2084				if (ret)
  2085					return ret;
  2086			}
  2087	
  2088			/* The port 5 of the qca8337 have some problem in flood condition. The
  2089			 * original legacy driver had some specific buffer and priority settings
  2090			 * for the different port suggested by the QCA switch team. Add this
  2091			 * missing settings to improve switch stability under load condition.
  2092			 * This problem is limited to qca8337 and other qca8k switch are not affected.
  2093			 */
  2094			if (priv->switch_id == QCA8K_ID_QCA8337) {
  2095				switch (i) {
  2096				/* The 2 CPU port and port 5 requires some different
  2097				 * priority than any other ports.
  2098				 */
  2099				case 0:
  2100				case 5:
  2101				case 6:
  2102					mask = QCA8K_PORT_HOL_CTRL0_EG_PRI0(0x3) |
  2103						QCA8K_PORT_HOL_CTRL0_EG_PRI1(0x4) |
  2104						QCA8K_PORT_HOL_CTRL0_EG_PRI2(0x4) |
  2105						QCA8K_PORT_HOL_CTRL0_EG_PRI3(0x4) |
  2106						QCA8K_PORT_HOL_CTRL0_EG_PRI4(0x6) |
  2107						QCA8K_PORT_HOL_CTRL0_EG_PRI5(0x8) |
  2108						QCA8K_PORT_HOL_CTRL0_EG_PORT(0x1e);
  2109					break;
  2110				default:
  2111					mask = QCA8K_PORT_HOL_CTRL0_EG_PRI0(0x3) |
  2112						QCA8K_PORT_HOL_CTRL0_EG_PRI1(0x4) |
  2113						QCA8K_PORT_HOL_CTRL0_EG_PRI2(0x6) |
  2114						QCA8K_PORT_HOL_CTRL0_EG_PRI3(0x8) |
  2115						QCA8K_PORT_HOL_CTRL0_EG_PORT(0x19);
  2116				}
  2117				qca8k_write(priv, QCA8K_REG_PORT_HOL_CTRL0(i), mask);
  2118	
  2119				mask = QCA8K_PORT_HOL_CTRL1_ING(0x6) |
  2120				QCA8K_PORT_HOL_CTRL1_EG_PRI_BUF_EN |
  2121				QCA8K_PORT_HOL_CTRL1_EG_PORT_BUF_EN |
  2122				QCA8K_PORT_HOL_CTRL1_WRED_EN;
  2123				qca8k_rmw(priv, QCA8K_REG_PORT_HOL_CTRL1(i),
> 2124					  QCA8K_PORT_HOL_CTRL1_ING_BUF |
  2125					  QCA8K_PORT_HOL_CTRL1_EG_PRI_BUF_EN |
  2126					  QCA8K_PORT_HOL_CTRL1_EG_PORT_BUF_EN |
  2127					  QCA8K_PORT_HOL_CTRL1_WRED_EN,
  2128					  mask);
  2129			}
  2130	
  2131			/* Set initial MTU for every port.
  2132			 * We have only have a general MTU setting. So track
  2133			 * every port and set the max across all port.
  2134			 * Set per port MTU to 1500 as the MTU change function
  2135			 * will add the overhead and if its set to 1518 then it
  2136			 * will apply the overhead again and we will end up with
  2137			 * MTU of 1536 instead of 1518
  2138			 */
  2139			priv->port_mtu[i] = ETH_DATA_LEN;
  2140		}
  2141	
  2142		/* Special GLOBAL_FC_THRESH value are needed for ar8327 switch */
  2143		if (priv->switch_id == QCA8K_ID_QCA8327) {
  2144			mask = QCA8K_GLOBAL_FC_GOL_XON_THRES(288) |
  2145			       QCA8K_GLOBAL_FC_GOL_XOFF_THRES(496);
  2146			qca8k_rmw(priv, QCA8K_REG_GLOBAL_FC_THRESH,
> 2147				  QCA8K_GLOBAL_FC_GOL_XON_THRES_S |
> 2148				  QCA8K_GLOBAL_FC_GOL_XOFF_THRES_S,
  2149				  mask);
  2150		}
  2151	
  2152		/* Setup our port MTUs to match power on defaults */
  2153		ret = qca8k_write(priv, QCA8K_MAX_FRAME_SIZE, ETH_FRAME_LEN + ETH_FCS_LEN);
  2154		if (ret)
  2155			dev_warn(priv->dev, "failed setting MTU settings");
  2156	
  2157		/* Flush the FDB table */
  2158		qca8k_fdb_flush(priv);
  2159	
  2160		/* We don't have interrupts for link changes, so we need to poll */
  2161		ds->pcs_poll = true;
  2162	
  2163		/* Set min a max ageing value supported */
  2164		ds->ageing_time_min = 7000;
  2165		ds->ageing_time_max = 458745000;
  2166	
  2167		/* Set max number of LAGs supported */
  2168		ds->num_lag_ids = QCA8K_NUM_LAGS;
  2169	
  2170		return 0;
  2171	}
  2172	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
