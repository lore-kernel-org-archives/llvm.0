Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829B79B9C;
	Sun, 23 Jun 2024 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719166877; cv=none; b=eOnsh3TTCcXuhFv4AWDtvxlVECPfAEMtiYRxImSI2xOvR0IhVR7E5wu7CL2h0afMjPlInhsTK0uyNhBK320As579j8HS5TCQskFEdgRJHbBpvcnbIeC4glyh3jJxD30O7QIG1UAD5o1aRX4cx+MtIiXT7WxBgQBwBxkNjxy7SeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719166877; c=relaxed/simple;
	bh=duSWdQ+aOaP9HENYg1+didyYLS480gMI9XxeuWAa1M4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKrBtV1qcaa1khO8siG2pMsHzLv2kyovc0DpHQN4unQr0cv6f1O5naVb9UKaLf+xNOc1Ln+JvCvgcDY5+XWjUFaHwcovXfAHhfZfmFoYqy0xXSFO5kUAE2Z+VKy/SZ0B8mgBwst8AuiuXUIL2NrSajoTpk6Tz3ixA4/pIVZaykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuAgNV7V; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuAgNV7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719166875; x=1750702875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=duSWdQ+aOaP9HENYg1+didyYLS480gMI9XxeuWAa1M4=;
  b=MuAgNV7Vrz8F6qfDcmxfszVbqXWZZDsOuz3gOsVB/rbhlEq5Lyk/XwmZ
   80tW91OsKpheKo0Z9uuZnXKg3KsZIMV0H/1QQcUMUAaBFwnbImEEf/fZP
   GphneniBwximpthkaSRosFQkI8c/raDDNWSW9DHWzefAcN6ZrzT+SnSSo
   lwRKczNqosm1zfsEe1mIq4jVZaQxk3p2OmrFlonYdOF3CC24x1Do5IPD+
   IxPO8rVQW7eG3CwQ+5OQCu4v5HPUPSoExMF/eV2AQY3vMB39cW/HmmGQI
   WMiw6ZryKRAmcVBfi/KYvDm+ZF7mT+Qx+vWJsVG2ayqQW8D2WxdEzG7ps
   g==;
X-CSE-ConnectionGUID: WCeD/X38T3WL/1/Fef3YHA==
X-CSE-MsgGUID: A4zhCEBqSWmbyKQI+X30GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16273704"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="16273704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 11:21:14 -0700
X-CSE-ConnectionGUID: 8XZG4GP9SluckJkCcub7pg==
X-CSE-MsgGUID: XlbtoyUpQo2iukJMD25f0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="48245771"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jun 2024 11:21:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLRpu-000AwE-2f;
	Sun, 23 Jun 2024 18:21:10 +0000
Date: Mon, 24 Jun 2024 02:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Bee <knaerzche@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 4036/7797]
 drivers/clk/rockchip/clk-rk3128.c:582:40: error: use of undeclared
 identifier 'CLK_NR_CLKS'
Message-ID: <202406240243.f4Ux9lv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
commit: 9f22b4fbd4c6d27ca4e5f8fa6632e6d7a846af28 [4036/7797] dt-bindings: clock: rk3128: Drop CLK_NR_CLKS
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240624/202406240243.f4Ux9lv5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240243.f4Ux9lv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406240243.f4Ux9lv5-lkp@intel.com/

Note: the linux-next/master HEAD f76698bd9a8ca01d3581236082d786e9a6b72bb7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rk3128.c:582:40: error: use of undeclared identifier 'CLK_NR_CLKS'
           ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
                                                 ^
   1 error generated.


vim +/CLK_NR_CLKS +582 drivers/clk/rockchip/clk-rk3128.c

