Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14328642B;
	Sat,  9 May 2026 01:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291727; cv=none; b=JIgo/pMm0C7YP5ejV4yXRNddFzA4znTxVlSlJjNOQhzqswQEj2m8H5sP/r74mpZ86A0LqOb6TUq6ntrPGCD62RjvTP1iKTjjufXAdjRVzuFyKy+tQ7WCiyw+mSFHq2UBuHehSUsioWYXcSEOX5YPf79vQUWmb0ynbk9rcgZKkUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291727; c=relaxed/simple;
	bh=Kw0RO+eiFZhUn/zV+t4jeIWosgshjjWOgr/phwHrfwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uf0FbbjA9I2SoPZ1UEbcyotU7qH2Yj3Z18hbRebWgcg5VeVhD/lHRfLhpd4dcwAn/CRPxf4ji9NOyJ1zYiHI12tZSmv/0UUI8i1lkL240ausmwvtoKi6gdidRwOjryYzNjf/6JrZUNr20A5tljkH1VAsh/HfN83Q4yKal8KBglk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoGOnuHa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoGOnuHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778291726; x=1809827726;
  h=date:from:to:cc:subject:message-id;
  bh=Kw0RO+eiFZhUn/zV+t4jeIWosgshjjWOgr/phwHrfwo=;
  b=PoGOnuHa324KChqRsN2p9WgRznqF8Edd8Fsj9mThAnopy01agig/1S7v
   bVqsUT0L84PC0yCSIIdASKPYaZHvMFukx+1Ihu1Lkt8czJ5qA/p3ncnQm
   OwItAmJl5NuSyBXCKnzoP5edepAGxYlECjnx0M/WTNhGGGSYGrmR+FQfB
   kLF5jEtMSxiuw6fmGl3+p5XFirpvFKMoDunT/3jQm8Kmgk35tAWGnUsxh
   ybH1sV9fAhGs/h172r8Seu6CnBrknXeiPfFZxit+VELKYy9SBcuSZlQLJ
   RPezY/KEVtCsqA/R/VXBwCPnMmSjhX+b6CuG+EKfztGFiRyNIdpblFvkD
   g==;
X-CSE-ConnectionGUID: 2k2gfqPGS9Siyuq1gpMl4w==
X-CSE-MsgGUID: QVGC2lEbSWGuw3M0PAQ49A==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="82888084"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="82888084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 18:55:22 -0700
X-CSE-ConnectionGUID: hjRG7uMwS5u9HtG+heT27A==
X-CSE-MsgGUID: ZTSthF4MTCugAto2lsz71w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="267289944"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2026 18:55:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLWuT-000000007LB-4BVH;
	Sat, 09 May 2026 01:55:18 +0000
Date: Sat, 09 May 2026 03:54:29 +0200
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/x86/kvm/svm/svm.c:4420:29: error: incompatible pointer
 types passing 'struct vcpu_svm *' to parameter of type 'struct kvm_vcpu *'
Message-ID: <202605090322.jewEa3qV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-VMX-remove-regs-argument-of-__vmx_vcpu_run/20260428-090305
head:   378da5f53c88c2b23c10a61661e0baef8bb1a003
commit: 65fe349d412fcfe5ba9e01bdedd07c48585e35bf KVM: SVM: adopt the same VMX_RUN_* flags as VMX
date:   11 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260509/202605090322.jewEa3qV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090322.jewEa3qV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090322.jewEa3qV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:4420:29: error: incompatible pointer types passing 'struct vcpu_svm *' to parameter of type 'struct kvm_vcpu *' [-Werror,-Wincompatible-pointer-types]
    4420 |         if (!msr_write_intercepted(svm, MSR_IA32_SPEC_CTRL))
         |                                    ^~~
   arch/x86/kvm/svm/svm.c:665:52: note: passing argument to parameter 'vcpu' here
     665 | static bool msr_write_intercepted(struct kvm_vcpu *vcpu, u32 msr)
         |                                                    ^
   1 error generated.


