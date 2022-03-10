Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE75CA9
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 22:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646950988; x=1678486988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fF+3qyUbUukq0jg8sTNO94/16OGrvG79CjMrQVctGRM=;
  b=Q/TCAC4aYNyCnLLZ8jQMTjWgbmxzEkEjTiGPVC37NaBugId/aUhYYvvo
   lsHjdVjk5RebNku7Wv1anTqCjJ5Q0n4IEj33ju45vXxNsKzlyymFvpBAS
   vOx92x3V8CIppXzZ/+rBEMl7No9zsKpK7r1jJbDqfQsKS9ZbTL/nyhxwT
   mwhrG8cZeILw6haRpxRYRRNI3CxVd7gHg021XiHm4ruhtywGAHa/U/HKp
   Sk0HLuUYJwfuRwQhF7bKncgXDmp/ktQN/VCjyQ2aq/nd/ugp0sczvNJ6C
   7I2WoxE80wNOCdrEFlKL47pUoESktspF28i/lmXKr+FVn+i+Z/VAzPBdV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="237568371"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="237568371"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 14:23:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="633160066"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2022 14:23:04 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSRBY-0005Ta-5G; Thu, 10 Mar 2022 22:23:04 +0000
Date: Fri, 11 Mar 2022 06:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Scull <ascull@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: arch/arm64/kvm/handle_exit.c:295:24: warning: no previous prototype
 for function 'nvhe_hyp_panic_handler'
Message-ID: <202203110617.SylT3htc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1db333d9a51f3459fba1bcaa564d95befe79f0b3
commit: aec0fae62e47050019474936248a311a0ab08705 KVM: arm64: Log source when panicking from nVHE hyp
date:   11 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220311/202203110617.SylT3htc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aec0fae62e47050019474936248a311a0ab08705
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout aec0fae62e47050019474936248a311a0ab08705
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ arch/arm64/kvm/ drivers/gpu/drm/tegra/ drivers/usb/host/ kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:182:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_CP14_64]    = kvm_handle_cp14_64,
                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:183:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_HVC32]      = handle_hvc,
                                     ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:184:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SMC32]      = handle_smc,
                                     ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:185:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_HVC64]      = handle_hvc,
                                     ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:186:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SMC64]      = handle_smc,
                                     ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:187:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SYS64]      = kvm_handle_sys_reg,
                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:188:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SVE]        = handle_sve,
                                     ^~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:189:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_IABT_LOW]   = kvm_handle_guest_abort,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:190:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_DABT_LOW]   = kvm_handle_guest_abort,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:191:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SOFTSTP_LOW]= kvm_handle_guest_debug,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:192:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_WATCHPT_LOW]= kvm_handle_guest_debug,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:193:28: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_BREAKPT_LOW]= kvm_handle_guest_debug,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:194:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_BKPT32]     = kvm_handle_guest_debug,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:195:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_BRK64]      = kvm_handle_guest_debug,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:196:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_FP_ASIMD]   = handle_no_fpsimd,
                                     ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:197:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_PAC]        = kvm_handle_ptrauth,
                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/handle_exit.c:176:27: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]  = kvm_handle_unknown_ec,
                                     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/handle_exit.c:295:24: warning: no previous prototype for function 'nvhe_hyp_panic_handler' [-Wmissing-prototypes]
   void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr,
                          ^
   arch/arm64/kvm/handle_exit.c:295:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr,
   ^
   static 
   22 warnings generated.


vim +/nvhe_hyp_panic_handler +295 arch/arm64/kvm/handle_exit.c

   294	
 > 295	void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
