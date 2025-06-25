Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873929B200;
	Wed, 25 Jun 2025 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843101; cv=none; b=k/QkOJe6BBbOz4mm2f9VYfbTGTW9u6Y24OxBvQ9VVelgo+Jz9Gn60sjqSeutoMb6ISIS3GGyw3d139uSUoXK5k6qf8BjmVoZWfRx7eSRRDbbplLJk/OmakzIgToemIy/nEZYNB3Epoyv2dFZ9osjVfBoUChbUd5e4D4CJXJQA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843101; c=relaxed/simple;
	bh=tmysgYzWCWGyTY2cKnSO+JaAAf94I6dDoKYocrjhCjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3AhoVNR/l6fFfEqQ3GN1Ik7Df2J/GuXce/EWiX1/cHx2LQ1hY7pY49W9ygHAKO9NwfZZ2Tg+jLhArMo8eF2AHnwHh5zTEyaH9MqjjO77O4OhOAjYwhNYQIDP7AYGYzwC3veFIND6P1Fm2d8K1VR0bd2QPyQfaTdhkEZ6dERYO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlZSecl7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlZSecl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750843099; x=1782379099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmysgYzWCWGyTY2cKnSO+JaAAf94I6dDoKYocrjhCjo=;
  b=dlZSecl7/g0/sGQzHN18zF3Gs7E3HiRWliZiEiqbEutnwaluHKVYYnvj
   Ir3jnk4nMxHPb5CCWoD0RtBQ6lSuON8zXi4oHw2HqQMg0YBn933f4hIgD
   D4RJP3Mcq4R9dfC9uiHzFoBSFyhe61YBv2YszPdMcqBJQHfbninMx3C61
   xFIx4NZl1f5YVn2UyivyLXGSVUQ7z1kqZlUn/WL75p26hSkLdY90QjRw8
   30mVmFk9IQPni6d7XawNVoG2WMPPAKm/P0EgEq7bqw3Y1jfxB6wog7+f9
   yVox26FgV+/vfjK/5oNrJ2MREV0IBjpUMFCJKoxcK57ty61fieTu+o7BS
   A==;
X-CSE-ConnectionGUID: kby8micXRLCi5OvkNuBo9Q==
X-CSE-MsgGUID: VLe9l+JtRO6rNPOEZ9DvkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53072782"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="53072782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:18:17 -0700
X-CSE-ConnectionGUID: JeLDTBzWT7C6WpPBr4qP2A==
X-CSE-MsgGUID: BL0ukZioS1mf+CL3SMBvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="157934398"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jun 2025 02:18:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMGj-000SwC-2D;
	Wed, 25 Jun 2025 09:18:13 +0000
Date: Wed, 25 Jun 2025 17:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kvm-x86:mmio 3/3] arch/x86/kvm/mmu/spte.c:295:30: error: use of
 undeclared identifier 'mmio_stale_data_clear'
