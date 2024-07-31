Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA62208E;
	Wed, 31 Jul 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432763; cv=none; b=ErwQMccbRYtIcDgCTUHrbdxJnAc+xyIWd8iCFUPfRyOypG2i1w+IXJeld+dB4IUne6Reg+uvj6UGvfH0hynTAzhqoGPu850VL4k43H1dc0ACbYrBqa3D7B7ERtf7ZioJzklOAxjA1JiLUyZZQ+/jUcDszRasWETMIx0oxnIOFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432763; c=relaxed/simple;
	bh=ZFjIxewMoMVzrVdL9kXTCnWZU1ZX2567qegObPbylIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEy2hki4urkhId3VLllfsd6BMVXD9rrJcvRw2mpCnNnP2E5kow013JqarJI8DyhrzrDA6DyEVtZGhViTJ4hA82a+7algl2EehmmfYkDqvpX6FZ7sXNE9saNp83PAdpL94YA/hrs0Qz4NJCQgEcfug/C+alfv3qZvzxFvCthVhqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0cIggZt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0cIggZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722432761; x=1753968761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZFjIxewMoMVzrVdL9kXTCnWZU1ZX2567qegObPbylIk=;
  b=e0cIggZtP3ruuSzHQpriJF516HgO9d/6ZlD06haJMtmspJjrOULAtJ92
   Po2fYMmOvD+ZYDtETcqFpsTToy4BLL1Sq7VOpeRyMO0NzwBTvVAYe6VmN
   O+yYFKtr0e+LC7i8I5xMMszwDmb4Wf1Lh/dakSCLUM5UotqeJpLeB5eVJ
   WZGCaQc+a5lVIPKdepDWVrO9nes6RwQCgKFbIVLcf4sREJWdPEXdCDvUl
   Uhcq4pp1hG2DuvtVtGEHU+jhMTTE4fXWX+GAD4o3xGJXovJg8mjNx8PZH
   hafuPzOw6K7/ih8xOo7L7aYRMGEV3GOVc2EZn8ab+/455kUTUrz86Zsf+
   A==;
X-CSE-ConnectionGUID: QuyaSF3RSKOH8VknAowvmw==
X-CSE-MsgGUID: 3P9CfyWtRBasQvv14ECxkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24175065"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="24175065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 06:32:40 -0700
X-CSE-ConnectionGUID: G0vylKGyQaq8JafWFpQFqQ==
X-CSE-MsgGUID: C39Nz2/zTXOtAFuZATuObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59328675"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2024 06:32:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ9RV-000uMl-1p;
	Wed, 31 Jul 2024 13:32:37 +0000
Date: Wed, 31 Jul 2024 21:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/api-cleanups 36/36]
 drivers/input/keyboard/tegra-kbc.c:521:13: error: implicit declaration of
 function 'of_property_read_variableu32_array' is invalid in C99
Message-ID: <202407312156.sdOTDx2x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/api-cleanups
head:   55dff5ffdb04a96e8f78fc4708ffa4701b509a0c
commit: 55dff5ffdb04a96e8f78fc4708ffa4701b509a0c [36/36] More DT api cleanups
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240731/202407312156.sdOTDx2x-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312156.sdOTDx2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312156.sdOTDx2x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/keyboard/tegra-kbc.c:521:13: error: implicit declaration of function 'of_property_read_variableu32_array' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           num_rows = of_property_read_variableu32_array(np, "nvidia,kbc-row-pins",
                      ^
   drivers/input/keyboard/tegra-kbc.c:521:13: note: did you mean 'of_property_read_variable_u32_array'?
   include/linux/of.h:325:12: note: 'of_property_read_variable_u32_array' declared here
   extern int of_property_read_variable_u32_array(const struct device_node *np,
              ^
   drivers/input/keyboard/tegra-kbc.c:498:6: warning: unused variable 'ret' [-Wunused-variable]
           int ret;
               ^
   1 warning and 1 error generated.


vim +/of_property_read_variableu32_array +521 drivers/input/keyboard/tegra-kbc.c

   488	
   489	static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
   490	{
   491		struct device_node *np = kbc->dev->of_node;
   492		u32 prop;
   493		int i;
   494		int num_rows;
   495		int num_cols;
   496		u32 cols_cfg[KBC_MAX_GPIO];
   497		u32 rows_cfg[KBC_MAX_GPIO];
   498		int ret;
   499	
   500		if (!of_property_read_u32(np, "nvidia,debounce-delay-ms", &prop))
   501			kbc->debounce_cnt = prop;
   502	
   503		if (!of_property_read_u32(np, "nvidia,repeat-delay-ms", &prop))
   504			kbc->repeat_cnt = prop;
   505	
   506		kbc->use_ghost_filter = of_property_present(np, "nvidia,needs-ghost-filter");
   507	
   508		if (of_property_read_bool(np, "wakeup-source") ||
   509		    of_property_read_bool(np, "nvidia,wakeup-source")) /* legacy */
   510			kbc->wakeup = true;
   511	
   512		if (!of_property_present(np, "linux,keymap")) {
   513			dev_err(kbc->dev, "property linux,keymap not found\n");
   514			return -ENOENT;
   515		}
   516	
   517		/* Set all pins as non-configured */
   518		for (i = 0; i < kbc->num_rows_and_columns; i++)
   519			kbc->pin_cfg[i].type = PIN_CFG_IGNORE;
   520	
 > 521		num_rows = of_property_read_variableu32_array(np, "nvidia,kbc-row-pins",
   522					rows_cfg, 1, KBC_MAX_GPIO);
   523		if (num_rows < 0) {
   524			dev_err(kbc->dev, "Rows configurations are not proper\n");
   525			return num_rows;
   526		} else if (num_rows > kbc->hw_support->max_rows) {
   527			dev_err(kbc->dev,
   528				"Number of rows is more than supported by hardware\n");
   529			return -EINVAL;
   530		}
   531	
   532		for (i = 0; i < num_rows; i++) {
   533			kbc->pin_cfg[rows_cfg[i]].type = PIN_CFG_ROW;
   534			kbc->pin_cfg[rows_cfg[i]].num = i;
   535		}
   536	
   537		num_cols = of_property_read_variable_u32_array(np, "nvidia,kbc-col-pins",
   538					cols_cfg, 1, KBC_MAX_GPIO);
   539		if (num_cols < 0) {
   540			dev_err(kbc->dev, "Cols configurations are not proper\n");
   541			return num_cols;
   542		} else if (num_cols > kbc->hw_support->max_columns) {
   543			dev_err(kbc->dev,
   544				"Number of cols is more than supported by hardware\n");
   545			return -EINVAL;
   546		}
   547	
   548		for (i = 0; i < num_cols; i++) {
   549			kbc->pin_cfg[cols_cfg[i]].type = PIN_CFG_COL;
   550			kbc->pin_cfg[cols_cfg[i]].num = i;
   551		}
   552	
   553		if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
   554			dev_err(kbc->dev,
   555				"keypad rows/columns not properly specified\n");
   556			return -EINVAL;
   557		}
   558	
   559		return 0;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
