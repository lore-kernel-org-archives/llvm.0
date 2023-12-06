Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04605651;
	Wed,  6 Dec 2023 01:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYzbN3lG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701824470; x=1733360470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5w3EXB3GayPeRpqOMEz9Tz3C9lVAMElYTKZ/eLMdAa0=;
  b=SYzbN3lGqG/68jcnV7W4VNxvYzvyl/9kOlQMXNKbayEyVWNJ1L5u5SQP
   /2ygCYPAjYE7WwvBiw5IsvpquYg4p++w99gpTBn2R4WM4gBujZ/E5o3pt
   iWhE9eKWt/jdDNnk60QVQ683uuy+WQZk8I+2YkrYUWFr1Lbvjsz28E1zo
   B+jZl2JD7vXkI/v8u8M29AKMO0Zr90YxD4pnq3TgXlbSELhko5Fzkmvu0
   lf9ROr3KPuRGWMPff2ay7jOp5fmsAnpwBxMuIeIRmYZfuECgIa/jMMl4J
   CmFx7i33e17AFE97EiytF4B+tdMga4bv1cWjvhPZpdjt0OGuQ+i1pBtz1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12700215"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="12700215"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 17:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841655132"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="841655132"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 17:01:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAgHg-000A01-1m;
	Wed, 06 Dec 2023 01:01:04 +0000
Date: Wed, 6 Dec 2023 09:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_pmu_snapshot_v1 31/32]
 arch/riscv/kvm/vcpu_pmu.c:320:28: warning: result of comparison of constant
 18446744073709551615 with expression of type 'unsigned long' is always true
Message-ID: <202312060919.zlTwRyyd-lkp@intel.com>
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
commit: 35ce374331eb26024537a8cc583578ff941b41f7 [31/32] RISC-V: KVM: Implement SBI PMU Snapshot feature
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231206/202312060919.zlTwRyyd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060919.zlTwRyyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060919.zlTwRyyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_pmu.c:320:28: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
     320 |                 if (kvpmu->snapshot_addr != INVALID_GPA)
         |                     ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_pmu.c:324:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     324 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                              ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:377:26: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     377 |                 kvpmu->snapshot_addr = INVALID_GPA;
         |                                      ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
