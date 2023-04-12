Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE763C02;
	Wed, 12 Apr 2023 19:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681326565; x=1712862565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ffpx6BIgKzZteyb//gSQO/b401PrP2Mpz/F5h/jfzBc=;
  b=eMpEKPGYSE6hH9HwmW/XZ+KZKp6tyxWnkqc8px/KHRTGnqqWFL1sXSv+
   4+zWSwldj8HYGEd98vpPFHtWeQ4GittkyAKAmfvfs0goWFMb0c69dfGKt
   3uWniTzlJJ77LOENDKlyQYU1TxSh0U3QoZl+Jia/ny+/6q56xxWVPdP4s
   2sxklvA8YURfsNSb0vHdnjgskgWE4I0728H3vTSV4p98JqtkwKTLxzjjJ
   NoBCyqagRLs2XA2RVjU5+8pOQb8bbaHyzCpCYyI6fD6EWL3E/9sNMskGN
   Ji53O1L1lZtVgHSu5D+mzkwDK6l8sZgVlFS0f3xq229U6/4Em7TScTfjx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323618594"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323618594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 12:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758355965"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="758355965"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2023 12:09:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmfqL-000Y0N-1h;
	Wed, 12 Apr 2023 19:09:21 +0000
Date: Thu, 13 Apr 2023 03:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, Kishon <kishon@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [phy:next 72/77] drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202304130304.gMtrUdbd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   45810d486bb44bd60213d5f09a713df81b987972
commit: 45810d486bb44bd60213d5f09a713df81b987972 [72/77] phy: mediatek: add support for phy-mtk-hdmi-mt8195
config: arm64-buildonly-randconfig-r005-20230409 (https://download.01.org/0day-ci/archive/20230413/202304130304.gMtrUdbd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?id=45810d486bb44bd60213d5f09a713df81b987972
        git remote add phy https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
        git fetch --no-tags phy next
        git checkout 45810d486bb44bd60213d5f09a713df81b987972
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130304.gMtrUdbd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret)
               ^~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the variable 'ret' to silence this warning
           int i, ret;
                     ^
                      = 0
   1 warning generated.


vim +/ret +298 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

   208	
   209	static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
   210				     unsigned long rate, unsigned long parent_rate)
   211	{
   212		u8 digital_div, txprediv, txposdiv, fbkdiv_high, posdiv1, posdiv2;
   213		u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
   214		u8 txpredivs[4] = { 2, 4, 6, 12 };
   215		u32 fbkdiv_low;
   216		int i, ret;
   217	
   218		pixel_clk = rate;
   219		tmds_clk = pixel_clk;
   220	
   221		if (tmds_clk < 25 * MEGA || tmds_clk > 594 * MEGA)
   222			return -EINVAL;
   223	
   224		if (tmds_clk >= 340 * MEGA)
   225			hdmi_phy->tmds_over_340M = true;
   226		else
   227			hdmi_phy->tmds_over_340M = false;
   228	
   229		/* in Hz */
   230		da_hdmitx21_ref_ck = 26 * MEGA;
   231	
   232		/*  TXPOSDIV stage treatment:
   233		 *	0M  <  TMDS clk  < 54M		  /8
   234		 *	54M <= TMDS clk  < 148.35M    /4
   235		 *	148.35M <=TMDS clk < 296.7M   /2
   236		 *	296.7 <=TMDS clk <= 594M	  /1
   237		 */
   238		if (tmds_clk < 54 * MEGA)
   239			txposdiv = 8;
   240		else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
   241			txposdiv = 4;
   242		else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
   243			txposdiv = 2;
   244		else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
   245			txposdiv = 1;
   246		else
   247			return -EINVAL;
   248	
   249		/* calculate txprediv: can be 2, 4, 6, 12
   250		 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
   251		 * ICO clk constraint: 5G =< ICO clk <= 12G
   252		 */
   253		for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
   254			ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
   255			if (ns_hdmipll_ck >= 5 * GIGA &&
   256			    ns_hdmipll_ck <= 1 * GIGA)
   257				break;
   258		}
   259		if (i == (ARRAY_SIZE(txpredivs) - 1) &&
   260		    (ns_hdmipll_ck < 5 * GIGA || ns_hdmipll_ck > 12 * GIGA)) {
   261			return -EINVAL;
   262		}
   263		if (i == ARRAY_SIZE(txpredivs))
   264			return -EINVAL;
   265	
   266		txprediv = txpredivs[i];
   267	
   268		/* PCW calculation: FBKDIV
   269		 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
   270		 * RG_HDMITXPLL_FBKDIV[32:0]:
   271		 * [32,24] 9bit integer, [23,0]:24bit fraction
   272		 */
   273		pcw = div_u64(((u64)ns_hdmipll_ck) << PCW_DECIMAL_WIDTH,
   274			      da_hdmitx21_ref_ck / PLL_FBKDIV_HS3);
   275	
   276		if (pcw > GENMASK_ULL(32, 0))
   277			return -EINVAL;
   278	
   279		fbkdiv_high = FIELD_GET(GENMASK_ULL(63, 32), pcw);
   280		fbkdiv_low = FIELD_GET(GENMASK(31, 0), pcw);
   281	
   282		/* posdiv1:
   283		 * posdiv1 stage treatment according to color_depth:
   284		 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
   285		 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
   286		 */
   287		posdiv1 = 10;
   288		posdiv2 = 1;
   289	
   290		/* Digital clk divider, max /32 */
   291		digital_div = div_u64((u64)ns_hdmipll_ck, posdiv1 / posdiv2 / pixel_clk);
   292		if (!(digital_div <= 32 && digital_div >= 1))
   293			return -EINVAL;
   294	
   295		mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
   296				    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
   297				    txposdiv, digital_div);
 > 298		if (ret)
   299			return -EINVAL;
   300	
   301		return 0;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
