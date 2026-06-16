Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250D26CE05;
	Tue, 16 Jun 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631401; cv=none; b=FhjEKHDjMuKEEHSIwu5KNX5dCcLgxKZ8MA7Id7MvFY90aZvtBb+GJp3vD+zjkQrpktMyWcZFo7PH1ZJcvR1F2v0thFePbYwROTjyB8JPkw8LyEg/4ZR8xp2wJWzl87nblG8FhfGGHFE0WkdB2L1aLqFGMgBGGcd49mifzxlau20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631401; c=relaxed/simple;
	bh=IlgdQiVrIUvUyXtg1A3PnUxmjTNZ6p/D/ns6KhmP2oY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EGO5omilc0YToWxFU28Gp0xq7MAr0R46Rg98ggMZJa8ZfiMDyy0Ryv7ENeVSrjSMBtUAlOi3sZJR16dXVGd4bkqeOmdAuPpxQ/g2smLjARBm8g6hzNQ734SL/0CNrzLI0KF8qgSbEoP74Oc9iNokDtZLFvJWYKGdGzA3fHNe5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEUUcKSy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEUUcKSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781631399; x=1813167399;
  h=date:from:to:cc:subject:message-id;
  bh=IlgdQiVrIUvUyXtg1A3PnUxmjTNZ6p/D/ns6KhmP2oY=;
  b=fEUUcKSyQ1CAB7uQ15OJS0IFzrY58E80Fxdvf/+vaxJRuBZfzVxA9AGE
   QozUi2liDZPytohXvgp/y0zj+zvi1QouVimh9zvARCFOROfDEUJ5u4b+2
   oTCJ8KFcgZI4QS9ycNuV+evQR1Z3ZDjErhxCD1wcIEVMqVpFholF6hkNW
   oBbsGtERZxmBAFwXBzbuxb1TStCCwynu3Sl+zeWnjQRETZtmlGiypti3S
   Dz9tguQ27zm27YCNAoGT1qSjUOvOTKwEpSrWzPh338AlTGfyTpJ7EHk+k
   xqp+BrIV/zi4GMUQbNy3c9S2Us3SSb39gcSdnXAdKZ3K5KvI0uUrjvDVc
   Q==;
X-CSE-ConnectionGUID: a8v0AFj3QRaZX9cblWeGOg==
X-CSE-MsgGUID: +ZhL55qeQgqxAL7yqsH6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82257949"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82257949"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 10:36:39 -0700
X-CSE-ConnectionGUID: 8fCZjLf4QomJYPCJhnbUDA==
X-CSE-MsgGUID: ijIhMbcqSDKigMtgYE2vrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="246938020"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2026 10:36:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZXiE-00000000TaY-2iqc;
	Tue, 16 Jun 2026 17:36:34 +0000
Date: Wed, 17 Jun 2026 01:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv3 37/37]
 arch/arm64/kvm/sys_regs.c:222:32: warning: misleading indentation; statement
 is not part of the previous 'if'
Message-ID: <202606170158.W9YgYBN4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv3
head:   aa9a6e84f564417704258a20210b95d18ebf5601
commit: aa9a6e84f564417704258a20210b95d18ebf5601 [37/37] WIP
config: arm64-randconfig-003 (https://download.01.org/0day-ci/archive/20260617/202606170158.W9YgYBN4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170158.W9YgYBN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170158.W9YgYBN4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c:222:30: error: expected ';' after expression
     222 |                         loc->loc = SR_LOC_SPECIAL : SR_LOC_MEMORY;
         |                                                   ^
         |                                                   ;
>> arch/arm64/kvm/sys_regs.c:222:32: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
     222 |                         loc->loc = SR_LOC_SPECIAL : SR_LOC_MEMORY;
         |                                                     ^
   arch/arm64/kvm/sys_regs.c:221:3: note: previous statement is here
     221 |                 if (is_hyp_ctxt(vcpu))
         |                 ^
>> arch/arm64/kvm/sys_regs.c:222:32: warning: expression result unused [-Wunused-value]
     222 |                         loc->loc = SR_LOC_SPECIAL : SR_LOC_MEMORY;
         |                                                     ^~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +/if +222 arch/arm64/kvm/sys_regs.c

   168	
   169	#define MAPPED_EL2_SYSREG(r, m, t)					\
   170		case r:	{							\
   171			locate_mapped_el2_register(vcpu, r, m, t, loc);		\
   172			break;							\
   173		}
   174	
   175	static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
   176				    struct sr_loc *loc)
   177	{
   178		if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU)) {
   179			loc->loc = SR_LOC_MEMORY;
   180			return;
   181		}
   182	
   183		switch (reg) {
   184			MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
   185					  translate_sctlr_el2_to_sctlr_el1	     );
   186			MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
   187					  translate_ttbr0_el2_to_ttbr0_el1	     );
   188			MAPPED_EL2_SYSREG(TTBR1_EL2,   TTBR1_EL1,   NULL	     );
   189			MAPPED_EL2_SYSREG(TCR_EL2,     TCR_EL1,
   190					  translate_tcr_el2_to_tcr_el1		     );
   191			MAPPED_EL2_SYSREG(VBAR_EL2,    VBAR_EL1,    NULL	     );
   192			MAPPED_EL2_SYSREG(AFSR0_EL2,   AFSR0_EL1,   NULL	     );
   193			MAPPED_EL2_SYSREG(AFSR1_EL2,   AFSR1_EL1,   NULL	     );
   194			MAPPED_EL2_SYSREG(ESR_EL2,     ESR_EL1,     NULL	     );
   195			MAPPED_EL2_SYSREG(FAR_EL2,     FAR_EL1,     NULL	     );
   196			MAPPED_EL2_SYSREG(MAIR_EL2,    MAIR_EL1,    NULL	     );
   197			MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
   198			MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
   199			MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
   200			MAPPED_EL2_SYSREG(POR_EL2,     POR_EL1,     NULL	     );
   201			MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
   202			MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
   203			MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
   204			MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
   205			MAPPED_EL2_SYSREG(SCTLR2_EL2,  SCTLR2_EL1,  NULL	     );
   206		case CNTHCTL_EL2:
   207			/* CNTHCTL_EL2 is super special, unless we support NV2p1 */
   208			loc->loc = (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu) ?
   209				    SR_LOC_SPECIAL : SR_LOC_MEMORY);
   210			break;
   211		case CPTR_EL2:
   212			/*
   213			 * CPTR_EL2 is just as special, and needs a certain amount
   214			 * of handholding. It always lives in memory, due to being
   215			 * heavily trapped thanks to CPACR_EL1.TCPAC being RES0.
   216			 * FEAT_NV2p1 fixes this.
   217			 */
   218			locate_mapped_el2_register(vcpu, CPTR_EL2, CPACR_EL1,
   219						   translate_cptr_el2_to_cpacr_el1,
   220						   loc);
   221			if (is_hyp_ctxt(vcpu))
 > 222				loc->loc = SR_LOC_SPECIAL : SR_LOC_MEMORY;
   223			break;
   224		default:
   225			loc->loc = locate_direct_register(vcpu, reg);
   226		}
   227	}
   228	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
