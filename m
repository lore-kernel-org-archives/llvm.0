Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A038B7AF;
	Mon, 19 Jan 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848729; cv=none; b=c/GfBIQkXP8XnoOGgw5AV8nkA2cIZWNChCVjjcJpFz++zhevypcSct2QEwkS+bVQAolMUjF0vhxogzy4JyPyhUTDNvYu4SUiA2oEy4kEzqQJs5Q5fRR3FJKco24AUldaOQ1Lq7Tf3J5ZHM7Hp32Tfzq1kzpuSuGzpr6FwD5DlWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848729; c=relaxed/simple;
	bh=gp05TH7Rxv3L0cGNU9EMgU+QmKbdo68e89dA63GtbBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MwfMUIYkFhDcpCRlYxHkt4q5Lkn+a3SnTRx4l/0EV9ydDpwa8uWCjvpshT+mLVpdXq8TAn3XZUZbYonP+JhoaaRHZWDYML8UKSzAr03KGNb8ju5xjsaDN/taeS2MybHu0jGdpKGAIPqPk1WiU4nnLphL9C8guRTiabsgD+B4Jxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhriB6fM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhriB6fM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768848728; x=1800384728;
  h=date:from:to:cc:subject:message-id;
  bh=gp05TH7Rxv3L0cGNU9EMgU+QmKbdo68e89dA63GtbBs=;
  b=jhriB6fM/64woIL5J8NO8JzkkquzzsTX/zyiRyVxew/8Hv4IaM+xTYVh
   Rf+0XtD3gUFvdmYkqu5Y/kJWquHlK8t1N3fiEJIqnfr78QUQr84ep66qG
   DDRD32QttObGw0DTWBLoXo+yTJwTppBsoFeFO33JIwKtqaCp0tuideuMD
   DL3d5vFKgULKYIRvYerg5gNrfso5fIS4p7DYJXAEaFu3dgsqCFM3880Ey
   GRAZnRk3QYSj66yNy060VgxdBGDVdtzcV3UiSMVY5TVVvC1k+zsEl1RzT
   y/4sFrzkJ+cbMruIt3NhmePUhKYM5xB2m6b82UazrxoW1bpC9PVdxY7Eu
   g==;
X-CSE-ConnectionGUID: rlk5CAVYTsmPUlLkuXW7RA==
X-CSE-MsgGUID: GOpyXZa9RWyGYY6ywmiKFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70035925"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70035925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:52:07 -0800
X-CSE-ConnectionGUID: fxrDfzJTSnaOeFZypySiuQ==
X-CSE-MsgGUID: bSjqalNgSdevGsbd1Tfjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237197463"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 10:52:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuM7-00000000OBp-1KxZ;
	Mon, 19 Jan 2026 18:52:03 +0000
Date: Tue, 20 Jan 2026 02:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:debug_pm 24/27]
 drivers/pmdomain/pm_domain_test.c:152:14: error: use of undeclared identifier
 'pm_domain_cpu_gov'
Message-ID: <202601200225.LP7u9lzf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git debug_pm
head:   9906dfc4ce39030a1b96f46d4158406e5ba21b16
commit: f51046345a48ae9d1e9e06ca89d92c842bdf90e2 [24/27] pmdomain: Add driver for simple PM domain providers with perf support
config: arm64-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200225.LP7u9lzf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200225.LP7u9lzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200225.LP7u9lzf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/pm_domain_test.c:152:14: error: use of undeclared identifier 'pm_domain_cpu_gov'
     152 |                         pd_gov = &pm_domain_cpu_gov;
         |                                   ^
   1 error generated.


vim +/pm_domain_cpu_gov +152 drivers/pmdomain/pm_domain_test.c

   124	
   125	static int pd_init(struct device *dev, struct device_node *np)
   126	{
   127		struct generic_pm_domain *pd;
   128		struct dev_power_governor *pd_gov = NULL;
   129		struct genpd_power_state *states = NULL;
   130		int state_count = 0, ret;
   131		bool boot_on, cpu_pd;
   132	
   133		pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
   134		if (!pd)
   135			return -ENOMEM;
   136	
   137		/* DT property for CPU PM domain. */
   138		cpu_pd = of_property_present(np, "cpu_pm_domain");
   139		if (cpu_pd)
   140			pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
   141	
   142		ret = of_genpd_parse_idle_states(np, &states, &state_count);
   143		if (ret)
   144			dev_err(dev, "%s failed parsing idle states err=%d\n",
   145				__func__, ret);
   146		if (states) {
   147			pd->free_states = pd_free_states;
   148			pd->states = states;
   149			pd->state_count = state_count;
   150	
   151			if (cpu_pd)
 > 152				pd_gov = &pm_domain_cpu_gov;
   153			else
   154				pd_gov = &simple_qos_governor;
   155		}
   156	
   157		pd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
   158		pd->name = kbasename(pd->name);
   159		pd->power_off = pd_power_off;
   160		pd->power_on = pd_power_on;
   161	
   162		if (strcmp(dev_name(dev), "domain_perf") == 0) {
   163			dev_info(dev, "set perf-cb for %s\n", pd->name);
   164			pd->set_performance_state = pd_set_performance_state;
   165		}
   166	
   167		if (strcmp(dev_name(dev), "domain_perf_single") == 0) {
   168			dev_info(dev, "set perf-cb for %s\n", pd->name);
   169			pd->set_performance_state = pd_set_performance_state;
   170		}
   171	
   172		if (strcmp(dev_name(dev), "domain_irq_safe") == 0) {
   173			dev_info(dev, "Set GENPD_FLAG_IRQ_SAFE for %s\n", pd->name);
   174			pd->flags |= GENPD_FLAG_IRQ_SAFE;
   175		}
   176	
   177		/* DT property to see if boot-on|off. */
   178		boot_on = of_property_present(np, "boot-on");
   179	
   180		ret = pm_genpd_init(pd, pd_gov, !boot_on);
   181		if (ret) {
   182			kfree(pd->states);
   183			return ret;
   184		}
   185	
   186		ret = of_genpd_add_provider_simple(np, pd);
   187		if (ret)
   188			pm_genpd_remove(pd);
   189	
   190		return ret;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
