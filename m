Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B431F5FA;
	Sat, 12 Oct 2024 05:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728709918; cv=none; b=NZ6rUwx3f18RO9k6EkiAFga9BC3ZhQ6Rf8ER5pXVaB6vYie3176yjxnGYQ67uQU7qccsgKC0I4slb8ak+Huxh1SJDaum7FojtApEpXo59QDzMh+3zKYrMz6+8UEuJzDHJcADmdDHYuZdCQIYMF2vNejtSKirkZFGWy5MSPzkCsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728709918; c=relaxed/simple;
	bh=9URWjLVUuXH6EM4/81n+fInF10p4dbmeg76Hqhl2mHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl8FMn13WLRJmOWee9yp/4r2Kr0vOAyhl+BNRwQRCATIqRZrfd88og11L23d8wC8WY3dvhqMnxKmPjat9IEH1NCq6JQhbDCbGlz5MTvF2Bxg0CryjJinQDY7WL3WEjvWLT/1AirVCAQKNMpxd7q0shU8MzOAa5PUmPInC7YPe7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMPwiafx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMPwiafx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728709916; x=1760245916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9URWjLVUuXH6EM4/81n+fInF10p4dbmeg76Hqhl2mHE=;
  b=KMPwiafxJPoXaii4b8rF0DfZ2iPeb6J+LlgmSmB/v86WQrqFNbxIZj1a
   XHmHoq/c2FgtmQgv1zRgbTf/lJ7BUXkvgMM9VvU/JnyCVGninHGfETmmQ
   5PB1l0FzrkQgewEmnSDNRJ0dR91YyAYOAC2nUU1L3BR/L7ahGqluR+xyf
   4SKpp9o5I+AaDFfYQ5QbFJl9yHIwEkzE6Z0yl0xizyp0dD3SZpyn/8QuE
   pG+P7DBHNvwJwygOyH/Ue84jW+2vK3W2Fs8EHtz/oJ0AsFyP0f33FiPGn
   uBn0QX/E7itrciJioCbZ37jqHqY4SXLQWbAWCeQ5vvEETGsIXr77GwV6o
   Q==;
X-CSE-ConnectionGUID: eSgZ2brjTbib8jELWV5ECA==
X-CSE-MsgGUID: PrDNPFbOQ/6EY8lRyjHQmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="15744064"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="15744064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 22:11:55 -0700
X-CSE-ConnectionGUID: mDhZUBsrSrGC3ADLyeHnQA==
X-CSE-MsgGUID: 2R8BEaIZSYSGB/erV/WhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="81917257"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 22:11:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szUPv-000D4t-0J;
	Sat, 12 Oct 2024 05:11:51 +0000
Date: Sat, 12 Oct 2024 13:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] mm/huge_memory: buddy allocator like
 folio_split()
