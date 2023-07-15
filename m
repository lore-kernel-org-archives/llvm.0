Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D9415C5;
	Sat, 15 Jul 2023 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689418380; x=1720954380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAxdqF1VdrnIPVpnp6UTNHqsFqyxd0k38gQPCZE1bt0=;
  b=n/Iglg6t9WzE7UedUNzy0kQKGkA08CPnN2I7eiKmn6dKvubup8znvyVs
   cpeVQJfqGtmYYFPecL2CpvKTlbp48sIXvHsU1xZCfTE1PLj/YmM2qt0cG
   rrMk80+q0GjFxBzVN8tynFSCX3MKI7x1aSja8XenaWAXoX0tmOa0g7XDU
   9jshVqRY/9vb8MJNDZ8YlpoeJohdEUpqg9umirR8mFDW4+0UbzE47cs3+
   SlLjca3Vg+08GEZStQglg527IrW6uekWwvAJXkh45blfcCm3IaC/iGx3l
   yBlKNnlUZRQo3wX9TGnJ+/ZM9sTGZ4BKcZx9/YEh5fXfiYPMS7R3rKsRO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="368292569"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="368292569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 03:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896683787"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="896683787"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jul 2023 03:52:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKctV-000889-14;
	Sat, 15 Jul 2023 10:52:57 +0000
Date: Sat, 15 Jul 2023 18:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hu Haowen <src.res.211@gmail.com>
Subject: [srcres258-doc:next 1/1] mm/memory-failure.c:1845:17: error: call to
 undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307151813.cxpmtr1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/srcres258/linux-doc next
