Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C27DA82;
	Thu,  5 Dec 2024 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361851; cv=none; b=HX1LLtNlLt8BTkPta3YIIQ3gCAxQUmQuBScPK7Zn8n5RqFIO5uhkCczz5z9TCAVF9rF5EzhUFv2tXFsWx2GLM8i5x44F5wufBMc2p+1dFogw8e3ZKgStdjeplHLy66hm+mdDTYP0/lYQkBNZvxZpNvzH+rFjKOKvjx1lshpfEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361851; c=relaxed/simple;
	bh=iw7fuXPYCUPZXzib8rOrienqpPhH7l+XsBbTP71d4Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9DLO5CFaC+BUjOkVoPGpRAFZYGxy2oJiMAY0E+xgN9fRWs0NSC85Yjd+4XncJy3zzqdVzP0CvB6Rf913p69zHQmpU28ToBPCTuLr/8lrWYDKrbD5T5HOTG/L/zmPvusUVnB0TOnYuqnlxPdk8I/u1FZsyfiL+IzqDzm+SGqPkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRatOr4N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRatOr4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733361850; x=1764897850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iw7fuXPYCUPZXzib8rOrienqpPhH7l+XsBbTP71d4Zo=;
  b=fRatOr4NI2CDdv4oBmyuv3OtW9kXkqLNOZxnP6tdv/C0wa1QUsh0THQR
   wce14paob23SbNqMpoCqFdCzhcLDTS29eTuaMYWGBbTGM+A/3uFG+eMdB
   y/ZW3/3vXxQudKGwO3pVTjnbbiV5qA+/Sfz8ZOfj2CMoFor7svzaJneqI
   HcITQDlsazbY2hwfiEFsxl8l+sqZdXRlQT9PF+Hjaq2yP6QpVk8RMFvDs
   ie/wm0zKGgWI5au9Td84pTcKgTc6zKfvrgdTAuwKQrA27I7CRdBTS9ZSd
   bzetKv5Wwc9If5Fb0DPaBhxlFIKi+H9wR0alN1GvFWVyCyYppl70EkGaG
   Q==;
X-CSE-ConnectionGUID: KaeEfJIJSES0lk1Omz0CWw==
X-CSE-MsgGUID: MNxnk0p7SzaS7x1JSdHDPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44685140"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="44685140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 17:24:08 -0800
X-CSE-ConnectionGUID: P03VVCmST22TMFZDz086Nw==
X-CSE-MsgGUID: Jq6R7X5tTxOL8zTJ/81Amw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98003848"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 17:24:05 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ0b5-0003eF-0O;
	Thu, 05 Dec 2024 01:24:03 +0000
Date: Thu, 5 Dec 2024 09:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Morin <guillaume@morinfr.org>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	guillaume@morinfr.org, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Eric Hagberg <ehagberg@janestreet.com>
Subject: Re: [PATCH v1] hugetlb: support FOLL_FORCE|FOLL_WRITE
Message-ID: <202412050954.m9cwNOJC-lkp@intel.com>
References: <Z1Ce6j5WiBE3kaGf@bender.morinfr.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Ce6j5WiBE3kaGf@bender.morinfr.org>

Hi Guillaume,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-Morin/hugetlb-support-FOLL_FORCE-FOLL_WRITE/20241205-022843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/Z1Ce6j5WiBE3kaGf%40bender.morinfr.org
patch subject: [PATCH v1] hugetlb: support FOLL_FORCE|FOLL_WRITE
config: x86_64-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050954.m9cwNOJC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050954.m9cwNOJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050954.m9cwNOJC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/gup.c:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/gup.c:20:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/gup.c:681:33: warning: variable 'page' is uninitialized when used here [-Wuninitialized]
     681 |             !can_follow_write_pud(pud, page, vma, flags))
         |                                        ^~~~
   mm/gup.c:673:19: note: initialize the variable 'page' to silence this warning
     673 |         struct page *page;
         |                          ^
         |                           = NULL
   7 warnings generated.


vim +/page +681 mm/gup.c

   667	
   668	static struct page *follow_huge_pud(struct vm_area_struct *vma,
   669					    unsigned long addr, pud_t *pudp,
   670					    int flags, struct follow_page_context *ctx)
   671	{
   672		struct mm_struct *mm = vma->vm_mm;
   673		struct page *page;
   674		pud_t pud = *pudp;
   675		unsigned long pfn = pud_pfn(pud);
   676		int ret;
   677	
   678		assert_spin_locked(pud_lockptr(mm, pudp));
   679	
   680		if ((flags & FOLL_WRITE) &&
 > 681		    !can_follow_write_pud(pud, page, vma, flags))
   682			return NULL;
   683	
   684		if (!pud_present(pud))
   685			return NULL;
   686	
   687		pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
   688	
   689		if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
   690		    pud_devmap(pud)) {
   691			/*
   692			 * device mapped pages can only be returned if the caller
   693			 * will manage the page reference count.
   694			 *
   695			 * At least one of FOLL_GET | FOLL_PIN must be set, so
   696			 * assert that here:
   697			 */
   698			if (!(flags & (FOLL_GET | FOLL_PIN)))
   699				return ERR_PTR(-EEXIST);
   700	
   701			if (flags & FOLL_TOUCH)
   702				touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
   703	
   704			ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
   705			if (!ctx->pgmap)
   706				return ERR_PTR(-EFAULT);
   707		}
   708	
   709		page = pfn_to_page(pfn);
   710	
   711		if (!pud_devmap(pud) && !pud_write(pud) &&
   712		    gup_must_unshare(vma, flags, page))
   713			return ERR_PTR(-EMLINK);
   714	
   715		ret = try_grab_folio(page_folio(page), 1, flags);
   716		if (ret)
   717			page = ERR_PTR(ret);
   718		else
   719			ctx->page_mask = HPAGE_PUD_NR - 1;
   720	
   721		return page;
   722	}
   723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
