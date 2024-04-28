Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868EF524B7;
	Sun, 28 Apr 2024 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714294766; cv=none; b=EcdB7qz8sCuMYyPABAAvarZ+8Lqhe34x/UHHvczxWzGvi80p89tvwx5r9YxAo1w/h9U9vwwVyKd1eqSTrdEnOXo+bILxqRPch4eSpleAz7IF7B6V5j1J/W1rvb2//FPvbUZK1h48g7b9ZPcyCulEwsaxFFpzDFjXiBckqSYmMiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714294766; c=relaxed/simple;
	bh=tG3zjk4oS7kZMccLgofGz48erbeFMKB/qUFCf4W1PV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKqMcNnw1Lmg8ahejrFmDILX/9YTu1lBjIMioIeM8/IIyCaiwvfsFTlIoA6g3cLOOt331oG7u4yspsSeqjZMmd7j+XLiRHL1+WjRY5mbK7W7PX+38/w0OZDWWdJWJB5W8o542UuhGtXk/BSlZSpVlKF8M/2C4XkqxxCGKDYp0zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMtahM1B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMtahM1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714294764; x=1745830764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tG3zjk4oS7kZMccLgofGz48erbeFMKB/qUFCf4W1PV0=;
  b=hMtahM1B0P6rGtSW4E9u1aTGI5gmLzAga3qVUExD02AonfW7c6Is/Gd3
   DTIOVo70C5rn4nuhPkQ0Pckgbg2pb1+RFIPVzcjp+yzpwxei3rbua72Jo
   2MbKWPiMuma2+atb9Ijw6qtsklz4GPByaxkewYh9pL4T/wGOPkfLR4TPY
   H9h35/uLk4x8O5ZnXHflJF4oLs1peFbT6AY0Dz4zVrE9y2A06GSoFyYHh
   gSf4fHFGdfPqyzvNqlVhEtnuSj4uY/72dq+gOcNE6TP6d+0QXSxqOXDsB
   oiWfgldFRoGreyzThjTtmjfQTvydcBcb1zYVs6G3xq/qOy2s7tow9Rb+3
   A==;
X-CSE-ConnectionGUID: 1PwYweXcQ6G61Gi9iSSDWQ==
X-CSE-MsgGUID: 3VrSmLIhQDm4g103qa518Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32480188"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="32480188"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 01:59:23 -0700
X-CSE-ConnectionGUID: riQuI3gCQeS8wECPmtSBwg==
X-CSE-MsgGUID: rpJl4QKgTR2VyAx771eScg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25851134"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Apr 2024 01:59:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s10NT-00061c-0a;
	Sun, 28 Apr 2024 08:59:19 +0000
Date: Sun, 28 Apr 2024 16:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/sched_in_cleanup 1/3] arch/arm64/kvm/arm.c:431:6:
 error: conflicting types for 'kvm_arch_vcpu_load'
Message-ID: <202404281607.Jwewi1zO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/sched_in_cleanup
head:   f857e355f9536935b6c96bf389119576043aeb75
commit: 5d14663b4abaf97f4e415eef00c813aeaf823bbc [1/3] KVM: Plumb in a @sched_in flag to kvm_arch_vcpu_load()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281607.Jwewi1zO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281607.Jwewi1zO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281607.Jwewi1zO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/arm.c:9:
   In file included from include/linux/entry-kvm.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/arm.c:431:6: error: conflicting types for 'kvm_arch_vcpu_load'
     431 | void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
         |      ^
   include/linux/kvm_host.h:1501:6: note: previous declaration is here
    1501 | void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
         |      ^
   5 warnings and 1 error generated.


vim +/kvm_arch_vcpu_load +431 arch/arm64/kvm/arm.c