head:   402c80656f93d63ae5b6d2bdd940f13abf809879
commit: 402c80656f93d63ae5b6d2bdd940f13abf809879 [1/1] Merge commit 'f0412619534a7315acfcbfdf1fa7aa7e8a93f69c' into next
config: x86_64-randconfig-x013-20230715 (https://download.01.org/0day-ci/archive/20230715/202307151813.cxpmtr1x-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151813.cxpmtr1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151813.cxpmtr1x-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/memory-failure.c:1845:17: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_hwp_head = raw_hwp_list_head(folio);
                          ^
>> mm/memory-failure.c:1845:15: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           raw_hwp_head = raw_hwp_list_head(folio);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-failure.c:1878:17: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_hwp_head = raw_hwp_list_head(folio);
                          ^
   mm/memory-failure.c:1878:15: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           raw_hwp_head = raw_hwp_list_head(folio);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-failure.c:1896:23: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           head = llist_del_all(raw_hwp_list_head(folio));
                                ^
>> mm/memory-failure.c:1896:23: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct llist_head *' [-Wint-conversion]
           head = llist_del_all(raw_hwp_list_head(folio));
                                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/llist.h:237:67: note: passing argument to parameter 'head' here
   static inline struct llist_node *llist_del_all(struct llist_head *head)
                                                                     ^
   mm/memory-failure.c:1924:9: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           head = raw_hwp_list_head(folio);
                  ^
   mm/memory-failure.c:1924:7: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           head = raw_hwp_list_head(folio);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   8 errors generated.
--
>> mm/hugetlb.c:7236:6: warning: no previous prototype for function 'is_raw_hwp_subpage' [-Wmissing-prototypes]
   bool is_raw_hwp_subpage(struct folio *folio, struct page *subpage)
        ^
   mm/hugetlb.c:7236:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_raw_hwp_subpage(struct folio *folio, struct page *subpage)
   ^
   static 
   1 warning generated.


vim +/raw_hwp_list_head +1845 mm/memory-failure.c

161df60e9e8965 Naoya Horiguchi 2022-07-14  1828  
e833a46a28d799 Jiaqi Yan       2023-07-07  1829  bool __is_raw_hwp_subpage(struct folio *folio, struct page *subpage)
e833a46a28d799 Jiaqi Yan       2023-07-07  1830  {
e833a46a28d799 Jiaqi Yan       2023-07-07  1831  	struct llist_head *raw_hwp_head;
e833a46a28d799 Jiaqi Yan       2023-07-07  1832  	struct raw_hwp_page *p, *tmp;
e833a46a28d799 Jiaqi Yan       2023-07-07  1833  	bool ret = false;
e833a46a28d799 Jiaqi Yan       2023-07-07  1834  
e833a46a28d799 Jiaqi Yan       2023-07-07  1835  	if (!folio_test_hwpoison(folio))
e833a46a28d799 Jiaqi Yan       2023-07-07  1836  		return false;
e833a46a28d799 Jiaqi Yan       2023-07-07  1837  
161df60e9e8965 Naoya Horiguchi 2022-07-14  1838  	/*
e833a46a28d799 Jiaqi Yan       2023-07-07  1839  	 * When RawHwpUnreliable is set, kernel lost track of which subpages
e833a46a28d799 Jiaqi Yan       2023-07-07  1840  	 * are HWPOISON. So return as if ALL subpages are HWPOISONed.
161df60e9e8965 Naoya Horiguchi 2022-07-14  1841  	 */
e833a46a28d799 Jiaqi Yan       2023-07-07  1842  	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
e833a46a28d799 Jiaqi Yan       2023-07-07  1843  		return true;
161df60e9e8965 Naoya Horiguchi 2022-07-14  1844  
e833a46a28d799 Jiaqi Yan       2023-07-07 @1845  	raw_hwp_head = raw_hwp_list_head(folio);
e833a46a28d799 Jiaqi Yan       2023-07-07  1846  	llist_for_each_entry_safe(p, tmp, raw_hwp_head->first, node) {
e833a46a28d799 Jiaqi Yan       2023-07-07  1847  		if (subpage == p->page) {
e833a46a28d799 Jiaqi Yan       2023-07-07  1848  			ret = true;
e833a46a28d799 Jiaqi Yan       2023-07-07  1849  			break;
e833a46a28d799 Jiaqi Yan       2023-07-07  1850  		}
e833a46a28d799 Jiaqi Yan       2023-07-07  1851  	}
e833a46a28d799 Jiaqi Yan       2023-07-07  1852  
e833a46a28d799 Jiaqi Yan       2023-07-07  1853  	return ret;
161df60e9e8965 Naoya Horiguchi 2022-07-14  1854  }
161df60e9e8965 Naoya Horiguchi 2022-07-14  1855  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1856  bool is_raw_hwpoison_page_in_hugepage(struct page *page)
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1857  {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1858  	struct llist_head *raw_hwp_head;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1859  	struct raw_hwp_page *p;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1860  	struct folio *folio = page_folio(page);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1861  	bool ret = false;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1862  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1863  	if (!folio_test_hwpoison(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1864  		return false;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1865  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1866  	if (!folio_test_hugetlb(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1867  		return PageHWPoison(page);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1868  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1869  	/*
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1870  	 * When RawHwpUnreliable is set, kernel lost track of which subpages
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1871  	 * are HWPOISON. So return as if ALL subpages are HWPOISONed.
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1872  	 */
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1873  	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1874  		return true;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1875  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1876  	mutex_lock(&mf_mutex);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1877  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1878  	raw_hwp_head = raw_hwp_list_head(folio);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1879  	llist_for_each_entry(p, raw_hwp_head->first, node) {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1880  		if (page == p->page) {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1881  			ret = true;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1882  			break;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1883  		}
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1884  	}
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1885  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1886  	mutex_unlock(&mf_mutex);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1887  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1888  	return ret;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1889  }
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1890  
0858b5eb3aab2d Sidhartha Kumar 2023-01-12  1891  static unsigned long __folio_free_raw_hwp(struct folio *folio, bool move_flag)
161df60e9e8965 Naoya Horiguchi 2022-07-14  1892  {
4352a5a7830080 Jiaqi Yan       2023-07-07  1893  	struct llist_node *t, *tnode, *head;
ac5fcde0a96a18 Naoya Horiguchi 2022-07-14  1894  	unsigned long count = 0;
161df60e9e8965 Naoya Horiguchi 2022-07-14  1895  
4352a5a7830080 Jiaqi Yan       2023-07-07 @1896  	head = llist_del_all(raw_hwp_list_head(folio));
4352a5a7830080 Jiaqi Yan       2023-07-07  1897  	llist_for_each_safe(tnode, t, head) {
161df60e9e8965 Naoya Horiguchi 2022-07-14  1898  		struct raw_hwp_page *p = container_of(tnode, struct raw_hwp_page, node);
161df60e9e8965 Naoya Horiguchi 2022-07-14  1899  
ac5fcde0a96a18 Naoya Horiguchi 2022-07-14  1900  		if (move_flag)
161df60e9e8965 Naoya Horiguchi 2022-07-14  1901  			SetPageHWPoison(p->page);
5033091de814ab Naoya Horiguchi 2022-10-24  1902  		else
5033091de814ab Naoya Horiguchi 2022-10-24  1903  			num_poisoned_pages_sub(page_to_pfn(p->page), 1);
161df60e9e8965 Naoya Horiguchi 2022-07-14  1904  		kfree(p);
ac5fcde0a96a18 Naoya Horiguchi 2022-07-14  1905  		count++;
161df60e9e8965 Naoya Horiguchi 2022-07-14  1906  	}
ac5fcde0a96a18 Naoya Horiguchi 2022-07-14  1907  	return count;
161df60e9e8965 Naoya Horiguchi 2022-07-14  1908  }
161df60e9e8965 Naoya Horiguchi 2022-07-14  1909  

:::::: The code at line 1845 was first introduced by commit
:::::: e833a46a28d799bf3c4816d79487ee5f8b6fef51 mm/hwpoison: check if a subpage of a hugetlb folio is raw HWPOISON

:::::: TO: Jiaqi Yan <jiaqiyan@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
