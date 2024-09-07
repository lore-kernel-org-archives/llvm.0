Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E1C15CD41;
	Sat,  7 Sep 2024 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725716867; cv=none; b=fc+0Y5MzT4sIefZQipr+XsFG4b38LOvsBcZPqHc36HUI5fZ40Hs7/bsxf8M+cz6iLdpPZzYeS4kL98wGymyPkbFT6n2r1ADOLKQKjmEMmK92k9ZdFk6xt6wGQKV4E9od20NUJCi8xewid3TVEAFK1KdCYR0YrFBClPcOevk7WEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725716867; c=relaxed/simple;
	bh=vpOm5AcYlu84t1jR3HKXkNKesjn0lBhjGi6jp7lv3OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vEBvscnmeVeoDRQMXuFQn2VKmFCs4zXtJn1hoVBKjENGiSyog5VLJNY4JF0rBLpnAQ9NAhXSvmmrOatCZ2IOMfXxvErAt2m5iU2StwC06j6iR7JjEidxcrpKmhdbKHrdNvXWBA8q6G6gMajApa7BHNl2rJqSOb2zAvLDsdvuJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO9oWN2F; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO9oWN2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725716866; x=1757252866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpOm5AcYlu84t1jR3HKXkNKesjn0lBhjGi6jp7lv3OE=;
  b=GO9oWN2FiewG3H+OgcLW0Jx460kWz35Rapxtz/54YPhogC0OdUQmfXmJ
   XN4HTbhViUzfnXVeqHBxf/QWjB3S5VwCwwVXfaM1+n4dNCtxWTLz2lZTu
   pTx9B+LbF9/gT2wuqRFyHQwCLaiTon8h69xg38Vjk74yQa6Avp1259tbV
   8VKmqcXlxlRdlAWle4HZjcNAyD/0oYjnBvm0HijejwrrNvEuFc3VxAujH
   NfmWFA0Lm40To/l/sUOSD0uKZTOqRbYGH27EVGutMpnEBdFWfaS93YHTg
   fDTtyZuah4cTqQixOFda1mnPtDQHjc9mgdYh1DfXyM4FQkCWqDmaDo4tR
   g==;
X-CSE-ConnectionGUID: Oiqn+o5uSemD6U00LO16AA==
X-CSE-MsgGUID: 0XBX/1xHRO+pwiFgFG3u5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24613074"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24613074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 06:47:45 -0700
X-CSE-ConnectionGUID: zYGpOGnqTIO5zCs/2S9Z7Q==
X-CSE-MsgGUID: l51I+wyHQHWSPtgmVbi82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70615418"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2024 06:47:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smvmv-000CbJ-2V;
	Sat, 07 Sep 2024 13:47:41 +0000
Date: Sat, 7 Sep 2024 21:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-logically-offline 7/9]
 mm/page_alloc.c:6895:4: error: call to undeclared function
 'generic_online_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409072120.6sUeIny0-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409072120.6sUeIny0-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072120.6sUeIny0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072120.6sUeIny0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:6895:4: error: call to undeclared function 'generic_online_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6895 |                         generic_online_page(page, order);
         |                         ^
   1 error generated.


vim +/generic_online_page +6895 mm/page_alloc.c

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
  6865	{
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
> 6895				generic_online_page(page, order);
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
