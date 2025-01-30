Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39C1A7046;
	Thu, 30 Jan 2025 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738240175; cv=none; b=Zm7KUEDT4yhCFO+wNeP/PCrVYlL3dpoTpVv4D1Cz1vV0RZfsySckMsiCBo+KFVPqVvLckX7ersdHEmVF32hPY6SDJAuLeTUxXbEHoSSGtWNLMNhZIWxcCm4yvs/OZqf5R5vtOC5HaVFvGiQrruJEB9MKPBgEjPpK5+nX3p8Xk/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738240175; c=relaxed/simple;
	bh=qMlubJ8YyTHQfcC2X1g0Ez4Bn+VIJRtGcSkMOTX8p8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO78ACV88OR//ZSE94nBJMS6v2HN/uArMvWpzBpIKyGqzcOZQomly6FcOhB9ghRHp8T172LBbazkZuLf7j9yyHz6VHk17oQSwvkIKaFdwhObFrhUxcZzoLZhjEpGi9T7eGowjVo+5BiT5opokZCyo23QosS+q9i3xiYHkbn4zAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9skUZqC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9skUZqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738240173; x=1769776173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qMlubJ8YyTHQfcC2X1g0Ez4Bn+VIJRtGcSkMOTX8p8U=;
  b=b9skUZqCNXfYf4h/2NnCjGB3RozwS4FefFRU2XLfD6bLL9txYNNDoaNt
   lzDzRf2hQypRNdbuziiG6C2mXkROuUrIwyXHxuFRyQ7ap8k4VE7YxWLqm
   rNjnatunxNdXNVDOnSXtErAvoAo1GcUy23oNLDAg6jlhbeyjyMRl56pmQ
   gwvxRIAKIcUtbSHJtfddG+1stpWfSxjJmGYH23uuaSmuJVtirHXmMJ9zM
   PeJKv2qaomi70Qb8cRULgddOJ9fKnqLmT8iEbzSiwbuG+DlC5yCrvPu36
   tG/ZaNMbS50CBfK0RZ+q5UtB3EmVCDePCisAPdvMkjZYuHqSQxwuTno3d
   w==;
X-CSE-ConnectionGUID: /6wYjqDxTj+19qiJr5NrXw==
X-CSE-MsgGUID: CNTVPu7vSLGixgrAiJhEVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42436323"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42436323"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:29:31 -0800
X-CSE-ConnectionGUID: TdjJz4dTQ4ea70WFbY9fSA==
X-CSE-MsgGUID: PjCESnmpRw+SKNktuGKg2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114298438"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2025 04:29:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdTfj-000k2p-1h;
	Thu, 30 Jan 2025 12:29:27 +0000
Date: Thu, 30 Jan 2025 20:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put()
 of guest_memfd pages
Message-ID: <202501302015.O9ipX955-lkp@intel.com>
References: <20250129172320.950523-3-tabba@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129172320.950523-3-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20250130-012603
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250129172320.950523-3-tabba%40google.com
patch subject: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put() of guest_memfd pages
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250130/202501302015.O9ipX955-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501302015.O9ipX955-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302015.O9ipX955-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/swap.c:40:
   In file included from include/linux/kvm_host.h:45:
>> arch/x86/include/asm/kvm_host.h:569:33: error: use of undeclared identifier 'X86_PMC_IDX_MAX'
     569 |                 DECLARE_BITMAP(reprogram_pmi, X86_PMC_IDX_MAX);
         |                                               ^
   arch/x86/include/asm/kvm_host.h:572:36: error: use of undeclared identifier 'X86_PMC_IDX_MAX'
     572 |         DECLARE_BITMAP(all_valid_pmc_idx, X86_PMC_IDX_MAX);
         |                                           ^
   arch/x86/include/asm/kvm_host.h:573:29: error: use of undeclared identifier 'X86_PMC_IDX_MAX'
     573 |         DECLARE_BITMAP(pmc_in_use, X86_PMC_IDX_MAX);
         |                                    ^
>> arch/x86/include/asm/kvm_host.h:828:19: error: field has incomplete type 'struct fpu_guest'
     828 |         struct fpu_guest guest_fpu;
         |                          ^
   arch/x86/include/asm/kvm_host.h:828:9: note: forward declaration of 'struct fpu_guest'
     828 |         struct fpu_guest guest_fpu;
         |                ^
