Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E1266A7;
	Fri, 15 Aug 2025 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755286946; cv=none; b=dzP90QVsqXbnUFripgrOqxOi+SaS34K0TRsCmNbKPYoNKC+Nw7IpKnJNahkxvAAfTIu3BNn3iJcLHpsD+r8nUh9DrUQ2qZIcddml26bBxQeCH2K1zlkULlldFclhXes2He2WOyCKkaR9nVgp2ILhRW3hYAOQMksIp0OwY4R8Jzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755286946; c=relaxed/simple;
	bh=YDsRt9bglz4Anx9o16eNjIEM/0DTi7m+ySfvYxn5EfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnNk/pI/hxNqzyLCJPYwUG0CayQ6t72WGGcEB84Mx3mDf5WrXbl7YMS/aMZQyGoCcvx01Wj61sbzGsZ9SVgzPn4Z2rbPiUbGMSR3aks2KgBH8Y78TWULHzsCV9p/KhbHYikdrHIh7QyzaWVQ+tJ9XXNQRxtqNUJkYrRVdYKuhyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuxGZJKM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuxGZJKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755286946; x=1786822946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDsRt9bglz4Anx9o16eNjIEM/0DTi7m+ySfvYxn5EfU=;
  b=cuxGZJKMrqpxJUfXxHVMLZOS4uhGRJOvFuRyKS6tLyQXEp7lVsWTOW3y
   Eo3zAEZiAQwsHUskXfCR0w1UjSZMdQqqhRSCTXoBeUS0XUgalexC47OA5
   kZxHR1htHadSmU96K2BXHH1dM6hl5d2T0e5Th7U1SicaBONA5K0FTAtgE
   ge6b+/IHgHxaQGmCU3r4J7jmeJjLEEG4J9qpqlsDFYE3ve8rLaE1x3i6y
   WJVMe25r/+kNGCpVzYZKw/5SzGHCAiNUCRdElBqkOyHBkOmx+C1rUX3F5
   qMGc/vCZq60hoPxhWlcfIcbuj4zu7bAz9e87aXME/6J+5eqGLnuYUtVwy
   w==;
X-CSE-ConnectionGUID: CuZfxgogTbei3VIG5yh0Yg==
X-CSE-MsgGUID: m++0fQTrRWKKmAS1nlF5rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57685498"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57685498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 12:42:25 -0700
X-CSE-ConnectionGUID: 3A+4LzdVQeqfhJbHIKn5JQ==
X-CSE-MsgGUID: 4y8wzIq5QBWJuYXceU6FTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="197940588"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2025 12:42:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un0Jh-000CHo-12;
	Fri, 15 Aug 2025 19:42:21 +0000
Date: Sat, 16 Aug 2025 03:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V3 03/17] mm: Scan the mm and create a migration list
Message-ID: <202508160305.4N7h8utZ-lkp@intel.com>
References: <20250814153307.1553061-4-raghavendra.kt@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814153307.1553061-4-raghavendra.kt@amd.com>

Hi Raghavendra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-K-T/mm-Add-kscand-kthread-for-PTE-A-bit-scan/20250814-233829
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250814153307.1553061-4-raghavendra.kt%40amd.com
patch subject: [RFC PATCH V3 03/17] mm: Scan the mm and create a migration list
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250816/202508160305.4N7h8utZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160305.4N7h8utZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160305.4N7h8utZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kscand.c:194:20: warning: variable 'mm' set but not used [-Wunused-but-set-variable]
     194 |         struct mm_struct *mm;
         |                           ^
   1 warning generated.


vim +/mm +194 mm/kscand.c

   186	
   187	static int hot_vma_idle_pte_entry(pte_t *pte,
   188					 unsigned long addr,
   189					 unsigned long next,
   190					 struct mm_walk *walk)
   191	{
   192		struct page *page;
   193		struct folio *folio;
 > 194		struct mm_struct *mm;
   195		struct vm_area_struct *vma;
   196		struct kscand_migrate_info *info;
   197		struct kscand_scanctrl *scanctrl = walk->private;
   198		int srcnid;
   199	
   200		scanctrl->address = addr;
   201		pte_t pteval = ptep_get(pte);
   202	
   203		if (!pte_present(pteval))
   204			return 0;
   205	
   206		if (pte_none(pteval))
   207			return 0;
   208	
   209		vma = walk->vma;
   210		mm = vma->vm_mm;
   211	
   212		page = pte_page(*pte);
   213	
   214	
   215		folio = page_folio(page);
   216		folio_get(folio);
   217	
   218		if (!is_valid_folio(folio)) {
   219			folio_put(folio);
   220			return 0;
   221		}
   222		folio_set_idle(folio);
   223		page_idle_clear_pte_refs(page, pte, walk);
   224		srcnid = folio_nid(folio);
   225	
   226	
   227		if (!folio_test_lru(folio)) {
   228			folio_put(folio);
   229			return 0;
   230		}
   231	
   232		if (!kscand_eligible_srcnid(srcnid)) {
   233			folio_put(folio);
   234			return 0;
   235		}
   236		if (!folio_test_idle(folio) &&
   237			(folio_test_young(folio) || folio_test_referenced(folio))) {
   238	
   239			/* XXX: Leaking memory. TBD: consume info */
   240	
   241			info = kzalloc(sizeof(struct kscand_migrate_info), GFP_NOWAIT);
   242			if (info && scanctrl) {
   243				info->pfn = folio_pfn(folio);
   244				info->address = addr;
   245				list_add_tail(&info->migrate_node, &scanctrl->scan_list);
   246			}
   247		}
   248	
   249		folio_put(folio);
   250		return 0;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
