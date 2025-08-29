Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61917257AFB;
	Fri, 29 Aug 2025 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756499056; cv=none; b=gdWMRWi3SDMLfm741fdpRnLHJFUNPUV3uDCjo9K6zOj/EBwwt0QtC6vbuW40T2Z6jYsZAWPQmu2jphfk4dpVea5MH3dSuWDHnaXfpJpIqsfJ8MM56EYOQbTMY0FPUe1jidwrWTBeXDMqUZ8yzZREBuiGdUW4VCYuP/Z23wYpNTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756499056; c=relaxed/simple;
	bh=/qCsDlEDUKhVuv6bXMSBEIQDvt+0P6DwHTYbTssMHB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLfVeh/37Qy2zC+Tjmy+Zhp/OjMSkTPyX7ED4AMcDdxsefWPbdmNzyypYAmqIk68jbxcgjIeow7SefoglTTfZYe9eylirFtwlJ5liT6dADwYrPoIJgu7hOAou5H3TzYPdebx1/N89vH+ofmmXDn3tPdbiCdWTlWBWQxd8QpPnj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFa9qV5X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFa9qV5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756499055; x=1788035055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qCsDlEDUKhVuv6bXMSBEIQDvt+0P6DwHTYbTssMHB8=;
  b=aFa9qV5Xw38f9jnZck+PHPXqsGeYgPZWBzDGpxxf3KPR+8r4xAAy2BkY
   wBJMx7A6nTa6YXVuZ68nJbi4LPSgHHBpGJwNBMhl2/qGn1WKUl0RQ1sDV
   vKvnH63tI0P/jwaroa/YoFrt1U6AyZHgABUzIWtqBqNmXVbjBtYePK+mo
   /6aq4HU65dnJ8BcqYRS1Gbd98K+LlAvUHm+lJ9yPWS64jdzMcBh49YAMK
   ZeGkI7nQAcY2jrKkBf7DFTeHZuzKTpa0Lr8XOL31uZwp8rn1TvNiBdlg2
   mbh03dUz+PKdLuVDnrrm9D+MBa6QCMmTnuD7fdQNg5vKTeDMKDokFZfrx
   Q==;
X-CSE-ConnectionGUID: mVjR+HhaTouYYha5hmCL+g==
X-CSE-MsgGUID: 6GltadqRSUChzhRm3Hzl9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="61428503"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61428503"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 13:24:14 -0700
X-CSE-ConnectionGUID: Xuoqho4TQcyo/OXmJ3V8fw==
X-CSE-MsgGUID: iXrtQf7kTe+EskUWK39z3A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Aug 2025 13:24:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us5dq-000UwV-1e;
	Fri, 29 Aug 2025 20:24:10 +0000
Date: Sat, 30 Aug 2025 04:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [sre-misc:thinkpad-t14s-x1e 57/95]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: initializer
 element is not a compile-time constant
Message-ID: <202508300416.siXP5kl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   9dd4135e4233415f1082b5addd91211121dad8af
commit: 298f529d0c46850b0d6d48f29d085aab13509929 [57/95] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250830/202508300416.siXP5kl7-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300416.siXP5kl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300416.siXP5kl7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: initializer element is not a compile-time constant
                   zero,
                   ^~~~
   1 error generated.


vim +486 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

   464	
   465	const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
   466		.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
   467		.reg_info = {
   468			.init_seq = lane_regs_x1e80100,
   469			.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
   470			.offset = 0x1000,
   471			.generation = GEN2,
   472		},
   473		.supply_names = (const char *[]){
   474			"vdda-0p8",
   475			"vdda-1p2"
   476		},
   477		.num_supplies = 2,
   478		.clk_names = (const char *[]) {
   479			"camnoc_axi",
   480			"cpas_ahb",
   481			"csiphy",
   482			"csiphy_timer"
   483		},
   484		.num_clk = 4,
   485		.clk_freq = {
 > 486			zero,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
