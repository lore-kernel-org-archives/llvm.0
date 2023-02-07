Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CEA8BF1;
	Tue,  7 Feb 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675805680; x=1707341680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rk3STxwXlLTIA+18/o9DVvRBIh5FH0jKa6+66pEn1s=;
  b=jNIS4Q16j/xKlhQceNmTzk3wg6LTm9TNKYaDhN9zgNVGY1yK+5HaJeDY
   qulxtkP9IA/ocNS5cbuSZOqJnlHSIjuYALf5hYGq/6YL59Oz2BdKB6w2B
   pdn0+2/lKScgOKwGQyTjsNhFIZ8U4m4a8zGypaiG90ZHAo1n4HiTNKC6Y
   rD2LlaxpkZ2ZGRsNVPVJvHc/K082WDHDZh4zTPPQ2cbbyUqZAXZehDc8v
   Eq6lPV+Z5eJ1vY6J1zy8pEFFj+dM2eEpBKRyGd7zyB6VkmTYf0joVUQS+
   uJfRqaG8QqAes2pp/yPj90g//G/vixQn/huZ2nGoDU5s+5/vea0r5j1Ez
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="309283469"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="309283469"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 13:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644606027"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="644606027"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Feb 2023 13:34:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPVbn-0003uS-2D;
	Tue, 07 Feb 2023 21:34:35 +0000
Date: Wed, 8 Feb 2023 05:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Perry Yuan <Perry.Yuan@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	Wyes Karny <wyes.karny@amd.com>
Subject: [linux-next:master 9935/10933] drivers/cpufreq/amd-pstate.c:864:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202302080535.YeJXn11A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49a8133221c71b935f36a7c340c0271c2a9ee2db
commit: ffa5096a7c338641f70fb06d4778e8cf400181a8 [9935/10933] cpufreq: amd-pstate: implement Pstate EPP support for the AMD processors
config: i386-buildonly-randconfig-r004-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080535.YeJXn11A-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ffa5096a7c338641f70fb06d4778e8cf400181a8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ffa5096a7c338641f70fb06d4778e8cf400181a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate.c:864:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (rc)
               ^~
   drivers/cpufreq/amd-pstate.c:920:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/cpufreq/amd-pstate.c:864:2: note: remove the 'if' if its condition is always false
           if (rc)
           ^~~~~~~
   drivers/cpufreq/amd-pstate.c:853:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!dev)
               ^~~~
   drivers/cpufreq/amd-pstate.c:920:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/cpufreq/amd-pstate.c:853:2: note: remove the 'if' if its condition is always false
           if (!dev)
           ^~~~~~~~~
   drivers/cpufreq/amd-pstate.c:841:66: note: initialize the variable 'ret' to silence this warning
           int min_freq, max_freq, nominal_freq, lowest_nonlinear_freq, ret;
                                                                           ^
                                                                            = 0
>> drivers/cpufreq/amd-pstate.c:957:6: warning: variable 'epp' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (cpudata->epp_policy == cpudata->policy)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/amd-pstate.c:982:30: note: uninitialized use occurs here
           amd_pstate_set_epp(cpudata, epp);
                                       ^~~
   drivers/cpufreq/amd-pstate.c:957:2: note: remove the 'if' if its condition is always false
           if (cpudata->epp_policy == cpudata->policy)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/amd-pstate.c:936:9: note: initialize the variable 'epp' to silence this warning
           s16 epp;
                  ^
                   = 0
   3 warnings generated.


