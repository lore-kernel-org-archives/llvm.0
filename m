Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3FF72615;
	Fri, 11 Jul 2025 01:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752197167; cv=none; b=X76VtxyQSy+02hjDbDA68PKAeqq1Gpe1Tc7yiiwyTr+RGgE1iTq1EaTdFgbd1uKow3y37vgILTTu9Sbvi615Qwnt+yyin4bZ8SFu9XvzvvDB48ofpzBi9LP5onGav+xPK+L3I6j0Wuix9cdb1K1oMWAqoQYrFuXoC8f5PT4wUDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752197167; c=relaxed/simple;
	bh=fYXmMgl5ryYa5BqePhDFM3BxfDoZbobMEdUj3tmls30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6f+sokmy8Sbs3uEsOBYr7SBZsWtBY7/oIUEmvS6Pzt9AH0INIMgpp9tS/8yuSHIo4gKbBdJA/nuq7nrzqoLvg/sOtUEygY2jA21MYS6PEqGT7ItVqwJXOxbiPET2phoVxf+Pz2pdqceky+8JQ9qHkWmdOuE7dbu1SVwmUV7L1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mY62gsH9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mY62gsH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752197165; x=1783733165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYXmMgl5ryYa5BqePhDFM3BxfDoZbobMEdUj3tmls30=;
  b=mY62gsH90EFrdCBw8fdrQXbYocZie9gcw7P2u+Aip8t2aeFfYjrlsXGn
   Tc2MWLGuF7EUov1m3/QF1J2lH02siDYVNqiFA3fZR5VxTZ0ZI9BU5vxcf
   1HhuSfNJYSVFqKA3Ng136Kqw2YzzpAgVohdySrvj8SIUoEGe/dIy4r28q
   5JD1fe4zmy5LaysFVxdcBO9svDMdhxXFrJbVTATN1EaS3ljA8B/+eqS5k
   NvWlIcy1zgXQAA8NQkFYYq+Iju4cW+1ij/EmXIKmkDcnf0YFjKOAByZuI
   207u7o6ff17OLjtCA+8WeYejO9htoK/ubkduiajbCoiK2oqIzZjlA/RNm
   Q==;
X-CSE-ConnectionGUID: A6epOtclRGK2pkhVuD+Uew==
X-CSE-MsgGUID: Fw5aDD65QQqM+eae7GJbZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65075589"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65075589"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 18:25:23 -0700
X-CSE-ConnectionGUID: 4JMv0kz6RZWsGRMc/62gaA==
X-CSE-MsgGUID: TtT7VnuATQWMA4vhxucBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155660554"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2025 18:25:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua2Vr-0005ib-2Y;
	Fri, 11 Jul 2025 01:25:19 +0000
Date: Fri, 11 Jul 2025 09:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-remove-round-rate 155/204]
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:608:1: error: function definition
 is not allowed here
