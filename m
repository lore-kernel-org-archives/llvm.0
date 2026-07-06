Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1993BFAD1;
	Mon,  6 Jul 2026 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324793; cv=none; b=qD86yzfJzMQQyLp9J0GWAoQY4DKLeLbQNCk3FS0NshDTvh0xmkMtkj/3iK9keN+iXcutfpPQyGGW/GWu5XMqEWkKKacsD2MfLc59NNo2q9D3ceZWbV1XurKriEyFSBbDB/6y9ajpVb/7pSKOc+9/4E0OXLz1iz3BSQv0PdpKyb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324793; c=relaxed/simple;
	bh=AiJatqjHVJ61mLPk1ugMhNQySmgagkHf1xtniD88R8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ozrMU8u72IJI07cTlfCDYlBo/oMspCzwk5BTQi4bR36AcxKAyCze7CH01kw51gODW+JP/yJc4i9Nos+NESW40kATZOWhOSh253n+UfNkpD/fJFWg/JSLo954sOr1917GsGJyHFyUvRotIqpYk9muk6pWWBdJn34FIc5fi09RxNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjWoCGEr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjWoCGEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783324787; x=1814860787;
  h=date:from:to:cc:subject:message-id;
  bh=AiJatqjHVJ61mLPk1ugMhNQySmgagkHf1xtniD88R8w=;
  b=UjWoCGErRevmQD/qklMBVQDtRhOjTTGG7++Ig9judbRHe60rktKDSWnP
   W9udyh7pijYGUub/nI0gF+meW22RZfcJu6P330O4PI4JxUAEEJg9hpvFw
   +raFLkNQgrecdxWgS09rcQ3/PCZPh1sf2po7WceXJIiutucb79DcVgP4w
   0h+q+LCop+zAM7XunZhUbz3Ze+T3dJE8yrHE0xkhiCW7PZ37Ilx4KpLAu
   IBEptCrGW9I0c25hN1GKyppSxwdHYuVnuOG3CNTtC80LzeWGZiVKm88Jf
   7XOWPgveWii+dMurqZa3oxIOtBklC1G/yx2blYf8KqzkoqlMjnn4aOJwB
   g==;
X-CSE-ConnectionGUID: hvDJBl+8Q/qy3c1P+FJtMg==
X-CSE-MsgGUID: a/nbo0NhRGaggB0ngrld5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="86502675"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="86502675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 00:59:36 -0700
X-CSE-ConnectionGUID: dSfy9bXfSaSyjuMtICJdCw==
X-CSE-MsgGUID: 5vda5V6VR8mRf27NjvYSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257521857"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Jul 2026 00:59:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgeEm-00000000EBX-0Rdh;
	Mon, 06 Jul 2026 07:59:32 +0000
Date: Mon, 06 Jul 2026 15:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v2 6/18]
 arch/riscv/kvm/vcpu_nested.c:23:6: warning: variable 'cpu' set but not used
