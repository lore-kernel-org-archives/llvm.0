Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2A37B41F;
	Wed, 29 Jul 2026 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785346304; cv=none; b=AOGhyZ2I1YjrGrneUz4EaXL+Z7UqKb4VZKp+W+JZmjqAhFapKgbCK9ycj8ZoJ0le4ZuWu8SoHzdsHCzFM2jX5gKx4nDoos+KwstaWsE5NGTA9MMo7CT9siYQpbvD2Xk0t+M3RLsZBySO+dKxrqEkSos/AFidz41OUF8xrPrL1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785346304; c=relaxed/simple;
	bh=zWVwF/lm7dvlg+xSfinW+aXkp6TMOCYZFjDz5MdKjGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JyTWmhMlwa7/JVJtf2Svuu5AfEfBrvb8ZecdIRNpvimyXF4qCKRUsZmy85hc2g2xaQ0X/bDjl+qYv2+Q2aEfMUz2u89sw7CU1HtnAJ46kgITA4nkwnX2fNO+tmzPQHBts6OUaH0BWA77wOCd6Rkusft3DZHHIuOLaq/6UAdi/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR/Sni2N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RR/Sni2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785346303; x=1816882303;
  h=date:from:to:cc:subject:message-id;
  bh=zWVwF/lm7dvlg+xSfinW+aXkp6TMOCYZFjDz5MdKjGE=;
  b=RR/Sni2N+tLPG/8Kow8PnZmQj24Ngx2ZHP8eGpsIGLhRmab76Ekbj8J/
   ZntbxXhc34fJOV5E0BXq/0IniYEM0pvwV9IGe7uQz7+O0gemqelC5spnx
   xyLAgDg9Y/UUxztZKy0Nk3h1O4RQa7reTX7dTynP/6LglYyqvBBgWWBjL
   31dpbBayiqvK5MvZFcLM8SGBQuD8XiRHalkO3Ao/59aX0Jupvn5PquPTP
   d7NzcjXJ/VuOlS0q8R64J4HF+wpVecFacsAO9oL8vz0Fox992j+0H4rEd
   dVHOBCRD2ucAXrtACiNlRtFJwln3ZA/gzdAId2a35N4DXPrAHTEwlaEZe
   g==;
X-CSE-ConnectionGUID: gJJRHe82RuyP66iMXn9ypA==
X-CSE-MsgGUID: 5zsgkm0vSIKFFPVjOcTM4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86079018"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="86079018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 10:31:42 -0700
X-CSE-ConnectionGUID: cGiixbKxT7uuGsf+GyYx9g==
X-CSE-MsgGUID: uRDdDtL0QGaaFsJSp63BvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="298289801"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2026 10:31:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp882-00000000fYl-0fjR;
	Wed, 29 Jul 2026 17:31:38 +0000
Date: Thu, 30 Jul 2026 01:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Masney <bmasney@redhat.com>
Subject: [masneyb:clk-misc-round-two-for-v7.3 15/45]
 drivers/clk/mediatek/clk-mt8173-infracfg.c:131:29: error: use of undeclared
 identifier 'clk_data'
Message-ID: <202607300133.MCJfTRc1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux clk-misc-round-two-for-v7.3
head:   e2eec03ed313a8180ebe4eb9e32a6b8429f804a5
commit: d29088009b4afdb7fc1f3cbb6ba3364e483b17d9 [15/45] clk: mediatek: mt8173: fix memory leak on module removal
config: s390-randconfig-002-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300133.MCJfTRc1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300133.MCJfTRc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300133.MCJfTRc1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt8173-infracfg.c:131:29: error: use of undeclared identifier 'clk_data'
     131 |         platform_set_drvdata(pdev, clk_data);
         |                                    ^~~~~~~~
   1 error generated.


vim +/clk_data +131 drivers/clk/mediatek/clk-mt8173-infracfg.c

    78	
    79	static void clk_mt8173_infra_init_early(struct device_node *node)
    80	{
    81		int i;
    82	
    83		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
    84		if (!infra_clk_data)
    85			return;
    86	
    87		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
    88			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
    89	
    90		mtk_clk_register_factors(infra_early_divs,
    91					 ARRAY_SIZE(infra_early_divs), infra_clk_data);
    92	
    93		of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
    94	}
    95	CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
    96			      clk_mt8173_infra_init_early);
    97	
    98	static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
    99	{
   100		struct device_node *node = pdev->dev.of_node;
   101		int r, i;
   102	
   103		if (!infra_clk_data) {
   104			infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
   105			if (!infra_clk_data)
   106				return -ENOMEM;
   107		} else {
   108			for (i = 0; i < CLK_INFRA_NR_CLK; i++)
   109				if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
   110					infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
   111		}
   112	
   113		r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
   114					   ARRAY_SIZE(infra_gates), infra_clk_data);
   115		if (r)
   116			return r;
   117	
   118		r = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
   119					      ARRAY_SIZE(cpu_muxes), infra_clk_data);
   120		if (r)
   121			goto unregister_gates;
   122	
   123		r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
   124		if (r)
   125			goto unregister_cpumuxes;
   126	
   127		r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
   128		if (r)
   129			goto unregister_clk_hw;
   130	
 > 131		platform_set_drvdata(pdev, clk_data);
   132	
   133		return 0;
   134	
   135	unregister_clk_hw:
   136		of_clk_del_provider(node);
   137	unregister_cpumuxes:
   138		mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), infra_clk_data);
   139	unregister_gates:
   140		mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), infra_clk_data);
   141		return r;
   142	}
   143	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
