Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8E17B437;
	Thu, 15 Aug 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723726943; cv=none; b=VZj5IAB5+A32xJ7PshmMg1jxpadMEl36eToLyia+89AGNVOxI+eIfFAqtkeGKNsHWIqixIRk2FmACnDKLxGCHmbZyB2NqfDFAQ81OGFFbi0uASbHzaxzJ0GPlD5Qlbs5PxUvZiaTBShDtcIC+kzVdJa553QrHfFCfCFemvCxzl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723726943; c=relaxed/simple;
	bh=w9fqB2+1Fh9Rdao8mZaKLPGVouXGMLb57xR4QWC2ZvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHYe1KXgPb6D3t3p0gxegFfvPWK35SJNQb6g+LdCVfrc9/U+5s5LZk9EMZdRfa4C6ol9oSN7oEK3rmAjpvAhEzdiEghQfh0f5alMTVCYvd0eWMDizayeMfnhCqf6oes0xuTlHWV3y95BOP5FBPRrWsrJ1RVaH5HVIBmjFaWa5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLIFsZ78; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLIFsZ78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723726941; x=1755262941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9fqB2+1Fh9Rdao8mZaKLPGVouXGMLb57xR4QWC2ZvM=;
  b=iLIFsZ78OgdvnJBETQWE5H5Zpfai0NnQZITmWG2w7s21YXiT8IZaiRi8
   1AtY+dB3Nc1/6TO8FflwarHTd7DoslMGE8Mvhsct4KhA3ockfTxJyIJwx
   W2I/rngp810ekQ3dYVoWjTRY8kxdMCC0RBaKM5MwvTc/nwRJl2OzYEgYl
   2X8BPcl4r1UEuujWQnJVU292TleuiKWHMGpuWhLbGWOf1dSQYuaW3zLR3
   Y4xgmSJCYCtpxIesnAC3uj/ZHA3iC2F2GxRIC/gObqcZZSIkpjRAc2CY8
   72raza1J8SGLegzgjfxMKtIA9cQczbl+HIFA1j9aex5W1YSpqe/wNkj0h
   g==;
X-CSE-ConnectionGUID: EcBYLtIRToWfTI4iYJ9U8w==
X-CSE-MsgGUID: 9A5+ncygSeKjnV2mED4tJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33370182"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="33370182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 06:02:21 -0700
X-CSE-ConnectionGUID: 75DNlZ2CQTayz2F7VS4MQw==
X-CSE-MsgGUID: zIkOWTUhQpCRPOvjB7SFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="60110898"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2024 06:02:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sea7N-0003bY-0N;
	Thu, 15 Aug 2024 13:02:17 +0000
Date: Thu, 15 Aug 2024 21:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 85/86] arch/x86/kvm/mmu/spte.c:241:5:
 error: expected expression
