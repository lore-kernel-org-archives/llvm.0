Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B7B672;
	Fri,  2 Jan 2026 04:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767326456; cv=none; b=kskA3f0ILrfF+TUBOZRohUYsKd7lS4uQrjmInJgkhvkiufZ6Pjt3tzwrZjfa4OABerv5lxx3uNRlXNMD80HvPXznvhJyjXhkHQioj8uBwS3KUryq/Xoh+pKJYzT0bnuG/XNpKwVV8hI+kZzWA9axPsStdJBhCjMt0t1raXRtyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767326456; c=relaxed/simple;
	bh=zLPsluLjly2jBKGmzY+42WoS5hBHJMxcxxPeNmXuFhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NDUKW4a7WNTcN7Ore8m/FMazEgDEkn9hxlWh/9OkXeKU9a1CH4/zYjP6H0IHTQmQ0IMIiIT2y0RRLrYv8zAySHRKZPB7dcg3nvVa8zi+ZsT8j4vxKR1VkF0cMVeb+1nrrQ4WQtdCF9VXDzmPKorQM7Asw+0vjLEtrBRuQWRrFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ah5rXoFB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ah5rXoFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767326455; x=1798862455;
  h=date:from:to:cc:subject:message-id;
  bh=zLPsluLjly2jBKGmzY+42WoS5hBHJMxcxxPeNmXuFhI=;
  b=ah5rXoFBriN6VEzFw0n7/z9EoR705AoGl9WGHeoS8sK3+pU55Af0E7Jc
   7JVGQlV5BBPcjJMCd3WT4bGK/nFt0Wz2lPmbC/OJAch9KtKH1yL7ASyQv
   f63vu0xboxMP326v6+W245VTHZZG2YcYeRwGxZKYoNvnSWjWzE7Qs+xGQ
   WYN9kIoaRIS3+FsuW4UWZAbK/ei7Xb7t8Hl5VIaEuCijzo8VfQU/ag7qe
   DJJpD/2sO3JBz81v38+jW7ZbNLFLFZ8QqJEaBG3aj3pSL1uGf6qSZjzQN
   nQNTIpOEjNeThWBWd2TONfE0Y8pEnpiYSdB7R4/NnMNDE057mnSQZTJlz
   g==;
X-CSE-ConnectionGUID: cIr4xpy6R/KYYqmZftfOzA==
X-CSE-MsgGUID: UUHxqOipQG20HADszEej9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68897619"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="68897619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 20:00:54 -0800
X-CSE-ConnectionGUID: 2cpcgIIdQMOhx0JJ/G8WbQ==
X-CSE-MsgGUID: qjp/ytICRk2PXWt5Y/AfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="202701444"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jan 2026 20:00:53 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbWLK-0000000026r-2si3;
	Fri, 02 Jan 2026 04:00:50 +0000
Date: Fri, 02 Jan 2026 12:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 8/14]
 arch/riscv/kvm/vcpu_nested.c:23:6: warning: variable 'cpu' set but not used
