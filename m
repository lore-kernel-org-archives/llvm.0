Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DF1BEF7E;
	Fri, 19 Sep 2025 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758246033; cv=none; b=lTaeAL+Nc9mEo353eyt/CK70G4ypG9DekH/NXUbr62IIGLWAuaxPV9RoAkRJKAj1oFpqf5MejMRyWgtHQojRiRRnnjj5Sv6Fe8XjANRNLMVTZb2JDI7ZGs3N5uvig1cEW2lbARrSGIy4Q/D31IszsiOmXlCPfa1DJOy6bI6KyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758246033; c=relaxed/simple;
	bh=itbhvlGa/67NE/x0tLhEoVen0fCwr+8EnXPRMpPCprc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhm7x6xATR+hAtL4Pv2Ogu1Y4l35YgLkaUUlhxjfq49zT85fGFW3cdokN2LQql93335RGMSsIN4CWPJPLq7bK0mVjZyVK2LRVHof9g/YedFjOykTtbnZpGEbvhXJX/izQyX0kbSMQpMobUdtuXCSNX5H/Xj5o6cXKFdIBBY4NiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkY2ZNDx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkY2ZNDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758246032; x=1789782032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=itbhvlGa/67NE/x0tLhEoVen0fCwr+8EnXPRMpPCprc=;
  b=fkY2ZNDxyx5pgjoZj3NO2XqMHN83IT7Jpfq3svVAhcX1MExqVJivxWu6
   ylNO+Pa1tmJrpI3b4WL0NNnAv2gBVE1hNRxJhQ9EHhOexVFl6XnRkGKOD
   /7hxVgmO/CCAyRzJfHaJLwXQhi8kuEDFkwunptk8c70WX1IFdD0XM5cPq
   8VQ+Gx97rVsaPftz6Q8I2GPwS3W+HB4prSZMPuJmSMMgSHHZAfRXz/g2z
   OC3tje23tGNqXHDIY0VXY3aX6tWU5729MKWHy1c0KrCIedaHM+p6oBgBt
   1WHJpaXUsTc9GsXmaK1L1Mzn6H/xaKC7KfrgPeoxNWLciYuF2BcCxYbr1
   w==;
X-CSE-ConnectionGUID: hGLCZCxFQ9CVpTOklPkMVg==
X-CSE-MsgGUID: AZ7i3NbFQym6FnaJGBnqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64410828"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="64410828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:40:31 -0700
X-CSE-ConnectionGUID: 0XL0fEMrSzW+woQKr4uqsg==
X-CSE-MsgGUID: d5JDo9e8QVGzdgMYHpuebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="175624749"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2025 18:40:27 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzQ6r-0003t5-0z;
	Fri, 19 Sep 2025 01:40:25 +0000
Date: Fri, 19 Sep 2025 09:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	sidhartha.kumar@oracle.com, jane.chu@oracle.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 1/8] mm: page_alloc: optimize pfn_range_valid_contig()
Message-ID: <202509190917.wgDdVYHL-lkp@intel.com>
References: <20250918132000.1951232-2-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918132000.1951232-2-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-page_alloc-optimize-pfn_range_valid_contig/20250918-212431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250918132000.1951232-2-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 1/8] mm: page_alloc: optimize pfn_range_valid_contig()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250919/202509190917.wgDdVYHL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190917.wgDdVYHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190917.wgDdVYHL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:7033:7: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
    7033 |                 if (folio_test_pgtable(folio) | folio_test_stack(folio))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                               ||
   mm/page_alloc.c:7033:7: note: cast one or both operands to int to silence this warning
   1 warning generated.


vim +7033 mm/page_alloc.c

  7009	
  7010	static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
  7011					   unsigned long nr_pages)
  7012	{
  7013		unsigned long i, end_pfn = start_pfn + nr_pages;
  7014		struct page *page;
  7015		struct folio *folio;
  7016	
  7017		for (i = start_pfn; i < end_pfn; i++) {
  7018			page = pfn_to_online_page(i);
  7019			if (!page)
  7020				return false;
  7021	
  7022			if (page_zone(page) != z)
  7023				return false;
  7024	
  7025			folio = page_folio(page);
  7026			if (folio_test_reserved(folio))
  7027				return false;
  7028	
  7029			if (folio_test_hugetlb(folio))
  7030				return false;
  7031	
  7032			/* The following type of folios aren't migrated */
> 7033			if (folio_test_pgtable(folio) | folio_test_stack(folio))
  7034				return false;
  7035	
  7036			/*
  7037			 * For compound pages such as THP and non-compound high
  7038			 * order buddy pages, save potentially a lot of iterations
  7039			 * if we can skip them at once.
  7040			 */
  7041			if (PageCompound(page))
  7042				i += (1UL << compound_order(page)) - 1;
  7043			else if (PageBuddy(page))
  7044				i += (1UL << buddy_order(page)) - 1;
  7045		}
  7046		return true;
  7047	}
  7048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