vim +4420 arch/x86/kvm/svm/svm.c

  4413	
  4414	static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
  4415	{
  4416		bool force_immediate_exit = run_flags & KVM_RUN_FORCE_IMMEDIATE_EXIT;
  4417		struct vcpu_svm *svm = to_svm(vcpu);
  4418		unsigned enter_flags = 0;
  4419	
> 4420		if (!msr_write_intercepted(svm, MSR_IA32_SPEC_CTRL))
  4421			enter_flags |= KVM_ENTER_SAVE_SPEC_CTRL;
  4422	
  4423		trace_kvm_entry(vcpu, force_immediate_exit);
  4424	
  4425		svm->vmcb->save.rax = vcpu->arch.regs[VCPU_REGS_RAX];
  4426		svm->vmcb->save.rsp = vcpu->arch.regs[VCPU_REGS_RSP];
  4427		svm->vmcb->save.rip = vcpu->arch.regs[VCPU_REGS_RIP];
  4428	
  4429		/*
  4430		 * Disable singlestep if we're injecting an interrupt/exception.
  4431		 * We don't want our modified rflags to be pushed on the stack where
  4432		 * we might not be able to easily reset them if we disabled NMI
  4433		 * singlestep later.
  4434		 */
  4435		if (svm->nmi_singlestep && svm->vmcb->control.event_inj) {
  4436			/*
  4437			 * Event injection happens before external interrupts cause a
  4438			 * vmexit and interrupts are disabled here, so smp_send_reschedule
  4439			 * is enough to force an immediate vmexit.
  4440			 */
  4441			disable_nmi_singlestep(svm);
  4442			force_immediate_exit = true;
  4443		}
  4444	
  4445		if (force_immediate_exit)
  4446			smp_send_reschedule(vcpu->cpu);
  4447	
  4448		if (pre_svm_run(vcpu)) {
  4449			vcpu->run->exit_reason = KVM_EXIT_FAIL_ENTRY;
  4450			vcpu->run->fail_entry.hardware_entry_failure_reason = SVM_EXIT_ERR;
  4451			vcpu->run->fail_entry.cpu = vcpu->cpu;
  4452			return EXIT_FASTPATH_EXIT_USERSPACE;
  4453		}
  4454	
  4455		sync_lapic_to_cr8(vcpu);
  4456	
  4457		if (unlikely(svm->asid != svm->vmcb->control.asid)) {
  4458			svm->vmcb->control.asid = svm->asid;
  4459			vmcb_mark_dirty(svm->vmcb, VMCB_ASID);
  4460		}
  4461		svm->vmcb->save.cr2 = vcpu->arch.cr2;
  4462	
  4463		if (guest_cpu_cap_has(vcpu, X86_FEATURE_ERAPS) &&
  4464		    kvm_register_is_dirty(vcpu, VCPU_EXREG_ERAPS))
  4465			svm->vmcb->control.erap_ctl |= ERAP_CONTROL_CLEAR_RAP;
  4466	
  4467		svm_fixup_nested_rips(vcpu);
  4468	
  4469		svm_hv_update_vp_id(svm->vmcb, vcpu);
  4470	
  4471		/*
  4472		 * Run with all-zero DR6 unless the guest can write DR6 freely, so that
  4473		 * KVM can get the exact cause of a #DB.  Note, loading guest DR6 from
  4474		 * KVM's snapshot is only necessary when DR accesses won't exit.
  4475		 */
  4476		if (unlikely(run_flags & KVM_RUN_LOAD_GUEST_DR6))
  4477			svm_set_dr6(vcpu, vcpu->arch.dr6);
  4478		else if (likely(!(vcpu->arch.switch_db_regs & KVM_DEBUGREG_WONT_EXIT)))
  4479			svm_set_dr6(vcpu, DR6_ACTIVE_LOW);
  4480	
  4481		clgi();
  4482	
  4483		/*
  4484		 * Hardware only context switches DEBUGCTL if LBR virtualization is
  4485		 * enabled.  Manually load DEBUGCTL if necessary (and restore it after
  4486		 * VM-Exit), as running with the host's DEBUGCTL can negatively affect
  4487		 * guest state and can even be fatal, e.g. due to Bus Lock Detect.
  4488		 */
  4489		if (!(svm->vmcb->control.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR) &&
  4490		    vcpu->arch.host_debugctl != svm->vmcb->save.dbgctl)
  4491			update_debugctlmsr(svm->vmcb->save.dbgctl);
  4492	
  4493		kvm_wait_lapic_expire(vcpu);
  4494	
  4495		/*
  4496		 * If this vCPU has touched SPEC_CTRL, restore the guest's value if
  4497		 * it's non-zero. Since vmentry is serialising on affected CPUs, there
  4498		 * is no need to worry about the conditional branch over the wrmsr
  4499		 * being speculatively taken.
  4500		 */
  4501		if (!static_cpu_has(X86_FEATURE_V_SPEC_CTRL))
  4502			x86_spec_ctrl_set_guest(svm->virt_spec_ctrl);
  4503	
  4504		svm_vcpu_enter_exit(vcpu, enter_flags);
  4505	
  4506		if (!static_cpu_has(X86_FEATURE_V_SPEC_CTRL))
  4507			x86_spec_ctrl_restore_host(svm->virt_spec_ctrl);
  4508	
  4509		if (!is_sev_es_guest(vcpu)) {
  4510			vcpu->arch.cr2 = svm->vmcb->save.cr2;
  4511			vcpu->arch.regs[VCPU_REGS_RAX] = svm->vmcb->save.rax;
  4512			vcpu->arch.regs[VCPU_REGS_RSP] = svm->vmcb->save.rsp;
  4513			vcpu->arch.regs[VCPU_REGS_RIP] = svm->vmcb->save.rip;
  4514		}
  4515		vcpu->arch.regs_dirty = 0;
  4516	
  4517		if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
  4518			kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
  4519	
  4520		if (!(svm->vmcb->control.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR) &&
  4521		    vcpu->arch.host_debugctl != svm->vmcb->save.dbgctl)
  4522			update_debugctlmsr(vcpu->arch.host_debugctl);
  4523	
  4524		stgi();
  4525	
  4526		/* Any pending NMI will happen here */
  4527	
  4528		if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
  4529			kvm_after_interrupt(vcpu);
  4530	
  4531		sync_cr8_to_lapic(vcpu);
  4532	
  4533		svm->next_rip = 0;
  4534		if (is_guest_mode(vcpu)) {
  4535			nested_sync_control_from_vmcb02(svm);
  4536	
  4537			/* Track VMRUNs that have made past consistency checking */
  4538			if (vcpu->arch.nested_run_pending &&
  4539			    !svm_is_vmrun_failure(svm->vmcb->control.exit_code))
  4540	                        ++vcpu->stat.nested_run;
  4541	
  4542			vcpu->arch.nested_run_pending = 0;
  4543		}
  4544	
  4545		svm->vmcb->control.tlb_ctl = TLB_CONTROL_DO_NOTHING;
  4546	
  4547		/*
  4548		 * Unconditionally mask off the CLEAR_RAP bit, the AND is just as cheap
  4549		 * as the TEST+Jcc to avoid it.
  4550		 */
  4551		if (cpu_feature_enabled(X86_FEATURE_ERAPS))
  4552			svm->vmcb->control.erap_ctl &= ~ERAP_CONTROL_CLEAR_RAP;
  4553	
  4554		vmcb_mark_all_clean(svm->vmcb);
  4555	
  4556		/* if exit due to PF check for async PF */
  4557		if (svm->vmcb->control.exit_code == SVM_EXIT_EXCP_BASE + PF_VECTOR)
  4558			vcpu->arch.apf.host_apf_flags =
  4559				kvm_read_and_reset_apf_flags();
  4560	
  4561		vcpu->arch.regs_avail &= ~SVM_REGS_LAZY_LOAD_SET;
  4562	
  4563		if (!msr_write_intercepted(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL))
  4564			rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, vcpu_to_pmu(vcpu)->global_ctrl);
  4565	
  4566		trace_kvm_exit(vcpu, KVM_ISA_SVM);
  4567	
  4568		svm_complete_interrupts(vcpu);
  4569	
  4570		/*
  4571		 * Update the cache after completing interrupts to get an accurate
  4572		 * NextRIP, e.g. when re-injecting a soft interrupt.
  4573		 *
  4574		 * FIXME: Rework svm_get_nested_state() to not pull data from the
  4575		 *        cache (except for maybe int_ctl).
  4576		 */
  4577		if (is_guest_mode(vcpu))
  4578			svm->nested.ctl.next_rip = svm->vmcb->control.next_rip;
  4579	
  4580		return svm_exit_handlers_fastpath(vcpu);
  4581	}
  4582	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