>> arch/x86/include/asm/kvm_host.h:1051:29: error: use of undeclared identifier 'PG_LEVEL_1G'
    1051 |         struct kvm_rmap_head *rmap[KVM_NR_PAGE_SIZES];
         |                                    ^
   arch/x86/include/asm/kvm_host.h:151:28: note: expanded from macro 'KVM_NR_PAGE_SIZES'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                  ^
   arch/x86/include/asm/kvm_host.h:150:32: note: expanded from macro 'KVM_MAX_HUGEPAGE_LEVEL'
     150 | #define KVM_MAX_HUGEPAGE_LEVEL  PG_LEVEL_1G
         |                                 ^
>> arch/x86/include/asm/kvm_host.h:1051:29: error: use of undeclared identifier 'PG_LEVEL_4K'
   arch/x86/include/asm/kvm_host.h:151:53: note: expanded from macro 'KVM_NR_PAGE_SIZES'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                                           ^
   arch/x86/include/asm/kvm_host.h:1052:36: error: use of undeclared identifier 'PG_LEVEL_1G'
    1052 |         struct kvm_lpage_info *lpage_info[KVM_NR_PAGE_SIZES - 1];
         |                                           ^
   arch/x86/include/asm/kvm_host.h:151:28: note: expanded from macro 'KVM_NR_PAGE_SIZES'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                  ^
   arch/x86/include/asm/kvm_host.h:150:32: note: expanded from macro 'KVM_MAX_HUGEPAGE_LEVEL'
     150 | #define KVM_MAX_HUGEPAGE_LEVEL  PG_LEVEL_1G
         |                                 ^
   arch/x86/include/asm/kvm_host.h:1052:36: error: use of undeclared identifier 'PG_LEVEL_4K'
   arch/x86/include/asm/kvm_host.h:151:53: note: expanded from macro 'KVM_NR_PAGE_SIZES'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                                           ^
   arch/x86/include/asm/kvm_host.h:1556:20: error: use of undeclared identifier 'PG_LEVEL_1G'
    1556 |                 atomic64_t pages[KVM_NR_PAGE_SIZES];
         |                                  ^
   arch/x86/include/asm/kvm_host.h:151:28: note: expanded from macro 'KVM_NR_PAGE_SIZES'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                  ^
   arch/x86/include/asm/kvm_host.h:150:32: note: expanded from macro 'KVM_MAX_HUGEPAGE_LEVEL'
     150 | #define KVM_MAX_HUGEPAGE_LEVEL  PG_LEVEL_1G
         |                                 ^
   arch/x86/include/asm/kvm_host.h:1556:20: error: use of undeclared identifier 'PG_LEVEL_4K'
   arch/x86/include/asm/kvm_host.h:151:53: note: expanded from macro 'KVM_NR_PAGE_SIZES'
     151 | #define KVM_NR_PAGE_SIZES       (KVM_MAX_HUGEPAGE_LEVEL - PG_LEVEL_4K + 1)
         |                                                           ^
>> arch/x86/include/asm/kvm_host.h:1623:29: error: use of undeclared identifier 'APIC_DEST_LOGICAL'
    1623 |         return dest_mode_logical ? APIC_DEST_LOGICAL : APIC_DEST_PHYSICAL;
         |                                    ^
>> arch/x86/include/asm/kvm_host.h:1623:49: error: use of undeclared identifier 'APIC_DEST_PHYSICAL'
    1623 |         return dest_mode_logical ? APIC_DEST_LOGICAL : APIC_DEST_PHYSICAL;
         |                                                        ^
