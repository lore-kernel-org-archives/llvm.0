Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D772905;
	Sun, 19 Jan 2025 03:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737255643; cv=none; b=n7H2y9UvbIKv2LGoDiGU5CJPRoULV5Buy4wHAyVrJKhPB5GfXiphFFiB1M3jrgZ+T0KIlRU/DiXrpAMMyEPJTDNQCob5GfYbqUR7PJEUKeT3f1TK6NDr3UugrCa9hNonl69JKeX942rM5FVKYPN2WylrOAzfgcWuInrGyCseJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737255643; c=relaxed/simple;
	bh=snE1F9b/Or/NQNCbnPGBC0oQVQpgCwJKeeNt3DI+9LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2ITGdGuioyuZD9rrb1T7hQOcMSluMolzdYelpWlCHjk6ntLXNlNqz12HGe4O1jjoqEL2PH8e8/7v9Xr285NaZBmPrty4NQ3pT7VnEualjIa6+58+8P5rebYZbqfuxsGU5PKhgiV9Z7Oo0OApDMfWcqw3Y2dLa3CUZnVbOD45FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gs7qCLVv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gs7qCLVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737255641; x=1768791641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=snE1F9b/Or/NQNCbnPGBC0oQVQpgCwJKeeNt3DI+9LE=;
  b=Gs7qCLVve/kea1GKMy/yY66N0jjqpMwyhRh4I2DNKegi/QlJrYP+Y/N5
   9euDFECOksDtRewjveDfialrmvh4Dfq+4OwS3xHKp0/j25hcan1mgnobI
   QM40MF8hfVGGIu8euTsWSSLMEJbAOIoVtV+D1Ki+LZ2iVt57aNr2b48G4
   dOrBU3kbTWIBoUFaPcHv3IGsDkMpefQaMQ5pa/n8Wd33I/VTdRuPAeRAD
   et8he6c48mtPavVUGc6Br7RwV2eFvDLr2o7OFi7VDdkX+3W9p+R6jz95t
   IU5oCCxizx+aJVfif50xmK9I/35RSPwUTOk0bgYR2bATikmXAUy09Ctok
   A==;
X-CSE-ConnectionGUID: O8thyslpRv2zjDXBA1A+Pg==
X-CSE-MsgGUID: f1bsk1IMSPql/2tzd+QSkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37809831"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37809831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 19:00:40 -0800
X-CSE-ConnectionGUID: WKnJqSy/SSS4FMCb3Gs9Hw==
X-CSE-MsgGUID: w9VYN0D+SU2xSP4QLUcrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129424045"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jan 2025 19:00:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZLYD-000V2p-0T;
	Sun, 19 Jan 2025 03:00:37 +0000
Date: Sun, 19 Jan 2025 11:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 06/10] KVM: x86/xen: Use guest's copy of pvclock when
 starting timer
Message-ID: <202501191041.ew4CA984-lkp@intel.com>
References: <20250118005552.2626804-7-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250118005552.2626804-7-seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb723766b1030a23c38adf2348b7c3d1409d11f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-x86-Don-t-take-kvm-lock-when-iterating-over-vCPUs-in-suspend-notifier/20250118-085939
base:   eb723766b1030a23c38adf2348b7c3d1409d11f0
patch link:    https://lore.kernel.org/r/20250118005552.2626804-7-seanjc%40google.com
patch subject: [PATCH 06/10] KVM: x86/xen: Use guest's copy of pvclock when starting timer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250119/202501191041.ew4CA984-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191041.ew4CA984-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191041.ew4CA984-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/xen.c:10:
   In file included from arch/x86/kvm/x86.h:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/xen.c:219:7: warning: variable 'xen' is uninitialized when used here [-Wuninitialized]
     219 |                 if (xen->vcpu_info_cache.active)
         |                     ^~~
   arch/x86/kvm/xen.c:189:26: note: initialize the variable 'xen' to silence this warning
     189 |         struct kvm_vcpu_xen *xen;
         |                                 ^
         |                                  = NULL
   5 warnings generated.


