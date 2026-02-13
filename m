Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103E3164D3;
	Fri, 13 Feb 2026 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981869; cv=none; b=jGqWGnMGiHDtoE8DBA4XvaJDdlJqLgMr/sp/tIfdyjwdYepX2V+3BV5Vpm5UqzNwhY5iiyjt8kM6jy83oSxr7Y70SjhKIwqlTbdedgMBjb3/jl61liQPs96mGVMggsadSf80DD9yzsK3W9MWdmOQuJnKnRYG+O4gDOpYV+52HUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981869; c=relaxed/simple;
	bh=99ZryHm7b8hGzcv/PlZKzhJlcntP4WxxADdhBY/eAu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wi6eIFzmnNh6Q5YCvW8snYo9kpXDDgDCcn5fi3dHKa1CXS4FbPVEZ/CZzvifptOwTwlhgyK2czqAOJOQjGKx+igN/UGGcbJT5czgrPpb7W2JjCI2UlWHmHD858gETXWkVcX0nsjv93MYjBpi5+qaqu/SqeOVpDqExsAheE/Be8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMKOn1eB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMKOn1eB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981868; x=1802517868;
  h=date:from:to:cc:subject:message-id;
  bh=99ZryHm7b8hGzcv/PlZKzhJlcntP4WxxADdhBY/eAu4=;
  b=VMKOn1eBGD96IxdctPUYAFxKATdIUxZXvITXAPO/o7NPcqKe7fM2/BSi
   vq6LWmFa2GG1BdJ/v4H8Gu3F/vyw3I13/iWmb/nJWRUblNNVQIcpdtigm
   uy9xSoBvCu4mpsG1iOOVVquqHx96NhoTbrp2DUVFycJXxLPOXZb6btZca
   ePP+/JGbpw4mwDjIVBSSNFpYCRYAy2UX9I56+T1ncL4jt3L5qRohCoZFB
   lZF9eCqbdz4JTdGcpx3emkwuGCh9Wl8dDtnBPrVbTU6bNdahSJ5KsGRam
   GXgq2Jf3NDZgJdSEnU6uCujIdxKNEvIEs3mBgyAd5+BaJqUbum/BpPVZA
   w==;
X-CSE-ConnectionGUID: kWHg0CTpQryBdjKtpi1beQ==
X-CSE-MsgGUID: LADn8K5OQL2/6KzDJ9bKng==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71190958"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="71190958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:24:27 -0800
X-CSE-ConnectionGUID: /rPNuiIJRMaWBy5bB5/+iw==
X-CSE-MsgGUID: xmwR7X4mTfu7oMn9wDVbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="217874640"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2026 03:24:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqrHb-00000000vKW-1Zwz;
	Fri, 13 Feb 2026 11:24:23 +0000
Date: Fri, 13 Feb 2026 19:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 15/16] mm/vmalloc.c:806:10: error: call to
 undeclared function 'p4d_pfn'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202602131945.oCd3GIUM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: abf3930fa6ed33226e0965bedc64f461c3647656 [15/16] tmp
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602131945.oCd3GIUM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131945.oCd3GIUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131945.oCd3GIUM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmalloc.c:806:10: error: call to undeclared function 'p4d_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     806 |                 return p4d_pfn(*p4d) + ((addr & ~P4D_MASK) >> PTE_SHIFT);
         |                        ^
   1 error generated.


vim +/p4d_pfn +806 mm/vmalloc.c

   776	
   777	/*
   778	 * Map a vmalloc()-space virtual address to the physical page frame number.
   779	 */
   780	unsigned long vmalloc_to_pfn(const void *vmalloc_addr)
   781	{
   782		unsigned long addr = (unsigned long) vmalloc_addr;
   783		pgd_t *pgd = pgd_offset_k(addr);
   784		p4d_t *p4d;
   785		pud_t *pud;
   786		pmd_t *pmd;
   787		pte_t *ptep, pte;
   788	
   789		/*
   790		 * XXX we might need to change this if we add VIRTUAL_BUG_ON for
   791		 * architectures that do not vmalloc module space
   792		 */
   793		VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
   794	
   795		if (pgd_none(*pgd))
   796			return 0;
   797		if (WARN_ON_ONCE(pgd_leaf(*pgd)))
   798			return 0; /* XXX: no allowance for huge pgd */
   799		if (WARN_ON_ONCE(pgd_bad(*pgd)))
   800			return 0;
   801	
   802		p4d = p4d_offset(pgd, addr);
   803		if (p4d_none(*p4d))
   804			return 0;
   805		if (p4d_leaf(*p4d))
 > 806			return p4d_pfn(*p4d) + ((addr & ~P4D_MASK) >> PTE_SHIFT);
   807		if (WARN_ON_ONCE(p4d_bad(*p4d)))
   808			return 0;
   809	
   810		pud = pud_offset(p4d, addr);
   811		if (pud_none(*pud))
   812			return 0;
   813		if (pud_leaf(*pud))
   814			return pud_pfn(*pud) + ((addr & ~PUD_MASK) >> PTE_SHIFT);
   815		if (WARN_ON_ONCE(pud_bad(*pud)))
   816			return 0;
   817	
   818		pmd = pmd_offset(pud, addr);
   819		if (pmd_none(*pmd))
   820			return 0;
   821		if (pmd_leaf(*pmd))
   822			return pmd_pfn(*pmd) + ((addr & ~PMD_MASK) >> PTE_SHIFT);
   823		if (WARN_ON_ONCE(pmd_bad(*pmd)))
   824			return 0;
   825	
   826		ptep = pte_offset_kernel(pmd, addr);
   827		pte = ptep_get(ptep);
   828		if (pte_present(pte))
   829			return pte_pfn(pte);
   830	
   831		return 0;
   832	}
   833	EXPORT_SYMBOL(vmalloc_to_pfn);
   834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
