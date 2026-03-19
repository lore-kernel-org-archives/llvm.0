Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E21F3D56;
	Thu, 19 Mar 2026 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894390; cv=none; b=arCmM8IG8sC80jeogljNtXpEQWkRL5eR6E8Zy7LXFIZuF4AX1Gi1Uo7q8gAcXD4V6CXqZFYbnKU7tQoQqcV8ZePB9uIz6PLinBFgzjIptfjafA/KJAOTYYG1t7WZKnVvbXRbQX/GqyONuJuuAmyIJGCxbPqYFBQrhKYCWgh3c6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894390; c=relaxed/simple;
	bh=nVhJAal19j7KWzWuTeB685cg/OS9M1LlFajHAYcb//0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SRwwLgTUQqIdsXs0CaBxjFb8LGs/TFmveioxuTSBntk/LanHRe/kfz3wZVse73pjE+EgmwzDctnNu/yd1xubdbWjN1ZhOK1Jdm2+vAdqg9QvEV3a73rdgMRHQsF2u3g4wKZZQCa6OjwPnVi20fQtG+bgoHO7HIQPwDrDeembCQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsFxhe3a; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsFxhe3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773894389; x=1805430389;
  h=date:from:to:cc:subject:message-id;
  bh=nVhJAal19j7KWzWuTeB685cg/OS9M1LlFajHAYcb//0=;
  b=GsFxhe3aTFebPoo/w9MdIL/TAMF4Okz/Fad5d7T2QD60rDFzwOykHBCn
   FTj5fYZDcO5GZTBKfCBH+MnYdaxiJZdKRQfQfP/9PqbWuaB/C7ZuqLIPP
   XBX8sVdyA5Bun3p95JqLXdIXc4EyXvtYUB9foRB5me6CZQ2gC9sW2IUfA
   UAQ33vafzo0YfQogjhrnsyvDqRbCsmdrAOLzz3kVOgJkPFsFUDW8t8wy/
   N0FQFbO8AtHJ/1ItqhoJ2o/c4DbK25+vz6eHevQ57xXfJ4xUGQa9Dkexg
   TGP4Q85KPc3FysYpbqgwF5Z6uEZXaq+BWPfqfRIm8vMKi/GDr0i94U3yn
   Q==;
X-CSE-ConnectionGUID: deCvxTjGR9a9sU7L2k1oHQ==
X-CSE-MsgGUID: g+/hk1tgS3yIJmlgf+/XGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="77568524"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="77568524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 21:26:28 -0700
X-CSE-ConnectionGUID: hpbDu9cfSEy1dM1PNQsSWw==
X-CSE-MsgGUID: URVHF/syR4OQv3nc7XpJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="222822953"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2026 21:26:27 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w34v2-000000000J2-1Ac0;
	Thu, 19 Mar 2026 04:24:21 +0000
Date: Thu, 19 Mar 2026 12:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [krzk-github:b4/clk-qcom-dispcc-eliza 3/5]
 drivers/clk/qcom/dispcc-eliza.c:83:32: warning: unused variable
 'disp_cc_pll0_config'
