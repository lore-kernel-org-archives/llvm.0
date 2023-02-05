Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804F7B;
	Sun,  5 Feb 2023 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675583543; x=1707119543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LiIlk+BFi4AFpQdxNhuUPTva6ZboiwdTrr0NDzTqb+0=;
  b=ed5Ata++yiYxCs3t4yGTCjl2lNI2OW9ngzANdhnEA7ecxmaPo66gfCTl
   tZ/Korq6G+IrMxGnzXca8K+a0HHHvK6L6FaA3yVpVuOPA0ORUoj/EETAy
   91whGJLtHFvi3GmpXTmurl2C6z34WvAvAtzT3b78CkMH6q+6k2BTKrRVW
   DIQJ76W4ir49SyPmQBF4uD4ZH0pChb6ug7KHTtVc/R/H7U+YxU3D7FfDO
   bZGjzAct4Gfm61U4W3qMeVszRTyWKPyDpMuzn1/mdHZPi/pcGne4xwoDz
   02hFxzA3wuIMjzTw8sFCaBF2oJTT8QWTfXYoZvQxIKok4l0H5vcn/zKMm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308665861"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="308665861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 23:52:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643704550"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643704550"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 23:52:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOZoq-0001qD-23;
	Sun, 05 Feb 2023 07:52:12 +0000
Date: Sun, 5 Feb 2023 15:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 73/76]
 arch/riscv/kvm/vcpu_switch.S:260:81: error: invalid reassignment of
 non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202302051538.MrDEDSEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   27e6109638389f74b42fe02858caa9c7a381cbbe
commit: fc8669baa9be564edf22b657eccef98fe454d843 [73/76] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-randconfig-r042-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051538.MrDEDSEQ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/fc8669baa9be564edf22b657eccef98fe454d843
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout fc8669baa9be564edf22b657eccef98fe454d843
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:260:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +260 arch/riscv/kvm/vcpu_switch.S

fc8669baa9be56 Anup Patel 2022-10-09  230  
fc8669baa9be56 Anup Patel 2022-10-09  231  	/*
fc8669baa9be56 Anup Patel 2022-10-09  232  	 * Parameters:
fc8669baa9be56 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
fc8669baa9be56 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
fc8669baa9be56 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
fc8669baa9be56 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
fc8669baa9be56 Anup Patel 2022-10-09  237  	 */
fc8669baa9be56 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
fc8669baa9be56 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
fc8669baa9be56 Anup Patel 2022-10-09  240  
fc8669baa9be56 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
fc8669baa9be56 Anup Patel 2022-10-09  242  
fc8669baa9be56 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
fc8669baa9be56 Anup Patel 2022-10-09  244  	add	a0, a3, zero
fc8669baa9be56 Anup Patel 2022-10-09  245  	add	a6, a2, zero
fc8669baa9be56 Anup Patel 2022-10-09  246  	add	a7, a1, zero
fc8669baa9be56 Anup Patel 2022-10-09  247  	ecall
fc8669baa9be56 Anup Patel 2022-10-09  248  
fc8669baa9be56 Anup Patel 2022-10-09  249  	/* Back to Host */
fc8669baa9be56 Anup Patel 2022-10-09  250  	.align 2
fc8669baa9be56 Anup Patel 2022-10-09  251  __kvm_riscv_nacl_switch_to_return:
fc8669baa9be56 Anup Patel 2022-10-09  252  	SAVE_GUEST_GPRS
fc8669baa9be56 Anup Patel 2022-10-09  253  
fc8669baa9be56 Anup Patel 2022-10-09  254  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
fc8669baa9be56 Anup Patel 2022-10-09  255  
fc8669baa9be56 Anup Patel 2022-10-09  256  	RESTORE_HOST_GPRS
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
