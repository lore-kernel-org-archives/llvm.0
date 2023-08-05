Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FDEBE;
	Sat,  5 Aug 2023 00:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691193842; x=1722729842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBrZBnFT/Vu4kFH6yg+KLry8jUzteCG2jJbidDpJrVc=;
  b=PibvzpU9N8Z6eRsIXzJSPtSl38ac6vAX0QIBX/+h89D59mAxCDhbD6FF
   vVtX4Fykffqrb8zolx1XS5WBP6WRaz/TYNcWPUACJjNpvrHl/jMFUKwC0
   UC+P8kZIZ2cDgZk9eF/OATzbTnfI98xgUFQJILHY81gqiP5M77Fqeaid/
   xERyeHhtL1HNoqvqnVI9vBa0xwqA1BLmS0A1RVO/utdWi+/psclESFPcC
   FQ/9V4HCxgpZHsvXd8ndnxs/ZzNK4iQK55PDEB8LspGPMBOONIUfDGka2
   1Cs3qKfZ331UfU99F/mbXka/PPiWIChMvO8wob4bqbPCcturL/V+GsO71
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360336691"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="360336691"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 17:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765314647"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="765314647"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 17:03:56 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS4lw-0003Cz-2s;
	Sat, 05 Aug 2023 00:03:56 +0000
Date: Sat, 5 Aug 2023 08:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_acpi_b2_v1 66/91]
 arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of
 non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202308050707.uCLdENbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   b09364548457cec51680b8f8b1a5e917b5e74cf5
commit: c25a9f5b7daa98ba6276a4ad01b2f70f86dfb99c [66/91] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230805/202308050707.uCLdENbS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050707.uCLdENbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050707.uCLdENbS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +259 arch/riscv/kvm/vcpu_switch.S

c25a9f5b7daa98 Anup Patel 2022-10-09  230  
c25a9f5b7daa98 Anup Patel 2022-10-09  231  	/*
c25a9f5b7daa98 Anup Patel 2022-10-09  232  	 * Parameters:
c25a9f5b7daa98 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
c25a9f5b7daa98 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
c25a9f5b7daa98 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
c25a9f5b7daa98 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
c25a9f5b7daa98 Anup Patel 2022-10-09  237  	 */
c25a9f5b7daa98 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
c25a9f5b7daa98 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
c25a9f5b7daa98 Anup Patel 2022-10-09  240  
c25a9f5b7daa98 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
c25a9f5b7daa98 Anup Patel 2022-10-09  242  
c25a9f5b7daa98 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
c25a9f5b7daa98 Anup Patel 2022-10-09  244  	add	a6, a2, zero
c25a9f5b7daa98 Anup Patel 2022-10-09  245  	add	a7, a1, zero
c25a9f5b7daa98 Anup Patel 2022-10-09  246  	ecall
c25a9f5b7daa98 Anup Patel 2022-10-09  247  
c25a9f5b7daa98 Anup Patel 2022-10-09  248  	/* Back to Host */
c25a9f5b7daa98 Anup Patel 2022-10-09  249  	.align 2
c25a9f5b7daa98 Anup Patel 2022-10-09  250  __kvm_riscv_nacl_switch_to_return:
c25a9f5b7daa98 Anup Patel 2022-10-09  251  	SAVE_GUEST_GPRS
c25a9f5b7daa98 Anup Patel 2022-10-09  252  
c25a9f5b7daa98 Anup Patel 2022-10-09  253  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
c25a9f5b7daa98 Anup Patel 2022-10-09  254  
c25a9f5b7daa98 Anup Patel 2022-10-09  255  	RESTORE_HOST_GPRS
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
https://github.com/intel/lkp-tests/wiki
