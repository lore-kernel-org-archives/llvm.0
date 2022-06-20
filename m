Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8877373
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 04:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655700424; x=1687236424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kaCpPIgH9DOsXZNL9IlYIRS2y2Mu8FjD46OTpuYr6Co=;
  b=a40EHFGbozMU6PV/FMpZ5Ln9s7QQWJS1KSR/4mTPjX+IqX3WPm/3riny
   WOSt+tsXVM4z8RFzvXE3OMAOD5g+W7z308RnvcVyjvE/xkU1IOuDZvz5F
   Katg10Z5jtfxQdA+p86Jjqh0cBHE+n8e1d0c/Xk8PXILm3cyilUrfmM85
   0NLDbO584o4l5pMbwJSZojMBmkwdK7TV6e0jdhMJ+VzGf1cseSNP9qRBv
   CIgtdlCJ6G77gXvE8BYiEJKII7FxZs0Y8zaftryR7MYAgQzYuHpXw+EGV
   tIm4ARl5Y6oCxG0in+r7Pqon1rz8fhzy2dWNqxTJ5UDFu8hjnbHI6cZDO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280530606"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280530606"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 21:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="689263067"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2022 21:46:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o39JO-000S0U-7K;
	Mon, 20 Jun 2022 04:46:54 +0000
Date: Mon, 20 Jun 2022 12:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 629/1181]
 drivers/gpu/drm/xlnx/xlnx_dsi.c:967:41: warning: implicit conversion from
 'unsigned long long' to 'unsigned long' changes value from 200000000000 to
 2431504384
Message-ID: <202206201250.BqmtKb5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saurabh,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 32f4c7d25b52562567b652709480223cf36e3229 [629/1181] drm: xlnx: dsi: Adding dsi driver to new framework
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220620/202206201250.BqmtKb5f-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/32f4c7d25b52562567b652709480223cf36e3229
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 32f4c7d25b52562567b652709480223cf36e3229
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/i2c/ drivers/media/platform/xilinx/ drivers/phy/xilinx/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/xlnx_dsi.c:967:41: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 200000000000 to 2431504384 [-Wconstant-conversion]
           ret = clk_set_rate(dsi->dphy_clk_200M, XDSI_DPHY_CLK_REQ);
                 ~~~~~~~~~~~~                     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/xlnx_dsi.c:88:27: note: expanded from macro 'XDSI_DPHY_CLK_REQ'
   #define XDSI_DPHY_CLK_REQ       200000000000UL
                                   ^~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_dsi.c:980:39: warning: result of comparison of constant 203000000000 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
           if (rate < XDSI_DPHY_CLK_MIN && rate > XDSI_DPHY_CLK_MAX) {
                                           ~~~~ ^ ~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_dsi.c:980:11: warning: result of comparison of constant 197000000000 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
           if (rate < XDSI_DPHY_CLK_MIN && rate > XDSI_DPHY_CLK_MAX) {
               ~~~~ ^ ~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +967 drivers/gpu/drm/xlnx/xlnx_dsi.c

   928	
   929	static int xlnx_dsi_probe(struct platform_device *pdev)
   930	{
   931		struct device *dev = &pdev->dev;
   932		struct resource *res;
   933		struct xlnx_dsi *dsi;
   934		struct device_node *vpss_node;
   935		int ret;
   936		unsigned long rate;
   937	
   938		dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
   939		if (!dsi)
   940			return -ENOMEM;
   941	
   942		dsi->dsi_host.ops = &xlnx_dsi_ops;
   943		dsi->dsi_host.dev = dev;
   944		dsi->dev = dev;
   945	
   946		ret = xlnx_dsi_parse_dt(dsi);
   947		if (ret)
   948			return ret;
   949	
   950		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   951		dsi->iomem = devm_ioremap_resource(dev, res);
   952		if (IS_ERR(dsi->iomem))
   953			return PTR_ERR(dsi->iomem);
   954	
   955		platform_set_drvdata(pdev, dsi);
   956	
   957		/* Bridge support */
   958		vpss_node = of_parse_phandle(dsi->dev->of_node, "xlnx,vpss", 0);
   959		if (vpss_node) {
   960			dsi->bridge = of_xlnx_bridge_get(vpss_node);
   961			if (!dsi->bridge) {
   962				dev_info(dsi->dev, "Didn't get bridge instance\n");
   963				return -EPROBE_DEFER;
   964			}
   965		}
   966	
 > 967		ret = clk_set_rate(dsi->dphy_clk_200M, XDSI_DPHY_CLK_REQ);
   968		if (ret) {
   969			dev_err(dev, "failed to set dphy clk rate %d\n", ret);
   970			return ret;
   971		}
   972	
   973		ret = clk_prepare_enable(dsi->dphy_clk_200M);
   974		if (ret) {
   975			dev_err(dev, "failed to enable dphy clk %d\n", ret);
   976			return ret;
   977		}
   978	
   979		rate = clk_get_rate(dsi->dphy_clk_200M);
 > 980		if (rate < XDSI_DPHY_CLK_MIN && rate > XDSI_DPHY_CLK_MAX) {
   981			dev_err(dev, "Error DPHY clock = %lu\n", rate);
   982			ret = -EINVAL;
   983			goto err_disable_dphy_clk;
   984		}
   985	
   986		ret = clk_prepare_enable(dsi->video_aclk);
   987		if (ret) {
   988			dev_err(dev, "failed to enable video clk %d\n", ret);
   989			goto err_disable_dphy_clk;
   990		}
   991	
   992		ret = component_add(dev, &xlnx_dsi_component_ops);
   993		if (ret < 0)
   994			goto err_disable_video_clk;
   995	
   996		return ret;
   997	
   998	err_disable_video_clk:
   999		clk_disable_unprepare(dsi->video_aclk);
  1000	err_disable_dphy_clk:
  1001		clk_disable_unprepare(dsi->dphy_clk_200M);
  1002		return ret;
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
