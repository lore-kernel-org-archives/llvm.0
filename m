Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100244C60;
	Sun, 16 Apr 2023 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681674017; x=1713210017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkUUUgay4Yb7asHb7gkLwqQttFebPKKAgMuZdHdb/EM=;
  b=WWmHoT2M2v5X9lenJCFbT45PPF6uyJa7/TZ30UMmLrwGgNtNfsdgoA0J
   Nc1hui1ytSarz6+bxFAOa5bxAKHoH27Wd8EmHfSYwlEOJhYGdKiN0yvhg
   UFcpsxRCNCjgZgnlGqIXiRVLx1zHmp2AAnM5KCFQKMCwVjlF8Z9gHo1X9
   HFr5bHUgt0UikUx1621LrMyFYzAeV4UCOUGFzKtkqtefHggjz/4wFcwT7
   Ot29XgW3ZzbgvYFAW7BDQtswx1HuogD7BsZyheCYxQasCxaiIONM/x860
   4GqfHIHl+8/QGZGYvv0jtMYxYUEDixtGdIL/7CJZTJwovVsqusbeZHVGH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342250582"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="342250582"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 12:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="936610441"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="936610441"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2023 12:40:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po8EP-000bot-38;
	Sun, 16 Apr 2023 19:40:13 +0000
Date: Mon, 17 Apr 2023 03:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mm/copypage-v4wb.c:47:6: warning: no previous prototype for
 function 'v4wb_copy_user_highpage'
