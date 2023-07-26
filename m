Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B803E7C;
	Wed, 26 Jul 2023 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690337449; x=1721873449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYyiHYx4CXBouauJ57GHmuYj82f0kVX/1p4BA5r6Y9Y=;
  b=fTbJPlSYOGkOiXxy6kscXxkg4GPkFLBoYadjDK6XeaJxaxL+5T1hj34u
   PDpAGxeAGNPG3XDh4qMpUpWrvpxWZqeOzAhuqpMWutIN7aqLAMRHFk13m
   WtDch2MczbItZkls/SaDAexGsKeHlsAD50Xj51awngOMQsbao/IldR++2
   tV7oTz+cLbdKPJjE854zaVwH9p8yembSVxOIy44TwCAMI9YgwQYPdyQtQ
   j5xHttkXn2nm+rmxZ5nnq2Ivcb0jbVJaA+x36vJWKT3KbB2mB4i6Gud4A
   2/YwBuz+6Cn9FU8QNPbGLOwJrZErDrmcoD0XCkgfJUUuPZL0Dv8NfSPI6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370567123"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370567123"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 19:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850256973"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="850256973"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Jul 2023 19:10:47 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOTzC-0000Y7-2e;
	Wed, 26 Jul 2023 02:10:46 +0000
Date: Wed, 26 Jul 2023 10:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 76/343]
 arch/x86/include/asm/tdx.h:102:49: warning: shift count >= width of type
Message-ID: <202307261053.vBRQCxbk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   76c1c9e7f4012a2878b2fdf292245aa685c34b2d
commit: 2d81a22fc1d641b3f66aec13e5d1ee13ad266857 [76/343] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-r032-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261053.vBRQCxbk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261053.vBRQCxbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261053.vBRQCxbk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:22:
>> arch/x86/include/asm/tdx.h:102:49: warning: shift count >= width of type [-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:26:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:22:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:21:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   1 warning generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:22:
>> arch/x86/include/asm/tdx.h:102:49: warning: shift count >= width of type [-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:26:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:22:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:21:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   1 warning generated.


vim +102 arch/x86/include/asm/tdx.h

    86	
    87	#ifdef CONFIG_INTEL_TDX_HOST
    88	bool platform_tdx_enabled(void);
    89	int tdx_cpu_enable(void);
    90	int tdx_enable(void);
    91	void tdx_reset_memory(void);
    92	bool tdx_is_private_mem(unsigned long phys);
    93	u64 __seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
    94		       struct tdx_module_output *out);
    95	#else	/* !CONFIG_INTEL_TDX_HOST */
    96	static inline bool platform_tdx_enabled(void) { return false; }
    97	static inline int tdx_cpu_enable(void) { return -ENODEV; }
    98	static inline int tdx_enable(void)  { return -ENODEV; }
    99	static inline void tdx_reset_memory(void) { }
   100	static inline bool tdx_is_private_mem(unsigned long phys) { return false; }
   101	static inline u64 __seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
 > 102				     struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
   103	#endif	/* CONFIG_INTEL_TDX_HOST */
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