>> arch/riscv/kvm/vcpu_pmu.c:422:41: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     422 |             (bSnapshot && kvpmu->snapshot_addr == INVALID_GPA)) {
         |                           ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:487:42: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     487 |             (bSnapshot && (kvpmu->snapshot_addr == INVALID_GPA))) {
         |                            ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:679:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     679 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                              ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:740:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     740 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                              ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   7 warnings generated.


vim +320 arch/riscv/kvm/vcpu_pmu.c

   312	
   313	static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
   314	{
   315		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   316		int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
   317	
   318		if (kvpmu->sdata) {
   319			memset(kvpmu->sdata, 0, snapshot_area_size);
 > 320			if (kvpmu->snapshot_addr != INVALID_GPA)
   321				kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
   322						     kvpmu->sdata, snapshot_area_size);
   323		}
 > 324		kvpmu->snapshot_addr = INVALID_GPA;
   325	}
   326	
   327	int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
   328					      unsigned long saddr_high, unsigned long flags,
   329					      struct kvm_vcpu_sbi_return *retdata)
   330	{
   331		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   332		int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
   333		int sbiret = 0;
   334		gpa_t saddr;
   335		unsigned long hva;
   336		bool writable;
   337	
   338		if (!kvpmu) {
   339			sbiret = SBI_ERR_INVALID_PARAM;
   340			goto out;
   341		}
   342	
   343		if (saddr_low == -1 && saddr_high == -1) {
   344			kvm_pmu_clear_snapshot_area(vcpu);
   345			return 0;
   346		}
   347	
   348		saddr = saddr_low;
   349	
   350		if (saddr_high != 0) {
   351	#ifdef CONFIG_32BIT
   352			saddr |= ((gpa_t)saddr << 32);
   353	#else
   354			sbiret = SBI_ERR_INVALID_ADDRESS;
   355			goto out;
   356	#endif
   357		}
   358	
   359		if (kvm_is_error_gpa(vcpu->kvm, saddr)) {
   360			sbiret = SBI_ERR_INVALID_PARAM;
   361			goto out;
   362		}
   363	
   364		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
   365		if (kvm_is_error_hva(hva) || !writable) {
   366			sbiret = SBI_ERR_INVALID_ADDRESS;
   367			goto out;
   368		}
   369	
   370		kvpmu->snapshot_addr = saddr;
   371		kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
   372		if (!kvpmu->sdata)
   373			return -ENOMEM;
   374	
   375		if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
   376			kfree(kvpmu->sdata);
 > 377			kvpmu->snapshot_addr = INVALID_GPA;
   378			sbiret = SBI_ERR_FAILURE;
   379		}
   380	out:
   381		retdata->err_val = sbiret;
   382	
   383		return 0;
   384	}
   385	
   386	int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
   387					struct kvm_vcpu_sbi_return *retdata)
   388	{
   389		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   390	
   391		retdata->out_val = kvm_pmu_num_counters(kvpmu);
   392	
   393		return 0;
   394	}
   395	
   396	int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
   397					struct kvm_vcpu_sbi_return *retdata)
   398	{
   399		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   400	
   401		if (cidx > RISCV_KVM_MAX_COUNTERS || cidx == 1) {
   402			retdata->err_val = SBI_ERR_INVALID_PARAM;
   403			return 0;
   404		}
   405	
   406		retdata->out_val = kvpmu->pmc[cidx].cinfo.value;
   407	
   408		return 0;
   409	}
   410	
   411	int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
   412					 unsigned long ctr_mask, unsigned long flags, u64 ival,
   413					 struct kvm_vcpu_sbi_return *retdata)
   414	{
   415		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   416		int i, pmc_index, sbiret = 0;
   417		struct kvm_pmc *pmc;
   418		int fevent_code;
   419		bool bSnapshot = flags & SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
   420	
   421		if ((kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) ||
 > 422		    (bSnapshot && kvpmu->snapshot_addr == INVALID_GPA)) {
   423			sbiret = SBI_ERR_INVALID_PARAM;
   424			goto out;
   425		}
   426	
   427		/* Start the counters that have been configured and requested by the guest */
   428		for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
   429			pmc_index = i + ctr_base;
   430			if (!test_bit(pmc_index, kvpmu->pmc_in_use))
   431				continue;
   432			pmc = &kvpmu->pmc[pmc_index];
   433			if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE) {
   434				pmc->counter_val = ival;
   435			} else if (bSnapshot) {
   436				kvm_vcpu_read_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
   437						    sizeof(struct riscv_pmu_snapshot_data));
   438				pmc->counter_val = kvpmu->sdata->ctr_values[pmc_index];
   439			}
   440	
   441			if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
   442				fevent_code = get_event_code(pmc->event_idx);
   443				if (fevent_code >= SBI_PMU_FW_MAX) {
   444					sbiret = SBI_ERR_INVALID_PARAM;
   445					goto out;
   446				}
   447	
   448				/* Check if the counter was already started for some reason */
   449				if (kvpmu->fw_event[fevent_code].started) {
   450					sbiret = SBI_ERR_ALREADY_STARTED;
   451					continue;
   452				}
   453	
   454				kvpmu->fw_event[fevent_code].started = true;
   455				kvpmu->fw_event[fevent_code].value = pmc->counter_val;
   456			} else if (pmc->perf_event) {
   457				if (unlikely(pmc->started)) {
   458					sbiret = SBI_ERR_ALREADY_STARTED;
   459					continue;
   460				}
   461				perf_event_period(pmc->perf_event, kvm_pmu_get_sample_period(pmc));
   462				perf_event_enable(pmc->perf_event);
   463				pmc->started = true;
   464			} else {
   465				sbiret = SBI_ERR_INVALID_PARAM;
   466			}
   467		}
   468	
   469	out:
   470		retdata->err_val = sbiret;
   471	
   472		return 0;
   473	}
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
