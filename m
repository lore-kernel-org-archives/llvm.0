Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F71A76A4;
	Thu, 12 Sep 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726147629; cv=none; b=O4UHYz5OMdUA1ZHG2juYVoKD00mS6zP2KJ/cpUacpAWNQWb0gJ2oVU7Oh3nlOygxuudMx4+tu7smsRdorEz665BHCHYz+wCgCJ5snzhmEBckyOsGtbvYcp6oQcrV562m21V/E/jnHMLjeKoFFK0HxZwNKJdXQc/O5LjTNEKJtLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726147629; c=relaxed/simple;
	bh=tUaS76VvQX4XGFhuk6gjFwHoQxCFkYEuml2w3T1DJ/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGvNxZowkco+4vwklurZi5+M23f/GxZZxbZnTRC/efLrvGHWUBWS/kvGdNjufZFFdB/7gE3XBCdvxFa35aHBCyI3CpAZePBM7XZlZI78sj7YD5tv+Lf7Wi70HtMpN/wQ1/008feHXftR19IfAa28YzFoSAwB0abL4ZlgKrhG0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1Z6jPDT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1Z6jPDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726147627; x=1757683627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tUaS76VvQX4XGFhuk6gjFwHoQxCFkYEuml2w3T1DJ/E=;
  b=n1Z6jPDTExo2m77EAI1sUclpbBrdpo52kTI0kQolS3aqBysmnJdo5IYd
   wDdMhC4pUDrfs7tgjcIXCIf7Noy5tot1YoH4nhyDLt+CzxLHoRgIjbyC3
   bAXuLw9hfL0iPLeyMlFcMnyONQf5tbaO8+S/CfKxnkCOcpKUzrTMni5d8
   3iaegXLbV2GzqFFvar140hKz7lzIPZ1ocCEn5WuQ84zsCMU9BGaiDprNI
   KOK6mAflPvw4rPggGj6P6X1RscwYnGU7M3bFGZwB66IETgeL35glp7qug
   Sk0TZdGm20gYsOwswBVZY1z8Cf/R3fjugnOk3kCW+bSqb8jtdRsfM6cYK
   w==;
X-CSE-ConnectionGUID: 3gLxYIceS0ewwselI7F6Yg==
X-CSE-MsgGUID: xc/kKvTZT0q4S+LsviPhHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24873074"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="24873074"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 06:27:07 -0700
X-CSE-ConnectionGUID: pQ2ZG9unS2e3JtVKjW+iTw==
X-CSE-MsgGUID: NYS44og0SFeXSbvdpqmaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72519619"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 06:27:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sojqc-0005DX-1Z;
	Thu, 12 Sep 2024 13:26:58 +0000
Date: Thu, 12 Sep 2024 21:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	david@redhat.com, willy@infradead.org,
	kirill.shutemov@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	catalin.marinas@arm.com, cl@gentwo.org, vbabka@suse.cz,
	mhocko@suse.com, apopple@nvidia.com, dave.hansen@linux.intel.com,
	will@kernel.org, baohua@kernel.org, jack@suse.cz,
	mark.rutland@arm.com, hughd@google.com, aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com, peterx@redhat.com, ioworker0@gmail.com,
	jglisse@google.com, wangkefeng.wang@huawei.com, ziy@nvidia.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v3 1/2] mm: Abstract THP allocation
Message-ID: <202409122144.jqe4JROY-lkp@intel.com>
References: <20240911065600.1002644-2-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911065600.1002644-2-dev.jain@arm.com>

Hi Dev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11-rc7]
[also build test WARNING on linus/master]
[cannot apply to akpm-mm/mm-everything next-20240912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Abstract-THP-allocation/20240911-145809
base:   v6.11-rc7
patch link:    https://lore.kernel.org/r/20240911065600.1002644-2-dev.jain%40arm.com
patch subject: [PATCH v3 1/2] mm: Abstract THP allocation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240912/202409122144.jqe4JROY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122144.jqe4JROY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122144.jqe4JROY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:1012:6: warning: variable 'pgtable' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1012 |         if (unlikely(!folio)) {
         |             ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:1051:6: note: uninitialized use occurs here
    1051 |         if (pgtable)
         |             ^~~~~~~
   mm/huge_memory.c:1012:2: note: remove the 'if' if its condition is always false
    1012 |         if (unlikely(!folio)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
    1013 |                 ret = VM_FAULT_FALLBACK;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
    1014 |                 goto release;
         |                 ~~~~~~~~~~~~~
    1015 |         }
         |         ~
   mm/huge_memory.c:1006:19: note: initialize the variable 'pgtable' to silence this warning
    1006 |         pgtable_t pgtable;
         |                          ^
         |                           = NULL
   1 warning generated.


vim +1012 mm/huge_memory.c

  1001	
  1002	static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
  1003	{
  1004		struct vm_area_struct *vma = vmf->vma;
  1005		struct folio *folio;
  1006		pgtable_t pgtable;
  1007		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
  1008		vm_fault_t ret = 0;
  1009		gfp_t gfp = vma_thp_gfp_mask(vma);
  1010	
  1011		folio = pmd_thp_fault_alloc(gfp, vma, haddr, vmf->address);
> 1012		if (unlikely(!folio)) {
  1013			ret = VM_FAULT_FALLBACK;
  1014			goto release;
  1015		}
  1016	
  1017		pgtable = pte_alloc_one(vma->vm_mm);
  1018		if (unlikely(!pgtable)) {
  1019			ret = VM_FAULT_OOM;
  1020			goto release;
  1021		}
  1022	
  1023		vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
  1024	
  1025		if (unlikely(!pmd_none(*vmf->pmd))) {
  1026			goto unlock_release;
  1027		} else {
  1028			ret = check_stable_address_space(vma->vm_mm);
  1029			if (ret)
  1030				goto unlock_release;
  1031	
  1032			/* Deliver the page fault to userland */
  1033			if (userfaultfd_missing(vma)) {
  1034				spin_unlock(vmf->ptl);
  1035				folio_put(folio);
  1036				pte_free(vma->vm_mm, pgtable);
  1037				ret = handle_userfault(vmf, VM_UFFD_MISSING);
  1038				VM_BUG_ON(ret & VM_FAULT_FALLBACK);
  1039				return ret;
  1040			}
  1041			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
  1042			map_pmd_thp(folio, vmf, vma, haddr);
  1043			spin_unlock(vmf->ptl);
  1044			__pmd_thp_fault_success_stats(vma);
  1045		}
  1046	
  1047		return 0;
  1048	unlock_release:
  1049		spin_unlock(vmf->ptl);
  1050	release:
  1051		if (pgtable)
  1052			pte_free(vma->vm_mm, pgtable);
  1053		if (folio)
  1054			folio_put(folio);
  1055		return ret;
  1056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
