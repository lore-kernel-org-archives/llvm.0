Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D87D19D07A;
	Mon, 10 Nov 2025 05:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762753486; cv=none; b=RiL+2hHpFDoiGWVOgFHMyhuEGk8UHlafQGdxAfPEE6gOyY/6pEpcsZ3fySwnro9ePoO2DACy054+TouyhN/RKNYaWDSJ9uKD4JasOZHCNhIJilp8qfxajzmVRTgeJFI+wQzX1cJ9rbGmwBp3ab2OoWjkbrBCnv6blFpi9cS/DFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762753486; c=relaxed/simple;
	bh=yi+NjG7JULWwtcWsZnl6sS+KZMtXOuI3pCMMXkagBr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d294/imB7RiC6iVuluuqN/A3bNJ8QykwExDT6+6CNLLACqAKypah/4mpGummcZPOjAq+Sx7FoXKKJpEhIUwdLyuehXBZDAOhJdgEmPOZ/Xr6mOZ9mA57aIvRBOsjEvk8SpQD2OX5LJ092iM5pHa38pDH2JgTyv/D7vrWPhmVHBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0uL3LB1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0uL3LB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762753484; x=1794289484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yi+NjG7JULWwtcWsZnl6sS+KZMtXOuI3pCMMXkagBr4=;
  b=h0uL3LB1AYpRDE7hi0ETP/TF+QCLPfA4rck0SI26ab2ckqzJ+G1V4vCz
   GYwnDHtXsc9gU8nMOI65w5kAGA9qIPAwghQXhakggcquDbnupOk2PFcaC
   OPh6pDqNPDjPsfKY2ocPwxc24awrsusM/MI1vSaOOsJkFs+wdBqsvKX4J
   OhqNpVuSQvho2kLrJSND5XgOMT8er6Od8efSR28h2AAGe8l2/Z632FD63
   0b8VZaaR+JXHFklTGE/4r05RlMyC//Rucwn7JD9nWEmFqy9enrfTAK/hM
   MXk5H8dS4kbDtUVX6znd44mBjbZhQwypKpRkY5XcLhe6lw+smVwhgNQPe
   A==;
X-CSE-ConnectionGUID: ZqwWyKGlTIW3s9cb4ZBdTw==
X-CSE-MsgGUID: CfvuEOwnTU6WKbShoFZ2ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68647176"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68647176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:44:43 -0800
X-CSE-ConnectionGUID: MwTZ2oLhTS65a7AQK6H/Og==
X-CSE-MsgGUID: VSM/jK75SH2ATI/fyJTQ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="211988213"
Received: from lkp-server01.sh.intel.com (HELO a4b9b04596e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2025 21:44:41 -0800
Received: from kbuild by a4b9b04596e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIKhj-00002d-2I;
	Mon, 10 Nov 2025 05:44:39 +0000
Date: Mon, 10 Nov 2025 13:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	Sandipan Das <sandipan.das@amd.com>
Subject: [sean-jc:x86/mediated_pmu 37/44] arch/x86/kvm/pmu.c:1308:50: error:
 too few arguments provided to function-like macro invocation
Message-ID: <202511101315.v7OCEv9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   9b6b574f2d82517dd2018444e07f4b2ae84c2a49
commit: a0a470fa63f1bc6440fd4b0e3babcc847262b8ed [37/44] KVM: x86/pmu: Load/put mediated PMU context when entering/exiting guest
config: x86_64-buildonly-randconfig-004-20251110 (https://download.01.org/0day-ci/archive/20251110/202511101315.v7OCEv9b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101315.v7OCEv9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101315.v7OCEv9b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/pmu.c:1308:50: error: too few arguments provided to function-like macro invocation
    1308 |         WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
         |                                                         ^
   arch/x86/include/asm/msr.h:194:9: note: macro 'rdmsrq' defined here
     194 | #define rdmsrq(msr, val)                        \
         |         ^
>> arch/x86/kvm/pmu.c:1308:15: error: use of undeclared identifier 'rdmsrq'; did you mean 'wrmsrq'?
    1308 |         WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
         |                      ^~~~~~
         |                      wrmsrq
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   arch/x86/include/asm/msr.h:197:20: note: 'wrmsrq' declared here
     197 | static inline void wrmsrq(u32 msr, u64 val)
         |                    ^
   2 errors generated.


vim +1308 arch/x86/kvm/pmu.c

  1288	
  1289	void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
  1290	{
  1291		if (!kvm_vcpu_has_mediated_pmu(vcpu) ||
  1292		    KVM_BUG_ON(!lapic_in_kernel(vcpu), vcpu->kvm))
  1293			return;
  1294	
  1295		lockdep_assert_irqs_disabled();
  1296	
  1297		perf_load_guest_context();
  1298	
  1299		/*
  1300		 * Sanity check that "loading" guest context disabled all counters, as
  1301		 * modifying the LVTPC while host perf is active will cause explosions,
  1302		 * as will loading event selectors and PMCs with guest values.
  1303		 *
  1304		 * VMX will enable/disable counters at VM-Enter/VM-Exit by atomically
  1305		 * loading PERF_GLOBAL_CONTROL.  SVM effectively performs the switch by
  1306		 * configuring all events to be GUEST_ONLY.
  1307		 */
> 1308		WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
  1309	
  1310		perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
  1311	
  1312		kvm_pmu_load_guest_pmcs(vcpu);
  1313	
  1314		kvm_pmu_call(mediated_load)(vcpu);
  1315	}
  1316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