Message-ID: <202506251700.XDtuLHgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-x86/linux mmio
head:   00c8216399da1e7df22637dfb4d6d451adc5f24e
commit: 00c8216399da1e7df22637dfb4d6d451adc5f24e [3/3] KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps MMIO into the guest
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250625/202506251700.XDtuLHgR-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251700.XDtuLHgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251700.XDtuLHgR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/spte.c:295:30: error: use of undeclared identifier 'mmio_stale_data_clear'
     295 |         if (static_branch_unlikely(&mmio_stale_data_clear) &&
         |                                     ^
>> arch/x86/kvm/mmu/spte.c:295:30: error: use of undeclared identifier 'mmio_stale_data_clear'
>> arch/x86/kvm/mmu/spte.c:295:30: error: use of undeclared identifier 'mmio_stale_data_clear'
>> arch/x86/kvm/mmu/spte.c:295:30: error: use of undeclared identifier 'mmio_stale_data_clear'
   4 errors generated.
--
>> arch/x86/kvm/vmx/vmx.c:968:30: error: use of undeclared identifier 'mmio_stale_data_clear'
     968 |         if (static_branch_unlikely(&mmio_stale_data_clear) &&
         |                                     ^
>> arch/x86/kvm/vmx/vmx.c:968:30: error: use of undeclared identifier 'mmio_stale_data_clear'
>> arch/x86/kvm/vmx/vmx.c:968:30: error: use of undeclared identifier 'mmio_stale_data_clear'
>> arch/x86/kvm/vmx/vmx.c:968:30: error: use of undeclared identifier 'mmio_stale_data_clear'
   4 errors generated.


vim +/mmio_stale_data_clear +295 arch/x86/kvm/mmu/spte.c

   185	
   186	bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
   187		       const struct kvm_memory_slot *slot,
   188		       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
   189		       u64 old_spte, bool prefetch, bool synchronizing,
   190		       bool host_writable, u64 *new_spte)
   191	{
   192		int level = sp->role.level;
   193		u64 spte = SPTE_MMU_PRESENT_MASK;
   194		int is_host_mmio = -1;
   195		bool wrprot = false;
   196	
   197		/*
   198		 * For the EPT case, shadow_present_mask has no RWX bits set if
   199		 * exec-only page table entries are supported.  In that case,
   200		 * ACC_USER_MASK and shadow_user_mask are used to represent
   201		 * read access.  See FNAME(gpte_access) in paging_tmpl.h.
   202		 */
   203		WARN_ON_ONCE((pte_access | shadow_present_mask) == SHADOW_NONPRESENT_VALUE);
   204	
   205		if (sp->role.ad_disabled)
   206			spte |= SPTE_TDP_AD_DISABLED;
   207		else if (kvm_mmu_page_ad_need_write_protect(vcpu->kvm, sp))
   208			spte |= SPTE_TDP_AD_WRPROT_ONLY;
   209	
   210		spte |= shadow_present_mask;
   211		if (!prefetch || synchronizing)
   212			spte |= shadow_accessed_mask;
   213	
   214		/*
   215		 * For simplicity, enforce the NX huge page mitigation even if not
   216		 * strictly necessary.  KVM could ignore the mitigation if paging is
   217		 * disabled in the guest, as the guest doesn't have any page tables to
   218		 * abuse.  But to safely ignore the mitigation, KVM would have to
   219		 * ensure a new MMU is loaded (or all shadow pages zapped) when CR0.PG
   220		 * is toggled on, and that's a net negative for performance when TDP is
   221		 * enabled.  When TDP is disabled, KVM will always switch to a new MMU
   222		 * when CR0.PG is toggled, but leveraging that to ignore the mitigation
   223		 * would tie make_spte() further to vCPU/MMU state, and add complexity
   224		 * just to optimize a mode that is anything but performance critical.
   225		 */
   226		if (level > PG_LEVEL_4K && (pte_access & ACC_EXEC_MASK) &&
   227		    is_nx_huge_page_enabled(vcpu->kvm)) {
   228			pte_access &= ~ACC_EXEC_MASK;
   229		}
   230	
   231		if (pte_access & ACC_EXEC_MASK)
   232			spte |= shadow_x_mask;
   233		else
   234			spte |= shadow_nx_mask;
   235	
   236		if (pte_access & ACC_USER_MASK)
   237			spte |= shadow_user_mask;
   238	
   239		if (level > PG_LEVEL_4K)
   240			spte |= PT_PAGE_SIZE_MASK;
   241	
   242		if (kvm_x86_ops.get_mt_mask)
   243			spte |= kvm_x86_call(get_mt_mask)(vcpu, gfn,
   244							  kvm_is_mmio_pfn(pfn, &is_host_mmio));
   245		if (host_writable)
   246			spte |= shadow_host_writable_mask;
   247		else
   248			pte_access &= ~ACC_WRITE_MASK;
   249	
   250		if (shadow_me_value && !kvm_is_mmio_pfn(pfn, &is_host_mmio))
   251			spte |= shadow_me_value;
   252	
   253		spte |= (u64)pfn << PAGE_SHIFT;
   254	
   255		if (pte_access & ACC_WRITE_MASK) {
   256			/*
   257			 * Unsync shadow pages that are reachable by the new, writable
   258			 * SPTE.  Write-protect the SPTE if the page can't be unsync'd,
   259			 * e.g. it's write-tracked (upper-level SPs) or has one or more
   260			 * shadow pages and unsync'ing pages is not allowed.
   261			 *
   262			 * When overwriting an existing leaf SPTE, and the old SPTE was
   263			 * writable, skip trying to unsync shadow pages as any relevant
   264			 * shadow pages must already be unsync, i.e. the hash lookup is
   265			 * unnecessary (and expensive).  Note, this relies on KVM not
   266			 * changing PFNs without first zapping the old SPTE, which is
   267			 * guaranteed by both the shadow MMU and the TDP MMU.
   268			 */
   269			if ((!is_last_spte(old_spte, level) || !is_writable_pte(old_spte)) &&
   270			    mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, synchronizing, prefetch))
   271				wrprot = true;
   272			else
   273				spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask |
   274					shadow_dirty_mask;
   275		}
   276	
   277		if (prefetch && !synchronizing)
   278			spte = mark_spte_for_access_track(spte);
   279	
   280		WARN_ONCE(is_rsvd_spte(&vcpu->arch.mmu->shadow_zero_check, spte, level),
   281			  "spte = 0x%llx, level = %d, rsvd bits = 0x%llx", spte, level,
   282			  get_rsvd_bits(&vcpu->arch.mmu->shadow_zero_check, spte, level));
   283	
   284		/*
   285		 * Mark the memslot dirty *after* modifying it for access tracking.
   286		 * Unlike folios, memslots can be safely marked dirty out of mmu_lock,
   287		 * i.e. in the fast page fault handler.
   288		 */
   289		if ((spte & PT_WRITABLE_MASK) && kvm_slot_dirty_track_enabled(slot)) {
   290			/* Enforced by kvm_mmu_hugepage_adjust. */
   291			WARN_ON_ONCE(level > PG_LEVEL_4K);
   292			mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
   293		}
   294	
 > 295		if (static_branch_unlikely(&mmio_stale_data_clear) &&
   296		    !kvm_vcpu_can_access_host_mmio(vcpu) &&
   297		    kvm_is_mmio_pfn(pfn, &is_host_mmio))
   298			kvm_track_host_mmio_mapping(vcpu);
   299	
   300		*new_spte = spte;
   301		return wrprot;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