>> arch/x86/include/asm/kvm_host.h:1670:48: warning: declaration of 'struct desc_ptr' will not be visible outside of this function [-Wvisibility]
    1670 |         void (*get_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^
   arch/x86/include/asm/kvm_host.h:1671:48: warning: declaration of 'struct desc_ptr' will not be visible outside of this function [-Wvisibility]
    1671 |         void (*set_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^
   arch/x86/include/asm/kvm_host.h:1672:48: warning: declaration of 'struct desc_ptr' will not be visible outside of this function [-Wvisibility]
    1672 |         void (*get_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^
   arch/x86/include/asm/kvm_host.h:1673:48: warning: declaration of 'struct desc_ptr' will not be visible outside of this function [-Wvisibility]
    1673 |         void (*set_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
         |                                                       ^
>> arch/x86/include/asm/kvm_host.h:2327:32: error: use of undeclared identifier 'APIC_DM_FIXED'
    2327 |         return (irq->delivery_mode == APIC_DM_FIXED ||
         |                                       ^
>> arch/x86/include/asm/kvm_host.h:2328:25: error: use of undeclared identifier 'APIC_DM_LOWEST'
    2328 |                 irq->delivery_mode == APIC_DM_LOWEST);
         |                                       ^
>> arch/x86/include/asm/kvm_host.h:2347:9: error: use of undeclared identifier 'BAD_APICID'
    2347 |         return BAD_APICID;
         |                ^
   4 warnings and 15 errors generated.


vim +/X86_PMC_IDX_MAX +569 arch/x86/include/asm/kvm_host.h

f5132b01386b5a Gleb Natapov        2011-11-10  533  
4f1fa2a1bbeb2f Like Xu             2022-09-19  534  /* More counters may conflict with other existing Architectural MSRs */
f287bef6ddc208 Dapeng Mi           2024-06-27  535  #define KVM_MAX(a, b)	((a) >= (b) ? (a) : (b))
f287bef6ddc208 Dapeng Mi           2024-06-27  536  #define KVM_MAX_NR_INTEL_GP_COUNTERS	8
f287bef6ddc208 Dapeng Mi           2024-06-27  537  #define KVM_MAX_NR_AMD_GP_COUNTERS	6
f287bef6ddc208 Dapeng Mi           2024-06-27  538  #define KVM_MAX_NR_GP_COUNTERS		KVM_MAX(KVM_MAX_NR_INTEL_GP_COUNTERS, \
f287bef6ddc208 Dapeng Mi           2024-06-27  539  						KVM_MAX_NR_AMD_GP_COUNTERS)
f287bef6ddc208 Dapeng Mi           2024-06-27  540  
f287bef6ddc208 Dapeng Mi           2024-06-27  541  #define KVM_MAX_NR_INTEL_FIXED_COUTNERS	3
f287bef6ddc208 Dapeng Mi           2024-06-27  542  #define KVM_MAX_NR_AMD_FIXED_COUTNERS	0
f287bef6ddc208 Dapeng Mi           2024-06-27  543  #define KVM_MAX_NR_FIXED_COUNTERS	KVM_MAX(KVM_MAX_NR_INTEL_FIXED_COUTNERS, \
f287bef6ddc208 Dapeng Mi           2024-06-27  544  						KVM_MAX_NR_AMD_FIXED_COUTNERS)
004a0aa56edea3 Sean Christopherson 2023-11-09  545  
f5132b01386b5a Gleb Natapov        2011-11-10  546  struct kvm_pmu {
12aad9164763bb Mathias Krause      2023-02-17  547  	u8 version;
f5132b01386b5a Gleb Natapov        2011-11-10  548  	unsigned nr_arch_gp_counters;
f5132b01386b5a Gleb Natapov        2011-11-10  549  	unsigned nr_arch_fixed_counters;
f5132b01386b5a Gleb Natapov        2011-11-10  550  	unsigned available_event_types;
f5132b01386b5a Gleb Natapov        2011-11-10  551  	u64 fixed_ctr_ctrl;
0e102ce3d41331 Dapeng Mi           2024-04-30  552  	u64 fixed_ctr_ctrl_rsvd;
f5132b01386b5a Gleb Natapov        2011-11-10  553  	u64 global_ctrl;
f5132b01386b5a Gleb Natapov        2011-11-10  554  	u64 global_status;
f5132b01386b5a Gleb Natapov        2011-11-10  555  	u64 counter_bitmask[2];
0e102ce3d41331 Dapeng Mi           2024-04-30  556  	u64 global_ctrl_rsvd;
0e102ce3d41331 Dapeng Mi           2024-04-30  557  	u64 global_status_rsvd;
103af0a9878859 Andi Kleen          2013-07-18  558  	u64 reserved_bits;
95b065bf5c431c Jim Mattson         2022-03-07  559  	u64 raw_event_mask;
f287bef6ddc208 Dapeng Mi           2024-06-27  560  	struct kvm_pmc gp_counters[KVM_MAX_NR_GP_COUNTERS];
f287bef6ddc208 Dapeng Mi           2024-06-27  561  	struct kvm_pmc fixed_counters[KVM_MAX_NR_FIXED_COUNTERS];
f1c5651fda43e0 Sean Christopherson 2022-09-23  562  
f1c5651fda43e0 Sean Christopherson 2022-09-23  563  	/*
f1c5651fda43e0 Sean Christopherson 2022-09-23  564  	 * Overlay the bitmap with a 64-bit atomic so that all bits can be
f1c5651fda43e0 Sean Christopherson 2022-09-23  565  	 * set in a single access, e.g. to reprogram all counters when the PMU
f1c5651fda43e0 Sean Christopherson 2022-09-23  566  	 * filter changes.
f1c5651fda43e0 Sean Christopherson 2022-09-23  567  	 */
f1c5651fda43e0 Sean Christopherson 2022-09-23  568  	union {
4be946728f65c1 Like Xu             2019-10-21 @569  		DECLARE_BITMAP(reprogram_pmi, X86_PMC_IDX_MAX);
f1c5651fda43e0 Sean Christopherson 2022-09-23  570  		atomic64_t __reprogram_pmi;
f1c5651fda43e0 Sean Christopherson 2022-09-23  571  	};
b35e5548b41131 Like Xu             2019-10-27  572  	DECLARE_BITMAP(all_valid_pmc_idx, X86_PMC_IDX_MAX);
b35e5548b41131 Like Xu             2019-10-27  573  	DECLARE_BITMAP(pmc_in_use, X86_PMC_IDX_MAX);
b35e5548b41131 Like Xu             2019-10-27  574  
8183a538cd95f7 Like Xu             2022-04-11  575  	u64 ds_area;
c59a1f106f5cd4 Like Xu             2022-04-11  576  	u64 pebs_enable;
0e102ce3d41331 Dapeng Mi           2024-04-30  577  	u64 pebs_enable_rsvd;
902caeb6841a64 Like Xu             2022-04-11  578  	u64 pebs_data_cfg;
0e102ce3d41331 Dapeng Mi           2024-04-30  579  	u64 pebs_data_cfg_rsvd;
c59a1f106f5cd4 Like Xu             2022-04-11  580  
854250329c02c0 Like Xu             2022-04-11  581  	/*
854250329c02c0 Like Xu             2022-04-11  582  	 * If a guest counter is cross-mapped to host counter with different
854250329c02c0 Like Xu             2022-04-11  583  	 * index, its PEBS capability will be temporarily disabled.
854250329c02c0 Like Xu             2022-04-11  584  	 *
854250329c02c0 Like Xu             2022-04-11  585  	 * The user should make sure that this mask is updated
854250329c02c0 Like Xu             2022-04-11  586  	 * after disabling interrupts and before perf_guest_get_msrs();
854250329c02c0 Like Xu             2022-04-11  587  	 */
854250329c02c0 Like Xu             2022-04-11  588  	u64 host_cross_mapped_mask;
854250329c02c0 Like Xu             2022-04-11  589  
b35e5548b41131 Like Xu             2019-10-27  590  	/*
b35e5548b41131 Like Xu             2019-10-27  591  	 * The gate to release perf_events not marked in
b35e5548b41131 Like Xu             2019-10-27  592  	 * pmc_in_use only once in a vcpu time slice.
b35e5548b41131 Like Xu             2019-10-27  593  	 */
b35e5548b41131 Like Xu             2019-10-27  594  	bool need_cleanup;
b35e5548b41131 Like Xu             2019-10-27  595  
b35e5548b41131 Like Xu             2019-10-27  596  	/*
b35e5548b41131 Like Xu             2019-10-27  597  	 * The total number of programmed perf_events and it helps to avoid
b35e5548b41131 Like Xu             2019-10-27  598  	 * redundant check before cleanup if guest don't use vPMU at all.
b35e5548b41131 Like Xu             2019-10-27  599  	 */
b35e5548b41131 Like Xu             2019-10-27  600  	u8 event_count;
f5132b01386b5a Gleb Natapov        2011-11-10  601  };
f5132b01386b5a Gleb Natapov        2011-11-10  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
