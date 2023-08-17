Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DE2D52B;
	Thu, 17 Aug 2023 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692258883; x=1723794883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sf3RK2lXleJ+hE+XnvcPAKYqYXhQamKKSIsj03WyQng=;
  b=nqkwGsJquLojGuuUasQ5UoPIMSyRzVmGrTWtd17AyuFhbESQPYZI8SWp
   UzUSqQuBQ8xns0NTP/TXA1jOBclSvTiPD5IxTuiri+pxxp5R7LcL47iEO
   brDWxyTzf2pgp8kHolRaq6bOmQ3euQo/rjY/m7HicAD60/uP7jcOIJkEC
   laGKPE9QPb3E0+LpuCzSZCJiUQ8Ak5If3npPIV/9XqBHbz51F2T5fkNbE
   BfiwIqpxX486mF97gDZ5Pk5+QU4QKHfAGCR7kWOq/q2qUgWrZWjddBhs5
   mBV063YPm0+eKw2YwPjAPmFP3LFNI8AGz8YGdTUgIzHBgHoOMssd+q/uw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353058264"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353058264"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848796704"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="848796704"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 00:54:39 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXq3-0000vF-0Q;
	Thu, 17 Aug 2023 07:54:39 +0000
Date: Thu, 17 Aug 2023 15:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Petlozu Pravareshwar <petlozup@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
	Stefan Kristiansson <stefank@nvidia.com>
Subject: drivers/soc/tegra/pmc.c:467: warning: Function parameter or member
 'syscore' not described in 'tegra_pmc'
Message-ID: <202308171504.PtwuzSji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 1ddb8f6d44ff482c9953a06f800453bc372cfead soc/tegra: pmc: Fix dual edge triggered wakes
date:   9 months ago
config: arm-randconfig-r015-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171504.PtwuzSji-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171504.PtwuzSji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171504.PtwuzSji-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/tegra/pmc.c:467: warning: Function parameter or member 'syscore' not described in 'tegra_pmc'


vim +467 drivers/soc/tegra/pmc.c

