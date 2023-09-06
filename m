Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989E7E;
	Wed,  6 Sep 2023 03:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693969435; x=1725505435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WIdengHnfLVVyorpdiXXqfA4JGvJSbjUaTS4CPENnpA=;
  b=bFRYlN1KJwjv+eiw7hB5zQ5Us23CIYHUegwbzp5dv14yNPYkgOvENX1R
   w5/JbGbrRcvVFatx1U8akLcqh2/KXW6R6iw52X9/JvZfr0Ihpdw+N0DuE
   iVaxTki5Z7G17vWgXeGWAzgrKHdPPT44bMuzGnUcIINhs5OD3jA2Axkwx
   T4kRowfrlMBbZT3ltP1nbTRx0fETs5C3pglkiSmodUm0RgE82/zdthzEs
   EzCixfC5CwjdP/tFwrAQ4q0B0qmloGOKxLsl80BtmF4p9x03ftW5VIh5x
   EkOBUSSgw7vnz6ZlFw+kGsxvJDBfITD3KMEVEdUgeJdpTbaMls5wd2Xn3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375859557"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="375859557"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 20:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806843784"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="806843784"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2023 20:03:48 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdipW-0002PB-1R;
	Wed, 06 Sep 2023 03:03:46 +0000
Date: Wed, 6 Sep 2023 11:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Li <li.meng@amd.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Huang Rui <ray.huang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-acpi@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	Nathan Fontenot <nathan.fontenot@amd.com>,
	Deepak Sharma <deepak.sharma@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Shimmer Huang <shimmer.huang@amd.com>,
	Perry Yuan <Perry.Yuan@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Borislav Petkov <bp@alien8.de>, Meng Li <li.meng@amd.com>
Subject: Re: [PATCH V5 3/7] cpufreq: amd-pstate: Enable amd-pstate preferred
 core supporting.
Message-ID: <202309061049.2ag7qkvI-lkp@intel.com>
References: <20230905015116.2268926-4-li.meng@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905015116.2268926-4-li.meng@amd.com>

Hi Meng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.5 next-20230905]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meng-Li/x86-Drop-CPU_SUP_INTEL-from-SCHED_MC_PRIO-for-the-expansion/20230906-003754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230905015116.2268926-4-li.meng%40amd.com
patch subject: [PATCH V5 3/7] cpufreq: amd-pstate: Enable amd-pstate preferred core supporting.
config: x86_64-randconfig-r022-20230906 (https://download.01.org/0day-ci/archive/20230906/202309061049.2ag7qkvI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309061049.2ag7qkvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309061049.2ag7qkvI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate.c:1131:8: warning: unused variable 'dev_attr_hw_prefcore' [-Wunused-variable]
   static DEVICE_ATTR_RO(hw_prefcore);
          ^
   include/linux/device.h:198:26: note: expanded from macro 'DEVICE_ATTR_RO'
           struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
                                   ^
   <scratch space>:91:1: note: expanded from here
   dev_attr_hw_prefcore
   ^
   1 warning generated.


vim +/dev_attr_hw_prefcore +1131 drivers/cpufreq/amd-pstate.c

  1126	
  1127	cpufreq_freq_attr_ro(amd_pstate_highest_perf);
  1128	cpufreq_freq_attr_rw(energy_performance_preference);
  1129	cpufreq_freq_attr_ro(energy_performance_available_preferences);
  1130	static DEVICE_ATTR_RW(status);
> 1131	static DEVICE_ATTR_RO(hw_prefcore);
  1132	static DEVICE_ATTR_RO(prefcore);
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
