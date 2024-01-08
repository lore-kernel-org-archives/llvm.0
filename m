Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42A11711;
	Mon,  8 Jan 2024 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWMaPPU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704706262; x=1736242262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E62yb6m6HTmEbGX9G2MZ0Cv44SIxbiKEXobterk8kn8=;
  b=WWMaPPU2FQBXNPEFEmm+aqJc4nalq1Mkum8PG/XtrPcqj9OgF0760x/o
   2WPp/lyAhfOjqq0CvL0azHvl6L13znnRj1uvE01vk/kI924Ri/CWpwa1k
   sabeyx1WRIcX5iUgj5c+zlwlNxbiFfjLav2BDqdA/HXnCbfycEs1irpKx
   HHCu/MD0x8pNZ2JOD0fipLnnHOZffsSS+05SbFrsrmFGvSo27Ye6Rc+Wo
   fEiHCPdW0ZeKUR2738tNik9iAyGZuAqz8HojZ8qKJAaS9kqLUrMwCs75z
   gnbHgcgGaFt+/rBy3umIfV80ZgEp/5BUbvQmUN0NrLPyV/NWm3XqdMVpX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="401624447"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="401624447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:31:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="15868033"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2024 01:30:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMlyA-0004a8-3D;
	Mon, 08 Jan 2024 09:30:55 +0000
Date: Mon, 8 Jan 2024 17:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc6-net-next-mv88e6xxx-leds-v3 8/8]
 drivers/net/dsa/qca/qca8k-leds.c:84:1: warning: no previous prototype for
 function 'qca8k_led_brightness_set'
