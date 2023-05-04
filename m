Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAFFBE65;
	Thu,  4 May 2023 18:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683225775; x=1714761775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2p3e87x8nv/DUUeDZaEzlQda3leMkd5uPcu/pSSmvA=;
  b=iRzjLTZObeJ0HnVX09MV1uSRji6a4jAaGvUb9XIpOPEgLWrrpIY5sTQJ
   owpJvSSPIM3bEi9u9jehDFSjugUvCqF+F3Uk78Uq0RNp73mSwKnjG5+cq
   elhy7O0PgGIvFhSyldvkXySn4BlHwEYL5QolMQfFvZjfp2N4nKoKNB4Qh
   me3rqNiMTX0de8FRMyI+Vmx2kpYKeH5SbXHWgibn6x30IgwIrr+uKRJuE
   SX3R43kgbWYeCo/ZkK1DFJ6Ja2aaR7cwXBWDESJXJcXhSedtmb7d4sIwc
   q0fJqWfOjEOjNUGXwXsDXJkCDY8mSokdhcf1W8VVvqs/Okl8SdIJVP6L9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="338201281"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="338201281"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 11:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647454770"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="647454770"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 May 2023 11:42:50 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puduj-00005g-22;
	Thu, 04 May 2023 18:42:49 +0000
Date: Fri, 5 May 2023 02:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>
Subject: [linux-next:master 14552/14714] mm/gup.c:2813:7: error: call to
 undeclared function 'folio_fast_pin_allowed'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202305050237.1cQ4fBKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
commit: 848839c209785a44524fdafa04b0464cd453da1f [14552/14714] mm-gup-disallow-foll_longterm-gup-fast-writing-to-file-backed-mappings-fix
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20230505/202305050237.1cQ4fBKs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=848839c209785a44524fdafa04b0464cd453da1f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 848839c209785a44524fdafa04b0464cd453da1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050237.1cQ4fBKs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/gup.c:2813:7: error: call to undeclared function 'folio_fast_pin_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!folio_fast_pin_allowed(folio, flags)) {
                ^
   mm/gup.c:2857:7: error: call to undeclared function 'folio_fast_pin_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!folio_fast_pin_allowed(folio, flags)) {
                ^
   mm/gup.c:2897:7: error: call to undeclared function 'folio_fast_pin_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!folio_fast_pin_allowed(folio, flags)) {
                ^
   3 errors generated.


vim +/folio_fast_pin_allowed +2813 mm/gup.c

cbd34da7dc9afd Christoph Hellwig       2019-07-11  2782  
2667f50e8b8145 Steve Capper            2014-10-09  2783  static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
0cd22afdcea21f John Hubbard            2019-10-18  2784  			unsigned long end, unsigned int flags,
0cd22afdcea21f John Hubbard            2019-10-18  2785  			struct page **pages, int *nr)
2667f50e8b8145 Steve Capper            2014-10-09  2786  {
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2787) 	struct page *page;
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2788) 	struct folio *folio;
2667f50e8b8145 Steve Capper            2014-10-09  2789  	int refs;
2667f50e8b8145 Steve Capper            2014-10-09  2790  
b798bec4741bdd Ira Weiny               2019-05-13  2791  	if (!pmd_access_permitted(orig, flags & FOLL_WRITE))
2667f50e8b8145 Steve Capper            2014-10-09  2792  		return 0;
2667f50e8b8145 Steve Capper            2014-10-09  2793  
7af75561e17132 Ira Weiny               2019-05-13  2794  	if (pmd_devmap(orig)) {
7af75561e17132 Ira Weiny               2019-05-13  2795  		if (unlikely(flags & FOLL_LONGTERM))
7af75561e17132 Ira Weiny               2019-05-13  2796  			return 0;
86dfbed49f88fd John Hubbard            2020-04-01  2797  		return __gup_device_huge_pmd(orig, pmdp, addr, end, flags,
86dfbed49f88fd John Hubbard            2020-04-01  2798  					     pages, nr);
7af75561e17132 Ira Weiny               2019-05-13  2799  	}
b59f65fa076a8e Kirill A. Shutemov      2017-03-16  2800  
c228afb11ac693 Matthew Wilcox (Oracle  2022-01-07  2801) 	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
a43e982082c24c John Hubbard            2020-01-30  2802  	refs = record_subpages(page, addr, end, pages + *nr);
2667f50e8b8145 Steve Capper            2014-10-09  2803  
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2804) 	folio = try_grab_folio(page, refs, flags);
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2805) 	if (!folio)
2667f50e8b8145 Steve Capper            2014-10-09  2806  		return 0;
2667f50e8b8145 Steve Capper            2014-10-09  2807  
2667f50e8b8145 Steve Capper            2014-10-09  2808  	if (unlikely(pmd_val(orig) != pmd_val(*pmdp))) {
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2809) 		gup_put_folio(folio, refs, flags);
2667f50e8b8145 Steve Capper            2014-10-09  2810  		return 0;
2667f50e8b8145 Steve Capper            2014-10-09  2811  	}
2667f50e8b8145 Steve Capper            2014-10-09  2812  
369dd755eb2530 Lorenzo Stoakes         2023-05-02 @2813  	if (!folio_fast_pin_allowed(folio, flags)) {
369dd755eb2530 Lorenzo Stoakes         2023-05-02  2814  		gup_put_folio(folio, refs, flags);
369dd755eb2530 Lorenzo Stoakes         2023-05-02  2815  		return 0;
369dd755eb2530 Lorenzo Stoakes         2023-05-02  2816  	}
84209e87c6963f David Hildenbrand       2022-11-16  2817  	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
a7f226604170ac David Hildenbrand       2022-05-09  2818  		gup_put_folio(folio, refs, flags);
a7f226604170ac David Hildenbrand       2022-05-09  2819  		return 0;
a7f226604170ac David Hildenbrand       2022-05-09  2820  	}
a7f226604170ac David Hildenbrand       2022-05-09  2821  
a43e982082c24c John Hubbard            2020-01-30  2822  	*nr += refs;
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2823) 	folio_set_referenced(folio);
2667f50e8b8145 Steve Capper            2014-10-09  2824  	return 1;
2667f50e8b8145 Steve Capper            2014-10-09  2825  }
2667f50e8b8145 Steve Capper            2014-10-09  2826  

:::::: The code at line 2813 was first introduced by commit
:::::: 369dd755eb25309495d67de7cd85b77e0bc0f948 mm/gup: disallow FOLL_LONGTERM GUP-fast writing to file-backed mappings

:::::: TO: Lorenzo Stoakes <lstoakes@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