Message-ID: <202603191247.io8yOx9M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux b4/clk-qcom-dispcc-eliza
head:   6afb9c7a847418d9889afc5b8395d3f8bce9fc65
commit: 35b05bfd761fc64be7c3411298ab1b319abcc422 [3/5] clk: qcom: dispcc-eliza: Add Eliza display clock controller support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603191247.io8yOx9M-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191247.io8yOx9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191247.io8yOx9M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/dispcc-eliza.c:83:32: warning: unused variable 'disp_cc_pll0_config' [-Wunused-variable]
      83 | static struct alpha_pll_config disp_cc_pll0_config = {
         |                                ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/dispcc-eliza.c:115:32: warning: unused variable 'disp_cc_pll1_config' [-Wunused-variable]
     115 | static struct alpha_pll_config disp_cc_pll1_config = {
         |                                ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/dispcc-eliza.c:147:38: warning: unused variable 'disp_cc_pll2_config' [-Wunused-const-variable]
     147 | static const struct alpha_pll_config disp_cc_pll2_config = {
         |                                      ^~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/disp_cc_pll0_config +83 drivers/clk/qcom/dispcc-eliza.c

    82	
  > 83	static struct alpha_pll_config disp_cc_pll0_config = {
    84		.l = 0xd,
    85		.cal_l = 0x44,
    86		.alpha = 0x6492,
    87		.config_ctl_val = 0x20485699,
    88		.config_ctl_hi_val = 0x00182261,
    89		.config_ctl_hi1_val = 0x82aa299c,
    90		.test_ctl_val = 0x00000000,
    91		.test_ctl_hi_val = 0x00000003,
    92		.test_ctl_hi1_val = 0x00009000,
    93		.test_ctl_hi2_val = 0x00000034,
    94		.user_ctl_val = 0x00000000,
    95		.user_ctl_hi_val = 0x00000005,
    96	};
    97	
    98	static struct clk_alpha_pll disp_cc_pll0 = {
    99		.offset = 0x0,
   100		.vco_table = lucid_ole_vco,
   101		.num_vco = ARRAY_SIZE(lucid_ole_vco),
   102		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
   103		.clkr = {
   104			.hw.init = &(const struct clk_init_data) {
   105				.name = "disp_cc_pll0",
   106				.parent_data = &(const struct clk_parent_data) {
   107					.index = DT_BI_TCXO,
   108				},
   109				.num_parents = 1,
   110				.ops = &clk_alpha_pll_lucid_evo_ops,
   111			},
   112		},
   113	};
   114	
 > 115	static struct alpha_pll_config disp_cc_pll1_config = {
   116		.l = 0x1f,
   117		.cal_l = 0x44,
   118		.alpha = 0x4000,
   119		.config_ctl_val = 0x20485699,
   120		.config_ctl_hi_val = 0x00182261,
   121		.config_ctl_hi1_val = 0x82aa299c,
   122		.test_ctl_val = 0x00000000,
   123		.test_ctl_hi_val = 0x00000003,
   124		.test_ctl_hi1_val = 0x00009000,
   125		.test_ctl_hi2_val = 0x00000034,
   126		.user_ctl_val = 0x00000000,
   127		.user_ctl_hi_val = 0x00000005,
   128	};
   129	
   130	static struct clk_alpha_pll disp_cc_pll1 = {
   131		.offset = 0x1000,
   132		.vco_table = lucid_ole_vco,
   133		.num_vco = ARRAY_SIZE(lucid_ole_vco),
   134		.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
   135		.clkr = {
   136			.hw.init = &(const struct clk_init_data) {
   137				.name = "disp_cc_pll1",
   138				.parent_data = &(const struct clk_parent_data) {
   139					.index = DT_BI_TCXO,
   140				},
   141				.num_parents = 1,
   142				.ops = &clk_alpha_pll_lucid_evo_ops,
   143			},
   144		},
   145	};
   146	
 > 147	static const struct alpha_pll_config disp_cc_pll2_config = {
   148		.l = 0x493,
   149		.cal_l = 0x493,
   150		.alpha = 0x0,
   151		.config_ctl_val = 0x60000f6a,
   152		.config_ctl_hi_val = 0x0001c808,
   153		.config_ctl_hi1_val = 0x00000000,
   154		.config_ctl_hi2_val = 0x04008174,
   155		.test_ctl_val = 0x00000000,
   156		.test_ctl_hi_val = 0x0080c496,
   157		.test_ctl_hi1_val = 0x40100180,
   158		.test_ctl_hi2_val = 0x441001bc,
   159		.test_ctl_hi3_val = 0x000003d8,
   160		.user_ctl_val = 0x00000000,
   161		.user_ctl_hi_val = 0x00e50302,
   162	};
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
