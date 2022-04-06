Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5A17EC
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649263214; x=1680799214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/EHCaSLOa33p2ctDqP4hpxYEKGZwzl/tMLUHnhDwFg=;
  b=AOQ8SfBE+bMXC0EpC4ah88aScVi2gxqZ2F+HwYN6tgqADQ6Ta6n23d/J
   KaJTii5DicHBN2XWBOpWfTCZnkJgHrxwB2tdv6L4tvNBQ5ioYdlN2ifY0
   QTU5SdWLAD2leQbQaiam8oVnwySEHOA0o6mOglgKh+g9uQdVZnOMTSZMH
   qpLbLDdX+Fnxi94eR9hpLWMyfDV7IoZTvqrmHZLm54VywojQRTzU085kc
   FoCGbP/Qwlv+Nge13xM3G/zeicq8FbsYx/voB+qqbdUfJ7g2iixEoBgyy
   GXZZrEp7rH4HI6hWQHaeO96AgK2SX0hPRNL7Uua+z1bClPtCTotvyseJP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347542055"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="347542055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 09:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="722588789"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2022 09:40:11 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nc8hW-0004Yz-Gp;
	Wed, 06 Apr 2022 16:40:10 +0000
Date: Thu, 7 Apr 2022 00:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 829/1080]
 drivers/phy/xilinx/xhdmiphy.c:515:14: warning: overlapping comparisons
 always evaluate to false
