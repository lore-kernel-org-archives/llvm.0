Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A873C1BDC3;
	Sun,  5 Jan 2025 06:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736057411; cv=none; b=CLbk7pHtBuJNqD3V5A0r9S6OyANnubAy8ODkqavvWogUq44Ju+DZhjm13PLIwT5+kC2V9Df3WaL5dwwdVLca9Al23lauHHfpH+eLge6PvbayjNL8p84notOcgtRcs5uF3jvN2hKlSwLWVMH03ehuMBwYd0q0RoGx8NCKToev+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736057411; c=relaxed/simple;
	bh=KHFOolN5P4LbcoQt8S+7ZLllVPdkK5YSQbXEaqgZXmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1E2tq1tsve07TuFBd4RHTWJN/DolSHd2mntss3WPvtziON7WCVVtwxt4SBbql2vJ/5b84ejXhVUNlxEorT+AuTRn9A6z93yBdRi12IiIyXFf5qdqQ8jzybTJUhAvxlJiNYnC0iWl3nONPO/G/ptUnu9yT/f77Ei0M6i3sk+T10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBxi3wvy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBxi3wvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736057409; x=1767593409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KHFOolN5P4LbcoQt8S+7ZLllVPdkK5YSQbXEaqgZXmU=;
  b=aBxi3wvyR04WL2oDu+u0KQE8pEvXTwtae38PnmeA7RdFXE3RhmgLWDN3
   lMfFF8W3xOi8GVjDLeKcQkqRoNGbgGVjLzNtGBAxPaXcJ8nR708Kg9naL
   7IXGXv4WUvoqio4NZJO16gUxQIQOxceE+XagjMC2d3mzcP+KLmk9zq5yq
   pDvSMXnjNGr5rY34/hIOYYwMAV4ERShIhltVVArekwQ99TEkpOTPvIttw
   8sXO4Ghp1j2y2QXfapvmD0Xe+PQfrkv1/4v3Ql51QtfxULnjODP8VQlNn
   IG0OnIDqqmL7vnJPjnirHGaE0RCJoccF1QNxOrkOXGPsoU0L53lRlTZNA
   w==;
X-CSE-ConnectionGUID: jMgREAi+TBmCzZyD5KdkEQ==
X-CSE-MsgGUID: bA02hEF8QB6tGN2Hw8Dd7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39923329"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="39923329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 22:10:09 -0800
X-CSE-ConnectionGUID: cnlkorYTTxW1K+emA5mTIQ==
X-CSE-MsgGUID: jZSGXCNKS4GnJgK3G6Y8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102634435"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jan 2025 22:10:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUJpt-000BUx-2n;
	Sun, 05 Jan 2025 06:10:05 +0000