5f84bb1a4099e2 Sandipan Patra       2018-10-24  383  
7232398abc6a71 Thierry Reding       2014-07-11  384  /**
7232398abc6a71 Thierry Reding       2014-07-11  385   * struct tegra_pmc - NVIDIA Tegra PMC
35b67291b4a85d Jon Hunter           2015-12-04  386   * @dev: pointer to PMC device structure
7232398abc6a71 Thierry Reding       2014-07-11  387   * @base: pointer to I/O remapped register region
bbe5af60041cae Thierry Reding       2019-01-25  388   * @wake: pointer to I/O remapped region for WAKE registers
bbe5af60041cae Thierry Reding       2019-01-25  389   * @aotag: pointer to I/O remapped region for AOTAG registers
bbe5af60041cae Thierry Reding       2019-01-25  390   * @scratch: pointer to I/O remapped region for scratch registers
7232398abc6a71 Thierry Reding       2014-07-11  391   * @clk: pointer to pclk clock
35b67291b4a85d Jon Hunter           2015-12-04  392   * @soc: pointer to SoC data structure
e247deae1a5508 Mikko Perttunen      2019-01-25  393   * @tz_only: flag specifying if the PMC can only be accessed via TrustZone
3195ac6d9cbeef Jon Hunter           2015-12-04  394   * @debugfs: pointer to debugfs entry
7232398abc6a71 Thierry Reding       2014-07-11  395   * @rate: currently configured rate of pclk
7232398abc6a71 Thierry Reding       2014-07-11  396   * @suspend_mode: lowest suspend mode available
7232398abc6a71 Thierry Reding       2014-07-11  397   * @cpu_good_time: CPU power good time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  398   * @cpu_off_time: CPU power off time (in microsecends)
7232398abc6a71 Thierry Reding       2014-07-11  399   * @core_osc_time: core power good OSC time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  400   * @core_pmu_time: core power good PMU time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  401   * @core_off_time: core power off time (in microseconds)
7232398abc6a71 Thierry Reding       2014-07-11  402   * @corereq_high: core power request is active-high
7232398abc6a71 Thierry Reding       2014-07-11  403   * @sysclkreq_high: system clock request is active-high
7232398abc6a71 Thierry Reding       2014-07-11  404   * @combined_req: combined power request for CPU & core
7232398abc6a71 Thierry Reding       2014-07-11  405   * @cpu_pwr_good_en: CPU power good signal is enabled
7232398abc6a71 Thierry Reding       2014-07-11  406   * @lp0_vec_phys: physical base address of the LP0 warm boot code
7232398abc6a71 Thierry Reding       2014-07-11  407   * @lp0_vec_size: size of the LP0 warm boot code
a38045121bf421 Jon Hunter           2016-03-30  408   * @powergates_available: Bitmap of available power gates
7232398abc6a71 Thierry Reding       2014-07-11  409   * @powergates_lock: mutex for power gate register access
bbe5af60041cae Thierry Reding       2019-01-25  410   * @pctl_dev: pin controller exposed by the PMC
bbe5af60041cae Thierry Reding       2019-01-25  411   * @domain: IRQ domain provided by the PMC
bbe5af60041cae Thierry Reding       2019-01-25  412   * @irq: chip implementation for the IRQ domain
e57a243f5d896f Dmitry Osipenko      2019-09-26  413   * @clk_nb: pclk clock changes handler
d3a20dcbca4880 Thierry Reding       2022-05-06  414   * @core_domain_state_synced: flag marking the core domain's state as synced
d3a20dcbca4880 Thierry Reding       2022-05-06  415   * @core_domain_registered: flag marking the core domain as registered
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  416   * @wake_type_level_map: Bitmap indicating level type for non-dual edge wakes
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  417   * @wake_type_dual_edge_map: Bitmap indicating if a wake is dual-edge or not
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  418   * @wake_sw_status_map: Bitmap to hold raw status of wakes without mask
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  419   * @wake_cntrl_level_map: Bitmap to hold wake levels to be programmed in
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  420   *     cntrl register associated with each wake during system suspend.
7232398abc6a71 Thierry Reding       2014-07-11  421   */
7232398abc6a71 Thierry Reding       2014-07-11  422  struct tegra_pmc {
3568df3d31d62b Mikko Perttunen      2015-01-06  423  	struct device *dev;
7232398abc6a71 Thierry Reding       2014-07-11  424  	void __iomem *base;
c641ec6eab8587 Thierry Reding       2017-08-30  425  	void __iomem *wake;
c641ec6eab8587 Thierry Reding       2017-08-30  426  	void __iomem *aotag;
5be2255676bf2b Thierry Reding       2017-08-30  427  	void __iomem *scratch;
7232398abc6a71 Thierry Reding       2014-07-11  428  	struct clk *clk;
3195ac6d9cbeef Jon Hunter           2015-12-04  429  	struct dentry *debugfs;
7232398abc6a71 Thierry Reding       2014-07-11  430  
7232398abc6a71 Thierry Reding       2014-07-11  431  	const struct tegra_pmc_soc *soc;
e247deae1a5508 Mikko Perttunen      2019-01-25  432  	bool tz_only;
7232398abc6a71 Thierry Reding       2014-07-11  433  
7232398abc6a71 Thierry Reding       2014-07-11  434  	unsigned long rate;
7232398abc6a71 Thierry Reding       2014-07-11  435  
7232398abc6a71 Thierry Reding       2014-07-11  436  	enum tegra_suspend_mode suspend_mode;
7232398abc6a71 Thierry Reding       2014-07-11  437  	u32 cpu_good_time;
7232398abc6a71 Thierry Reding       2014-07-11  438  	u32 cpu_off_time;
7232398abc6a71 Thierry Reding       2014-07-11  439  	u32 core_osc_time;
7232398abc6a71 Thierry Reding       2014-07-11  440  	u32 core_pmu_time;
7232398abc6a71 Thierry Reding       2014-07-11  441  	u32 core_off_time;
7232398abc6a71 Thierry Reding       2014-07-11  442  	bool corereq_high;
7232398abc6a71 Thierry Reding       2014-07-11  443  	bool sysclkreq_high;
7232398abc6a71 Thierry Reding       2014-07-11  444  	bool combined_req;
7232398abc6a71 Thierry Reding       2014-07-11  445  	bool cpu_pwr_good_en;
7232398abc6a71 Thierry Reding       2014-07-11  446  	u32 lp0_vec_phys;
7232398abc6a71 Thierry Reding       2014-07-11  447  	u32 lp0_vec_size;
a38045121bf421 Jon Hunter           2016-03-30  448  	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
7232398abc6a71 Thierry Reding       2014-07-11  449  
7232398abc6a71 Thierry Reding       2014-07-11  450  	struct mutex powergates_lock;
4a37f11c8f57ff Aapo Vienamo         2018-08-10  451  
4a37f11c8f57ff Aapo Vienamo         2018-08-10  452  	struct pinctrl_dev *pctl_dev;
19906e6b166721 Thierry Reding       2018-09-17  453  
19906e6b166721 Thierry Reding       2018-09-17  454  	struct irq_domain *domain;
19906e6b166721 Thierry Reding       2018-09-17  455  	struct irq_chip irq;
e57a243f5d896f Dmitry Osipenko      2019-09-26  456  
e57a243f5d896f Dmitry Osipenko      2019-09-26  457  	struct notifier_block clk_nb;
41bafa698ddd07 Dmitry Osipenko      2021-06-01  458  
41bafa698ddd07 Dmitry Osipenko      2021-06-01  459  	bool core_domain_state_synced;
41bafa698ddd07 Dmitry Osipenko      2021-06-01  460  	bool core_domain_registered;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  461  
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  462  	unsigned long *wake_type_level_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  463  	unsigned long *wake_type_dual_edge_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  464  	unsigned long *wake_sw_status_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  465  	unsigned long *wake_cntrl_level_map;
1ddb8f6d44ff48 Petlozu Pravareshwar 2022-09-30  466  	struct syscore_ops syscore;
7232398abc6a71 Thierry Reding       2014-07-11 @467  };
7232398abc6a71 Thierry Reding       2014-07-11  468  

:::::: The code at line 467 was first introduced by commit
:::::: 7232398abc6a7186e315425638c367d50c674718 ARM: tegra: Convert PMC to a driver

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
