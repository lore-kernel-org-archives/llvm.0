Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6D3C0A19;
	Wed, 30 Sep 2026 08:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756886; cv=none; b=eckBMEkB0m5TjELdhZt+T+g3oYI824L2xiQ3tSBcjUeTXMDSNHHn755hJiCg/+t3A5ii3eBPmt5OtbzQOcIm9w4ujoGXynsV7l/N0BXXYne+kSJeulGQvhxSf6GgL1gVFGCAp8VhjZnS+iPSodMmxwB6ZpgCUnii4YlFyGarovU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756886; c=relaxed/simple;
	bh=ksMUKOfw5YsWE4ySBmmmAAFK3DApvJran3K1g5x/ekI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jpne6N1q3nzfHYMG2m4QRJ0O4NLGvYk/dHy8yBUQ0igurX0hhO9K/rqRPG1MyYcbSnflaqd9ivqXNWkyk3pmFQFpXo5fnisLDyWgUN91TYLm7pzM98/ZM3gS46h8v2e9tPNf54z5dBV5yr3/MBYy2Ogjy6LjhtWAmsaVslaDHvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fmq+NPiA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fmq+NPiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790756884; x=1822292884;
  h=date:from:to:cc:subject:message-id;
  bh=ksMUKOfw5YsWE4ySBmmmAAFK3DApvJran3K1g5x/ekI=;
  b=Fmq+NPiAiLw6XpFHYJEkQxFU3bB/yT7rZRscP2cZySpZPxJVB0KPyEW4
   J9d1tKEnt0knSWdWIXfY2WoXlFL3XfG62SySWeSBk4Vrc/f5ILHisGcW/
   YSB5oXOkVBQXE6qV9fEulmeEKB9LB3qjMMu1Q4W/1bSVkWVFBMYCIXaiC
   xtyF22W2OUFTSh6C8V9R1CYdBBdm9zRF8MMAlZhXLckcpKII4gTL1N5OT
   viwKhpVCjk3PsAgVBJERRQo48g29jrxL4DDgTWiH1ALHsOsOtJBTaRuPu
   ruCjMJMCtoazAHMqyXFUpeCbNSgF4m67epxBsNJTQgRQIV1mCvPpyTwrW
   g==;
X-CSE-ConnectionGUID: nt5b563TRBqVZODVzYfT2w==
X-CSE-MsgGUID: ILkz8kImRDSVgQo0iFK5PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95299224"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="95299224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:28:03 -0700
X-CSE-ConnectionGUID: /OnQlxwcTACF8gbIIQc2sQ==
X-CSE-MsgGUID: r6r7T74ySr+lregdnyht4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274753934"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 01:28:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBpfS-00000000QNY-3G79;
	Wed, 30 Sep 2026 08:27:58 +0000
Date: Wed, 30 Sep 2026 16:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/vgic-last_lr_irq-fixes 1/8]
 arch/riscv/kvm/vcpu_insn.c:139:3: warning: shift count is negative
Message-ID: <202609301633.bLazT9fh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/vgic-last_lr_irq-fixes
head:   df9d6ca852c63334018676675870385055271f5a
commit: 863b2c5b18c975f73dd3008fac1a97b9168687a3 [1/8] KVM: Guarantee acquire semantics to kvm_vcpu_exiting_guest_mode()
config: riscv-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301633.bLazT9fh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301633.bLazT9fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301633.bLazT9fh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   include/linux/kvm_host.h:571:83: error: expected ')'
     571 |         return (cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE) == IN_GUEST_MODE :
         |                                                                                          ^
   include/linux/kvm_host.h:571:9: note: to match this '('
     571 |         return (cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE) == IN_GUEST_MODE :
         |                ^
