Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368724177;
	Wed, 12 Jul 2023 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689191889; x=1720727889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TLB6WMwGQReecRAAvbLtFjT3V98Ijdx8HTwiSEIud0=;
  b=iAkGUGtCO8S8bHeT8bR2YTFoeRqmb4Il+DMmj5/YDeF1LxgwdW4KFHMf
   lmxEhUkZSaIh6lh1uGZpgDsflsWCNxYrhdBVFLB58NJmkj/gunwABaTDX
   gsTU+eAu9AbduuqeRccTCDjL8WbKDLG4VLFEfB52J5OzRXy8h1TX2BFmT
   IQu4q8fn0mNipPvYQ6lTqj7vRSKPVm0nqDZ5GgvQCzcHDsf1N+Qmz9Zlj
   QiZS+fnyGHt3cDzxI+hP2EFZjNqQsPr3oWfct0Dre5ixzRLrEjM8WyTtE
   jzSpGBYSCdAlK8+wOBuqud3253Hchqd+WW4PGc1bhO5F1loWQ7zhzca84
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344588015"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="344588015"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 12:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="698980479"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="698980479"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2023 12:58:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJfyP-0005xJ-1J;
	Wed, 12 Jul 2023 19:58:05 +0000
Date: Thu, 13 Jul 2023 03:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 28/74]
 drivers/dma/bestcomm/bestcomm.c:364:38: warning: declaration of 'struct
 platform_device' will not be visible outside of this function