Message-ID: <202408152038.LS22Kl0V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   611850ae46de0bdd0ae46c81ea4050547fd65346
commit: e68f0bf34a72fdda235204e06f90224903512e13 [85/86] KVM: x86/mmu: Always mark SPTE dirty if it's created as writable
config: i386-buildonly-randconfig-002-20240815 (https://download.01.org/0day-ci/archive/20240815/202408152038.LS22Kl0V-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408152038.LS22Kl0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408152038.LS22Kl0V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/spte.c:241:5: error: expected expression
     241 |                  */
         |                   ^
   arch/x86/kvm/mmu/spte.c:242:3: error: expected expression
     242 |                 if ((!is_last_spte(old_spte, level) || !is_writable_pte(old_spte)) &&
         |                 ^
   2 errors generated.


vim +241 arch/x86/kvm/mmu/spte.c

54eb3ef56f3682 Sean Christopherson 2022-04-23  156  
7158bee4b47519 Paolo Bonzini       2021-08-17  157  bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
8283e36abfff50 Ben Gardon          2021-11-15  158  	       const struct kvm_memory_slot *slot,
7158bee4b47519 Paolo Bonzini       2021-08-17  159  	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
2839180ce5bb27 Paolo Bonzini       2021-09-29  160  	       u64 old_spte, bool prefetch, bool can_unsync,
7158bee4b47519 Paolo Bonzini       2021-08-17  161  	       bool host_writable, u64 *new_spte)
5a9624affe7c74 Paolo Bonzini       2020-10-16  162  {
7158bee4b47519 Paolo Bonzini       2021-08-17  163  	int level = sp->role.level;
edea7c4fc215c7 Sean Christopherson 2021-02-25  164  	u64 spte = SPTE_MMU_PRESENT_MASK;
ad67e4806e4c2d Paolo Bonzini       2021-08-17  165  	bool wrprot = false;
5a9624affe7c74 Paolo Bonzini       2020-10-16  166  
7f01cab84928af Sean Christopherson 2024-01-22  167  	/*
7f01cab84928af Sean Christopherson 2024-01-22  168  	 * For the EPT case, shadow_present_mask has no RWX bits set if
7f01cab84928af Sean Christopherson 2024-01-22  169  	 * exec-only page table entries are supported.  In that case,
7f01cab84928af Sean Christopherson 2024-01-22  170  	 * ACC_USER_MASK and shadow_user_mask are used to represent
7f01cab84928af Sean Christopherson 2024-01-22  171  	 * read access.  See FNAME(gpte_access) in paging_tmpl.h.
7f01cab84928af Sean Christopherson 2024-01-22  172  	 */
7f01cab84928af Sean Christopherson 2024-01-22  173  	WARN_ON_ONCE((pte_access | shadow_present_mask) == SHADOW_NONPRESENT_VALUE);
9fb3565743d583 Sean Christopherson 2022-05-13  174  
7158bee4b47519 Paolo Bonzini       2021-08-17  175  	if (sp->role.ad_disabled)
dc1ae59fc4310b Lai Jiangshan       2023-01-05  176  		spte |= SPTE_TDP_AD_DISABLED;
ce92ef7604ffe7 Sean Christopherson 2021-11-17  177  	else if (kvm_mmu_page_ad_need_write_protect(sp))
dc1ae59fc4310b Lai Jiangshan       2023-01-05  178  		spte |= SPTE_TDP_AD_WRPROT_ONLY;
8a406c89532c91 Sean Christopherson 2021-02-25  179  
5a9624affe7c74 Paolo Bonzini       2020-10-16  180  	spte |= shadow_present_mask;
2839180ce5bb27 Paolo Bonzini       2021-09-29  181  	if (!prefetch)
5a9624affe7c74 Paolo Bonzini       2020-10-16  182  		spte |= spte_shadow_accessed_mask(spte);
5a9624affe7c74 Paolo Bonzini       2020-10-16  183  
b5b0977f4aa28e Sean Christopherson 2022-10-19  184  	/*
b5b0977f4aa28e Sean Christopherson 2022-10-19  185  	 * For simplicity, enforce the NX huge page mitigation even if not
b5b0977f4aa28e Sean Christopherson 2022-10-19  186  	 * strictly necessary.  KVM could ignore the mitigation if paging is
50f13998451eff Mathias Krause      2023-03-22  187  	 * disabled in the guest, as the guest doesn't have any page tables to
b5b0977f4aa28e Sean Christopherson 2022-10-19  188  	 * abuse.  But to safely ignore the mitigation, KVM would have to
b5b0977f4aa28e Sean Christopherson 2022-10-19  189  	 * ensure a new MMU is loaded (or all shadow pages zapped) when CR0.PG
b5b0977f4aa28e Sean Christopherson 2022-10-19  190  	 * is toggled on, and that's a net negative for performance when TDP is
b5b0977f4aa28e Sean Christopherson 2022-10-19  191  	 * enabled.  When TDP is disabled, KVM will always switch to a new MMU
b5b0977f4aa28e Sean Christopherson 2022-10-19  192  	 * when CR0.PG is toggled, but leveraging that to ignore the mitigation
b5b0977f4aa28e Sean Christopherson 2022-10-19  193  	 * would tie make_spte() further to vCPU/MMU state, and add complexity
b5b0977f4aa28e Sean Christopherson 2022-10-19  194  	 * just to optimize a mode that is anything but performance critical.
b5b0977f4aa28e Sean Christopherson 2022-10-19  195  	 */
5a9624affe7c74 Paolo Bonzini       2020-10-16  196  	if (level > PG_LEVEL_4K && (pte_access & ACC_EXEC_MASK) &&
084cc29f8bbb03 Ben Gardon          2022-06-13  197  	    is_nx_huge_page_enabled(vcpu->kvm)) {
5a9624affe7c74 Paolo Bonzini       2020-10-16  198  		pte_access &= ~ACC_EXEC_MASK;
5a9624affe7c74 Paolo Bonzini       2020-10-16  199  	}
5a9624affe7c74 Paolo Bonzini       2020-10-16  200  
5a9624affe7c74 Paolo Bonzini       2020-10-16  201  	if (pte_access & ACC_EXEC_MASK)
5a9624affe7c74 Paolo Bonzini       2020-10-16  202  		spte |= shadow_x_mask;
5a9624affe7c74 Paolo Bonzini       2020-10-16  203  	else
5a9624affe7c74 Paolo Bonzini       2020-10-16  204  		spte |= shadow_nx_mask;
5a9624affe7c74 Paolo Bonzini       2020-10-16  205  
5a9624affe7c74 Paolo Bonzini       2020-10-16  206  	if (pte_access & ACC_USER_MASK)
5a9624affe7c74 Paolo Bonzini       2020-10-16  207  		spte |= shadow_user_mask;
5a9624affe7c74 Paolo Bonzini       2020-10-16  208  
5a9624affe7c74 Paolo Bonzini       2020-10-16  209  	if (level > PG_LEVEL_4K)
5a9624affe7c74 Paolo Bonzini       2020-10-16  210  		spte |= PT_PAGE_SIZE_MASK;
38bf9d7bf277bb Sean Christopherson 2022-07-15  211  
38bf9d7bf277bb Sean Christopherson 2022-07-15  212  	if (shadow_memtype_mask)
896046474f8d2e Wei Wang            2024-05-07  213  		spte |= kvm_x86_call(get_mt_mask)(vcpu, gfn,
5a9624affe7c74 Paolo Bonzini       2020-10-16  214  						  kvm_is_mmio_pfn(pfn));
5a9624affe7c74 Paolo Bonzini       2020-10-16  215  	if (host_writable)
5fc3424f8b8545 Sean Christopherson 2021-02-25  216  		spte |= shadow_host_writable_mask;
5a9624affe7c74 Paolo Bonzini       2020-10-16  217  	else
5a9624affe7c74 Paolo Bonzini       2020-10-16  218  		pte_access &= ~ACC_WRITE_MASK;
5a9624affe7c74 Paolo Bonzini       2020-10-16  219  
e54f1ff244ac96 Kai Huang           2022-04-19  220  	if (shadow_me_value && !kvm_is_mmio_pfn(pfn))
e54f1ff244ac96 Kai Huang           2022-04-19  221  		spte |= shadow_me_value;
5a9624affe7c74 Paolo Bonzini       2020-10-16  222  
5a9624affe7c74 Paolo Bonzini       2020-10-16  223  	spte |= (u64)pfn << PAGE_SHIFT;
5a9624affe7c74 Paolo Bonzini       2020-10-16  224  
5a9624affe7c74 Paolo Bonzini       2020-10-16  225  	if (pte_access & ACC_WRITE_MASK) {
5fc3424f8b8545 Sean Christopherson 2021-02-25  226  		spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask;
5a9624affe7c74 Paolo Bonzini       2020-10-16  227  
0337f585f57fc8 Sean Christopherson 2021-06-22  228  		/*
0337f585f57fc8 Sean Christopherson 2021-06-22  229  		 * Unsync shadow pages that are reachable by the new, writable
0337f585f57fc8 Sean Christopherson 2021-06-22  230  		 * SPTE.  Write-protect the SPTE if the page can't be unsync'd,
0337f585f57fc8 Sean Christopherson 2021-06-22  231  		 * e.g. it's write-tracked (upper-level SPs) or has one or more
0337f585f57fc8 Sean Christopherson 2021-06-22  232  		 * shadow pages and unsync'ing pages is not allowed.
e68f0bf34a72fd Sean Christopherson 2024-08-12  233  		 *
e68f0bf34a72fd Sean Christopherson 2024-08-12  234  		 * When overwriting an existing leaf SPTE, and the old SPTE was
e68f0bf34a72fd Sean Christopherson 2024-08-12  235  		 * writable, skip trying to unsync shadow pages as any relevant
e68f0bf34a72fd Sean Christopherson 2024-08-12  236  		 * shadow pages must already be unsync, i.e. the hash lookup is
e68f0bf34a72fd Sean Christopherson 2024-08-12  237  		 * unnecessary (and expensive).  Note, this relies on KVM not
e68f0bf34a72fd Sean Christopherson 2024-08-12  238  		 * changing PFNs without first zapping the old SPTE, which is
e68f0bf34a72fd Sean Christopherson 2024-08-12  239  		 * guaranteed by both the shadow MMU and the TDP MMU.
e68f0bf34a72fd Sean Christopherson 2024-08-12  240  		 */
0337f585f57fc8 Sean Christopherson 2021-06-22 @241  		 */
e68f0bf34a72fd Sean Christopherson 2024-08-12  242  		if ((!is_last_spte(old_spte, level) || !is_writable_pte(old_spte)) &&
e68f0bf34a72fd Sean Christopherson 2024-08-12  243  		    mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, can_unsync, prefetch)) {
ad67e4806e4c2d Paolo Bonzini       2021-08-17  244  			wrprot = true;
5a9624affe7c74 Paolo Bonzini       2020-10-16  245  			pte_access &= ~ACC_WRITE_MASK;
5fc3424f8b8545 Sean Christopherson 2021-02-25  246  			spte &= ~(PT_WRITABLE_MASK | shadow_mmu_writable_mask);
5a9624affe7c74 Paolo Bonzini       2020-10-16  247  		}
5a9624affe7c74 Paolo Bonzini       2020-10-16  248  	}
5a9624affe7c74 Paolo Bonzini       2020-10-16  249  
5a9624affe7c74 Paolo Bonzini       2020-10-16  250  	if (pte_access & ACC_WRITE_MASK)
5a9624affe7c74 Paolo Bonzini       2020-10-16  251  		spte |= spte_shadow_dirty_mask(spte);
5a9624affe7c74 Paolo Bonzini       2020-10-16  252  
2839180ce5bb27 Paolo Bonzini       2021-09-29  253  	if (prefetch)
5a9624affe7c74 Paolo Bonzini       2020-10-16  254  		spte = mark_spte_for_access_track(spte);
5a9624affe7c74 Paolo Bonzini       2020-10-16  255  
3b77daa5efe1cb Sean Christopherson 2021-06-22  256  	WARN_ONCE(is_rsvd_spte(&vcpu->arch.mmu->shadow_zero_check, spte, level),
3b77daa5efe1cb Sean Christopherson 2021-06-22  257  		  "spte = 0x%llx, level = %d, rsvd bits = 0x%llx", spte, level,
3b77daa5efe1cb Sean Christopherson 2021-06-22  258  		  get_rsvd_bits(&vcpu->arch.mmu->shadow_zero_check, spte, level));
3b77daa5efe1cb Sean Christopherson 2021-06-22  259  
e0e087c8f2241b Sean Christopherson 2024-03-19  260  	/*
e0e087c8f2241b Sean Christopherson 2024-03-19  261  	 * Mark the memslot dirty *after* modifying it for access tracking.
e0e087c8f2241b Sean Christopherson 2024-03-19  262  	 * Unlike folios, memslots can be safely marked dirty out of mmu_lock,
e0e087c8f2241b Sean Christopherson 2024-03-19  263  	 * i.e. in the fast page fault handler.
e0e087c8f2241b Sean Christopherson 2024-03-19  264  	 */
53597858dbf8da David Matlack       2021-08-17  265  	if ((spte & PT_WRITABLE_MASK) && kvm_slot_dirty_track_enabled(slot)) {
53597858dbf8da David Matlack       2021-08-17  266  		/* Enforced by kvm_mmu_hugepage_adjust. */
20ba462dfda6a9 Sean Christopherson 2023-07-28  267  		WARN_ON_ONCE(level > PG_LEVEL_4K);
53597858dbf8da David Matlack       2021-08-17  268  		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
53597858dbf8da David Matlack       2021-08-17  269  	}
bcc4f2bc502663 Paolo Bonzini       2021-09-24  270  
5a9624affe7c74 Paolo Bonzini       2020-10-16  271  	*new_spte = spte;
ad67e4806e4c2d Paolo Bonzini       2021-08-17  272  	return wrprot;
5a9624affe7c74 Paolo Bonzini       2020-10-16  273  }
5a9624affe7c74 Paolo Bonzini       2020-10-16  274  

:::::: The code at line 241 was first introduced by commit
:::::: 0337f585f57fc80a50e0645ca709512687185c72 KVM: x86/mmu: Rename unsync helper and update related comments

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
