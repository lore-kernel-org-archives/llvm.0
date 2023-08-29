Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983B28E7;
	Tue, 29 Aug 2023 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693320750; x=1724856750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FylhOCBxnWrtavNBNeHVWqufiBk07ThM8X7Znf1QkXc=;
  b=Q6GH1icUEEgt/vTYDkq1Wm4wtef9dz3NFJ9qrhl8CzMQD7OJkFDd+LRx
   mSWiEw83Y5SJNM204tVynKAn5WuvBvHmuFqvtWkAOHIXG8YiuvYJCCaip
   9tlm+Kp+ebcXe4vItpUoDllgdxWZRTX/w4fTkIG4YZu47ndG8gLxVP8ry
   fe1MxjIZEXS6Q99FCaR1bwRpCluB8skpuiF+wtgX2bfrtwxE5Sbm1ipkj
   /RZFJ75e/WS/uCg6GqdMG6QttGnpzi6ed8Vtqr6ZRpa2ULir0l+xYpGIi
   3Nd2bYtvX+Lm/YVTlMoOx/NBkZPNIjfWgw8ZuiF5yhtv38LQmNTgNFZKI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406380414"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="406380414"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 07:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985369271"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="985369271"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 07:52:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb04t-0008pB-3A;
	Tue, 29 Aug 2023 14:52:23 +0000
Date: Tue, 29 Aug 2023 22:52:12 +0800
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
Subject: Re: [PATCH V4 3/7] cpufreq: amd-pstate: Enable AMD Pstate Preferred
 Core Supporting.
Message-ID: <202308292233.XhcXfvSm-lkp@intel.com>
References: <20230829064340.1136448-4-li.meng@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829064340.1136448-4-li.meng@amd.com>

Hi Meng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.5 next-20230829]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meng-Li/x86-Drop-CPU_SUP_INTEL-from-SCHED_MC_PRIO-for-the-expansion/20230829-144723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230829064340.1136448-4-li.meng%40amd.com
patch subject: [PATCH V4 3/7] cpufreq: amd-pstate: Enable AMD Pstate Preferred Core Supporting.
config: x86_64-randconfig-r005-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292233.XhcXfvSm-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292233.XhcXfvSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308292233.XhcXfvSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate.c:692: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get the highest performance register value.


vim +692 drivers/cpufreq/amd-pstate.c

   690	
   691	/**
 > 692	 * Get the highest performance register value.
   693	 * @cpu: CPU from which to get highest performance.
   694	 * @highest_perf: Return address.
   695	 *
   696	 * Return: 0 for success, -EIO otherwise.
   697	 */
   698	static int amd_pstate_get_highest_perf(int cpu, u64 *highest_perf)
   699	{
   700	       int ret;
   701	
   702	       if (boot_cpu_has(X86_FEATURE_CPPC)) {
   703	               u64 cap1;
   704	
   705	               ret = rdmsrl_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &cap1);
   706	               if (ret)
   707	                       return ret;
   708	               WRITE_ONCE(*highest_perf, AMD_CPPC_HIGHEST_PERF(cap1));
   709	       } else {
   710	               ret = cppc_get_highest_perf(cpu, highest_perf);
   711	       }
   712	
   713	       return (ret);
   714	}
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
