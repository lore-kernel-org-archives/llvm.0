Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B27E6;
	Thu,  9 Mar 2023 04:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678336872; x=1709872872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2EuAD5o6+IRIclx+b3yC26ZQYIGjePgka0GdA9tBdk=;
  b=kjCccKvyI5DOjYlCJ5zc3pZIgbKHQDoTqHvg9K28K18njhNwb1wT/iFe
   37r69MniQHaVWjOAp1L4fxA3aQoTgibXUwkd0gV2WL3vrP4NuNnNhQ6EZ
   WHSSaRLqlysAw7KU0U5HWj3UeiOel9MSia6I3kmoCSbpH+Tb4oLZz3jYv
   FPVkXrF91TWqlNsNZSgFiebgU5CYIPGyljMtrwZKcVlNCiRx/DFra8c8x
   77VRRhyIHqlZeBDZeTwAZXxfDVJkcyaU48q5C1AVCSpy2Q21Gmhcaa9yF
   128rkSyXvzTWIwhMq2lUUbAnlHnzZ1sRpjBjBCqGu5Qh6r8ncwNW9tdg8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398929939"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="398929939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 20:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707447898"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="707447898"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 20:41:10 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa85V-0002eM-2m;
	Thu, 09 Mar 2023 04:41:09 +0000
Date: Thu, 9 Mar 2023 12:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:alexghiti_test 62/74] arch/riscv/kvm/vcpu_switch.S:260:81:
 error: invalid reassignment of non-absolute variable
 '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202303091254.BaNqtQJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   a66ce4f614559da376cae340d6012bf9a02e3c08
commit: 7ad279366783173ba3c1b92ded12a86bb34b288a [62/74] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-randconfig-r042-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091254.BaNqtQJM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/avpatel/linux/commit/7ad279366783173ba3c1b92ded12a86bb34b288a
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout 7ad279366783173ba3c1b92ded12a86bb34b288a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091254.BaNqtQJM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:260:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +260 arch/riscv/kvm/vcpu_switch.S

7ad27936678317 Anup Patel 2022-10-09  230  
7ad27936678317 Anup Patel 2022-10-09  231  	/*
7ad27936678317 Anup Patel 2022-10-09  232  	 * Parameters:
7ad27936678317 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
7ad27936678317 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
7ad27936678317 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
7ad27936678317 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
7ad27936678317 Anup Patel 2022-10-09  237  	 */
7ad27936678317 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
7ad27936678317 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
7ad27936678317 Anup Patel 2022-10-09  240  
7ad27936678317 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
7ad27936678317 Anup Patel 2022-10-09  242  
7ad27936678317 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
7ad27936678317 Anup Patel 2022-10-09  244  	add	a0, a3, zero
7ad27936678317 Anup Patel 2022-10-09  245  	add	a6, a2, zero
7ad27936678317 Anup Patel 2022-10-09  246  	add	a7, a1, zero
7ad27936678317 Anup Patel 2022-10-09  247  	ecall
7ad27936678317 Anup Patel 2022-10-09  248  
7ad27936678317 Anup Patel 2022-10-09  249  	/* Back to Host */
7ad27936678317 Anup Patel 2022-10-09  250  	.align 2
7ad27936678317 Anup Patel 2022-10-09  251  __kvm_riscv_nacl_switch_to_return:
7ad27936678317 Anup Patel 2022-10-09  252  	SAVE_GUEST_GPRS
7ad27936678317 Anup Patel 2022-10-09  253  
7ad27936678317 Anup Patel 2022-10-09  254  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
7ad27936678317 Anup Patel 2022-10-09  255  
7ad27936678317 Anup Patel 2022-10-09  256  	RESTORE_HOST_GPRS
34bde9d8b9e6e5 Anup Patel 2021-09-27  257  
34bde9d8b9e6e5 Anup Patel 2021-09-27  258  	/* Return to C code */
34bde9d8b9e6e5 Anup Patel 2021-09-27  259  	ret
34bde9d8b9e6e5 Anup Patel 2021-09-27 @260  ENDPROC(__kvm_riscv_switch_to)
9f7013265112a9 Anup Patel 2021-09-27  261  

:::::: The code at line 260 was first introduced by commit
:::::: 34bde9d8b9e6e5249db3c07cf1ebfe75c23c671c RISC-V: KVM: Implement VCPU world-switch

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
