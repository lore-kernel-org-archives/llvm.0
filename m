Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028A11624E7;
	Sun, 16 Feb 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739714902; cv=none; b=Ns3KMajLr+Pz0Cl3RPaSuSFOhdx3F0fr8nsZU6tigrRf7PTT7ILbZ4CVmgswPFky1/4Y7PZODt3SkAH0apx/CYIlVi448d+G01wW3KrH5dTnh347KtUJ8iFyFgO3u0DcsrhCZurZI+UApkiDriBts+wbxDJUTuUWKLZAWatenXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739714902; c=relaxed/simple;
	bh=AVnu0UguhsrnSByrKh3Zz+f6jHR1vuC+ApQ7ItURzps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUrfo3nYw2c5whEXI6n/X+vHKm8BvMvFAEOvNrnTe08kULV6HPciUjMpeFNIB8NOIrO1bh/WRqAoTjkrIEmRJrBnDqUOpw7Ug+yUkiBw5pdgkSPARvgTNXasIz1VaOMlG8XCavFU/8GWxwcmdtkr/YTxWHt2OObDTqqq240jXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4X2nVFI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4X2nVFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739714901; x=1771250901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVnu0UguhsrnSByrKh3Zz+f6jHR1vuC+ApQ7ItURzps=;
  b=P4X2nVFII/8WEkKgjOv8f/LWxC0gdWFcFdqF+QE4mDsTC1LM8DlgiaKR
   pUW0WT4X546iawPBPr9aIh3K2uOPkSZVXc1IO/Se4RFvc76mqg0WxysjV
   A4vRMCh21enNBSCPoz1+uIYMvG+vni9L66bueV8gr8XL+bsYgkkQgPRRu
   54BDkxZLV1z+VUSPZQOG3aYNamEbFBF/VNWrzqUDx7Y34L2R5n6O/2rQ+
   Y0WQ9nglgx/XCm1PiowjV8fohZgWfMwCSyXA036V4jZKOZgF/SShxXlaj
   dPm/oNsM0CUKwZcHdkSjEwc8wzgl7PoDOMqeXp+i7kbb0HT7enZPy/v95
   g==;
X-CSE-ConnectionGUID: 3N4GydSwRpGJSNLWlmueJQ==
X-CSE-MsgGUID: fCHZzhYuQzy+uHZ++6uaYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51833085"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51833085"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 06:08:15 -0800
X-CSE-ConnectionGUID: U5nCkJ4BSZCdlwJSXbBxAA==
X-CSE-MsgGUID: LiZ6ZUS/S2ex11PRSZoKhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="113766255"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2025 06:08:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjfJc-001Byb-0S;
	Sun, 16 Feb 2025 14:08:12 +0000
Date: Sun, 16 Feb 2025 22:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id_6.14 5/13] mm/page_alloc.c:978:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202502162158.pSfwzqTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id_6.14
head:   dcbc194183fd7526f260cc629aabff9d3300083e
commit: c599962b8dd50874ba583ccb6eb6cd9d2e973d45 [5/13] mm: move hugetlb specific things in folio to page[3]
config: hexagon-randconfig-001-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162158.pSfwzqTM-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502162158.pSfwzqTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162158.pSfwzqTM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:978:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   mm/page_alloc.c:978:2: note: insert '__attribute__((fallthrough));' to silence this warning
           default:
           ^
           __attribute__((fallthrough)); 
   mm/page_alloc.c:978:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +978 mm/page_alloc.c

