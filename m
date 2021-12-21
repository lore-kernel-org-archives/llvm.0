Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8E2C82
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 02:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640054682; x=1671590682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rccSrwlGr6cUl8+h54aE7yci9HQl5L/7zDdfyCmeovk=;
  b=GMEyNGvGeKhcvG/zNQWbBfPEUtTtgXn8k562Js5rxNDfX2r4D1Ks6gBI
   ssrNvt8A+/+qJ4sKElPGsCbzY9ToXHYq+NOzykYgXS3ollnB34QnSpVCl
   g5ZCVw0u+0YjtFSpNopS4YJYHfbNTDQswvJo7WQfQsc7+04QTG7IoK/cO
   yz0hS7OSPWBKz3U6vB6/TzYqTpQw4lm7WmV2IV3sjEEXNazAIbl1V6u+g
   AANBTtXYIs5NyZ/dcqYGfq92GraWpSd6VIqGUhEfXFWKSHs1W3Nzy4Xtv
   gK+LRzvvP3a1jNm2H/5QVsyDlf3QGqtUBnFeJYlsS5eXfKH/F7tSKbYQg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264497532"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="264497532"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 18:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="684501179"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2021 18:44:40 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzV8p-0008aP-IA; Tue, 21 Dec 2021 02:44:39 +0000
Date: Tue, 21 Dec 2021 10:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Ford <aford173@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Subject: [soc:imx/drivers 7/7] drivers/soc/imx/imx8m-blk-ctrl.c:536:4: error:
 field designator 'mipi_phy_rst_mask' does not refer to any field in type
 'const struct imx8m_blk_ctrl_domain_data'
Message-ID: <202112211020.yQtfoIrI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/drivers
head:   7f511d514e8c34b6dd0c17b5496e48b2a6a2626c
commit: 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c [7/7] soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl
config: hexagon-randconfig-r045-20211220 (https://download.01.org/0day-ci/archive/20211221/202112211020.yQtfoIrI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=7f511d514e8c34b6dd0c17b5496e48b2a6a2626c
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc imx/drivers
        git checkout 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/imx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx8m-blk-ctrl.c:536:4: error: field designator 'mipi_phy_rst_mask' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .mipi_phy_rst_mask = BIT(17),
                    ^
   drivers/soc/imx/imx8m-blk-ctrl.c:545:4: error: field designator 'mipi_phy_rst_mask' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .mipi_phy_rst_mask = BIT(16),
                    ^
>> drivers/soc/imx/imx8m-blk-ctrl.c:570:17: error: invalid application of 'sizeof' to an incomplete type 'const struct imx8m_blk_ctrl_domain_data[]'
           .num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:46:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   3 errors generated.


vim +536 drivers/soc/imx/imx8m-blk-ctrl.c

   527	
   528	static const struct imx8m_blk_ctrl_domain_data imx8mn_disp_blk_ctl_domain_data[] = {
   529		[IMX8MN_DISPBLK_PD_MIPI_DSI] = {
   530			.name = "dispblk-mipi-dsi",
   531			.clk_names = (const char *[]){ "dsi-pclk", "dsi-ref", },
   532			.num_clks = 2,
   533			.gpc_name = "mipi-dsi",
   534			.rst_mask = BIT(0) | BIT(1),
   535			.clk_mask = BIT(0) | BIT(1),
 > 536			.mipi_phy_rst_mask = BIT(17),
   537		},
   538		[IMX8MN_DISPBLK_PD_MIPI_CSI] = {
   539			.name = "dispblk-mipi-csi",
   540			.clk_names = (const char *[]){ "csi-aclk", "csi-pclk" },
   541			.num_clks = 2,
   542			.gpc_name = "mipi-csi",
   543			.rst_mask = BIT(2) | BIT(3),
   544			.clk_mask = BIT(2) | BIT(3),
   545			.mipi_phy_rst_mask = BIT(16),
   546		},
   547		[IMX8MN_DISPBLK_PD_LCDIF] = {
   548			.name = "dispblk-lcdif",
   549			.clk_names = (const char *[]){ "lcdif-axi", "lcdif-apb", "lcdif-pix", },
   550			.num_clks = 3,
   551			.gpc_name = "lcdif",
   552			.rst_mask = BIT(4) | BIT(5),
   553			.clk_mask = BIT(4) | BIT(5),
   554		},
   555		[IMX8MN_DISPBLK_PD_ISI] = {
   556			.name = "dispblk-isi",
   557			.clk_names = (const char *[]){ "disp_axi", "disp_apb", "disp_axi_root",
   558							"disp_apb_root"},
   559			.num_clks = 4,
   560			.gpc_name = "isi",
   561			.rst_mask = BIT(6) | BIT(7),
   562			.clk_mask = BIT(6) | BIT(7),
   563		},
   564	};
   565	
   566	static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
   567		.max_reg = 0x84,
   568		.power_notifier_fn = imx8mn_disp_power_notifier,
   569		.domains = imx8mn_disp_blk_ctl_domain_data,
 > 570		.num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
   571	};
   572	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
