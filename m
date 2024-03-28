Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750954BDA;
	Thu, 28 Mar 2024 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711628593; cv=none; b=OCejGbD4sQHbRCtmKXMF8RugXCICvTSoJWd3iqnHZP2FHCQTzBf1cRpXR+ihazlppGcpmUQqfXu3+jdgwKANTzYKIrxbSpJ4FAx7rqKJunTbZw8w/7hgtoi2S5BnUBZpIUna4iuCUQYtyI9RSa1BCg1iLYmJEV1Udz3oYSxAzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711628593; c=relaxed/simple;
	bh=JEhiiRTLLEIu0YXBiT+GjKvOjk74kHjaz+CkzcNLmhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ada8nE6hfkJ4B/QY+lfS+ApMLdilkU0MCxKfYYH3V4pL1Uhcs1/ub45q4B/zzTReaNgCs0iDimgiGKnrAzn4IluYqtB5Fgns8nEElzPljxhe32qxwVLqY6zDVbcS9rbrrIyRDDvyZBoOZ7zKFVJ9XKNWOA61q0jit84eQvkjYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWeT3677; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWeT3677"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628592; x=1743164592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JEhiiRTLLEIu0YXBiT+GjKvOjk74kHjaz+CkzcNLmhk=;
  b=RWeT3677DVJB0aCVAb2AOedhsswse+tsYl8JQT7DF5V0M3wkxCRdv015
   1071iEnBzDJzEbQgmuGlHGiZ9Z2SsoSzcYEHPQXIQMHn1MM2SYtQglgUq
   70LpQvmwfaF6xSLo07YLnYUTjibw/3Nob3WJPie/wBOXcZm/MiOi4aGSp
   otdKfSrmR3FXIvSFZbpnj7oBMT309nkbvhPJ9uqrU4Ze5XfBYVabssMId
   Vrbn73dxjYQfzoxVoVL4GHbfQt16BH3ubmVvTqn0H4qdphFbdEWwNWeg2
   2neF+xIlqnir1WYTV9USJq039vy3/lCi3Dgo6U7eOftUqDFxkGC/OO1RB
   Q==;
X-CSE-ConnectionGUID: EQcK3G5RR/KQtNcGxvwbXA==
X-CSE-MsgGUID: svInDx/8TrGcVrjhLVw11w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10571701"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="10571701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="21287656"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2024 05:23:07 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpome-000282-2s;
	Thu, 28 Mar 2024 12:23:04 +0000
