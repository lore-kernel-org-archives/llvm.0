Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64126FA4B;
	Tue, 20 May 2025 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760659; cv=none; b=M0yne99wKMFuPrv4ioX0QDnwL7fLtTburtzRNAspGr5jo2b5BU4VdiDVnlC5Gmv31o5lDhvUivQyUedJVCTub1RlddBSrrHyOE9Y5QYhTFxdZhMoUBckUDT8T7yAdwzkklcHz2eiYRQWnCNC9k4EpGJMkqTUNIO+kw2LQivRnlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760659; c=relaxed/simple;
	bh=YLvvwIBYnpG/jk1GRzsYK2XbhHpVwNpqCuHXYSxtbZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcjDckTTW4iHRFvyMfXOn6h8ajsnPejZGOGjRh4bWlaQ0CG1pi7vTIlU6KuB72R7UZqMeJCVhyIMDzkgifL1Vwom0w+KASDYcVlg8VeFnXiFBaoiT9vwzZJTwEytKNOeQe6I2tXu1wF9EixEcSa/crTGwtQpc6Ral1+eBIToNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMeRU/jp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMeRU/jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747760654; x=1779296654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YLvvwIBYnpG/jk1GRzsYK2XbhHpVwNpqCuHXYSxtbZQ=;
  b=MMeRU/jpBMrw1XW9Cu08mFb6Gh4xOh6C7VWKKhMaj5gU1PAMj8xYeoaw
   38Y1IJZLFEv7wlkFtFlpGYTIBp0KpWo8Zr+ksjRukESVRigPjAo3AFA93
   Fsrjey81YsKNkYm4kbAnbfCEU6lWnI0IDCB6fEKtiRPihNIiMweXq0/LN
   3CNkpmdPB85tbZjM9BeAH0xbYGfSNMVYPO9StCobc9EbjeNpIzlhSBINm
   JIHk+mymgR2LDeQyV99MkoXCpV8G64/GO589UBIonw3gZMeXk1Rcu4VON
   /SRQXbLV3DZemSgjpg4Vy4Y0Su6kOUhTB8Ygws/D1LNgjxNTAQbPVCnu9
   w==;
X-CSE-ConnectionGUID: BTo61i57RtegDVBaK1ojTw==
X-CSE-MsgGUID: 1ZOtUWhfQg6yfOcO+Ia5WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60746654"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60746654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:04:14 -0700
X-CSE-ConnectionGUID: nhCRxH3hTQSXSdwg7FCB/Q==
X-CSE-MsgGUID: zAT0vywtS4Wou2wV8VBnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176887907"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2025 10:04:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQNt-000NOa-2i;
	Tue, 20 May 2025 17:04:09 +0000
Date: Wed, 21 May 2025 01:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/5] mm: thp: add struct ops for BPF based THP
 adjustment
Message-ID: <202505210026.wIUy2SJG-lkp@intel.com>
References: <20250520060504.20251-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520060504.20251-4-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-thp-Add-a-new-mode-bpf/20250520-140834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250520060504.20251-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH v2 3/5] mm: thp: add struct ops for BPF based THP adjustment
config: s390-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210026.wIUy2SJG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210026.wIUy2SJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210026.wIUy2SJG-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: mm/memory.o: in function `thp_vma_allowable_orders':
>> include/linux/huge_mm.h:309:(.text+0x43bc0): undefined reference to `hugepage_bpf_allowable'
   s390x-linux-ld: mm/khugepaged.o: in function `thp_vma_allowable_orders':
   include/linux/huge_mm.h:309:(.text+0x1628): undefined reference to `hugepage_bpf_allowable'
   s390x-linux-ld: fs/proc/task_mmu.o: in function `thp_vma_allowable_orders':
   include/linux/huge_mm.h:309:(.text+0xb00e): undefined reference to `hugepage_bpf_allowable'


vim +309 include/linux/huge_mm.h

