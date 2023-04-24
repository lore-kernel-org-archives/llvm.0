Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1267470;
	Mon, 24 Apr 2023 23:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682380747; x=1713916747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+V8tR6Gbj8367flSfl9WbzJ1prWrriAg/A+9tdKwmHc=;
  b=JX8F+fcCFr4l8NnBjrv0hfxgzxBm1shYCdjhfxrOA2OXXzE+QRkY6bHd
   ZFjZygDnHu/AoVSRuNiqWVebPBtzONTjkFmWCTM5CsQeP6i1XrkBdnvpS
   fJv4UIXiSl4B9iI8KeZnDVQLvYdz8FOln7nouu5lWAnQu4/LEvB7A00yf
   RNhRTRfpjCGucZhBZIPtl4rrcJys3K528Qyv+sMtrQjLlUR4IGvfz1URv
   lYUi7/2H2sRcqw/dza+0gCzWqHbMISnIolRk6o8uP5yDbhPkRRXvUh0CW
   wOp/Eba7U5OYbpzC6OUjRJ55jHTgMcqaTEvJKur9Lxbp51b8UnMOWKbZu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326207341"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="326207341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 16:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643561793"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="643561793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 16:59:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr65I-000ik6-2Z;
	Mon, 24 Apr 2023 23:59:04 +0000
Date: Tue, 25 Apr 2023 07:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 55/338]
 arch/x86/include/asm/tdx.h:114:49: warning: shift count >= width of type
Message-ID: <202304250732.qEUlvwQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   5217810067c6f32309d1473fc94649608330885c
commit: 627dfa66ca7a1fa5af2927650f2e9d8a28b67a24 [55/338] KVM: TDX: Add C wrapper functions for SEAMCALLs to the TDX module
config: i386-randconfig-a001-20230424 (https://download.01.org/0day-ci/archive/20230425/202304250732.qEUlvwQP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/627dfa66ca7a1fa5af2927650f2e9d8a28b67a24
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 627dfa66ca7a1fa5af2927650f2e9d8a28b67a24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250732.qEUlvwQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
