Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842CA1C29;
	Wed, 25 Jan 2023 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674641576; x=1706177576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQIhNxE82VU5Lyu5wl8oFel19JOppuKHakG5QvoSIkY=;
  b=RMj1XlqajnCJETWj29qg26wDzeV5wesqoVLqn7QY8/7m14vH2eqRe5HS
   K2lw5Y9s8xTisyTkZ9LKmnLBJXRqyRhdyTk96f5J9uzaoXNVuah7/YLmv
   Kl2U5wT+8fqY2MxjQ9n3SUMpepa1keWpKuN0hZLAToY56jvgVeJ9ACYaE
   lRIMRprXLyxKUwwhjRF42961TAUlt8dQ8Ut0YmctiA8SuAe9zoK/T0qIn
   s2Wr4EK0SGdRfwu+ZZHvB0a5yVqZ7ghES1S1UvUWiz3s9NGs0B4AneQ+w
   5N/FUyED9Taj7HztDb5p63Y7bk5IF+WPFWy3+tTzvK20mxfd28VVGYsxw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412754564"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="412754564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 02:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="751138913"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="751138913"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 02:10:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKcj3-0007Ea-1n;
	Wed, 25 Jan 2023 10:09:53 +0000
Date: Wed, 25 Jan 2023 18:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7775/7923] include/linux/mm.h:918:23: error:
 implicit declaration of function 'page_to_section' is invalid in C99
Message-ID: <202301251732.JQM5ZRvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9fbee811e479aca2f3523787cae1f46553141b40
commit: 59c975083d3705f1df1355f90150df6c40360a16 [7775/7923] mm: add folio_estimated_mapcount()
config: i386-randconfig-r025-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251732.JQM5ZRvn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=59c975083d3705f1df1355f90150df6c40360a16
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 59c975083d3705f1df1355f90150df6c40360a16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 9fbee811e479aca2f3523787cae1f46553141b40 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
>> include/linux/mm.h:918:23: error: implicit declaration of function 'page_to_section' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return page_mapcount(folio_page(folio, 0));
                                ^
   include/linux/page-flags.h:286:30: note: expanded from macro 'folio_page'
   #define folio_page(folio, n)    nth_page(&(folio)->page, n)
                                   ^
   include/linux/mm.h:216:38: note: expanded from macro 'nth_page'
   #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                                        ^
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:35:14: note: expanded from macro '__page_to_pfn'
           int __sec = page_to_section(__pg);                      \
                       ^
   include/linux/mm.h:918:23: note: did you mean '__nr_to_section'?
   include/linux/page-flags.h:286:30: note: expanded from macro 'folio_page'
   #define folio_page(folio, n)    nth_page(&(folio)->page, n)
                                   ^
   include/linux/mm.h:216:38: note: expanded from macro 'nth_page'
   #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                                        ^
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:35:14: note: expanded from macro '__page_to_pfn'
           int __sec = page_to_section(__pg);                      \
                       ^
   include/linux/mmzone.h:1843:35: note: '__nr_to_section' declared here
   static inline struct mem_section *__nr_to_section(unsigned long nr)
                                     ^
   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
>> include/linux/mm.h:1626:29: error: static declaration of 'page_to_section' follows non-static declaration
   static inline unsigned long page_to_section(const struct page *page)
                               ^
   include/linux/mm.h:918:23: note: previous implicit declaration is here
           return page_mapcount(folio_page(folio, 0));
                                ^
   include/linux/page-flags.h:286:30: note: expanded from macro 'folio_page'
   #define folio_page(folio, n)    nth_page(&(folio)->page, n)
                                   ^
   include/linux/mm.h:216:38: note: expanded from macro 'nth_page'
   #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                                        ^
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:35:14: note: expanded from macro '__page_to_pfn'
           int __sec = page_to_section(__pg);                      \
                       ^
   2 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_to_section +918 include/linux/mm.h

   915	
   916	static inline int folio_estimated_mapcount(struct folio *folio)
   917	{
 > 918		return page_mapcount(folio_page(folio, 0));
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
