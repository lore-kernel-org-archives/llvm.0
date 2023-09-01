Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5643BBE4D;
	Fri,  1 Sep 2023 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573723; x=1725109723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hJ/yL8GS5YEAll6R/l8A0kD+rmErerxkOqWrWyZkay0=;
  b=A7ZOEIYlbKTenyjxf+U6COxyAKtxr+Yr6BgzKkPqZot7F9jrXHwbAzlm
   tXXLJeYMsucJpZmUmnLJGmcWRebolvy4h1LJiz6NKBz5Er8ks85PHVCTQ
   wce8UUNJjw2NlmlJ676RP0IVeqwBFDPzomAZJ8ZFv32KDCd32BAeXyK9w
   h1/PM5UFIj3x3gxI0845GpjrHakdxb4eprJvfvuRey2b0y7pHNY7BrHRj
   KtpFymHVCTN2X6SXCbV9iAtAIAFx5OnR2iGaaRIZAGnOoxxN41iIxa2Os
   oo9xOjSfIpdKplvoI5aq7hxqUUjXxeKue19lc7zD060Xql5qtc81P9Fg/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366441044"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366441044"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070744072"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="1070744072"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 06:08:39 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc3t6-0001J1-2X;
	Fri, 01 Sep 2023 13:08:36 +0000
Date: Fri, 1 Sep 2023 21:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: William Tseng <william.tseng@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	William Tseng <william.tseng@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dsi: let HW maintain HS-TRAIL and
 CLK_POST
Message-ID: <202309012009.7IXuIGBJ-lkp@intel.com>
References: <20230901095100.3771188-1-william.tseng@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230901095100.3771188-1-william.tseng@intel.com>

Hi William,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tseng/drm-i915-dsi-let-HW-maintain-HS-TRAIL-and-CLK_POST/20230901-175307
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230901095100.3771188-1-william.tseng%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/dsi: let HW maintain HS-TRAIL and CLK_POST
config: i386-randconfig-002-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012009.7IXuIGBJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012009.7IXuIGBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012009.7IXuIGBJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/icl_dsi.c:1829:2: error: use of undeclared identifier 'tclk_trail_ns'
           tclk_trail_ns = max(mipi_config->tclk_trail, mipi_config->ths_trail);
           ^
   1 error generated.


vim +/tclk_trail_ns +1829 drivers/gpu/drm/i915/display/icl_dsi.c