Date: Sun, 5 Jan 2025 14:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
Message-ID: <202501051329.I1JXpkj5-lkp@intel.com>
References: <20250104181305.28185-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104181305.28185-2-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/cpufreq-airoha-Add-EN7581-CPUFreq-SMCCC-driver/20250105-022153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250104181305.28185-2-ansuelsmth%40gmail.com
patch subject: [PATCH v8 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
config: arm64-randconfig-001-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051329.I1JXpkj5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051329.I1JXpkj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051329.I1JXpkj5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/airoha-cpufreq.c:53:21: error: incompatible function pointer types assigning to 'config_clks_t' (aka 'int (*)(struct device *, struct opp_table *, struct dev_pm_opp *, void *, _Bool)') from 'int (struct device *, struct opp_table *, struct dev_pm_opp *, struct dev_pm_opp *, void *, bool)' (aka 'int (struct device *, struct opp_table *, struct dev_pm_opp *, struct dev_pm_opp *, void *, _Bool)') [-Wincompatible-function-pointer-types]
      53 |         config.config_clks = airoha_cpufreq_config_clks_nop;
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cpufreq/airoha-cpufreq.c:54:9: error: no member named 'genpd_names' in 'struct dev_pm_opp_config'
      54 |         config.genpd_names = airoha_cpufreq_genpd_names;
         |         ~~~~~~ ^
>> drivers/cpufreq/airoha-cpufreq.c:55:9: error: no member named 'virt_devs' in 'struct dev_pm_opp_config'
      55 |         config.virt_devs = &virt_devs;
         |         ~~~~~~ ^
   drivers/cpufreq/airoha-cpufreq.c:73:19: error: no member named 'genpd_names' in 'struct dev_pm_opp_config'
      73 |                                 name = config.genpd_names;
         |                                        ~~~~~~ ^
>> drivers/cpufreq/airoha-cpufreq.c:117:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     117 |         .remove_new = airoha_cpufreq_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.


vim +53 drivers/cpufreq/airoha-cpufreq.c

    32	
    33	static int airoha_cpufreq_probe(struct platform_device *pdev)
    34	{
    35		struct dev_pm_opp_config config = { };
    36		struct platform_device *cpufreq_dt;
    37		struct airoha_cpufreq_priv *priv;
    38		struct device *dev = &pdev->dev;
    39		struct device **virt_devs = NULL;
    40		struct device *cpu_dev;
    41		int ret;
    42	
    43		/* CPUs refer to the same OPP table */
    44		cpu_dev = get_cpu_device(0);
    45		if (!cpu_dev)
    46			return -ENODEV;
    47	
    48		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    49		if (!priv)
    50			return -ENOMEM;
    51	
    52		config.clk_names = airoha_cpufreq_clk_names;
  > 53		config.config_clks = airoha_cpufreq_config_clks_nop;
  > 54		config.genpd_names = airoha_cpufreq_genpd_names;
  > 55		config.virt_devs = &virt_devs;
    56	
    57		priv->opp_token = dev_pm_opp_set_config(cpu_dev, &config);
    58		if (priv->opp_token < 0)
    59			return dev_err_probe(dev, priv->opp_token, "Failed to set OPP config\n");
    60	
    61		/* Set Attached PM for OPP ACTIVE */
    62		if (virt_devs) {
    63			const char * const *name = airoha_cpufreq_genpd_names;
    64			int i, j;
    65	
    66			for (i = 0; *name; i++, name++) {
    67				ret = pm_runtime_resume_and_get(virt_devs[i]);
    68				if (ret) {
    69					dev_err(cpu_dev, "failed to resume %s: %d\n",
    70						*name, ret);
    71	
    72					/* Rollback previous PM runtime calls */
    73					name = config.genpd_names;
    74					for (j = 0; *name && j < i; j++, name++)
    75						pm_runtime_put(virt_devs[j]);
    76	
    77					goto err_register_cpufreq;
    78				}
    79			}
    80			priv->virt_devs = virt_devs;
    81		}
    82	
    83		cpufreq_dt = platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
    84		ret = PTR_ERR_OR_ZERO(cpufreq_dt);
    85		if (ret) {
    86			dev_err(dev, "failed to create cpufreq-dt device: %d\n", ret);
    87			goto err_register_cpufreq;
    88		}
    89	
    90		priv->cpufreq_dt = cpufreq_dt;
    91		platform_set_drvdata(pdev, priv);
    92	
    93		return 0;
    94	
    95	err_register_cpufreq:
    96		dev_pm_opp_clear_config(priv->opp_token);
    97	
    98		return ret;
    99	}
   100	
   101	static void airoha_cpufreq_remove(struct platform_device *pdev)
   102	{
   103		struct airoha_cpufreq_priv *priv = platform_get_drvdata(pdev);
   104		const char * const *name = airoha_cpufreq_genpd_names;
   105		int i;
   106	
   107		platform_device_unregister(priv->cpufreq_dt);
   108	
   109		dev_pm_opp_clear_config(priv->opp_token);
   110	
   111		for (i = 0; *name; i++, name++)
   112			pm_runtime_put(priv->virt_devs[i]);
   113	}
   114	
   115	static struct platform_driver airoha_cpufreq_driver = {
   116		.probe = airoha_cpufreq_probe,
 > 117		.remove_new = airoha_cpufreq_remove,
   118		.driver = {
   119			.name = "airoha-cpufreq",
   120		},
   121	};
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
