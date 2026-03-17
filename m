Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBC3803C4;
	Tue, 17 Mar 2026 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771512; cv=none; b=N6yj6qUw7QUJo3fxza6OKu8ehRsdx7terZakA16QhaeSCrKRqhk/9zL+Ewogks2f6tPlHN9OSRvMwmi2RK0wNyeUnBp1EmiSFR6b7gK/gNBS9sNiWKlGoHsPt9ZgIVQ5Ht0bZendlSpi+KMnx+DWZKMQ85Les/l/IoMMw1s+OEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771512; c=relaxed/simple;
	bh=79tf1A6WnoSjoXpcjREAXr3VaQd204WMTieyr2ewUFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nts1Fn2uf1U8O7XIlM8JgzbqFxR6G1yb6C74cjkiT9NoseAb++SAYiqTNWx2xTVxMWnzwUWAt5jhN+3mXE7ABLGuxKHyBcnEsMC2XR7hUScbdX9L76LTHHF2M6au8Bz8TgwCMQoYpRgwtAMuUCfqUOJLcAzXj5kjfljTaxov1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY2Fb7iJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY2Fb7iJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773771510; x=1805307510;
  h=date:from:to:cc:subject:message-id;
  bh=79tf1A6WnoSjoXpcjREAXr3VaQd204WMTieyr2ewUFc=;
  b=KY2Fb7iJTKCd/wSIUbEpn2RrY6LV+r4YJDAbiP1GDH1LNPN/DgIUdTPR
   ctIx7UZbkvtu+OO3WeuAc5fB1B9R4XFNKIlplbgF1AWSM1ZduiqJSTkER
   Me+iA+fPfI6KdIQ47UabsKnStco0SYYW7MVx17XyeXVwcH0XQVpO/O2Pg
   RB7z0oAoZoMrF1eLYJiV+pxCPaKbwH/BrLaz/YE3zV7/X4Zbcbnf/hmEI
   pkAfdy68QD5XTq2AunscnQKNkUaEeu+3EiWI6F1ZCbnH+SakXCTrcbuD8
   26kRG44t9BRIrgy3Rww3v9HzTmJw/UvMtNZt6dIb7df2b5k9BhFQhErH0
   w==;
X-CSE-ConnectionGUID: gFBMBJDBQoKl2bm532+8gQ==
X-CSE-MsgGUID: D8Bxaw02QQ2LdcV4YjbY/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85893689"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85893689"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 11:18:28 -0700
X-CSE-ConnectionGUID: a/HpHZ3GQzm56f/bwsF7Vg==
X-CSE-MsgGUID: KpjVb1v5S7e8OKRMfNAH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="246977041"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 11:18:26 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Yzn-000000001mj-3kJN;
	Tue, 17 Mar 2026 18:18:23 +0000
Date: Wed, 18 Mar 2026 02:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/8]
 arch/riscv/kvm/vcpu_insn.c:138:3: warning: shift count is negative
Message-ID: <202603180240.F1zBZ8Bg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   226e6782e81c88b9263e006a356f58dd8c15bef5
commit: 2ace2e1df2b9de73d65c1a11bbb4183c42ba5752 [2/8] futex: Move futex related mm_struct data into a struct
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260318/202603180240.F1zBZ8Bg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180240.F1zBZ8Bg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180240.F1zBZ8Bg-lkp@intel.com/

All warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:27: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kvm/vcpu_insn.c:8:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
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
