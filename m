Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0937A
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647372239; x=1678908239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMCgF7p8YFmjLYVPanuVRoRaol386gRwg5F6QMdgll0=;
  b=SXE2BuXAmNXRvxfy7DGFQ2QrAg3q8Xj/NmnO0cahhBj8VlxH9JmX8D01
   OxLmETEWjhRMja0uQGoJkIL8kF5pkNRFZ+4mFxRsG8XIkGhAZFt/4n3X4
   YWwoTaIBjCMyYW9wfnDJVE9g2wdyzM+jK+3cIjbhsI+QYTneRDI+4beD/
   Lc67Js5145WYtmGCWDuImlBdEJHtqMwa/dwsOndCl7RItkbs/UBa0lzTo
   sijoJhKXlfTHpPKavIPEPsormIjzL5dQp8nh0K2uuQWVOzx7FWttvzzuc
   Q/YcqLaPBVFvzzdGnSWGJKkhzKIdXek6opOqN4brKnrLJUHpXasH5Nfly
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256598404"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="256598404"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 12:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="714306989"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Mar 2022 12:23:56 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUClv-000BPi-H7; Tue, 15 Mar 2022 19:23:55 +0000
Date: Wed, 16 Mar 2022 03:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 629/983]
 drivers/gpu/drm/xlnx/xlnx_dsi.c:967:41: warning: implicit conversion from
 'unsigned long long' to 'unsigned long' changes value from 200000000000 to
 2431504384
Message-ID: <202203160322.ihy7dt3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Saurabh,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   82a6a288ad2ea30575c859f1a5ec2ad014e51528
commit: 32f4c7d25b52562567b652709480223cf36e3229 [629/983] drm: xlnx: dsi: Adding dsi driver to new framework
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220316/202203160322.ihy7dt3k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/32f4c7d25b52562567b652709480223cf36e3229
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 32f4c7d25b52562567b652709480223cf36e3229
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/

If you fix the issue, kindly add following tag as appropriate
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

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
