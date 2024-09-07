Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70FB1494BD;
	Sat,  7 Sep 2024 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725708879; cv=none; b=KmliQBwkCYxfib+BmALMj3SkhtYqGGCq/Qqvmz0GvHZoqTIEe7xDvmrkPmRABlUF/qZGOKDZN+HQ6DiMDvPz/sZp0VLz8iW8vEhv/0LOScZVTyxUHovXse2WACgiAOjP2maBZ/0h57kUmUJBrmB6aPzpB2scsJqwTtBWUTeGjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725708879; c=relaxed/simple;
	bh=SVH/3tj6Z2aTc+rCuKuZTG6ve82hlIF5yywhwASbrTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLvbAg75r9h2XIhj/Q0kzL7nG15RpfaqTAxRQdCIGsAmR9jcWmySA66IgZK5JuCfYQt+TpP9jDD00tbidlviCLY7SO8zStQwpDl2RLtcOSyC0SmJfF7uPrKS8GU39FuVuHuz+h7XqDtmyrSPRft08vB14L/KiS/GvawxmzOzkYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdahZvYy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdahZvYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725708877; x=1757244877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVH/3tj6Z2aTc+rCuKuZTG6ve82hlIF5yywhwASbrTE=;
  b=RdahZvYyk92Cna7E9lcNZ0u254VlxwxchLYh6a8hohQ8P292MtT+jEZl
   hCZG2NVgcnb/22AXYyqg4TQO/ozNJEcGGycuYWpbZiQGMOltY7D+bqAJm
   8Wn/bHfVnVyW5xzavN9zC3eCwrpVr8zP+oJ+Mr3qpvWRCCqc5XNO+EIiH
   lcwlLMKLYHnU1U8MQ+MRdJP9+FKGx9GyLmCFPiHwzLarK5Un5l180tVo1
   Rn8z3JVYqJnwdZgkT8qSOto5ThNMmFCg/0PXx9qvW8i37J6yz4dQngwjd
   ccVWE2FQRRRSIgKjYGE6rtwwIRHoX4VWwxiIJ1Nag6ZqUBHFaQlv7ebot
   A==;
X-CSE-ConnectionGUID: HWyHNoGDQJScbpAKqkCUXw==
X-CSE-MsgGUID: GKfGydhhQhCheZVfV20Q9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49871779"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49871779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:34:34 -0700
X-CSE-ConnectionGUID: 1wzBVzXPSci64oY4Q7mY/Q==
X-CSE-MsgGUID: 2hWoubrwRiScmDLO5eRCGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="96989901"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2024 04:34:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smti2-000CW5-2A;
	Sat, 07 Sep 2024 11:34:30 +0000
Date: Sat, 7 Sep 2024 19:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-logically-offline 7/9]
 mm/page_alloc.c:6793: warning: Function parameter or struct member
 'nr_pages' not described in 'logically_offline_online_pages'
Message-ID: <202409071944.yy1xB1rW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-logically-offline
head:   8dabc06448d534cfa588184f76bef6ecbc06458a
commit: 0860b7bf763a2d4726b86810b14aae75e09c23fc [7/9] mm: factor out code to logically offlining+online page ranges from virtio-mem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240907/202409071944.yy1xB1rW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071944.yy1xB1rW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071944.yy1xB1rW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:6793: warning: Function parameter or struct member 'nr_pages' not described in 'logically_offline_online_pages'
>> mm/page_alloc.c:6793: warning: Excess function parameter 'pages' description in 'logically_offline_online_pages'
>> mm/page_alloc.c:6865: warning: Function parameter or struct member 'nr_pages' not described in 'online_logically_offline_pages'
>> mm/page_alloc.c:6865: warning: Excess function parameter 'pages' description in 'online_logically_offline_pages'


vim +6793 mm/page_alloc.c

  6765	
  6766	/**
  6767	 * logically_offline_online_pages: logically offline pages in online memory
  6768	 *				   sections
  6769	 * @pfn: the start PFN specifying the first page to logically offline
  6770	 * @pages: the number of pages to logically offline
  6771	 *
  6772	 * Try to free up the given range, for example, by migrating movable allocations
  6773	 * away, so we can remove the now-free pages from the buddy and logically
  6774	 * offline the pages.
  6775	 *
  6776	 * Once pages are logically offline, they can either be re-onlined using
  6777	 * online_logically_offline_pages(), or fully offlined when implemented by
  6778	 * the caller using the MEM_GOING_OFFLINE+MEM_GOING_OFFLINE memory notifier
  6779	 * approach as documented for PageOffline().
  6780	 *
  6781	 * The caller must make sure that all pages are within the same zone, that
  6782	 * all covered memory sections are online, and that the memory sections
  6783	 * cannot get offlined concurrently.
  6784	 *
  6785	 * The range must cover full pageblocks. This function will fail if the
  6786	 * range already contains logically offline pages.
  6787	 *
  6788	 * Returns: 0 on success, -ENOMEM when out of memory, and -EBUSY if freeing up
  6789	 * the pages to mark them logically offline failed because some pages are
  6790	 * unmovable.
  6791	 */
  6792	int logically_offline_online_pages(unsigned long pfn, unsigned long nr_pages)
