Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268B1CAA4;
	Thu, 31 Jul 2025 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753933735; cv=none; b=KvYqMrcvUQofk5Lhu7EOwhMHOXw3exMAjSjJBgrrmi7TSgYkJCufMSjtpfSUknwlKx3LazcC0tYqNkK50lesz6bGL7XKshA1oU8bCUG0Ue5rpidbUMTWydQ4Q2lIkSlVG12RRSUcfa2aZio0yK/9a5cgBxIWBJS3h4Ch0nqLnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753933735; c=relaxed/simple;
	bh=aOCIhYRFcy/WlCNvZXc1hi4+E9yJVMJ+x2phSpebeL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTAp6mmJT3sKg/6Y1e3OGblmm71yfvCuR5PNG9c2ZOY6ZrP0Tk0YuWEGNJGIh6gtgpiYd6O6FtO+VzRzr+EXTMuh2YyyW1gc4o8GtaNkq4pXrdWZD1gS4XoW5MKJbY56+q6NT3WjWAahLlHV53jeJ7gkRFg1PQ9ZEoUdb5WCVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKD/YJdF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKD/YJdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753933734; x=1785469734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOCIhYRFcy/WlCNvZXc1hi4+E9yJVMJ+x2phSpebeL0=;
  b=EKD/YJdFD3fKg3G+vDP2BVJGTJnjmVMRGv1MjHZTRz3gaXR6Sxs33yPO
   41eGVjNz7/5kVje4T4kQ1t/lMzqVH+c7l+eNSiyuCB4QPvfuGQjBRYqhD
   zRzJpSvYPWomawMrz6Ua9zs+/DWDZTEkf5mc4p2/vCzUX0SuH0hVOuXfh
   R+oF6tKxG+XDYdSQ788s+Yfq0Ez/po0CgWbSnVU9RYagTKEXzr6146ejJ
   Rf5bAy2uuN1V1DG4P3AxVU1EHpkZCofJTZFsBQnXwPhny6E7LDuTc6vrt
   +8KIHrXebBy1WeqM5e4gByhLmcG+YyZD90sTLXKGS5adRVlh7r56duIoR
   Q==;
X-CSE-ConnectionGUID: o3lyxR2tTH6o8fV4sA7P8Q==
X-CSE-MsgGUID: zvlxNt4NSgSnolSW5cmFbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60064192"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="60064192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 20:48:53 -0700
X-CSE-ConnectionGUID: VoSEbj9AS/OMUBk+cuC3Pw==
X-CSE-MsgGUID: cdyDFgLoQquWeL14gv+lwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162434293"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 20:48:53 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhKHi-0003O6-10;
	Thu, 31 Jul 2025 03:48:50 +0000
Date: Thu, 31 Jul 2025 11:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [masneyb:20250729-clk-round-rate-test 41/84]
 drivers/clk/nxp/clk-lpc32xx.c:979:37: error: use of undeclared identifier
 'rate'
Message-ID: <202507311123.vRJHjnCu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux 20250729-clk-round-rate-test
head:   41999896917d01bf839d72daf8328790029b9a56
commit: d3c486e03d156b6ee1d164161bcb3b9832781889 [41/84] clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
config: arm-randconfig-004-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311123.vRJHjnCu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311123.vRJHjnCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311123.vRJHjnCu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/nxp/clk-lpc32xx.c:979:37: error: use of undeclared identifier 'rate'
     979 |         req->rate = divider_round_rate(hw, rate, &req->best_parent_rate,
         |                                            ^~~~
   1 error generated.


vim +/rate +979 drivers/clk/nxp/clk-lpc32xx.c

   960	
   961	static int clk_divider_determine_rate(struct clk_hw *hw,
   962					      struct clk_rate_request *req)
   963	{
   964		struct lpc32xx_clk_div *divider = to_lpc32xx_div(hw);
   965		unsigned int bestdiv;
   966	
   967		/* if read only, just return current value */
   968		if (divider->flags & CLK_DIVIDER_READ_ONLY) {
   969			regmap_read(clk_regmap, divider->reg, &bestdiv);
   970			bestdiv >>= divider->shift;
   971			bestdiv &= div_mask(divider->width);
   972			bestdiv = _get_div(divider->table, bestdiv, divider->flags,
   973				divider->width);
   974			req->rate = DIV_ROUND_UP(req->best_parent_rate, bestdiv);
   975	
   976			return 0;
   977		}
   978	
 > 979		req->rate = divider_round_rate(hw, rate, &req->best_parent_rate,
   980					       divider->table,
   981					       divider->width, divider->flags);
   982	
   983		return 0;
   984	}
   985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
