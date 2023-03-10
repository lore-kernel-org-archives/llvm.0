Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD296ADB;
	Fri, 10 Mar 2023 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678453118; x=1709989118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MaBqVEaZcE32Jvoqf7DhB8Nxha1L58hQtwPzl972mow=;
  b=CIxNtV0b8jEvbTKxXCDDSaCnLYQRAOYLXsSkY4qAX1S6Xt3UKmjOfHkP
   WaiSYtKqpV4ySiOuOns9UvYQx44dCnxbYCuy0Ivp+39Vy+bJ6XteavNjP
   cpwu9crzfmnwuZNz8vxYhUs3Ery5/kG6WdNG1KV78KhoS9FMsv6PsgfSd
   xXkmgXX0SJhvfzsj+/S9itKksqlZ3cN6AW/uQEFEisTGcNL9daM9KPSmc
   frXi390wbFo+g3v5L9RnHOiG6A4h33P49RQL+50cP/N3ZWfbsWjmJ6oVT
   sOHiAGfPeagp9cN8rR3xlSWwJvbSyNcvqqp35xnneNed/p7wdzQ8A1rXA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="317110870"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="317110870"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 04:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="707996774"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="707996774"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Mar 2023 04:58:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pacKB-0003s3-02;
	Fri, 10 Mar 2023 12:58:19 +0000
Date: Fri, 10 Mar 2023 20:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 172/432]
 arch/x86/include/asm/tdx.h:114:49: warning: shift count >= width of type
Message-ID: <202303102004.RkRh1ndu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   b4a08c4cd3ed29e3977509b24adc2c59e39825c1
commit: e83792bfbe07a14fa2c616e2aad763434062b3c0 [172/432] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230310/202303102004.RkRh1ndu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/e83792bfbe07a14fa2c616e2aad763434062b3c0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout e83792bfbe07a14fa2c616e2aad763434062b3c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102004.RkRh1ndu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:21:
>> arch/x86/include/asm/tdx.h:114:49: warning: shift count >= width of type [-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:24:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:20:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:19:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   1 warning generated.
--
   In file included from arch/x86/platform/pvh/enlighten.c:7:
   In file included from arch/x86/include/asm/hypervisor.h:37:
   In file included from arch/x86/include/asm/kvm_para.h:10:
>> arch/x86/include/asm/tdx.h:114:49: warning: shift count >= width of type [-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:24:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:20:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:19:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   arch/x86/platform/pvh/enlighten.c:120:13: warning: no previous prototype for function 'xen_prepare_pvh' [-Wmissing-prototypes]
   void __init xen_prepare_pvh(void)
               ^
   arch/x86/platform/pvh/enlighten.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init xen_prepare_pvh(void)
   ^
   static 
   2 warnings generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:21:
>> arch/x86/include/asm/tdx.h:114:49: warning: shift count >= width of type [-Wshift-count-overflow]
                                struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:24:28: note: expanded from macro 'TDX_SEAMCALL_UD'
   #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
                                            ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:20:25: note: expanded from macro 'TDX_SW_ERROR'
   #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
                                            ^~~~~~~~~
   arch/x86/include/asm/tdx.h:19:21: note: expanded from macro 'TDX_ERROR'
   #define TDX_ERROR                       _BITUL(63)
                                           ^~~~~~~~~~
   include/uapi/linux/const.h:28:27: note: expanded from macro '_BITUL'
   #define _BITUL(x)       (_UL(1) << (x))
                                   ^  ~~~
   1 warning generated.


vim +114 arch/x86/include/asm/tdx.h

   102	
   103	#ifdef CONFIG_INTEL_TDX_HOST
   104	bool platform_tdx_enabled(void);
   105	int tdx_cpu_enable(void);
   106	int tdx_enable(void);
   107	u64 __seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
   108		       struct tdx_module_output *out);
   109	#else	/* !CONFIG_INTEL_TDX_HOST */
   110	static inline bool platform_tdx_enabled(void) { return false; }
   111	static inline int tdx_cpu_enable(void) { return -EINVAL; }
   112	static inline int tdx_enable(void)  { return -EINVAL; }
   113	static inline u64 __seamcall(u64 op, u64 rcx, u64 rdx, u64 r8, u64 r9,
 > 114				     struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
   115	#endif	/* CONFIG_INTEL_TDX_HOST */
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