vim +/xen +219 arch/x86/kvm/xen.c

   185	
   186	static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
   187					bool linux_wa)
   188	{
   189		struct kvm_vcpu_xen *xen;
   190		int64_t kernel_now, delta;
   191		uint64_t guest_now;
   192		int r = -EOPNOTSUPP;
   193	
   194		/*
   195		 * The guest provides the requested timeout in absolute nanoseconds
   196		 * of the KVM clock — as *it* sees it, based on the scaled TSC and
   197		 * the pvclock information provided by KVM.
   198		 *
   199		 * The kernel doesn't support hrtimers based on CLOCK_MONOTONIC_RAW
   200		 * so use CLOCK_MONOTONIC. In the timescales covered by timers, the
   201		 * difference won't matter much as there is no cumulative effect.
   202		 *
   203		 * Calculate the time for some arbitrary point in time around "now"
   204		 * in terms of both kvmclock and CLOCK_MONOTONIC. Calculate the
   205		 * delta between the kvmclock "now" value and the guest's requested
   206		 * timeout, apply the "Linux workaround" described below, and add
   207		 * the resulting delta to the CLOCK_MONOTONIC "now" value, to get
   208		 * the absolute CLOCK_MONOTONIC time at which the timer should
   209		 * fire.
   210		 */
   211		do {
   212			struct pvclock_vcpu_time_info hv_clock;
   213			uint64_t host_tsc, guest_tsc;
   214	
   215			if (!static_cpu_has(X86_FEATURE_CONSTANT_TSC) ||
   216			    !vcpu->kvm->arch.use_master_clock)
   217				break;
   218	
 > 219			if (xen->vcpu_info_cache.active)
   220				r = xen_get_guest_pvclock(vcpu, &hv_clock, &xen->vcpu_info_cache,
   221							offsetof(struct compat_vcpu_info, time));
   222			else if (xen->vcpu_time_info_cache.active)
   223				r = xen_get_guest_pvclock(vcpu, &hv_clock, &xen->vcpu_time_info_cache, 0);
   224			if (r)
   225				break;
   226	
   227			if (!IS_ENABLED(CONFIG_64BIT) ||
   228			    !kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
   229				/*
   230				 * Don't fall back to get_kvmclock_ns() because it's
   231				 * broken; it has a systemic error in its results
   232				 * because it scales directly from host TSC to
   233				 * nanoseconds, and doesn't scale first to guest TSC
   234				 * and *then* to nanoseconds as the guest does.
   235				 *
   236				 * There is a small error introduced here because time
   237				 * continues to elapse between the ktime_get() and the
   238				 * subsequent rdtsc(). But not the systemic drift due
   239				 * to get_kvmclock_ns().
   240				 */
   241				kernel_now = ktime_get(); /* This is CLOCK_MONOTONIC */
   242				host_tsc = rdtsc();
   243			}
   244	
   245			/* Calculate the guest kvmclock as the guest would do it. */
   246			guest_tsc = kvm_read_l1_tsc(vcpu, host_tsc);
   247			guest_now = __pvclock_read_cycles(&hv_clock, guest_tsc);
   248		} while (0);
   249	
   250		if (r) {
   251			/*
   252			 * Without CONSTANT_TSC, get_kvmclock_ns() is the only option.
   253			 *
   254			 * Also if the guest PV clock hasn't been set up yet, as is
   255			 * likely to be the case during migration when the vCPU has
   256			 * not been run yet. It would be possible to calculate the
   257			 * scaling factors properly in that case but there's not much
   258			 * point in doing so. The get_kvmclock_ns() drift accumulates
   259			 * over time, so it's OK to use it at startup. Besides, on
   260			 * migration there's going to be a little bit of skew in the
   261			 * precise moment at which timers fire anyway. Often they'll
   262			 * be in the "past" by the time the VM is running again after
   263			 * migration.
   264			 */
   265			guest_now = get_kvmclock_ns(vcpu->kvm);
   266			kernel_now = ktime_get();
   267		}
   268	
   269		delta = guest_abs - guest_now;
   270	
   271		/*
   272		 * Xen has a 'Linux workaround' in do_set_timer_op() which checks for
   273		 * negative absolute timeout values (caused by integer overflow), and
   274		 * for values about 13 days in the future (2^50ns) which would be
   275		 * caused by jiffies overflow. For those cases, Xen sets the timeout
   276		 * 100ms in the future (not *too* soon, since if a guest really did
   277		 * set a long timeout on purpose we don't want to keep churning CPU
   278		 * time by waking it up).  Emulate Xen's workaround when starting the
   279		 * timer in response to __HYPERVISOR_set_timer_op.
   280		 */
   281		if (linux_wa &&
   282		    unlikely((int64_t)guest_abs < 0 ||
   283			     (delta > 0 && (uint32_t) (delta >> 50) != 0))) {
   284			delta = 100 * NSEC_PER_MSEC;
   285			guest_abs = guest_now + delta;
   286		}
   287	
   288		/*
   289		 * Avoid races with the old timer firing. Checking timer_expires
   290		 * to avoid calling hrtimer_cancel() will only have false positives
   291		 * so is fine.
   292		 */
   293		if (vcpu->arch.xen.timer_expires)
   294			hrtimer_cancel(&vcpu->arch.xen.timer);
   295	
   296		atomic_set(&vcpu->arch.xen.timer_pending, 0);
   297		vcpu->arch.xen.timer_expires = guest_abs;
   298	
   299		if (delta <= 0)
   300			xen_timer_callback(&vcpu->arch.xen.timer);
   301		else
   302			hrtimer_start(&vcpu->arch.xen.timer,
   303				      ktime_add_ns(kernel_now, delta),
   304				      HRTIMER_MODE_ABS_HARD);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
