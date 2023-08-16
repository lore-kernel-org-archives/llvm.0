Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D0174E6;
	Wed, 16 Aug 2023 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692209988; x=1723745988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2T6ATHwyWrjP03n4isbRUr7Ui/kd3IbMNq2Z33r2Bs=;
  b=DzidFxzWirCnGzLon5oOXfKGQ7gKQWRm/Kznof5FZSNI4rEkgZR1w6kB
   5mottPlSxdNj36aPPm4hTNBDnsa5RLApbZncKvwFXzWTCF/mQiMYN6U0C
   rzlQO/hTtDuUXj4uUztArgQ1Yeqdzwnoc1xP912RZDv/J42YfAUF3D0im
   /Ge9DXFhFGpeJT1KrZLyrMqWOsvx3WOVWZBd17qSi7aiD25husYUJerzt
   Lzb2kTQozqJoW00ccHRmhJEoIQ01fZy9ZBxjwQW1LtN/2XAXGqU91RMKN
   5IU3wzgSEE449t+l9WRS79BfIRpKTsAnK4KkBgGFWNNzvLhzxGbrPGAmP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372609094"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="372609094"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 11:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684159531"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="684159531"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2023 11:19:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWL7R-0000UZ-06;
	Wed, 16 Aug 2023 18:19:45 +0000
Date: Thu, 17 Aug 2023 02:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 147/147]
 arch/x86/include/asm/resctrl.h:149:33: error: too few arguments provided to
 function-like macro invocation
Message-ID: <202308170202.mcakx6cf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   d2210e80c29bdd622cb88af630aa4de57a01181c
commit: d2210e80c29bdd622cb88af630aa4de57a01181c [147/147] fs/resctrl: Add cranky debug for reading CPU msr values
config: i386-buildonly-randconfig-r004-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170202.mcakx6cf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170202.mcakx6cf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170202.mcakx6cf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/resctrl/ctrlmondata.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:149:33: error: too few arguments provided to function-like macro invocation
           return rdmsr(MSR_IA32_PQR_ASSOC);
                                          ^
   arch/x86/include/asm/msr.h:245:9: note: macro 'rdmsr' defined here
   #define rdmsr(msr, low, high)                                   \
           ^
   In file included from fs/resctrl/ctrlmondata.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:149:9: error: use of undeclared identifier 'rdmsr'
           return rdmsr(MSR_IA32_PQR_ASSOC);
                  ^
   2 errors generated.
--
   In file included from fs/resctrl/monitor.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:149:33: error: too few arguments provided to function-like macro invocation
           return rdmsr(MSR_IA32_PQR_ASSOC);
                                          ^
   arch/x86/include/asm/msr.h:245:9: note: macro 'rdmsr' defined here
   #define rdmsr(msr, low, high)                                   \
           ^
   In file included from fs/resctrl/monitor.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:149:9: error: use of undeclared identifier 'rdmsr'
           return rdmsr(MSR_IA32_PQR_ASSOC);
                  ^
   fs/resctrl/monitor.c:590:23: warning: variable 'r' set but not used [-Wunused-but-set-variable]
           struct rdt_resource *r;
                                ^
   1 warning and 2 errors generated.


vim +149 arch/x86/include/asm/resctrl.h

   146	
   147	static inline u64 resctrl_arch_get_cpu_msr(void)
   148	{
 > 149		return rdmsr(MSR_IA32_PQR_ASSOC);
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
