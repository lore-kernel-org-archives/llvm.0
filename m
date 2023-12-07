Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D383D0D9;
	Thu,  7 Dec 2023 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gnmopq/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701954468; x=1733490468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSMgUk7Ew7kiByhEebr3AzwntDTDtTcmek+++Oo47f8=;
  b=Gnmopq/c9YZYf+CIQT6lLSw/i6UuNOFdx1ekKxr7lbvx9nXIReYA1PU0
   JLDtvWt36n3wwS9QjFoTEAyLPvvBqWZ9yTV0FGvQBc14XLTX/6lh33prb
   7ZhuJhYM+gk/2M/L6paoKur2094Q3pkkrHRHWjAiCUxTAMMQD2auMapa4
   Hl/Hl6kzGVccbfawHLbAwlfpC2E28yJFrLnVUk2WT/cdBiydtxguGPqKU
   LdrQcRKJsba0I+O3W2CeRyqza1i8KrWc45KNNWaI6QPLIXzpzA2aeITG6
   UMjZ9Pbd7XZh4myeB/Mn1tiN1rw9eTN5ZB966O3EPzURhW3Ddxk6dxCjo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12939954"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12939954"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103195085"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1103195085"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 07 Dec 2023 05:07:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBE6Q-000CGs-2D;
	Thu, 07 Dec 2023 13:07:42 +0000
Date: Thu, 7 Dec 2023 21:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: ixgbe01 <yangwang@njis.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [esmil:th1520 38/52] drivers/cpufreq/light-mpw-cpufreq.c:273:6:
 warning: unused variable 'val'
Message-ID: <202312072107.dt7pWSXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux th1520
head:   64731462dd62508162241c28bd319829df635524
commit: 851266b8b6ef516302144607a424a7986e950822 [38/52] add TH1520 cpu frequency driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312072107.dt7pWSXY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072107.dt7pWSXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072107.dt7pWSXY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/light-mpw-cpufreq.c:273:6: warning: unused variable 'val' [-Wunused-variable]
           u32 val = readl(ap_sys_reg);
               ^
   1 warning generated.


vim +/val +273 drivers/cpufreq/light-mpw-cpufreq.c

   264	
   265	/*
   266	 * Set CPU PLL1's frequency as minimum on panic
   267	 */
   268	static int panic_cpufreq_notifier_call(struct notifier_block *nb,
   269					 unsigned long action, void *data)
   270	{
   271		int cpu = smp_processor_id();
   272		struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
 > 273		u32 val = readl(ap_sys_reg);
   274	
   275		pr_info("enter panic_cpufreq_notifier_call\n");
   276	
   277		/*
   278		 * set CPU PLL1's frequency as minimum to compatible voltage
   279		 * becarefull if the PLL1 is serving the cpu core, swith to PLL0 first
   280		 */
   281		if (strcmp(__clk_get_name(clk_get_parent(clks[LIGHT_C910_CCLK].clk)),
   282			__clk_get_name(clks[LIGHT_C910_CCLK_I0].clk))) {
   283			pr_debug("[%s,%d]\n", __func__, __LINE__);
   284			clk_prepare_enable(clks[LIGHT_CPU_PLL0_FOUTPOSTDIV].clk);
   285			clk_set_rate(clks[LIGHT_CPU_PLL0_FOUTPOSTDIV].clk, policy->min * 1000);
   286			udelay(1);
   287			clk_set_parent(clks[LIGHT_C910_CCLK].clk, clks[LIGHT_C910_CCLK_I0].clk);
   288	
   289			pr_debug("[%s,%d]\n", __func__, __LINE__);
   290		}
   291	
   292		pr_debug("[%s,%d]\n", __func__, __LINE__);
   293		/*
   294		 * since the clk driver will use PLL1 as the default clock source,
   295		 * in order to compatible voltage which is unpredictable we should
   296		 * set the CPU PLL1's frequency as minimum in advance, otherwise the
   297		 * system may crash in crash kernel stage.
   298		 */
   299		clk_prepare_enable(clks[LIGHT_CPU_PLL1_FOUTPOSTDIV].clk);
   300		clk_set_rate(clks[LIGHT_CPU_PLL1_FOUTPOSTDIV].clk, policy->min * 1000);
   301		udelay(1);
   302	
   303		pr_info("finish to execute cpufreq notifier callback on panic\n");
   304	
   305		return 0;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
