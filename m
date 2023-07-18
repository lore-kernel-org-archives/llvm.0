Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914ECA941;
	Tue, 18 Jul 2023 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689673370; x=1721209370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivtJMFakXRs5sqT6rv9YztLenT1sZ8khP5IXNufO8Hg=;
  b=VxYcmQRVSKMKAjKkYkVIwEXdjmtbpeuuJziYd3o6H4jH0b8FEMr9OlP9
   hv8Ei6XQhQR/bv39m3ETZpC+7CVI98m2xHGDT09I8VpQWEY+pTeyjYpUv
   vxjdZIBb2bkCwxF06g+fye4kY+iJ7btdw1AspxSWVHx0FDeDBEtYNEHH8
   MzO2ouOIXoxFJR38+y6+Nh8AJY2LkQrYC0EtHfMnKKaXWBu21eDdOfWIZ
   xUynD4r15SMoTRFdsNwaBwKisnksT7UoDGKSGClEi8vjA0NgQ32sCenaF
   5+DMP/z0WADAFzmiPSERSd4nt2XGc8LdU+/FLNL150IoR2FO8+1loE4f6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452539632"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="452539632"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 02:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="847628954"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="847628954"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 02:42:44 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLhEB-0000Rp-0o;
	Tue, 18 Jul 2023 09:42:43 +0000
Date: Tue, 18 Jul 2023 17:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hu Haowen <src.res.211@gmail.com>
Subject: [srcres258-doc:next 1/1] mm/memory-failure.c:1891:6: error:
 redefinition of 'is_raw_hwpoison_page_in_hugepage'
