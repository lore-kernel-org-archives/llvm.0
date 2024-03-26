Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0C5F850;
	Tue, 26 Mar 2024 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711445037; cv=none; b=eDCJEwm/7waTKzpNz+6GC0o8zidbi760/YL6OjTjJPJdXCzpk+bJbLCQ8SnDcZnd3xO2OwpzDZZIcR5Lz5xJEMjB/S7S6oiVTP9M99KDLAVRj8SqcqsaZm3RaTvXPaNaU2vYywXf2D3ytaRe4wlEizrfZAvvd+/5END4SF3xXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711445037; c=relaxed/simple;
	bh=QsR1evSSsBiuGGPAyFaU13fPJFycp4wgpdvy0Jfxak0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WH3+NUC8q6kiX03HMEnyZ31FwintDOXMWvVB+JoMzGfqOpCIWGyaFSyRAu+A0u+2b5BaQ0wMaL2OY3SHCvl4BSGVUnIjbE7zLXuHkZ+QXo9doAQvCwXo7Ktj3C68oE/x/MA0U90eJjY55Ob6ohQs1BBrxdkDSABurh/kbE9s3lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLLB9jPu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLLB9jPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711445035; x=1742981035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QsR1evSSsBiuGGPAyFaU13fPJFycp4wgpdvy0Jfxak0=;
  b=SLLB9jPunhRBmBp41CwnnStE2cbr5YkcMrtpHv1kOYvPCFC47U3Rvkg9
   MpXAK2u13UBYpoCb5FKIkzK9SUhewaJe0dFY838IxoDczFDcjsKh/Qhw1
   3EuelIC5+sikpb2ap3kyk+JbS467IPiF/RP50uTzRjKk0mVHEQniSJGsq
   BqL+fCx2pri5MKM7/KdOnkbdOuNu9b2SHOM2EX/rDPwZpgezV6yFzSfzl
   w3I/rCYLAP3NQ9j9PbOja4Me90uABLxaiBjSubF2U55jdGdWrHMDgNdLo
   fUlLUJMOcXeFNy/0VuL54FiRlLRrQBTo202ahodU/Ef/CHInUrKSTsa73
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6696699"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6696699"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 02:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="15882287"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2024 02:23:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp327-000NGe-2C;
	Tue, 26 Mar 2024 09:23:51 +0000
Date: Tue, 26 Mar 2024 17:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:random-stuff 1/9] drivers/clk/meson/meson8b.c:3803:14:
 warning: unused variable 'notifier_clk'
Message-ID: <202403261711.1Houd1vW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git random-stuff
head:   7b737b577d9a8187adb5ce64fe4ffaea386e1ad7
commit: 59bc200481e0994d94723aaec47e279b067176d8 [1/9] clk: meson: meson8b: Simplify notifier clock lookup
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240326/202403261711.1Houd1vW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261711.1Houd1vW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261711.1Houd1vW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/meson/meson8b.c:3803:14: warning: unused variable 'notifier_clk' [-Wunused-variable]
           struct clk *notifier_clk;
                       ^
   1 warning generated.


vim +/notifier_clk +3803 drivers/clk/meson/meson8b.c

