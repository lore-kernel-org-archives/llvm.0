Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588602;
	b=RRM6Zoi2J7ouI5emZsUu4X2aoCr1u79Z2a01TAahuYPo72EKGdOi9/1E83QadwIrnTwu
	 Ljrr5mwty3FZ62kCfur0gxnT8MS3j+KDDcOZr2D7dRgwQaTblTYKxwrEiUWEPHJ43rVPI
	 NQOggf+sMppRH0eUh9nsI0L3b06moxNJ/TPCuJ0DnUYbLfhCF/+oOlDUyBseQg48/vPTB
	 ZC2ndHuYPZTSA79xJ8rTrz2QIBVa80SfaAXBTtHrGZdmc3AErdxkyNXneLp2blbRiliUz
	 OYlMvjwFsNdTACFhA4sHQ4qE2ab83rnoYVAfqeQ6hzZq1GhpvauqVtcfLfNdLww8XLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588602;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jc2oxxmIjHptvicc8xTAVQtnPOwmR18J+TRxxT/8mZA=;
	b=e+S0AcybV8XkQjFNF7QoQhUSFqfyCQ7O680rmY/rqITO03sDLAurxXVPa8zUyrYTWyTI
	 8A/ESq6rXspPe6JnPK31M4e18QXoYiADZsc91B46WeJgYUtf10c6iBCEP90Q738HTDTWb
	 /RjgUe46SpWAUJ+Xq15IX5lmrXWazck9gc+Gq8DIiiwAncIG7iyZ09hoFQZSmfuBS2a94
	 J+7t77OzbQMmdk+2o5hhGcxmtLmpicQ/XdL2hJiNo3CpNF1Sq3I6A3rVXY2B5ek+XATbC
	 TW09jKrUm4Cx4OqE+psdCOnh3SUOZM3GSZidTwDTUydSr5jHkbnARFmG765y6HhTjAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQim9crm;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E56606BC8C;
	Fri, 13 Nov 2026 16:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E56606BC8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQim9crm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794588602; x=1826124602;
  h=date:from:to:cc:subject:message-id;
  bh=H9LIEaQ4MaJ0jN19d1MCXXPy0g089NT4+cdK7JtWLrQ=;
  b=lQim9crmNwuTBMO0z+mv02LTbIQBFS6IkhqmNGs0DexkFTWAXYaybFR0
   UAyAgJe4vvyU1o9/UswO941sd6v0dFjsgoakR7ycAicAW3EUWE6gXCY0f
   XcVBl6aCr0yymGsba79Khix7Eq3w2IVKtq0+55SavgQTvqsMyKW1bW3pQ
   XIFhmIa68F7a8rSmTuCJGBGRsdTiv31YQC7u5x4SUH7UdasrX9koTODqP
   33yg8dunDzPfqRo6WEjcf4JluQcPpcDm/5XF0sr1bms6PJTXmBkSFbT7a
   FAW3mHtvoP/lp8DDW57BNTod7SuD1vZR2zWTAWSI7QcRr1s48N1+FTxby
   g==;
X-CSE-ConnectionGUID: chF2zKmCR1+scdxMq3b56w==
X-CSE-MsgGUID: qF1E3vydRJmUzfNvegSnPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3312971"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3312971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:50:01 -0800
X-CSE-ConnectionGUID: HRUHYzbCS/e9vKqLo1QbdQ==
X-CSE-MsgGUID: hhoWoDhMTFWpnvOcSot0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8877174"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2026 08:49:59 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRuTM-000000013LP-3g3A;
	Fri, 13 Nov 2026 16:49:56 +0000
Date: Sat, 14 Nov 2026 00:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mushahid Hussain <hmushi@amazon.co.uk>
Subject: [dwmw2:vsm2/vsm-min 93/118] arch/x86/kvm/hyperv.c:3130:3:
 error: use of undeclared identifier 'VCPU_REGS_R8'