Message-ID: <202507110920.2tVMqCWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux clk-remove-round-rate
head:   8851da05a900556018f975b6ca1691e13d24fc50
commit: f7c15fd0ef5d37b26881dfdcabb6371bf6743eee [155/204] drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
config: um-randconfig-002-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110920.2tVMqCWF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110920.2tVMqCWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110920.2tVMqCWF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:11:
   In file included from drivers/gpu/drm/msm/dsi/phy/dsi_phy.h:12:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:608:1: error: function definition is not allowed here
     608 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:627:1: error: function definition is not allowed here
     627 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:643:1: error: function definition is not allowed here
     643 | {
         | ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:684:17: error: use of undeclared identifier 'dsi_pll_14nm_postdiv_recalc_rate'; did you mean 'dsi_pll_14nm_vco_recalc_rate'?
     684 |         .recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        dsi_pll_14nm_vco_recalc_rate
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:494:22: note: 'dsi_pll_14nm_vco_recalc_rate' declared here
     494 | static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
         |                      ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:685:20: error: use of undeclared identifier 'dsi_pll_14nm_postdiv_determine_rate'; did you mean 'dsi_pll_14nm_clk_determine_rate'?
     685 |         .determine_rate = dsi_pll_14nm_postdiv_determine_rate,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           dsi_pll_14nm_clk_determine_rate
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:581:12: note: 'dsi_pll_14nm_clk_determine_rate' declared here
     581 | static int dsi_pll_14nm_clk_determine_rate(struct clk_hw *hw,
         |            ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:686:14: error: use of undeclared identifier 'dsi_pll_14nm_postdiv_set_rate'; did you mean 'dsi_pll_14nm_vco_set_rate'?
     686 |         .set_rate = dsi_pll_14nm_postdiv_set_rate,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     dsi_pll_14nm_vco_set_rate
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:460:12: note: 'dsi_pll_14nm_vco_set_rate' declared here
     460 | static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
         |            ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:694:1: error: function definition is not allowed here
     694 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:712:1: error: function definition is not allowed here
     712 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:746:1: error: function definition is not allowed here
     746 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:779:1: error: function definition is not allowed here
     779 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:811:1: error: function definition is not allowed here
     811 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:881:1: error: function definition is not allowed here
     881 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:915:1: error: function definition is not allowed here
     915 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:951:1: error: function definition is not allowed here
     951 | {
         | ^
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:1022:1: error: function definition is not allowed here
    1022 | {
         | ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:1047:13: error: use of undeclared identifier 'dsi_14nm_phy_enable'; did you mean 'msm_dsi_phy_enable'?
    1047 |                 .enable = dsi_14nm_phy_enable,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           msm_dsi_phy_enable
   drivers/gpu/drm/msm/dsi/dsi.h:141:5: note: 'msm_dsi_phy_enable' declared here
     141 | int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
         |     ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:1048:14: error: use of undeclared identifier 'dsi_14nm_phy_disable'; did you mean 'msm_dsi_phy_disable'?
    1048 |                 .disable = dsi_14nm_phy_disable,
         |                            ^~~~~~~~~~~~~~~~~~~~
         |                            msm_dsi_phy_disable
   drivers/gpu/drm/msm/dsi/dsi.h:144:6: note: 'msm_dsi_phy_disable' declared here
     144 | void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
         |      ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:1049:15: error: use of undeclared identifier 'dsi_pll_14nm_init'; did you mean 'dsi_phy_14nm_cfgs'?
    1049 |                 .pll_init = dsi_pll_14nm_init,
         |                             ^~~~~~~~~~~~~~~~~
         |                             dsi_phy_14nm_cfgs
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:1042:30: note: 'dsi_phy_14nm_cfgs' declared here
    1042 | const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
         |                              ^
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c:1050:21: error: use of undeclared identifier 'dsi_14nm_pll_save_state'; did you mean 'msm_dsi_phy_pll_save_state'?
    1050 |                 .save_pll_state = dsi_14nm_pll_save_state,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
         |                                   msm_dsi_phy_pll_save_state
   drivers/gpu/drm/msm/dsi/dsi.h:147:6: note: 'msm_dsi_phy_pll_save_state' declared here
     147 | void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
         |      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +608 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  601  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  602  /*
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  603   * N1 and N2 post-divider clock callbacks
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  604   */
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  605  #define div_mask(width)	((1 << (width)) - 1)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  606  static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  607  						      unsigned long parent_rate)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31 @608  {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  609  	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  610  	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
b7cf8a54549fe9 Dmitry Baryshkov 2021-03-31  611  	void __iomem *base = pll_14nm->phy->base;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  612  	u8 shift = postdiv->shift;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  613  	u8 width = postdiv->width;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  614  	u32 val;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  615  
9f91f22aafcd63 Dmitry Baryshkov 2021-03-31  616  	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, parent_rate);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  617  
8fd6f64ddba041 Konrad Dybcio    2024-04-23  618  	val = readl(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0) >> shift;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  619  	val &= div_mask(width);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  620  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  621  	return divider_recalc_rate(hw, parent_rate, val, NULL,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  622  				   postdiv->flags, width);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  623  }
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  624  
f7c15fd0ef5d37 Brian Masney     2025-07-08  625  static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
f7c15fd0ef5d37 Brian Masney     2025-07-08  626  					       struct clk_rate_request *req)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  627  {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  628  	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  629  	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  630  
f7c15fd0ef5d37 Brian Masney     2025-07-08  631  	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  632  
f7c15fd0ef5d37 Brian Masney     2025-07-08  633  	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
f7c15fd0ef5d37 Brian Masney     2025-07-08  634  				       NULL,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  635  				       postdiv->width,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  636  				       postdiv->flags);
f7c15fd0ef5d37 Brian Masney     2025-07-08  637  
f7c15fd0ef5d37 Brian Masney     2025-07-08  638  	return 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  639  }
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  640  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  641  static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  642  					 unsigned long parent_rate)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  643  {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  644  	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  645  	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
b7cf8a54549fe9 Dmitry Baryshkov 2021-03-31  646  	void __iomem *base = pll_14nm->phy->base;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  647  	spinlock_t *lock = &pll_14nm->postdiv_lock;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  648  	u8 shift = postdiv->shift;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  649  	u8 width = postdiv->width;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  650  	unsigned int value;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  651  	unsigned long flags = 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  652  	u32 val;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  653  
9f91f22aafcd63 Dmitry Baryshkov 2021-03-31  654  	DBG("DSI%d PLL parent rate=%lu parent rate %lu", pll_14nm->phy->id, rate,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  655  	    parent_rate);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  656  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  657  	value = divider_get_val(rate, parent_rate, NULL, postdiv->width,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  658  				postdiv->flags);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  659  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  660  	spin_lock_irqsave(lock, flags);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  661  
8fd6f64ddba041 Konrad Dybcio    2024-04-23  662  	val = readl(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  663  	val &= ~(div_mask(width) << shift);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  664  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  665  	val |= value << shift;
8fd6f64ddba041 Konrad Dybcio    2024-04-23  666  	writel(val, base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  667  
6183606da324b9 Dmitry Baryshkov 2021-07-17  668  	/* If we're master in bonded DSI mode, then the slave PLL's post-dividers
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  669  	 * follow the master's post dividers
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  670  	 */
007687c38a80cb Dmitry Baryshkov 2021-03-31  671  	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  672  		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
b7cf8a54549fe9 Dmitry Baryshkov 2021-03-31  673  		void __iomem *slave_base = pll_14nm_slave->phy->base;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  674  
8fd6f64ddba041 Konrad Dybcio    2024-04-23  675  		writel(val, slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  676  	}
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  677  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  678  	spin_unlock_irqrestore(lock, flags);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  679  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  680  	return 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  681  }
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  682  
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  683  static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31 @684  	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
f7c15fd0ef5d37 Brian Masney     2025-07-08 @685  	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31 @686  	.set_rate = dsi_pll_14nm_postdiv_set_rate,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  687  };
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  688  

:::::: The code at line 608 was first introduced by commit
:::::: d6d1439ec43808447d25ea5c17012ca713ef7c4e drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
