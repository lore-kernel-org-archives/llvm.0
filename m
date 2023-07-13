Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7406116;
	Thu, 13 Jul 2023 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689234345; x=1720770345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cwns1upMuTjcWBu3n61D4itQW+EQ2X5HmXMMmvc8LjI=;
  b=Ww+zkxipI64/bMo8eerHonw3ybqqhsz4j5o2kKUifi4J9EezNN3hOdqx
   QBErzeZxMith7SjZgnsjnnUwhCYOIThOnZj8DrBGEMGbVsxYJVbR6f1VM
   rru9yF1xV+0DCMAw3seha2h5DmNR7duMo8X6ARrojPMoz+hEqRv230Pr7
   NlrtZgXRIOhODeaqhWFtdNgqlGZ25c7+rEnaKDs60Gjp85UIEFKWelvq3
   5vmxQa68fkNJx9qbR16ApOgERoR9ohaSD8yg1frgTlNwFaZg9ly+GiDTI
   9h6N8YUJyV7e/dkwuVg/E5fLOcraADZ7D+yzsO/9g9fFTZtHhQn8Em1gf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="362582680"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="362582680"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 00:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="715861478"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="715861478"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 00:45:41 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJr1B-0006Nt-0P;
	Thu, 13 Jul 2023 07:45:41 +0000
Date: Thu, 13 Jul 2023 15:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 55/101]
 drivers/net/ethernet/ibm/emac/core.c:2384:18: error: incompatible integer to
 pointer conversion assigning to 'struct platform_device *' from 'int'
Message-ID: <202307131554.KdfdXCBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: abf44efd37f3ba94c30934248287cc3ca2617135 [55/101] net: Explicitly include correct DT includes
config: powerpc-walnut_defconfig (https://download.01.org/0day-ci/archive/20230713/202307131554.KdfdXCBm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131554.KdfdXCBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131554.KdfdXCBm-lkp@intel.com/

All errors (new ones prefixed by >>):

         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:137:1: note: expanded from here
     137 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/ibm/emac/core.c:28:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:139:1: note: expanded from here
     139 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/ibm/emac/core.c:28:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:141:1: note: expanded from here
     141 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/ibm/emac/core.c:28:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:143:1: note: expanded from here
     143 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/ibm/emac/core.c:28:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:145:1: note: expanded from here
     145 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/net/ethernet/ibm/emac/core.c:2384:20: error: call to undeclared function 'of_find_device_by_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2384 |                         deps[i].ofdev = of_find_device_by_node(deps[i].node);
         |                                         ^
   drivers/net/ethernet/ibm/emac/core.c:2384:20: note: did you mean 'of_find_net_device_by_node'?
   include/linux/of_net.h:19:27: note: 'of_find_net_device_by_node' declared here
      19 | extern struct net_device *of_find_net_device_by_node(struct device_node *np);
         |                           ^
>> drivers/net/ethernet/ibm/emac/core.c:2384:18: error: incompatible integer to pointer conversion assigning to 'struct platform_device *' from 'int' [-Wint-conversion]
    2384 |                         deps[i].ofdev = of_find_device_by_node(deps[i].node);
         |                                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +2384 drivers/net/ethernet/ibm/emac/core.c

1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2355  
fe17dc1e2bae85 drivers/net/ethernet/ibm/emac/core.c Bill Pemberton 2012-12-03  2356  static int emac_check_deps(struct emac_instance *dev,
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2357  			   struct emac_depentry *deps)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2358  {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2359  	int i, there = 0;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2360  	struct device_node *np;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2361  
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2362  	for (i = 0; i < EMAC_DEP_COUNT; i++) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2363  		/* no dependency on that item, allright */
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2364  		if (deps[i].phandle == 0) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2365  			there++;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2366  			continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2367  		}
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2368  		/* special case for blist as the dependency might go away */
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2369  		if (i == EMAC_DEP_PREV_IDX) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2370  			np = *(dev->blist - 1);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2371  			if (np == NULL) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2372  				deps[i].phandle = 0;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2373  				there++;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2374  				continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2375  			}
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2376  			if (deps[i].node == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2377  				deps[i].node = of_node_get(np);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2378  		}
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2379  		if (deps[i].node == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2380  			deps[i].node = of_find_node_by_phandle(deps[i].phandle);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2381  		if (deps[i].node == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2382  			continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2383  		if (deps[i].ofdev == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23 @2384  			deps[i].ofdev = of_find_device_by_node(deps[i].node);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2385  		if (deps[i].ofdev == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2386  			continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2387  		if (deps[i].drvdata == NULL)
bc353832565635 drivers/net/ethernet/ibm/emac/core.c Jingoo Han     2013-09-02  2388  			deps[i].drvdata = platform_get_drvdata(deps[i].ofdev);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2389  		if (deps[i].drvdata != NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2390  			there++;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2391  	}
807540baae406c drivers/net/ibm_newemac/core.c       Eric Dumazet   2010-09-23  2392  	return there == EMAC_DEP_COUNT;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2393  }
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2394  

:::::: The code at line 2384 was first introduced by commit
:::::: 1d3bb996481e116f5f2b127cbd29b83365d2cf62 Device tree aware EMAC driver

:::::: TO: David Gibson <david@gibson.dropbear.id.au>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
