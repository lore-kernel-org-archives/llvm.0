Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2D344025;
	Wed,  3 Jun 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477821; cv=none; b=qEZje6VTig47QwZTf+PvBKSSQj8S/+j8vNoU3QbVYZwFlrhUR+ThoTGSUNNuVtH2rSsOYfBmuwvsMpiPcP4fW0Nr5GYnaqmJIHhukgLR6rFpKc2npjdM+Zi1nt6zTSgkEcYyXXLjq17dHoiT0WWp/jWDV1c11L/iQZp/93WeZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477821; c=relaxed/simple;
	bh=GuBJNdt4rLKTtCfWwHkVa54dMD1+Tp6FOE5J+wJxVKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tFgjwD9l8dEhsfSr9lQFD7ObG3ttfSNg+WSTDgTi1NcwCScZi+lUbqf5l9Y1O6USrXg0svdYjd+gxifW2719fytfRWYEpQ8Op82S+p9RPBISBuxrOCHEC+cH9swFH6xofkFnbOXXgeiVfOdOc4zSfxIyGoYucQdAYRWp6OI5YQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6DTKQ7G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6DTKQ7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477819; x=1812013819;
  h=date:from:to:cc:subject:message-id;
  bh=GuBJNdt4rLKTtCfWwHkVa54dMD1+Tp6FOE5J+wJxVKk=;
  b=c6DTKQ7GitdlayLRgYE/0Nwd0GkkidJdQOhgCnRTYk+qZs98w6wg+i/V
   n/mdfEBDVFyPTfxJTD+Xj3r5uJvWypUVN2mZWBsY/653C6aMU4V4wGTMy
   3YJoTvetn91DFqobXdntpCs46n70CAo1t3HURJeHGJSP8B9zzOSIjP7F8
   gza5WWSCis4lPt1FxjDn7PyyK7JFEJBrilne8jjjxsJeiYMjCQybHlgBd
   vzYBh21sSQmHeoWhczHhYKPIi+VIS1Sgo13J9PLmf5638MhJKVOrH1sd8
   iPukCV1ZuxAzetldPLeWx0vUg1flBZmzMKMwzsORLMJL7H9n/Ge1woNUX
   w==;
X-CSE-ConnectionGUID: JmRldUvVS1W4UWSURWKWJQ==
X-CSE-MsgGUID: 2tn7mGLZSLq8lPPyaqrOLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657346"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657346"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:10:19 -0700
X-CSE-ConnectionGUID: 9ZmR60meS92wxHgQ4overw==
X-CSE-MsgGUID: ZO8Ij45SQQiApB8toSPakA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281355"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jun 2026 02:10:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUhc6-00000000DCe-00JE;
	Wed, 03 Jun 2026 09:10:14 +0000
Date: Wed, 03 Jun 2026 17:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.1 22/60] arch/arm64/kvm/arm.c:729:32:
 error: no member named 'pid' in 'struct kvm_vcpu'
Message-ID: <202606031728.iBWZ72Sh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.1
head:   02b786614480597a489766ec45b0ec286a3301a0
commit: 91fa70f39fb3f7e87ce9fce960b31ba35d758ad8 [22/60] kvm: Move kvm_vcpu pid members to struct kvm_vcpu_common
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606031728.iBWZ72Sh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031728.iBWZ72Sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031728.iBWZ72Sh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:729:32: error: no member named 'pid' in 'struct kvm_vcpu'
     729 |         vcpu->arch.pid = pid_nr(vcpu->pid);
         |                                 ~~~~  ^
   1 error generated.


vim +729 arch/arm64/kvm/arm.c

