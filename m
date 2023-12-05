Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450054177F;
	Tue,  5 Dec 2023 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/R0s+ns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701769839; x=1733305839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWFYoe5oxsGtQxUArBVv5GQudQnV/5Hoox5HND4fMlM=;
  b=I/R0s+nsECvLUgt3FPtYjaPDvC5uy1nNU1LKiY1RzS6jvLLx6jjeA+Jf
   Yv7OEZ9JSkaBkK/c8IKmIC7ga3ZvG1pW/Z9fV89cYuTaDhabbS9t2kdER
   lDM/wJ6jv4WVXZ7XalXpdytDr4QsBtMjluDVxoKtICW8Lf1T1X1whNjmt
   S2/XX0B8rnxmg9KNY4UTuNUpyD5oyU+6lUC+bpHT816Ffr7nLHLzaoigI
   ldQodmxk1YnHgBQidAjoZ7YBqIB7K8kFsvuemXHKMpXpfygEjSUEEhj3k
   PpCzMfI6869usL2fuRUxHUnzN2SsOYIMQPlyqVw7cwjFNSEddZxdBXfNp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384269377"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="384269377"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 01:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="805229070"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="805229070"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 01:50:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAS4Y-0008hn-13;
	Tue, 05 Dec 2023 09:50:34 +0000
Date: Tue, 5 Dec 2023 17:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_pmu_snapshot_v1 32/32]
 arch/riscv/kvm/vcpu_pmu.c:204:6: warning: unused variable 'enabled'
Message-ID: <202312051709.nVYMNAeq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_pmu_snapshot_v1
head:   7536565387bf2f507db4c5407ad0a27413b349db
commit: 7536565387bf2f507db4c5407ad0a27413b349db [32/32] RISC-V: KVM: Support 64 bit firmware counters on RV32
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231205/202312051709.nVYMNAeq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051709.nVYMNAeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051709.nVYMNAeq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_pmu.c:204:6: warning: unused variable 'enabled' [-Wunused-variable]
     204 |         u64 enabled, running;
         |             ^
>> arch/riscv/kvm/vcpu_pmu.c:204:15: warning: unused variable 'running' [-Wunused-variable]
     204 |         u64 enabled, running;
         |                      ^
   arch/riscv/kvm/vcpu_pmu.c:383:28: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
     383 |                 if (kvpmu->snapshot_addr != INVALID_GPA)
         |                     ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:387:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     387 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                              ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:440:26: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     440 |                 kvpmu->snapshot_addr = INVALID_GPA;
         |                                      ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:485:41: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     485 |             (bSnapshot && kvpmu->snapshot_addr == INVALID_GPA)) {
         |                           ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:556:42: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     556 |             (bSnapshot && (kvpmu->snapshot_addr == INVALID_GPA))) {
         |                            ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:771:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     771 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                              ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   8 warnings generated.


vim +/enabled +204 arch/riscv/kvm/vcpu_pmu.c

   185	
   186	static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
   187				     unsigned long cbase, unsigned long cmask)
   188	{
   189		int ret;
   190	
   191		/* Fixed counters need to be have fixed mapping as they have different width */
   192		ret = kvm_pmu_get_fixed_pmc_index(eidx);
   193		if (ret >= 0)
   194			return ret;
   195	
   196		return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
   197	}
   198	#if defined(CONFIG_32BIT)
   199	static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
   200				      unsigned long *out_val)
   201	{
   202		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   203		struct kvm_pmc *pmc;
 > 204		u64 enabled, running;
   205		int fevent_code;
   206	
   207		pmc = &kvpmu->pmc[cidx];
   208	
   209		if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
   210			return -EINVAL;
   211	
   212		fevent_code = get_event_code(pmc->event_idx);
   213		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
   214	
   215		*out_val = pmc->counter_val >> 32;
   216	
   217		return 0;
   218	}
   219	#endif
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
