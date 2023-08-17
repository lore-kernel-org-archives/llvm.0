Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D9914F63;
	Thu, 17 Aug 2023 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692282512; x=1723818512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=shtgubeRaYz/8Z3GgRsZHF2adOX3LC1KsHfRH0b29oI=;
  b=EM+bwa1I2blHvwApJgEbZofAQ8kG+mxsEmJBo/iap/g5zjPXmpR5V6aG
   wk49mSy9xckn2eu0frG8RAPSNgzIYQHWT4EoFCWspfbBP8bCutaeF/E9f
   JYn1k/aWqAZxWJCCGdZRnreLS9nviov/bKDWVOmnD3n2hiL+yNmjBPoHg
   F5Htt5YJ/Vk9vi4u0cCti/if7A0xy3W32RKW9JtpgbEtDhBSyO2g96XsU
   D9v1MLQazh9Ij+di34AjkuuxBhqA+BQT/xHFP6yztknlkfKqqkiu5kaB7
   0VOIMrWxhKgO6n24nirjR2kNoKP5MYrMgn4E8vAHSr8WUO3tPKevMPbV4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376580423"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="376580423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824651183"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="824651183"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 07:24:14 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdv3-0001DR-18;
	Thu, 17 Aug 2023 14:24:13 +0000
Date: Thu, 17 Aug 2023 22:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc/512x: Make mpc512x_select_reset_compat() static
Message-ID: <202308172213.QlwBXfiU-lkp@intel.com>
References: <69739e99329507b93c11908dff744ddd9d0d0564.1692198388.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69739e99329507b93c11908dff744ddd9d0d0564.1692198388.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-512x-Make-mpc512x_select_reset_compat-static/20230816-232327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/69739e99329507b93c11908dff744ddd9d0d0564.1692198388.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] powerpc/512x: Make mpc512x_select_reset_compat() static
config: powerpc-mpc512x_defconfig (https://download.01.org/0day-ci/archive/20230817/202308172213.QlwBXfiU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172213.QlwBXfiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172213.QlwBXfiU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:43:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      43 | DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:83:1: note: expanded from here
      83 | __do_insb
         | ^
   arch/powerpc/include/asm/io.h:614:56: note: expanded from macro '__do_insb'
     614 | #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/platforms/512x/mpc512x_shared.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:85:1: note: expanded from here
      85 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/platforms/512x/mpc512x_shared.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:87:1: note: expanded from here
      87 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/platforms/512x/mpc512x_shared.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:89:1: note: expanded from here
      89 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/platforms/512x/mpc512x_shared.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:91:1: note: expanded from here
      91 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/platforms/512x/mpc512x_shared.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:93:1: note: expanded from here
      93 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/platforms/512x/mpc512x_shared.c:37:17: error: call to undeclared function 'mpc512x_select_reset_compat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      37 |         reset_compat = mpc512x_select_reset_compat();
         |                        ^
   arch/powerpc/platforms/512x/mpc512x_shared.c:37:17: note: did you mean 'mpc512x_select_psc_compat'?
   arch/powerpc/platforms/512x/mpc512x.h:15:20: note: 'mpc512x_select_psc_compat' declared here
      15 | const char *__init mpc512x_select_psc_compat(void);
         |                    ^
>> arch/powerpc/platforms/512x/mpc512x_shared.c:37:15: error: incompatible integer to pointer conversion assigning to 'const char *' from 'int' [-Wint-conversion]
      37 |         reset_compat = mpc512x_select_reset_compat();
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/512x/mpc512x_shared.c:366:27: error: static declaration of 'mpc512x_select_reset_compat' follows non-static declaration
     366 | static const char *__init mpc512x_select_reset_compat(void)
         |                           ^
   arch/powerpc/platforms/512x/mpc512x_shared.c:37:17: note: previous implicit declaration is here
      37 |         reset_compat = mpc512x_select_reset_compat();
         |                        ^
   9 errors generated.


vim +/mpc512x_select_reset_compat +37 arch/powerpc/platforms/512x/mpc512x_shared.c

a8dbceb755f82f Anatolij Gustschin 2010-02-16  31  
a8dbceb755f82f Anatolij Gustschin 2010-02-16  32  static void __init mpc512x_restart_init(void)
a8dbceb755f82f Anatolij Gustschin 2010-02-16  33  {
a8dbceb755f82f Anatolij Gustschin 2010-02-16  34  	struct device_node *np;
0875a88e8569c2 Matteo Facchinetti 2013-06-10  35  	const char *reset_compat;
a8dbceb755f82f Anatolij Gustschin 2010-02-16  36  
0875a88e8569c2 Matteo Facchinetti 2013-06-10 @37  	reset_compat = mpc512x_select_reset_compat();
0875a88e8569c2 Matteo Facchinetti 2013-06-10  38  	np = of_find_compatible_node(NULL, NULL, reset_compat);
a8dbceb755f82f Anatolij Gustschin 2010-02-16  39  	if (!np)
a8dbceb755f82f Anatolij Gustschin 2010-02-16  40  		return;
a8dbceb755f82f Anatolij Gustschin 2010-02-16  41  
a8dbceb755f82f Anatolij Gustschin 2010-02-16  42  	reset_module_base = of_iomap(np, 0);
a8dbceb755f82f Anatolij Gustschin 2010-02-16  43  	of_node_put(np);
a8dbceb755f82f Anatolij Gustschin 2010-02-16  44  }
a8dbceb755f82f Anatolij Gustschin 2010-02-16  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
