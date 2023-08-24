Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B44DF62;
	Thu, 24 Aug 2023 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692885607; x=1724421607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GBSyGk8xGxYynVKmO5H//T8q5CbtNF6TMMZQKQdxkDY=;
  b=f1mAmXSfHRmiw/IdXSzLn8ccr2Muwx03OmanRgUqPmYIRYFIbE6XkEVf
   rIAnc4s+VVl0FNYiHCxf6AUFOSmPNqSwRqhtAMYsrdWrM2IqrXSErGduE
   dJ62c+FR7J8hBw/FiX64uwBNBKKMxbMcPS4MovfUpdi3w7tzbhjqT8EmB
   fAiOcqlG8FmbswG9VuruagO0AVhBEDNPBi1sKptJFaZ6MS2Wga1HHiby8
   JJcQdIwow+D4FUEEUIEsTWF2o7PuuTCZoEbrWH8ZP/y0vzUQ/pahzALSS
   z+ul/y0QO8AbB24g2DqVDv0cAKJY68kpqMXafavw7O6FrDYneUWiezxYj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373323950"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373323950"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 07:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860709978"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="860709978"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 07:00:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZAsU-0002k8-0c;
	Thu, 24 Aug 2023 14:00:02 +0000
Date: Thu, 24 Aug 2023 21:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
Message-ID: <202308242115.E2LcVeIB-lkp@intel.com>
References: <20230822162808.4131399-2-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822162808.4131399-2-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc7 next-20230824]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/hugetlb-Remove-a-few-calls-to-page_folio/20230823-002932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230822162808.4131399-2-willy%40infradead.org
patch subject: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
config: s390-randconfig-001-20230824 (https://download.01.org/0day-ci/archive/20230824/202308242115.E2LcVeIB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242115.E2LcVeIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242115.E2LcVeIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/hugetlb.c:19:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/hugetlb.c:19:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/hugetlb.c:19:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/hugetlb.c:2232:32: warning: variable 'folio' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    2232 |         for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:1469:3: note: expanded from macro 'for_each_node_mask_to_free'
    1469 |                 nr_nodes > 0 &&                                         \
         |                 ^~~~~~~~~~~~
   mm/hugetlb.c:2246:10: note: uninitialized use occurs here
    2246 |         return &folio->page;
         |                 ^~~~~
   mm/hugetlb.c:2232:32: note: remove the '&&' if its condition is always true
    2232 |         for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
         |                                       ^
   mm/hugetlb.c:2229:21: note: initialize the variable 'folio' to silence this warning
    2229 |         struct folio *folio;
         |                            ^
         |                             = NULL
   13 warnings generated.


vim +2232 mm/hugetlb.c

b2261026825ed3 Joonsoo Kim             2013-09-11  2216  
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2217  /*
10c6ec49802b17 Mike Kravetz            2021-05-04  2218   * Remove huge page from pool from next node to free.  Attempt to keep
10c6ec49802b17 Mike Kravetz            2021-05-04  2219   * persistent huge pages more or less balanced over allowed nodes.
10c6ec49802b17 Mike Kravetz            2021-05-04  2220   * This routine only 'removes' the hugetlb page.  The caller must make
10c6ec49802b17 Mike Kravetz            2021-05-04  2221   * an additional call to free the page to low level allocators.
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2222   * Called with hugetlb_lock locked.
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2223   */
10c6ec49802b17 Mike Kravetz            2021-05-04  2224  static struct page *remove_pool_huge_page(struct hstate *h,
10c6ec49802b17 Mike Kravetz            2021-05-04  2225  						nodemask_t *nodes_allowed,
6ae11b278bca1c Lee Schermerhorn        2009-12-14  2226  						 bool acct_surplus)
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2227  {
b2261026825ed3 Joonsoo Kim             2013-09-11  2228  	int nr_nodes, node;
cfd5082b514765 Sidhartha Kumar         2022-11-29  2229  	struct folio *folio;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2230  
9487ca60fd7fa2 Mike Kravetz            2021-05-04  2231  	lockdep_assert_held(&hugetlb_lock);
b2261026825ed3 Joonsoo Kim             2013-09-11 @2232  	for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
685f345708096e Lee Schermerhorn        2009-09-21  2233  		/*
685f345708096e Lee Schermerhorn        2009-09-21  2234  		 * If we're returning unused surplus pages, only examine
685f345708096e Lee Schermerhorn        2009-09-21  2235  		 * nodes with surplus pages.
685f345708096e Lee Schermerhorn        2009-09-21  2236  		 */
b2261026825ed3 Joonsoo Kim             2013-09-11  2237  		if ((!acct_surplus || h->surplus_huge_pages_node[node]) &&
b2261026825ed3 Joonsoo Kim             2013-09-11  2238  		    !list_empty(&h->hugepage_freelists[node])) {
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2239) 			folio = list_entry(h->hugepage_freelists[node].next,
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2240) 					  struct folio, lru);
cfd5082b514765 Sidhartha Kumar         2022-11-29  2241  			remove_hugetlb_folio(h, folio, acct_surplus);
9a76db09970938 Lee Schermerhorn        2009-12-14  2242  			break;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2243  		}
b2261026825ed3 Joonsoo Kim             2013-09-11  2244  	}
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2245  
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2246) 	return &folio->page;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2247  }
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
