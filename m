Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAFF17C8;
	Sat,  2 Sep 2023 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693621626; x=1725157626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQpZeiloxwA33riE81I34p4h+4n/AUiHHsoNqvWwraI=;
  b=B9wUUatFv/t7IbnVUYteWuBKb8vQqPFodHFURMZmBZ6LgM0N2LoMAlTH
   ZGF4f1NQnk1vO7Vh2DfYMTIxyxnxhFLLrCIjwMS381poWIdPQ/RxWzJhn
   3fo4MmTLjsNM24wqb/+iSaP69Zr3IEzQtwh83bFbPdqR6SKmMrFCDgplh
   4yERUplIFS57Vqjqm2OPfciotugPZLxzbxGquRycVhrAOclIEENY24ODu
   KtqeuN/ghOpAeL1Ix/dtKoPwlao42oehjNePZwPjM+FyPbDXzJt53z6sN
   oC4N77GwU/nxBf9d8HwHeoDONfOKnf/7D9Hsb9ZjBacv00O3o7Xw/zoFF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356654841"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="356654841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 19:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769381945"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="769381945"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2023 19:27:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcGLl-0001sF-1J;
	Sat, 02 Sep 2023 02:27:01 +0000
Date: Sat, 2 Sep 2023 10:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/hide_kvm_details 3/3]
 arch/x86/events/intel/core.c:4088:19: error: incomplete definition of type
 'struct kvm_pmu'
Message-ID: <202309021020.10i6jmq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/hide_kvm_details
head:   f2de177a2d8f1b545e0c199bf68cf80d7727c2f5
commit: f2de177a2d8f1b545e0c199bf68cf80d7727c2f5 [3/3] KVM: x86: Make guts of kvm_host.h KVM-only
config: i386-randconfig-013-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021020.10i6jmq0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021020.10i6jmq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021020.10i6jmq0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/core.c:4088:19: error: incomplete definition of type 'struct kvm_pmu'
                   .guest = kvm_pmu->ds_area,
                            ~~~~~~~^
   arch/x86/events/intel/core.c:4049:9: note: forward declaration of 'struct kvm_pmu'
           struct kvm_pmu *kvm_pmu = (struct kvm_pmu *)data;
                  ^
   arch/x86/events/intel/core.c:4095:20: error: incomplete definition of type 'struct kvm_pmu'
                           .guest = kvm_pmu->pebs_data_cfg,
                                    ~~~~~~~^
   arch/x86/events/intel/core.c:4049:9: note: forward declaration of 'struct kvm_pmu'
           struct kvm_pmu *kvm_pmu = (struct kvm_pmu *)data;
                  ^
   arch/x86/events/intel/core.c:4111:37: error: incomplete definition of type 'struct kvm_pmu'
                   arr[pebs_enable].guest &= ~kvm_pmu->host_cross_mapped_mask;
                                              ~~~~~~~^
   arch/x86/events/intel/core.c:4049:9: note: forward declaration of 'struct kvm_pmu'
           struct kvm_pmu *kvm_pmu = (struct kvm_pmu *)data;
                  ^
   arch/x86/events/intel/core.c:4112:37: error: incomplete definition of type 'struct kvm_pmu'
                   arr[global_ctrl].guest &= ~kvm_pmu->host_cross_mapped_mask;
                                              ~~~~~~~^
   arch/x86/events/intel/core.c:4049:9: note: forward declaration of 'struct kvm_pmu'
           struct kvm_pmu *kvm_pmu = (struct kvm_pmu *)data;
                  ^
   4 errors generated.


vim +4088 arch/x86/events/intel/core.c

