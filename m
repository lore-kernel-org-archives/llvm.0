Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECAE20B41;
	Wed, 10 May 2023 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683712406; x=1715248406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N61PN5BxjYQhTwm8CofFwhWiPElebpinbQlKFIgu+eA=;
  b=gQKV+vub/XMDyArzAmSIaw7Q6gPB0ElvCN9S/zony6TyVEJ8pD3P3it4
   Qu/kGMzkddqtL7OuhuZW0mT6fMkCs06d0pk57YGmmIzFg8pDiitzPPKzH
   iEweh62RIaXpmZEyt5pAaaX1pp4Hk9Ut37x8kh2rzA7/XWY7oyh0yd4GI
   MGrnz91x1ENbmJsJTuKaZuCTF5RWz/MI/57suujFDeER12ftmVZBdBx9D
   TN2UDMSjqpiIJtAjhxVQHFaQay4S0I2BQldWbOgf2Rvhy20eW2Ba3LLBq
   A8lPJwfFs5hLpPk19DAL8YeuNakEWSPP88uy+zU7DwWryu8s8c9TlBLSv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353244939"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="353244939"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="811073399"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="811073399"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 02:53:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwgVg-00037Q-0Z;
	Wed, 10 May 2023 09:53:24 +0000
Date: Wed, 10 May 2023 17:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 31/34]
 arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of
 non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202305101726.pbYUJOlm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   45022f814ebdecd0254e892212bb91fd50d90689
commit: bbde11eab22a977d6bac34f90f8ee5b6d55c66e3 [31/34] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-buildonly-randconfig-r004-20230509 (https://download.01.org/0day-ci/archive/20230510/202305101726.pbYUJOlm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/bbde11eab22a977d6bac34f90f8ee5b6d55c66e3
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout bbde11eab22a977d6bac34f90f8ee5b6d55c66e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101726.pbYUJOlm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +259 arch/riscv/kvm/vcpu_switch.S

bbde11eab22a97 Anup Patel 2022-10-09  230  
bbde11eab22a97 Anup Patel 2022-10-09  231  	/*
bbde11eab22a97 Anup Patel 2022-10-09  232  	 * Parameters:
bbde11eab22a97 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
bbde11eab22a97 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
bbde11eab22a97 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
bbde11eab22a97 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
bbde11eab22a97 Anup Patel 2022-10-09  237  	 */
bbde11eab22a97 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
bbde11eab22a97 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
bbde11eab22a97 Anup Patel 2022-10-09  240  
bbde11eab22a97 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
bbde11eab22a97 Anup Patel 2022-10-09  242  
bbde11eab22a97 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
bbde11eab22a97 Anup Patel 2022-10-09  244  	add	a6, a2, zero
bbde11eab22a97 Anup Patel 2022-10-09  245  	add	a7, a1, zero
bbde11eab22a97 Anup Patel 2022-10-09  246  	ecall
bbde11eab22a97 Anup Patel 2022-10-09  247  
bbde11eab22a97 Anup Patel 2022-10-09  248  	/* Back to Host */
bbde11eab22a97 Anup Patel 2022-10-09  249  	.align 2
bbde11eab22a97 Anup Patel 2022-10-09  250  __kvm_riscv_nacl_switch_to_return:
bbde11eab22a97 Anup Patel 2022-10-09  251  	SAVE_GUEST_GPRS
bbde11eab22a97 Anup Patel 2022-10-09  252  
bbde11eab22a97 Anup Patel 2022-10-09  253  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
bbde11eab22a97 Anup Patel 2022-10-09  254  
bbde11eab22a97 Anup Patel 2022-10-09  255  	RESTORE_HOST_GPRS
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