Message-ID: <202307130352.54wQOAp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   931bfd077a7b267f99362274fda4f2df5c36b71f
commit: 4da905710e38b6b8fbc9dc1e32276e59c3b4e2ab [28/74] dmaengine: Explicitly include correct DT includes
config: powerpc-tqm5200_defconfig (https://download.01.org/0day-ci/archive/20230713/202307130352.54wQOAp9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130352.54wQOAp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130352.54wQOAp9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dma/bestcomm/bestcomm.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:196:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:614:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/dma/bestcomm/bestcomm.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:198:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/dma/bestcomm/bestcomm.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:200:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/dma/bestcomm/bestcomm.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:202:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/dma/bestcomm/bestcomm.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:204:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/dma/bestcomm/bestcomm.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:206:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/dma/bestcomm/bestcomm.c:364:38: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
   static int mpc52xx_bcom_probe(struct platform_device *op)
                                        ^
   drivers/dma/bestcomm/bestcomm.c:375:16: error: incomplete definition of type 'struct platform_device'
           of_node_get(op->dev.of_node);
                       ~~^
   drivers/dma/bestcomm/bestcomm.c:364:38: note: forward declaration of 'struct platform_device'
   static int mpc52xx_bcom_probe(struct platform_device *op)
                                        ^
   drivers/dma/bestcomm/bestcomm.c:402:23: error: incomplete definition of type 'struct platform_device'
           bcom_eng->ofnode = op->dev.of_node;
                              ~~^
   drivers/dma/bestcomm/bestcomm.c:364:38: note: forward declaration of 'struct platform_device'
   static int mpc52xx_bcom_probe(struct platform_device *op)
                                        ^
   drivers/dma/bestcomm/bestcomm.c:405:31: error: incomplete definition of type 'struct platform_device'
           if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
                                      ~~^
   drivers/dma/bestcomm/bestcomm.c:364:38: note: forward declaration of 'struct platform_device'
   static int mpc52xx_bcom_probe(struct platform_device *op)
                                        ^
   drivers/dma/bestcomm/bestcomm.c:449:16: error: incomplete definition of type 'struct platform_device'
           of_node_put(op->dev.of_node);
                       ~~^
   drivers/dma/bestcomm/bestcomm.c:364:38: note: forward declaration of 'struct platform_device'
   static int mpc52xx_bcom_probe(struct platform_device *op)
                                        ^
   drivers/dma/bestcomm/bestcomm.c:457:39: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
   static int mpc52xx_bcom_remove(struct platform_device *op)
                                         ^
   drivers/dma/bestcomm/bestcomm.c:488:31: error: variable has incomplete type 'struct platform_driver'
   static struct platform_driver mpc52xx_bcom_of_platform_driver = {
                                 ^
   drivers/dma/bestcomm/bestcomm.c:488:15: note: forward declaration of 'struct platform_driver'
   static struct platform_driver mpc52xx_bcom_of_platform_driver = {
                 ^
   drivers/dma/bestcomm/bestcomm.c:505:9: error: call to undeclared function 'platform_driver_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return platform_driver_register(&mpc52xx_bcom_of_platform_driver);
                  ^
   drivers/dma/bestcomm/bestcomm.c:511:2: error: call to undeclared function 'platform_driver_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_driver_unregister(&mpc52xx_bcom_of_platform_driver);
           ^
   8 warnings and 7 errors generated.


vim +364 drivers/dma/bestcomm/bestcomm.c

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  363  
cad5cef62a5a0c arch/powerpc/sysdev/bestcomm/bestcomm.c Greg Kroah-Hartman 2012-12-21 @364  static int mpc52xx_bcom_probe(struct platform_device *op)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  365  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  366  	struct device_node *ofn_sram;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  367  	struct resource res_bcom;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  368  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  369  	int rv;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  370  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  371  	/* Inform user we're ok so far */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  372  	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  373  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  374  	/* Get the bestcomm node */
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  375  	of_node_get(op->dev.of_node);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  376  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  377  	/* Prepare SRAM */
66ffbe490b6156 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-01-24  378  	ofn_sram = of_find_matching_node(NULL, mpc52xx_sram_ids);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  379  	if (!ofn_sram) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  380  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  381  			"No SRAM found in device tree\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  382  		rv = -ENODEV;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  383  		goto error_ofput;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  384  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  385  	rv = bcom_sram_init(ofn_sram, DRIVER_NAME);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  386  	of_node_put(ofn_sram);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  387  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  388  	if (rv) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  389  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  390  			"Error in SRAM init\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  391  		goto error_ofput;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  392  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  393  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  394  	/* Get a clean struct */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  395  	bcom_eng = kzalloc(sizeof(struct bcom_engine), GFP_KERNEL);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  396  	if (!bcom_eng) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  397  		rv = -ENOMEM;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  398  		goto error_sramclean;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  399  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  400  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  401  	/* Save the node */
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  402  	bcom_eng->ofnode = op->dev.of_node;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  403  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  404  	/* Get, reserve & map io */
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  405  	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  406  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  407  			"Can't get resource\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  408  		rv = -EINVAL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  409  		goto error_sramclean;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  410  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  411  
b5961f86802a1d arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2013-01-18  412  	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  413  				DRIVER_NAME)) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  414  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  415  			"Can't request registers region\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  416  		rv = -EBUSY;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  417  		goto error_sramclean;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  418  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  419  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  420  	bcom_eng->regs_base = res_bcom.start;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  421  	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  422  	if (!bcom_eng->regs) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  423  		printk(KERN_ERR DRIVER_NAME ": "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  424  			"Can't map registers\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  425  		rv = -ENOMEM;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  426  		goto error_release;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  427  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  428  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  429  	/* Now, do the real init */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  430  	rv = bcom_engine_init();
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  431  	if (rv)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  432  		goto error_unmap;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  433  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  434  	/* Done ! */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  435  	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
08b6c06de5d3f3 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2008-07-11  436  		(long)bcom_eng->regs_base);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  437  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  438  	return 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  439  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  440  	/* Error path */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  441  error_unmap:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  442  	iounmap(bcom_eng->regs);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  443  error_release:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  444  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  445  error_sramclean:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  446  	kfree(bcom_eng);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  447  	bcom_sram_cleanup();
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  448  error_ofput:
61c7a080a5a061 arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2010-04-13  449  	of_node_put(op->dev.of_node);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  450  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  451  	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  452  
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  453  	return rv;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  454  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2007-09-16  455  

:::::: The code at line 364 was first introduced by commit
:::::: cad5cef62a5a0c525d39118d2e94b6e2034d5e05 POWERPC: drivers: remove __dev* attributes.

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
