Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967C156C74;
	Tue, 18 Jun 2024 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718734277; cv=none; b=hdVUYDFAwA3Lk74pIzrhDTh4YmBe0wGi74xH5aRhN0wGeR1/hP2kL5p8n9tgAUTf1AAxtSx4U0DpIEt2zFVPLHshRUtz2dAZ/Ba4HPpKPVc2J7gnb5Bv6NCruSxULAOlaY7FTtZQE2c+ZCzo8YD/QWEHma50IaG+vjUOd2HB/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718734277; c=relaxed/simple;
	bh=lDw9Y1szChwNCNWJMg+0oPAWEze2j57VJnblcqCqsmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=krlgji0djmvJXgMBoUr12rJWgGzYBQmCoXuOh0DmqyXjubhkdofuIs7T1mgm6puy0Rk8OD2/Mrwey/22d07MB0PwY9Sk+uceaQJBtdwYSUPae66AK8G6sxMoU/byck+raJikR5uLbrmb3XOdMvD4cakTUQ5ZS/FZs7owTYETNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRxc37xL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRxc37xL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718734276; x=1750270276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDw9Y1szChwNCNWJMg+0oPAWEze2j57VJnblcqCqsmM=;
  b=GRxc37xLXERWeNe95R/mvZkoufYt1+c9jNR1zk5t3m82pCtsLe6nSCG5
   wp/GMDayplnfr66e3hl386jRT8hTCDbLKLZiMGOXD4Yr40PSDxzOka/xh
   fzg/YY09bJ2mJDvVarz2H4CrFbwXy6Dypl5Vj3gvkg/XzQ8BNI07UXXpZ
   qYhB7hIWjpbwPCaTh8w5xP/1pU0mvHg2Ly06mVYItVV97GfvBts4v8kXO
   13VTPlDzm3f+aR8bqiSd89KCYAjPgPomjbehApRkHhIlU0XuFEQ+4JZSU
   +bROhdlKLiWRMnTfgL5CE+z4S0mfu1suJuC2xS/mmJ+4hW4u0q/4raa6x
   A==;
X-CSE-ConnectionGUID: uDM7S1wISaGvkd9IgJTbRQ==
X-CSE-MsgGUID: sM0KtqLhRmOLnl2IvwFAaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26218731"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26218731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 11:11:15 -0700
X-CSE-ConnectionGUID: +O77qWXJSFiaTHt5EK8ZqQ==
X-CSE-MsgGUID: tFVtAwSTR/eIwv/atXnmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41591161"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2024 11:11:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJdIV-0005nk-0X;
	Tue, 18 Jun 2024 18:11:11 +0000
Date: Wed, 19 Jun 2024 02:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dong Aisheng <aisheng.dong@nxp.com>
Subject: [linusw-pinctrl:b4/fix-keembay 33/35]
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c:170:25: error: use of
 undeclared identifier 'pinmux_generic_get_function_count'; did you mean
 'pinmux_generic_free_functions'?
Message-ID: <202406190117.KOToCGoE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-keembay
head:   f752b6771178e30e0174334b0d9eb659bf9d4cd2
commit: 1e37f761d0163cf99567fb81d9c59860ef255d9d [33/35] pinctrl: imx: support SCMI pinctrl protocol for i.MX95
config: i386-buildonly-randconfig-004-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190117.KOToCGoE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190117.KOToCGoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190117.KOToCGoE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:170:25: error: use of undeclared identifier 'pinmux_generic_get_function_count'; did you mean 'pinmux_generic_free_functions'?
     170 |         .get_functions_count = pinmux_generic_get_function_count,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:171:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
     171 |         .get_function_name = pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:172:25: error: use of undeclared identifier 'pinmux_generic_get_function_groups'; did you mean 'pinmux_generic_free_functions'?
     172 |         .get_function_groups = pinmux_generic_get_function_groups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:170:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     170 |         .get_functions_count = pinmux_generic_get_function_count,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:171:23: error: incompatible function pointer types initializing 'const char *(*)(struct pinctrl_dev *, unsigned int)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     171 |         .get_function_name = pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx-scmi.c:172:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *, unsigned int, const char *const **, unsigned int *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     172 |         .get_function_groups = pinmux_generic_get_function_groups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m


vim +170 drivers/pinctrl/freescale/pinctrl-imx-scmi.c

   168	
   169	static const struct pinmux_ops pinctrl_scmi_imx_pinmux_ops = {
 > 170		.get_functions_count = pinmux_generic_get_function_count,
 > 171		.get_function_name = pinmux_generic_get_function_name,
 > 172		.get_function_groups = pinmux_generic_get_function_groups,
   173		.set_mux = pinctrl_scmi_imx_func_set_mux,
   174	};
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
