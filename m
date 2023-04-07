Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96C7EA2;
	Fri,  7 Apr 2023 02:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680834326; x=1712370326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkQlA+e3iZ26ASAMebzAqKFWu8GJ3V2PTYzUC7izelw=;
  b=EPUH/KljI8SGbF5ea0m2FwSln7f0tjm02/IypaUpssfeiN6vc9UGAMpZ
   Rz4XKKQsHV6GKzGFgVMwYYzrLkM1ZN/pOfC8mvjFpktWSy+B4LILhmDwk
   JANUaLN2Xf1ETUgep4g8gFzcoVgMMOG2m03cPWUqP99nvNXb0XAzJbt8y
   /zRkwPPa86FJs+fBiXjD3n92mr9Zd5IZmBa2/+iQRpwgfrcN/0SGv7I2q
   +fPX9pF/Cwf+WCh2Hb8mv45uD/L3sXpmd4gyancgkcsly3t8t63dqL7zH
   H60efwMvcun19mSdNJCbGy8XmfukufE4DlskaWsbl2KgAuRney3V+4n81
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="405724285"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="405724285"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 19:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798559017"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="798559017"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2023 19:25:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkbn1-000S2i-2Y;
	Fri, 07 Apr 2023 02:25:23 +0000
Date: Fri, 7 Apr 2023 10:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 55/335]
 arch/x86/include/asm/tdx.h:114:49: warning: shift count >= width of type
Message-ID: <202304071045.PzgBSvjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   9b1b005c63f21cbc8dc4f1691b05964c90240385
commit: 1a6c8c8864885c1d1ca944cd674c493141a7537f [55/335] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-a004-20230403 (https://download.01.org/0day-ci/archive/20230407/202304071045.PzgBSvjX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/1a6c8c8864885c1d1ca944cd674c493141a7537f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 1a6c8c8864885c1d1ca944cd674c493141a7537f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071045.PzgBSvjX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/common.c:32:
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
   In file included from arch/x86/kernel/asm-offsets.c:22:
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