> 6793	{
  6794		const bool is_movable = is_zone_movable_page(pfn_to_page(pfn));
  6795		int rc, retry_count;
  6796	
  6797		if (WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pageblock_nr_pages)))
  6798			return -EINVAL;
  6799	
  6800		for (retry_count = 0; retry_count < 5; retry_count++) {
  6801			/*
  6802			 * Use noprof: we're allocating the memory to unplug it, not to
  6803			 * use it. We might offline and remove these pages without
  6804			 * ever handing them back to the buddy.
  6805			 */
  6806			rc = alloc_contig_range_noprof(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
  6807						       GFP_KERNEL);
  6808			if (rc == -ENOMEM)
  6809				/* whoops, out of memory */
  6810				return rc;
  6811			else if (rc && !is_movable)
  6812				break;
  6813			else if (rc)
  6814				continue;
  6815	
  6816			adjust_managed_page_count(pfn_to_page(pfn), -nr_pages);
  6817	
  6818			/*
  6819			 * Mark the pages offline and remember that they were
  6820			 * obtained through alloc_contig_range().
  6821			 */
  6822			page_offline_begin();
  6823			for (; nr_pages--; pfn++) {
  6824				struct page *page = pfn_to_page(pfn);
  6825	
  6826				__SetPageOffline(page);
  6827				if (IS_ALIGNED(pfn, pageblock_nr_pages))
  6828					SetPageDirty(page);
  6829			}
  6830			page_offline_end();
  6831			return 0;
  6832		}
  6833	
  6834		return -EBUSY;
  6835	}
  6836	EXPORT_SYMBOL_GPL(logically_offline_online_pages);
  6837	
  6838	/**
  6839	 * online_logically_offline_pages: online logically offline pages in online
  6840	 *				   memory sections
  6841	 * @pfn: the start PFN specifying the first logically offline page to online
  6842	 * @pages: the number of logically offline pages to online
  6843	 *
  6844	 * Online all pages in the range, releasing them to the buddy.
  6845	 *
  6846	 * The pages must be logically offline, either because (a) they were kept
  6847	 * logically offline when the memory section was onlined using the
  6848	 * online_page_callback; or (b) because they were logically offlined using
  6849	 * logically_offline_online_pages(). The range may contain a mixture of
  6850	 * both types (on pageblock granularity, which is implied).
  6851	 *
  6852	 * The caller must make sure that all pages are within the same zone, that
  6853	 * all memory sections are online, and that the memory sections cannot get
  6854	 * offlined concurrently.
  6855	 *
  6856	 * The range must cover full pageblocks.
  6857	 *
  6858	 * Note: there is no requirement regarding the page ranges passed to
  6859	 * this function and the page ranges passed to logically_offline_online_pages().
  6860	 * For example, it is valid to call logically_offline_online_pages() on to
  6861	 * adjacent page ranges and have a single online_logically_offline_pages()
  6862	 * call that spans the whole page range.
  6863	 */
  6864	void online_logically_offline_pages(unsigned long pfn, unsigned long nr_pages)
> 6865	{
  6866		if (WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pageblock_nr_pages)))
  6867			return;
  6868	
  6869		while (nr_pages) {
  6870			struct page *page = pfn_to_page(pfn);
  6871			int order = MAX_PAGE_ORDER;
  6872			unsigned long i;
  6873			bool dirty;
  6874	
  6875			/* Try to free in largest granularity possible. */
  6876			while (!IS_ALIGNED(pfn, 1 << order) || nr_pages < (1 << order))
  6877				order--;
  6878	
  6879			/*
  6880			 * If the page is not PageDirty(), it was kept logically offline
  6881			 * when onlining the memory block. Otherwise, it was allocated
  6882			 * using alloc_contig_range(). All pages in a pageblock are
  6883			 * alike, but we might get called on ranges where individual
  6884			 * pageblocks differ.
  6885			 */
  6886			dirty = PageDirty(page);
  6887			for (i = pageblock_nr_pages; i < (1 << order); i += pageblock_nr_pages) {
  6888				if (dirty ^ !!PageDirty(pfn_to_page(pfn + i))) {
  6889					order = pageblock_order;
  6890					break;
  6891				}
  6892			}
  6893	
  6894			if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG) && !dirty) {
  6895				generic_online_page(page, order);
  6896			} else {
  6897				VM_WARN_ON_ONCE(!dirty);
  6898				for (i = 0; i < (1 << order); i++)
  6899					/* No need to clear PageDirty(). */
  6900					__ClearPageOffline(pfn_to_page(pfn + i));
  6901				adjust_managed_page_count(page, 1 << order);
  6902				free_contig_range(pfn, 1 << order);
  6903			}
  6904	
  6905			pfn += 1 << order;
  6906			nr_pages -= 1 << order;
  6907		}
  6908	}
  6909	EXPORT_SYMBOL_GPL(online_logically_offline_pages);
  6910	#endif /* CONFIG_CONTIG_ALLOC */
  6911	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