3485b88390b0af9 Ryan Roberts   2023-12-07  274  
3485b88390b0af9 Ryan Roberts   2023-12-07  275  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  276  					 unsigned long vm_flags,
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  277  					 unsigned long tva_flags,
3485b88390b0af9 Ryan Roberts   2023-12-07  278  					 unsigned long orders);
3485b88390b0af9 Ryan Roberts   2023-12-07  279  
3485b88390b0af9 Ryan Roberts   2023-12-07  280  /**
3485b88390b0af9 Ryan Roberts   2023-12-07  281   * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
3485b88390b0af9 Ryan Roberts   2023-12-07  282   * @vma:  the vm area to check
3485b88390b0af9 Ryan Roberts   2023-12-07  283   * @vm_flags: use these vm_flags instead of vma->vm_flags
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  284   * @tva_flags: Which TVA flags to honour
3485b88390b0af9 Ryan Roberts   2023-12-07  285   * @orders: bitfield of all orders to consider
3485b88390b0af9 Ryan Roberts   2023-12-07  286   *
3485b88390b0af9 Ryan Roberts   2023-12-07  287   * Calculates the intersection of the requested hugepage orders and the allowed
3485b88390b0af9 Ryan Roberts   2023-12-07  288   * hugepage orders for the provided vma. Permitted orders are encoded as a set
3485b88390b0af9 Ryan Roberts   2023-12-07  289   * bit at the corresponding bit position (bit-2 corresponds to order-2, bit-3
3485b88390b0af9 Ryan Roberts   2023-12-07  290   * corresponds to order-3, etc). Order-0 is never considered a hugepage order.
3485b88390b0af9 Ryan Roberts   2023-12-07  291   *
3485b88390b0af9 Ryan Roberts   2023-12-07  292   * Return: bitfield of orders allowed for hugepage in the vma. 0 if no hugepage
3485b88390b0af9 Ryan Roberts   2023-12-07  293   * orders are allowed.
3485b88390b0af9 Ryan Roberts   2023-12-07  294   */
3485b88390b0af9 Ryan Roberts   2023-12-07  295  static inline
3485b88390b0af9 Ryan Roberts   2023-12-07  296  unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  297  				       unsigned long vm_flags,
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  298  				       unsigned long tva_flags,
3485b88390b0af9 Ryan Roberts   2023-12-07  299  				       unsigned long orders)
3485b88390b0af9 Ryan Roberts   2023-12-07  300  {
3485b88390b0af9 Ryan Roberts   2023-12-07  301  	/* Optimization to check if required orders are enabled early. */
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  302  	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
3485b88390b0af9 Ryan Roberts   2023-12-07  303  		unsigned long mask = READ_ONCE(huge_anon_orders_always);
3485b88390b0af9 Ryan Roberts   2023-12-07  304  
3485b88390b0af9 Ryan Roberts   2023-12-07  305  		if (vm_flags & VM_HUGEPAGE)
3485b88390b0af9 Ryan Roberts   2023-12-07  306  			mask |= READ_ONCE(huge_anon_orders_madvise);
3485b88390b0af9 Ryan Roberts   2023-12-07  307  		if (hugepage_global_always() ||
31f9439b0bbc383 Yafang Shao    2025-05-20  308  		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()) ||
31f9439b0bbc383 Yafang Shao    2025-05-20 @309  		    hugepage_bpf_allowable())
3485b88390b0af9 Ryan Roberts   2023-12-07  310  			mask |= READ_ONCE(huge_anon_orders_inherit);
3485b88390b0af9 Ryan Roberts   2023-12-07  311  
3485b88390b0af9 Ryan Roberts   2023-12-07  312  		orders &= mask;
3485b88390b0af9 Ryan Roberts   2023-12-07  313  		if (!orders)
3485b88390b0af9 Ryan Roberts   2023-12-07  314  			return 0;
3485b88390b0af9 Ryan Roberts   2023-12-07  315  	}
3485b88390b0af9 Ryan Roberts   2023-12-07  316  
e0ffb29bc54d86b Matthew Wilcox 2024-04-25  317  	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
3485b88390b0af9 Ryan Roberts   2023-12-07  318  }
43675e6fbbeadca Yang Shi       2019-07-18  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
