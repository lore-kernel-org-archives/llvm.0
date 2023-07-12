Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EEDDF58;
	Wed, 12 Jul 2023 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689202931; x=1720738931;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r5MAd898LLBcBnUdGg3fZXbLEUg4sHRubQcyXPMelfI=;
  b=A4Owk39KVR1JShkJbOYUBNwdJi7nhWnxx4EIBKgvFRDv/TZG2KsCMhwn
   QtHpvXHTPnviqheMkpKrE9b63oOKKYeqc/Uch/w899f0qXWW+ki2GmqfU
   hi8Txnf6iL8zhcPcxg+PLYlJ13ciHKxc9XuRXx294ss0gPxcF3iQCK4Y3
   iMpDXsWOWrlghYZufFkOuZJDrBojmnbhQmDb9ZGDtH3m6LdC2pHrvDcs+
   tadasmrfrPAF9rV72I2sboJoKnVxgVSH+5FaISbRAVcJ/roVdy77ULRfI
   FqhK4wyLSeTDxAefZ5FRLTV10NHFRLKT3OeGQEB4mqmEvX7anKRH6GPku
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="354940878"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="354940878"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 16:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725057776"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="725057776"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 16:02:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJiqW-000625-0Z;
	Wed, 12 Jul 2023 23:02:08 +0000
Date: Thu, 13 Jul 2023 07:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 15/74] drivers/ata/pata_mpc52xx.c:686:42:
 error: incomplete definition of type 'struct platform_device'