ecbb490d8ee38f Kefeng Wang             2023-05-16  931  
8666925c498674 Vlastimil Babka         2023-04-05  932  static int free_tail_page_prepare(struct page *head_page, struct page *page)
4db7548ccbd9ec Mel Gorman              2016-05-19  933  {
94688e8eb453e6 Matthew Wilcox (Oracle  2023-01-11  934) 	struct folio *folio = (struct folio *)head_page;
4db7548ccbd9ec Mel Gorman              2016-05-19  935  	int ret = 1;
4db7548ccbd9ec Mel Gorman              2016-05-19  936  
4db7548ccbd9ec Mel Gorman              2016-05-19  937  	/*
4db7548ccbd9ec Mel Gorman              2016-05-19  938  	 * We rely page->lru.next never has bit 0 set, unless the page
4db7548ccbd9ec Mel Gorman              2016-05-19  939  	 * is PageTail(). Let's make sure that's true even for poisoned ->lru.
4db7548ccbd9ec Mel Gorman              2016-05-19  940  	 */
4db7548ccbd9ec Mel Gorman              2016-05-19  941  	BUILD_BUG_ON((unsigned long)LIST_POISON1 & 1);
4db7548ccbd9ec Mel Gorman              2016-05-19  942  
ecbb490d8ee38f Kefeng Wang             2023-05-16  943  	if (!is_check_pages_enabled()) {
4db7548ccbd9ec Mel Gorman              2016-05-19  944  		ret = 0;
4db7548ccbd9ec Mel Gorman              2016-05-19  945  		goto out;
4db7548ccbd9ec Mel Gorman              2016-05-19  946  	}
4db7548ccbd9ec Mel Gorman              2016-05-19  947  	switch (page - head_page) {
4db7548ccbd9ec Mel Gorman              2016-05-19  948  	case 1:
cb67f4282bf969 Hugh Dickins            2022-11-02  949  		/* the first tail page: these may be in place of ->mapping */
65a689f35ad7eb Matthew Wilcox (Oracle  2023-01-11  950) 		if (unlikely(folio_entire_mapcount(folio))) {
65a689f35ad7eb Matthew Wilcox (Oracle  2023-01-11  951) 			bad_page(page, "nonzero entire_mapcount");
4db7548ccbd9ec Mel Gorman              2016-05-19  952  			goto out;
4db7548ccbd9ec Mel Gorman              2016-05-19  953  		}
05c5323b2a344c David Hildenbrand       2024-04-09  954  		if (unlikely(folio_large_mapcount(folio))) {
05c5323b2a344c David Hildenbrand       2024-04-09  955  			bad_page(page, "nonzero large_mapcount");
05c5323b2a344c David Hildenbrand       2024-04-09  956  			goto out;
05c5323b2a344c David Hildenbrand       2024-04-09  957  		}
65a689f35ad7eb Matthew Wilcox (Oracle  2023-01-11  958) 		if (unlikely(atomic_read(&folio->_nr_pages_mapped))) {
65a689f35ad7eb Matthew Wilcox (Oracle  2023-01-11  959) 			bad_page(page, "nonzero nr_pages_mapped");
cb67f4282bf969 Hugh Dickins            2022-11-02  960  			goto out;
cb67f4282bf969 Hugh Dickins            2022-11-02  961  		}
94688e8eb453e6 Matthew Wilcox (Oracle  2023-01-11  962) 		if (unlikely(atomic_read(&folio->_pincount))) {
94688e8eb453e6 Matthew Wilcox (Oracle  2023-01-11  963) 			bad_page(page, "nonzero pincount");
cb67f4282bf969 Hugh Dickins            2022-11-02  964  			goto out;
cb67f4282bf969 Hugh Dickins            2022-11-02  965  		}
4db7548ccbd9ec Mel Gorman              2016-05-19  966  		break;
4db7548ccbd9ec Mel Gorman              2016-05-19  967  	case 2:
b7b098cf00a2b6 Matthew Wilcox (Oracle  2024-03-21  968) 		/* the second tail page: deferred_list overlaps ->mapping */
e66f3185fa04cc Hugh Dickins            2024-10-27  969  		if (unlikely(!list_empty(&folio->_deferred_list))) {
e66f3185fa04cc Hugh Dickins            2024-10-27  970  			bad_page(page, "on deferred list");
b7b098cf00a2b6 Matthew Wilcox (Oracle  2024-03-21  971) 			goto out;
b7b098cf00a2b6 Matthew Wilcox (Oracle  2024-03-21  972) 		}
4db7548ccbd9ec Mel Gorman              2016-05-19  973  		break;
c599962b8dd508 David Hildenbrand       2024-12-16  974  	case 3:
c599962b8dd508 David Hildenbrand       2024-12-16  975  		/* the third tail page: hugetlb specifics overlaps ->mappings */
c599962b8dd508 David Hildenbrand       2024-12-16  976  		if (IS_ENABLED(CONFIG_HUGETLB_PAGE))
c599962b8dd508 David Hildenbrand       2024-12-16  977  			break;
4db7548ccbd9ec Mel Gorman              2016-05-19 @978  	default:
4db7548ccbd9ec Mel Gorman              2016-05-19  979  		if (page->mapping != TAIL_MAPPING) {
82a3241a8f76cc Wei Yang                2020-06-03  980  			bad_page(page, "corrupted mapping in tail page");
4db7548ccbd9ec Mel Gorman              2016-05-19  981  			goto out;
4db7548ccbd9ec Mel Gorman              2016-05-19  982  		}
4db7548ccbd9ec Mel Gorman              2016-05-19  983  		break;
4db7548ccbd9ec Mel Gorman              2016-05-19  984  	}
4db7548ccbd9ec Mel Gorman              2016-05-19  985  	if (unlikely(!PageTail(page))) {
82a3241a8f76cc Wei Yang                2020-06-03  986  		bad_page(page, "PageTail not set");
4db7548ccbd9ec Mel Gorman              2016-05-19  987  		goto out;
4db7548ccbd9ec Mel Gorman              2016-05-19  988  	}
4db7548ccbd9ec Mel Gorman              2016-05-19  989  	if (unlikely(compound_head(page) != head_page)) {
82a3241a8f76cc Wei Yang                2020-06-03  990  		bad_page(page, "compound_head not consistent");
4db7548ccbd9ec Mel Gorman              2016-05-19  991  		goto out;
4db7548ccbd9ec Mel Gorman              2016-05-19  992  	}
4db7548ccbd9ec Mel Gorman              2016-05-19  993  	ret = 0;
4db7548ccbd9ec Mel Gorman              2016-05-19  994  out:
4db7548ccbd9ec Mel Gorman              2016-05-19  995  	page->mapping = NULL;
4db7548ccbd9ec Mel Gorman              2016-05-19  996  	clear_compound_head(page);
4db7548ccbd9ec Mel Gorman              2016-05-19  997  	return ret;
4db7548ccbd9ec Mel Gorman              2016-05-19  998  }
4db7548ccbd9ec Mel Gorman              2016-05-19  999  

:::::: The code at line 978 was first introduced by commit
:::::: 4db7548ccbd9ec8e666f35df4a530f55904dec39 mm, page_alloc: defer debugging checks of freed pages until a PCP drain

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
