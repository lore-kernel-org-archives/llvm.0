Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE41864;
	Tue, 15 Aug 2023 05:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692076353; x=1723612353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6+ZcU/Vpexrp5FQDgNFOsYEPzqofwDIztSFtE78sl+E=;
  b=T4S8M1yUfBuRrgzNnnA9zkBRp5WRUNof07hgM6FZXJQHb29tuLZyVx4G
   lN7MddDXxfCmUHhSWleXFTYJvzLbmn8llvKOPLOBaGqOFQjMF/zEQK/vy
   lLrU/CIUs8AKqV9TY24axBgw3L8K3be81+eKWroCr9JypoJgn3z8dqLw/
   8Gspx+zBcfO+la0pN2aLYWHip1nqZc2eg9zjKoA0SZixxgTUcqj44mint
   XS7KcqCRB+JxrY3Af6z9u9eGnhFZSbXUbCeZyH6rBN/dh++9heYkn/BEl
   4LAzmylrPcQgOtea8aBrbTwxRJonybb5V5L0XP+f3UgvptqaGmkFjiZkX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="371109081"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="371109081"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 22:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064328497"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="1064328497"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2023 22:12:17 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVmLo-0000g9-1H;
	Tue, 15 Aug 2023 05:12:16 +0000
Date: Tue, 15 Aug 2023 13:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, songmuchun@bytedance.com,
	mike.kravetz@oracle.com, willy@infradead.org,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v4] mm/filemap: change ->index to PAGE_SIZE for hugetlb
 pages
Message-ID: <202308151231.L2pfzOmu-lkp@intel.com>
References: <20230814215035.222688-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814215035.222688-1-sidhartha.kumar@oracle.com>

Hi Sidhartha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidhartha-Kumar/mm-filemap-change-index-to-PAGE_SIZE-for-hugetlb-pages/20230815-055236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230814215035.222688-1-sidhartha.kumar%40oracle.com
patch subject: [PATCH v4] mm/filemap: change ->index to PAGE_SIZE for hugetlb pages
config: i386-randconfig-i005-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151231.L2pfzOmu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151231.L2pfzOmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151231.L2pfzOmu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:2116:9: warning: no previous prototype for function 'hugetlb_basepage_index' [-Wmissing-prototypes]
   pgoff_t hugetlb_basepage_index(struct page *page)
           ^
   mm/hugetlb.c:2116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   pgoff_t hugetlb_basepage_index(struct page *page)
   ^
   static 
   include/linux/types.h:137:17: note: expanded from macro 'pgoff_t'
   #define pgoff_t unsigned long
                   ^
   1 warning generated.


vim +/hugetlb_basepage_index +2116 mm/hugetlb.c

c0d0381ade7988 Mike Kravetz       2020-04-01  2115  
fe19bd3dae3d15 Hugh Dickins       2021-06-24 @2116  pgoff_t hugetlb_basepage_index(struct page *page)
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2117  {
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2118  	struct page *page_head = compound_head(page);
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2119  	pgoff_t index = page_index(page_head);
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2120  	unsigned long compound_idx;
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2121  
23baf831a32c04 Kirill A. Shutemov 2023-03-15  2122  	if (compound_order(page_head) > MAX_ORDER)
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2123  		compound_idx = page_to_pfn(page) - page_to_pfn(page_head);
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2124  	else
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2125  		compound_idx = page - page_head;
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2126  
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2127  	return (index << compound_order(page_head)) + compound_idx;
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2128  }
13d60f4b6ab5b7 Zhang Yi           2013-06-25  2129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
