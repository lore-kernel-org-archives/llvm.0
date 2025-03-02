Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7C4C81;
	Sun,  2 Mar 2025 05:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740894867; cv=none; b=kDT1sxZqvaiLfD2/Y3Y3zPgIdob/zd8mZJnqieIUnHqsWQJLLHtew3439OeUNpJPqxxs2fG4iV5jkpZKhcMqbaoP6Y5P19JCiLaT1wLPf57rzDio3Oto2/Sf6yvK2cSixs44/5rv2RlJtps2+yKJyublrhfrf+A7vN88d/RLvWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740894867; c=relaxed/simple;
	bh=bwxh65enYp7z7+nk/ktcyTAllt4Dp53/Oa30yt7HiuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QffXWVAoFxXmcVr0HjB0ypurpwR7JK2t9epQ8DrvvIC9iiJRt4Rq2TX64+Qt12ep+Ve0wqKik0RiIUqGmVJHAJ25S9EvlefoA5wO+CFxeEFOoB2Lwhv5xfjkRPNKdkPJ917vCEji9TKDbVAA/ZIyGUaVOtPxpqcZPZj66+LvH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5Zusn+9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5Zusn+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740894865; x=1772430865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwxh65enYp7z7+nk/ktcyTAllt4Dp53/Oa30yt7HiuU=;
  b=M5Zusn+972QAiL0oU0wnafStuXMaqeuusjE1Wx3fgeOwWQTcycxhW3qv
   69aijrzlqIaM1J3Gb+r6Emyo/JsbRTNyQDm6wrtuRaLhf9hDO6CMj4uo7
   hrhsWox4CHIAXF1z9SbXsB8vzKXB1HlBPjGBEXUXqhsuidM8liI3mf5pk
   2x9I6pQM9Qc9L6dz/+2mHqZ9wbZEsokyY17VRJa/y0I1gMQr7vnQA9Unf
   nSLxl4FmqgM9Iu4mzQe3Z8PjrlHyhyn0w1HyCMS+uJjJlXrvz8wNVAK1r
   FpX2iUgkfmU1H5H2e8wbCVkWfBMCdXBx1ye7S+y2IxSTbakotOg+svSU3
   w==;
X-CSE-ConnectionGUID: gFuu+cI/Q12Oy1h8Td+5rA==
X-CSE-MsgGUID: hLhEgcGVQCyxbBre8bjSfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="67155140"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="67155140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 21:54:24 -0800
X-CSE-ConnectionGUID: WCehWzXNSiC9JI7J71HIQg==
X-CSE-MsgGUID: ZMWTrckeReaUabKYD4YVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="122710107"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2025 21:54:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tocHK-000H6U-3C;
	Sun, 02 Mar 2025 05:54:18 +0000
Date: Sun, 2 Mar 2025 13:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Tao Huang <huangtao@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [rockchip:v6.15-clk/next 10/10]
 drivers/clk/rockchip/clk-rk3562.c:1081:31: error: incomplete definition of
 type 'struct platform_device'
Message-ID: <202503021302.FjsycBI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-clk/next
head:   36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a
commit: 36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a [10/10] clk: rockchip: Add clock controller for the RK3562
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250302/202503021302.FjsycBI2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021302.FjsycBI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021302.FjsycBI2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rk3562.c:1079:36: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^
>> drivers/clk/rockchip/clk-rk3562.c:1081:31: error: incomplete definition of type 'struct platform_device'
    1081 |         struct device_node *np = pdev->dev.of_node;
         |                                  ~~~~^
   drivers/clk/rockchip/clk-rk3562.c:1079:36: note: forward declaration of 'struct platform_device'
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^
   drivers/clk/rockchip/clk-rk3562.c:1085:55: error: incomplete definition of type 'struct platform_device'
    1085 |         match = of_match_device(clk_rk3562_match_table, &pdev->dev);
         |                                                          ~~~~^
   drivers/clk/rockchip/clk-rk3562.c:1079:36: note: forward declaration of 'struct platform_device'
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^
>> drivers/clk/rockchip/clk-rk3562.c:1096:31: error: variable has incomplete type 'struct platform_driver'
    1096 | static struct platform_driver clk_rk3562_driver = {
         |                               ^
   drivers/clk/rockchip/clk-rk3562.c:1096:15: note: forward declaration of 'struct platform_driver'
    1096 | static struct platform_driver clk_rk3562_driver = {
         |               ^
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1104 | module_platform_driver(clk_rk3562_driver);
         | ^
         | int
>> drivers/clk/rockchip/clk-rk3562.c:1104:24: error: a parameter list without types is only allowed in a function definition
    1104 | module_platform_driver(clk_rk3562_driver);
         |                        ^
   1 warning and 5 errors generated.


vim +1081 drivers/clk/rockchip/clk-rk3562.c

  1078	
> 1079	static int clk_rk3562_probe(struct platform_device *pdev)
  1080	{
> 1081		struct device_node *np = pdev->dev.of_node;
  1082		const struct of_device_id *match;
  1083		const struct clk_rk3562_inits *init_data;
  1084	
  1085		match = of_match_device(clk_rk3562_match_table, &pdev->dev);
  1086		if (!match || !match->data)
  1087			return -EINVAL;
  1088	
  1089		init_data = match->data;
  1090		if (init_data->inits)
  1091			init_data->inits(np);
  1092	
  1093		return 0;
  1094	}
  1095	
> 1096	static struct platform_driver clk_rk3562_driver = {
  1097		.probe		= clk_rk3562_probe,
  1098		.driver		= {
  1099			.name	= "clk-rk3562",
  1100			.of_match_table = clk_rk3562_match_table,
  1101			.suppress_bind_attrs = true,
  1102		},
  1103	};
> 1104	module_platform_driver(clk_rk3562_driver);
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
