Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D9289343;
	Wed,  7 May 2025 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627698; cv=none; b=GIooaKGELCFGwxog7X1SGQp8q+pUdgB7C7C58sjsodoEzKLwAHPUmysYezB2YpPV65hOWSns9wRN1fsfMlwh3YCELPLkw7n0V3cjjEE6+k1EZNLI1DZmV4baVY+YedJwTVmtmq4wyD/wGy7oO1tNlD3s0K9PKTY7eAVnYM5dZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627698; c=relaxed/simple;
	bh=v4FHW95knpoPgfTn8qFy3KRPAdBKHihEAb23o6fcRus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+QsyEUm6ebuUDOn0uLyszhNG1ygoK6iQBLeeRWXTKb72nzNndJeqg/4JkRan1ErQ8w6clzphOArx0i1XLiKfT9tZxQ8NgqrSvtYtLAoCSen6w+7M7g+kjFO5beqnY6WwZFVZDAUxriQvUj+DNFRmjO7BNVNUtHFAd6+qTxJV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFoU37Ue; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFoU37Ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746627696; x=1778163696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4FHW95knpoPgfTn8qFy3KRPAdBKHihEAb23o6fcRus=;
  b=gFoU37UeqQ6A3UfW9fEOpZdCBUkqAZ+YVXtCwtSRw1waa8IMOKOq+OCu
   Rzl6V4ohoIGgSq5bJ3RtAPGNMBWc4Ikt5YDXoQglghx8F4TrDfSdn64Zu
   lx1Dt1ZNdrmt0+qjPmC05XJThf1pBZtMjPioiovDEJgCxqBUwJE0nxP+1
   tzOPz41wJeIG/Grb/ly6jVUEVB5pMpxgOoSXj/FEqyDYwzObynKaLeR2X
   DUOnv3AKpiDysc32yHBuDplh4nMLQDleEIYV01BvskvfwgrHixPMdbfbc
   GRHZZbX7t6zHde8bWYK79ha26dPyUJhcWqSJG778wYdmi2ZH2mipJka00
   A==;
X-CSE-ConnectionGUID: kATuYlXNR2OW7EFiYmv8Yw==
X-CSE-MsgGUID: YsLDxIuuRV+MHJrtOBf55A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52015517"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52015517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:21:34 -0700
X-CSE-ConnectionGUID: KUNYtWllSKCM/CoMqsdSqQ==
X-CSE-MsgGUID: k3UCgP34QPKHX5G6DoVPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140724252"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 07:21:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCfeM-0007xt-1j;
	Wed, 07 May 2025 14:21:30 +0000
Date: Wed, 7 May 2025 22:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 3417/9308]
 drivers/pinctrl/nomadik/pinctrl-abx500.c:780:8: error: call to undeclared
 function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505072245.OgSXI1hh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 720abc5c58d8a4be614dece755342f428e386244 [3417/9308] pinctrl: abx500: enable building modules with COMPILE_TEST=y
config: hexagon-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250507/202505072245.OgSXI1hh-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072245.OgSXI1hh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072245.OgSXI1hh-lkp@intel.com/

Note: the linux-next/master HEAD 08710e696081d58163c8078e0e096be6d35c5fad builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/pinctrl/nomadik/pinctrl-abx500.c:780:8: error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     780 |         ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &nconfigs);
         |               ^
   drivers/pinctrl/nomadik/pinctrl-abx500.c:780:8: note: did you mean 'pinconf_generic_dump_config'?
   drivers/pinctrl/nomadik/../pinconf.h:117:6: note: 'pinconf_generic_dump_config' declared here
     117 | void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
         |      ^
   1 error generated.


vim +/pinconf_generic_parse_dt_config +780 drivers/pinctrl/nomadik/pinctrl-abx500.c

64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  746  
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  747  static int abx500_dt_subnode_to_map(struct pinctrl_dev *pctldev,
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  748  		struct device_node *np,
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  749  		struct pinctrl_map **map,
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  750  		unsigned *reserved_maps,
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  751  		unsigned *num_maps)
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  752  {
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  753  	int ret;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  754  	const char *function = NULL;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  755  	unsigned long *configs;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  756  	unsigned int nconfigs = 0;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  757  	struct property *prop;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  758  
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  759  	ret = of_property_read_string(np, "function", &function);
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  760  	if (ret >= 0) {
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  761  		const char *group;
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  762  
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  763  		ret = of_property_count_strings(np, "groups");
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  764  		if (ret < 0)
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  765  			goto exit;
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  766  
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  767  		ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps,
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  768  						num_maps, ret);
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  769  		if (ret < 0)
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  770  			goto exit;
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  771  
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  772  		of_property_for_each_string(np, "groups", prop, group) {
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  773  			ret = abx500_dt_add_map_mux(map, reserved_maps,
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  774  					num_maps, group, function);
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  775  			if (ret < 0)
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  776  				goto exit;
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  777  		}
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  778  	}
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  779  
dd4d01f7bad886c drivers/pinctrl/nomadik/pinctrl-abx500.c Soren Brinkmann 2015-01-09 @780  	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &nconfigs);
eea11b0baa63ed8 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  781  	if (nconfigs) {
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  782  		const char *gpio_name;
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  783  		const char *pin;
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  784  
0564f7d946efc29 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  785  		ret = of_property_count_strings(np, "pins");
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  786  		if (ret < 0)
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  787  			goto exit;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  788  
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  789  		ret = pinctrl_utils_reserve_map(pctldev, map,
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  790  						reserved_maps,
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  791  						num_maps, ret);
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  792  		if (ret < 0)
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  793  			goto exit;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  794  
0564f7d946efc29 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  795  		of_property_for_each_string(np, "pins", prop, pin) {
51d39936acba666 drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  796  			gpio_name = abx500_find_pin_name(pctldev, pin);
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  797  
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  798  			ret = abx500_dt_add_map_configs(map, reserved_maps,
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  799  					num_maps, gpio_name, configs, 1);
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  800  			if (ret < 0)
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  801  				goto exit;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  802  		}
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  803  	}
259145feff723cd drivers/pinctrl/nomadik/pinctrl-abx500.c Linus Walleij   2014-09-30  804  
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  805  exit:
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  806  	return ret;
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  807  }
64a45c986349a00 drivers/pinctrl/pinctrl-abx500.c         Patrice Chotard 2013-06-20  808  

:::::: The code at line 780 was first introduced by commit
:::::: dd4d01f7bad886c22687224bc7070b87de8deb51 pinctrl: pinconf-generic: Allow driver to specify DT params

:::::: TO: Soren Brinkmann <soren.brinkmann@xilinx.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