>> arch/riscv/kvm/vcpu_insn.c:139:3: warning: shift count is negative [-Wshift-count-negative]
     139 |                 SET_RD(insn, &vcpu->arch.guest_context,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                        run->riscv_csr.ret_value);
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
   arch/riscv/kvm/vcpu_insn.c:153:18: warning: shift count is negative [-Wshift-count-negative]
     153 |         ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
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
   arch/riscv/kvm/vcpu_insn.c:542:9: warning: shift count is negative [-Wshift-count-negative]
     542 |         data = GET_RS2(insn, &vcpu->arch.guest_context);
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
   arch/riscv/kvm/vcpu_insn.c:558:12: warning: shift count is negative [-Wshift-count-negative]
     558 |                 data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
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
   arch/riscv/kvm/vcpu_insn.c:562:12: warning: shift count is negative [-Wshift-count-negative]
     562 |                 data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
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
   arch/riscv/kvm/vcpu_insn.c:566:12: warning: shift count is negative [-Wshift-count-negative]
     566 |                 data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
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
   arch/riscv/kvm/vcpu_insn.c:570:12: warning: shift count is negative [-Wshift-count-negative]
     570 |                 data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:410:32: note: expanded from macro 'GET_RS2C'
     410 | #define GET_RS2C(insn, regs)    (*REG_PTR(insn, SH_RS2C, regs))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:404:29: note: expanded from macro 'REG_PTR'
     404 |         ((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
         |                                    ^~~~~~~~~~~~~~~~~~~~~


vim +139 arch/riscv/kvm/vcpu_insn.c

8a061562e2f2b3 Anup Patel 2022-07-29  118  
8a061562e2f2b3 Anup Patel 2022-07-29  119  /**
8a061562e2f2b3 Anup Patel 2022-07-29  120   * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
8a061562e2f2b3 Anup Patel 2022-07-29  121   *				emulation or in-kernel emulation
8a061562e2f2b3 Anup Patel 2022-07-29  122   *
8a061562e2f2b3 Anup Patel 2022-07-29  123   * @vcpu: The VCPU pointer
8a061562e2f2b3 Anup Patel 2022-07-29  124   * @run:  The VCPU run struct containing the CSR data
8a061562e2f2b3 Anup Patel 2022-07-29  125   *
8a061562e2f2b3 Anup Patel 2022-07-29  126   * Returns > 0 upon failure and 0 upon success
8a061562e2f2b3 Anup Patel 2022-07-29  127   */
8a061562e2f2b3 Anup Patel 2022-07-29  128  int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
8a061562e2f2b3 Anup Patel 2022-07-29  129  {
8a061562e2f2b3 Anup Patel 2022-07-29  130  	ulong insn;
8a061562e2f2b3 Anup Patel 2022-07-29  131  
8a061562e2f2b3 Anup Patel 2022-07-29  132  	if (vcpu->arch.csr_decode.return_handled)
8a061562e2f2b3 Anup Patel 2022-07-29  133  		return 0;
8a061562e2f2b3 Anup Patel 2022-07-29  134  	vcpu->arch.csr_decode.return_handled = 1;
8a061562e2f2b3 Anup Patel 2022-07-29  135  
8a061562e2f2b3 Anup Patel 2022-07-29  136  	/* Update destination register for CSR reads */
8a061562e2f2b3 Anup Patel 2022-07-29  137  	insn = vcpu->arch.csr_decode.insn;
8a061562e2f2b3 Anup Patel 2022-07-29  138  	if ((insn >> SH_RD) & MASK_RX)
8a061562e2f2b3 Anup Patel 2022-07-29 @139  		SET_RD(insn, &vcpu->arch.guest_context,
8a061562e2f2b3 Anup Patel 2022-07-29  140  		       run->riscv_csr.ret_value);
8a061562e2f2b3 Anup Patel 2022-07-29  141  
8a061562e2f2b3 Anup Patel 2022-07-29  142  	/* Move to next instruction */
8a061562e2f2b3 Anup Patel 2022-07-29  143  	vcpu->arch.guest_context.sepc += INSN_LEN(insn);
8a061562e2f2b3 Anup Patel 2022-07-29  144  
8a061562e2f2b3 Anup Patel 2022-07-29  145  	return 0;
8a061562e2f2b3 Anup Patel 2022-07-29  146  }
8a061562e2f2b3 Anup Patel 2022-07-29  147  

:::::: The code at line 139 was first introduced by commit
:::::: 8a061562e2f2b32bfb5bff5bf3afc64e37d95a27 RISC-V: KVM: Add extensible CSR emulation framework

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
