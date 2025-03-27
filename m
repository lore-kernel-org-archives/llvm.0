Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D5DDD3;
	Thu, 27 Mar 2025 04:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743049960; cv=none; b=rLBtk6Pkj8RFvVSXX083/glKC9jCBLbPgeRLxP6RkFh5s2uXhAkM5xJ9qZ+9TuVbYjVbK5tqJP7xChAVn265Wv9R5KhuqV2cJJzE+TRFfASb03r2V2vHv1zrLX5NYYYOKDg2jlIsojOi1NgcYfYRe1dsubDRx1xr34YjeASTSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743049960; c=relaxed/simple;
	bh=Ma01mfL5sO61e0NAWimrdWmyVLokXOLQRJbTQtMdMCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8eoN8b2O+0fc/wBCv4UkD8cj5oM8VpVRAMmrNxpRxkDbUbwUexU78m7PQUKRpGygw0Nb2BCK2gVpwhxpd7EJ4NzSB2lkOxVYF/PdXS4hxCQBN3Njulgt+yAKf5eVbtmmM7Wj/8xVDsZLuf1hf6yxTcXMl3TiUQ11u1yDGBOYqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsvK5flM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsvK5flM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743049959; x=1774585959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ma01mfL5sO61e0NAWimrdWmyVLokXOLQRJbTQtMdMCI=;
  b=HsvK5flMZvBWO1rSBN/iWwOuSRZRcEtUA6wAyC6un9CWOPJR7bgUd2oH
   cV0RzkqjmMSb9OJG4P7jaEY5SAC/7gu3gqkNpc3wSgZ5E2GxaahcAcWMR
   D0HrUJPMBeLsLY6NsFWEVRV4sH0wfhugN9T6oVPCF9JgoY42OHHL6weqg
   MKCXe1lRl1qfRUmddZ4XsGbuyRXH7vrPoWcVMyAlI6beQlF3jQKEeaAL+
   zFjfTX7Stct3HhSyaAmhBFjZu6u57BiFuo3EHErOWzVLKrcS69sYBDM5Q
   xNGxbNOT80Fm1eRhb2NpSTwDB1uzJ1F/fztWFv1AcjjGF4ByhhsMmvu4x
   Q==;
X-CSE-ConnectionGUID: t+A5HrnVRliEffsLbHlxTw==
X-CSE-MsgGUID: G9MojEqCTY66jgJqj3Ti6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66829639"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="66829639"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 21:32:38 -0700
X-CSE-ConnectionGUID: iMih4Ei4QsWsD1rXTZUW5g==
X-CSE-MsgGUID: rtewMiu2RQutQSrUzcCnpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="125528631"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2025 21:32:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txeuw-0006Ml-2a;
	Thu, 27 Mar 2025 04:32:34 +0000
Date: Thu, 27 Mar 2025 12:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH v3 1/4] net: phy: pass PHY driver to
 .match_phy_device OP
Message-ID: <202503271208.yqdElxUG-lkp@intel.com>
References: <20250326233512.17153-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326233512.17153-2-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-pass-PHY-driver-to-match_phy_device-OP/20250327-073812
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250326233512.17153-2-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH v3 1/4] net: phy: pass PHY driver to .match_phy_device OP
config: arm-randconfig-003-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271208.yqdElxUG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271208.yqdElxUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271208.yqdElxUG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/nxp-c45-tja11xx.c:2089:23: error: incompatible function pointer types initializing 'int (*)(struct phy_device *, const struct phy_driver *)' with an expression of type 'int (struct phy_device *)' [-Wincompatible-function-pointer-types]
    2089 |                 .match_phy_device       = tja1103_match_phy_device,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/nxp-c45-tja11xx.c:2113:23: error: incompatible function pointer types initializing 'int (*)(struct phy_device *, const struct phy_driver *)' with an expression of type 'int (struct phy_device *)' [-Wincompatible-function-pointer-types]
    2113 |                 .match_phy_device       = tja1104_match_phy_device,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/nxp-c45-tja11xx.c:2138:23: error: incompatible function pointer types initializing 'int (*)(struct phy_device *, const struct phy_driver *)' with an expression of type 'int (struct phy_device *)' [-Wincompatible-function-pointer-types]
    2138 |                 .match_phy_device       = tja1120_match_phy_device,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/nxp-c45-tja11xx.c:2163:23: error: incompatible function pointer types initializing 'int (*)(struct phy_device *, const struct phy_driver *)' with an expression of type 'int (struct phy_device *)' [-Wincompatible-function-pointer-types]
    2163 |                 .match_phy_device       = tja1121_match_phy_device,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +2089 drivers/net/phy/nxp-c45-tja11xx.c