Message-ID: <202607061521.gWTfJXOS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v2
head:   831fb70f63176d15e72a43608df8672c870cfebb
commit: 86dea0bfc3f506f22414ba3a1b52f94ae3cd7111 [6/18] RISC-V: KVM: Extend trap redirection for nested virtualization
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260706/202607061521.gWTfJXOS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061521.gWTfJXOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061521.gWTfJXOS-lkp@intel.com/

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
    21		struct kvm_vcpu_nested_csr *nsc = ns->csr;
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
    39		/* Update time delta */
    40		kvm_riscv_vcpu_update_timedelta(vcpu, virt);
    41	
    42		/* Update G-stage page table */
    43		kvm_riscv_mmu_update_hgatp(vcpu, virt);
    44	
    45		/* Swap hardware vs<xyz> CSRs except vsie and vsstatus */
    46		nsc->vstvec = ncsr_swap(CSR_VSTVEC, nsc->vstvec);
    47		nsc->vsscratch = ncsr_swap(CSR_VSSCRATCH, nsc->vsscratch);
    48		nsc->vsepc = ncsr_swap(CSR_VSEPC, nsc->vsepc);
    49		nsc->vscause = ncsr_swap(CSR_VSCAUSE, nsc->vscause);
    50		nsc->vstval = ncsr_swap(CSR_VSTVAL, nsc->vstval);
    51		nsc->vsatp = ncsr_swap(CSR_VSATP, nsc->vsatp);
    52	
    53		/* Update vsstatus CSR */
    54		if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
    55		    riscv_isa_extension_available(vcpu->arch.isa, d))
    56			sr_fs_vs_mask |= SR_FS;
    57		if (riscv_isa_extension_available(vcpu->arch.isa, v))
    58			sr_fs_vs_mask |= SR_VS;
    59		if (virt) {
    60			/*
    61			 * Update vsstatus in following manner:
    62			 * 1) Swap hardware vsstatus (i.e. virtual-HS mode sstatus) with
    63			 *    vsstatus in nested virtualization context (i.e. virtual-VS
    64			 *    mode sstatus)
    65			 * 2) Swap host sstatus.[FS|VS] (i.e. HS mode sstatus.[FS|VS])
    66			 *    with the vsstatus.[FS|VS] saved in nested virtualization
    67			 *    context (i.e. virtual-HS mode sstatus.[FS|VS])
    68			 */
    69			nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
    70			tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
    71			vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
    72			vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
    73			nsc->vsstatus &= ~sr_fs_vs_mask;
    74			nsc->vsstatus |= tmp;
    75		} else {
    76			/*
    77			 * Update vsstatus in following manner:
    78			 * 1) Swap host sstatus.[FS|VS] (i.e. virtual-HS mode sstatus.[FS|VS])
    79			 *    with vsstatus.[FS|VS] saved in the nested virtualization
    80			 *    context (i.e. HS mode sstatus.[FS|VS])
    81			 * 2) Swap hardware vsstatus (i.e. virtual-VS mode sstatus) with
    82			 *    vsstatus in nested virtualization context (i.e. virtual-HS
    83			 *    mode sstatus)
    84			 */
    85			tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
    86			vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
    87			vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
    88			nsc->vsstatus &= ~sr_fs_vs_mask;
    89			nsc->vsstatus |= tmp;
    90			nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
    91		}
    92	
    93	skip_csr_update:
    94		if (event != NESTED_SET_VIRT_EVENT_SRET) {
    95			/* Update guest hstatus.SPV bit */
    96			nsc->hstatus &= ~HSTATUS_SPV;
    97			nsc->hstatus |= (ns->virt) ? HSTATUS_SPV : 0;
    98	
    99			/* Update guest hstatus.SPVP bit */
   100			if (ns->virt) {
   101				nsc->hstatus &= ~HSTATUS_SPVP;
   102				if (spvp)
   103					nsc->hstatus |= HSTATUS_SPVP;
   104			}
   105	
   106			/* Update guest hstatus.GVA bit */
   107			if (event == NESTED_SET_VIRT_EVENT_TRAP) {
   108				nsc->hstatus &= ~HSTATUS_GVA;
   109				nsc->hstatus |= (gva) ? HSTATUS_GVA : 0;
   110			}
   111		}
   112	
   113		/* Update host SRET trapping */
   114		vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTSR;
   115		if (virt) {
   116			if (nsc->hstatus & HSTATUS_VTSR)
   117				vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
   118		} else {
   119			if (nsc->hstatus & HSTATUS_SPV)
   120				vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
   121		}
   122	
   123		/* Update host VM trapping */
   124		vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTVM;
   125		if (virt && (nsc->hstatus & HSTATUS_VTVM))
   126			vcpu->arch.guest_context.hstatus |= HSTATUS_VTVM;
   127	
   128		/* Update virt flag */
   129		ns->virt = virt;
   130	
   131		/* Release CPU */
   132		put_cpu();
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
