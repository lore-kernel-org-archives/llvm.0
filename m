Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF8346E55;
	Sat, 30 May 2026 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780115360; cv=none; b=BSwpIYWIVCZKwPtmOCEyXct3sL8AUVWqNam8E+eTvdf3PGSAsLbgs21LOE4t/G2leP0F8LrJTIP9pUqeRvkPVZ8q3lCPS4LFFsAx73Rv01ieVcB3sPWRNgyYfudYs6WFKpIl23TjgrcCleQbDjj8+G/ROcZAalc2wMIz8r8o6EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780115360; c=relaxed/simple;
	bh=HeKjvhZRE/kd4wpQIeWkJRRTJkavQo+51DDmvfIBbQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E6SPV0IiwuI8nsY4cYfz8XGWtSjErfJHjIdYRi5jw2WZi619Bo39kJdUEcF8C9YkwzroJO8V5FjQVblu1U9/iO1/RB+m7q+jSZ2icNhEWfdhVkH4RLQlaFmahLpKOu4urMksoQn8DDWCaaqQU716yRthNUgfIi0jvi3nTD59RKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGUVwRQd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGUVwRQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780115358; x=1811651358;
  h=date:from:to:cc:subject:message-id;
  bh=HeKjvhZRE/kd4wpQIeWkJRRTJkavQo+51DDmvfIBbQ0=;
  b=CGUVwRQdGU7sms3f6R4YEFVCe56RdN9Qhh/Y14v9JrpV+k8qOCMX1M3x
   4aprZ+BMN135oNE0XnMbE0t9PNJN3LvG0n5ks8I4vhnaKag8WVkMUaLlY
   wt82uW/ZXJTQYOr0+9OPC2N/aG/qReNVcAyXI+kUsruigiCWq91uCcN4R
   L1uyTMDRRlmsB/NtOwQjh76cVm7hdyvyohEhr/0XsKSaEWL9j7gTjpik2
   FmKDUbpgh/Eg4MoswjHRmpbRCTN7fYdtWTq1/t3qdNp8FTBhGhsTeYsdB
   vBDhsWjx9u3nd3Bcrs7HGsYga/ByiQFnZicpMERd39Tcpg+olAyEOrQXi
   g==;
X-CSE-ConnectionGUID: LZMBGWhUTTeh0Jfx8ksQaQ==
X-CSE-MsgGUID: +lu2QrqVQniJc/seJdWoVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80692297"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80692297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 21:29:16 -0700
X-CSE-ConnectionGUID: E78+1FaiQiiz5bwYBQi4xA==
X-CSE-MsgGUID: NKPP2TwjTuW7TWCcPZl5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247953183"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 21:29:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTBJv-0000000086e-3w4Z;
	Sat, 30 May 2026 04:29:11 +0000
Date: Sat, 30 May 2026 12:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 16/62]
 arch/riscv/kvm/vcpu_insn.c:138:3: warning: shift count is negative
Message-ID: <202605301212.1KZPhMcp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: 4be7559caa1d9c7436c368cf89fee7d28d0559a9 [16/62] kvm: Move VCPU locking to struct kvm_vcpu_common
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301212.1KZPhMcp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301212.1KZPhMcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301212.1KZPhMcp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   include/linux/kvm_host.h:1023:56: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1023 |                   "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
         |                                                                ~~~~  ^
   include/linux/kvm_host.h:1034:58: error: no member named 'srcu_depth' in 'struct kvm_vcpu'
    1034 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                  ~~~~  ^
