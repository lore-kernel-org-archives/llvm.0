Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF933D6
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 22:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656712868; x=1688248868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8YeF7nuLH9Azgk2yxKc5EuGGG/O+/BkpEri8p/Rr4w=;
  b=gNAvIjTamtTt3tLG42NcY8TC73LDDNdYes7Lv3/58fPzAqncBi2MPB7I
   aHT6xLSOKx/uSvP0Cd1MUlhbgIWQ0/DzrItZCrSdRL69UniJQ9In+hdAg
   JBONl38zvQYHfz5hUghNX/Q+gMFFBn0XEHKzdX70s1Z4wICeL4vIH4bjm
   zvVLW9vg/n18Cov+SC3VjaMr8pgPaP07U3ppYQ+B4sv3WYWQSARdoOlPE
   gTNBR0VxCKG+v7c31hpWqg2QXtLkDPfJ/GKBrZXtZCmSIbUQWeBw+PoLa
   Xl5KUsOPkq115B9O7ppZl41x/F7Ol/Vu3HFZOw51aXQis9yOw2JGWCAkF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282782962"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; 
   d="scan'208";a="282782962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 15:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; 
   d="scan'208";a="694663250"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2022 15:01:06 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7OhG-000EP0-6M;
	Fri, 01 Jul 2022 22:01:06 +0000
Date: Sat, 2 Jul 2022 06:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 26/61]
 include/linux/page-flags.h:788:20: error: passing 'const struct page *' to
 parameter of type 'struct page *' discards qualifiers
Message-ID: <202207020540.Dr0tauH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-linked-list
head:   ce4670495468b797b0c5927fcb661bc0da48b9ab
commit: 1b8738547bb820a8d288d69c075558762b1e9cd6 [26/61] mm: Make some folio function arguments const
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220702/202207020540.Dr0tauH4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/1b8738547bb820a8d288d69c075558762b1e9cd6
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linked-list
        git checkout 1b8738547bb820a8d288d69c075558762b1e9cd6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:20:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:22:
>> include/linux/page-flags.h:788:20: error: passing 'const struct page *' to parameter of type 'struct page *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           PF_POISONED_CHECK(page);
                             ^~~~
   include/linux/page-flags.h:370:41: note: expanded from macro 'PF_POISONED_CHECK'
                   VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
                                                         ^~~~
   include/linux/mmdebug.h:94:60: note: expanded from macro 'VM_BUG_ON_PGFLAGS'
   #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, page)
                                                              ^~~~
   include/linux/mmdebug.h:21:14: note: expanded from macro 'VM_BUG_ON_PAGE'
                           dump_page(page, "VM_BUG_ON_PAGE(" __stringify(cond)")");\
                                     ^~~~
   include/linux/mmdebug.h:12:29: note: passing argument to parameter 'page' here
   void dump_page(struct page *page, const char *reason);
                               ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1200: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +788 include/linux/page-flags.h

e7d324850bfcb3 Muchun Song   2022-03-22  785  
1b8738547bb820 David Howells 2022-06-08  786  static __always_inline int PageHead(const struct page *page)
e7d324850bfcb3 Muchun Song   2022-03-22  787  {
e7d324850bfcb3 Muchun Song   2022-03-22 @788  	PF_POISONED_CHECK(page);
e7d324850bfcb3 Muchun Song   2022-03-22  789  	return test_bit(PG_head, &page->flags) && !page_is_fake_head(page);
e7d324850bfcb3 Muchun Song   2022-03-22  790  }
e7d324850bfcb3 Muchun Song   2022-03-22  791  

:::::: The code at line 788 was first introduced by commit
:::::: e7d324850bfcb30df563d144c0363cc44595277d mm: hugetlb: free the 2nd vmemmap page associated with each HugeTLB page

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
