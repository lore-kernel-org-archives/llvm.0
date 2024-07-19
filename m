Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909681B86FD;
	Fri, 19 Jul 2024 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721425790; cv=none; b=HcattR4/TiN0atgg7q79KXpqIxQEDg6Vp7rXYPKVZ2IVu3BJlD3H15mXr67Hjglku7mJFco4laoRMb1oRZ80bnh1Fnx/7V1/ZpExO4OoQSrtMFymB6dL2TEGqRfSOKj0+SsvWSngXlo5FvtpTAILiBPVraQh4akm63TQsylXJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721425790; c=relaxed/simple;
	bh=bRESBqr+QmZej4x/QIzifLd9hpEoAXyFGjN/yOaVbOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgeDFLBbKQ/r6pkgImCmOKAkf/1qZRh5q3ZXeS32V9RUxZuBBTrMAsg6Ce+OaT0GmboQUemZU0TNXHGWHMAI9+RxbSN47sWGv36ReBjvtlNJJhSJVAO8az7Xx63LJB84QxA1MKknDwn3L/7pBX2M16kiqUWIgdSwsTpIj2r82oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrz1xH53; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrz1xH53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721425789; x=1752961789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bRESBqr+QmZej4x/QIzifLd9hpEoAXyFGjN/yOaVbOo=;
  b=nrz1xH53aAmrGRvrUbpKBsBEuygxV2d/XWXtM7Tc3cw2C/hcpzO55MZs
   lcqF4XdcxuKQRzQ0nQnlujsRIpxVdZRJkhI3EK3E7grtAF4GJoVDblnxE
   wi3XXfGmrj0Xsei6nrDnJZulnqFiK1Xy8fEDmjmTXaiYOXIDuuc0OHpW+
   DM2IYH/DYc3knXABLVXW0XQPj0UIODGv2q7PDvIrkwfAJtN9chxdTJhD1
   IlJIdBJnxIgq5pwZEBsZkS8xvCaY8pfrNG9KXfJwMM3VvRrHnEg5uyxKn
   niuQSBSryjJEWMtagYde9lBGSBWHCaTuJCnvqjI+UGTbJ7927OFgL9WWF
   w==;
X-CSE-ConnectionGUID: CBq0TJzNQUStKEnq4d7iJw==
X-CSE-MsgGUID: Qa+HKL9RTES/AmXvuIM9KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19241133"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="19241133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 14:49:48 -0700
X-CSE-ConnectionGUID: CX+R0HC9TfCV4GketZQm8w==
X-CSE-MsgGUID: roXzXDIPRPKmVRdqP0sG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="51968747"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jul 2024 14:49:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUvU0-000ibm-1i;
	Fri, 19 Jul 2024 21:49:44 +0000
Date: Sat, 20 Jul 2024 05:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/10] mm/pagewalk.c:739:35: error: too
 many arguments to function call, expected single argument 'ptep', have 3
 arguments
Message-ID: <202407200547.1AzxjkST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   22d5156a61b8f9783984a24990a8a40d3993a513
commit: d80a4597b25823d1bcf9d253452fcbcbef4d5c68 [1/10] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: i386-buildonly-randconfig-001-20240720 (https://download.01.org/0day-ci/archive/20240720/202407200547.1AzxjkST-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200547.1AzxjkST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200547.1AzxjkST-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pagewalk.c:739:35: error: too many arguments to function call, expected single argument 'ptep', have 3 arguments
     739 |                 pte = huge_ptep_get(vma->vm_mm, addr, ptep);
         |                       ~~~~~~~~~~~~~             ^~~~~~~~~~
   include/asm-generic/hugetlb.h:147:21: note: 'huge_ptep_get' declared here
     147 | static inline pte_t huge_ptep_get(pte_t *ptep)
         |                     ^             ~~~~~~~~~~~
   1 error generated.


vim +/ptep +739 mm/pagewalk.c

   723	
   724	static struct folio *folio_walk_start_hugetlb(struct vm_area_struct *vma,
   725			unsigned long addr, struct folio_walk *fw,
   726			folio_walk_flags_t flags)
   727	{
   728	#ifdef CONFIG_HUGETLB_PAGE
   729		struct hstate *h = hstate_vma(vma);
   730		unsigned long hmask = huge_page_mask(h);
   731		unsigned long sz = huge_page_size(h);
   732		struct page *page;
   733		pte_t *ptep, pte;
   734		spinlock_t *ptl;
   735	
   736		ptep = hugetlb_walk(vma, addr & hmask, sz);
   737		if (ptep) {
   738			ptl = huge_pte_lock(hstate_vma(vma), vma->vm_mm, ptep);
 > 739			pte = huge_ptep_get(vma->vm_mm, addr, ptep);
   740			if (pte_present(pte)) {
   741				page = pte_page(pte);
   742				goto found;
   743			} else if (!huge_pte_none(pte)) {
   744				swp_entry_t entry = pte_to_swp_entry(pte);
   745	
   746				if ((flags & FW_MIGRATION_ENTRIES) &&
   747				    is_migration_entry(entry)) {
   748					page = pfn_swap_entry_to_page(entry);
   749					goto found;
   750				}
   751			}
   752			spin_unlock(ptl);
   753		}
   754		hugetlb_vma_unlock_read(vma);
   755		return NULL;
   756	found:
   757		if (sz < PMD_SIZE)
   758			fw->level = FW_LEVEL_PTE;
   759		else if (sz < PUD_SIZE)
   760			fw->level = FW_LEVEL_PMD;
   761		else
   762			fw->level = FW_LEVEL_PUD;
   763		fw->ptep = ptep;
   764		fw->pte = pte;
   765		return __folio_walk_fill(fw, page, addr & (sz - 1), vma, ptl);
   766	#endif /* CONFIG_HUGETLB_PAGE */
   767		return NULL;
   768	}
   769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