0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  649  
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall  2013-01-20  650  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall  2013-01-20  651  {
a0e50aa3f4a8a5 arch/arm64/kvm/arm.c Christoffer Dall  2019-01-04  652  	struct kvm_s2_mmu *mmu;
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  653  	int *last_ran;
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  654  
fce886a6020734 arch/arm64/kvm/arm.c Quentin Perret    2024-12-18  655  	if (is_protected_kvm_enabled())
fce886a6020734 arch/arm64/kvm/arm.c Quentin Perret    2024-12-18  656  		goto nommu;
fce886a6020734 arch/arm64/kvm/arm.c Quentin Perret    2024-12-18  657  
4f128f8e1aaac1 arch/arm64/kvm/arm.c Marc Zyngier      2024-06-14  658  	if (vcpu_has_nv(vcpu))
4f128f8e1aaac1 arch/arm64/kvm/arm.c Marc Zyngier      2024-06-14  659  		kvm_vcpu_load_hw_mmu(vcpu);
4f128f8e1aaac1 arch/arm64/kvm/arm.c Marc Zyngier      2024-06-14  660  
a0e50aa3f4a8a5 arch/arm64/kvm/arm.c Christoffer Dall  2019-01-04  661  	mmu = vcpu->arch.hw_mmu;
a0e50aa3f4a8a5 arch/arm64/kvm/arm.c Christoffer Dall  2019-01-04  662  	last_ran = this_cpu_ptr(mmu->last_vcpu_ran);
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  663  
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  664  	/*
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  665  	 * Ensure a VMID is allocated for the MMU before programming VTTBR_EL2,
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  666  	 * which happens eagerly in VHE.
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  667  	 *
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  668  	 * Also, the VMID allocator only preserves VMIDs that are active at the
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  669  	 * time of rollover, so KVM might need to grab a new VMID for the MMU if
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  670  	 * this is called from kvm_sched_in().
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  671  	 */
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  672  	kvm_arm_vmid_update(&mmu->vmid);
fa808ed4e199ed arch/arm64/kvm/arm.c Oliver Upton      2025-02-19  673  
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  674  	/*
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier      2021-03-03  675  	 * We guarantee that both TLBs and I-cache are private to each
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier      2021-03-03  676  	 * vcpu. If detecting that a vcpu from the same VM has
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier      2021-03-03  677  	 * previously run on the same physical CPU, call into the
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier      2021-03-03  678  	 * hypervisor code to nuke the relevant contexts.
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier      2021-03-03  679  	 *
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  680  	 * We might get preempted before the vCPU actually runs, but
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  681  	 * over-invalidation doesn't affect correctness.
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  682  	 */
5f4bd815ec7189 arch/arm64/kvm/arm.c Marc Zyngier      2023-09-27  683  	if (*last_ran != vcpu->vcpu_idx) {
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier      2021-03-03  684  		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
5f4bd815ec7189 arch/arm64/kvm/arm.c Marc Zyngier      2023-09-27  685  		*last_ran = vcpu->vcpu_idx;
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  686  	}
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier      2016-10-18  687  
fce886a6020734 arch/arm64/kvm/arm.c Quentin Perret    2024-12-18  688  nommu:
86ce85352f0da7 arch/arm/kvm/arm.c   Christoffer Dall  2013-01-20  689  	vcpu->cpu = cpu;
5b3e5e5bf230f5 arch/arm/kvm/arm.c   Christoffer Dall  2013-01-20  690  
16abeb60be621a arch/arm64/kvm/arm.c Marc Zyngier      2025-02-25  691  	/*
16abeb60be621a arch/arm64/kvm/arm.c Marc Zyngier      2025-02-25  692  	 * The timer must be loaded before the vgic to correctly set up physical
16abeb60be621a arch/arm64/kvm/arm.c Marc Zyngier      2025-02-25  693  	 * interrupt deactivation in nested state (e.g. timer interrupt).
16abeb60be621a arch/arm64/kvm/arm.c Marc Zyngier      2025-02-25  694  	 */
b103cc3f10c06f virt/kvm/arm/arm.c   Christoffer Dall  2016-10-16  695  	kvm_timer_vcpu_load(vcpu);
16abeb60be621a arch/arm64/kvm/arm.c Marc Zyngier      2025-02-25  696  	kvm_vgic_load(vcpu);
cd9b10102ae38b arch/arm64/kvm/arm.c Oliver Upton      2024-12-19  697  	kvm_vcpu_load_debug(vcpu);
85592114ffda56 arch/arm64/kvm/arm.c Alexandru Elisei  2025-11-12  698  	kvm_vcpu_load_fgt(vcpu);
13aeb9b400c5d7 arch/arm64/kvm/arm.c David Brazdil     2020-06-25  699  	if (has_vhe())
27cde4c0fe28ea arch/arm64/kvm/arm.c Oliver Upton      2023-10-18  700  		kvm_vcpu_load_vhe(vcpu);
e6b673b741ea0d virt/kvm/arm/arm.c   Dave Martin       2018-04-06  701  	kvm_arch_vcpu_load_fp(vcpu);
435e53fb5e21ad virt/kvm/arm/arm.c   Andrew Murray     2019-04-09  702  	kvm_vcpu_pmu_restore_guest(vcpu);
8564d6372a7d8a virt/kvm/arm/arm.c   Steven Price      2019-10-21  703  	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
8564d6372a7d8a virt/kvm/arm/arm.c   Steven Price      2019-10-21  704  		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
de73708915adc1 virt/kvm/arm/arm.c   Marc Zyngier      2018-06-21  705  
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  706  	if (kvm_vcpu_should_clear_twe(vcpu))
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  707  		vcpu->arch.hcr_el2 &= ~HCR_TWE;
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  708  	else
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  709  		vcpu->arch.hcr_el2 |= HCR_TWE;
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  710  
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  711  	if (kvm_vcpu_should_clear_twi(vcpu))
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  712  		vcpu->arch.hcr_el2 &= ~HCR_TWI;
de73708915adc1 virt/kvm/arm/arm.c   Marc Zyngier      2018-06-21  713  	else
0b5afe05377d79 arch/arm64/kvm/arm.c Colton Lewis      2024-05-23  714  		vcpu->arch.hcr_el2 |= HCR_TWI;
384b40caa8afae virt/kvm/arm/arm.c   Mark Rutland      2019-04-23  715  
814ad8f96e929f arch/arm64/kvm/arm.c Marc Zyngier      2024-04-19  716  	vcpu_set_pauth_traps(vcpu);
814ad8f96e929f arch/arm64/kvm/arm.c Marc Zyngier      2024-04-19  717  
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  718  	if (is_protected_kvm_enabled()) {
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  719  		kvm_call_hyp_nvhe(__pkvm_vcpu_load,
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  720  				  vcpu->kvm->arch.pkvm.handle,
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  721  				  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  722  		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  723  			     &vcpu->arch.vgic_cpu.vgic_v3);
f7d03fcbf1f482 arch/arm64/kvm/arm.c Marc Zyngier      2024-12-18  724  	}
583cda1b0e7d5d arch/arm64/kvm/arm.c Alexandru Elisei  2022-01-27  725  
1ba11daef0a9b0 arch/arm64/kvm/arm.c Shaoqin Huang     2023-07-27  726  	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
583cda1b0e7d5d arch/arm64/kvm/arm.c Alexandru Elisei  2022-01-27  727  		vcpu_set_on_unsupported_cpu(vcpu);
696dfec22b8e4a arch/arm64/kvm/arm.c Vincent Donnefort 2026-03-09  728  
696dfec22b8e4a arch/arm64/kvm/arm.c Vincent Donnefort 2026-03-09 @729  	vcpu->arch.pid = pid_nr(vcpu->pid);
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall  2013-01-20  730  }
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall  2013-01-20  731  

:::::: The code at line 729 was first introduced by commit
:::::: 696dfec22b8e4ac57cc90558af2b6be2b37f4b95 KVM: arm64: Add hyp_enter/hyp_exit events to nVHE/pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
