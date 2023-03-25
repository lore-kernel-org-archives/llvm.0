Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055E7F;
	Sat, 25 Mar 2023 00:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679702861; x=1711238861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/13J3lB2S2Q4AC4ZIGremQsZSDCxlLufJIgQHzCHUI=;
  b=Kik4Sj7wTSErSTHU96iLbaOOEiHwc/eKBgGcFftAtX3Lp9jpKATAFvxM
   5qWAhCPYW8LdbkXUPvVl5UH41INeGxpUSY8FWc5/EzGqnv3MLmHZyyc9P
   XXvGB7EFDO0AwvwSesUZRmozwt5QDLIuTegP16Ljh3xeb6P7BAgy6athL
   AlwbdP5wxvch2vElR+Ow2dbKOUe+ttWzXEJAaojUwmmnPYWjRlKFiG/Jo
   xLijSC4LxbeMM5y1fFOzMWcRPAsAukaPnNdknDB2rILOc402ll02Z6g31
   C16sXqg21aM30iKZseJFsqR0qYc1gEuD+SNNUgEALgGOPR1EODunlSr9w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323797706"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="323797706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 17:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="857055306"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="857055306"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Mar 2023 17:07:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfrRa-000Fmj-2i;
	Sat, 25 Mar 2023 00:07:38 +0000
Date: Sat, 25 Mar 2023 08:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:alexghiti_test 64/78] arch/riscv/kvm/vcpu_switch.S:259:81:
 error: invalid reassignment of non-absolute variable
 '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202303250750.d3blhI0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: 5e80bb15471e7230112a34e008a593f2ddac38cd [64/78] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230325/202303250750.d3blhI0S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/avpatel/linux/commit/5e80bb15471e7230112a34e008a593f2ddac38cd
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout 5e80bb15471e7230112a34e008a593f2ddac38cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250750.d3blhI0S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +259 arch/riscv/kvm/vcpu_switch.S

5e80bb15471e72 Anup Patel 2022-10-09  230  
5e80bb15471e72 Anup Patel 2022-10-09  231  	/*
5e80bb15471e72 Anup Patel 2022-10-09  232  	 * Parameters:
5e80bb15471e72 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
5e80bb15471e72 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
5e80bb15471e72 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
5e80bb15471e72 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
5e80bb15471e72 Anup Patel 2022-10-09  237  	 */
5e80bb15471e72 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
5e80bb15471e72 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
5e80bb15471e72 Anup Patel 2022-10-09  240  
5e80bb15471e72 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
5e80bb15471e72 Anup Patel 2022-10-09  242  
5e80bb15471e72 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
5e80bb15471e72 Anup Patel 2022-10-09  244  	add	a6, a2, zero
5e80bb15471e72 Anup Patel 2022-10-09  245  	add	a7, a1, zero
5e80bb15471e72 Anup Patel 2022-10-09  246  	ecall
5e80bb15471e72 Anup Patel 2022-10-09  247  
5e80bb15471e72 Anup Patel 2022-10-09  248  	/* Back to Host */
5e80bb15471e72 Anup Patel 2022-10-09  249  	.align 2
5e80bb15471e72 Anup Patel 2022-10-09  250  __kvm_riscv_nacl_switch_to_return:
5e80bb15471e72 Anup Patel 2022-10-09  251  	SAVE_GUEST_GPRS
5e80bb15471e72 Anup Patel 2022-10-09  252  
5e80bb15471e72 Anup Patel 2022-10-09  253  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
5e80bb15471e72 Anup Patel 2022-10-09  254  
5e80bb15471e72 Anup Patel 2022-10-09  255  	RESTORE_HOST_GPRS
34bde9d8b9e6e5 Anup Patel 2021-09-27  256  
34bde9d8b9e6e5 Anup Patel 2021-09-27  257  	/* Return to C code */
34bde9d8b9e6e5 Anup Patel 2021-09-27  258  	ret
34bde9d8b9e6e5 Anup Patel 2021-09-27 @259  ENDPROC(__kvm_riscv_switch_to)
9f7013265112a9 Anup Patel 2021-09-27  260  

:::::: The code at line 259 was first introduced by commit
:::::: 34bde9d8b9e6e5249db3c07cf1ebfe75c23c671c RISC-V: KVM: Implement VCPU world-switch

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
