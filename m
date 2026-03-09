Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150201F3D56;
	Mon,  9 Mar 2026 03:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773028672; cv=none; b=CxEz50SDbooH7honTPDRod1ik5isw4V/nvGA1YU0adYOcpok2nXUF9d4uhmniwfbz488AvjEKxXqTNxrVowl3gGjQUR2RsKM8HPtKYsml0r1I+0URs30Itd92iJPVkV6SSXeIVX1e13YU5VzMwJlwyMaMtC2+Y3Y8PP2MseIEuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773028672; c=relaxed/simple;
	bh=guIANQMH0c5Vi7BIgG+9v/P7/bvGlgo44kcre7HgFy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl6YJkTUiJtZMrOsunmSGF1BfKF4On66EWTjXCEvGITSrP08EGOxxbv4KcMbV2M33MjuQhM65WhIjnudjINLxdz4A3f5Gk5HrttMhnxFApXZudlZM6DeOjXGaY1eDep+dz59WwsnVAP5DJO7ecGd4COSgk9u2C3w1YohlR3Itnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDQK1zI4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDQK1zI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773028670; x=1804564670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=guIANQMH0c5Vi7BIgG+9v/P7/bvGlgo44kcre7HgFy4=;
  b=RDQK1zI4AfExJSXMP3RKWiigeVJmrgQa9aZndXXBWY8TMsuUl27Y1L5V
   tISsTJu7rgUY3DTjpsF4Tk/DvMatxJwmvQZhwT5dFa/eYinMqfA3Y+22U
   xrQieWR7xU4Br9xKbPTXNCWADZAzUAwqFGHvdFOfQgb3ez7SUEhLpTUvp
   bprOU2L32uXPT4Qk0Q8nHkM7uGBN4RTfjq6nqcyHy4r0QM2vZyaRmnr7a
   1PfWkI3qBzhkFgkxfaNvo7GUANvCSjyhWJ9SB2t83TVLSDGozGtAEYzYA
   NP6+iko0RNic56O0kZRxCDJPMl2E7tK5k4SB+BKW/2hkgMMlN1RajGwAI
   Q==;
X-CSE-ConnectionGUID: 4cRJRc0nT3mp1s7bEsCwPg==
X-CSE-MsgGUID: t+r7rwbvSUmCYxXJjglCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73949539"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73949539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 20:57:49 -0700
X-CSE-ConnectionGUID: u78bIBNmTT+A93NEMQDGZQ==
X-CSE-MsgGUID: DcpL+dr/Tga1sllf05d2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224082335"
Received: from lkp-server01.sh.intel.com (HELO 17db2bb44c9a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 20:57:48 -0700
Received: from kbuild by 17db2bb44c9a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzRkX-0000000008D-32qM;
	Mon, 09 Mar 2026 03:57:45 +0000
Date: Mon, 9 Mar 2026 11:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v2 5/6] netdevsim: Add module EEPROM simulation
 via debugfs
Message-ID: <202603091145.XesQOgpn-lkp@intel.com>
References: <20260308124016.3134012-6-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308124016.3134012-6-bjorn@kernel.org>

Hi Björn,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bcac7b11262557c990da1ac564d45777eb6b005]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/ethtool-Add-loopback-netlink-UAPI-definitions/20260308-204636
base:   0bcac7b11262557c990da1ac564d45777eb6b005
patch link:    https://lore.kernel.org/r/20260308124016.3134012-6-bjorn%40kernel.org
patch subject: [RFC net-next v2 5/6] netdevsim: Add module EEPROM simulation via debugfs
config: i386-buildonly-randconfig-006-20260309 (https://download.01.org/0day-ci/archive/20260309/202603091145.XesQOgpn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091145.XesQOgpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091145.XesQOgpn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/netdevsim/ethtool.c:212:11: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     212 |         if (page >= NSIM_MODULE_EEPROM_PAGES)
         |             ~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +212 drivers/net/netdevsim/ethtool.c

   197	
   198	static u8 *nsim_module_eeprom_ptr(struct netdevsim *ns,
   199					  const struct ethtool_module_eeprom *page_data, u32 *len)
   200	{
   201		u32 offset;
   202		u8 page;
   203	
   204		if (page_data->offset < NSIM_MODULE_EEPROM_PAGE_LEN) {
   205			page = 0;
   206			offset = page_data->offset;
   207		} else {
   208			page = page_data->page;
   209			offset = page_data->offset - NSIM_MODULE_EEPROM_PAGE_LEN;
   210		}
   211	
 > 212		if (page >= NSIM_MODULE_EEPROM_PAGES)
   213			return NULL;
   214	
   215		*len = min_t(u32, page_data->length, NSIM_MODULE_EEPROM_PAGE_LEN - offset);
   216		return ns->ethtool.module.pages[page] + offset;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
