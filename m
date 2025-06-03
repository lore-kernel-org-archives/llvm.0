Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8022CBFE;
	Tue,  3 Jun 2025 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950988; cv=none; b=C+G/QsTjjcyq51CHm0ueevQz23jDOYX7+Sy+/nDzpTMe1kaYmHGVvnWGMdZ9YbumNB9VBShSLXfdQtm4HY1/kDJaH5YRhbSOu02F9YYoX17oC3Iu9z5OUZlLGY9oYyEM9JFyxdBS2lXMPr4AQbruh+cHXTRgA9cTI2u0cNp8aKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950988; c=relaxed/simple;
	bh=LZdnzDOSs8kijLJfM97LmLOxJJVsrrY3fhD5QFWoWpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jl2ALRvzojetjbRigZJ1NyOlAhsQLbFnelJvv9XlcMR8BUbpXYTuY4pJMLRmdoFeSN1pZz2gpKpRJhbidzTi7MLTQuB1srIEAM7cBRx7gHFqaYEaXCt8MTkGpaaNwPjzgESqmskE4vf/ShnWzpcxrkKbZbLpPsTLDyv/fdFZqs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5LAiNLf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5LAiNLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748950986; x=1780486986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZdnzDOSs8kijLJfM97LmLOxJJVsrrY3fhD5QFWoWpc=;
  b=Q5LAiNLfyOon9pUYvgF1n16EvD/FjTjDTJmO/DZCUXLzV2UjfTS4MvRs
   KH+d9JGwecOgG8JfPjbdUZ/AqNzqoPG/wnG1lfG8OOS1JhkPG8R3ZkXGG
   q/X+spMGBZpJARMwim25AbV7WR4DGdZrGPBUCHHMKlVJYwSQVAND5jT0S
   fWRP1hzJzwcdSLTPPfFKId9iaeMl2qMXobX8NE6fV9IafqlplFlvCuc9P
   O5J+eAf570ynI+IKBhU593gjdoI05oSUM4Vg20uDBSf2DRi8x6wvhM6pv
   jsT1Bm+rgtOLfntObzrEdW7LftvXZHIspBzYcek47i1mZBJqrxZLEFI9W
   A==;
X-CSE-ConnectionGUID: tRWLPCutSximbdEzOp1sPw==
X-CSE-MsgGUID: St9s5y7aS2KSKDTmqjKgtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51055260"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="51055260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:43:06 -0700
X-CSE-ConnectionGUID: x7J/5jsrRTCf3HQsoJubTg==
X-CSE-MsgGUID: kjO5cW44TUGXA5dHsSvqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="145792886"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2025 04:43:04 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMQ2o-0001Uk-2W;
	Tue, 03 Jun 2025 11:43:02 +0000
Date: Tue, 3 Jun 2025 19:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:tdx/dpamt 15/17] arch/x86/kvm/mmu/tdp_mmu.c:58:2: error: call
 to undeclared function 'tdx_free_pamt_pages'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202506031927.cjuKRC0i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git tdx/dpamt
head:   1fd1b5ba222a7b9084917c03e49601c2eb5906a0
commit: 4bec5bcd633b7c1bad86891caf0d5bc2c6745061 [15/17] split
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250603/202506031927.cjuKRC0i-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031927.cjuKRC0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031927.cjuKRC0i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/tdp_mmu.c:58:2: error: call to undeclared function 'tdx_free_pamt_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         tdx_free_pamt_pages(&sp->pamt_pages);
         |         ^
   arch/x86/kvm/mmu/tdp_mmu.c:58:2: note: did you mean 'tdx_nr_pamt_pages'?
   arch/x86/include/asm/tdx.h:214:19: note: 'tdx_nr_pamt_pages' declared here
     214 | static inline int tdx_nr_pamt_pages(const struct tdx_sys_info *sysinfo) { return 0; }
         |                   ^
>> arch/x86/kvm/mmu/tdp_mmu.c:58:27: error: no member named 'pamt_pages' in 'struct kvm_mmu_page'
      58 |         tdx_free_pamt_pages(&sp->pamt_pages);
         |                              ~~  ^
>> arch/x86/kvm/mmu/tdp_mmu.c:60:3: error: call to undeclared function 'tdx_free_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |                 tdx_free_page(virt_to_page(sp->external_spt));
         |                 ^
   arch/x86/kvm/mmu/tdp_mmu.c:223:22: error: no member named 'pamt_pages' in 'struct kvm_mmu_page'
     223 |         INIT_LIST_HEAD(&sp->pamt_pages);
         |                         ~~  ^
   arch/x86/kvm/mmu/tdp_mmu.c:1629:22: error: no member named 'pamt_pages' in 'struct kvm_mmu_page'
    1629 |         INIT_LIST_HEAD(&sp->pamt_pages);
         |                         ~~  ^
>> arch/x86/kvm/mmu/tdp_mmu.c:1638:9: error: call to undeclared function 'tdx_alloc_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1638 |         page = tdx_alloc_page();
         |                ^
>> arch/x86/kvm/mmu/tdp_mmu.c:1638:7: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
    1638 |         page = tdx_alloc_page();
         |              ^ ~~~~~~~~~~~~~~~~
>> arch/x86/kvm/mmu/tdp_mmu.c:1643:6: error: call to undeclared function 'tdx_alloc_pamt_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1643 |         if (tdx_alloc_pamt_pages(&sp->pamt_pages, NULL))
         |             ^
   arch/x86/kvm/mmu/tdp_mmu.c:1643:6: note: did you mean 'tdx_nr_pamt_pages'?
   arch/x86/include/asm/tdx.h:214:19: note: 'tdx_nr_pamt_pages' declared here
     214 | static inline int tdx_nr_pamt_pages(const struct tdx_sys_info *sysinfo) { return 0; }
         |                   ^
   arch/x86/kvm/mmu/tdp_mmu.c:1643:32: error: no member named 'pamt_pages' in 'struct kvm_mmu_page'
    1643 |         if (tdx_alloc_pamt_pages(&sp->pamt_pages, NULL))
         |                                   ~~  ^
   arch/x86/kvm/mmu/tdp_mmu.c:1649:3: error: call to undeclared function 'tdx_free_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1649 |                 tdx_free_page(page);
         |                 ^
   10 errors generated.


vim +/tdx_free_pamt_pages +58 arch/x86/kvm/mmu/tdp_mmu.c

    55	
    56	static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
    57	{
  > 58		tdx_free_pamt_pages(&sp->pamt_pages);
    59		if (sp->external_spt)
  > 60			tdx_free_page(virt_to_page(sp->external_spt));
    61		free_page((unsigned long)sp->spt);
    62		kmem_cache_free(mmu_page_header_cache, sp);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