f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2065) 
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2066) static struct phy_driver nxp_c45_driver[] = {
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2067) 	{
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2068) 		.name			= "NXP C45 TJA1103",
369da333569eb8 Radu Pirea (NXP OSS  2023-07-31  2069) 		.get_features		= nxp_c45_get_features,
6c0c85da044e92 Radu Pirea (NXP OSS  2023-07-31  2070) 		.driver_data		= &tja1103_phy_data,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2071) 		.probe			= nxp_c45_probe,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2072) 		.soft_reset		= nxp_c45_soft_reset,
ac0687e821cffa Radu Pirea (NXP OSS  2023-07-31  2073) 		.config_aneg		= genphy_c45_config_aneg,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2074) 		.config_init		= nxp_c45_config_init,
425c8348df7b86 Radu Pirea (NXP OSS  2023-07-31  2075) 		.config_intr		= tja1103_config_intr,
b2f0ca00e6b34b Radu Pirea (NXP OSS  2021-04-23  2076) 		.handle_interrupt	= nxp_c45_handle_interrupt,
ac0687e821cffa Radu Pirea (NXP OSS  2023-07-31  2077) 		.read_status		= genphy_c45_read_status,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2078) 		.suspend		= genphy_c45_pma_suspend,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2079) 		.resume			= genphy_c45_pma_resume,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2080) 		.get_sset_count		= nxp_c45_get_sset_count,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2081) 		.get_strings		= nxp_c45_get_strings,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2082) 		.get_stats		= nxp_c45_get_stats,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2083) 		.cable_test_start	= nxp_c45_cable_test_start,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2084) 		.cable_test_get_status	= nxp_c45_cable_test_get_status,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2085) 		.set_loopback		= genphy_c45_loopback,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2086) 		.get_sqi		= nxp_c45_get_sqi,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2087) 		.get_sqi_max		= nxp_c45_get_sqi_max,
a4506722dc39ca Radu Pirea (OSS      2023-04-06  2088) 		.remove			= nxp_c45_remove,
a06a868a0cd96b Andrei Botila        2025-02-28 @2089  		.match_phy_device	= tja1103_match_phy_device,
a06a868a0cd96b Andrei Botila        2025-02-28  2090  	},
a06a868a0cd96b Andrei Botila        2025-02-28  2091  	{
a06a868a0cd96b Andrei Botila        2025-02-28  2092  		.name			= "NXP C45 TJA1104",
a06a868a0cd96b Andrei Botila        2025-02-28  2093  		.get_features		= nxp_c45_get_features,
a06a868a0cd96b Andrei Botila        2025-02-28  2094  		.driver_data		= &tja1103_phy_data,
a06a868a0cd96b Andrei Botila        2025-02-28  2095  		.probe			= nxp_c45_probe,
a06a868a0cd96b Andrei Botila        2025-02-28  2096  		.soft_reset		= nxp_c45_soft_reset,
a06a868a0cd96b Andrei Botila        2025-02-28  2097  		.config_aneg		= genphy_c45_config_aneg,
a06a868a0cd96b Andrei Botila        2025-02-28  2098  		.config_init		= nxp_c45_config_init,
a06a868a0cd96b Andrei Botila        2025-02-28  2099  		.config_intr		= tja1103_config_intr,
a06a868a0cd96b Andrei Botila        2025-02-28  2100  		.handle_interrupt	= nxp_c45_handle_interrupt,
a06a868a0cd96b Andrei Botila        2025-02-28  2101  		.read_status		= genphy_c45_read_status,
a06a868a0cd96b Andrei Botila        2025-02-28  2102  		.suspend		= genphy_c45_pma_suspend,
a06a868a0cd96b Andrei Botila        2025-02-28  2103  		.resume			= genphy_c45_pma_resume,
a06a868a0cd96b Andrei Botila        2025-02-28  2104  		.get_sset_count		= nxp_c45_get_sset_count,
a06a868a0cd96b Andrei Botila        2025-02-28  2105  		.get_strings		= nxp_c45_get_strings,
a06a868a0cd96b Andrei Botila        2025-02-28  2106  		.get_stats		= nxp_c45_get_stats,
a06a868a0cd96b Andrei Botila        2025-02-28  2107  		.cable_test_start	= nxp_c45_cable_test_start,
a06a868a0cd96b Andrei Botila        2025-02-28  2108  		.cable_test_get_status	= nxp_c45_cable_test_get_status,
a06a868a0cd96b Andrei Botila        2025-02-28  2109  		.set_loopback		= genphy_c45_loopback,
a06a868a0cd96b Andrei Botila        2025-02-28  2110  		.get_sqi		= nxp_c45_get_sqi,
a06a868a0cd96b Andrei Botila        2025-02-28  2111  		.get_sqi_max		= nxp_c45_get_sqi_max,
a06a868a0cd96b Andrei Botila        2025-02-28  2112  		.remove			= nxp_c45_remove,
a06a868a0cd96b Andrei Botila        2025-02-28  2113  		.match_phy_device	= tja1104_match_phy_device,
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2114) 	},
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2115) 	{
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2116) 		.name			= "NXP C45 TJA1120",
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2117) 		.get_features		= nxp_c45_get_features,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2118) 		.driver_data		= &tja1120_phy_data,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2119) 		.probe			= nxp_c45_probe,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2120) 		.soft_reset		= nxp_c45_soft_reset,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2121) 		.config_aneg		= genphy_c45_config_aneg,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2122) 		.config_init		= nxp_c45_config_init,
425c8348df7b86 Radu Pirea (NXP OSS  2023-07-31  2123) 		.config_intr		= tja1120_config_intr,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2124) 		.handle_interrupt	= nxp_c45_handle_interrupt,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2125) 		.read_status		= genphy_c45_read_status,
68c6af72047ca7 Radu Pirea (NXP OSS  2023-07-31  2126) 		.link_change_notify	= tja1120_link_change_notify,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2127) 		.suspend		= genphy_c45_pma_suspend,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2128) 		.resume			= genphy_c45_pma_resume,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2129) 		.get_sset_count		= nxp_c45_get_sset_count,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2130) 		.get_strings		= nxp_c45_get_strings,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2131) 		.get_stats		= nxp_c45_get_stats,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2132) 		.cable_test_start	= nxp_c45_cable_test_start,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2133) 		.cable_test_get_status	= nxp_c45_cable_test_get_status,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2134) 		.set_loopback		= genphy_c45_loopback,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2135) 		.get_sqi		= nxp_c45_get_sqi,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2136) 		.get_sqi_max		= nxp_c45_get_sqi_max,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2137) 		.remove			= nxp_c45_remove,
7215e9375694db Andrei Botila        2025-02-28  2138  		.match_phy_device	= tja1120_match_phy_device,
7215e9375694db Andrei Botila        2025-02-28  2139  	},
7215e9375694db Andrei Botila        2025-02-28  2140  	{
7215e9375694db Andrei Botila        2025-02-28  2141  		.name			= "NXP C45 TJA1121",
7215e9375694db Andrei Botila        2025-02-28  2142  		.get_features		= nxp_c45_get_features,
7215e9375694db Andrei Botila        2025-02-28  2143  		.driver_data		= &tja1120_phy_data,
7215e9375694db Andrei Botila        2025-02-28  2144  		.probe			= nxp_c45_probe,
7215e9375694db Andrei Botila        2025-02-28  2145  		.soft_reset		= nxp_c45_soft_reset,
7215e9375694db Andrei Botila        2025-02-28  2146  		.config_aneg		= genphy_c45_config_aneg,
7215e9375694db Andrei Botila        2025-02-28  2147  		.config_init		= nxp_c45_config_init,
7215e9375694db Andrei Botila        2025-02-28  2148  		.config_intr		= tja1120_config_intr,
7215e9375694db Andrei Botila        2025-02-28  2149  		.handle_interrupt	= nxp_c45_handle_interrupt,
7215e9375694db Andrei Botila        2025-02-28  2150  		.read_status		= genphy_c45_read_status,
7215e9375694db Andrei Botila        2025-02-28  2151  		.link_change_notify	= tja1120_link_change_notify,
7215e9375694db Andrei Botila        2025-02-28  2152  		.suspend		= genphy_c45_pma_suspend,
7215e9375694db Andrei Botila        2025-02-28  2153  		.resume			= genphy_c45_pma_resume,
7215e9375694db Andrei Botila        2025-02-28  2154  		.get_sset_count		= nxp_c45_get_sset_count,
7215e9375694db Andrei Botila        2025-02-28  2155  		.get_strings		= nxp_c45_get_strings,
7215e9375694db Andrei Botila        2025-02-28  2156  		.get_stats		= nxp_c45_get_stats,
7215e9375694db Andrei Botila        2025-02-28  2157  		.cable_test_start	= nxp_c45_cable_test_start,
7215e9375694db Andrei Botila        2025-02-28  2158  		.cable_test_get_status	= nxp_c45_cable_test_get_status,
7215e9375694db Andrei Botila        2025-02-28  2159  		.set_loopback		= genphy_c45_loopback,
7215e9375694db Andrei Botila        2025-02-28  2160  		.get_sqi		= nxp_c45_get_sqi,
7215e9375694db Andrei Botila        2025-02-28  2161  		.get_sqi_max		= nxp_c45_get_sqi_max,
7215e9375694db Andrei Botila        2025-02-28  2162  		.remove			= nxp_c45_remove,
7215e9375694db Andrei Botila        2025-02-28  2163  		.match_phy_device	= tja1121_match_phy_device,
f1fe5dff2b8aa8 Radu Pirea (NXP OSS  2023-07-31  2164) 	},
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2165) };
b050f2f15e04f0 Radu Pirea (NXP OSS  2021-04-19  2166) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
