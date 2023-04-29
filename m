Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01B136A;
	Sat, 29 Apr 2023 02:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682735933; x=1714271933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dp3X/yASmQiiD959DkbT8iui/72T5wLzIHBrlFwIWt8=;
  b=BbflXDjj/S3B8q36nIAGN94ZHAVo5lGCMNHptcVRo+xQWaoDGJzGjqDe
   cEdD+ikpxf5Rg/Cb8nx9RPwDdTyHdQqTrwb4tgKO2Ri/zjUZytnUbitt3
   6G+heWp+2ZKU0/rm5kuIgGzuzbdeC3eiDfKBGxytQdBb+M4KZIU+4VrgJ
   ZNvxN8rfkFMaeVrQgygVJDLPgxQhW768WH6HzHD5qCl7Pme9eZOnbY+WR
   DLqoAT081NujVS8+z/NryFKp/hUT3VxeRmkI4ZFAdeArbePeDcXxkfmmZ
   BnOjeuic+m3hr+6MYeY909mVoRkZG1Fkytnvni4TABy2tjFTVirDIOoLe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="345353385"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="345353385"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 19:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="806639169"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="806639169"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2023 19:38:51 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psaU7-0000qJ-01;
	Sat, 29 Apr 2023 02:38:51 +0000
Date: Sat, 29 Apr 2023 10:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 70/73]
 arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of
 non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202304291023.8amhE0cz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   00757ea0bfa14ae06d3f42144633ba253d6d5f5e
commit: 98d148d301f859d6cd0d15148dd7b4a9e82afe16 [70/73] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-randconfig-r034-20230428 (https://download.01.org/0day-ci/archive/20230429/202304291023.8amhE0cz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/98d148d301f859d6cd0d15148dd7b4a9e82afe16
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout 98d148d301f859d6cd0d15148dd7b4a9e82afe16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291023.8amhE0cz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +259 arch/riscv/kvm/vcpu_switch.S

98d148d301f859 Anup Patel 2022-10-09  230  
98d148d301f859 Anup Patel 2022-10-09  231  	/*
98d148d301f859 Anup Patel 2022-10-09  232  	 * Parameters:
98d148d301f859 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
98d148d301f859 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
98d148d301f859 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
98d148d301f859 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
98d148d301f859 Anup Patel 2022-10-09  237  	 */
98d148d301f859 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
98d148d301f859 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
98d148d301f859 Anup Patel 2022-10-09  240  
98d148d301f859 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
98d148d301f859 Anup Patel 2022-10-09  242  
98d148d301f859 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
98d148d301f859 Anup Patel 2022-10-09  244  	add	a6, a2, zero
98d148d301f859 Anup Patel 2022-10-09  245  	add	a7, a1, zero
98d148d301f859 Anup Patel 2022-10-09  246  	ecall
98d148d301f859 Anup Patel 2022-10-09  247  
98d148d301f859 Anup Patel 2022-10-09  248  	/* Back to Host */
98d148d301f859 Anup Patel 2022-10-09  249  	.align 2
98d148d301f859 Anup Patel 2022-10-09  250  __kvm_riscv_nacl_switch_to_return:
98d148d301f859 Anup Patel 2022-10-09  251  	SAVE_GUEST_GPRS
98d148d301f859 Anup Patel 2022-10-09  252  
98d148d301f859 Anup Patel 2022-10-09  253  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
98d148d301f859 Anup Patel 2022-10-09  254  
98d148d301f859 Anup Patel 2022-10-09  255  	RESTORE_HOST_GPRS
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