Message-ID: <202307181715.0dwDb1O9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/srcres258/linux-doc next
head:   1f94ea418de902796fa65b97c7138c5c6dff13dc
commit: 1f94ea418de902796fa65b97c7138c5c6dff13dc [1/1] Merge commit '899cbd7b84da84d430b58d3bab82314e7f41c71d' into next
config: x86_64-buildonly-randconfig-r001-20230717 (https://download.01.org/0day-ci/archive/20230718/202307181715.0dwDb1O9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181715.0dwDb1O9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181715.0dwDb1O9-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory-failure.c:1845:17: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_hwp_head = raw_hwp_list_head(folio);
                          ^
   mm/memory-failure.c:1845:15: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           raw_hwp_head = raw_hwp_list_head(folio);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-failure.c:1878:17: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_hwp_head = raw_hwp_list_head(folio);
                          ^
   mm/memory-failure.c:1878:15: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           raw_hwp_head = raw_hwp_list_head(folio);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memory-failure.c:1891:6: error: redefinition of 'is_raw_hwpoison_page_in_hugepage'
   bool is_raw_hwpoison_page_in_hugepage(struct page *page)
        ^
   mm/memory-failure.c:1856:6: note: previous definition is here
   bool is_raw_hwpoison_page_in_hugepage(struct page *page)
        ^
   mm/memory-failure.c:1913:17: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           raw_hwp_head = raw_hwp_list_head(folio);
                          ^
   mm/memory-failure.c:1913:15: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           raw_hwp_head = raw_hwp_list_head(folio);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-failure.c:1931:23: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           head = llist_del_all(raw_hwp_list_head(folio));
                                ^
   mm/memory-failure.c:1931:23: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct llist_head *' [-Wint-conversion]
           head = llist_del_all(raw_hwp_list_head(folio));
                                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/llist.h:237:67: note: passing argument to parameter 'head' here
   static inline struct llist_node *llist_del_all(struct llist_head *head)
                                                                     ^
   mm/memory-failure.c:1959:9: error: call to undeclared function 'raw_hwp_list_head'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           head = raw_hwp_list_head(folio);
                  ^
   mm/memory-failure.c:1959:7: error: incompatible integer to pointer conversion assigning to 'struct llist_head *' from 'int' [-Wint-conversion]
           head = raw_hwp_list_head(folio);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   11 errors generated.


vim +/is_raw_hwpoison_page_in_hugepage +1891 mm/memory-failure.c

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
1f94ea418de902 Hu Haowen       2023-07-17  1857  {
1f94ea418de902 Hu Haowen       2023-07-17  1858  	struct llist_head *raw_hwp_head;
1f94ea418de902 Hu Haowen       2023-07-17  1859  	struct raw_hwp_page *p;
1f94ea418de902 Hu Haowen       2023-07-17  1860  	struct folio *folio = page_folio(page);
1f94ea418de902 Hu Haowen       2023-07-17  1861  	bool ret = false;
1f94ea418de902 Hu Haowen       2023-07-17  1862  
1f94ea418de902 Hu Haowen       2023-07-17  1863  	if (!folio_test_hwpoison(folio))
1f94ea418de902 Hu Haowen       2023-07-17  1864  		return false;
1f94ea418de902 Hu Haowen       2023-07-17  1865  
1f94ea418de902 Hu Haowen       2023-07-17  1866  	if (!folio_test_hugetlb(folio))
1f94ea418de902 Hu Haowen       2023-07-17  1867  		return PageHWPoison(page);
1f94ea418de902 Hu Haowen       2023-07-17  1868  
1f94ea418de902 Hu Haowen       2023-07-17  1869  	/*
1f94ea418de902 Hu Haowen       2023-07-17  1870  	 * When RawHwpUnreliable is set, kernel lost track of which subpages
1f94ea418de902 Hu Haowen       2023-07-17  1871  	 * are HWPOISON. So return as if ALL subpages are HWPOISONed.
1f94ea418de902 Hu Haowen       2023-07-17  1872  	 */
1f94ea418de902 Hu Haowen       2023-07-17  1873  	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
1f94ea418de902 Hu Haowen       2023-07-17  1874  		return true;
1f94ea418de902 Hu Haowen       2023-07-17  1875  
1f94ea418de902 Hu Haowen       2023-07-17  1876  	mutex_lock(&mf_mutex);
1f94ea418de902 Hu Haowen       2023-07-17  1877  
1f94ea418de902 Hu Haowen       2023-07-17  1878  	raw_hwp_head = raw_hwp_list_head(folio);
1f94ea418de902 Hu Haowen       2023-07-17  1879  	llist_for_each_entry(p, raw_hwp_head->first, node) {
1f94ea418de902 Hu Haowen       2023-07-17  1880  		if (page == p->page) {
1f94ea418de902 Hu Haowen       2023-07-17  1881  			ret = true;
1f94ea418de902 Hu Haowen       2023-07-17  1882  			break;
1f94ea418de902 Hu Haowen       2023-07-17  1883  		}
1f94ea418de902 Hu Haowen       2023-07-17  1884  	}
1f94ea418de902 Hu Haowen       2023-07-17  1885  
1f94ea418de902 Hu Haowen       2023-07-17  1886  	mutex_unlock(&mf_mutex);
1f94ea418de902 Hu Haowen       2023-07-17  1887  
1f94ea418de902 Hu Haowen       2023-07-17  1888  	return ret;
161df60e9e8965 Naoya Horiguchi 2022-07-14  1889  }
161df60e9e8965 Naoya Horiguchi 2022-07-14  1890  
6877d647d86cd0 Jiaqi Yan       2023-07-13 @1891  bool is_raw_hwpoison_page_in_hugepage(struct page *page)
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1892  {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1893  	struct llist_head *raw_hwp_head;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1894  	struct raw_hwp_page *p;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1895  	struct folio *folio = page_folio(page);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1896  	bool ret = false;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1897  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1898  	if (!folio_test_hwpoison(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1899  		return false;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1900  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1901  	if (!folio_test_hugetlb(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1902  		return PageHWPoison(page);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1903  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1904  	/*
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1905  	 * When RawHwpUnreliable is set, kernel lost track of which subpages
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1906  	 * are HWPOISON. So return as if ALL subpages are HWPOISONed.
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1907  	 */
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1908  	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1909  		return true;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1910  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1911  	mutex_lock(&mf_mutex);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1912  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1913  	raw_hwp_head = raw_hwp_list_head(folio);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1914  	llist_for_each_entry(p, raw_hwp_head->first, node) {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1915  		if (page == p->page) {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1916  			ret = true;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1917  			break;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1918  		}
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1919  	}
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1920  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1921  	mutex_unlock(&mf_mutex);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1922  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1923  	return ret;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1924  }
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1925  

:::::: The code at line 1891 was first introduced by commit
:::::: 6877d647d86cd0ed29687ce09f3a5787a6553c54 mm/hwpoison: check if a raw page in a hugetlb folio is raw HWPOISON

:::::: TO: Jiaqi Yan <jiaqiyan@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
