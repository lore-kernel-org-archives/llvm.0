Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9836A;
	Thu, 17 Aug 2023 02:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692239892; x=1723775892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hE+H3wI3CvbxDR/L3xbOorBY+7gADHSnAXr980hWcpo=;
  b=G75mZ9gqPwwpbLzIeY50guW9NfAmA4dQg07jagBKo2HMS1xBFmOANqfT
   NRmzc7pHmVrpEUrd3YfhFgEImadpXYr2J+FWgG1244SYS/3IFUz23xu1g
   T+zpxc53+MkEv4JODdFbR74ssHBtRYaeFPf0dauoqKYUsoztZmxC0zdKQ
   ogi+7Mz5Xj5iJCyY8/zqBc8z1+eNogeSGfPSptP51XLNEqTjv4nKIR5qa
   ZxjX6LS/hi9gKKonRLFW4XRZGyqmX7qswAgFKPuSsQGWOERJ9ij3OyEp/
   TlOcLiMFqovsH3O7LmRBjVC3rjySPfWOrNSjhiR9Xsz1zUCoofBMJhc4K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="439048189"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="439048189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 19:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799852828"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="799852828"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2023 19:38:10 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWStl-0000kB-37;
	Thu, 17 Aug 2023 02:38:09 +0000
Date: Thu, 17 Aug 2023 10:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 147/148]
 arch/x86/include/asm/resctrl.h:149:9: error: incompatible pointer to integer
 conversion returning 'unsigned long long (void)' from a function with result
 type 'u64' (aka 'unsigned long long')
Message-ID: <202308171014.V9egIIfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   3feae02a8f8cf9aca5d7d1915ea1e026c9d3d8ec
commit: d2210e80c29bdd622cb88af630aa4de57a01181c [147/148] fs/resctrl: Add cranky debug for reading CPU msr values
config: x86_64-randconfig-x072-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171014.V9egIIfl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171014.V9egIIfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171014.V9egIIfl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/base.c:97:
   In file included from include/linux/resctrl.h:12:
   arch/x86/include/asm/resctrl.h:149:33: error: too few arguments provided to function-like macro invocation
           return rdmsr(MSR_IA32_PQR_ASSOC);
                                          ^
   arch/x86/include/asm/paravirt.h:210:9: note: macro 'rdmsr' defined here
   #define rdmsr(msr, val1, val2)                  \
           ^
   In file included from fs/proc/base.c:97:
   In file included from include/linux/resctrl.h:12:
   arch/x86/include/asm/resctrl.h:149:9: error: use of undeclared identifier 'rdmsr'; did you mean 'rdtsc'?
           return rdmsr(MSR_IA32_PQR_ASSOC);
                  ^~~~~
                  rdtsc
   arch/x86/include/asm/msr.h:180:43: note: 'rdtsc' declared here
   static __always_inline unsigned long long rdtsc(void)
                                             ^
   In file included from fs/proc/base.c:97:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:149:9: error: incompatible pointer to integer conversion returning 'unsigned long long (void)' from a function with result type 'u64' (aka 'unsigned long long') [-Wint-conversion]
           return rdmsr(MSR_IA32_PQR_ASSOC);
                  ^~~~~
   3 errors generated.
--
   In file included from fs/resctrl/monitor.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
   arch/x86/include/asm/resctrl.h:149:33: error: too few arguments provided to function-like macro invocation
           return rdmsr(MSR_IA32_PQR_ASSOC);
                                          ^
   arch/x86/include/asm/paravirt.h:210:9: note: macro 'rdmsr' defined here
   #define rdmsr(msr, val1, val2)                  \
           ^
   In file included from fs/resctrl/monitor.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
   arch/x86/include/asm/resctrl.h:149:9: error: use of undeclared identifier 'rdmsr'; did you mean 'rdtsc'?
           return rdmsr(MSR_IA32_PQR_ASSOC);
                  ^~~~~
                  rdtsc
   arch/x86/include/asm/msr.h:180:43: note: 'rdtsc' declared here
   static __always_inline unsigned long long rdtsc(void)
                                             ^
   In file included from fs/resctrl/monitor.c:22:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:12:
>> arch/x86/include/asm/resctrl.h:149:9: error: incompatible pointer to integer conversion returning 'unsigned long long (void)' from a function with result type 'u64' (aka 'unsigned long long') [-Wint-conversion]
           return rdmsr(MSR_IA32_PQR_ASSOC);
                  ^~~~~
   fs/resctrl/monitor.c:590:23: warning: variable 'r' set but not used [-Wunused-but-set-variable]
           struct rdt_resource *r;
                                ^
   1 warning and 3 errors generated.


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
