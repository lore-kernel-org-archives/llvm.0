Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822E268
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 06:19:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="222788084"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="222788084"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2021 22:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="539870840"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Nov 2021 22:19:56 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mra16-000BcT-1x; Mon, 29 Nov 2021 06:19:56 +0000
Date: Mon, 29 Nov 2021 14:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jintack Lim <jintack.lim@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/nv-5.16 6/71]
 arch/arm64/include/asm/kvm_host.h:67:70: error: expected ';' after return
 statement
Message-ID: <202111291407.RzTFYBes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-5.16
head:   d1c6ee383658b3b9a258a7542b634c1f9fc6ccf7
commit: db7c6e1049220a0a330cd5234497a51f438a5814 [6/71] arm64: Add ARM64_HAS_NESTED_VIRT cpufeature
config: arm64-randconfig-r001-20211128 (https://download.01.org/0day-ci/archive/20211129/202111291407.RzTFYBes-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=db7c6e1049220a0a330cd5234497a51f438a5814
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/nv-5.16
        git checkout db7c6e1049220a0a330cd5234497a51f438a5814
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:15:
   In file included from include/linux/kvm_host.h:39:
>> arch/arm64/include/asm/kvm_host.h:67:70: error: expected ';' after return statement
   static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE };
                                                                        ^
                                                                        ;
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1197: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +67 arch/arm64/include/asm/kvm_host.h

    50	
    51	#define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
    52					     KVM_DIRTY_LOG_INITIALLY_SET)
    53	
    54	/*
    55	 * Mode of operation configurable with kvm-arm.mode early param.
    56	 * See Documentation/admin-guide/kernel-parameters.txt for more information.
    57	 */
    58	enum kvm_mode {
    59		KVM_MODE_DEFAULT,
    60		KVM_MODE_PROTECTED,
    61		KVM_MODE_NV,
    62		KVM_MODE_NONE,
    63	};
    64	#ifdef CONFIG_KVM
    65	enum kvm_mode kvm_get_mode(void);
    66	#else
  > 67	static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE };
    68	#endif
    69	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
