Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D981525A;
	Tue, 12 Sep 2023 02:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694484250; x=1726020250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gnvaJhS/szXjfyj03I//T7X5PLPTyBa3JsyBo44FCtw=;
  b=H1SzikEkUy6wQoSCSepyDESib4+eYdhbNv6r4s7MeceRZwq+hZiJBMYr
   blLEaq2HFmCU3PSXSrs7uNclpyJ3MZ6WK/19wI4G0WkiIrsRAnjYWlKo5
   hH5wLo178b1rCmjoSvYIOJUwOiJB/rjVPFbwhx9SnxOTv3MNPVHIDDKfL
   8ZLzyin90/U0mV6LWzfg5k9EjpDQ5CpZkAQs6iTVcAKxsT5mygX9wxoMH
   0trd29YCM4bosy44qiMmhWBcd9vnWu+PjTnu1UcJjPNhN0wDflZyk4D82
   nddeN/NLfcbWUFaoKGFeD5btOHw6lmKphLgpQLnOAGiwzlcgqY+yjibB5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363289089"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363289089"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 19:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813616653"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="813616653"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2023 19:04:08 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfsl4-00077q-0f;
	Tue, 12 Sep 2023 02:04:06 +0000
Date: Tue, 12 Sep 2023 10:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 261/321]
 arch/x86/include/asm/tdx.h:183:55: error: expected ';' after return
 statement
Message-ID: <202309120939.Ij3sZeTD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f6388449e0300e7413c7e2ea4875923875ddb340
commit: 3ff8b28b76c71d5e87fd02971c2c48e70fee10d9 [261/321] [REVERTME] debugfs to operation on TDX debug op
config: x86_64-randconfig-r033-20230912 (https://download.01.org/0day-ci/archive/20230912/202309120939.Ij3sZeTD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120939.Ij3sZeTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120939.Ij3sZeTD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:22:
>> arch/x86/include/asm/tdx.h:183:55: error: expected ';' after return statement
   static inline bool tdx_is_enabled(void) { return false };
                                                         ^
                                                         ;
   1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2000764028
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=2000764028
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2000764028
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2000764028
   make: Target 'prepare' not remade because of errors.


vim +183 arch/x86/include/asm/tdx.h

   172	
   173	struct tdsysinfo_struct;
   174	static inline const struct tdsysinfo_struct *tdx_get_sysinfo(void) { return NULL; }
   175	static inline bool platform_tdx_enabled(void) { return false; }
   176	static inline int tdx_cpu_enable(void) { return -ENODEV; }
   177	static inline int tdx_enable(void)  { return -ENODEV; }
   178	static inline void tdx_reset_memory(void) { }
   179	static inline bool tdx_is_private_mem(unsigned long phys) { return false; }
   180	static inline u32 tdx_get_nr_guest_keyids(void) { return 0; }
   181	static inline int tdx_guest_keyid_alloc(void) { return -EOPNOTSUPP; }
   182	static inline void tdx_guest_keyid_free(int keyid) { }
 > 183	static inline bool tdx_is_enabled(void) { return false };
   184	#endif	/* CONFIG_INTEL_TDX_HOST */
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
