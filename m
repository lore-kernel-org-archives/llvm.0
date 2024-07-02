Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EBC1BE849;
	Tue,  2 Jul 2024 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719942195; cv=none; b=aks5sZG6yuCAkM/7Y1hStPyVsjGZoz86HPbZHgGM2xYo6S/PDUfTDEz9hlwxmZ6lGVNtnZVTE3rhd3PLhmHObl9fELmXFHmFlrAqUpqk21cTbJn8VtgIeMR84CVCSOiS8oCHXv0nOJURair/I7FPJ0vRIcTKNkQBO7BeTzlHtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719942195; c=relaxed/simple;
	bh=O7b7qKMxkIfAS7EHP8HjWDosiM650B/nyjHx/9PDK0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lytFgew9wb0pDvqbvtBUNCXu0fvdja8z7l+yvPJwkE5N/H1Vua6N2dQG1ph1oidtsoe290YaDfIi3NV0gQ8Ox6NG/uf9DS8Kbh7N/lqGpPtp47L1adrUq5M42a5zfnwAp0VBbn2m2WuF2J9cz+Cc0CDQjpJzAnmmvluvTOu79eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mORdXLFT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mORdXLFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719942194; x=1751478194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7b7qKMxkIfAS7EHP8HjWDosiM650B/nyjHx/9PDK0M=;
  b=mORdXLFT8KFTUZglu94cWd/L96qLSnHlwyDRNeldAuDOHj1Kh3SPVyTk
   UkGvjxmtNbEkWio25WDWlRZSFXzqRhTEalqnrbJiT+caGZCXmEprC0fvD
   6a0LBha2nLloERhWOWAnuGF0dUJMA8r9LfslIjrtirp3BEefA25jBeoNl
   N+MnJNoj6gGDDsb73QVpoMlU1wlNtQopWnAabFX3Aj5CSbj9HcW91EI3Z
   eQPTbKikI4ZXSAeLf0x0ZySE+PmYxlQOmJjB/aWsNzk9bPzgkkPaFfHQJ
   kdzZMLyPx+/4vX9x3uyaGzJ7VGPTjcjKP4oxtyd5JwhvOQQb4KZY26Us/
   Q==;
X-CSE-ConnectionGUID: 6cHGQ9rFQke5nLhRnW9Atg==
X-CSE-MsgGUID: EYd6mg4hSc+8LDzEG7l3pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17264335"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17264335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 10:43:13 -0700
X-CSE-ConnectionGUID: TGJ7vm9kRTu6uVfCZss4Ng==
X-CSE-MsgGUID: M7XCL8v4Ql+4Mt/PcJva9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45887625"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2024 10:43:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOhX3-000OTf-0Z;
	Tue, 02 Jul 2024 17:43:09 +0000
Date: Wed, 3 Jul 2024 01:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/7] x86: select ARCH_SUPPORTS_PT_RECLAIM if X86_64
Message-ID: <202407030101.H0oWNjhx-lkp@intel.com>
References: <0f3aacc9707da962398de71c127e7771c6798062.1719570849.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f3aacc9707da962398de71c127e7771c6798062.1719570849.git.zhengqi.arch@bytedance.com>

Hi Qi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20240702]
[cannot apply to tip/x86/core linus/master tip/x86/mm v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-pgtable-make-pte_offset_map_nolock-return-pmdval/20240701-165916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/0f3aacc9707da962398de71c127e7771c6798062.1719570849.git.zhengqi.arch%40bytedance.com
patch subject: [RFC PATCH 7/7] x86: select ARCH_SUPPORTS_PT_RECLAIM if X86_64
config: x86_64-buildonly-randconfig-002-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030101.H0oWNjhx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030101.H0oWNjhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030101.H0oWNjhx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/pgtable.c:57:2: error: call to undeclared function 'paravirt_tlb_remove_table'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         paravirt_tlb_remove_table(tlb, pte);
         |         ^
   arch/x86/mm/pgtable.c:57:2: note: did you mean '__tlb_remove_table'?
   arch/x86/include/asm/tlb.h:32:20: note: '__tlb_remove_table' declared here
      32 | static inline void __tlb_remove_table(void *table)
         |                    ^
   arch/x86/mm/pgtable.c:73:2: error: call to undeclared function 'paravirt_tlb_remove_table'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
         |         ^
   arch/x86/mm/pgtable.c:83:2: error: call to undeclared function 'paravirt_tlb_remove_table'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         paravirt_tlb_remove_table(tlb, virt_to_page(pud));
         |         ^
   3 errors generated.


vim +/paravirt_tlb_remove_table +57 arch/x86/mm/pgtable.c

14315592009c17 Ian Campbell           2010-02-17  52  
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22  53  void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
397f687ab7f840 Jeremy Fitzhardinge    2008-03-17  54  {
f92c494f420a9f Vishal Moola (Oracle   2023-08-07  55) 	pagetable_pte_dtor(page_ptdesc(pte));
6944a9c8945212 Jeremy Fitzhardinge    2008-03-17  56  	paravirt_release_pte(page_to_pfn(pte));
48a8b97cfd804a Peter Zijlstra         2018-08-22 @57  	paravirt_tlb_remove_table(tlb, pte);
397f687ab7f840 Jeremy Fitzhardinge    2008-03-17  58  }
397f687ab7f840 Jeremy Fitzhardinge    2008-03-17  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
