Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0BF36998C;
	Thu, 10 Sep 2026 05:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018481; cv=none; b=LXFm/E3sWRkrf0kjxv9aBatlsf426STiXOPLYwKpgjmm1LHcMnHzH2VpDAjowElIyxrSfDDXTbdQ/a3A6swD4+o7ztZbTcyGfgBmxZWGN56ZfxxxGli83eoDmlaCijR7Br1jJmhwOEFIsYiLYDbYHAm2jISK8M22mkXzomCOQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018481; c=relaxed/simple;
	bh=Rowyx8vfNMu8I5WZOtghB/vCnSBqyv8xE3TmNv5Dk5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tTl6u39SfxHBd4ULe8alXoAML5rRbh7fvIwSDG5IeEWmF95CmZqzDNHghmMEf4vkugkkVv5SZzhRJ63PKWZYFuKuX2adCEj7iBu46mOuVLZ+vyzSw6y38C2rio37PP/ClfhTzVoyyUqwQ4PIgB9iRf1Y4E8ESbEHUEKU8alDw6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLfkpYXX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLfkpYXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789018478; x=1820554478;
  h=date:from:to:cc:subject:message-id;
  bh=Rowyx8vfNMu8I5WZOtghB/vCnSBqyv8xE3TmNv5Dk5U=;
  b=mLfkpYXXjSP8xAayDZHWGebGQo8HoP7+fIL6kbBHHO6lJFgR1NihA4HA
   I8MP5JeM2qlbsSBTU8jfxl+gQ9Fvzc4prU3mN+kDZyaydRb+yc8qyH3+3
   rTUOxswJSCHZVCl8x4phZlv6dCVz94SxDy5kR6FiJzdrk3eT17s6tIeik
   npkfxtbue0i6DlPXXBhUXD9T3B4//2vwjxfWCwN9X3FEMmdsQIVAVDe0s
   cEO7t9saCt9ZdKoc9RBo9sDgVasLVD9gJ20lm+oE3Z3+u885wDzvazhCY
   eDwfb033VgTSMbGMSKE8iNZaNg59AOpkx1NjTgmwly/brlNv6Ntcp0ME3
   Q==;
X-CSE-ConnectionGUID: aWknCEw5SVO4J039LHs4ag==
X-CSE-MsgGUID: Tj0IBa++SIyZE2lRBycPLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106972396"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106972396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 22:34:38 -0700
X-CSE-ConnectionGUID: VCBLggcUTraoYguH2dZ7MQ==
X-CSE-MsgGUID: ZWdiz6kNS0yPk/gz9piwgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="268969624"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 22:34:36 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4XQf-000000001QC-1BZo;
	Thu, 10 Sep 2026 05:34:33 +0000
Date: Thu, 10 Sep 2026 13:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v7.4 16/16]
 drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
 identifier '__free_kfree'; did you mean '__free_pages'?
Message-ID: <202609101334.xgbNoC4e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.4
head:   810b8b6c4e02c40991c29491cec09ebdaf5ec6d0
commit: 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0 [16/16] clk: renesas: r9a09g077: Register SYSC regmap
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
         |                                          ^~~~~~~~~~~~~
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^~~~~~~~~~~~~~
   <scratch space>:3:1: note: expanded from here
       3 | __free_kfree
         | ^~~~~~~~~~~~
   include/linux/gfp.h:342:13: note: '__free_pages' declared here
     342 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function '__free_pages' must take 1 parameter
     966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
         |                                          ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:3:1: note: expanded from here
       3 | __free_kfree
         | ^
>> drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
         |                                                          ^
>> drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer to pointer conversion initializing 'struct regmap_config *' with an expression of type 'int' [-Wint-conversion]
     966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
         |                               ^                          ~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +966 drivers/clk/renesas/r9a09g077-cpg.c

   963	
   964	static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
   965	{
 > 966		struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
   967		struct r9a09g077_sysc_reg *sysc_reg;
   968		struct regmap *regmap;
   969		struct resource res;
   970		int ret;
   971	
   972		/*
   973		 * Return early if the SYSC sizes are not as expected, for backwards
   974		 * compatibility with older device trees that only expose the 64 KiB
   975		 * CPG register window.
   976		 */
   977		ret = of_address_to_resource(dev->of_node, 0, &res);
   978		if (ret)
   979			return ret;
   980		if (resource_size(&res) != RZT2H_CPG_REG_SIZE)
   981			return 0;
   982	
   983		ret = of_address_to_resource(dev->of_node, 1, &res);
   984		if (ret)
   985			return ret;
   986		if (resource_size(&res) != RZT2H_CPG_REG_SIZE)
   987			return 0;
   988	
   989		if (!regmap_cfg)
   990			return -ENOMEM;
   991	
   992		sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
   993		if (!sysc_reg)
   994			return -ENOMEM;
   995	
   996		/* Only allow access in the SYSC regions */
   997		sysc_reg->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
   998		sysc_reg->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
   999	
  1000		regmap_cfg->name = "rzt2h_sysc";
  1001		regmap_cfg->reg_bits = 32;
  1002		regmap_cfg->reg_stride = 4;
  1003		regmap_cfg->val_bits = 32;
  1004		regmap_cfg->fast_io = true;
  1005		regmap_cfg->max_register = RZT2H_SYSC_SIZE - 1;
  1006		regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
  1007		regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
  1008	
  1009		regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
  1010		if (IS_ERR(regmap))
  1011			return PTR_ERR(regmap);
  1012	
  1013		return of_syscon_register_regmap(dev->of_node, regmap);
  1014	}
  1015	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
