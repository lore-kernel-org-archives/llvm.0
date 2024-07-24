Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0305695;
	Wed, 24 Jul 2024 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721800513; cv=none; b=AeWTPlKdcCJ7tyCp1Rrg9QoFP6c/D4RR2+ocyNTzqT3Ua3g8w04VxVqC0kRJ5fSgZzi+5XvzgJUueE5KQy405eeckPGev/Bf94A2V83AdPgAjC6mIO6gw3eSNa2ApW8gUyg12AzF2NAEu69q7WQPY1oxGzACbSjzw6FSPguwsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721800513; c=relaxed/simple;
	bh=ApjpF9LExn0xfwXk10w4b3OUsfrVfhXKGOxbOwsQxGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSjdiVLDbMFPwUcrglCehFL4z2lTbVwXF8XlBg+cZYigd1++XO9NHi4gBg/0tk10CFILzp6PiagS6CPy0sWLE27fHBE36J4xtxuGGEqUXfidQCeldR7yH7vFSvYZogsb0LI0waYvbqS9bRdtnCTkCP6bE1kpBYPLGNHnk5ZnqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJTeAULo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJTeAULo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721800510; x=1753336510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ApjpF9LExn0xfwXk10w4b3OUsfrVfhXKGOxbOwsQxGs=;
  b=SJTeAULokbM93v0luReuS6/Gr1Z5AxSkDuePmWWkzCSVoc8Be7XMQlY3
   EbKQYz1yxJvYvpb1WBKTAuwFyNChkdKKDz0jEc5fnL9V8+wol+bASAzZD
   XIDhlhJ9/UMoh82dtlV6CDFWsNQisczo88MUKAkuVWhC9yEOaN2ndgQvO
   H6ZnO8j930GofoWbc/+LkE+ky3IWAcsskX8hp6ZEf2OhtKsHf+lHqSByj
   phJUHnVgQviengzbS/PsNsGcUWKQqneQc84GK0nZydSKjwSAXpXs4hPJA
   WKb6saDUdqNSAyFH1nOv0IzQUJSc+XR2MvWTrgpmwCtCIViuLqmeYo8LI
   Q==;
X-CSE-ConnectionGUID: uQtJFFlmRDqUIS01oQLHPQ==
X-CSE-MsgGUID: nii+be7lRHaXjFtDeoC1NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19308845"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19308845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 22:55:09 -0700
X-CSE-ConnectionGUID: OYnqAEmMT82LWDDIsegHng==
X-CSE-MsgGUID: TaU7x0WOS7GbPjVv3XDA0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52498014"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2024 22:55:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWUxt-000miY-1R;
	Wed, 24 Jul 2024 05:55:05 +0000
Date: Wed, 24 Jul 2024 13:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 2/6] mm: Constify page_address_in_vma()
Message-ID: <202407241351.QvA9uyqf-lkp@intel.com>
References: <20240723153503.1669586-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723153503.1669586-3-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20240723]
[cannot apply to tip/x86/mm dennis-percpu/for-next v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/bootmem-Stop-using-page-index/20240723-233932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240723153503.1669586-3-willy%40infradead.org
patch subject: [PATCH 2/6] mm: Constify page_address_in_vma()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407241351.QvA9uyqf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241351.QvA9uyqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241351.QvA9uyqf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap.c:796:40: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     796 |         pgoff = folio->index + folio_page_idx(folio, page);
         |                                               ^~~~~
   include/linux/mm.h:216:62: note: expanded from macro 'folio_page_idx'
     216 | #define folio_page_idx(folio, p)        (page_to_pfn(p) - folio_pfn(folio))
         |                                                                     ^~~~~
   include/linux/mm.h:1877:53: note: passing argument to parameter 'folio' here
    1877 | static inline unsigned long folio_pfn(struct folio *folio)
         |                                                     ^
   1 error generated.


vim +796 mm/rmap.c

72b252aed506b8 Mel Gorman              2015-09-04  769  
^1da177e4c3f41 Linus Torvalds          2005-04-16  770  /*
bf89c8c8673223 Huang Shijie            2009-10-01  771   * At what user virtual address is page expected in vma?
ab941e0fff3947 Naoya Horiguchi         2010-05-11  772   * Caller should check the page is actually part of the vma.
^1da177e4c3f41 Linus Torvalds          2005-04-16  773   */
eb7052fd71d991 Matthew Wilcox (Oracle  2024-07-23  774) unsigned long page_address_in_vma(const struct page *page,
eb7052fd71d991 Matthew Wilcox (Oracle  2024-07-23  775) 		struct vm_area_struct *vma)
^1da177e4c3f41 Linus Torvalds          2005-04-16  776  {
eb7052fd71d991 Matthew Wilcox (Oracle  2024-07-23  777) 	const struct folio *folio = page_folio(page);
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28  778) 	pgoff_t pgoff;
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28  779) 
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  780) 	if (folio_test_anon(folio)) {
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  781) 		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
4829b906cc063c Hugh Dickins            2010-10-02  782  		/*
4829b906cc063c Hugh Dickins            2010-10-02  783  		 * Note: swapoff's unuse_vma() is more efficient with this
4829b906cc063c Hugh Dickins            2010-10-02  784  		 * check, and needs it to match anon_vma when KSM is active.
4829b906cc063c Hugh Dickins            2010-10-02  785  		 */
4829b906cc063c Hugh Dickins            2010-10-02  786  		if (!vma->anon_vma || !page__anon_vma ||
4829b906cc063c Hugh Dickins            2010-10-02  787  		    vma->anon_vma->root != page__anon_vma->root)
21d0d443cdc165 Andrea Arcangeli        2010-08-09  788  			return -EFAULT;
31657170deaf1d Jue Wang                2021-06-15  789  	} else if (!vma->vm_file) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  790  		return -EFAULT;
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  791) 	} else if (vma->vm_file->f_mapping != folio->mapping) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  792  		return -EFAULT;
31657170deaf1d Jue Wang                2021-06-15  793  	}
494334e43c16d6 Hugh Dickins            2021-06-15  794  
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28  795) 	/* The !page__anon_vma above handles KSM folios */
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28 @796) 	pgoff = folio->index + folio_page_idx(folio, page);
e0abfbb6714244 Matthew Wilcox (Oracle  2024-03-28  797) 	return vma_address(vma, pgoff, 1);
^1da177e4c3f41 Linus Torvalds          2005-04-16  798  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  799  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