5e4e480466e611f Neil Armstrong      2023-06-12  3797  
cce433e6bc53b39 Martin Blumenstingl 2018-12-08  3798  static void __init meson8b_clkc_init_common(struct device_node *np,
5e4e480466e611f Neil Armstrong      2023-06-12  3799  					    struct meson_clk_hw_data *hw_clks)
189621726bc2f66 Martin Blumenstingl 2017-07-28  3800  {
189621726bc2f66 Martin Blumenstingl 2017-07-28  3801  	struct meson8b_clk_reset *rstc;
89ab396d712f7c9 Liang He            2022-06-28  3802  	struct device_node *parent_np;
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15 @3803  	struct clk *notifier_clk;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3804  	struct regmap *map;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3805  	int i, ret;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3806  
89ab396d712f7c9 Liang He            2022-06-28  3807  	parent_np = of_get_parent(np);
89ab396d712f7c9 Liang He            2022-06-28  3808  	map = syscon_node_to_regmap(parent_np);
89ab396d712f7c9 Liang He            2022-06-28  3809  	of_node_put(parent_np);
bb6eddd1d28c9c4 Martin Blumenstingl 2018-10-28  3810  	if (IS_ERR(map)) {
40e977400d21aab Martin Blumenstingl 2020-12-21  3811  		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3812  		return;
bb6eddd1d28c9c4 Martin Blumenstingl 2018-10-28  3813  	}
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3814  
189621726bc2f66 Martin Blumenstingl 2017-07-28  3815  	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3816  	if (!rstc)
189621726bc2f66 Martin Blumenstingl 2017-07-28  3817  		return;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3818  
189621726bc2f66 Martin Blumenstingl 2017-07-28  3819  	/* Reset Controller */
93c873d68646165 Martin Blumenstingl 2018-07-21  3820  	rstc->regmap = map;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3821  	rstc->reset.ops = &meson8b_clk_reset_ops;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3822  	rstc->reset.nr_resets = ARRAY_SIZE(meson8b_clk_reset_bits);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3823  	rstc->reset.of_node = np;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3824  	ret = reset_controller_register(&rstc->reset);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3825  	if (ret) {
189621726bc2f66 Martin Blumenstingl 2017-07-28  3826  		pr_err("%s: Failed to register clkc reset controller: %d\n",
189621726bc2f66 Martin Blumenstingl 2017-07-28  3827  		       __func__, ret);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3828  		return;
189621726bc2f66 Martin Blumenstingl 2017-07-28  3829  	}
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3830  
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3831  	/* Populate regmap for the regmap backed clocks */
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3832  	for (i = 0; i < ARRAY_SIZE(meson8b_clk_regmaps); i++)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3833  		meson8b_clk_regmaps[i]->map = map;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3834  
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3835  	/*
40e977400d21aab Martin Blumenstingl 2020-12-21  3836  	 * register all clks and start with the first used ID (which is
40e977400d21aab Martin Blumenstingl 2020-12-21  3837  	 * CLKID_PLL_FIXED)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3838  	 */
5e4e480466e611f Neil Armstrong      2023-06-12  3839  	for (i = CLKID_PLL_FIXED; i < hw_clks->num; i++) {
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3840  		/* array might be sparse */
5e4e480466e611f Neil Armstrong      2023-06-12  3841  		if (!hw_clks->hws[i])
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3842  			continue;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3843  
5e4e480466e611f Neil Armstrong      2023-06-12  3844  		ret = of_clk_hw_register(np, hw_clks->hws[i]);
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3845  		if (ret)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3846  			return;
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3847  	}
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3848  
5e4e480466e611f Neil Armstrong      2023-06-12  3849  	meson8b_cpu_nb_data.cpu_clk = hw_clks->hws[CLKID_CPUCLK];
cce433e6bc53b39 Martin Blumenstingl 2018-12-08  3850  
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3851  	/*
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3852  	 * FIXME we shouldn't program the muxes in notifier handlers. The
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3853  	 * tricky programming sequence will be handled by the forthcoming
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3854  	 * coordinated clock rates mechanism once that feature is released.
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3855  	 */
59bc200481e0994 Chen-Yu Tsai        2023-03-15  3856  	ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3857  	if (ret) {
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3858  		pr_err("%s: failed to register the CPU clock notifier\n",
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3859  		       __func__);
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3860  		return;
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3861  	}
7dc7eeb8c0875c4 Martin Blumenstingl 2018-11-15  3862  
5e4e480466e611f Neil Armstrong      2023-06-12  3863  	ret = of_clk_add_hw_provider(np, meson_clk_hw_get, hw_clks);
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3864  	if (ret)
6291b8c5ac67d0f Martin Blumenstingl 2018-07-21  3865  		pr_err("%s: failed to register clock provider\n", __func__);
189621726bc2f66 Martin Blumenstingl 2017-07-28  3866  }
189621726bc2f66 Martin Blumenstingl 2017-07-28  3867  

:::::: The code at line 3803 was first introduced by commit
:::::: 7dc7eeb8c0875c4bb7607509d9270ad3fd726b6b clk: meson: meson8b: run from the XTAL when changing the CPU frequency

:::::: TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
:::::: CC: Neil Armstrong <narmstrong@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
