Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA354014B4;
	Mon, 11 May 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513858; cv=none; b=efmRIvCnc/gxW7gyytSeIOE8ts6PzojMNgh387oKrI2LQTyucrmLZS7C9q4oj1PeweyfNasSGwkr4DxeOk7wFbEPTXzz/vteteZbf9Meyw0jfUV0a21+ulZ+5KArBaBeMegklpz/JRMF2OJ+sFvXnCcBwTM8DQBNucBVyrcBxJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513858; c=relaxed/simple;
	bh=tKom9E45wQh7kZbjvvYuh1sGU+xgrHfoAPXWvinG9ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K0DQT0viCm6L96zkkRM9snEI+dhJSZ5fnb9xK6v1omLTmXvzrqQUsPYG24Qa+n/Wz7RJGImrOuPco44uTaD0voy6DdWck9KX35i12B9B2Xau2CXz4jVsSQrQyNqKDuw5UW7n32r6x7pdKE874r/JJwEYPizRXqFe3j4FRO9jDrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=db2IIuiZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db2IIuiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778513856; x=1810049856;
  h=date:from:to:cc:subject:message-id;
  bh=tKom9E45wQh7kZbjvvYuh1sGU+xgrHfoAPXWvinG9ng=;
  b=db2IIuiZDPmBgOdttOUd3d1TGgHISz0pD9z54wq9+yNaQKXSGVREEbOG
   j08Ps5jzdUbS9cBeRhIx/sppmDF9kIgtCEljtELOjueohWOdsz2DgIqKN
   vjtMb6cB5i+uVd8nH/UawArkZb8z9yhUrO4QZOg0nJgQBddDpqOOymwSJ
   wcyWzfwD7lf30mlhgFJGeXxJmo/gt6UzFpbpc5Eeu8P0NooXGy+NFOiAH
   Jb1XagUf5Rh6ZOCGNuW8ekPC6f2wt5VpTgumN5ZhlYi9eNs2i4eTM+h2q
   NBkH8AI4+fY9vzZEUhaBwx3eYPBla4ppc7iMAhR4v8ILyV9gdOuqzNhLa
   A==;
X-CSE-ConnectionGUID: EyvGBbydSUW5dThqPpe9Sw==
X-CSE-MsgGUID: SH8RMu2yQiuoF0l2vi3wjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79351090"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79351090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:37:36 -0700
X-CSE-ConnectionGUID: QwQSoH0dTe+XC9/GI1+41A==
X-CSE-MsgGUID: SprmsbE4SX24lRjC0Rd3QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236632503"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2026 08:37:33 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMShH-000000000lv-0rZw;
	Mon, 11 May 2026 15:37:31 +0000
Date: Mon, 11 May 2026 23:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock4 16/34] arch/x86/kvm/x86.c:3388:8: error:
 call to undeclared function 'kvm_get_time_and_clockread'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202605112337.VVxrmRHE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock4
head:   ffae79fc31e809b2eecbdc70bade1b16f7f9f46d
commit: d216b965d38e8dc9aeccd8eea855a1187f997199 [16/34] KVM: x86: Restructure kvm_guest_time_update() for TSC upscaling
config: i386-buildonly-randconfig-002-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112337.VVxrmRHE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112337.VVxrmRHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112337.VVxrmRHE-lkp@intel.com/

Note: the dwmw2/kvmclock4 HEAD ffae79fc31e809b2eecbdc70bade1b16f7f9f46d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:3388:8: error: call to undeclared function 'kvm_get_time_and_clockread'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3388 |                     !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
         |                      ^
   arch/x86/kvm/x86.c:3388:8: note: did you mean 'kvm_get_monotonic_and_clockread'?
   arch/x86/kvm/x86.h:462:6: note: 'kvm_get_monotonic_and_clockread' declared here
     462 | bool kvm_get_monotonic_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp);
         |      ^
   arch/x86/kvm/x86.c:3359:16: warning: unused variable 'flags' [-Wunused-variable]
    3359 |         unsigned long flags;
         |                       ^~~~~
   1 warning and 1 error generated.