Message-ID: <202401081748.rICFp8NY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc6-net-next-mv88e6xxx-leds-v3
head:   9a48ae1a616c32799d10fcde6a9eea1bbade8496
commit: 9a48ae1a616c32799d10fcde6a9eea1bbade8496 [8/8] dsa: qca8k: Use netdev_leds common code for LEDs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240108/202401081748.rICFp8NY-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081748.rICFp8NY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081748.rICFp8NY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-leds.c:84:1: warning: no previous prototype for function 'qca8k_led_brightness_set' [-Wmissing-prototypes]
      84 | qca8k_led_brightness_set(struct net_device *ndev, u8 led_num,
         | ^
   drivers/net/dsa/qca/qca8k-leds.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | int
         | ^
         | static 
>> drivers/net/dsa/qca/qca8k-leds.c:148:1: warning: no previous prototype for function 'qca8k_led_blink_set' [-Wmissing-prototypes]
     148 | qca8k_led_blink_set(struct net_device *ndev, u8 led_num,
         | ^
   drivers/net/dsa/qca/qca8k-leds.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | int
         | ^
         | static 
>> drivers/net/dsa/qca/qca8k-leds.c:233:1: warning: no previous prototype for function 'qca8k_led_hw_control_is_supported' [-Wmissing-prototypes]
     233 | qca8k_led_hw_control_is_supported(struct net_device *ndev, u8 led,
         | ^
   drivers/net/dsa/qca/qca8k-leds.c:232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     232 | int
         | ^
         | static 
>> drivers/net/dsa/qca/qca8k-leds.c:242:1: warning: no previous prototype for function 'qca8k_led_hw_control_set' [-Wmissing-prototypes]
     242 | qca8k_led_hw_control_set(struct net_device *ndev, u8 led_num,
         | ^
   drivers/net/dsa/qca/qca8k-leds.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     241 | int
         | ^
         | static 
>> drivers/net/dsa/qca/qca8k-leds.c:271:1: warning: no previous prototype for function 'qca8k_led_hw_control_get' [-Wmissing-prototypes]
     271 | qca8k_led_hw_control_get(struct net_device *ndev, u8 led_num,
         | ^
   drivers/net/dsa/qca/qca8k-leds.c:270:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     270 | int
         | ^
         | static 
   5 warnings generated.


vim +/qca8k_led_brightness_set +84 drivers/net/dsa/qca/qca8k-leds.c

    82	
    83	int
  > 84	qca8k_led_brightness_set(struct net_device *ndev, u8 led_num,
    85				 enum led_brightness brightness)
    86	{
    87		struct dsa_switch *ds = dsa_user_to_ds(ndev);
    88		struct qca8k_led_pattern_en reg_info;
    89		struct qca8k_priv *priv = ds->priv;
    90		int port = dsa_user_to_index(ndev);
    91		u32 mask, val;
    92		int port_num;
    93	
    94		port_num = qca8k_port_to_phy(port);
    95		qca8k_get_enable_led_reg(port_num, led_num, &reg_info);
    96	
    97		val = QCA8K_LED_ALWAYS_OFF;
    98		if (brightness)
    99			val = QCA8K_LED_ALWAYS_ON;
   100	
   101		/* HW regs to control brightness is special and port 1-2-3
   102		 * are placed in a different reg.
   103		 *
   104		 * To control port 0 brightness:
   105		 * - the 2 bit (15, 14) of:
   106		 *   - QCA8K_LED_CTRL0_REG for led1
   107		 *   - QCA8K_LED_CTRL1_REG for led2
   108		 *   - QCA8K_LED_CTRL2_REG for led3
   109		 *
   110		 * To control port 4:
   111		 * - the 2 bit (31, 30) of:
   112		 *   - QCA8K_LED_CTRL0_REG for led1
   113		 *   - QCA8K_LED_CTRL1_REG for led2
   114		 *   - QCA8K_LED_CTRL2_REG for led3
   115		 *
   116		 * To control port 1:
   117		 *   - the 2 bit at (9, 8) of QCA8K_LED_CTRL3_REG are used for led1
   118		 *   - the 2 bit at (11, 10) of QCA8K_LED_CTRL3_REG are used for led2
   119		 *   - the 2 bit at (13, 12) of QCA8K_LED_CTRL3_REG are used for led3
   120		 *
   121		 * To control port 2:
   122		 *   - the 2 bit at (15, 14) of QCA8K_LED_CTRL3_REG are used for led1
   123		 *   - the 2 bit at (17, 16) of QCA8K_LED_CTRL3_REG are used for led2
   124		 *   - the 2 bit at (19, 18) of QCA8K_LED_CTRL3_REG are used for led3
   125		 *
   126		 * To control port 3:
   127		 *   - the 2 bit at (21, 20) of QCA8K_LED_CTRL3_REG are used for led1
   128		 *   - the 2 bit at (23, 22) of QCA8K_LED_CTRL3_REG are used for led2
   129		 *   - the 2 bit at (25, 24) of QCA8K_LED_CTRL3_REG are used for led3
   130		 *
   131		 * To abstract this and have less code, we use the port and led numm
   132		 * to calculate the shift and the correct reg due to this problem of
   133		 * not having a 1:1 map of LED with the regs.
   134		 */
   135		if (port_num == 0 || port_num == 4) {
   136			mask = QCA8K_LED_PATTERN_EN_MASK;
   137			val <<= QCA8K_LED_PATTERN_EN_SHIFT;
   138		} else {
   139			mask = QCA8K_LED_PHY123_PATTERN_EN_MASK;
   140		}
   141	
   142		return regmap_update_bits(priv->regmap, reg_info.reg,
   143					  mask << reg_info.shift,
   144					  val << reg_info.shift);
   145	}
   146	
   147	int
 > 148	qca8k_led_blink_set(struct net_device *ndev, u8 led_num,
   149			    unsigned long *delay_on, unsigned long *delay_off)
   150	{
   151		struct dsa_switch *ds = dsa_user_to_ds(ndev);
   152		u32 mask, val = QCA8K_LED_ALWAYS_BLINK_4HZ;
   153		struct qca8k_led_pattern_en reg_info;
   154		struct qca8k_priv *priv = ds->priv;
   155		int port = dsa_user_to_index(ndev);
   156		int port_num;
   157	
   158		port_num = qca8k_port_to_phy(port);
   159	
   160		if (*delay_on == 0 && *delay_off == 0) {
   161			*delay_on = 125;
   162			*delay_off = 125;
   163		}
   164	
   165		if (*delay_on != 125 || *delay_off != 125) {
   166			/* The hardware only supports blinking at 4Hz. Fall back
   167			 * to software implementation in other cases.
   168			 */
   169			return -EINVAL;
   170		}
   171	
   172		qca8k_get_enable_led_reg(port_num, led_num, &reg_info);
   173	
   174		if (port_num == 0 || port_num == 4) {
   175			mask = QCA8K_LED_PATTERN_EN_MASK;
   176			val <<= QCA8K_LED_PATTERN_EN_SHIFT;
   177		} else {
   178			mask = QCA8K_LED_PHY123_PATTERN_EN_MASK;
   179		}
   180	
   181		regmap_update_bits(priv->regmap, reg_info.reg, mask << reg_info.shift,
   182				   val << reg_info.shift);
   183	
   184		return 0;
   185	}
   186	
   187	static int
   188	qca8k_led_trigger_offload(struct qca8k_priv *priv, int port_num, u8 led_num,
   189				  bool enable)
   190	{
   191		struct qca8k_led_pattern_en reg_info;
   192		u32 mask, val = QCA8K_LED_ALWAYS_OFF;
   193	
   194		qca8k_get_enable_led_reg(port_num, led_num, &reg_info);
   195	
   196		if (enable)
   197			val = QCA8K_LED_RULE_CONTROLLED;
   198	
   199		if (port_num == 0 || port_num == 4) {
   200			mask = QCA8K_LED_PATTERN_EN_MASK;
   201			val <<= QCA8K_LED_PATTERN_EN_SHIFT;
   202		} else {
   203			mask = QCA8K_LED_PHY123_PATTERN_EN_MASK;
   204		}
   205	
   206		return regmap_update_bits(priv->regmap, reg_info.reg, mask << reg_info.shift,
   207					  val << reg_info.shift);
   208	}
   209	
   210	static bool
   211	qca8k_led_hw_control_status(struct qca8k_priv *priv, int port_num, u8 led_num)
   212	{
   213		struct qca8k_led_pattern_en reg_info;
   214		u32 val;
   215	
   216		qca8k_get_enable_led_reg(port_num, led_num, &reg_info);
   217	
   218		regmap_read(priv->regmap, reg_info.reg, &val);
   219	
   220		val >>= reg_info.shift;
   221	
   222		if (port_num == 0 || port_num == 4) {
   223			val &= QCA8K_LED_PATTERN_EN_MASK;
   224			val >>= QCA8K_LED_PATTERN_EN_SHIFT;
   225		} else {
   226			val &= QCA8K_LED_PHY123_PATTERN_EN_MASK;
   227		}
   228	
   229		return val == QCA8K_LED_RULE_CONTROLLED;
   230	}
   231	
   232	int
 > 233	qca8k_led_hw_control_is_supported(struct net_device *ndev, u8 led,
   234					  unsigned long rules)
   235	{
   236		u32 offload_trigger = 0;
   237	
   238		return qca8k_parse_netdev(rules, &offload_trigger);
   239	}
   240	
   241	int
 > 242	qca8k_led_hw_control_set(struct net_device *ndev, u8 led_num,
   243				 unsigned long rules)
   244	{
   245		struct dsa_switch *ds = dsa_user_to_ds(ndev);
   246		struct qca8k_led_pattern_en reg_info;
   247		struct qca8k_priv *priv = ds->priv;
   248		int port = dsa_user_to_index(ndev);
   249		u32 offload_trigger = 0;
   250		int port_num;
   251		int ret;
   252	
   253		port_num = qca8k_port_to_phy(port);
   254	
   255		ret = qca8k_parse_netdev(rules, &offload_trigger);
   256		if (ret)
   257			return ret;
   258	
   259		ret = qca8k_led_trigger_offload(priv, port_num, led_num, true);
   260		if (ret)
   261			return ret;
   262	
   263		qca8k_get_control_led_reg(port_num, led_num, &reg_info);
   264	
   265		return regmap_update_bits(priv->regmap, reg_info.reg,
   266					  QCA8K_LED_RULE_MASK << reg_info.shift,
   267					  offload_trigger << reg_info.shift);
   268	}
   269	
   270	int
 > 271	qca8k_led_hw_control_get(struct net_device *ndev, u8 led_num,
   272				 unsigned long *rules)
   273	{
   274		struct dsa_switch *ds = dsa_user_to_ds(ndev);
   275		struct qca8k_led_pattern_en reg_info;
   276		struct qca8k_priv *priv = ds->priv;
   277		int port = dsa_user_to_index(ndev);
   278		int port_num;
   279		u32 val;
   280		int ret;
   281	
   282		port_num = qca8k_port_to_phy(port);
   283	
   284		/* With hw control not active return err */
   285		if (!qca8k_led_hw_control_status(priv, port_num, led_num))
   286			return -EINVAL;
   287	
   288		qca8k_get_control_led_reg(port_num, led_num, &reg_info);
   289	
   290		ret = regmap_read(priv->regmap, reg_info.reg, &val);
   291		if (ret)
   292			return ret;
   293	
   294		val >>= reg_info.shift;
   295		val &= QCA8K_LED_RULE_MASK;
   296	
   297		/* Parsing specific to netdev trigger */
   298		if (val & QCA8K_LED_TX_BLINK_MASK)
   299			set_bit(TRIGGER_NETDEV_TX, rules);
   300		if (val & QCA8K_LED_RX_BLINK_MASK)
   301			set_bit(TRIGGER_NETDEV_RX, rules);
   302		if (val & QCA8K_LED_LINK_10M_EN_MASK)
   303			set_bit(TRIGGER_NETDEV_LINK_10, rules);
   304		if (val & QCA8K_LED_LINK_100M_EN_MASK)
   305			set_bit(TRIGGER_NETDEV_LINK_100, rules);
   306		if (val & QCA8K_LED_LINK_1000M_EN_MASK)
   307			set_bit(TRIGGER_NETDEV_LINK_1000, rules);
   308		if (val & QCA8K_LED_HALF_DUPLEX_MASK)
   309			set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
   310		if (val & QCA8K_LED_FULL_DUPLEX_MASK)
   311			set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
   312	
   313		return 0;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
