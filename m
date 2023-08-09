Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5B17FE2;
	Wed,  9 Aug 2023 12:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691583214; x=1723119214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9OzKVyM0NRNd6zOxOAtBXjfpdX3XMfSLce3m0fLoAA=;
  b=UZ/4woBtn1q+teqf416CdKnPl9DJ6FLJa5+3P0tOqVe2roeY6l/FaMhU
   Kpz8jwE11cc8pWZP49Tb2Ae6clyFDUiEeeTkFCyl6PK7qPSrMdc3+nU7r
   7X0WWoJda8dGu+FyYLJllyjbPRZSgAREkI9LYREFnckLULdWr3+Ukv+3s
   yDsNyMvtrsSAQaEmw+xtq+p9KpR/u9ig+sWacLZQNmbYQfNz2V6shhL8x
   T5VT5LiMCLt6Ni3wiom8B0AHDsIhMVcPeFAsxMlpCmSLfiVOCQWVJQg3r
   /2Y92t+ivfasrYomxMaVdkRXH2TNl7Wxo3jfHG2Je9VJDxYz85u2tz89O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="402070058"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="402070058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 05:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="761356893"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="761356893"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2023 05:13:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTi4B-00065q-2s;
	Wed, 09 Aug 2023 12:13:31 +0000
Date: Wed, 9 Aug 2023 20:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Kelley <mikelley@microsoft.com>
Subject: [lantianyu:test 18/29] arch/x86/kernel/cpu/mshyperv.c:543:3: error:
 call to undeclared function 'hv_sev_init_mem_and_cpu'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202308092032.xNConEC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: b1fb0b5fda3b4d47523c15ad6817f5111e3ba898 [18/29] x86/hyperv: Initialize cpu and memory for SEV-SNP enlightened guest
config: x86_64-randconfig-x003-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092032.xNConEC0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092032.xNConEC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092032.xNConEC0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:543:3: error: call to undeclared function 'hv_sev_init_mem_and_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   hv_sev_init_mem_and_cpu();
                   ^
   1 error generated.


vim +/hv_sev_init_mem_and_cpu +543 arch/x86/kernel/cpu/mshyperv.c

   529	
   530		/* Register Hyper-V specific clocksource */
   531		hv_init_clocksource();
   532		hv_vtl_init_platform();
   533	#endif
   534		/*
   535		 * TSC should be marked as unstable only after Hyper-V
   536		 * clocksource has been initialized. This ensures that the
   537		 * stability of the sched_clock is not altered.
   538		 */
   539		if (!(ms_hyperv.features & HV_ACCESS_TSC_INVARIANT))
   540			mark_tsc_unstable("running on Hyper-V");
   541	
   542		if (hv_isolation_type_en_snp())
 > 543			hv_sev_init_mem_and_cpu();
   544	
   545		hardlockup_detector_disable();
   546	}
   547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
