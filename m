Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E726E16E;
	Mon, 18 Aug 2025 23:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560926; cv=none; b=UIT6EGoz2/H8q9++fWrI3NNcf9HHcxkBB0RnJ+Q3/fnMkVbxx9Jvgas0mE+WdtTd1xiQJ1mLol3PtrLlP/paL6NvgQnaNq85bGjEJBk9zXTGQ93QlH5fvb1a3b6c1ayYbk+zf83OLcxAzqX4zEFRGbX7M9MD1Ur9d/haWS44ZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560926; c=relaxed/simple;
	bh=cpMG6ZE8d/ixzozIJD/dW51ppkyWuFdKh2Dd/Jc1AZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0eXCPU+RKlRMlYo3fD7/tR5Xes5PUzFCoGthquk+q93P6BTac2Sml5+rXAvAnvLECmWCiJXyR4oKuUhNFB7/6y2vB66JDyXZUcTfaaovbXarTLlRd48SBavq9wWqToOkft8Xytcy+qIur9RLGwQwUqlLHhvuvNp1lMQSb4t/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5zYmf3p; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5zYmf3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755560924; x=1787096924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cpMG6ZE8d/ixzozIJD/dW51ppkyWuFdKh2Dd/Jc1AZo=;
  b=A5zYmf3pORHRM+2TDMftLoEm0M5Zx1r9zjnYMBSKzsVCPM7FPJWeNGup
   S/GxHxCTsoOLpo4/hr1icnX+Ee7cMUSnXZHOujH2TH2yapEPBu5qeGU9W
   Ux3qKg/emapOku8hjaJB9qt8ogJPYUABwxksKT+bphK+jAPqJGOAqPkkj
   NJBJC5/0/X9kWWvlPH84gqmiRiI8e0sgu8phH1Rcn7Hn+XBCkDCFU/T36
   YOiYGDChO8BMd9+lenkjj2DoPRjxqouQ2/vIs7HVZNdL1cIx7DyStgfsK
   FXte+86vVwvTFbboG7RKfmy3VA5RQqvAjHcCwIpW8dzqTUdoxykzs8JS0
   g==;
X-CSE-ConnectionGUID: P6qrO1urSWGR5ukl7CE3sA==
X-CSE-MsgGUID: oiwAZMvYSfSBzUIYPQlz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61630001"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="61630001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 16:48:44 -0700
X-CSE-ConnectionGUID: O/eCKKPCQcm5hf6lM6MwSQ==
X-CSE-MsgGUID: ZYHv1rlXQeye6Dehu85Rqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171942094"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 16:48:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo9aB-000GJB-36;
	Mon, 18 Aug 2025 23:48:12 +0000
Date: Tue, 19 Aug 2025 07:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] PM/OPP: Support to match OPP based on both
 frequency and level.
Message-ID: <202508190743.lszMYiro-lkp@intel.com>
References: <20250818-opp_pcie-v2-1-071524d98967@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-opp_pcie-v2-1-071524d98967@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PM-OPP-Support-to-match-OPP-based-on-both-frequency-and-level/20250818-162759
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250818-opp_pcie-v2-1-071524d98967%40oss.qualcomm.com
patch subject: [PATCH v2 1/3] PM/OPP: Support to match OPP based on both frequency and level.
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250819/202508190743.lszMYiro-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190743.lszMYiro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190743.lszMYiro-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:89:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:18:
>> include/linux/pm_opp.h:297:20: warning: no previous prototype for function 'dev_pm_opp_find_freq_level_exact' [-Wmissing-prototypes]
     297 | struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
         |                    ^
   include/linux/pm_opp.h:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
         | ^
         | static 
   kernel/sched/core.c:2445:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    2445 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5795:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5795 | static inline void sched_tick_stop(int cpu) { }
         |                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:6514:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6514 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6515:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6515 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8305:20: warning: unused function 'balance_hotplug_wait' [-Wunused-function]
    8305 | static inline void balance_hotplug_wait(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from kernel/sched/fair.c:57:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:18:
>> include/linux/pm_opp.h:297:20: warning: no previous prototype for function 'dev_pm_opp_find_freq_level_exact' [-Wmissing-prototypes]
     297 | struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
         |                    ^
   include/linux/pm_opp.h:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
         | ^
         | static 
   kernel/sched/fair.c:482:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     482 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:503:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     503 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:3997:20: warning: unused function 'load_avg_is_decayed' [-Wunused-function]
    3997 | static inline bool load_avg_is_decayed(struct sched_avg *sa)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6640:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6640 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6664:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6664 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6668:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6668 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9991:20: warning: unused function 'check_misfit_status' [-Wunused-function]
     9991 | static inline bool check_misfit_status(struct rq *rq)
          |                    ^~~~~~~~~~~~~~~~~~~
   8 warnings generated.
--
   In file included from kernel/sched/build_policy.c:41:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:18:
>> include/linux/pm_opp.h:297:20: warning: no previous prototype for function 'dev_pm_opp_find_freq_level_exact' [-Wmissing-prototypes]
     297 | struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
         |                    ^
   include/linux/pm_opp.h:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
         | ^
         | static 
   1 warning generated.


vim +/dev_pm_opp_find_freq_level_exact +297 include/linux/pm_opp.h

   296	
 > 297	struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
   298							    unsigned long freq,
   299							    unsigned int level,
   300							    bool available)
   301	{
   302		return ERR_PTR(-EOPNOTSUPP);
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
