Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC16AB3
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647287245; x=1678823245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vG0ZnQm8WqAbGyI1oi/VQVRZwf4Iq5fBWzYubpAespA=;
  b=BCk21/zURVqidz8b3fCIJK0o2Isk/OmyYInUg6Mnv1+Vkvh6TTXWNXHa
   5RlNaMI6pNBL2zh9ma0u84GGVwAOmMYj2FUPAC4X1j7CDL7W1mY8+Dq04
   pvhNFQRmvqPXDsMp1dDn+fU7F7diGmtkgEmSOO+z8LX3YOfSwcph7boQU
   IyZAOxd/f5wr5fJQjfUW2gixEIshFwxHX65zjI3UgGmXCzCsgTJ46N/Bn
   ZhQEhfwAb6pxkAdRk0tqoMPiE3UA5Nz6qCUhQuxvp+g5HXuFirP2Q/7zS
   F3LGIKjpoI/66HxTFeuS9i28ENly7eh5xj12R/msLecqBReODyL4s/9q1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="255862401"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="255862401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="512345764"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Mar 2022 12:47:22 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTqf3-000AAa-Sb; Mon, 14 Mar 2022 19:47:21 +0000
Date: Tue, 15 Mar 2022 03:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Alex Shi <alexs@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 11110/11953]
 arch/arm/mach-sa1100/assabet.c:641:8: error: implicit declaration of
 function 'pmd_off_k' is invalid in C99
Message-ID: <202203150342.gwb1U9CV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 6992f0b3f0fd879b31095263986ba1aedb27c83b [11110/11953] Kbuild: move to -std=gnu11
config: arm-randconfig-r015-20220313 (https://download.01.org/0day-ci/archive/20220315/202203150342.gwb1U9CV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6992f0b3f0fd879b31095263986ba1aedb27c83b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6992f0b3f0fd879b31095263986ba1aedb27c83b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arm/mach-sa1100/assabet.c:636:38: error: use of undeclared identifier 'PMD_MASK'
           unsigned long phys = __PREG(GPLR) & PMD_MASK;
                                               ^
   arch/arm/mach-sa1100/assabet.c:638:13: error: use of undeclared identifier 'pmdval_t'
           int prot = PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_DOMAIN(DOMAIN_IO);
                      ^
   arch/arm/include/asm/pgtable-2level-hwdef.h:19:29: note: expanded from macro 'PMD_TYPE_SECT'
   #define PMD_TYPE_SECT           (_AT(pmdval_t, 2) << 0)
                                        ^
   arch/arm/mach-sa1100/assabet.c:638:29: error: use of undeclared identifier 'pmdval_t'
           int prot = PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_DOMAIN(DOMAIN_IO);
                                      ^
   arch/arm/include/asm/pgtable-2level-hwdef.h:32:32: note: expanded from macro 'PMD_SECT_AP_WRITE'
   #define PMD_SECT_AP_WRITE       (_AT(pmdval_t, 1) << 10)
                                        ^
   arch/arm/mach-sa1100/assabet.c:638:49: error: use of undeclared identifier 'pmdval_t'
           int prot = PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_DOMAIN(DOMAIN_IO);
                                                          ^
   arch/arm/include/asm/pgtable-2level-hwdef.h:22:29: note: expanded from macro 'PMD_DOMAIN'
   #define PMD_DOMAIN(x)           (_AT(pmdval_t, (x)) << 5)
                                        ^
>> arch/arm/mach-sa1100/assabet.c:641:8: error: implicit declaration of function 'pmd_off_k' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           pmd = pmd_off_k(virt);
                 ^
   arch/arm/mach-sa1100/assabet.c:641:6: warning: incompatible integer to pointer conversion assigning to 'pmd_t *' (aka 'unsigned long *') from 'int' [-Wint-conversion]
           pmd = pmd_off_k(virt);
               ^ ~~~~~~~~~~~~~~~
>> arch/arm/mach-sa1100/assabet.c:643:2: error: implicit declaration of function 'flush_pmd_entry' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           flush_pmd_entry(pmd);
           ^
   arch/arm/mach-sa1100/assabet.c:746:13: warning: no previous prototype for function 'assabet_init_irq' [-Wmissing-prototypes]
   void __init assabet_init_irq(void)
               ^
   arch/arm/mach-sa1100/assabet.c:746:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init assabet_init_irq(void)
   ^
   static 
   2 warnings and 6 errors generated.


vim +/pmd_off_k +641 arch/arm/mach-sa1100/assabet.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  627  
^1da177e4c3f41 Linus Torvalds 2005-04-16  628  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  629   * On Assabet, we must probe for the Neponset board _before_
^1da177e4c3f41 Linus Torvalds 2005-04-16  630   * paging_init() has occurred to actually determine the amount
^1da177e4c3f41 Linus Torvalds 2005-04-16  631   * of RAM available.  To do so, we map the appropriate IO section
^1da177e4c3f41 Linus Torvalds 2005-04-16  632   * in the page table here in order to access GPIO registers.
^1da177e4c3f41 Linus Torvalds 2005-04-16  633   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  634  static void __init map_sa1100_gpio_regs( void )
^1da177e4c3f41 Linus Torvalds 2005-04-16  635  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  636  	unsigned long phys = __PREG(GPLR) & PMD_MASK;
3169663ac5902f Russell King   2012-06-06  637  	unsigned long virt = (unsigned long)io_p2v(phys);
^1da177e4c3f41 Linus Torvalds 2005-04-16  638  	int prot = PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_DOMAIN(DOMAIN_IO);
^1da177e4c3f41 Linus Torvalds 2005-04-16  639  	pmd_t *pmd;
^1da177e4c3f41 Linus Torvalds 2005-04-16  640  
e05c7b1f2bc4b7 Mike Rapoport  2020-06-08 @641  	pmd = pmd_off_k(virt);
^1da177e4c3f41 Linus Torvalds 2005-04-16  642  	*pmd = __pmd(phys | prot);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @643  	flush_pmd_entry(pmd);
^1da177e4c3f41 Linus Torvalds 2005-04-16  644  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  645  

:::::: The code at line 641 was first introduced by commit
:::::: e05c7b1f2bc4b7b28199b9a7572f73436d97317e mm: pgtable: add shortcuts for accessing kernel PMD and PTE

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