d35268da66870d7 arch/arm/kvm/arm.c   Christoffer Dall 2015-08-25  430  
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20 @431  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  432  {
a0e50aa3f4a8a5c arch/arm64/kvm/arm.c Christoffer Dall 2019-01-04  433  	struct kvm_s2_mmu *mmu;
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  434  	int *last_ran;
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  435  
a0e50aa3f4a8a5c arch/arm64/kvm/arm.c Christoffer Dall 2019-01-04  436  	mmu = vcpu->arch.hw_mmu;
a0e50aa3f4a8a5c arch/arm64/kvm/arm.c Christoffer Dall 2019-01-04  437  	last_ran = this_cpu_ptr(mmu->last_vcpu_ran);
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  438  
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  439  	/*
01dc9262ff5797b arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  440  	 * We guarantee that both TLBs and I-cache are private to each
01dc9262ff5797b arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  441  	 * vcpu. If detecting that a vcpu from the same VM has
01dc9262ff5797b arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  442  	 * previously run on the same physical CPU, call into the
01dc9262ff5797b arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  443  	 * hypervisor code to nuke the relevant contexts.
01dc9262ff5797b arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  444  	 *
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  445  	 * We might get preempted before the vCPU actually runs, but
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  446  	 * over-invalidation doesn't affect correctness.
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  447  	 */
5f4bd815ec71899 arch/arm64/kvm/arm.c Marc Zyngier     2023-09-27  448  	if (*last_ran != vcpu->vcpu_idx) {
01dc9262ff5797b arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  449  		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
5f4bd815ec71899 arch/arm64/kvm/arm.c Marc Zyngier     2023-09-27  450  		*last_ran = vcpu->vcpu_idx;
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  451  	}
94d0e5980d6791b arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  452  
86ce85352f0da7e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  453  	vcpu->cpu = cpu;
5b3e5e5bf230f56 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  454  
328e56647944919 arch/arm/kvm/arm.c   Christoffer Dall 2016-03-24  455  	kvm_vgic_load(vcpu);
b103cc3f10c06fb virt/kvm/arm/arm.c   Christoffer Dall 2016-10-16  456  	kvm_timer_vcpu_load(vcpu);
13aeb9b400c5d7c arch/arm64/kvm/arm.c David Brazdil    2020-06-25  457  	if (has_vhe())
27cde4c0fe28eab arch/arm64/kvm/arm.c Oliver Upton     2023-10-18  458  		kvm_vcpu_load_vhe(vcpu);
e6b673b741ea0d7 virt/kvm/arm/arm.c   Dave Martin      2018-04-06  459  	kvm_arch_vcpu_load_fp(vcpu);
435e53fb5e21ad1 virt/kvm/arm/arm.c   Andrew Murray    2019-04-09  460  	kvm_vcpu_pmu_restore_guest(vcpu);
8564d6372a7d8a6 virt/kvm/arm/arm.c   Steven Price     2019-10-21  461  	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
8564d6372a7d8a6 virt/kvm/arm/arm.c   Steven Price     2019-10-21  462  		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
de73708915adc1b virt/kvm/arm/arm.c   Marc Zyngier     2018-06-21  463  
de73708915adc1b virt/kvm/arm/arm.c   Marc Zyngier     2018-06-21  464  	if (single_task_running())
ef2e78ddadbb939 virt/kvm/arm/arm.c   Marc Zyngier     2019-11-07  465  		vcpu_clear_wfx_traps(vcpu);
de73708915adc1b virt/kvm/arm/arm.c   Marc Zyngier     2018-06-21  466  	else
ef2e78ddadbb939 virt/kvm/arm/arm.c   Marc Zyngier     2019-11-07  467  		vcpu_set_wfx_traps(vcpu);
384b40caa8afae4 virt/kvm/arm/arm.c   Mark Rutland     2019-04-23  468  
29eb5a3c57f7e06 arch/arm64/kvm/arm.c Marc Zyngier     2020-06-04  469  	if (vcpu_has_ptrauth(vcpu))
ef3e40a7ea8dbe2 arch/arm64/kvm/arm.c Marc Zyngier     2020-06-03  470  		vcpu_ptrauth_disable(vcpu);
d2602bb4f5a4506 arch/arm64/kvm/arm.c Suzuki K Poulose 2021-04-05  471  	kvm_arch_vcpu_load_debug_state_flags(vcpu);
583cda1b0e7d5d4 arch/arm64/kvm/arm.c Alexandru Elisei 2022-01-27  472  
1ba11daef0a9b06 arch/arm64/kvm/arm.c Shaoqin Huang    2023-07-27  473  	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
583cda1b0e7d5d4 arch/arm64/kvm/arm.c Alexandru Elisei 2022-01-27  474  		vcpu_set_on_unsupported_cpu(vcpu);
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  475  }
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  476  

:::::: The code at line 431 was first introduced by commit
:::::: 749cf76c5a363e1383108a914ea09530bfa0bd43 KVM: ARM: Initial skeleton to compile KVM support

:::::: TO: Christoffer Dall <c.dall@virtualopensystems.com>
:::::: CC: Christoffer Dall <c.dall@virtualopensystems.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
