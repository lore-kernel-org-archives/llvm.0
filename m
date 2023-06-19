Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC840D53B;
	Mon, 19 Jun 2023 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687202702; x=1718738702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UmBVVXws7XSi5y6uIPL1xzRx9jizMH4x+HpP8Vlf0Es=;
  b=FhykgzFVHPEypDejeW/26UPpKTl0Iyl1svJZkxtBYly/bXmk+OeFKfmO
   Va2vBRAAuwVdnuOo1A7b+vbY6kCPuSTARLPzJ77EWRw66Cqlt9LylAEx3
   Lnf2eN/q7KfZstZKlR/neU1j4QvxgeinvnLTe97UJnBuzi7elrndO3QYn
   uL6kDXCYX+lbxs+pYBG3PPHRtuDaMsNU4zV4dBbjxJHG9z2Wax3RNNTmh
   iWUPQmAtU2RmOiG8A7Ymyv9DAaoPG0oPua/y5qc+8kE+00YSiDh+GEq65
   DBVzJdzjmf/HWRlm7IEK1Wmmbx2tYGb+4mkjIIZ8AfWilpNJFvaMbeuvq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="358569125"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="358569125"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 12:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="826695987"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="826695987"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2023 12:25:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBKUl-000532-18;
	Mon, 19 Jun 2023 19:24:59 +0000
Date: Tue, 20 Jun 2023 03:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 63/66]
 arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of
 non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202306200331.SdJklZsY-lkp@intel.com>
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

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   17e78fd26653b6f72ec02338b94d24ba7878daa2
commit: c81349231fd9c65ca7cd6c8b9a01eba6c1f84dda [63/66] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-randconfig-r042-20230619 (https://download.01.org/0day-ci/archive/20230620/202306200331.SdJklZsY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200331.SdJklZsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200331.SdJklZsY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:259:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +259 arch/riscv/kvm/vcpu_switch.S

c81349231fd9c6 Anup Patel 2022-10-09  230  
c81349231fd9c6 Anup Patel 2022-10-09  231  	/*
c81349231fd9c6 Anup Patel 2022-10-09  232  	 * Parameters:
c81349231fd9c6 Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
c81349231fd9c6 Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
c81349231fd9c6 Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
c81349231fd9c6 Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
c81349231fd9c6 Anup Patel 2022-10-09  237  	 */
c81349231fd9c6 Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
c81349231fd9c6 Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
c81349231fd9c6 Anup Patel 2022-10-09  240  
c81349231fd9c6 Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
c81349231fd9c6 Anup Patel 2022-10-09  242  
c81349231fd9c6 Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
c81349231fd9c6 Anup Patel 2022-10-09  244  	add	a6, a2, zero
c81349231fd9c6 Anup Patel 2022-10-09  245  	add	a7, a1, zero
c81349231fd9c6 Anup Patel 2022-10-09  246  	ecall
c81349231fd9c6 Anup Patel 2022-10-09  247  
c81349231fd9c6 Anup Patel 2022-10-09  248  	/* Back to Host */
c81349231fd9c6 Anup Patel 2022-10-09  249  	.align 2
c81349231fd9c6 Anup Patel 2022-10-09  250  __kvm_riscv_nacl_switch_to_return:
c81349231fd9c6 Anup Patel 2022-10-09  251  	SAVE_GUEST_GPRS
c81349231fd9c6 Anup Patel 2022-10-09  252  
c81349231fd9c6 Anup Patel 2022-10-09  253  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
c81349231fd9c6 Anup Patel 2022-10-09  254  
c81349231fd9c6 Anup Patel 2022-10-09  255  	RESTORE_HOST_GPRS
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
