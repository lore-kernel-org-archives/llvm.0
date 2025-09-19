Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C334BA2B;
	Fri, 19 Sep 2025 03:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758252162; cv=none; b=lUqOusG+1uXfyVgHW+pjb3RVsjCYDE3L6VHiFPqbHWrure+644gzmmVnvEpWNXXZByPUhjBQAAa2tQSNfYFXx3Fv9HS4djLDDIfdC19OMAcEOzfhWluSdHevqQwV9Ywi9FaJc5V+c5lLC7lVOyZkJ3Hr6/Ftu6kRQLjimSS4AOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758252162; c=relaxed/simple;
	bh=yrWhS1m3JdlXaDDFImfD4YUpjM1w62IShFGsUbaYuIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+Fl54ND2aaRnNWJhO6+QmNV0cra2IzMXt1gIYgZ9+6KXUl+jF+5603dGTBw7jlK0JcIua7hCwZHoh+HcM7rTraw1RrcC2GY6CRPZeQ6k5TynpM3uE9fdXWyz4Z2jyBYlGRQlN+rkmX3dHU1CgIA9u0LJyCXZj0BXIZ5ZzxN9/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2ud0qAi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2ud0qAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758252159; x=1789788159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yrWhS1m3JdlXaDDFImfD4YUpjM1w62IShFGsUbaYuIY=;
  b=b2ud0qAiVl8akd6B4dCpaaydhxEmq9LqafPT8BbhKZ9fHTRR+5twiuWk
   5f8fVOWkiBv+vXzJIKWoDqP2pQCxk1SXLOIFA8fmljnE2DiEigOHEp6P4
   SwMazxkjzejkm6JDJG6leToo4OdetpLN3WjDv6Eozd5pB+qXZTO/UKnTz
   HxSKqUJJCHPuSlW9C5qhtQP5u3vHO+l1hyVU4+/nboXXmIKob3RRe0PHY
   lenYciCoZpC9eY63FgNR+EcUUCPRi1gm8wQBq44z2LLOmKBsDXhIWt3W/
   3b4cfuklpvSha19CEX+DyEmPn+FXpyRUUyLjvToh8s7+YZBY4iJMzXRxM
   A==;
X-CSE-ConnectionGUID: H70DiLAjSy6uEq592p6HuQ==
X-CSE-MsgGUID: gx0GmDkLQ9e0rp8GeoJFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71226690"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="71226690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 20:22:39 -0700
X-CSE-ConnectionGUID: HIQazpNsS9WzglPPa/VVSA==
X-CSE-MsgGUID: 9VSL0LGYRquBEojHxC1avg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="179989700"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 20:22:37 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzRhj-0003w7-12;
	Fri, 19 Sep 2025 03:22:35 +0000
Date: Fri, 19 Sep 2025 11:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] mm: hugetlb: allocate frozen pages in
 alloc_gigantic_folio()
Message-ID: <202509191150.6UvLYcgL-lkp@intel.com>
References: <20250918132000.1951232-9-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918132000.1951232-9-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-page_alloc-optimize-pfn_range_valid_contig/20250918-212431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250918132000.1951232-9-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 8/8] mm: hugetlb: allocate frozen pages in alloc_gigantic_folio()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250919/202509191150.6UvLYcgL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191150.6UvLYcgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191150.6UvLYcgL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c:1497:26: error: call to undeclared function 'alloc_contig_frozen_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1497 |         folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
         |                                 ^
>> mm/hugetlb.c:1497:10: warning: cast to 'struct folio *' from smaller integer type 'int' [-Wint-to-pointer-cast]
    1497 |         folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1498 |                                                           nid, nodemask);
         |                                                           ~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1497 mm/hugetlb.c

  1471	
  1472	#define for_each_node_mask_to_alloc(next_node, nr_nodes, node, mask)		\
  1473		for (nr_nodes = nodes_weight(*mask);				\
  1474			nr_nodes > 0 &&						\
  1475			((node = hstate_next_node_to_alloc(next_node, mask)) || 1);	\
  1476			nr_nodes--)
  1477	
  1478	#define for_each_node_mask_to_free(hs, nr_nodes, node, mask)		\
  1479		for (nr_nodes = nodes_weight(*mask);				\
  1480			nr_nodes > 0 &&						\
  1481			((node = hstate_next_node_to_free(hs, mask)) || 1);	\
  1482			nr_nodes--)
  1483	
  1484	#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
  1485	static struct folio *alloc_gigantic_folio(int order, gfp_t gfp_mask,
  1486			int nid, nodemask_t *nodemask)
  1487	{
  1488		struct folio *folio;
  1489	
  1490		folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nodemask);
  1491		if (folio)
  1492			return folio;
  1493	
  1494		if (hugetlb_cma_exclusive_alloc())
  1495			return NULL;
  1496	
> 1497		folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
  1498								  nid, nodemask);
  1499		return folio;
  1500	}
  1501	#else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE */
  1502	static struct folio *alloc_gigantic_folio(int order, gfp_t gfp_mask, int nid,
  1503						  nodemask_t *nodemask)
  1504	{
  1505		return NULL;
  1506	}
  1507	#endif
  1508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
