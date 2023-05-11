Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EA62B;
	Thu, 11 May 2023 02:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683770933; x=1715306933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMtjbmYgv959iDJulolQKtU3fEfUC4oGArXhZbjZ4tM=;
  b=j4sUuOHWQvjUbIKpW5NqVgRZ4QjQ9+h+7hVgJza5yhl1bd7zua/sgCpK
   JO27QY3cPCoMD7yDnZyeH8+SJURWQ2GdynQp+Asoydri0IUtsqQaMjGB9
   eHQf0cAkyW8cxY91JxbG1GXGC0237AdwRvVn3+05vrcE2HVzxLyNWALDH
   qzRJ6EomiX7C5pZ0iA4yOa5h52XdEGAswezdchCasgNrFJNZkdlttDuvB
   jMQWY9VrivEtDS6xZeOjfTv5lXv0tlSInflpn5W7ls2ZdICcBYpYYDBYA
   iDrYXe5PCs6vucxWijBZTdAb3jYzAcz08ARuxZScK9mejKkgxKvRiO5sx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413691001"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="413691001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 19:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789180106"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="789180106"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2023 19:08:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwvje-0003ho-1F;
	Thu, 11 May 2023 02:08:50 +0000
Date: Thu, 11 May 2023 10:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_snapshot_rfc 6/7]
 arch/riscv/kvm/vcpu_pmu.c:358:26: warning: implicit conversion from 'gpa_t'
 (aka 'unsigned long long') to 'unsigned long' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202305111057.xlCzWSSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_snapshot_rfc
head:   5ae7188de04f861c3f4026005a0ace2cf2575bde
commit: 98be44e0e5eedf9af70491d6faf0536e02945d6e [6/7] KVM: RISC-V: Implement SBI PMU Snapshot feature
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230511/202305111057.xlCzWSSJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/atishp04/linux/commit/98be44e0e5eedf9af70491d6faf0536e02945d6e
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_snapshot_rfc
        git checkout 98be44e0e5eedf9af70491d6faf0536e02945d6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111057.xlCzWSSJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_pmu.c:358:26: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                   kvpmu->snapshot_addr = INVALID_GPA;
                                        ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
   #define INVALID_GPA     (~(gpa_t)0)
                            ^~~~~~~~~
