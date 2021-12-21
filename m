Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30760168
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640089139; x=1671625139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VpIP02AO/AXjS+uE/xZLQAw/xmY5WS1WVBycHkalgxg=;
  b=Gvmyi1OYiE1jAkND7tKmlsIQEWjPoyteQzr1q6oL/VZIk/LL+kHuZb96
   ugw3a36p2r/+QicHT4SxcT6Bt4s9v5Yupo7mI7mO394l/Z7+wPHidBsHK
   y6WBv1iXHXcLbJ1FjEOiGpr90ztBMPOCnGg1I36Mxmsp1bAC2KcqCvZzw
   OgTsaq1S9aPFjtPrhzLawMz3se0t8Fzci1OElr6idJDQlqO9elPURTUQ0
   H1r03+oNgiOGWSpzcKibVoIKvIPSQ0ejA4gAhZ35aw35NK9iRJ3zzr4em
   741RJoe/XnjK0hvpK1t9XasZ2IhCtC0r9zPy23dhN9+8d2Tw/pbgKOjAO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227233120"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="227233120"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 04:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="616746533"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Dec 2021 04:18:56 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mze6a-000956-5L; Tue, 21 Dec 2021 12:18:56 +0000
Date: Tue, 21 Dec 2021 20:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [davidhildenbrand:unshare_new 1/4] mm/page_alloc.c:1329:4: error:
 implicit declaration of function '__ClearPageAnonExlusive'
Message-ID: <202112212008.VXy63TTH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://github.com/davidhildenbrand/linux unshare_new
head:   0b0d58f51fe2675e4dcfb11263ad4cbec053711f
commit: 139b194e6278612218eae13497d76b2605489317 [1/4] mm/page-flags: Introduce PG_anon_exlusive which overloads PG_swap for !PageAnon()
config: hexagon-randconfig-r045-20211220 (https://download.01.org/0day-ci/archive/20211221/202112212008.VXy63TTH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/davidhildenbrand/linux/commit/139b194e6278612218eae13497d76b2605489317
        git remote add davidhildenbrand git://github.com/davidhildenbrand/linux
        git fetch --no-tags davidhildenbrand unshare_new
        git checkout 139b194e6278612218eae13497d76b2605489317
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:1329:4: error: implicit declaration of function '__ClearPageAnonExlusive' [-Werror,-Wimplicit-function-declaration]
                           __ClearPageAnonExlusive(page);
                           ^
   mm/page_alloc.c:1329:4: note: did you mean '__ClearPageAnonExclusive'?
   include/linux/page-flags.h:964:29: note: '__ClearPageAnonExclusive' declared here
   static __always_inline void __ClearPageAnonExclusive(struct page *page)
                               ^
   mm/page_alloc.c:3807:15: warning: no previous prototype for function 'should_fail_alloc_page' [-Wmissing-prototypes]
   noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
                 ^
   mm/page_alloc.c:3807:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
            ^
            static 
   1 warning and 1 error generated.


vim +/__ClearPageAnonExlusive +1329 mm/page_alloc.c

  1281	
  1282	static __always_inline bool free_pages_prepare(struct page *page,
  1283				unsigned int order, bool check_free, fpi_t fpi_flags)
  1284	{
  1285		int bad = 0;
  1286		bool skip_kasan_poison = should_skip_kasan_poison(page, fpi_flags);
  1287	
  1288		VM_BUG_ON_PAGE(PageTail(page), page);
  1289	
  1290		trace_mm_page_free(page, order);
  1291	
  1292		if (unlikely(PageHWPoison(page)) && !order) {
  1293			/*
  1294			 * Do not let hwpoison pages hit pcplists/buddy
  1295			 * Untie memcg state and reset page's owner
  1296			 */
  1297			if (memcg_kmem_enabled() && PageMemcgKmem(page))
  1298				__memcg_kmem_uncharge_page(page, order);
  1299			reset_page_owner(page, order);
  1300			return false;
  1301		}
  1302	
  1303		/*
  1304		 * Check tail pages before head page information is cleared to
  1305		 * avoid checking PageCompound for order-0 pages.
  1306		 */
  1307		if (unlikely(order)) {
  1308			bool compound = PageCompound(page);
  1309			int i;
  1310	
  1311			VM_BUG_ON_PAGE(compound && compound_order(page) != order, page);
  1312	
  1313			if (compound) {
  1314				ClearPageDoubleMap(page);
  1315				ClearPageHasHWPoisoned(page);
  1316			}
  1317			for (i = 1; i < (1 << order); i++) {
  1318				if (compound)
  1319					bad += free_tail_pages_check(page, page + i);
  1320				if (unlikely(check_free_page(page + i))) {
  1321					bad++;
  1322					continue;
  1323				}
  1324				(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
  1325			}
  1326		}
  1327		if (PageMappingFlags(page)) {
  1328			if (__PageAnon(page))
> 1329				__ClearPageAnonExlusive(page);
  1330			page->mapping = NULL;
  1331		}
  1332		if (memcg_kmem_enabled() && PageMemcgKmem(page))
  1333			__memcg_kmem_uncharge_page(page, order);
  1334		if (check_free)
  1335			bad += check_free_page(page);
  1336		if (bad)
  1337			return false;
  1338	
  1339		page_cpupid_reset_last(page);
  1340		page->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
  1341		reset_page_owner(page, order);
  1342	
  1343		if (!PageHighMem(page)) {
  1344			debug_check_no_locks_freed(page_address(page),
  1345						   PAGE_SIZE << order);
  1346			debug_check_no_obj_freed(page_address(page),
  1347						   PAGE_SIZE << order);
  1348		}
  1349	
  1350		kernel_poison_pages(page, 1 << order);
  1351	
  1352		/*
  1353		 * As memory initialization might be integrated into KASAN,
  1354		 * kasan_free_pages and kernel_init_free_pages must be
  1355		 * kept together to avoid discrepancies in behavior.
  1356		 *
  1357		 * With hardware tag-based KASAN, memory tags must be set before the
  1358		 * page becomes unavailable via debug_pagealloc or arch_free_page.
  1359		 */
  1360		if (kasan_has_integrated_init()) {
  1361			if (!skip_kasan_poison)
  1362				kasan_free_pages(page, order);
  1363		} else {
  1364			bool init = want_init_on_free();
  1365	
  1366			if (init)
  1367				kernel_init_free_pages(page, 1 << order, false);
  1368			if (!skip_kasan_poison)
  1369				kasan_poison_pages(page, order, init);
  1370		}
  1371	
  1372		/*
  1373		 * arch_free_page() can make the page's contents inaccessible.  s390
  1374		 * does this.  So nothing which can access the page's contents should
  1375		 * happen after this.
  1376		 */
  1377		arch_free_page(page, order);
  1378	
  1379		debug_pagealloc_unmap_pages(page, 1 << order);
  1380	
  1381		return true;
  1382	}
  1383	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