2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1814  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1815  static void icl_dphy_param_init(struct intel_dsi *intel_dsi)
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1816  {
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1817  	struct drm_device *dev = intel_dsi->base.base.dev;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1818  	struct drm_i915_private *dev_priv = to_i915(dev);
3cf050762534cc drivers/gpu/drm/i915/display/icl_dsi.c Ville Syrjälä 2022-05-10  1819  	struct intel_connector *connector = intel_dsi->attached_connector;
3cf050762534cc drivers/gpu/drm/i915/display/icl_dsi.c Ville Syrjälä 2022-05-10  1820  	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1821  	u32 tlpx_ns;
78ef7b0ec18ccb drivers/gpu/drm/i915/display/icl_dsi.c William Tseng 2023-09-01  1822  	u32 prepare_cnt, exit_zero_cnt, clk_zero_cnt;
78ef7b0ec18ccb drivers/gpu/drm/i915/display/icl_dsi.c William Tseng 2023-09-01  1823  	u32 ths_prepare_ns;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1824  	u32 hs_zero_cnt;
78ef7b0ec18ccb drivers/gpu/drm/i915/display/icl_dsi.c William Tseng 2023-09-01  1825  	u32 tclk_pre_cnt;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1826  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1827  	tlpx_ns = intel_dsi_tlpx_ns(intel_dsi);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1828  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05 @1829  	tclk_trail_ns = max(mipi_config->tclk_trail, mipi_config->ths_trail);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1830  	ths_prepare_ns = max(mipi_config->ths_prepare,
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1831  			     mipi_config->tclk_prepare);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1832  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1833  	/*
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1834  	 * prepare cnt in escape clocks
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1835  	 * this field represents a hexadecimal value with a precision
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1836  	 * of 1.2 – i.e. the most significant bit is the integer
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1837  	 * and the least significant 2 bits are fraction bits.
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1838  	 * so, the field can represent a range of 0.25 to 1.75
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1839  	 */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1840  	prepare_cnt = DIV_ROUND_UP(ths_prepare_ns * 4, tlpx_ns);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1841  	if (prepare_cnt > ICL_PREPARE_CNT_MAX) {
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1842  		drm_dbg_kms(&dev_priv->drm, "prepare_cnt out of range (%d)\n",
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1843  			    prepare_cnt);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1844  		prepare_cnt = ICL_PREPARE_CNT_MAX;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1845  	}
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1846  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1847  	/* clk zero count in escape clocks */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1848  	clk_zero_cnt = DIV_ROUND_UP(mipi_config->tclk_prepare_clkzero -
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1849  				    ths_prepare_ns, tlpx_ns);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1850  	if (clk_zero_cnt > ICL_CLK_ZERO_CNT_MAX) {
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1851  		drm_dbg_kms(&dev_priv->drm,
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1852  			    "clk_zero_cnt out of range (%d)\n", clk_zero_cnt);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1853  		clk_zero_cnt = ICL_CLK_ZERO_CNT_MAX;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1854  	}
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1855  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1856  	/* tclk pre count in escape clocks */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1857  	tclk_pre_cnt = DIV_ROUND_UP(mipi_config->tclk_pre, tlpx_ns);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1858  	if (tclk_pre_cnt > ICL_TCLK_PRE_CNT_MAX) {
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1859  		drm_dbg_kms(&dev_priv->drm,
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1860  			    "tclk_pre_cnt out of range (%d)\n", tclk_pre_cnt);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1861  		tclk_pre_cnt = ICL_TCLK_PRE_CNT_MAX;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1862  	}
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1863  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1864  	/* hs zero cnt in escape clocks */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1865  	hs_zero_cnt = DIV_ROUND_UP(mipi_config->ths_prepare_hszero -
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1866  				   ths_prepare_ns, tlpx_ns);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1867  	if (hs_zero_cnt > ICL_HS_ZERO_CNT_MAX) {
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1868  		drm_dbg_kms(&dev_priv->drm, "hs_zero_cnt out of range (%d)\n",
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1869  			    hs_zero_cnt);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1870  		hs_zero_cnt = ICL_HS_ZERO_CNT_MAX;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1871  	}
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1872  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1873  	/* hs exit zero cnt in escape clocks */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1874  	exit_zero_cnt = DIV_ROUND_UP(mipi_config->ths_exit, tlpx_ns);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1875  	if (exit_zero_cnt > ICL_EXIT_ZERO_CNT_MAX) {
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1876  		drm_dbg_kms(&dev_priv->drm,
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1877  			    "exit_zero_cnt out of range (%d)\n",
b5280cd0bd2d68 drivers/gpu/drm/i915/display/icl_dsi.c Wambui Karuga 2020-01-22  1878  			    exit_zero_cnt);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1879  		exit_zero_cnt = ICL_EXIT_ZERO_CNT_MAX;
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1880  	}
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1881  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1882  	/* clock lane dphy timings */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1883  	intel_dsi->dphy_reg = (CLK_PREPARE_OVERRIDE |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1884  			       CLK_PREPARE(prepare_cnt) |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1885  			       CLK_ZERO_OVERRIDE |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1886  			       CLK_ZERO(clk_zero_cnt) |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1887  			       CLK_PRE_OVERRIDE |
78ef7b0ec18ccb drivers/gpu/drm/i915/display/icl_dsi.c William Tseng 2023-09-01  1888  			       CLK_PRE(tclk_pre_cnt));
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1889  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1890  	/* data lanes dphy timings */
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1891  	intel_dsi->dphy_data_lane_reg = (HS_PREPARE_OVERRIDE |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1892  					 HS_PREPARE(prepare_cnt) |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1893  					 HS_ZERO_OVERRIDE |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1894  					 HS_ZERO(hs_zero_cnt) |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1895  					 HS_EXIT_OVERRIDE |
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1896  					 HS_EXIT(exit_zero_cnt));
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1897  
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1898  	intel_dsi_log_params(intel_dsi);
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1899  }
2def5ae7d7fb85 drivers/gpu/drm/i915/icl_dsi.c         Hans de Goede 2019-06-05  1900  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
