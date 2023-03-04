Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0792585;
	Sat,  4 Mar 2023 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677951544; x=1709487544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vLspNPMG1b7G7zSi9YS6/tZC0/lDn9NzL5FWhEQA0BU=;
  b=grIkLogGv6bznK54ALdw7DwsBRplWUBv1Yy6pJd0LE54mzE8iMwFDo54
   c8xKyNpCx2fYM+VMBlwIjNjIy4bcPGlU5HcL0BNuPJCgvS9dWTlkaGrNq
   auNMp4s+KWnI6mZ8Pg4YzIewJlGPmhnAxNAUbYNrSDK1NQ2Dh5RKtqHw4
   dZ1QvZUbd2kNbOOedrgqX5kkD6kDAgLRHAJkgJq8Him47Cv6WLdxOK8ZK
   mvgZC80dXRmdgPqj8+CRGcneJ2ppczzuSYbfl7f5VOutSg4N6YH4hrqH9
   5x9yxwriBKO3+LS3cnjn6jPe6Xj3y08JAde6e8NByBxqkHUZL6zXKiSnr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="337602401"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="337602401"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 09:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="708181144"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="708181144"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Mar 2023 09:39:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYVqY-0002HO-0R;
	Sat, 04 Mar 2023 17:39:02 +0000
Date: Sun, 5 Mar 2023 01:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: arinc9.unal@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6
 pad configuration
Message-ID: <202303050127.M8FXXFiW-lkp@intel.com>
References: <20230304125453.53476-1-arinc.unal@arinc9.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230304125453.53476-1-arinc.unal@arinc9.com>

Hi,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/arinc9-unal-gmail-com/net-dsa-mt7530-move-PLL-setup-out-of-port-6-pad-configuration/20230304-205859
patch link:    https://lore.kernel.org/r/20230304125453.53476-1-arinc.unal%40arinc9.com
patch subject: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6 pad configuration
config: hexagon-randconfig-r041-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050127.M8FXXFiW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e1d5d3c9e6556aea7296af456923103eaeeb7a22
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review arinc9-unal-gmail-com/net-dsa-mt7530-move-PLL-setup-out-of-port-6-pad-configuration/20230304-205859
        git checkout e1d5d3c9e6556aea7296af456923103eaeeb7a22
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303050127.M8FXXFiW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/mt7530.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/dsa/mt7530.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/dsa/mt7530.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/net/dsa/mt7530.c:2223:29: warning: variable 'interface' is uninitialized when used here [-Wuninitialized]
           mt7530_pad_clk_setup(priv, interface);
                                      ^~~~~~~~~
   drivers/net/dsa/mt7530.c:2144:2: note: variable 'interface' is declared here
           phy_interface_t interface;
           ^
   7 warnings generated.


vim +/interface +2223 drivers/net/dsa/mt7530.c

  2135	
  2136	static int
  2137	mt7530_setup(struct dsa_switch *ds)
  2138	{
  2139		struct mt7530_priv *priv = ds->priv;
  2140		struct device_node *dn = NULL;
  2141		struct device_node *phy_node;
  2142		struct device_node *mac_np;
  2143		struct mt7530_dummy_poll p;
  2144		phy_interface_t interface;
  2145		struct dsa_port *cpu_dp;
  2146		u32 id, val;
  2147		int ret, i;
  2148	
  2149		/* The parent node of master netdev which holds the common system
  2150		 * controller also is the container for two GMACs nodes representing
  2151		 * as two netdev instances.
  2152		 */
  2153		dsa_switch_for_each_cpu_port(cpu_dp, ds) {
  2154			dn = cpu_dp->master->dev.of_node->parent;
  2155			/* It doesn't matter which CPU port is found first,
  2156			 * their masters should share the same parent OF node
  2157			 */
  2158			break;
  2159		}
  2160	
  2161		if (!dn) {
  2162			dev_err(ds->dev, "parent OF node of DSA master not found");
  2163			return -EINVAL;
  2164		}
  2165	
  2166		ds->assisted_learning_on_cpu_port = true;
  2167		ds->mtu_enforcement_ingress = true;
  2168	
  2169		if (priv->id == ID_MT7530) {
  2170			regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
  2171			ret = regulator_enable(priv->core_pwr);
  2172			if (ret < 0) {
  2173				dev_err(priv->dev,
  2174					"Failed to enable core power: %d\n", ret);
  2175				return ret;
  2176			}
  2177	
  2178			regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
  2179			ret = regulator_enable(priv->io_pwr);
  2180			if (ret < 0) {
  2181				dev_err(priv->dev, "Failed to enable io pwr: %d\n",
  2182					ret);
  2183				return ret;
  2184			}
  2185		}
  2186	
  2187		/* Reset whole chip through gpio pin or memory-mapped registers for
  2188		 * different type of hardware
  2189		 */
  2190		if (priv->mcm) {
  2191			reset_control_assert(priv->rstc);
  2192			usleep_range(1000, 1100);
  2193			reset_control_deassert(priv->rstc);
  2194		} else {
  2195			gpiod_set_value_cansleep(priv->reset, 0);
  2196			usleep_range(1000, 1100);
  2197			gpiod_set_value_cansleep(priv->reset, 1);
  2198		}
  2199	
  2200		/* Waiting for MT7530 got to stable */
  2201		INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_HWTRAP);
  2202		ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
  2203					 20, 1000000);
  2204		if (ret < 0) {
  2205			dev_err(priv->dev, "reset timeout\n");
  2206			return ret;
  2207		}
  2208	
  2209		id = mt7530_read(priv, MT7530_CREV);
  2210		id >>= CHIP_NAME_SHIFT;
  2211		if (id != MT7530_ID) {
  2212			dev_err(priv->dev, "chip %x can't be supported\n", id);
  2213			return -ENODEV;
  2214		}
  2215	
  2216		/* Reset the switch through internal reset */
  2217		mt7530_write(priv, MT7530_SYS_CTRL,
  2218			     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
  2219			     SYS_CTRL_REG_RST);
  2220	
  2221		/* Setup switch core pll */
  2222		/* FIXME: feed the phy-mode of port 5 and 6, if the ports are defined on the devicetree */
