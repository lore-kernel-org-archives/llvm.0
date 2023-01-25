Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B272823C4;
	Wed, 25 Jan 2023 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674652595; x=1706188595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7UnPFfUeO/rkvQBxL2H5hpkkooZPIL4FitjEHS7Iop4=;
  b=WBYbjhsEFF6n2ODlVMWB3UOgreU50doTpen1Jp6BRB8InipOMeDjB6yV
   99X14A0g4TNfToJX8yz/JhiLCOv+QkVfAlp4tnNkbtVb6pbMeQ3552n+Z
   SzMutaEpUwBRUhR3iR+DmXsAfcueiuiETtv+/svUQ6PmxZMl34s0DVuPd
   5WOSyxf2VXsFTqn1G/YW1BzxLucLmQtUCM3HUkTeOSXmRf4iQorHqSLpz
   P3LQ5Zzosu6iDlOXJdpVWmPDRXgBc00SlQSssocJkyBIQ29iX2yX4EkB+
   2VLDaboBOBBeYzalCNHZI1BvMrT4aIwJhzLFIIaLi/EhSgYQ/cJGYJNya
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="391055885"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="391055885"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 05:16:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="751187548"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="751187548"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 05:16:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKfdg-0007K0-0y;
	Wed, 25 Jan 2023 13:16:32 +0000
Date: Wed, 25 Jan 2023 21:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7775/7923] include/linux/mm.h:918:23: error: call
 to undeclared function 'page_to_section'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202301252152.QmVnQfjf-lkp@intel.com>
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
config: arm-randconfig-r005-20230123 (https://download.01.org/0day-ci/archive/20230125/202301252152.QmVnQfjf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=59c975083d3705f1df1355f90150df6c40360a16
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 59c975083d3705f1df1355f90150df6c40360a16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 9fbee811e479aca2f3523787cae1f46553141b40 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/mm.h:918:23: error: call to undeclared function 'page_to_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   In file included from arch/arm/kernel/asm-offsets.c:12:
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
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
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
