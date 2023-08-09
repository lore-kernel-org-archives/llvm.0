Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939224525;
	Wed,  9 Aug 2023 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691610106; x=1723146106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iv0b46AaGPuXg5vR5vW6t3rDHKyIzXxInQpVXWZSiqc=;
  b=k+00sDGzzEGZDQdoouAPvUxU9jtN/2pZrEqnC4dKlIfBH0JDkKw0/Y+i
   OdpFIiwpBS7VdeWLIsazMSR85A81psYc3Zi8dQxHk5/9XTI47aAXKKpVU
   e+apZk32TRe5a/R5XmCTuyG8J5PbwRRtByiU1JKT+SswXT8rXndknd52s
   5se7PqRfksO4IHPlcfoa1WyJykO6xSjwT8SgpESu57piWt3iqz4uxGE1P
   Ebkbi5ic/7Hbt1GUrLAtZobjjZA1WXA1F5Xah6puNyTMFqqudWnLhMK/l
   Ff2d8GwJOh/mj5aHQlaoKQ7wyq3CkvdlquoMT+aPvQmR+sKn9djiQ6vbm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361346434"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="361346434"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 12:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="766972954"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="766972954"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2023 12:41:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTp3t-0006LU-2T;
	Wed, 09 Aug 2023 19:41:41 +0000
Date: Thu, 10 Aug 2023 03:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream 87/190] arch/x86/include/asm/tdx.h:90:77:
 warning: shift count >= width of type
Message-ID: <202308100303.chmc1FIU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   57f9d69e4c57a27ce959757603a99361d8875f80
commit: f9069bd76c0b0c3d6da09b6d6f18f447e1a33605 [87/190] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-r014-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100303.chmc1FIU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100303.chmc1FIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100303.chmc1FIU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:22:
>> arch/x86/include/asm/tdx.h:90:77: warning: shift count >= width of type [-Wshift-count-overflow]
   static inline u64 __seamcall(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
                                                                               ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:25:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   arch/x86/include/asm/tdx.h:91:81: warning: shift count >= width of type [-Wshift-count-overflow]
   static inline u64 __seamcall_ret(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
                                                                                   ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:25:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   arch/x86/include/asm/tdx.h:92:87: warning: shift count >= width of type [-Wshift-count-overflow]
   static inline u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
                                                                                         ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:25:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   3 warnings generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:22:
>> arch/x86/include/asm/tdx.h:90:77: warning: shift count >= width of type [-Wshift-count-overflow]
   static inline u64 __seamcall(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
                                                                               ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:25:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   arch/x86/include/asm/tdx.h:91:81: warning: shift count >= width of type [-Wshift-count-overflow]
   static inline u64 __seamcall_ret(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
                                                                                   ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:25:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   In file included from arch/x86/kernel/asm-offsets.c:22:
   arch/x86/include/asm/tdx.h:92:87: warning: shift count >= width of type [-Wshift-count-overflow]
   static inline u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
                                                                                         ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:25:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:21:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:20:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   3 warnings generated.


vim +90 arch/x86/include/asm/tdx.h

    79	
    80	#ifdef CONFIG_INTEL_TDX_HOST
    81	u64 __seamcall(u64 fn, struct tdx_module_args *args);
    82	u64 __seamcall_ret(u64 fn, struct tdx_module_args *args);
    83	u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
    84	bool platform_tdx_enabled(void);
    85	int tdx_cpu_enable(void);
    86	int tdx_enable(void);
    87	void tdx_reset_memory(void);
    88	bool tdx_is_private_mem(unsigned long phys);
    89	#else
  > 90	static inline u64 __seamcall(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
    91	static inline u64 __seamcall_ret(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
    92	static inline u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args) { return TDX_SEAMCALL_UD; }
    93	static inline bool platform_tdx_enabled(void) { return false; }
    94	static inline int tdx_cpu_enable(void) { return -ENODEV; }
    95	static inline int tdx_enable(void)  { return -ENODEV; }
    96	static inline void tdx_reset_memory(void) { }
    97	static inline bool tdx_is_private_mem(unsigned long phys) { return false; }
    98	#endif	/* CONFIG_INTEL_TDX_HOST */
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