Message-ID: <202304170326.6P0CVjp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e7bb4f2461710b70887704af7f175383251088e
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   11 months ago
config: arm-randconfig-r025-20230416 (https://download.01.org/0day-ci/archive/20230417/202304170326.6P0CVjp4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=250c1a694ff304e5d69e74ab32755eddcc2b8f65
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 250c1a694ff304e5d69e74ab32755eddcc2b8f65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-versatile/ arch/arm/mm/ drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170326.6P0CVjp4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mm/copypage-v4wb.c:47:6: warning: no previous prototype for function 'v4wb_copy_user_highpage' [-Wmissing-prototypes]
   void v4wb_copy_user_highpage(struct page *to, struct page *from,
        ^
   arch/arm/mm/copypage-v4wb.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void v4wb_copy_user_highpage(struct page *to, struct page *from,
   ^
   static 
>> arch/arm/mm/copypage-v4wb.c:65:6: warning: no previous prototype for function 'v4wb_clear_user_highpage' [-Wmissing-prototypes]
   void v4wb_clear_user_highpage(struct page *page, unsigned long vaddr)
        ^
   arch/arm/mm/copypage-v4wb.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void v4wb_clear_user_highpage(struct page *page, unsigned long vaddr)
   ^
   static 
   2 warnings generated.
--
>> arch/arm/mm/copypage-feroceon.c:65:6: warning: no previous prototype for function 'feroceon_copy_user_highpage' [-Wmissing-prototypes]
   void feroceon_copy_user_highpage(struct page *to, struct page *from,
        ^
   arch/arm/mm/copypage-feroceon.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void feroceon_copy_user_highpage(struct page *to, struct page *from,
   ^
   static 
>> arch/arm/mm/copypage-feroceon.c:78:6: warning: no previous prototype for function 'feroceon_clear_user_highpage' [-Wmissing-prototypes]
   void feroceon_clear_user_highpage(struct page *page, unsigned long vaddr)
        ^
   arch/arm/mm/copypage-feroceon.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void feroceon_clear_user_highpage(struct page *page, unsigned long vaddr)
   ^
   static 
   2 warnings generated.
--
>> arch/arm/mm/copypage-xscale.c:84:6: warning: no previous prototype for function 'xscale_mc_copy_user_highpage' [-Wmissing-prototypes]
   void xscale_mc_copy_user_highpage(struct page *to, struct page *from,
        ^
   arch/arm/mm/copypage-xscale.c:84:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xscale_mc_copy_user_highpage(struct page *to, struct page *from,
   ^
   static 
>> arch/arm/mm/copypage-xscale.c:107:1: warning: no previous prototype for function 'xscale_mc_clear_user_highpage' [-Wmissing-prototypes]
   xscale_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
   ^
   arch/arm/mm/copypage-xscale.c:106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   2 warnings generated.


vim +/v4wb_copy_user_highpage +47 arch/arm/mm/copypage-v4wb.c

d73e60b7144a86b Russell King  2008-10-31  46  
063b0a4207e43ac Russell King  2008-10-31 @47  void v4wb_copy_user_highpage(struct page *to, struct page *from,
f00a75c094c340c Russell King  2009-10-05  48  	unsigned long vaddr, struct vm_area_struct *vma)
063b0a4207e43ac Russell King  2008-10-31  49  {
063b0a4207e43ac Russell King  2008-10-31  50  	void *kto, *kfrom;
063b0a4207e43ac Russell King  2008-10-31  51  
5472e862de2bc4a Cong Wang     2011-11-25  52  	kto = kmap_atomic(to);
5472e862de2bc4a Cong Wang     2011-11-25  53  	kfrom = kmap_atomic(from);
2725898fc9bb212 Russell King  2009-10-05  54  	flush_cache_page(vma, vaddr, page_to_pfn(from));
063b0a4207e43ac Russell King  2008-10-31  55  	v4wb_copy_user_page(kto, kfrom);
5472e862de2bc4a Cong Wang     2011-11-25  56  	kunmap_atomic(kfrom);
5472e862de2bc4a Cong Wang     2011-11-25  57  	kunmap_atomic(kto);
063b0a4207e43ac Russell King  2008-10-31  58  }
063b0a4207e43ac Russell King  2008-10-31  59  
d73e60b7144a86b Russell King  2008-10-31  60  /*
d73e60b7144a86b Russell King  2008-10-31  61   * ARMv4 optimised clear_user_page
d73e60b7144a86b Russell King  2008-10-31  62   *
d73e60b7144a86b Russell King  2008-10-31  63   * Same story as above.
d73e60b7144a86b Russell King  2008-10-31  64   */
303c6443659bc1d Russell King  2008-10-31 @65  void v4wb_clear_user_highpage(struct page *page, unsigned long vaddr)
d73e60b7144a86b Russell King  2008-10-31  66  {
5472e862de2bc4a Cong Wang     2011-11-25  67  	void *ptr, *kaddr = kmap_atomic(page);
43ae286b7d4d8c4 Nicolas Pitre 2008-11-04  68  	asm volatile("\
43ae286b7d4d8c4 Nicolas Pitre 2008-11-04  69  	mov	r1, %2				@ 1\n\
d73e60b7144a86b Russell King  2008-10-31  70  	mov	r2, #0				@ 1\n\
d73e60b7144a86b Russell King  2008-10-31  71  	mov	r3, #0				@ 1\n\
d73e60b7144a86b Russell King  2008-10-31  72  	mov	ip, #0				@ 1\n\
d73e60b7144a86b Russell King  2008-10-31  73  	mov	lr, #0				@ 1\n\
303c6443659bc1d Russell King  2008-10-31  74  1:	mcr	p15, 0, %0, c7, c6, 1		@ 1   invalidate D line\n\
303c6443659bc1d Russell King  2008-10-31  75  	stmia	%0!, {r2, r3, ip, lr}		@ 4\n\
303c6443659bc1d Russell King  2008-10-31  76  	stmia	%0!, {r2, r3, ip, lr}		@ 4\n\
303c6443659bc1d Russell King  2008-10-31  77  	mcr	p15, 0, %0, c7, c6, 1		@ 1   invalidate D line\n\
303c6443659bc1d Russell King  2008-10-31  78  	stmia	%0!, {r2, r3, ip, lr}		@ 4\n\
303c6443659bc1d Russell King  2008-10-31  79  	stmia	%0!, {r2, r3, ip, lr}		@ 4\n\
d73e60b7144a86b Russell King  2008-10-31  80  	subs	r1, r1, #1			@ 1\n\
d73e60b7144a86b Russell King  2008-10-31  81  	bne	1b				@ 1\n\
303c6443659bc1d Russell King  2008-10-31  82  	mcr	p15, 0, r1, c7, c10, 4		@ 1   drain WB"
43ae286b7d4d8c4 Nicolas Pitre 2008-11-04  83  	: "=r" (ptr)
43ae286b7d4d8c4 Nicolas Pitre 2008-11-04  84  	: "0" (kaddr), "I" (PAGE_SIZE / 64)
303c6443659bc1d Russell King  2008-10-31  85  	: "r1", "r2", "r3", "ip", "lr");
5472e862de2bc4a Cong Wang     2011-11-25  86  	kunmap_atomic(kaddr);
d73e60b7144a86b Russell King  2008-10-31  87  }
d73e60b7144a86b Russell King  2008-10-31  88  

:::::: The code at line 47 was first introduced by commit
:::::: 063b0a4207e43acbeff3d4b09f43e750e0212b48 [ARM] copypage: provide our own copy_user_highpage()

:::::: TO: Russell King <rmk@dyn-67.arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