> 2223		mt7530_pad_clk_setup(priv, interface);
  2224	
  2225		/* Enable Port 6 */
  2226		val = mt7530_read(priv, MT7530_MHWTRAP);
  2227		val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
  2228		val |= MHWTRAP_MANUAL;
  2229		mt7530_write(priv, MT7530_MHWTRAP, val);
  2230	
  2231		priv->p6_interface = PHY_INTERFACE_MODE_NA;
  2232	
  2233		/* Enable and reset MIB counters */
  2234		mt7530_mib_reset(ds);
  2235	
  2236		for (i = 0; i < MT7530_NUM_PORTS; i++) {
  2237			/* Disable forwarding by default on all ports */
  2238			mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
  2239				   PCR_MATRIX_CLR);
  2240	
  2241			/* Disable learning by default on all ports */
  2242			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
  2243	
  2244			if (dsa_is_cpu_port(ds, i)) {
  2245				ret = mt753x_cpu_port_enable(ds, i);
  2246				if (ret)
  2247					return ret;
  2248			} else {
  2249				mt7530_port_disable(ds, i);
  2250	
  2251				/* Set default PVID to 0 on all user ports */
  2252				mt7530_rmw(priv, MT7530_PPBV1_P(i), G0_PORT_VID_MASK,
  2253					   G0_PORT_VID_DEF);
  2254			}
  2255			/* Enable consistent egress tag */
  2256			mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
  2257				   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
  2258		}
  2259	
  2260		/* Setup VLAN ID 0 for VLAN-unaware bridges */
  2261		ret = mt7530_setup_vlan0(priv);
  2262		if (ret)
  2263			return ret;
  2264	
  2265		/* Setup port 5 */
  2266		priv->p5_intf_sel = P5_DISABLED;
  2267		interface = PHY_INTERFACE_MODE_NA;
  2268	
  2269		if (!dsa_is_unused_port(ds, 5)) {
  2270			priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
  2271			ret = of_get_phy_mode(dsa_to_port(ds, 5)->dn, &interface);
  2272			if (ret && ret != -ENODEV)
  2273				return ret;
  2274		} else {
  2275			/* Scan the ethernet nodes. look for GMAC1, lookup used phy */
  2276			for_each_child_of_node(dn, mac_np) {
  2277				if (!of_device_is_compatible(mac_np,
  2278							     "mediatek,eth-mac"))
  2279					continue;
  2280	
  2281				ret = of_property_read_u32(mac_np, "reg", &id);
  2282				if (ret < 0 || id != 1)
  2283					continue;
  2284	
  2285				phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
  2286				if (!phy_node)
  2287					continue;
  2288	
  2289				if (phy_node->parent == priv->dev->of_node->parent) {
  2290					ret = of_get_phy_mode(mac_np, &interface);
  2291					if (ret && ret != -ENODEV) {
  2292						of_node_put(mac_np);
  2293						of_node_put(phy_node);
  2294						return ret;
  2295					}
  2296					id = of_mdio_parse_addr(ds->dev, phy_node);
  2297					if (id == 0)
  2298						priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
  2299					if (id == 4)
  2300						priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
  2301				}
  2302				of_node_put(mac_np);
  2303				of_node_put(phy_node);
  2304				break;
  2305			}
  2306		}
  2307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