Message-ID: <202410121223.xbtQrdr0-lkp@intel.com>
References: <20241008223748.555845-2-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008223748.555845-2-ziy@nvidia.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-huge_memory-buddy-allocator-like-folio_split/20241009-063901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241008223748.555845-2-ziy%40nvidia.com
patch subject: [RFC PATCH 1/1] mm/huge_memory: buddy allocator like folio_split()
config: i386-buildonly-randconfig-002-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121223.xbtQrdr0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121223.xbtQrdr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121223.xbtQrdr0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:3735:6: warning: variable 'nr_dropped' set but not used [-Wunused-but-set-variable]
    3735 |         int nr_dropped = 0;
         |             ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/nr_dropped +3735 mm/huge_memory.c

  3717	
  3718	#define for_each_folio_until_end_safe(iter, iter2, start, end)	\
  3719		for (iter = start, iter2 = folio_next(start);		\
  3720		     iter != end;					\
  3721		     iter = iter2, iter2 = folio_next(iter2))
  3722	
  3723	static int __folio_split_without_mapping(struct folio *folio, int new_order,
  3724			struct page *page, struct list_head *list, pgoff_t end,
  3725			struct xa_state *xas, struct address_space *mapping)
  3726	{
  3727		struct lruvec *lruvec;
  3728		struct address_space *swap_cache = NULL;
  3729		struct folio *origin_folio = folio;
  3730		struct folio *next_folio = folio_next(folio);
  3731		struct folio *new_folio;
  3732		struct folio *next;
  3733		int order = folio_order(folio);
  3734		int split_order = order - 1;
> 3735		int nr_dropped = 0;
  3736	
  3737		if (folio_test_anon(folio) && folio_test_swapcache(folio))
  3738			return -EINVAL;
  3739	
  3740		if (folio_test_anon(folio))
  3741			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
  3742		/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
  3743		lruvec = folio_lruvec_lock(folio);
  3744	
  3745		/* work on the other folio contains page */
  3746		for (split_order = order - 1; split_order >= new_order; split_order--) {
  3747			int old_order = folio_order(folio);
  3748			struct folio *release;
  3749			struct folio *end_folio = folio_next(folio);
  3750			int status;
  3751	
  3752			if (folio_test_anon(folio) && split_order == 1)
  3753				continue;
  3754	
  3755			if (mapping) {
  3756				xas_set_order(xas, folio->index, split_order);
  3757				xas_split_alloc(xas, folio, old_order, 0);
  3758				if (xas_error(xas)) {
  3759					unlock_page_lruvec(lruvec);
  3760					local_irq_enable();
  3761					return -ENOMEM;
  3762				}
  3763				xas_split(xas, folio, old_order);
  3764			}
  3765	
  3766			/* complete memcg works before add pages to LRU */
  3767			split_page_memcg(&folio->page, old_order, split_order);
  3768			split_page_owner(&folio->page, old_order, split_order);
  3769			pgalloc_tag_split(folio, old_order, split_order);
  3770	
  3771			status = __split_folio_to_order(folio, split_order);
  3772	
  3773			if (status < 0)
  3774				return status;
  3775	
  3776			/*
  3777			 * Add folios without page to list, since they are no longer
  3778			 * going to be split, but if its index > end, drop it.
  3779			 */
  3780			/* Unfreeze refcount first. Additional reference from page cache. */
  3781			for_each_folio_until_end_safe(release, next, folio, end_folio) {
  3782				if (page_in_folio_offset(page, release) >= 0) {
  3783					folio = release;
  3784					continue;
  3785				}
  3786				if (folio_test_anon(release))
  3787					mod_mthp_stat(folio_order(release),
  3788							MTHP_STAT_NR_ANON, 1);
  3789	
  3790				folio_ref_unfreeze(release,
  3791					1 + ((!folio_test_anon(origin_folio) ||
  3792					     folio_test_swapcache(origin_folio)) ?
  3793						     folio_nr_pages(release) : 0));
  3794	
  3795				if (release != origin_folio)
  3796					lru_add_page_tail(origin_folio, &release->page,
  3797							lruvec, list);
  3798	
  3799				/* Some pages can be beyond EOF: drop them from page cache */
  3800				if (release->index >= end) {
  3801					if (shmem_mapping(origin_folio->mapping))
  3802						nr_dropped++;
  3803					else if (folio_test_clear_dirty(release))
  3804						folio_account_cleaned(release,
  3805							inode_to_wb(origin_folio->mapping->host));
  3806					__filemap_remove_folio(release, NULL);
  3807					folio_put(release);
  3808				} else if (!folio_test_anon(release)) {
  3809					__xa_store(&origin_folio->mapping->i_pages,
  3810							release->index, &release->page, 0);
  3811				} else if (swap_cache) {
  3812					return -EINVAL;
  3813				}
  3814			}
  3815		}
  3816	
  3817		/* Some pages can be beyond EOF: drop them from page cache */
  3818		if (folio->index >= end) {
  3819			if (shmem_mapping(folio->mapping))
  3820				nr_dropped++;
  3821			else if (folio_test_clear_dirty(folio))
  3822				folio_account_cleaned(folio,
  3823					inode_to_wb(folio->mapping->host));
  3824			__filemap_remove_folio(folio, NULL);
  3825			folio_put(folio);
  3826		} else if (!folio_test_anon(folio)) {
  3827			__xa_store(&folio->mapping->i_pages, folio->index,
  3828					&folio->page, 0);
  3829		} else if (swap_cache) {
  3830			return -EINVAL;
  3831		}
  3832		if (folio_test_anon(folio))
  3833			mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
  3834	
  3835		if (folio != origin_folio)
  3836			lru_add_page_tail(origin_folio, &folio->page, lruvec, list);
  3837	
  3838		unlock_page_lruvec(lruvec);
  3839		/* Caller disabled irqs, so they are still disabled here */
  3840	
  3841		if (folio_test_anon(folio)) {
  3842			/* Additional pin to swap cache */
  3843			if (folio_test_swapcache(folio))
  3844				return -EINVAL;
  3845			folio_ref_inc(folio);
  3846		} else {
  3847			/* Additional pin to page cache */
  3848			folio_ref_add(folio, 1 + (1 << new_order));
  3849			xa_unlock(&folio->mapping->i_pages);
  3850		}
  3851	
  3852		local_irq_enable();
  3853	
  3854		remap_page(origin_folio, 1 << order, 0);
  3855	
  3856		for_each_folio_until_end_safe(new_folio, next, origin_folio, next_folio) {
  3857			if (new_folio == folio)
  3858				continue;
  3859	
  3860			folio_unlock(new_folio);
  3861			free_page_and_swap_cache(&new_folio->page);
  3862		}
  3863		return 0;
  3864	}
  3865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