b4cdc5c264b35c arch/x86/kernel/cpu/perf_event_intel.c Peter Zijlstra    2010-03-30  4027  
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4028  /*
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4029   * Currently, the only caller of this function is the atomic_switch_perf_msrs().
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4030   * The host perf conext helps to prepare the values of the real hardware for
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4031   * a set of msrs that need to be switched atomically in a vmx transaction.
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4032   *
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4033   * For example, the pseudocode needed to add a new msr should look like:
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4034   *
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4035   * arr[(*nr)++] = (struct perf_guest_switch_msr){
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4036   *	.msr = the hardware msr address,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4037   *	.host = the value the hardware has when it doesn't run a guest,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4038   *	.guest = the value the hardware has when it runs a guest,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4039   * };
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4040   *
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4041   * These values have nothing to do with the emulated values the guest sees
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4042   * when it uses {RD,WR}MSR, which should be handled by the KVM context,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4043   * specifically in the intel_pmu_{get,set}_msr().
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4044   */
39a4d779546a99 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4045  static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
144d31e6f1902a arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2011-10-05  4046  {
89cbc76768c2fa arch/x86/kernel/cpu/perf_event_intel.c Christoph Lameter 2014-08-17  4047  	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
144d31e6f1902a arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2011-10-05  4048  	struct perf_guest_switch_msr *arr = cpuc->guest_switch_msrs;
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4049  	struct kvm_pmu *kvm_pmu = (struct kvm_pmu *)data;
fc4b8fca2d8fc8 arch/x86/events/intel/core.c           Kan Liang         2021-04-12  4050  	u64 intel_ctrl = hybrid(cpuc->pmu, intel_ctrl);
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4051  	u64 pebs_mask = cpuc->pebs_enabled & x86_pmu.pebs_capable;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4052  	int global_ctrl, pebs_enable;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4053  
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4054  	*nr = 0;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4055  	global_ctrl = (*nr)++;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4056  	arr[global_ctrl] = (struct perf_guest_switch_msr){
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4057  		.msr = MSR_CORE_PERF_GLOBAL_CTRL,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4058  		.host = intel_ctrl & ~cpuc->intel_ctrl_guest_mask,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4059  		.guest = intel_ctrl & (~cpuc->intel_ctrl_host_mask | ~pebs_mask),
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4060  	};
144d31e6f1902a arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2011-10-05  4061  
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4062  	if (!x86_pmu.pebs)
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4063  		return arr;
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4064  
26a4f3c08de49c arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2012-08-09  4065  	/*
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4066  	 * If PMU counter has PEBS enabled it is not enough to
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4067  	 * disable counter on a guest entry since PEBS memory
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4068  	 * write can overshoot guest entry and corrupt guest
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4069  	 * memory. Disabling PEBS solves the problem.
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4070  	 *
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4071  	 * Don't do this if the CPU already enforces it.
26a4f3c08de49c arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2012-08-09  4072  	 */
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4073  	if (x86_pmu.pebs_no_isolation) {
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4074  		arr[(*nr)++] = (struct perf_guest_switch_msr){
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4075  			.msr = MSR_IA32_PEBS_ENABLE,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4076  			.host = cpuc->pebs_enabled,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4077  			.guest = 0,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4078  		};
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4079  		return arr;
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4080  	}
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4081  
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4082  	if (!kvm_pmu || !x86_pmu.pebs_ept)
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4083  		return arr;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4084  
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4085  	arr[(*nr)++] = (struct perf_guest_switch_msr){
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4086  		.msr = MSR_IA32_DS_AREA,
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4087  		.host = (unsigned long)cpuc->ds,
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11 @4088  		.guest = kvm_pmu->ds_area,
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4089  	};
8183a538cd95f7 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4090  
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4091  	if (x86_pmu.intel_cap.pebs_baseline) {
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4092  		arr[(*nr)++] = (struct perf_guest_switch_msr){
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4093  			.msr = MSR_PEBS_DATA_CFG,
3c845304d2d723 arch/x86/events/intel/core.c           Like Xu           2023-05-17  4094  			.host = cpuc->active_pebs_data_cfg,
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4095  			.guest = kvm_pmu->pebs_data_cfg,
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4096  		};
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4097  	}
902caeb6841a64 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4098  
6ebe44366bdeaf arch/x86/events/intel/core.c           Like Xu           2022-04-11  4099  	pebs_enable = (*nr)++;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4100  	arr[pebs_enable] = (struct perf_guest_switch_msr){
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4101  		.msr = MSR_IA32_PEBS_ENABLE,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4102  		.host = cpuc->pebs_enabled & ~cpuc->intel_ctrl_guest_mask,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4103  		.guest = pebs_mask & ~cpuc->intel_ctrl_host_mask,
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4104  	};
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4105  
854250329c02c0 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4106  	if (arr[pebs_enable].host) {
854250329c02c0 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4107  		/* Disable guest PEBS if host PEBS is enabled. */
854250329c02c0 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4108  		arr[pebs_enable].guest = 0;
854250329c02c0 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4109  	} else {
f2aeea57504cbb arch/x86/events/intel/core.c           Like Xu           2022-08-31  4110  		/* Disable guest PEBS thoroughly for cross-mapped PEBS counters. */
854250329c02c0 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4111  		arr[pebs_enable].guest &= ~kvm_pmu->host_cross_mapped_mask;
f2aeea57504cbb arch/x86/events/intel/core.c           Like Xu           2022-08-31  4112  		arr[global_ctrl].guest &= ~kvm_pmu->host_cross_mapped_mask;
c59a1f106f5cd4 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4113  		/* Set hw GLOBAL_CTRL bits for PEBS counter when it runs for guest */
854250329c02c0 arch/x86/events/intel/core.c           Like Xu           2022-04-11  4114  		arr[global_ctrl].guest |= arr[pebs_enable].guest;
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4115  	}
9b545c04abd4f7 arch/x86/events/intel/core.c           Andi Kleen        2019-02-04  4116  
144d31e6f1902a arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2011-10-05  4117  	return arr;
144d31e6f1902a arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2011-10-05  4118  }
144d31e6f1902a arch/x86/kernel/cpu/perf_event_intel.c Gleb Natapov      2011-10-05  4119  

:::::: The code at line 4088 was first introduced by commit
:::::: 8183a538cd95f72f11871b35726256ec3bcb9439 KVM: x86/pmu: Add IA32_DS_AREA MSR emulation to support guest DS

:::::: TO: Like Xu <like.xu@linux.intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