Message-ID: <202204070035.WkY6laJ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   6474115d882fd9e82731ac2473875dc3e8ac9acc
commit: 36c089e1d56d6fdc8286459ba2f629eaa34a9198 [829/1080] phy: xilinx-xhdmiphy: initial driver support for xilinx HDMI PHY 2.1 IP
config: arm64-randconfig-r034-20220406 (https://download.01.org/0day-ci/archive/20220407/202204070035.WkY6laJ3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/36c089e1d56d6fdc8286459ba2f629eaa34a9198
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 36c089e1d56d6fdc8286459ba2f629eaa34a9198
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/xilinx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/phy/xilinx/xhdmiphy.c:515:14: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
           if (val < 0 && val > 6) {
               ~~~~~~~~^~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy.c:501:14: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
           if (val < 0 && val > 6) {
               ~~~~~~~~^~~~~~~~~~
   2 warnings generated.


vim +515 drivers/phy/xilinx/xhdmiphy.c

   341	
   342	static int xhdmiphy_parse_of(struct xhdmiphy_dev *priv)
   343	{
   344		struct xhdmiphy_conf *xgtphycfg = &priv->conf;
   345		struct device *dev = priv->dev;
   346		struct device_node *node = dev->of_node;
   347		int rc, val;
   348	
   349		rc = of_property_read_u32(node, "xlnx,transceiver-type", &val);
   350		if (rc < 0) {
   351			dev_err(priv->dev, "unable to parse %s property\n",
   352				"xlnx,transceiver-type");
   353			return rc;
   354		}
   355	
   356		if (val != XHDMIPHY_GTHE4 && val != XHDMIPHY_GTYE4 &&
   357		    val != XHDMIPHY_GTYE5) {
   358			dev_err(priv->dev, "dt transceiver-type %d is invalid\n", val);
   359			return -EINVAL;
   360		}
   361		xgtphycfg->gt_type = val;
   362	
   363		rc = of_property_read_u32(node, "xlnx,input-pixels-per-clock", &val);
   364		if (rc < 0) {
   365			dev_err(priv->dev, "unable to parse %s property\n",
   366				"xlnx,input-pixels-per-clock");
   367			return rc;
   368		}
   369	
   370		if (val != 4 && val != 8) {
   371			dev_err(priv->dev, "dt input-pixels-per-clock %d is invalid\n",
   372				val);
   373			return -EINVAL;
   374		}
   375		xgtphycfg->ppc = val;
   376	
   377		rc = of_property_read_u32(node, "xlnx,nidru", &val);
   378		if (rc < 0) {
   379			dev_err(priv->dev, "unable to parse %s property\n",
   380				"xlnx,nidru");
   381			return rc;
   382		}
   383	
   384		if (val != 0 && val != 1) {
   385			dev_err(priv->dev, "dt nidru %d is invalid\n",
   386				val);
   387			return -EINVAL;
   388		}
   389		xgtphycfg->dru_present = val;
   390	
   391		rc = of_property_read_u32(node, "xlnx,nidru-refclk-sel", &val);
   392		if (rc < 0) {
   393			dev_err(priv->dev, "unable to parse %s property\n",
   394				"xlnx,nidru-refclk-sel");
   395			return rc;
   396		}
   397	
   398		if (val < XHDMIPHY_PLL_REFCLKSEL_GTREFCLK0 - 1 &&
   399		    val > XHDMIPHY_PLL_REFCLKSEL_GTGREFCLK - 1) {
   400			dev_err(priv->dev, "dt nidru-refclk-sel %d is invalid\n",
   401				val);
   402			return -EINVAL;
   403		}
   404		xgtphycfg->dru_refclk_sel = val;
   405	
   406		rc = of_property_read_u32(node, "xlnx,rx-no-of-channels", &val);
   407		if (rc < 0) {
   408			dev_err(priv->dev, "unable to parse %s property\n",
   409				"xlnx,rx-no-of-channels");
   410			return rc;
   411		}
   412	
   413		if (val != 1 && val != 2 && val != 4) {
   414			dev_err(priv->dev, "dt rx-no-of-channels %d is invalid\n",
   415				val);
   416			return -EINVAL;
   417		}
   418		xgtphycfg->rx_channels = val;
   419	
   420		rc = of_property_read_u32(node, "xlnx,tx-no-of-channels", &val);
   421		if (rc < 0) {
   422			dev_err(priv->dev, "unable to parse %s property\n",
   423				"xlnx,tx-no-of-channels");
   424			return rc;
   425		}
   426	
   427		if (val != 1 && val != 2 && val != 4) {
   428			dev_err(priv->dev, "dt tx-no-of-channels %d is invalid\n",
   429				val);
   430			return -EINVAL;
   431		}
   432		xgtphycfg->tx_channels = val;
   433	
   434		rc = of_property_read_u32(node, "xlnx,rx-protocol", &val);
   435		if (rc < 0) {
   436			dev_err(priv->dev, "unable to parse %s property\n",
   437				"xlnx,rx-protocol");
   438			return rc;
   439		}
   440	
   441		if (val != XHDMIPHY_PROT_HDMI && val != XHDMIPHY_PROT_HDMI21 &&
   442		    val != XHDMIPHY_PROT_NONE) {
   443			dev_err(priv->dev, "dt rx-protocol %d is invalid\n",
   444				val);
   445			return -EINVAL;
   446		}
   447		xgtphycfg->rx_protocol = val;
   448	
   449		rc = of_property_read_u32(node, "xlnx,tx-protocol", &val);
   450		if (rc < 0) {
   451			dev_err(priv->dev, "unable to parse %s property\n",
   452				"xlnx,tx-protocol");
   453			return rc;
   454		}
   455	
   456		if (val != XHDMIPHY_PROT_HDMI && val != XHDMIPHY_PROT_HDMI21 &&
   457		    val != XHDMIPHY_PROT_NONE) {
   458			dev_err(priv->dev, "dt tx-protocol %d is invalid\n",
   459				val);
   460			return -EINVAL;
   461		}
   462		xgtphycfg->tx_protocol = val;
   463	
   464		rc = of_property_read_u32(node, "xlnx,rx-refclk-sel", &val);
   465		if (rc < 0) {
   466			dev_err(priv->dev, "unable to parse %s property\n",
   467				"xlnx,rx-refclk-sel");
   468			return rc;
   469		}
   470	
   471		if (val < XHDMIPHY_PLL_REFCLKSEL_GTREFCLK0 - 1 &&
   472		    val > XHDMIPHY_PLL_REFCLKSEL_GTGREFCLK - 1) {
   473			dev_err(priv->dev, "dt rx-refclk-sel %d is invalid\n",
   474				val);
   475			return -EINVAL;
   476		}
   477		xgtphycfg->rx_refclk_sel = val;
   478	
   479		rc = of_property_read_u32(node, "xlnx,tx-refclk-sel", &val);
   480		if (rc < 0) {
   481			dev_err(priv->dev, "unable to parse %s property\n",
   482				"xlnx,tx-refclk-sel");
   483			return rc;
   484		}
   485	
   486		if (val < XHDMIPHY_PLL_REFCLKSEL_GTREFCLK0 - 1 &&
   487		    val > XHDMIPHY_PLL_REFCLKSEL_GTGREFCLK - 1) {
   488			dev_err(priv->dev, "dt tx-refclk-sel %d is invalid\n",
   489				val);
   490			return -EINVAL;
   491		}
   492		xgtphycfg->tx_refclk_sel = val;
   493	
   494		rc = of_property_read_u32(node, "xlnx,rx-pll-selection", &val);
   495		if (rc < 0) {
   496			dev_err(priv->dev, "unable to parse %s property\n",
   497				"xlnx,rx-pll-selection");
   498			return rc;
   499		}
   500	
   501		if (val < 0 && val > 6) {
   502			dev_err(priv->dev, "dt rx-pll-selection %d is invalid\n",
   503				val);
   504			return -EINVAL;
   505		}
   506		xgtphycfg->rx_pllclk_sel = val;
   507	
   508		rc = of_property_read_u32(node, "xlnx,tx-pll-selection", &val);
   509		if (rc < 0) {
   510			dev_err(priv->dev, "unable to parse %s property\n",
   511				"xlnx,tx-pll-selection");
   512			return rc;
   513		}
   514	
 > 515		if (val < 0 && val > 6) {
   516			dev_err(priv->dev, "dt tx-pll-selection %d is invalid\n",
   517				val);
   518			return -EINVAL;
   519		}
   520		xgtphycfg->tx_pllclk_sel = val;
   521	
   522		rc = of_property_read_u32(node, "xlnx,transceiver-width", &val);
   523		if (rc < 0) {
   524			dev_err(priv->dev, "unable to parse %s property\n",
   525				"xlnx,transceiver-width");
   526			return rc;
   527		}
   528		if (val != 2 && val != 4) {
   529			dev_err(priv->dev, "dt transceiver-width %d is invalid\n",
   530				val);
   531			return -EINVAL;
   532		}
   533		xgtphycfg->transceiver_width = val;
   534	
   535		rc = of_property_read_u32(node, "xlnx,rx-max-gt-line-rate", &val);
   536		if (rc < 0) {
   537			dev_err(priv->dev, "unable to parse %s property\n",
   538				"xlnx,rx-max-gt-line-rate");
   539			return rc;
   540		}
   541	
   542		if (val != 3 && val != 6 && val != 8 && val != 10 && val != 12) {
   543			dev_err(priv->dev, "dt rx-max-gt-line-rate %d is invalid\n",
   544				val);
   545			return -EINVAL;
   546		}
   547		xgtphycfg->rx_maxrate = val;
   548	
   549		rc = of_property_read_u32(node, "xlnx,tx-max-gt-line-rate", &val);
   550		if (rc < 0) {
   551			dev_err(priv->dev, "unable to parse %s property\n",
   552				"xlnx,tx-max-gt-line-rate");
   553			return rc;
   554		}
   555	
   556		if (val != 3 && val != 6 && val != 8 && val != 10 && val != 12) {
   557			dev_err(priv->dev, "dt tx-max-gt-line-rate %d is invalid\n",
   558				val);
   559			return -EINVAL;
   560		}
   561		xgtphycfg->tx_maxrate = val;
   562	
   563		rc = of_property_read_u32(node, "xlnx,use-gt-ch4-hdmi", &val);
   564		if (rc < 0) {
   565			dev_err(priv->dev, "unable to parse %s property\n",
   566				"xlnx,use-gt-ch4-hdmi");
   567			return rc;
   568		}
   569	
   570		if (val != 0 && val != 1) {
   571			dev_err(priv->dev, "dt use-gt-ch4-hdmi %d is invalid\n",
   572				val);
   573			return -EINVAL;
   574		}
   575		xgtphycfg->gt_as_tx_tmdsclk = val;
   576	
   577		rc = of_property_read_u32(node, "xlnx,rx-frl-refclk-sel", &val);
   578		if (rc < 0) {
   579			dev_err(priv->dev, "unable to parse %s property\n",
   580				"xlnx,rx-frl-refclk-sel");
   581			return rc;
   582		}
   583	
   584		if (val < XHDMIPHY_PLL_REFCLKSEL_GTREFCLK0 - 1 &&
   585		    val > XHDMIPHY_PLL_REFCLKSEL_GTGREFCLK - 1) {
   586			dev_err(priv->dev, "dt rx-frl-refclk-sel %d is invalid\n",
   587				val);
   588			return -EINVAL;
   589		}
   590		xgtphycfg->rx_frl_refclk_sel = val;
   591	
   592		rc = of_property_read_u32(node, "xlnx,tx-frl-refclk-sel", &val);
   593		if (rc < 0) {
   594			dev_err(priv->dev, "unable to parse %s property\n",
   595				"xlnx,tx-frl-refclk-sel");
   596			return rc;
   597		}
   598	
   599		if (val < XHDMIPHY_PLL_REFCLKSEL_GTREFCLK0 - 1 &&
   600		    val > XHDMIPHY_PLL_REFCLKSEL_GTGREFCLK - 1) {
   601			dev_err(priv->dev, "dt tx-frl-refclk-sel %d is invalid\n",
   602				val);
   603			return -EINVAL;
   604		}
   605		xgtphycfg->tx_frl_refclk_sel = val;
   606	
   607		priv->rxch4_gpio = devm_gpiod_get(priv->dev,
   608						  "rxch4-sel", GPIOD_OUT_LOW);
   609	
   610		if (IS_ERR(priv->rxch4_gpio)) {
   611			if (PTR_ERR(priv->rxch4_gpio) != -EPROBE_DEFER)
   612				dev_err(priv->dev, "rxch4-sel not setup in DT\n");
   613			return PTR_ERR(priv->rxch4_gpio);
   614		}
   615	
   616		return rc;
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