f6022e88faca1a Elaine Zhang 2017-06-02  570  
334614058886fc Elaine Zhang 2017-08-01  571  static struct rockchip_clk_provider *__init rk3128_common_clk_init(struct device_node *np)
f6022e88faca1a Elaine Zhang 2017-06-02  572  {
f6022e88faca1a Elaine Zhang 2017-06-02  573  	struct rockchip_clk_provider *ctx;
f6022e88faca1a Elaine Zhang 2017-06-02  574  	void __iomem *reg_base;
f6022e88faca1a Elaine Zhang 2017-06-02  575  
f6022e88faca1a Elaine Zhang 2017-06-02  576  	reg_base = of_iomap(np, 0);
f6022e88faca1a Elaine Zhang 2017-06-02  577  	if (!reg_base) {
f6022e88faca1a Elaine Zhang 2017-06-02  578  		pr_err("%s: could not map cru region\n", __func__);
334614058886fc Elaine Zhang 2017-08-01  579  		return ERR_PTR(-ENOMEM);
f6022e88faca1a Elaine Zhang 2017-06-02  580  	}
f6022e88faca1a Elaine Zhang 2017-06-02  581  
f6022e88faca1a Elaine Zhang 2017-06-02 @582  	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
f6022e88faca1a Elaine Zhang 2017-06-02  583  	if (IS_ERR(ctx)) {
f6022e88faca1a Elaine Zhang 2017-06-02  584  		pr_err("%s: rockchip clk init failed\n", __func__);
f6022e88faca1a Elaine Zhang 2017-06-02  585  		iounmap(reg_base);
334614058886fc Elaine Zhang 2017-08-01  586  		return ERR_PTR(-ENOMEM);
f6022e88faca1a Elaine Zhang 2017-06-02  587  	}
f6022e88faca1a Elaine Zhang 2017-06-02  588  
f6022e88faca1a Elaine Zhang 2017-06-02  589  	rockchip_clk_register_plls(ctx, rk3128_pll_clks,
f6022e88faca1a Elaine Zhang 2017-06-02  590  				   ARRAY_SIZE(rk3128_pll_clks),
f6022e88faca1a Elaine Zhang 2017-06-02  591  				   RK3128_GRF_SOC_STATUS0);
334614058886fc Elaine Zhang 2017-08-01  592  	rockchip_clk_register_branches(ctx, common_clk_branches,
334614058886fc Elaine Zhang 2017-08-01  593  				  ARRAY_SIZE(common_clk_branches));
f6022e88faca1a Elaine Zhang 2017-06-02  594  
f6022e88faca1a Elaine Zhang 2017-06-02  595  	rockchip_clk_register_armclk(ctx, ARMCLK, "armclk",
f6022e88faca1a Elaine Zhang 2017-06-02  596  			mux_armclk_p, ARRAY_SIZE(mux_armclk_p),
f6022e88faca1a Elaine Zhang 2017-06-02  597  			&rk3128_cpuclk_data, rk3128_cpuclk_rates,
f6022e88faca1a Elaine Zhang 2017-06-02  598  			ARRAY_SIZE(rk3128_cpuclk_rates));
f6022e88faca1a Elaine Zhang 2017-06-02  599  
f6022e88faca1a Elaine Zhang 2017-06-02  600  	rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
f6022e88faca1a Elaine Zhang 2017-06-02  601  				  ROCKCHIP_SOFTRST_HIWORD_MASK);
f6022e88faca1a Elaine Zhang 2017-06-02  602  
f6022e88faca1a Elaine Zhang 2017-06-02  603  	rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
f6022e88faca1a Elaine Zhang 2017-06-02  604  
334614058886fc Elaine Zhang 2017-08-01  605  	return ctx;
334614058886fc Elaine Zhang 2017-08-01  606  }
334614058886fc Elaine Zhang 2017-08-01  607  

:::::: The code at line 582 was first introduced by commit
:::::: f6022e88faca1a6a21cbd0f009b477bc530b9cc7 clk: rockchip: add clock controller for rk3128

:::::: TO: Elaine Zhang <zhangqing@rock-chips.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
