Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF21FBF;
	Mon, 20 Mar 2023 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679329131; x=1710865131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dP+T0t+QcIypHsQgoQHwc7ZpcZXtcaf2PYrjdj9HN+Y=;
  b=EeLlwkVKwgo/NiQ/IPIwxYtjJ/V5SS5Z3uVSWN7tINPjYUcjzoWMktDg
   9pts3lUvlCQRhVRW2iv41xil/rMVqnymUS7qimhv2aF2u282GkQm1RGmo
   C09YfdrDuYtdytUt1Up0nCcV+qFSRcg0sjemKF8PgCmB/Dakhmi3Hiinf
   hEepDCknQ6GwG6/89ZFEFJdeMyRqbt46nBtocqwLifLaHZG3La/SogjOE
   cr6qCMeSXf9+zjS8gGuJ1UUFfZAbk/RnGpgGxaJfD2P0nik0ijwSAT47X
   ix5+9Mkc19CZeLZkIMa7+a3L7gkE7r/wxRz7eWCYAbncUG4jRDh8Nv6rG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366427726"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="366427726"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 09:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713634096"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="713634096"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Mar 2023 09:18:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peIDf-000B8g-2w;
	Mon, 20 Mar 2023 16:18:47 +0000
Date: Tue, 21 Mar 2023 00:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-fgt 3/3]
 arch/arm64/kvm/hyp/include/hyp/switch.h:102:26: warning: variable
 'host_ctxt' set but not used
Message-ID: <202303210031.APdFYAx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-fgt
head:   5cd718c2e5c52de666e2937dc655db3766bbc3b7
commit: 5cd718c2e5c52de666e2937dc655db3766bbc3b7 [3/3] KVM: arm64: Move FGT value configuration to vCPU state
config: arm64-buildonly-randconfig-r005-20230320 (https://download.01.org/0day-ci/archive/20230321/202303210031.APdFYAx5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=5cd718c2e5c52de666e2937dc655db3766bbc3b7
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci kvm-arm64-fgt
        git checkout 5cd718c2e5c52de666e2937dc655db3766bbc3b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/hyp/vhe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210031.APdFYAx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:102:26: warning: variable 'host_ctxt' set but not used [-Wunused-but-set-variable]
           struct kvm_cpu_context *host_ctxt;
                                   ^
   arch/arm64/kvm/hyp/vhe/switch.c:107:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
                                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:108:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:109:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:110:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:111:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:112:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:113:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
                                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:106:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:256:17: warning: no previous prototype for function 'hyp_panic' [-Wmissing-prototypes]
   void __noreturn hyp_panic(void)
                   ^
   arch/arm64/kvm/hyp/vhe/switch.c:256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __noreturn hyp_panic(void)
   ^
   static 
   arch/arm64/kvm/hyp/vhe/switch.c:266:17: warning: no previous prototype for function 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
   asmlinkage void kvm_unexpected_el2_exception(void)
                   ^
   arch/arm64/kvm/hyp/vhe/switch.c:266:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void kvm_unexpected_el2_exception(void)
              ^
              static 
   10 warnings generated.


vim +/host_ctxt +102 arch/arm64/kvm/hyp/include/hyp/switch.h

    99	
   100	static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
   101	{
 > 102		struct kvm_cpu_context *host_ctxt;
   103	
   104		write_sysreg(vcpu->arch.mdcr_el2_host, mdcr_el2);
   105	
   106		write_sysreg(0, hstr_el2);
   107		if (kvm_arm_support_pmu_v3())
   108			write_sysreg(0, pmuserenr_el0);
   109	
   110		/* Restore the host FGT configuration here,  */
   111		if (cpus_have_final_cap(ARM64_HAS_FGT)) {
   112			host_ctxt = &this_cpu_ptr(&kvm_host_data)->host_ctxt;
   113	
   114			write_sysreg_s(__vcpu_sys_reg(vcpu, HFGRTR_EL2),
   115				       SYS_HFGRTR_EL2);
   116			write_sysreg_s(__vcpu_sys_reg(vcpu, HFGWTR_EL2),
   117				       SYS_HFGWTR_EL2);
   118		}
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