vim +864 drivers/cpufreq/amd-pstate.c

   838	
   839	static int amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
   840	{
   841		int min_freq, max_freq, nominal_freq, lowest_nonlinear_freq, ret;
   842		struct amd_cpudata *cpudata;
   843		struct device *dev;
   844		int rc;
   845		u64 value;
   846	
   847		/*
   848		 * Resetting PERF_CTL_MSR will put the CPU in P0 frequency,
   849		 * which is ideal for initialization process.
   850		 */
   851		amd_perf_ctl_reset(policy->cpu);
   852		dev = get_cpu_device(policy->cpu);
   853		if (!dev)
   854			goto free_cpudata1;
   855	
   856		cpudata = kzalloc(sizeof(*cpudata), GFP_KERNEL);
   857		if (!cpudata)
   858			return -ENOMEM;
   859	
   860		cpudata->cpu = policy->cpu;
   861		cpudata->epp_policy = 0;
   862	
   863		rc = amd_pstate_init_perf(cpudata);
 > 864		if (rc)
   865			goto free_cpudata1;
   866	
   867		min_freq = amd_get_min_freq(cpudata);
   868		max_freq = amd_get_max_freq(cpudata);
   869		nominal_freq = amd_get_nominal_freq(cpudata);
   870		lowest_nonlinear_freq = amd_get_lowest_nonlinear_freq(cpudata);
   871		if (min_freq < 0 || max_freq < 0 || min_freq > max_freq) {
   872			dev_err(dev, "min_freq(%d) or max_freq(%d) value is incorrect\n",
   873					min_freq, max_freq);
   874			ret = -EINVAL;
   875			goto free_cpudata1;
   876		}
   877	
   878		policy->cpuinfo.min_freq = min_freq;
   879		policy->cpuinfo.max_freq = max_freq;
   880		/* It will be updated by governor */
   881		policy->cur = policy->cpuinfo.min_freq;
   882	
   883		/* Initial processor data capability frequencies */
   884		cpudata->max_freq = max_freq;
   885		cpudata->min_freq = min_freq;
   886		cpudata->nominal_freq = nominal_freq;
   887		cpudata->lowest_nonlinear_freq = lowest_nonlinear_freq;
   888	
   889		policy->driver_data = cpudata;
   890	
   891		cpudata->epp_cached = amd_pstate_get_epp(cpudata, 0);
   892	
   893		policy->min = policy->cpuinfo.min_freq;
   894		policy->max = policy->cpuinfo.max_freq;
   895	
   896		/*
   897		 * Set the policy to powersave to provide a valid fallback value in case
   898		 * the default cpufreq governor is neither powersave nor performance.
   899		 */
   900		policy->policy = CPUFREQ_POLICY_POWERSAVE;
   901	
   902		if (boot_cpu_has(X86_FEATURE_CPPC)) {
   903			policy->fast_switch_possible = true;
   904			ret = rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &value);
   905			if (ret)
   906				return ret;
   907			WRITE_ONCE(cpudata->cppc_req_cached, value);
   908	
   909			ret = rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1, &value);
   910			if (ret)
   911				return ret;
   912			WRITE_ONCE(cpudata->cppc_cap1_cached, value);
   913		}
   914		amd_pstate_boost_init(cpudata);
   915	
   916		return 0;
   917	
   918	free_cpudata1:
   919		kfree(cpudata);
   920		return ret;
   921	}
   922	
   923	static int amd_pstate_epp_cpu_exit(struct cpufreq_policy *policy)
   924	{
   925		pr_debug("CPU %d exiting\n", policy->cpu);
   926		policy->fast_switch_possible = false;
   927		return 0;
   928	}
   929	
   930	static void amd_pstate_epp_init(unsigned int cpu)
   931	{
   932		struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
   933		struct amd_cpudata *cpudata = policy->driver_data;
   934		u32 max_perf, min_perf;
   935		u64 value;
   936		s16 epp;
   937	
   938		max_perf = READ_ONCE(cpudata->highest_perf);
   939		min_perf = READ_ONCE(cpudata->lowest_perf);
   940	
   941		value = READ_ONCE(cpudata->cppc_req_cached);
   942	
   943		if (cpudata->policy == CPUFREQ_POLICY_PERFORMANCE)
   944			min_perf = max_perf;
   945	
   946		/* Initial min/max values for CPPC Performance Controls Register */
   947		value &= ~AMD_CPPC_MIN_PERF(~0L);
   948		value |= AMD_CPPC_MIN_PERF(min_perf);
   949	
   950		value &= ~AMD_CPPC_MAX_PERF(~0L);
   951		value |= AMD_CPPC_MAX_PERF(max_perf);
   952	
   953		/* CPPC EPP feature require to set zero to the desire perf bit */
   954		value &= ~AMD_CPPC_DES_PERF(~0L);
   955		value |= AMD_CPPC_DES_PERF(0);
   956	
 > 957		if (cpudata->epp_policy == cpudata->policy)
   958			goto skip_epp;
   959	
   960		cpudata->epp_policy = cpudata->policy;
   961	
   962		if (cpudata->policy == CPUFREQ_POLICY_PERFORMANCE) {
   963			epp = amd_pstate_get_epp(cpudata, value);
   964			if (epp < 0)
   965				goto skip_epp;
   966			/* force the epp value to be zero for performance policy */
   967			epp = 0;
   968		} else {
   969			/* Get BIOS pre-defined epp value */
   970			epp = amd_pstate_get_epp(cpudata, value);
   971			if (epp)
   972				goto skip_epp;
   973		}
   974		/* Set initial EPP value */
   975		if (boot_cpu_has(X86_FEATURE_CPPC)) {
   976			value &= ~GENMASK_ULL(31, 24);
   977			value |= (u64)epp << 24;
   978		}
   979	
   980	skip_epp:
   981		WRITE_ONCE(cpudata->cppc_req_cached, value);
   982		amd_pstate_set_epp(cpudata, epp);
   983		cpufreq_cpu_put(policy);
   984	}
   985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