>> arch/riscv/kvm/vcpu_insn.c:138:3: warning: shift count is negative [-Wshift-count-negative]
     138 |                 SET_RD(insn, &vcpu->arch.guest_context,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     139 |                        run->riscv_csr.ret_value);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:412:35: note: expanded from macro 'SET_RD'
     412 | #define SET_RD(insn, regs, val) (*REG_PTR(insn, SH_RD, regs) = (val))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:401:3: note: expanded from macro 'REG_OFFSET'
     401 |         (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:395:18: note: expanded from macro 'SHIFT_RIGHT'
     395 |         ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
         |                         ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:152:18: warning: shift count is negative [-Wshift-count-negative]
     152 |         ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:406:31: note: expanded from macro 'GET_RS1'
     406 | #define GET_RS1(insn, regs)     (*REG_PTR(insn, SH_RS1, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:401:3: note: expanded from macro 'REG_OFFSET'
     401 |         (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:395:18: note: expanded from macro 'SHIFT_RIGHT'
     395 |         ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
         |                         ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:537:9: warning: shift count is negative [-Wshift-count-negative]
     537 |         data = GET_RS2(insn, &vcpu->arch.guest_context);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:407:31: note: expanded from macro 'GET_RS2'
     407 | #define GET_RS2(insn, regs)     (*REG_PTR(insn, SH_RS2, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:401:3: note: expanded from macro 'REG_OFFSET'
     401 |         (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:395:18: note: expanded from macro 'SHIFT_RIGHT'
     395 |         ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
         |                         ^  ~~~~
   arch/riscv/kvm/vcpu_insn.c:553:12: warning: shift count is negative [-Wshift-count-negative]
     553 |                 data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:409:32: note: expanded from macro 'GET_RS2S'
     409 | #define GET_RS2S(insn, regs)    (*REG_PTR(RVC_RS2S(insn), 0, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:401:3: note: expanded from macro 'REG_OFFSET'
     401 |         (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:395:34: note: expanded from macro 'SHIFT_RIGHT'
     395 |         ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
         |                                         ^  ~~~
   arch/riscv/kvm/vcpu_insn.c:557:12: warning: shift count is negative [-Wshift-count-negative]
     557 |                 data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:410:32: note: expanded from macro 'GET_RS2C'
     410 | #define GET_RS2C(insn, regs)    (*REG_PTR(insn, SH_RS2C, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:401:3: note: expanded from macro 'REG_OFFSET'
     401 |         (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:395:34: note: expanded from macro 'SHIFT_RIGHT'
     395 |         ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
         |                                         ^  ~~~
   arch/riscv/kvm/vcpu_insn.c:561:12: warning: shift count is negative [-Wshift-count-negative]
     561 |                 data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:409:32: note: expanded from macro 'GET_RS2S'
     409 | #define GET_RS2S(insn, regs)    (*REG_PTR(RVC_RS2S(insn), 0, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:401:3: note: expanded from macro 'REG_OFFSET'
     401 |         (SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:395:34: note: expanded from macro 'SHIFT_RIGHT'
     395 |         ((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
         |                                         ^  ~~~
   arch/riscv/kvm/vcpu_insn.c:565:12: warning: shift count is negative [-Wshift-count-negative]
     565 |                 data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:410:32: note: expanded from macro 'GET_RS2C'
     410 | #define GET_RS2C(insn, regs)    (*REG_PTR(insn, SH_RS2C, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~


vim +138 arch/riscv/kvm/vcpu_insn.c

8a061562e2f2b3 Anup Patel 2022-07-29  117  
8a061562e2f2b3 Anup Patel 2022-07-29  118  /**
8a061562e2f2b3 Anup Patel 2022-07-29  119   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
8a061562e2f2b3 Anup Patel 2022-07-29  120   *				emulation or in-kernel emulation
8a061562e2f2b3 Anup Patel 2022-07-29  121   *
8a061562e2f2b3 Anup Patel 2022-07-29  122   * @vcpu: The VCPU pointer
8a061562e2f2b3 Anup Patel 2022-07-29  123   * @run:  The VCPU run struct containing the CSR data
8a061562e2f2b3 Anup Patel 2022-07-29  124   *
8a061562e2f2b3 Anup Patel 2022-07-29  125   * Returns > 0 upon failure and 0 upon success
8a061562e2f2b3 Anup Patel 2022-07-29  126   */
8a061562e2f2b3 Anup Patel 2022-07-29  127  int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
8a061562e2f2b3 Anup Patel 2022-07-29  128  {
8a061562e2f2b3 Anup Patel 2022-07-29  129  	ulong insn;
8a061562e2f2b3 Anup Patel 2022-07-29  130  
8a061562e2f2b3 Anup Patel 2022-07-29  131  	if (vcpu->arch.csr_decode.return_handled)
8a061562e2f2b3 Anup Patel 2022-07-29  132  		return 0;
8a061562e2f2b3 Anup Patel 2022-07-29  133  	vcpu->arch.csr_decode.return_handled = 1;
8a061562e2f2b3 Anup Patel 2022-07-29  134  
8a061562e2f2b3 Anup Patel 2022-07-29  135  	/* Update destination register for CSR reads */
8a061562e2f2b3 Anup Patel 2022-07-29  136  	insn = vcpu->arch.csr_decode.insn;
8a061562e2f2b3 Anup Patel 2022-07-29  137  	if ((insn >> SH_RD) & MASK_RX)
8a061562e2f2b3 Anup Patel 2022-07-29 @138  		SET_RD(insn, &vcpu->arch.guest_context,
8a061562e2f2b3 Anup Patel 2022-07-29  139  		       run->riscv_csr.ret_value);
8a061562e2f2b3 Anup Patel 2022-07-29  140  
8a061562e2f2b3 Anup Patel 2022-07-29  141  	/* Move to next instruction */
8a061562e2f2b3 Anup Patel 2022-07-29  142  	vcpu->arch.guest_context.sepc += INSN_LEN(insn);
8a061562e2f2b3 Anup Patel 2022-07-29  143  
8a061562e2f2b3 Anup Patel 2022-07-29  144  	return 0;
8a061562e2f2b3 Anup Patel 2022-07-29  145  }
8a061562e2f2b3 Anup Patel 2022-07-29  146  

:::::: The code at line 138 was first introduced by commit
:::::: 8a061562e2f2b32bfb5bff5bf3afc64e37d95a27 RISC-V: KVM: Add extensible CSR emulation framework

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