Message-ID: <202601021133.XukWlBE7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   d9789002a11efbf06d07540d80dbe5fc7d7bbeb2
commit: 82da176ef84d4434d15cb033b5240e379d17fb40 [8/14] RISC-V: KVM: Extend trap redirection for nested virtualization
config: riscv-randconfig-002-20260102 (https://download.01.org/0day-ci/archive/20260102/202601021133.XukWlBE7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601021133.XukWlBE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601021133.XukWlBE7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_nested.c:23:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
      23 |         int cpu;
         |             ^
   1 warning generated.


vim +/cpu +23 arch/riscv/kvm/vcpu_nested.c

    15	
    16	void kvm_riscv_vcpu_nested_set_virt(struct kvm_vcpu *vcpu,
    17					    enum kvm_vcpu_nested_set_virt_event event,
    18					    bool virt, bool spvp, bool gva)
    19	{
    20		struct kvm_vcpu_nested *ns = &vcpu->arch.nested;
    21		struct kvm_vcpu_nested_csr *nsc = &ns->csr;
    22		unsigned long tmp, sr_fs_vs_mask = 0;
  > 23		int cpu;
    24	
    25		/* If H-extension is not available for VCPU then do nothing */
    26		if (!riscv_isa_extension_available(vcpu->arch.isa, h))
    27			return;
    28	
    29		/* Grab the CPU to ensure we remain on same CPU */
    30		cpu = get_cpu();
    31	
    32		/* Skip hardware CSR update if no change in virt state */
    33		if (virt == ns->virt)
    34			goto skip_csr_update;
    35	
    36		/* Update config CSRs (aka hedeleg, hideleg, henvcfg, and hstateeX) */
    37		kvm_riscv_vcpu_config_load(vcpu, virt);
    38	
    39		/* TODO: Update time delta */
    40	
    41		/* Update G-stage page table */
    42		kvm_riscv_mmu_update_hgatp(vcpu, virt);
    43	
    44		/* Swap hardware vs<xyz> CSRs except vsie and vsstatus */
    45		nsc->vstvec = ncsr_swap(CSR_VSTVEC, nsc->vstvec);
    46		nsc->vsscratch = ncsr_swap(CSR_VSSCRATCH, nsc->vsscratch);
    47		nsc->vsepc = ncsr_swap(CSR_VSEPC, nsc->vsepc);
    48		nsc->vscause = ncsr_swap(CSR_VSCAUSE, nsc->vscause);
    49		nsc->vstval = ncsr_swap(CSR_VSTVAL, nsc->vstval);
    50		nsc->vsatp = ncsr_swap(CSR_VSATP, nsc->vsatp);
    51	
    52		/* Update vsstatus CSR */
    53		if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
    54		    riscv_isa_extension_available(vcpu->arch.isa, d))
    55			sr_fs_vs_mask |= SR_FS;
    56		if (riscv_isa_extension_available(vcpu->arch.isa, v))
    57			sr_fs_vs_mask |= SR_VS;
    58		if (virt) {
    59			/*
    60			 * Update vsstatus in following manner:
    61			 * 1) Swap hardware vsstatus (i.e. virtual-HS mode sstatus) with
    62			 *    vsstatus in nested virtualization context (i.e. virtual-VS
    63			 *    mode sstatus)
    64			 * 2) Swap host sstatus.[FS|VS] (i.e. HS mode sstatus.[FS|VS])
    65			 *    with the vsstatus.[FS|VS] saved in nested virtualization
    66			 *    context (i.e. virtual-HS mode sstatus.[FS|VS])
    67			 */
    68			nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
    69			tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
    70			vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
    71			vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
    72			nsc->vsstatus &= ~sr_fs_vs_mask;
    73			nsc->vsstatus |= tmp;
    74		} else {
    75			/*
    76			 * Update vsstatus in following manner:
    77			 * 1) Swap host sstatus.[FS|VS] (i.e. virtual-HS mode sstatus.[FS|VS])
    78			 *    with vsstatus.[FS|VS] saved in the nested virtualization context
    79			 *    context (i.e. HS mode sstatus.[FS|VS])
    80			 * 2) Swap hardware vsstatus (i.e. virtual-VS mode sstatus) with
    81			 *    vsstatus in nested virtualization context (i.e. virtual-HS
    82			 *    mode sstatus)
    83			 */
    84			tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
    85			vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
    86			vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
    87			nsc->vsstatus &= ~sr_fs_vs_mask;
    88			nsc->vsstatus |= tmp;
    89			nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
    90		}
    91	
    92	skip_csr_update:
    93		if (event != NESTED_SET_VIRT_EVENT_SRET) {
    94			/* Update guest hstatus.SPV bit */
    95			nsc->hstatus &= ~HSTATUS_SPV;
    96			nsc->hstatus |= (ns->virt) ? HSTATUS_SPV : 0;
    97	
    98			/* Update guest hstatus.SPVP bit */
    99			if (ns->virt) {
   100				nsc->hstatus &= ~HSTATUS_SPVP;
   101				if (spvp)
   102					nsc->hstatus |= HSTATUS_SPVP;
   103			}
   104	
   105			/* Update guest hstatus.GVA bit */
   106			if (event == NESTED_SET_VIRT_EVENT_TRAP) {
   107				nsc->hstatus &= ~HSTATUS_GVA;
   108				nsc->hstatus |= (gva) ? HSTATUS_GVA : 0;
   109			}
   110		}
   111	
   112		/* Update host SRET trapping */
   113		vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTSR;
   114		if (virt) {
   115			if (nsc->hstatus & HSTATUS_VTSR)
   116				vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
   117		} else {
   118			if (nsc->hstatus & HSTATUS_SPV)
   119				vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
   120		}
   121	
   122		/* Update host VM trapping */
   123		vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTVM;
   124		if (virt && (nsc->hstatus & HSTATUS_VTVM))
   125			vcpu->arch.guest_context.hstatus |= HSTATUS_VTVM;
   126	
   127		/* Update virt flag */
   128		ns->virt = virt;
   129	
   130		/* Release CPU */
   131		put_cpu();
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
