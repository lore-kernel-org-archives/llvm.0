Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4C15AD;
	Fri,  6 Oct 2023 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0Un5Sll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696556419; x=1728092419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVwAAJFR2EX/UqvsHGn0Q7n8nUPpYiu7HHH2OEqFqZY=;
  b=P0Un5Slli6olQfQn9GJN4rtzQ8+5W6MLfJu+zVj2S/T9B2GDzTI9ozd9
   PzivtzLjB/oLcMZcMMceUK6N1uQsY1pRF+FH3Fc6LoiM8THVJ6+o+EDsG
   kuWvBRK+rxF1AWiNBNCs10YzRJBkLnHiCfGxXps1uERCUPm59xeU+VDTW
   3mzQGSHX8NJYXYBAcAIMcADg1nkw94kV+uc3innASylKWnVk8+8UKg0ci
   bs8T2w5K51lqVey1rnp67XeAisgck+5cW38oHHTXSunszQ2zNgsOHroJH
   N+l3e3sBQ9/OZV19pg0yVWEJHBHktx5Pt1Xtqj+rqmotPmsVyoQ2PJDL/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374010848"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="374010848"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 18:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895692088"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="895692088"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2023 18:38:46 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoZp8-000M6y-19;
	Fri, 06 Oct 2023 01:40:14 +0000
Date: Fri, 6 Oct 2023 09:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kris Chaplin <kris.chaplin@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 2/6] drivers/w1/masters/amd_w1.c:372:14:
 error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202310060909.mIWhFUj6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   d81a4120bd209b0103e37eae6f5cceada1eda492
commit: 4e93fa1a4708500f0c532c44e9d35b34d223b59c [2/6] w1: Add 1-wire master driver for AMD programmable logic IP Core
config: powerpc-walnut_defconfig (https://download.01.org/0day-ci/archive/20231006/202310060909.mIWhFUj6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060909.mIWhFUj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060909.mIWhFUj6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:84:1: note: expanded from here
      84 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
     610 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/w1/masters/amd_w1.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:86:1: note: expanded from here
      86 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/w1/masters/amd_w1.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:88:1: note: expanded from here
      88 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/w1/masters/amd_w1.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:90:1: note: expanded from here
      90 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/w1/masters/amd_w1.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:92:1: note: expanded from here
      92 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/w1/masters/amd_w1.c:372:14: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     372 |         ver_major = FIELD_GET(AXIW1_MAJORVER_MASK, val);
         |                     ^
   6 warnings and 1 error generated.


vim +/FIELD_GET +372 drivers/w1/masters/amd_w1.c

   319	
   320	static int amd_w1_probe(struct platform_device *pdev)
   321	{
   322		struct device *dev = &pdev->dev;
   323		struct amd_w1_local *lp;
   324		u32 ver_major, ver_minor;
   325		int val, rc = 0;
   326	
   327		/* Get iospace for the device */
   328		lp = devm_kzalloc(dev, sizeof(*lp), GFP_KERNEL);
   329		if (!lp)
   330			return -ENOMEM;
   331	
   332		lp->dev = dev;
   333		lp->base_addr = devm_platform_ioremap_resource(pdev, 0);
   334		if (IS_ERR(lp->base_addr))
   335			return PTR_ERR(lp->base_addr);
   336	
   337		/* Get IRQ for the device */
   338		lp->irq = platform_get_irq(pdev, 0);
   339		if (lp->irq <= 0)
   340			return lp->irq;
   341	
   342		rc = devm_request_irq(dev, lp->irq, &amd_w1_irq, IRQF_TRIGGER_HIGH, DRIVER_NAME, lp);
   343		if (rc) {
   344			dev_err(dev, "Could not allocate interrupt %d.\n", lp->irq);
   345			return rc;
   346		}
   347	
   348		/* Initialize wait queue and flag */
   349		init_waitqueue_head(&lp->wait_queue);
   350	
   351		lp->clk = devm_clk_get_enabled(dev, NULL);
   352		if (IS_ERR(lp->clk))
   353			return PTR_ERR(lp->clk);
   354	
   355		/* Verify IP presence in HW */
   356		if (amd_w1_read_register(lp, AXIW1_IPID_REG) != AXIW1_IPID) {
   357			dev_err(dev, "AMD 1-wire IP not detected in hardware\n");
   358			return -ENODEV;
   359		}
   360	
   361		/*
   362		 * Allow for future driver expansion supporting new hardware features
   363		 * This driver currently only supports hardware 1.x, but include logic
   364		 * to detect if a potentially incompatible future version is used
   365		 * by reading major version ID. It is highly undesirable for new IP versions
   366		 * to break the API, but this code will at least allow for graceful failure
   367		 * should that happen. Future new features can be enabled by hardware
   368		 * incrementing the minor version and augmenting the driver to detect capability
   369		 * using the minor version number
   370		 */
   371		val = amd_w1_read_register(lp, AXIW1_IPVER_REG);
 > 372		ver_major = FIELD_GET(AXIW1_MAJORVER_MASK, val);
   373		ver_minor = FIELD_GET(AXIW1_MINORVER_MASK, val);
   374	
   375		if (ver_major != 1) {
   376			dev_err(dev, "AMD AXI W1 Master version %u.%u is not supported by this driver",
   377				ver_major, ver_minor);
   378			return -ENODEV;
   379		}
   380	
   381		amd_w1_master.data = (void *)lp;
   382		amd_w1_reset(lp);
   383	
   384		platform_set_drvdata(pdev, lp);
   385		rc = w1_add_master_device(&amd_w1_master);
   386		if (rc) {
   387			dev_err(dev, "Could not add master device\n");
   388			amd_w1_reset(lp);
   389			return rc;
   390		}
   391	
   392		return 0;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