Message-ID: <202307130617.fqrcnwo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   311e94664b3a26bcb3ce1430d9e3c6becc66e81a
commit: 7ae5b7dd017d3a56bc4b1eb3b72b9b67f9327fa2 [15/74] ata: Explicitly include correct DT includes
config: powerpc-tqm5200_defconfig (https://download.01.org/0day-ci/archive/20230713/202307130617.fqrcnwo8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130617.fqrcnwo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130617.fqrcnwo8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ata/pata_mpc52xx.c:21:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:187:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/ata/pata_mpc52xx.c:21:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:189:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/ata/pata_mpc52xx.c:21:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:191:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/ata/pata_mpc52xx.c:21:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:193:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/ata/pata_mpc52xx.c:21:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:195:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/ata/pata_mpc52xx.c:686:42: error: incomplete definition of type 'struct platform_device'
           ipb_freq = mpc5xxx_get_bus_frequency(&op->dev);
                                                 ~~^
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:688:14: error: incomplete definition of type 'struct platform_device'
                   dev_err(&op->dev, "could not determine IPB bus frequency\n");
                            ~~^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:694:32: error: incomplete definition of type 'struct platform_device'
           rv = of_address_to_resource(op->dev.of_node, 0, &res_mem);
                                       ~~^
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:696:14: error: incomplete definition of type 'struct platform_device'
                   dev_err(&op->dev, "could not determine device base address\n");
                            ~~^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:700:34: error: incomplete definition of type 'struct platform_device'
           if (!devm_request_mem_region(&op->dev, res_mem.start,
                                         ~~^
   include/linux/ioport.h:306:24: note: expanded from macro 'devm_request_mem_region'
           __devm_request_region(dev, &iomem_resource, (start), (n), (name))
                                 ^~~
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:702:14: error: incomplete definition of type 'struct platform_device'
                   dev_err(&op->dev, "error requesting register region\n");
                            ~~^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:706:29: error: incomplete definition of type 'struct platform_device'
           ata_regs = devm_ioremap(&op->dev, res_mem.start, sizeof(*ata_regs));
                                    ~~^
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:708:14: error: incomplete definition of type 'struct platform_device'
                   dev_err(&op->dev, "error mapping device registers\n");
                            ~~^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:726:27: error: incomplete definition of type 'struct platform_device'
           prop = of_get_property(op->dev.of_node, "mwdma-mode", &proplen);
                                  ~~^
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:729:27: error: incomplete definition of type 'struct platform_device'
           prop = of_get_property(op->dev.of_node, "udma-mode", &proplen);
                                  ~~^
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:733:35: error: incomplete definition of type 'struct platform_device'
           ata_irq = irq_of_parse_and_map(op->dev.of_node, 0);
                                          ~~^
   include/linux/acpi.h:986:22: note: forward declaration of 'struct platform_device'
   static inline struct platform_device *
                        ^
   drivers/ata/pata_mpc52xx.c:735:14: error: incomplete definition of type 'struct platform_device'
                   dev_err(&op->dev, "error mapping irq\n");
                            ~~^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \


vim +686 drivers/ata/pata_mpc52xx.c

155d2916d9474f8 Sylvain Munaut     2006-12-08  671  
0ec24914675c482 Greg Kroah-Hartman 2012-12-21  672  static int mpc52xx_ata_probe(struct platform_device *op)
155d2916d9474f8 Sylvain Munaut     2006-12-08  673  {
155d2916d9474f8 Sylvain Munaut     2006-12-08  674  	unsigned int ipb_freq;
155d2916d9474f8 Sylvain Munaut     2006-12-08  675  	struct resource res_mem;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  676  	int ata_irq = 0;
24dc5f33ea4b504 Tejun Heo          2007-01-20  677  	struct mpc52xx_ata __iomem *ata_regs;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  678  	struct mpc52xx_ata_priv *priv = NULL;
d01159dffa15e3a Julia Lawall       2012-03-11  679  	int rv, task_irq;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  680  	int mwdma_mask = 0, udma_mask = 0;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  681  	const __be32 *prop;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  682  	int proplen;
d01159dffa15e3a Julia Lawall       2012-03-11  683  	struct bcom_task *dmatsk;
155d2916d9474f8 Sylvain Munaut     2006-12-08  684  
155d2916d9474f8 Sylvain Munaut     2006-12-08  685  	/* Get ipb frequency */
de06fba62af6414 Andy Shevchenko    2022-05-07 @686  	ipb_freq = mpc5xxx_get_bus_frequency(&op->dev);
155d2916d9474f8 Sylvain Munaut     2006-12-08  687  	if (!ipb_freq) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  688  		dev_err(&op->dev, "could not determine IPB bus frequency\n");
155d2916d9474f8 Sylvain Munaut     2006-12-08  689  		return -ENODEV;
155d2916d9474f8 Sylvain Munaut     2006-12-08  690  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  691  
6b61e69e7bc1cfe Tim Yamin          2008-12-21  692  	/* Get device base address from device tree, request the region
6b61e69e7bc1cfe Tim Yamin          2008-12-21  693  	 * and ioremap it. */
61c7a080a5a061c Grant Likely       2010-04-13  694  	rv = of_address_to_resource(op->dev.of_node, 0, &res_mem);
155d2916d9474f8 Sylvain Munaut     2006-12-08  695  	if (rv) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  696  		dev_err(&op->dev, "could not determine device base address\n");
155d2916d9474f8 Sylvain Munaut     2006-12-08  697  		return rv;
155d2916d9474f8 Sylvain Munaut     2006-12-08  698  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  699  
24dc5f33ea4b504 Tejun Heo          2007-01-20  700  	if (!devm_request_mem_region(&op->dev, res_mem.start,
6b61e69e7bc1cfe Tim Yamin          2008-12-21  701  				     sizeof(*ata_regs), DRV_NAME)) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  702  		dev_err(&op->dev, "error requesting register region\n");
6b61e69e7bc1cfe Tim Yamin          2008-12-21  703  		return -EBUSY;
155d2916d9474f8 Sylvain Munaut     2006-12-08  704  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  705  
6b61e69e7bc1cfe Tim Yamin          2008-12-21  706  	ata_regs = devm_ioremap(&op->dev, res_mem.start, sizeof(*ata_regs));
155d2916d9474f8 Sylvain Munaut     2006-12-08  707  	if (!ata_regs) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  708  		dev_err(&op->dev, "error mapping device registers\n");
d01159dffa15e3a Julia Lawall       2012-03-11  709  		return -ENOMEM;
155d2916d9474f8 Sylvain Munaut     2006-12-08  710  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  711  
6b61e69e7bc1cfe Tim Yamin          2008-12-21  712  	/*
6b61e69e7bc1cfe Tim Yamin          2008-12-21  713  	 * By default, all DMA modes are disabled for the MPC5200.  Some
6b61e69e7bc1cfe Tim Yamin          2008-12-21  714  	 * boards don't have the required signals routed to make DMA work.
6b61e69e7bc1cfe Tim Yamin          2008-12-21  715  	 * Also, the MPC5200B has a silicon bug that causes data corruption
6b61e69e7bc1cfe Tim Yamin          2008-12-21  716  	 * with UDMA if it is used at the same time as the LocalPlus bus.
6b61e69e7bc1cfe Tim Yamin          2008-12-21  717  	 *
6b61e69e7bc1cfe Tim Yamin          2008-12-21  718  	 * Instead of trying to guess what modes are usable, check the
6b61e69e7bc1cfe Tim Yamin          2008-12-21  719  	 * ATA device tree node to find out what DMA modes work on the board.
6b61e69e7bc1cfe Tim Yamin          2008-12-21  720  	 * UDMA/MWDMA modes can also be forced by adding "libata.force=<mode>"
6b61e69e7bc1cfe Tim Yamin          2008-12-21  721  	 * to the kernel boot parameters.
6b61e69e7bc1cfe Tim Yamin          2008-12-21  722  	 *
6b61e69e7bc1cfe Tim Yamin          2008-12-21  723  	 * The MPC5200 ATA controller supports MWDMA modes 0, 1 and 2 and
6b61e69e7bc1cfe Tim Yamin          2008-12-21  724  	 * UDMA modes 0, 1 and 2.
6b61e69e7bc1cfe Tim Yamin          2008-12-21  725  	 */
61c7a080a5a061c Grant Likely       2010-04-13  726  	prop = of_get_property(op->dev.of_node, "mwdma-mode", &proplen);
6b61e69e7bc1cfe Tim Yamin          2008-12-21  727  	if ((prop) && (proplen >= 4))
14bdef982caeda1 Erik Inge Bolsø    2009-03-14  728  		mwdma_mask = ATA_MWDMA2 & ((1 << (*prop + 1)) - 1);
61c7a080a5a061c Grant Likely       2010-04-13  729  	prop = of_get_property(op->dev.of_node, "udma-mode", &proplen);
6b61e69e7bc1cfe Tim Yamin          2008-12-21  730  	if ((prop) && (proplen >= 4))
14bdef982caeda1 Erik Inge Bolsø    2009-03-14  731  		udma_mask = ATA_UDMA2 & ((1 << (*prop + 1)) - 1);
6b61e69e7bc1cfe Tim Yamin          2008-12-21  732  
61c7a080a5a061c Grant Likely       2010-04-13  733  	ata_irq = irq_of_parse_and_map(op->dev.of_node, 0);
1dea5edc90855ca Christophe Leroy   2022-10-06  734  	if (!ata_irq) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  735  		dev_err(&op->dev, "error mapping irq\n");
6b61e69e7bc1cfe Tim Yamin          2008-12-21  736  		return -EINVAL;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  737  	}
6b61e69e7bc1cfe Tim Yamin          2008-12-21  738  
155d2916d9474f8 Sylvain Munaut     2006-12-08  739  	/* Prepare our private structure */
cf369e4e5245c58 Julia Lawall       2022-02-10  740  	priv = devm_kzalloc(&op->dev, sizeof(*priv), GFP_KERNEL);
155d2916d9474f8 Sylvain Munaut     2006-12-08  741  	if (!priv) {
155d2916d9474f8 Sylvain Munaut     2006-12-08  742  		rv = -ENOMEM;
d01159dffa15e3a Julia Lawall       2012-03-11  743  		goto err1;
155d2916d9474f8 Sylvain Munaut     2006-12-08  744  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  745  
155d2916d9474f8 Sylvain Munaut     2006-12-08  746  	priv->ipb_period = 1000000000 / (ipb_freq / 1000);
155d2916d9474f8 Sylvain Munaut     2006-12-08  747  	priv->ata_regs = ata_regs;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  748  	priv->ata_regs_pa = res_mem.start;
155d2916d9474f8 Sylvain Munaut     2006-12-08  749  	priv->ata_irq = ata_irq;
155d2916d9474f8 Sylvain Munaut     2006-12-08  750  	priv->csel = -1;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  751  	priv->mpc52xx_ata_dma_last_write = -1;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  752  
6b61e69e7bc1cfe Tim Yamin          2008-12-21  753  	if (ipb_freq/1000000 == 66) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  754  		priv->mdmaspec = mdmaspec66;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  755  		priv->udmaspec = udmaspec66;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  756  	} else {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  757  		priv->mdmaspec = mdmaspec132;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  758  		priv->udmaspec = udmaspec132;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  759  	}
6b61e69e7bc1cfe Tim Yamin          2008-12-21  760  
6b61e69e7bc1cfe Tim Yamin          2008-12-21  761  	/* Allocate a BestComm task for DMA */
6b61e69e7bc1cfe Tim Yamin          2008-12-21  762  	dmatsk = bcom_ata_init(MAX_DMA_BUFFERS, MAX_DMA_BUFFER_SIZE);
6b61e69e7bc1cfe Tim Yamin          2008-12-21  763  	if (!dmatsk) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  764  		dev_err(&op->dev, "bestcomm initialization failed\n");
6b61e69e7bc1cfe Tim Yamin          2008-12-21  765  		rv = -ENOMEM;
d01159dffa15e3a Julia Lawall       2012-03-11  766  		goto err1;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  767  	}
6b61e69e7bc1cfe Tim Yamin          2008-12-21  768  
6b61e69e7bc1cfe Tim Yamin          2008-12-21  769  	task_irq = bcom_get_task_irq(dmatsk);
d01159dffa15e3a Julia Lawall       2012-03-11  770  	rv = devm_request_irq(&op->dev, task_irq, &mpc52xx_ata_task_irq, 0,
6b61e69e7bc1cfe Tim Yamin          2008-12-21  771  				"ATA task", priv);
d01159dffa15e3a Julia Lawall       2012-03-11  772  	if (rv) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  773  		dev_err(&op->dev, "error requesting DMA IRQ\n");
d01159dffa15e3a Julia Lawall       2012-03-11  774  		goto err2;
6b61e69e7bc1cfe Tim Yamin          2008-12-21  775  	}
6b61e69e7bc1cfe Tim Yamin          2008-12-21  776  	priv->dmatsk = dmatsk;
155d2916d9474f8 Sylvain Munaut     2006-12-08  777  
155d2916d9474f8 Sylvain Munaut     2006-12-08  778  	/* Init the hw */
155d2916d9474f8 Sylvain Munaut     2006-12-08  779  	rv = mpc52xx_ata_hw_init(priv);
155d2916d9474f8 Sylvain Munaut     2006-12-08  780  	if (rv) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  781  		dev_err(&op->dev, "error initializing hardware\n");
d01159dffa15e3a Julia Lawall       2012-03-11  782  		goto err2;
155d2916d9474f8 Sylvain Munaut     2006-12-08  783  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  784  
155d2916d9474f8 Sylvain Munaut     2006-12-08  785  	/* Register ourselves to libata */
6b61e69e7bc1cfe Tim Yamin          2008-12-21  786  	rv = mpc52xx_ata_init_one(&op->dev, priv, res_mem.start,
6b61e69e7bc1cfe Tim Yamin          2008-12-21  787  				  mwdma_mask, udma_mask);
155d2916d9474f8 Sylvain Munaut     2006-12-08  788  	if (rv) {
6b61e69e7bc1cfe Tim Yamin          2008-12-21  789  		dev_err(&op->dev, "error registering with ATA layer\n");
d01159dffa15e3a Julia Lawall       2012-03-11  790  		goto err2;
155d2916d9474f8 Sylvain Munaut     2006-12-08  791  	}
155d2916d9474f8 Sylvain Munaut     2006-12-08  792  
155d2916d9474f8 Sylvain Munaut     2006-12-08  793  	return 0;
155d2916d9474f8 Sylvain Munaut     2006-12-08  794  
d01159dffa15e3a Julia Lawall       2012-03-11  795   err2:
6b61e69e7bc1cfe Tim Yamin          2008-12-21  796  	irq_dispose_mapping(task_irq);
6b61e69e7bc1cfe Tim Yamin          2008-12-21  797  	bcom_ata_release(dmatsk);
d01159dffa15e3a Julia Lawall       2012-03-11  798   err1:
d01159dffa15e3a Julia Lawall       2012-03-11  799  	irq_dispose_mapping(ata_irq);
155d2916d9474f8 Sylvain Munaut     2006-12-08  800  	return rv;
155d2916d9474f8 Sylvain Munaut     2006-12-08  801  }
155d2916d9474f8 Sylvain Munaut     2006-12-08  802  

:::::: The code at line 686 was first introduced by commit
:::::: de06fba62af64144aca6f8a8bedbc848d2e5b440 powerpc/mpc5xxx: Switch mpc5xxx_get_bus_frequency() to use fwnode

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