Message-ID: <202611140019.YQnzAreE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   git://git.infradead.org/users/dwmw2/linux vsm2/vsm-min
head:   a8d06a9aa5a3246bc4e618f5ccb9b6405d3084a1
commit: 778afcad05a4bb7ab0d081b64972c5880ba8788a [93/118] KVM: x86: hyper-v: Handle VTL call/return in the kernel
config: i386-randconfig-1000-20261113 (https://download.01.org/0day-ci/archive/20261114/202611140019.YQnzAreE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140019.YQnzAreE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140019.YQnzAreE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/hyperv.c:3130:3: error: use of undeclared identifier 'VCPU_REGS_R8'
    3130 |                 VCPU_REGS_R8, VCPU_REGS_R9, VCPU_REGS_R10, VCPU_REGS_R11,
         |                 ^~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3130:17: error: use of undeclared identifier 'VCPU_REGS_R9'
    3130 |                 VCPU_REGS_R8, VCPU_REGS_R9, VCPU_REGS_R10, VCPU_REGS_R11,
         |                               ^~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3130:31: error: use of undeclared identifier 'VCPU_REGS_R10'
    3130 |                 VCPU_REGS_R8, VCPU_REGS_R9, VCPU_REGS_R10, VCPU_REGS_R11,
         |                                             ^~~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3130:46: error: use of undeclared identifier 'VCPU_REGS_R11'
    3130 |                 VCPU_REGS_R8, VCPU_REGS_R9, VCPU_REGS_R10, VCPU_REGS_R11,
         |                                                            ^~~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3131:3: error: use of undeclared identifier 'VCPU_REGS_R12'
    3131 |                 VCPU_REGS_R12, VCPU_REGS_R13, VCPU_REGS_R14, VCPU_REGS_R15,
         |                 ^~~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3131:18: error: use of undeclared identifier 'VCPU_REGS_R13'
    3131 |                 VCPU_REGS_R12, VCPU_REGS_R13, VCPU_REGS_R14, VCPU_REGS_R15,
         |                                ^~~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3131:33: error: use of undeclared identifier 'VCPU_REGS_R14'
    3131 |                 VCPU_REGS_R12, VCPU_REGS_R13, VCPU_REGS_R14, VCPU_REGS_R15,
         |                                               ^~~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3131:48: error: use of undeclared identifier 'VCPU_REGS_R15'
    3131 |                 VCPU_REGS_R12, VCPU_REGS_R13, VCPU_REGS_R14, VCPU_REGS_R15,
         |                                                              ^~~~~~~~~~~~~
>> arch/x86/kvm/hyperv.c:3260:18: error: invalid application of 'sizeof' to an incomplete type 'const int[]'
    3260 |         for (i = 0; i < ARRAY_SIZE(shared_gprs); i++)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   9 errors generated.


vim +/VCPU_REGS_R8 +3130 arch/x86/kvm/hyperv.c

  3110	
  3111	/*
  3112	 * In-kernel VTL call/return: switch between the plane vCPUs directly
  3113	 * instead of bouncing every transition through userspace.  Keeps the
  3114	 * userspace contract: VTL-shared register state (GPRs except RSP, CR2,
  3115	 * FPU) follows the switch, the entered VTL's assist page gets the entry
  3116	 * reason and the caller's RAX/RCX, and a non-fast VTL return restores
  3117	 * the lower VTL's RAX/RCX from the returning VTL's control area.  The
  3118	 * suspending plane stays suspended mid-hypercall: the switch that
  3119	 * re-enters it writes its resume RAX, and its pending completion then
  3120	 * only retires the vmcall.
  3121	 *
  3122	 * Returns -ENOENT when the transition cannot be handled here (no twin
  3123	 * plane); the caller forwards the hypercall to userspace unchanged.
  3124	 */
  3125	static int kvm_hv_vtl_switch(struct kvm_vcpu *vcpu, bool is_return)
  3126	{
  3127		static const int shared_gprs[] = {
  3128			VCPU_REGS_RAX, VCPU_REGS_RBX, VCPU_REGS_RCX, VCPU_REGS_RDX,
  3129			VCPU_REGS_RSI, VCPU_REGS_RDI, VCPU_REGS_RBP,
> 3130			VCPU_REGS_R8, VCPU_REGS_R9, VCPU_REGS_R10, VCPU_REGS_R11,
> 3131			VCPU_REGS_R12, VCPU_REGS_R13, VCPU_REGS_R14, VCPU_REGS_R15,
  3132		};
  3133		int cur = vcpu->plane_level;
  3134		int to = is_return ? cur - 1 : cur + 1;
  3135		u64 rax = kvm_rax_read(vcpu), rcx = kvm_rcx_read(vcpu);
  3136		bool fast = is_return && (rax & HV_VTL_RETURN_FAST_BIT);
  3137		int limit = READ_ONCE(hv_vtl_switch_limit);
  3138		struct hv_vtl_control ctl;
  3139		struct kvm_vcpu *target;
  3140		u64 assist, resume;
  3141		int i;
  3142	
  3143		if (to < 0 || to >= KVM_MAX_PLANES || !vcpu->common->vcpus[to])
  3144			return -ENOENT;
  3145		target = vcpu->common->vcpus[to];
  3146	
  3147		/*
  3148		 * A plane userspace holds stays stopped until the VMM releases it.
  3149		 * Forward the switch so userspace can apply its own policy.
  3150		 */
  3151		if (target->plane_user_hold)
  3152			return -ENOENT;
  3153	
  3154		/*
  3155		 * The resume protocol below delivers the result through the
  3156		 * target's armed hypercall completion.  A target parked on any
  3157		 * other completion (MMIO, PIO) owns the shared run union; writing
  3158		 * hcall.result over it would feed the pending completion garbage
  3159		 * and lose the resume value.  Forward such a switch to userspace.
  3160		 */
  3161		if (target->arch.complete_userspace_io &&
  3162		    target->arch.complete_userspace_io != kvm_hv_hypercall_complete_userspace)
  3163			return -ENOENT;
  3164	
  3165		/*
  3166		 * Userspace owns HvCallEnableVpVtl state; the kernel only knows a
  3167		 * plane vCPU exists, and VMMs create those at setup time.  Refuse
  3168		 * to call into a plane that has never run: it still holds reset
  3169		 * state, and only userspace knows whether its VTL was enabled.
  3170		 * Forwarding lets userspace apply its enablement tracking (and run
  3171		 * the plane's first entry itself).
  3172		 */
  3173		if (!is_return && !kvm_hv_plane_has_run(target))
  3174			return -ENOENT;
  3175	
  3176		/*
  3177		 * The FPU follows the switch as one image (see kvm_vtl_fpu_carry()).
  3178		 * KVM_SET_CPUID keeps the twins' layouts in step; should they still
  3179		 * differ, let userspace carry the state rather than lose part of it.
  3180		 */
  3181		if (!hv_vtl_fpstates_match(vcpu, target))
  3182			return -ENOENT;
  3183	
  3184		if (is_return && !fast) {
  3185			assist = hv_vtl_assist_page_gpa(vcpu);
  3186			if (assist) {
  3187				if (kvm_vcpu_read_guest(vcpu,
  3188							assist + HV_VTL_CONTROL_OFFSET,
  3189							&ctl, sizeof(ctl)))
  3190					return -ENOENT;
  3191			} else {
  3192				/*
  3193				 * No captured entry registers to restore: this plane
  3194				 * was last entered by userspace (or the capture was
  3195				 * lost across migration).  Forward the return so
  3196				 * userspace restores the lower VTL's RAX/RCX itself.
  3197				 */
  3198				if (!to_hv_vcpu(vcpu)->vtl_entry_regs_valid)
  3199					return -ENOENT;
  3200	
  3201				ctl.vtl_ret_x64rax = to_hv_vcpu(vcpu)->vtl_entry_rax;
  3202				ctl.vtl_ret_x64rcx = to_hv_vcpu(vcpu)->vtl_entry_rcx;
  3203			}
  3204		}
  3205	
  3206		/*
  3207		 * Debug budget on in-kernel switches, counted per VM.  Only a
  3208		 * switch that is actually performed consumes budget: the check
  3209		 * comes after every other reason to forward but the control-area
  3210		 * write, which gives the budget back when it fails, and the count
  3211		 * stops at the limit instead of growing past it.
  3212		 */
  3213		if (limit >= 0) {
  3214			atomic_t *count = &to_kvm_hv(vcpu->kvm)->vtl_switch_count;
  3215			int old = atomic_read(count);
  3216	
  3217			do {
  3218				if (old >= limit)
  3219					return -ENOENT;
  3220			} while (!atomic_try_cmpxchg(count, &old, old + 1));
  3221		}
  3222	
  3223		if (!is_return) {
  3224			/*
  3225			 * Write the entered VTL's control area through the entered
  3226			 * plane's vCPU: the write must pass that plane's memory
  3227			 * attributes and memslot view, and the higher VTL normally
  3228			 * protects its assist page against the caller's plane.
  3229			 * Fail before any state moves (mirroring the read above);
  3230			 * userspace then owns the switch.
  3231			 */
  3232			assist = hv_vtl_assist_page_gpa(target);
  3233			if (assist) {
  3234				/*
  3235				 * Write only the fields KVM maintains: KVM does not
  3236				 * emulate VINA, so vina_asserted belongs to the VMM.
  3237				 */
  3238				ctl.vtl_entry_reason = HV_VTL_ENTRY_REASON_VTL_CALL;
  3239				ctl.vtl_ret_x64rax = rax;
  3240				ctl.vtl_ret_x64rcx = rcx;
  3241				if (kvm_vcpu_write_guest(target,
  3242							 assist + HV_VTL_CONTROL_OFFSET,
  3243							 &ctl.vtl_entry_reason,
  3244							 sizeof(ctl.vtl_entry_reason)) ||
  3245				    kvm_vcpu_write_guest(target,
  3246							 assist + HV_VTL_CONTROL_OFFSET +
  3247							 offsetof(struct hv_vtl_control,
  3248								  vtl_ret_x64rax),
  3249							 &ctl.vtl_ret_x64rax,
  3250							 sizeof(ctl.vtl_ret_x64rax) +
  3251							 sizeof(ctl.vtl_ret_x64rcx))) {
  3252					if (limit >= 0)
  3253						atomic_dec(&to_kvm_hv(vcpu->kvm)->vtl_switch_count);
  3254					return -ENOENT;
  3255				}
  3256			}
  3257		}
  3258	
  3259		/* VTL-shared state: GPRs except RSP (RIP/RFLAGS stay private). */
> 3260		for (i = 0; i < ARRAY_SIZE(shared_gprs); i++)
  3261			kvm_register_write_raw(target, shared_gprs[i],
  3262					       kvm_register_read_raw(vcpu,
  3263								     shared_gprs[i]));
  3264		target->arch.cr2 = vcpu->arch.cr2;
  3265		vcpu->common->vtl_fpu_from = cur;
  3266		vcpu->common->vtl_fpu_to = to;
  3267	
  3268		if (!is_return) {
  3269			if (to_hv_vcpu(target)) {
  3270				to_hv_vcpu(target)->vtl_entry_rax = rax;
  3271				to_hv_vcpu(target)->vtl_entry_rcx = rcx;
  3272				to_hv_vcpu(target)->vtl_entry_regs_valid = true;
  3273			}
  3274			resume = rax;
  3275		} else {
  3276			if (!fast)
  3277				kvm_rcx_write_raw(target, ctl.vtl_ret_x64rcx);
  3278			resume = fast ? rax : ctl.vtl_ret_x64rax;
  3279			to_hv_vcpu(vcpu)->vtl_entry_regs_valid = false;
  3280		}
  3281	
  3282		/*
  3283		 * The resume value is a full 64-bit register value (the caller's
  3284		 * RAX on a call or a fast return, the lower VTL's RAX from the
  3285		 * control area on a non-fast return).  No userspace exit is
  3286		 * involved, so it goes straight into the target's RAX rather than
  3287		 * through the run union.  A target suspended in a hypercall of
  3288		 * its own (any time after its very first entry) still has its
  3289		 * completion armed: it now only retires the vmcall, and until then
  3290		 * the suspended RIP stays at the vmcall, which the higher VTL can
  3291		 * observe (and rewrite) through HvCallGetVpRegisters.  A rewritten
  3292		 * RIP suppresses the deferred skip: the plane resumes exactly where
  3293		 * the higher VTL pointed it.  A target whose suspension already
  3294		 * retired its vmcall (forwarded switch) has no completion armed and
  3295		 * resumes where RIP points.
  3296		 */
  3297		kvm_rax_write_raw(target, resume);
  3298		if (target->arch.complete_userspace_io) {
  3299			to_hv_vcpu(target)->hcall_kernel_result = true;
  3300			to_hv_vcpu(target)->hcall_resume_pending = false;
  3301		}
  3302	
  3303		/*
  3304		 * Suspend the current plane in its uncompleted hypercall; the
  3305		 * switch back will provide its resume value the same way.  Until
  3306		 * it does, hcall_resume_pending marks the run union as not holding
  3307		 * this plane's result.
  3308		 */
  3309		vcpu->arch.cui_linear_rip = kvm_get_linear_rip(vcpu);
  3310		to_hv_vcpu(vcpu)->hcall_resume_pending = true;
  3311		to_hv_vcpu(vcpu)->hcall_kernel_result = false;
  3312		vcpu->arch.complete_userspace_io = kvm_hv_hypercall_complete_userspace;
  3313	
  3314		vcpu->plane_suspended = true;
  3315		kvm_vcpu_set_plane_stopped(vcpu);
  3316		target->plane_suspended = false;
  3317		kvm_vcpu_set_plane_runnable(target);
  3318		kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
  3319		return 0;
  3320	}
  3321	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