vim +/kvm_get_time_and_clockread +3388 arch/x86/kvm/x86.c

  3355	
  3356	int kvm_guest_time_update(struct kvm_vcpu *v)
  3357	{
  3358		struct pvclock_vcpu_time_info hv_clock = {};
  3359		unsigned long flags;
  3360		u64 tgt_tsc_hz;
  3361		unsigned seq;
  3362		struct kvm_vcpu_arch *vcpu = &v->arch;
  3363		struct kvm_arch *ka = &v->kvm->arch;
  3364		s64 kernel_ns;
  3365		u64 tsc_timestamp, host_tsc;
  3366		u64 master_host_tsc = 0;
  3367		s64 master_kernel_ns = 0;
  3368		bool use_master_clock;
  3369	
  3370		/*
  3371		 * If the host uses TSC clock, then passthrough TSC as stable
  3372		 * to the guest.
  3373		 */
  3374		do {
  3375			seq = read_seqcount_begin(&ka->pvclock_sc);
  3376	
  3377			use_master_clock = ka->use_master_clock;
  3378	
  3379			/*
  3380			 * The TSC read and the call to get_cpu_tsc_khz() must happen
  3381			 * on the same CPU.
  3382			 */
  3383			get_cpu();
  3384	
  3385			tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
  3386	
  3387			if (use_master_clock &&
> 3388			    !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
  3389			    WARN_ON_ONCE(!read_seqcount_retry(&ka->pvclock_sc, seq)))
  3390				use_master_clock = false;
  3391	
  3392			put_cpu();
  3393	
  3394			if (!use_master_clock)
  3395				break;
  3396	
  3397			master_host_tsc = ka->master_cycle_now;
  3398			master_kernel_ns = ka->master_kernel_ns;
  3399		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  3400	
  3401		if (unlikely(tgt_tsc_hz == 0)) {
  3402			kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
  3403			return 1;
  3404		}
  3405	
  3406		if (!use_master_clock) {
  3407			host_tsc = rdtsc();
  3408			kernel_ns = get_kvmclock_base_ns();
  3409		}
  3410	
  3411		/*
  3412		 * We may have to catch up the TSC to match elapsed wall clock
  3413		 * time for two reasons, even if kvmclock is used.
  3414		 *   1) CPU could have been running below the maximum TSC rate
  3415		 *   2) Broken TSC compensation resets the base at each VCPU
  3416		 *      entry to avoid unknown leaps of TSC even when running
  3417		 *      again on the same CPU.  This may cause apparent elapsed
  3418		 *      time to disappear, and the guest to stand still or run
  3419		 *      very slowly.
  3420		 */
  3421		if (vcpu->tsc_catchup) {
  3422			s64 adjustment;
  3423	
  3424			/*
  3425			 * Calculate the delta between what the guest TSC *should* be
  3426			 * and what it actually is according to kvm_read_l1_tsc().
  3427			 */
  3428			adjustment = compute_guest_tsc(v, kernel_ns) -
  3429				     kvm_read_l1_tsc(v, host_tsc);
  3430			if (adjustment > 0)
  3431				adjust_tsc_offset_guest(v, adjustment);
  3432		}
  3433	
  3434		/*
  3435		 * Now that TSC upscaling is out of the way, the remaining calculations
  3436		 * are all relative to the reference time that's placed in hv_clock.
  3437		 * If the master clock is NOT in use, the reference time is "now".  If
  3438		 * master clock is in use, the reference time comes from there.
  3439		 */
  3440		if (use_master_clock) {
  3441			host_tsc = master_host_tsc;
  3442			kernel_ns = master_kernel_ns;
  3443		}
  3444		tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
  3445	
  3446		/* With all the info we got, fill in the values */
  3447	
  3448		if (kvm_caps.has_tsc_control) {
  3449			tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
  3450						    v->arch.l1_tsc_scaling_ratio);
  3451			tgt_tsc_hz = tgt_tsc_hz ? : 1;
  3452		}
  3453	
  3454		if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
  3455			kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
  3456					   &vcpu->pvclock_tsc_shift,
  3457					   &vcpu->pvclock_tsc_mul);
  3458			vcpu->hw_tsc_hz = tgt_tsc_hz;
  3459		}
  3460	
  3461		hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
  3462		hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
  3463		hv_clock.tsc_timestamp = tsc_timestamp;
  3464		hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
  3465		vcpu->last_guest_tsc = tsc_timestamp;
  3466	
  3467		/* If the host uses TSC clocksource, then it is stable */
  3468		hv_clock.flags = 0;
  3469		if (use_master_clock)
  3470			hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
  3471	
  3472		if (vcpu->pv_time.active) {
  3473			/*
  3474			 * GUEST_STOPPED is only supported by kvmclock, and KVM's
  3475			 * historic behavior is to only process the request if kvmclock
  3476			 * is active/enabled.
  3477			 */
  3478			if (vcpu->pvclock_set_guest_stopped_request) {
  3479				hv_clock.flags |= PVCLOCK_GUEST_STOPPED;
  3480				vcpu->pvclock_set_guest_stopped_request = false;
  3481			}
  3482			kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->pv_time, 0);
  3483	
  3484			hv_clock.flags &= ~PVCLOCK_GUEST_STOPPED;
  3485		}
  3486	
  3487		kvm_hv_setup_tsc_page(v->kvm, &hv_clock);
  3488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
