Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6F4A0F;
	Tue,  6 Aug 2024 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722922443; cv=none; b=tBhiIhpgq7ItLj8hL6AS1aBXfScpd6EwyFWvO4TTvHIpiP70pDMm8MhOM0U5qdjzeRVqD97noXLjMfkTXyJFeBmOkheMkzDk+gOAbpwhBytnylm/TFIpfs5UZ4mxbOu3gWYzpAa4jvDNL9Zgfp1lo+XX6Z98vsK1SYTBuxOqQ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722922443; c=relaxed/simple;
	bh=iB64wRfwnqkGlIOC9n9PUdpSNzxG0oc4VlsprEsbc7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upzWLfgsfGdHb+CXxbbOR/iVu+MbsmDR0xgH4ipvdeEPD0XfCGY9Eq9elXQm/ik2tK3AyJlLalMk3164dGq5rks8cPVJT6/vjcEVU0VzKtYVvBmNQR1zBEFiNx9HwY/y+WR6aD9SpAmvb+UAw+w+ev2aP9uVEzpB8l5AjdmjipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jddkIwBA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jddkIwBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722922441; x=1754458441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iB64wRfwnqkGlIOC9n9PUdpSNzxG0oc4VlsprEsbc7U=;
  b=jddkIwBAKsfL2x+MEj+7ALdzL/rYKc4ckS56dgVo1veCEx9PsSMy1TJK
   N9xVK2h4mX89vKhNH1fvAEqcxT02tvIllHfDV1RkxPxHyy+PT7uZX8z5J
   XjkWKZ3F1Feht/bAte8UPiuKbxembFVLM0B5gKHz/KuEhRpRsriwrX9XE
   xQar9ZXhfEJENUO7g+r1l8ZK8uNw9yVhORgGqCtve6ncIFRVBqPa1AZfJ
   E3LN/4LJobLbhC2u5o2ZIeQxDbeQne9+plpPl1Bis7hQX43uJHbwwv7sk
   uAVOiuHWnRf+STQFxWS7SCWeb2n0Qklr71jG6CzEL1D8VOtrrhNXqT4+d
   Q==;
X-CSE-ConnectionGUID: a8cY5NNpS3ugnSzL2YVTlQ==
X-CSE-MsgGUID: PC0qFJomS5WOw4/HTeL6kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20883642"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20883642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 22:34:00 -0700
X-CSE-ConnectionGUID: KqPuQq4HTK648fO+QrtQcA==
X-CSE-MsgGUID: +T1cPERgRN+nOeVbjwRhdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56089366"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Aug 2024 22:33:59 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbCpY-0004Bc-2z;
	Tue, 06 Aug 2024 05:33:56 +0000
Date: Tue, 6 Aug 2024 13:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:cpufreq-compile-test 6/6] drivers/opp/ti-opp-supply.c:364:34:
 warning: unused variable 'ti_opp_supply_of_match'
Message-ID: <202408061312.h3hMqRUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: 51646201e21cdf40aad3925f7742a8d2ac727f43 [6/6] cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
config: x86_64-buildonly-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061312.h3hMqRUK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061312.h3hMqRUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061312.h3hMqRUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/ti-opp-supply.c:364:34: warning: unused variable 'ti_opp_supply_of_match' [-Wunused-const-variable]
     364 | static const struct of_device_id ti_opp_supply_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/cpufreq/ti-cpufreq.c:422:34: warning: unused variable 'ti_cpufreq_of_match' [-Wunused-const-variable]
     422 | static const struct of_device_id ti_cpufreq_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/ti_opp_supply_of_match +364 drivers/opp/ti-opp-supply.c

9a835fa6e47f27 Dave Gerlach 2017-12-14  363  
9a835fa6e47f27 Dave Gerlach 2017-12-14 @364  static const struct of_device_id ti_opp_supply_of_match[] = {
9a835fa6e47f27 Dave Gerlach 2017-12-14  365  	{.compatible = "ti,omap-opp-supply", .data = &omap_generic_of_data},
9a835fa6e47f27 Dave Gerlach 2017-12-14  366  	{.compatible = "ti,omap5-opp-supply", .data = &omap_omap5_of_data},
9a835fa6e47f27 Dave Gerlach 2017-12-14  367  	{.compatible = "ti,omap5-core-opp-supply",
9a835fa6e47f27 Dave Gerlach 2017-12-14  368  	 .data = &omap_omap5core_of_data},
9a835fa6e47f27 Dave Gerlach 2017-12-14  369  	{},
9a835fa6e47f27 Dave Gerlach 2017-12-14  370  };
9a835fa6e47f27 Dave Gerlach 2017-12-14  371  MODULE_DEVICE_TABLE(of, ti_opp_supply_of_match);
9a835fa6e47f27 Dave Gerlach 2017-12-14  372  

:::::: The code at line 364 was first introduced by commit
:::::: 9a835fa6e47f27b1ae71390b6f12efce7335aaac PM / OPP: Add ti-opp-supply driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
