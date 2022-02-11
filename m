Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9097F
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 23:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644621434; x=1676157434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3uDkKfWJW+Hl4RsTnEsj60dakYDgQfSC8Z/vXEobp8Y=;
  b=EZUIoOaIkXGkN3l59qGqSEDvLEWWUI7RwzbRllFVcGZen+CEo0566rO6
   JJj8PsAYhhfk+07C/jb893kX0XWiihYDsUtEO3ajt8rrWEK7Gfj6+Dh9Q
   zIcCkkt6eOwbJvUDiIL/J/FxxhvjoHZ4B01Sxeyp8AsWBPxx6n+fyYQHT
   XwHI6zlKw1VeSAGd8lYHpgdG1INCnHffzCJ8HF7DuLvxtgBTh6VeUWtmU
   3IfiPbvoThrn8Qx5MCIAdzSCMW7d00Ho6PWAFSh4ArsflPy4MZYT9B1qm
   2eaOK+iqhGpTo0bTCHXsTEG6meGeRo/5o13Db4AOY09JwZgVkEV9Pvy86
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="237230786"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="237230786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 15:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="542279022"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Feb 2022 15:17:13 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIfA8-0005Kh-Iv; Fri, 11 Feb 2022 23:17:12 +0000
Date: Sat, 12 Feb 2022 07:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <zi.yan@sent.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Message-ID: <202202120720.MfxEFq7T-lkp@intel.com>
References: <20220211164135.1803616-4-zi.yan@sent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211164135.1803616-4-zi.yan@sent.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]
[also build test ERROR on powerpc/next linux/master linus/master v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zi-Yan/Use-pageblock_order-for-cma-and-alloc_contig_range-alignment/20220212-004358
base:   https://github.com/hnaz/linux-mm master
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220212/202202120720.MfxEFq7T-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5aacb9dfc8abb1a0610b70226606408a96d0e997
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zi-Yan/Use-pageblock_order-for-cma-and-alloc_contig_range-alignment/20220212-004358
        git checkout 5aacb9dfc8abb1a0610b70226606408a96d0e997
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/page_isolation.c:332:8: error: implicit declaration of function 'isolate_single_pageblock' [-Werror,-Wimplicit-function-declaration]
           ret = isolate_single_pageblock(isolate_start, gfp_flags, 0);
                 ^
   1 error generated.


vim +/isolate_single_pageblock +332 mm/page_isolation.c

   274	
   275	/**
   276	 * start_isolate_page_range() - make page-allocation-type of range of pages to
   277	 * be MIGRATE_ISOLATE.
   278	 * @start_pfn:		The lower PFN of the range to be isolated.
   279	 * @end_pfn:		The upper PFN of the range to be isolated.
   280	 * @migratetype:	Migrate type to set in error recovery.
   281	 * @flags:		The following flags are allowed (they can be combined in
   282	 *			a bit mask)
   283	 *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
   284	 *					 e.g., skip over PageHWPoison() pages
   285	 *					 and PageOffline() pages.
   286	 *			REPORT_FAILURE - report details about the failure to
   287	 *			isolate the range
   288	 * @gfp_flags:		GFP flags used for migrating pages that sit across the
   289	 *			range boundaries.
   290	 *
   291	 * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
   292	 * the range will never be allocated. Any free pages and pages freed in the
   293	 * future will not be allocated again. If specified range includes migrate types
   294	 * other than MOVABLE or CMA, this will fail with -EBUSY. For isolating all
   295	 * pages in the range finally, the caller have to free all pages in the range.
   296	 * test_page_isolated() can be used for test it.
   297	 *
   298	 * The function first tries to isolate the pageblocks at the beginning and end
   299	 * of the range, since there might be pages across the range boundaries.
   300	 * Afterwards, it isolates the rest of the range.
   301	 *
   302	 * There is no high level synchronization mechanism that prevents two threads
   303	 * from trying to isolate overlapping ranges. If this happens, one thread
   304	 * will notice pageblocks in the overlapping range already set to isolate.
   305	 * This happens in set_migratetype_isolate, and set_migratetype_isolate
   306	 * returns an error. We then clean up by restoring the migration type on
   307	 * pageblocks we may have modified and return -EBUSY to caller. This
   308	 * prevents two threads from simultaneously working on overlapping ranges.
   309	 *
   310	 * Please note that there is no strong synchronization with the page allocator
   311	 * either. Pages might be freed while their page blocks are marked ISOLATED.
   312	 * A call to drain_all_pages() after isolation can flush most of them. However
   313	 * in some cases pages might still end up on pcp lists and that would allow
   314	 * for their allocation even when they are in fact isolated already. Depending
   315	 * on how strong of a guarantee the caller needs, zone_pcp_disable/enable()
   316	 * might be used to flush and disable pcplist before isolation and enable after
   317	 * unisolation.
   318	 *
   319	 * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
   320	 */
   321	int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
   322				     unsigned migratetype, int flags, gfp_t gfp_flags)
   323	{
   324		unsigned long pfn;
   325		struct page *page;
   326		/* isolation is done at page block granularity */
   327		unsigned long isolate_start = ALIGN_DOWN(start_pfn, pageblock_nr_pages);
   328		unsigned long isolate_end = ALIGN(end_pfn, pageblock_nr_pages);
   329		int ret;
   330	
   331		/* isolate [isolate_start, isolate_start + pageblock_nr_pages] pageblock */
 > 332		ret = isolate_single_pageblock(isolate_start, gfp_flags, 0);
   333		if (ret)
   334			return ret;
   335	
   336		/* isolate [isolate_end - pageblock_nr_pages, isolate_end] pageblock */
   337		ret = isolate_single_pageblock(isolate_end, gfp_flags, 1);
   338		if (ret) {
   339			unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
   340			return ret;
   341		}
   342	
   343		/* skip isolated pageblocks at the beginning and end */
   344		for (pfn = isolate_start + pageblock_nr_pages;
   345		     pfn < isolate_end - pageblock_nr_pages;
   346		     pfn += pageblock_nr_pages) {
   347			page = __first_valid_page(pfn, pageblock_nr_pages);
   348			if (page && set_migratetype_isolate(page, migratetype, flags,
   349						start_pfn, end_pfn)) {
   350				undo_isolate_page_range(isolate_start, pfn, migratetype);
   351				unset_migratetype_isolate(
   352					pfn_to_page(isolate_end - pageblock_nr_pages),
   353					migratetype);
   354				return -EBUSY;
   355			}
   356		}
   357		return 0;
   358	}
   359	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
