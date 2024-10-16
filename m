Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622CD13632B;
	Wed, 16 Oct 2024 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046611; cv=none; b=JMVrF7SccyK4Fa081D0o9qPs5KrvkkK1dvn7yQDSc4ctnw1VIgdxyl60F7bb7mt4yn7CX/IuFQZmqxEILh2irt6M6MFrp7dBdTzUhH5G6Zs5togtRXwYnHKcnkE8jWSoh7JQIBmPkEEs7oC8gG29aYeDHDyZTbl0K+uJ7tgMcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046611; c=relaxed/simple;
	bh=TKtDJnPGGfnUSs+xo772isTQiEL5aHUTNYB+jaiOWD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6r+CXWT/IJQTOD44vpw4kFl2ebDo8DlYnKYCAjLyZpteGe5R7B5jMoEWODDuFCn7W2EdE0O4Mj2rZJPIzM02j9G3l0e1Qrn+qGLKoFfDNxrm/BXpIMPteCs/6FFeHl+5jyzlS3qkQdNlSBlAzMUy38+CuBQCjSqQUR3Uf26Co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rn9xynfZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rn9xynfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729046610; x=1760582610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKtDJnPGGfnUSs+xo772isTQiEL5aHUTNYB+jaiOWD8=;
  b=Rn9xynfZpJ9f0VrplIyinG+QyLwpGIcj/WEOAjr7ldBQPsS4nnwEnh9w
   P7M9/T8DUSewXx4Sqvz3Ufy1l4DSEzUin/8zIJpDfjHCr4gLXK9Z9B3jJ
   79KHgZ6gxUQ/nAm++dxYE9IKYQ4w8xsEv7EjRoq++YTRQ893X9vB6DPMG
   8FuwpOeHSCSaj0FSokCQgdAcUw7sUiSfwEkt91z/TflJhV3bZ1t8DrNVd
   +FJC8Gyb8Uul94+qpIgl2+53LYEqQ4czjYH8+cTlDELjgB1fddWHjdgKP
   Q6vreuyHJWbj/HzDOYCRtvmhWVFavRSDBEEcoEaFuMoCrIkME3HwhlMIB
   A==;
X-CSE-ConnectionGUID: 9lIPEaI1SxSLB6VqqcaXTA==
X-CSE-MsgGUID: jdFoP7O7Q/qzPt+xlqeEtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32168793"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32168793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 19:43:29 -0700
X-CSE-ConnectionGUID: DrcW0aFVRaSj4dU2X3MNWw==
X-CSE-MsgGUID: q7/QlHVpQpaOj8oROvsiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="82063702"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2024 19:43:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0u0T-000KBW-0a;
	Wed, 16 Oct 2024 02:43:25 +0000
Date: Wed, 16 Oct 2024 10:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/cleanup_apic_set_base 8/9] arch/x86/kvm/x86.c:3861:39:
 error: member reference type 'u32' (aka 'unsigned int') is not a pointer
Message-ID: <202410161016.Fz8psLlK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/cleanup_apic_set_base
head:   3d77076f373be180e3920953e0ca9d641aeea547
commit: d9373d770b41ab420ff2c59d39cbbac60915a06e [8/9] KVM: x86: Unpack msr_data structure prior to calling kvm_apic_set_base()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241016/202410161016.Fz8psLlK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161016.Fz8psLlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161016.Fz8psLlK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:3861:39: error: member reference type 'u32' (aka 'unsigned int') is not a pointer
    3861 |                 return kvm_apic_set_base(vcpu, msr->data, msr->host_initiated);
         |                                                ~~~  ^
   arch/x86/kvm/x86.c:3861:50: error: member reference type 'u32' (aka 'unsigned int') is not a pointer
    3861 |                 return kvm_apic_set_base(vcpu, msr->data, msr->host_initiated);
         |                                                           ~~~  ^
   2 errors generated.


