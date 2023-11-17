Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A5469E;
	Fri, 17 Nov 2023 03:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNAYK4qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700190144; x=1731726144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTIvbztNE02xURyGCuAlcnK0wiR6wDPs1JX/xf5VRDU=;
  b=kNAYK4qdj2WjAF1eoaNkxj2cXKsJ7RsJcCxy9k/6vFoGUWgz9c17czI9
   wNZ78gTlcrHWV8iKx6XOSO21BP0x/kr0m6ZsHcOoAcItlBZ/8qH94H45d
   OGiOuVrV+9BDoYFoBAjfFtic/DUlNrkPbHufKkshGGAuF8IIy1dhvgcLS
   m46FrMvLXWm3w+zYT3PMSshIWeTMUst1MR+BydkyvDebOEFJ15Q+qR8bl
   GMo+bcCOwuO7AgIdkI8Wd5jbb357hIHzpDviM3pHmTTT7VC/rGq+NIzU7
   rzp+XT6gzyaZ3DqmaZN/BS8luX18W4JwelNEAi7yrcRgwguLCfI6q3IZO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395151817"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="395151817"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 19:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1096978503"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="1096978503"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2023 19:02:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3p7b-0002JH-1Z;
	Fri, 17 Nov 2023 03:02:19 +0000
Date: Fri, 17 Nov 2023 11:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <dfustini@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 1554/1745]
 drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: warning: use of bitwise '|' with
 boolean operands
Message-ID: <202311171015.WiPtQrdU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f31817cbcf48d191faee7cebfb59197d2048cd64
commit: aff35fbc7830510ef7cbcf8e32a041a55de3dc51 [1554/1745] mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231117/202311171015.WiPtQrdU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311171015.WiPtQrdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311171015.WiPtQrdU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
                   if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: note: cast one or both operands to int to silence this warning
>> drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
                   if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                        ||
   drivers/mmc/host/sdhci-of-dwcmshc.c:873:7: note: cast one or both operands to int to silence this warning
   2 warnings generated.


vim +873 drivers/mmc/host/sdhci-of-dwcmshc.c

   789	
   790	static int dwcmshc_probe(struct platform_device *pdev)
   791	{
   792		struct device *dev = &pdev->dev;
   793		struct sdhci_pltfm_host *pltfm_host;
   794		struct sdhci_host *host;
   795		struct dwcmshc_priv *priv;
   796		struct rk35xx_priv *rk_priv = NULL;
   797		const struct sdhci_pltfm_data *pltfm_data;
   798		int err;
   799		u32 extra;
   800	
   801		pltfm_data = device_get_match_data(&pdev->dev);
   802		if (!pltfm_data) {
   803			dev_err(&pdev->dev, "Error: No device match data found\n");
   804			return -ENODEV;
   805		}
   806	
   807		host = sdhci_pltfm_init(pdev, pltfm_data,
   808					sizeof(struct dwcmshc_priv));
   809		if (IS_ERR(host))
   810			return PTR_ERR(host);
   811	
   812		/*
   813		 * extra adma table cnt for cross 128M boundary handling.
   814		 */
   815		extra = DIV_ROUND_UP_ULL(dma_get_required_mask(dev), SZ_128M);
   816		if (extra > SDHCI_MAX_SEGS)
   817			extra = SDHCI_MAX_SEGS;
   818		host->adma_table_cnt += extra;
   819	
   820		pltfm_host = sdhci_priv(host);
   821		priv = sdhci_pltfm_priv(pltfm_host);
   822	
   823		if (dev->of_node) {
   824			pltfm_host->clk = devm_clk_get(dev, "core");
   825			if (IS_ERR(pltfm_host->clk)) {
   826				err = PTR_ERR(pltfm_host->clk);
   827				dev_err(dev, "failed to get core clk: %d\n", err);
   828				goto free_pltfm;
   829			}
   830			err = clk_prepare_enable(pltfm_host->clk);
   831			if (err)
   832				goto free_pltfm;
   833	
   834			priv->bus_clk = devm_clk_get(dev, "bus");
   835			if (!IS_ERR(priv->bus_clk))
   836				clk_prepare_enable(priv->bus_clk);
   837		}
   838	
   839		err = mmc_of_parse(host->mmc);
   840		if (err)
   841			goto err_clk;
   842	
   843		sdhci_get_of_property(pdev);
   844	
   845		priv->vendor_specific_area1 =
   846			sdhci_readl(host, DWCMSHC_P_VENDOR_AREA1) & DWCMSHC_AREA1_MASK;
   847	
   848		host->mmc_host_ops.request = dwcmshc_request;
   849		host->mmc_host_ops.hs400_enhanced_strobe = dwcmshc_hs400_enhanced_strobe;
   850	
   851		if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
   852			rk_priv = devm_kzalloc(&pdev->dev, sizeof(struct rk35xx_priv), GFP_KERNEL);
   853			if (!rk_priv) {
   854				err = -ENOMEM;
   855				goto err_clk;
   856			}
   857	
   858			if (of_device_is_compatible(pdev->dev.of_node, "rockchip,rk3588-dwcmshc"))
   859				rk_priv->devtype = DWCMSHC_RK3588;
   860			else
   861				rk_priv->devtype = DWCMSHC_RK3568;
   862	
   863			priv->priv = rk_priv;
   864	
   865			err = dwcmshc_rk35xx_init(host, priv);
   866			if (err)
   867				goto err_clk;
   868		}
   869	
   870		if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
   871			priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
   872	
 > 873			if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
   874			    (device_property_read_bool(dev, "mmc-hs200-1_8v")) |
   875			    (device_property_read_bool(dev, "mmc-hs400-1_8v")))
   876				priv->flags |= FLAG_IO_FIXED_1V8;
   877			else
   878				priv->flags &= ~FLAG_IO_FIXED_1V8;
   879	
   880			/*
   881			 * start_signal_voltage_switch() will try 3.3V first
   882			 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
   883			 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
   884			 * in sdhci_start_signal_voltage_switch().
   885			 */
   886			if (priv->flags & FLAG_IO_FIXED_1V8) {
   887				host->flags &= ~SDHCI_SIGNALING_330;
   888				host->flags |=  SDHCI_SIGNALING_180;
   889			}
   890	
   891			sdhci_enable_v4_mode(host);
   892		}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