Date: Thu, 28 Mar 2024 20:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	willy@infradead.org, Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 3/6] mm: remove isolate_lru_page()
Message-ID: <202403282057.pIA3kJoz-lkp@intel.com>
References: <20240327141034.3712697-4-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327141034.3712697-4-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc1]
[cannot apply to akpm-mm/mm-everything next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-migrate-add-isolate_movable_folio/20240327-221513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240327141034.3712697-4-wangkefeng.wang%40huawei.com
patch subject: [PATCH 3/6] mm: remove isolate_lru_page()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240328/202403282057.pIA3kJoz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282057.pIA3kJoz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282057.pIA3kJoz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate_device.c:388:9: error: call to undeclared function 'isolate_lru_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |                         if (!isolate_lru_page(page)) {
         |                              ^
   mm/migrate_device.c:388:9: note: did you mean '__isolate_free_page'?
   mm/internal.h:487:12: note: '__isolate_free_page' declared here
     487 | extern int __isolate_free_page(struct page *page, unsigned int order);
         |            ^
   1 error generated.


vim +/isolate_lru_page +388 mm/migrate_device.c

76cbbead253ddc Christoph Hellwig       2022-02-16  355  
76cbbead253ddc Christoph Hellwig       2022-02-16  356  /*
44af0b45d58d7b Alistair Popple         2022-11-11  357   * Unmaps pages for migration. Returns number of source pfns marked as
44af0b45d58d7b Alistair Popple         2022-11-11  358   * migrating.
76cbbead253ddc Christoph Hellwig       2022-02-16  359   */
241f6885965683 Alistair Popple         2022-09-28  360  static unsigned long migrate_device_unmap(unsigned long *src_pfns,
241f6885965683 Alistair Popple         2022-09-28  361  					  unsigned long npages,
241f6885965683 Alistair Popple         2022-09-28  362  					  struct page *fault_page)
76cbbead253ddc Christoph Hellwig       2022-02-16  363  {
76cbbead253ddc Christoph Hellwig       2022-02-16  364  	unsigned long i, restore = 0;
76cbbead253ddc Christoph Hellwig       2022-02-16  365  	bool allow_drain = true;
241f6885965683 Alistair Popple         2022-09-28  366  	unsigned long unmapped = 0;
76cbbead253ddc Christoph Hellwig       2022-02-16  367  
76cbbead253ddc Christoph Hellwig       2022-02-16  368  	lru_add_drain();
76cbbead253ddc Christoph Hellwig       2022-02-16  369  
76cbbead253ddc Christoph Hellwig       2022-02-16  370  	for (i = 0; i < npages; i++) {
241f6885965683 Alistair Popple         2022-09-28  371  		struct page *page = migrate_pfn_to_page(src_pfns[i]);
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  372) 		struct folio *folio;
76cbbead253ddc Christoph Hellwig       2022-02-16  373  
44af0b45d58d7b Alistair Popple         2022-11-11  374  		if (!page) {
44af0b45d58d7b Alistair Popple         2022-11-11  375  			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
44af0b45d58d7b Alistair Popple         2022-11-11  376  				unmapped++;
76cbbead253ddc Christoph Hellwig       2022-02-16  377  			continue;
44af0b45d58d7b Alistair Popple         2022-11-11  378  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  379  
76cbbead253ddc Christoph Hellwig       2022-02-16  380  		/* ZONE_DEVICE pages are not on LRU */
76cbbead253ddc Christoph Hellwig       2022-02-16  381  		if (!is_zone_device_page(page)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  382  			if (!PageLRU(page) && allow_drain) {
1fec6890bf2247 Matthew Wilcox (Oracle  2023-06-21  383) 				/* Drain CPU's lru cache */
76cbbead253ddc Christoph Hellwig       2022-02-16  384  				lru_add_drain_all();
76cbbead253ddc Christoph Hellwig       2022-02-16  385  				allow_drain = false;
76cbbead253ddc Christoph Hellwig       2022-02-16  386  			}
76cbbead253ddc Christoph Hellwig       2022-02-16  387  
f7f9c00dfafffd Baolin Wang             2023-02-15 @388  			if (!isolate_lru_page(page)) {
241f6885965683 Alistair Popple         2022-09-28  389  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
76cbbead253ddc Christoph Hellwig       2022-02-16  390  				restore++;
76cbbead253ddc Christoph Hellwig       2022-02-16  391  				continue;
76cbbead253ddc Christoph Hellwig       2022-02-16  392  			}
76cbbead253ddc Christoph Hellwig       2022-02-16  393  
76cbbead253ddc Christoph Hellwig       2022-02-16  394  			/* Drop the reference we took in collect */
76cbbead253ddc Christoph Hellwig       2022-02-16  395  			put_page(page);
76cbbead253ddc Christoph Hellwig       2022-02-16  396  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  397  
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  398) 		folio = page_folio(page);
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  399) 		if (folio_mapped(folio))
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  400) 			try_to_migrate(folio, 0);
76cbbead253ddc Christoph Hellwig       2022-02-16  401  
16ce101db85db6 Alistair Popple         2022-09-28  402  		if (page_mapped(page) ||
241f6885965683 Alistair Popple         2022-09-28  403  		    !migrate_vma_check_page(page, fault_page)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  404  			if (!is_zone_device_page(page)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  405  				get_page(page);
76cbbead253ddc Christoph Hellwig       2022-02-16  406  				putback_lru_page(page);
76cbbead253ddc Christoph Hellwig       2022-02-16  407  			}
76cbbead253ddc Christoph Hellwig       2022-02-16  408  
241f6885965683 Alistair Popple         2022-09-28  409  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
76cbbead253ddc Christoph Hellwig       2022-02-16  410  			restore++;
76cbbead253ddc Christoph Hellwig       2022-02-16  411  			continue;
76cbbead253ddc Christoph Hellwig       2022-02-16  412  		}
241f6885965683 Alistair Popple         2022-09-28  413  
241f6885965683 Alistair Popple         2022-09-28  414  		unmapped++;
76cbbead253ddc Christoph Hellwig       2022-02-16  415  	}
76cbbead253ddc Christoph Hellwig       2022-02-16  416  
76cbbead253ddc Christoph Hellwig       2022-02-16  417  	for (i = 0; i < npages && restore; i++) {
241f6885965683 Alistair Popple         2022-09-28  418  		struct page *page = migrate_pfn_to_page(src_pfns[i]);
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  419) 		struct folio *folio;
76cbbead253ddc Christoph Hellwig       2022-02-16  420  
241f6885965683 Alistair Popple         2022-09-28  421  		if (!page || (src_pfns[i] & MIGRATE_PFN_MIGRATE))
76cbbead253ddc Christoph Hellwig       2022-02-16  422  			continue;
76cbbead253ddc Christoph Hellwig       2022-02-16  423  
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  424) 		folio = page_folio(page);
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  425) 		remove_migration_ptes(folio, folio, false);
76cbbead253ddc Christoph Hellwig       2022-02-16  426  
241f6885965683 Alistair Popple         2022-09-28  427  		src_pfns[i] = 0;
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  428) 		folio_unlock(folio);
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  429) 		folio_put(folio);
76cbbead253ddc Christoph Hellwig       2022-02-16  430  		restore--;
76cbbead253ddc Christoph Hellwig       2022-02-16  431  	}
241f6885965683 Alistair Popple         2022-09-28  432  
241f6885965683 Alistair Popple         2022-09-28  433  	return unmapped;
241f6885965683 Alistair Popple         2022-09-28  434  }
241f6885965683 Alistair Popple         2022-09-28  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
