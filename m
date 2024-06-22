Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F69273FE;
	Sat, 22 Jun 2024 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719044263; cv=none; b=bsIA66TEOOItOTP2i9hY3nWZ7Dl/siz1EEJhD4xDMVq5k2V+aPHe5bLmbXDB9ZYqjP8Z+oePUAjjVj7okUqcio+Uym74t6CYqHaAhTBGJzrDLtq/VJbwTqRQ08Rdqj9ESIxPpve0SduI44tAS1ocGBJTNYUNmGceay4Jlzir5/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719044263; c=relaxed/simple;
	bh=CENWCEqKv2I2uZ38LlPphZKwY1oKxsnYHi+fNRPBOnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHen6ztbsFgU2wL/d4WrGeeb84WvKs+vdIEkV2QaiCvwbgiZazBWIzuaeTu4iFm6eIG84KjT5m8feeuhEy1FaF90tww3jhlYlhPKmTS+Vm39fxhzsCwT4mI5sf2I4fk7CN3rN6nIAIx5SyDUTX4Tb4fKscU+JoR+Z+W9fmQFrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5gjYPDV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5gjYPDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719044261; x=1750580261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CENWCEqKv2I2uZ38LlPphZKwY1oKxsnYHi+fNRPBOnY=;
  b=Y5gjYPDV/ywdhSULKkOss0SAEUzntjpCxAKSKZ2bUV/iWxhCVNgvblhx
   q5izpOAiVQTRV/pm4k0pn1/i43ccb9zPcp4+8v+qnkI9aogqG/Ilp9P3y
   IZV9Sh3Rwy5K6+zHS/dCgc8m2gMRbofScnbFJTKNx8e2FB0n2uakH5ZDY
   8g7nazlZltIuPd0AtZexbkm6Ui0bj9liN4VoCpHshnOWXaYCgJKVSQavT
   LBtdcXNHvaWhJUH6UUErXwZeUakKMRzfRLaOVQ9lCPzwU1jYTPeolkYci
   akqf2Y+GU1wib+Ax6P6gQRSYOLL2p/ES4HmbAXs7zpx5sgHnmlQVEZS9+
   w==;
X-CSE-ConnectionGUID: l7ycFA4KSp+h9RIhXB9szA==
X-CSE-MsgGUID: jcoe6f/USfGVIuGe4bsWKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19965511"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="19965511"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 01:17:40 -0700
X-CSE-ConnectionGUID: eDMYFCSTRFeJvFSACdQ7dg==
X-CSE-MsgGUID: dGNg9oFQSJmsIKGnz04OiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="80327290"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2024 01:17:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKvwG-0009RK-1R;
	Sat, 22 Jun 2024 08:17:36 +0000
Date: Sat, 22 Jun 2024 16:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 7/28]
 arch/x86/kvm/mmu/paging_tmpl.h:555:50: error: 'struct page **' and 'struct
 page *' are not pointers to compatible types
Message-ID: <202406221621.juDuxt5k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   57ff012a34bc3bfac1ebb0724078e8fe47fdb60a
commit: 85294ecb09b3f377a64f374c2841967c6be774eb [7/28] KVM: x86/mmu: Use
config: i386-buildonly-randconfig-002-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221621.juDuxt5k-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221621.juDuxt5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221621.juDuxt5k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:4822:
>> arch/x86/kvm/mmu/paging_tmpl.h:555:50: error: 'struct page **' and 'struct page *' are not pointers to compatible types
     555 |         mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
         |                                                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:19:53: note: expanded from macro '__page_to_pfn'
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^ ~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4822:
>> arch/x86/kvm/mmu/paging_tmpl.h:556:25: error: incompatible pointer types passing 'struct page *[1]' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     556 |         kvm_release_page_clean(page);
         |                                ^~~~
   include/linux/kvm_host.h:1209:42: note: passing argument to parameter 'page' here
    1209 | void kvm_release_page_clean(struct page *page);
         |                                          ^
   In file included from arch/x86/kvm/mmu/mmu.c:4826:
>> arch/x86/kvm/mmu/paging_tmpl.h:555:50: error: 'struct page **' and 'struct page *' are not pointers to compatible types
     555 |         mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
         |                                                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:19:53: note: expanded from macro '__page_to_pfn'
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^ ~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4826:
>> arch/x86/kvm/mmu/paging_tmpl.h:556:25: error: incompatible pointer types passing 'struct page *[1]' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     556 |         kvm_release_page_clean(page);
         |                                ^~~~
   include/linux/kvm_host.h:1209:42: note: passing argument to parameter 'page' here
    1209 | void kvm_release_page_clean(struct page *page);
         |                                          ^
   In file included from arch/x86/kvm/mmu/mmu.c:4830:
>> arch/x86/kvm/mmu/paging_tmpl.h:555:50: error: 'struct page **' and 'struct page *' are not pointers to compatible types
     555 |         mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
         |                                                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: expanded from macro 'page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:19:53: note: expanded from macro '__page_to_pfn'
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^ ~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4830:
>> arch/x86/kvm/mmu/paging_tmpl.h:556:25: error: incompatible pointer types passing 'struct page *[1]' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     556 |         kvm_release_page_clean(page);
         |                                ^~~~
   include/linux/kvm_host.h:1209:42: note: passing argument to parameter 'page' here
    1209 | void kvm_release_page_clean(struct page *page);
         |                                          ^
   6 errors generated.


vim +555 arch/x86/kvm/mmu/paging_tmpl.h

   531	
   532	static bool
   533	FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
   534			     u64 *spte, pt_element_t gpte)
   535	{
   536		struct kvm_memory_slot *slot;
   537		struct page *page[1];
   538		unsigned pte_access;
   539		gfn_t gfn;
   540	
   541		if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
   542			return false;
   543	
   544		gfn = gpte_to_gfn(gpte);
   545		pte_access = sp->role.access & FNAME(gpte_access)(gpte);
   546		FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
   547	
   548		slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, pte_access & ACC_WRITE_MASK);
   549		if (!slot)
   550			return false;
   551	
   552		if (gfn_to_page_many_atomic(slot, gfn, page, 1) != 1)
   553			return false;
   554	
 > 555		mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
 > 556		kvm_release_page_clean(page);
   557		return true;
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
