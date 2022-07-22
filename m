Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB6B4A2C
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 18:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658513258; x=1690049258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hClGG4e0OyV+0QSqAwV6x3Ca/FxE2mG9JLOUb6DTO24=;
  b=P7wjkEJxIWtoQw8FSan+qV5i+oqxKu7N7TV0DhaOH4vNfGoz9CPNhlWX
   jkGrSn9dvQoCN7pkbUQvrNiRY9OK2BGPLdEijewXHuSbkhWkvs68zR/WM
   klot5g6fW1CCq/anmbIg5mXkoo0+4HemCgWtABVv7V5Uvwr2WFoJBpGGt
   LKqcngTPSliFHpwpDz41Xozy4MNAd8VZqg3GybJZtWMS1cNcAXWvDnliL
   upq3ZSYfWM/yAg5QAJNvQT7bGZOWNNeiam8ZVViUPGlZNYfri9zlyZUkN
   +PLWvXvJxQ2tbn1D+EYhyI0ztCwCo62Dg2m+2gsDx2QkLeWFUbEPo9/EA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="284925610"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="284925610"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 11:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="666758059"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2022 11:07:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oEx3k-0001hX-0G;
	Fri, 22 Jul 2022 18:07:32 +0000
Date: Sat, 23 Jul 2022 02:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, l.stach@pengutronix.de
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com,
	laurent.pinchart@ideasonboard.com, marex@denx.de,
	paul.elder@ideasonboard.com, aford173@gmail.com,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 6/8] soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl
Message-ID: <202207230135.ZQrimSwM-lkp@intel.com>
References: <20220722125730.3428017-7-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722125730.3428017-7-peng.fan@oss.nxp.com>

Hi "Peng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linus/master v5.19-rc7 next-20220722]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/imx-add-i-MX8MP-hdmi-blk-ctrl-hdcp-hrv-and-vpu-blk-ctrl/20220722-205748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: arm-buildonly-randconfig-r004-20220722 (https://download.01.org/0day-ci/archive/20220723/202207230135.ZQrimSwM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/69aa4b64765e9c0ed7990d68a5cf3f125fd16f91
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peng-Fan-OSS/imx-add-i-MX8MP-hdmi-blk-ctrl-hdcp-hrv-and-vpu-blk-ctrl/20220722-205748
        git checkout 69aa4b64765e9c0ed7990d68a5cf3f125fd16f91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx8m-blk-ctrl.c:466:4: error: field designator 'path_names' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .path_names = (const char *[]){"g1"},
                    ^
>> drivers/soc/imx/imx8m-blk-ctrl.c:467:4: error: field designator 'num_paths' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .num_paths = 1,
                    ^
   drivers/soc/imx/imx8m-blk-ctrl.c:476:4: error: field designator 'path_names' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .path_names = (const char *[]){"g2"},
                    ^
   drivers/soc/imx/imx8m-blk-ctrl.c:477:4: error: field designator 'num_paths' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .num_paths = 1,
                    ^
   drivers/soc/imx/imx8m-blk-ctrl.c:486:4: error: field designator 'path_names' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .path_names = (const char *[]){"vc8000e"},
                    ^
   drivers/soc/imx/imx8m-blk-ctrl.c:487:4: error: field designator 'num_paths' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
                   .num_paths = 1,
                    ^
>> drivers/soc/imx/imx8m-blk-ctrl.c:495:17: error: invalid application of 'sizeof' to an incomplete type 'const struct imx8m_blk_ctrl_domain_data[]'
           .num_domains = ARRAY_SIZE(imx8mp_vpu_blk_ctl_domain_data),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   7 errors generated.


vim +466 drivers/soc/imx/imx8m-blk-ctrl.c

   457	
   458	static const struct imx8m_blk_ctrl_domain_data imx8mp_vpu_blk_ctl_domain_data[] = {
   459		[IMX8MP_VPUBLK_PD_G1] = {
   460			.name = "vpublk-g1",
   461			.clk_names = (const char *[]){ "g1", },
   462			.num_clks = 1,
   463			.gpc_name = "g1",
   464			.rst_mask = BIT(1),
   465			.clk_mask = BIT(1),
 > 466			.path_names = (const char *[]){"g1"},
 > 467			.num_paths = 1,
   468		},
   469		[IMX8MP_VPUBLK_PD_G2] = {
   470			.name = "vpublk-g2",
   471			.clk_names = (const char *[]){ "g2", },
   472			.num_clks = 1,
   473			.gpc_name = "g2",
   474			.rst_mask = BIT(0),
   475			.clk_mask = BIT(0),
   476			.path_names = (const char *[]){"g2"},
   477			.num_paths = 1,
   478		},
   479		[IMX8MP_VPUBLK_PD_VC8000E] = {
   480			.name = "vpublk-vc8000e",
   481			.clk_names = (const char *[]){ "vc8000e", },
   482			.num_clks = 1,
   483			.gpc_name = "vc8000e",
   484			.rst_mask = BIT(2),
   485			.clk_mask = BIT(2),
   486			.path_names = (const char *[]){"vc8000e"},
   487			.num_paths = 1,
   488		},
   489	};
   490	
   491	static const struct imx8m_blk_ctrl_data imx8mp_vpu_blk_ctl_dev_data = {
   492		.max_reg = 0x18,
   493		.power_notifier_fn = imx8mm_vpu_power_notifier,
   494		.domains = imx8mp_vpu_blk_ctl_domain_data,
 > 495		.num_domains = ARRAY_SIZE(imx8mp_vpu_blk_ctl_domain_data),
   496	};
   497	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
