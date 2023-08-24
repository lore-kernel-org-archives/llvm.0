Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936BA7E;
	Thu, 24 Aug 2023 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692918472; x=1724454472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqZZmB9Jkzkp5OADhFuXNVAbz5f2RPWNuZiyTKvGiUg=;
  b=Ge+pnCkNlqLTCsG4/jm//tEe/Ep3d1VUiLsXcIueqB6/P/WTq1cjB7iU
   zXnX1gcXc3BniVJNAd1wH+1FimozrBFgcw7ohaEpCs7d61LnqR/MHwqii
   fqYn++I/5O1FyTiJOZ3EfgiSJcu8GDHam9CAvAYo30FmzIyObtrqww4n4
   JbXfMZdk7DoANJ/dhyyR8hFvIFf7Xi4gmrNpAQDG6/RaLE2dqNZA4yh6J
   gbjC6DYfRV3Ftwoc6IEXhZ8B4EcoHYKiAMGu0aEB54vC1X2xTIFVfj2aF
   6KIqdlP5fVwJMbrJI6CoOninoYDAOLeVLFKQNG4IaRCM4M17jTaFLF5j5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364771515"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364771515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 16:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714141379"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="714141379"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 16:07:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZJQb-00032C-1m;
	Thu, 24 Aug 2023 23:07:49 +0000
Date: Fri, 25 Aug 2023 07:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:total_mapcount 4/4] mm/rmap.c:1306:4: warning:
 variable 'first' is uninitialized when used here
Message-ID: <202308250733.ARMY38JJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux total_mapcount
head:   a51a7d038794500ca596fc544499429062372ac4
commit: a51a7d038794500ca596fc544499429062372ac4 [4/4] tmp
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230825/202308250733.ARMY38JJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250733.ARMY38JJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250733.ARMY38JJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/rmap.c:1306:4: warning: variable 'first' is uninitialized when used here [-Wuninitialized]
                           first += atomic_inc_and_test(&page->_mapcount);
                           ^~~~~
   mm/rmap.c:1298:41: note: initialize the variable 'first' to silence this warning
           unsigned int nr_pmdmapped = 0, i, first;
                                                  ^
                                                   = 0
   1 warning generated.


vim +/first +1306 mm/rmap.c

  1281	
  1282	/**
  1283	 * folio_add_file_rmap_range - add pte mapping to page range of a folio
  1284	 * @folio:	The folio to add the mapping to
  1285	 * @page:	The first page to add
  1286	 * @nr_pages:	The number of pages which will be mapped
  1287	 * @vma:	the vm area in which the mapping is added
  1288	 * @compound:	charge the page as compound or small page
  1289	 *
  1290	 * The page range of folio is defined by [first_page, first_page + nr_pages)
  1291	 *
  1292	 * The caller needs to hold the pte lock.
  1293	 */
  1294	void folio_add_file_rmap_range(struct folio *folio, struct page *page,
  1295				unsigned int nr_pages, struct vm_area_struct *vma,
  1296				bool compound)
  1297	{
  1298		unsigned int nr_pmdmapped = 0, i, first;
  1299		int nr = 0;
  1300	
  1301		VM_WARN_ON_FOLIO(compound && !folio_test_pmd_mappable(folio), folio);
  1302	
  1303		/* Is page being mapped by PTE? Is this its first map to be added? */
  1304		if (likely(!compound)) {
  1305			for (i = 0; i < nr_pages; i++, page++)
> 1306				first += atomic_inc_and_test(&page->_mapcount);
  1307			nr = first;
  1308			if (unlikely(folio_test_large(folio))) {
  1309				folio_mapcount_lock(folio);
  1310				if (first) {
  1311					nr = folio_nr_pages_mapped_add_return(folio,
  1312									      first);
  1313					nr = (nr < COMPOUND_MAPPED);
  1314				}
  1315				folio_total_mapcount_add(folio, nr_pages, vma);
  1316				folio_mapcount_unlock(folio);
  1317			}
  1318		} else if (folio_test_pmd_mappable(folio)) {
  1319			/* That test is redundant: it's for safety or to optimize out */
  1320			folio_mapcount_lock(folio);
  1321			first = folio_entire_mapcount_inc_test_first(folio);
  1322			if (first) {
  1323				nr = folio_nr_pages_mapped_add_return(folio, COMPOUND_MAPPED);
  1324				if (likely(nr < COMPOUND_MAPPED + COMPOUND_MAPPED)) {
  1325					nr_pmdmapped = folio_nr_pages(folio);
  1326					nr = nr_pmdmapped - (nr & FOLIO_PAGES_MAPPED);
  1327					/* Raced ahead of a remove and another add? */
  1328					if (unlikely(nr < 0))
  1329						nr = 0;
  1330				} else {
  1331					/* Raced ahead of a remove of COMPOUND_MAPPED */
  1332					nr = 0;
  1333				}
  1334			}
  1335			folio_total_mapcount_inc(folio, vma);
  1336			folio_mapcount_unlock(folio);
  1337		}
  1338	
  1339		if (nr_pmdmapped)
  1340			__lruvec_stat_mod_folio(folio, folio_test_swapbacked(folio) ?
  1341				NR_SHMEM_PMDMAPPED : NR_FILE_PMDMAPPED, nr_pmdmapped);
  1342		if (nr)
  1343			__lruvec_stat_mod_folio(folio, NR_FILE_MAPPED, nr);
  1344	
  1345		mlock_vma_folio(folio, vma, compound);
  1346	}
  1347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
