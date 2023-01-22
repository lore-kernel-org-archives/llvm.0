Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD33C1C;
	Sun, 22 Jan 2023 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674415719; x=1705951719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulwsytVuXIqYkaG7ErwEZYIxX5CJ+kB5FeiME/JeBHo=;
  b=W5YeHAlmTniMAwdBn3NiTlH2tciEbEe2BWDPwLqvscspcLgEfm3/+8ir
   lEO//pkujba0/6K39UB4NpObU4lPlp6kL3aGIp5s88EaTvZIDI7d8cgKb
   yT7uy6QsJk3pqn4f0kuWsmgWCmaXykdvW6Zm8GoAfRLITcvpHfw4x2PMY
   YaPcidmvLDLw2Uq4yG/AaKc45y+Xrx7Xdkxq8WnWVL1pw1kKmS8Uxx2RV
   j40lrIPv5rqv/oZ72A+1lUGLgtF1cn/Cs7Vv2A89Ldl32LYl2HksKoaOC
   WtGtVfKsWOA1ShrKh+N3knEDu8HmzhAqsgNdqQvTm7WIKTeqfkGZJ3jgW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="328021416"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="328021416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 11:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="835251622"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="835251622"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jan 2023 11:28:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJg16-0005Ce-2d;
	Sun, 22 Jan 2023 19:28:36 +0000
Date: Mon, 23 Jan 2023 03:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mm/copypage-xscale.c:84:6: warning: no previous prototype
 for function 'xscale_mc_copy_user_highpage'
Message-ID: <202301230336.JTD7TDdA-lkp@intel.com>
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
head:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
commit: 7036440eab3e2d47a775d4616909f8235488d714 ARM: omap1: enable multiplatform
date:   8 months ago
config: arm-randconfig-r046-20230122 (https://download.01.org/0day-ci/archive/20230123/202301230336.JTD7TDdA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7036440eab3e2d47a775d4616909f8235488d714
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7036440eab3e2d47a775d4616909f8235488d714
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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


vim +/xscale_mc_copy_user_highpage +84 arch/arm/mm/copypage-xscale.c

f8f98a9335db4a Russell King    2005-06-08   83  
063b0a4207e43a Russell King    2008-10-31  @84  void xscale_mc_copy_user_highpage(struct page *to, struct page *from,
f00a75c094c340 Russell King    2009-10-05   85  	unsigned long vaddr, struct vm_area_struct *vma)
f8f98a9335db4a Russell King    2005-06-08   86  {
5472e862de2bc4 Cong Wang       2011-11-25   87  	void *kto = kmap_atomic(to);
1c9d3df5e88ad7 Richard Purdie  2006-12-30   88  
c01778001a4f5a Catalin Marinas 2010-09-13   89  	if (!test_and_set_bit(PG_dcache_clean, &from->flags))
cb9f753a3731f7 Huang Ying      2018-04-05   90  		__flush_dcache_page(page_mapping_file(from), from);
1c9d3df5e88ad7 Richard Purdie  2006-12-30   91  
bd31b85960a7fc Thomas Gleixner 2009-07-03   92  	raw_spin_lock(&minicache_lock);
f8f98a9335db4a Russell King    2005-06-08   93  
67ece1443174d8 Russell King    2011-07-02   94  	set_top_pte(COPYPAGE_MINICACHE, mk_pte(from, minicache_pgprot));
f8f98a9335db4a Russell King    2005-06-08   95  
f8f98a9335db4a Russell King    2005-06-08   96  	mc_copy_user_page((void *)COPYPAGE_MINICACHE, kto);
f8f98a9335db4a Russell King    2005-06-08   97  
bd31b85960a7fc Thomas Gleixner 2009-07-03   98  	raw_spin_unlock(&minicache_lock);
063b0a4207e43a Russell King    2008-10-31   99  
5472e862de2bc4 Cong Wang       2011-11-25  100  	kunmap_atomic(kto);
f8f98a9335db4a Russell King    2005-06-08  101  }
f8f98a9335db4a Russell King    2005-06-08  102  
f8f98a9335db4a Russell King    2005-06-08  103  /*
f8f98a9335db4a Russell King    2005-06-08  104   * XScale optimised clear_user_page
f8f98a9335db4a Russell King    2005-06-08  105   */
303c6443659bc1 Russell King    2008-10-31  106  void
303c6443659bc1 Russell King    2008-10-31 @107  xscale_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
f8f98a9335db4a Russell King    2005-06-08  108  {
5472e862de2bc4 Cong Wang       2011-11-25  109  	void *ptr, *kaddr = kmap_atomic(page);
c7b68049943079 Arnd Bergmann   2019-08-09  110  	asm volatile("\
c7b68049943079 Arnd Bergmann   2019-08-09  111  .arch xscale					\n\
c7b68049943079 Arnd Bergmann   2019-08-09  112  	mov	r1, %2				\n\
f8f98a9335db4a Russell King    2005-06-08  113  	mov	r2, #0				\n\
f8f98a9335db4a Russell King    2005-06-08  114  	mov	r3, #0				\n\
303c6443659bc1 Russell King    2008-10-31  115  1:	mov	ip, %0				\n\
bc2eca9a682881 Nicolas Pitre   2018-11-09  116  	strd	r2, r3, [%0], #8		\n\
bc2eca9a682881 Nicolas Pitre   2018-11-09  117  	strd	r2, r3, [%0], #8		\n\
bc2eca9a682881 Nicolas Pitre   2018-11-09  118  	strd	r2, r3, [%0], #8		\n\
bc2eca9a682881 Nicolas Pitre   2018-11-09  119  	strd	r2, r3, [%0], #8		\n\
f8f98a9335db4a Russell King    2005-06-08  120  	mcr	p15, 0, ip, c7, c10, 1		@ clean D line\n\
f8f98a9335db4a Russell King    2005-06-08  121  	subs	r1, r1, #1			\n\
f8f98a9335db4a Russell King    2005-06-08  122  	mcr	p15, 0, ip, c7, c6, 1		@ invalidate D line\n\
303c6443659bc1 Russell King    2008-10-31  123  	bne	1b"
43ae286b7d4d8c Nicolas Pitre   2008-11-04  124  	: "=r" (ptr)
43ae286b7d4d8c Nicolas Pitre   2008-11-04  125  	: "0" (kaddr), "I" (PAGE_SIZE / 32)
303c6443659bc1 Russell King    2008-10-31  126  	: "r1", "r2", "r3", "ip");
5472e862de2bc4 Cong Wang       2011-11-25  127  	kunmap_atomic(kaddr);
f8f98a9335db4a Russell King    2005-06-08  128  }
f8f98a9335db4a Russell King    2005-06-08  129  

:::::: The code at line 84 was first introduced by commit
:::::: 063b0a4207e43acbeff3d4b09f43e750e0212b48 [ARM] copypage: provide our own copy_user_highpage()

:::::: TO: Russell King <rmk@dyn-67.arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