>> arch/riscv/kvm/vcpu_pmu.c:405:41: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
               (bSnapshot && kvpmu->snapshot_addr == INVALID_GPA)) {
                             ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:470:42: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
               (bSnapshot && (kvpmu->snapshot_addr == INVALID_GPA))) {
                              ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:654:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           kvpmu->snapshot_addr = INVALID_GPA;
                                ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
   #define INVALID_GPA     (~(gpa_t)0)
                            ^~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:714:25: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           kvpmu->snapshot_addr = INVALID_GPA;
                                ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:43:22: note: expanded from macro 'INVALID_GPA'
   #define INVALID_GPA     (~(gpa_t)0)
                            ^~~~~~~~~
   5 warnings generated.


vim +358 arch/riscv/kvm/vcpu_pmu.c

   312	
   313	int kvm_riscv_vcpu_pmu_enable_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
   314					       unsigned long saddr_high, struct kvm_vcpu_sbi_return *retdata)
   315	{
   316		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   317		int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
   318		int sbiret = 0;
   319		gpa_t saddr;
   320		unsigned long hva;
   321		bool writable;
   322	
   323		if (!kvpmu) {
   324			sbiret = SBI_ERR_INVALID_PARAM;
   325			goto out;
   326		}
   327	
   328		saddr = saddr_low;
   329	
   330		if (saddr_high != 0) {
   331	#ifdef CONFIG_32BIT
   332			saddr |= ((gpa_t)saddr << 32);
   333	#else
   334			sbiret = SBI_ERR_INVALID_ADDRESS;
   335			goto out;
   336	#endif
   337		}
   338	
   339		//TODO: Move these validation functions to a common file
   340		if (kvm_is_error_gpa(vcpu->kvm, saddr)) {
   341			sbiret = SBI_ERR_INVALID_PARAM;
   342			goto out;
   343		}
   344	
   345		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
   346		if (kvm_is_error_hva(hva) || !writable) {
   347			sbiret = SBI_ERR_INVALID_ADDRESS;
   348			goto out;
   349		}
   350	
   351		kvpmu->snapshot_addr = saddr;
   352		kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
   353		if (!kvpmu->sdata)
   354			return -ENOMEM;
   355	
   356		if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
   357			kfree(kvpmu->sdata);
 > 358			kvpmu->snapshot_addr = INVALID_GPA;
   359			sbiret = SBI_ERR_FAILURE;
   360			goto out;
   361		}
   362	
   363	out:
   364		retdata->err_val = sbiret;
   365	
   366		return 0;
   367	}
   368	
   369	int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
   370					struct kvm_vcpu_sbi_return *retdata)
   371	{
   372		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   373	
   374		retdata->out_val = kvm_pmu_num_counters(kvpmu);
   375	
   376		return 0;
   377	}
   378	
   379	int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
   380					struct kvm_vcpu_sbi_return *retdata)
   381	{
   382		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   383	
   384		if (cidx > RISCV_KVM_MAX_COUNTERS || cidx == 1) {
   385			retdata->err_val = SBI_ERR_INVALID_PARAM;
   386			return 0;
   387		}
   388	
   389		retdata->out_val = kvpmu->pmc[cidx].cinfo.value;
   390	
   391		return 0;
   392	}
   393	
   394	int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
   395					 unsigned long ctr_mask, unsigned long flags, u64 ival,
   396					 struct kvm_vcpu_sbi_return *retdata)
   397	{
   398		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
   399		int i, pmc_index, sbiret = 0;
   400		struct kvm_pmc *pmc;
   401		int fevent_code;
   402		bool bSnapshot = flags & SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
   403	
   404		if ((kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) ||
 > 405		    (bSnapshot && kvpmu->snapshot_addr == INVALID_GPA)) {
   406			sbiret = SBI_ERR_INVALID_PARAM;
   407			goto out;
   408		}
   409	
   410		/* Start the counters that have been configured and requested by the guest */
   411		for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
   412			pmc_index = i + ctr_base;
   413			if (!test_bit(pmc_index, kvpmu->pmc_in_use))
   414				continue;
   415			pmc = &kvpmu->pmc[pmc_index];
   416			if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
   417				pmc->counter_val = ival;
   418			else if (bSnapshot) {
   419				kvm_vcpu_read_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
   420						    sizeof(struct riscv_pmu_snapshot_data));
   421				pmc->counter_val = kvpmu->sdata->ctr_values[pmc_index];
   422			}
   423	
   424			if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
   425				fevent_code = get_event_code(pmc->event_idx);
   426				if (fevent_code >= SBI_PMU_FW_MAX) {
   427					sbiret = SBI_ERR_INVALID_PARAM;
   428					goto out;
   429				}
   430	
   431				/* Check if the counter was already started for some reason */
   432				if (kvpmu->fw_event[fevent_code].started) {
   433					sbiret = SBI_ERR_ALREADY_STARTED;
   434					continue;
   435				}
   436	
   437				kvpmu->fw_event[fevent_code].started = true;
   438				kvpmu->fw_event[fevent_code].value = pmc->counter_val;
   439			} else if (pmc->perf_event) {
   440				if (unlikely(pmc->started)) {
   441					sbiret = SBI_ERR_ALREADY_STARTED;
   442					continue;
   443				}
   444				perf_event_period(pmc->perf_event, kvm_pmu_get_sample_period(pmc));
   445				perf_event_enable(pmc->perf_event);
   446				pmc->started = true;
   447			} else {
   448				sbiret = SBI_ERR_INVALID_PARAM;
   449			}
   450		}
   451	
   452	out:
   453		retdata->err_val = sbiret;
   454	
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