vim +3861 arch/x86/kvm/x86.c

  3739	
  3740	int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
  3741	{
  3742		u32 msr = msr_info->index;
  3743		u64 data = msr_info->data;
  3744	
  3745		if (msr && msr == vcpu->kvm->arch.xen_hvm_config.msr)
  3746			return kvm_xen_write_hypercall_page(vcpu, data);
  3747	
  3748		switch (msr) {
  3749		case MSR_AMD64_NB_CFG:
  3750		case MSR_IA32_UCODE_WRITE:
  3751		case MSR_VM_HSAVE_PA:
  3752		case MSR_AMD64_PATCH_LOADER:
  3753		case MSR_AMD64_BU_CFG2:
  3754		case MSR_AMD64_DC_CFG:
  3755		case MSR_AMD64_TW_CFG:
  3756		case MSR_F15H_EX_CFG:
  3757			break;
  3758	
  3759		case MSR_IA32_UCODE_REV:
  3760			if (msr_info->host_initiated)
  3761				vcpu->arch.microcode_version = data;
  3762			break;
  3763		case MSR_IA32_ARCH_CAPABILITIES:
  3764			if (!msr_info->host_initiated)
  3765				return 1;
  3766			vcpu->arch.arch_capabilities = data;
  3767			break;
  3768		case MSR_IA32_PERF_CAPABILITIES:
  3769			if (!msr_info->host_initiated)
  3770				return 1;
  3771			if (data & ~kvm_caps.supported_perf_cap)
  3772				return 1;
  3773	
  3774			/*
  3775			 * Note, this is not just a performance optimization!  KVM
  3776			 * disallows changing feature MSRs after the vCPU has run; PMU
  3777			 * refresh will bug the VM if called after the vCPU has run.
  3778			 */
  3779			if (vcpu->arch.perf_capabilities == data)
  3780				break;
  3781	
  3782			vcpu->arch.perf_capabilities = data;
  3783			kvm_pmu_refresh(vcpu);
  3784			break;
  3785		case MSR_IA32_PRED_CMD: {
  3786			u64 reserved_bits = ~(PRED_CMD_IBPB | PRED_CMD_SBPB);
  3787	
  3788			if (!msr_info->host_initiated) {
  3789				if ((!guest_has_pred_cmd_msr(vcpu)))
  3790					return 1;
  3791	
  3792				if (!guest_cpuid_has(vcpu, X86_FEATURE_SPEC_CTRL) &&
  3793				    !guest_cpuid_has(vcpu, X86_FEATURE_AMD_IBPB))
  3794					reserved_bits |= PRED_CMD_IBPB;
  3795	
  3796				if (!guest_cpuid_has(vcpu, X86_FEATURE_SBPB))
  3797					reserved_bits |= PRED_CMD_SBPB;
  3798			}
  3799	
  3800			if (!boot_cpu_has(X86_FEATURE_IBPB))
  3801				reserved_bits |= PRED_CMD_IBPB;
  3802	
  3803			if (!boot_cpu_has(X86_FEATURE_SBPB))
  3804				reserved_bits |= PRED_CMD_SBPB;
  3805	
  3806			if (data & reserved_bits)
  3807				return 1;
  3808	
  3809			if (!data)
  3810				break;
  3811	
  3812			wrmsrl(MSR_IA32_PRED_CMD, data);
  3813			break;
  3814		}
  3815		case MSR_IA32_FLUSH_CMD:
  3816			if (!msr_info->host_initiated &&
  3817			    !guest_cpuid_has(vcpu, X86_FEATURE_FLUSH_L1D))
  3818				return 1;
  3819	
  3820			if (!boot_cpu_has(X86_FEATURE_FLUSH_L1D) || (data & ~L1D_FLUSH))
  3821				return 1;
  3822			if (!data)
  3823				break;
  3824	
  3825			wrmsrl(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
  3826			break;
  3827		case MSR_EFER:
  3828			return set_efer(vcpu, msr_info);
  3829		case MSR_K7_HWCR:
  3830			data &= ~(u64)0x40;	/* ignore flush filter disable */
  3831			data &= ~(u64)0x100;	/* ignore ignne emulation enable */
  3832			data &= ~(u64)0x8;	/* ignore TLB cache disable */
  3833	
  3834			/*
  3835			 * Allow McStatusWrEn and TscFreqSel. (Linux guests from v3.2
  3836			 * through at least v6.6 whine if TscFreqSel is clear,
  3837			 * depending on F/M/S.
  3838			 */
  3839			if (data & ~(BIT_ULL(18) | BIT_ULL(24))) {
  3840				kvm_pr_unimpl_wrmsr(vcpu, msr, data);
  3841				return 1;
  3842			}
  3843			vcpu->arch.msr_hwcr = data;
  3844			break;
  3845		case MSR_FAM10H_MMIO_CONF_BASE:
  3846			if (data != 0) {
  3847				kvm_pr_unimpl_wrmsr(vcpu, msr, data);
  3848				return 1;
  3849			}
  3850			break;
  3851		case MSR_IA32_CR_PAT:
  3852			if (!kvm_pat_valid(data))
  3853				return 1;
  3854	
  3855			vcpu->arch.pat = data;
  3856			break;
  3857		case MTRRphysBase_MSR(0) ... MSR_MTRRfix4K_F8000:
  3858		case MSR_MTRRdefType:
  3859			return kvm_mtrr_set_msr(vcpu, msr, data);
  3860		case MSR_IA32_APICBASE:
> 3861			return kvm_apic_set_base(vcpu, msr->data, msr->host_initiated);
  3862		case APIC_BASE_MSR ... APIC_BASE_MSR + 0xff:
  3863			return kvm_x2apic_msr_write(vcpu, msr, data);
  3864		case MSR_IA32_TSC_DEADLINE:
  3865			kvm_set_lapic_tscdeadline_msr(vcpu, data);
  3866			break;
  3867		case MSR_IA32_TSC_ADJUST:
  3868			if (guest_cpuid_has(vcpu, X86_FEATURE_TSC_ADJUST)) {
  3869				if (!msr_info->host_initiated) {
  3870					s64 adj = data - vcpu->arch.ia32_tsc_adjust_msr;
  3871					adjust_tsc_offset_guest(vcpu, adj);
  3872					/* Before back to guest, tsc_timestamp must be adjusted
  3873					 * as well, otherwise guest's percpu pvclock time could jump.
  3874					 */
  3875					kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
  3876				}
  3877				vcpu->arch.ia32_tsc_adjust_msr = data;
  3878			}
  3879			break;
  3880		case MSR_IA32_MISC_ENABLE: {
  3881			u64 old_val = vcpu->arch.ia32_misc_enable_msr;
  3882	
  3883			if (!msr_info->host_initiated) {
  3884				/* RO bits */
  3885				if ((old_val ^ data) & MSR_IA32_MISC_ENABLE_PMU_RO_MASK)
  3886					return 1;
  3887	
  3888				/* R bits, i.e. writes are ignored, but don't fault. */
  3889				data = data & ~MSR_IA32_MISC_ENABLE_EMON;
  3890				data |= old_val & MSR_IA32_MISC_ENABLE_EMON;
  3891			}
  3892	
  3893			if (!kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_MISC_ENABLE_NO_MWAIT) &&
  3894			    ((old_val ^ data)  & MSR_IA32_MISC_ENABLE_MWAIT)) {
  3895				if (!guest_cpuid_has(vcpu, X86_FEATURE_XMM3))
  3896					return 1;
  3897				vcpu->arch.ia32_misc_enable_msr = data;
  3898				kvm_update_cpuid_runtime(vcpu);
  3899			} else {
  3900				vcpu->arch.ia32_misc_enable_msr = data;
  3901			}
  3902			break;
  3903		}
  3904		case MSR_IA32_SMBASE:
  3905			if (!IS_ENABLED(CONFIG_KVM_SMM) || !msr_info->host_initiated)
  3906				return 1;
  3907			vcpu->arch.smbase = data;
  3908			break;
  3909		case MSR_IA32_POWER_CTL:
  3910			vcpu->arch.msr_ia32_power_ctl = data;
  3911			break;
  3912		case MSR_IA32_TSC:
  3913			if (msr_info->host_initiated) {
  3914				kvm_synchronize_tsc(vcpu, &data);
  3915			} else {
  3916				u64 adj = kvm_compute_l1_tsc_offset(vcpu, data) - vcpu->arch.l1_tsc_offset;
  3917				adjust_tsc_offset_guest(vcpu, adj);
  3918				vcpu->arch.ia32_tsc_adjust_msr += adj;
  3919			}
  3920			break;
  3921		case MSR_IA32_XSS:
  3922			if (!msr_info->host_initiated &&
  3923			    !guest_cpuid_has(vcpu, X86_FEATURE_XSAVES))
  3924				return 1;
  3925			/*
  3926			 * KVM supports exposing PT to the guest, but does not support
  3927			 * IA32_XSS[bit 8]. Guests have to use RDMSR/WRMSR rather than
  3928			 * XSAVES/XRSTORS to save/restore PT MSRs.
  3929			 */
  3930			if (data & ~kvm_caps.supported_xss)
  3931				return 1;
  3932			vcpu->arch.ia32_xss = data;
  3933			kvm_update_cpuid_runtime(vcpu);
  3934			break;
  3935		case MSR_SMI_COUNT:
  3936			if (!msr_info->host_initiated)
  3937				return 1;
  3938			vcpu->arch.smi_count = data;
  3939			break;
  3940		case MSR_KVM_WALL_CLOCK_NEW:
  3941			if (!guest_pv_has(vcpu, KVM_FEATURE_CLOCKSOURCE2))
  3942				return 1;
  3943	
  3944			vcpu->kvm->arch.wall_clock = data;
  3945			kvm_write_wall_clock(vcpu->kvm, data, 0);
  3946			break;
  3947		case MSR_KVM_WALL_CLOCK:
  3948			if (!guest_pv_has(vcpu, KVM_FEATURE_CLOCKSOURCE))
  3949				return 1;
  3950	
  3951			vcpu->kvm->arch.wall_clock = data;
  3952			kvm_write_wall_clock(vcpu->kvm, data, 0);
  3953			break;
  3954		case MSR_KVM_SYSTEM_TIME_NEW:
  3955			if (!guest_pv_has(vcpu, KVM_FEATURE_CLOCKSOURCE2))
  3956				return 1;
  3957	
  3958			kvm_write_system_time(vcpu, data, false, msr_info->host_initiated);
  3959			break;
  3960		case MSR_KVM_SYSTEM_TIME:
  3961			if (!guest_pv_has(vcpu, KVM_FEATURE_CLOCKSOURCE))
  3962				return 1;
  3963	
  3964			kvm_write_system_time(vcpu, data, true,  msr_info->host_initiated);
  3965			break;
  3966		case MSR_KVM_ASYNC_PF_EN:
  3967			if (!guest_pv_has(vcpu, KVM_FEATURE_ASYNC_PF))
  3968				return 1;
  3969	
  3970			if (kvm_pv_enable_async_pf(vcpu, data))
  3971				return 1;
  3972			break;
  3973		case MSR_KVM_ASYNC_PF_INT:
  3974			if (!guest_pv_has(vcpu, KVM_FEATURE_ASYNC_PF_INT))
  3975				return 1;
  3976	
  3977			if (kvm_pv_enable_async_pf_int(vcpu, data))
  3978				return 1;
  3979			break;
  3980		case MSR_KVM_ASYNC_PF_ACK:
  3981			if (!guest_pv_has(vcpu, KVM_FEATURE_ASYNC_PF_INT))
  3982				return 1;
  3983			if (data & 0x1) {
  3984				vcpu->arch.apf.pageready_pending = false;
  3985				kvm_check_async_pf_completion(vcpu);
  3986			}
  3987			break;
  3988		case MSR_KVM_STEAL_TIME:
  3989			if (!guest_pv_has(vcpu, KVM_FEATURE_STEAL_TIME))
  3990				return 1;
  3991	
  3992			if (unlikely(!sched_info_on()))
  3993				return 1;
  3994	
  3995			if (data & KVM_STEAL_RESERVED_MASK)
  3996				return 1;
  3997	
  3998			vcpu->arch.st.msr_val = data;
  3999	
  4000			if (!(data & KVM_MSR_ENABLED))
  4001				break;
  4002	
  4003			kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
  4004	
  4005			break;
  4006		case MSR_KVM_PV_EOI_EN:
  4007			if (!guest_pv_has(vcpu, KVM_FEATURE_PV_EOI))
  4008				return 1;
  4009	
  4010			if (kvm_lapic_set_pv_eoi(vcpu, data, sizeof(u8)))
  4011				return 1;
  4012			break;
  4013	
  4014		case MSR_KVM_POLL_CONTROL:
  4015			if (!guest_pv_has(vcpu, KVM_FEATURE_POLL_CONTROL))
  4016				return 1;
  4017	
  4018			/* only enable bit supported */
  4019			if (data & (-1ULL << 1))
  4020				return 1;
  4021	
  4022			vcpu->arch.msr_kvm_poll_control = data;
  4023			break;
  4024	
  4025		case MSR_IA32_MCG_CTL:
  4026		case MSR_IA32_MCG_STATUS:
  4027		case MSR_IA32_MC0_CTL ... MSR_IA32_MCx_CTL(KVM_MAX_MCE_BANKS) - 1:
  4028		case MSR_IA32_MC0_CTL2 ... MSR_IA32_MCx_CTL2(KVM_MAX_MCE_BANKS) - 1:
  4029			return set_msr_mce(vcpu, msr_info);
  4030	
  4031		case MSR_K7_PERFCTR0 ... MSR_K7_PERFCTR3:
  4032		case MSR_P6_PERFCTR0 ... MSR_P6_PERFCTR1:
  4033		case MSR_K7_EVNTSEL0 ... MSR_K7_EVNTSEL3:
  4034		case MSR_P6_EVNTSEL0 ... MSR_P6_EVNTSEL1:
  4035			if (kvm_pmu_is_valid_msr(vcpu, msr))
  4036				return kvm_pmu_set_msr(vcpu, msr_info);
  4037	
  4038			if (data)
  4039				kvm_pr_unimpl_wrmsr(vcpu, msr, data);
  4040			break;
  4041		case MSR_K7_CLK_CTL:
  4042			/*
  4043			 * Ignore all writes to this no longer documented MSR.
  4044			 * Writes are only relevant for old K7 processors,
  4045			 * all pre-dating SVM, but a recommended workaround from
  4046			 * AMD for these chips. It is possible to specify the
  4047			 * affected processor models on the command line, hence
  4048			 * the need to ignore the workaround.
  4049			 */
  4050			break;
  4051	#ifdef CONFIG_KVM_HYPERV
  4052		case HV_X64_MSR_GUEST_OS_ID ... HV_X64_MSR_SINT15:
  4053		case HV_X64_MSR_SYNDBG_CONTROL ... HV_X64_MSR_SYNDBG_PENDING_BUFFER:
  4054		case HV_X64_MSR_SYNDBG_OPTIONS:
  4055		case HV_X64_MSR_CRASH_P0 ... HV_X64_MSR_CRASH_P4:
  4056		case HV_X64_MSR_CRASH_CTL:
  4057		case HV_X64_MSR_STIMER0_CONFIG ... HV_X64_MSR_STIMER3_COUNT:
  4058		case HV_X64_MSR_REENLIGHTENMENT_CONTROL:
  4059		case HV_X64_MSR_TSC_EMULATION_CONTROL:
  4060		case HV_X64_MSR_TSC_EMULATION_STATUS:
  4061		case HV_X64_MSR_TSC_INVARIANT_CONTROL:
  4062			return kvm_hv_set_msr_common(vcpu, msr, data,
  4063						     msr_info->host_initiated);
  4064	#endif
  4065		case MSR_IA32_BBL_CR_CTL3:
  4066			/* Drop writes to this legacy MSR -- see rdmsr
  4067			 * counterpart for further detail.
  4068			 */
  4069			kvm_pr_unimpl_wrmsr(vcpu, msr, data);
  4070			break;
  4071		case MSR_AMD64_OSVW_ID_LENGTH:
  4072			if (!guest_cpuid_has(vcpu, X86_FEATURE_OSVW))
  4073				return 1;
  4074			vcpu->arch.osvw.length = data;
  4075			break;
  4076		case MSR_AMD64_OSVW_STATUS:
  4077			if (!guest_cpuid_has(vcpu, X86_FEATURE_OSVW))
  4078				return 1;
  4079			vcpu->arch.osvw.status = data;
  4080			break;
  4081		case MSR_PLATFORM_INFO:
  4082			if (!msr_info->host_initiated ||
  4083			    (!(data & MSR_PLATFORM_INFO_CPUID_FAULT) &&
  4084			     cpuid_fault_enabled(vcpu)))
  4085				return 1;
  4086			vcpu->arch.msr_platform_info = data;
  4087			break;
  4088		case MSR_MISC_FEATURES_ENABLES:
  4089			if (data & ~MSR_MISC_FEATURES_ENABLES_CPUID_FAULT ||
  4090			    (data & MSR_MISC_FEATURES_ENABLES_CPUID_FAULT &&
  4091			     !supports_cpuid_fault(vcpu)))
  4092				return 1;
  4093			vcpu->arch.msr_misc_features_enables = data;
  4094			break;
  4095	#ifdef CONFIG_X86_64
  4096		case MSR_IA32_XFD:
  4097			if (!msr_info->host_initiated &&
  4098			    !guest_cpuid_has(vcpu, X86_FEATURE_XFD))
  4099				return 1;
  4100	
  4101			if (data & ~kvm_guest_supported_xfd(vcpu))
  4102				return 1;
  4103	
  4104			fpu_update_guest_xfd(&vcpu->arch.guest_fpu, data);
  4105			break;
  4106		case MSR_IA32_XFD_ERR:
  4107			if (!msr_info->host_initiated &&
  4108			    !guest_cpuid_has(vcpu, X86_FEATURE_XFD))
  4109				return 1;
  4110	
  4111			if (data & ~kvm_guest_supported_xfd(vcpu))
  4112				return 1;
  4113	
  4114			vcpu->arch.guest_fpu.xfd_err = data;
  4115			break;
  4116	#endif
  4117		default:
  4118			if (kvm_pmu_is_valid_msr(vcpu, msr))
  4119				return kvm_pmu_set_msr(vcpu, msr_info);
  4120	
  4121			return KVM_MSR_RET_UNSUPPORTED;
  4122		}
  4123		return 0;
  4124	}
  4125	EXPORT_SYMBOL_GPL(kvm_set_msr_common);
  4126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
