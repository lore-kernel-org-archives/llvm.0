Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9246FA9;
	Sun,  9 Jul 2023 14:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688911251; x=1720447251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19LPOcJSxm+IcMqM+HHu7UrLieKNXHgOjRlfO1tAuuM=;
  b=iiiPHjcSUr7hqUj0Z6J57IUlhCWhd8smhJ4HHPwYd8Ns0wBL1OemO9sA
   CMDKhabEj9K+42CkM4XBqyf93NEMOnj0Fov8iNQerOXGh+gLojN2w6Z4J
   dxq293Ne1elLMEDfYkEtnWdQGpZglJUUNkKVMVv8QKoNtZMZfBZZeTI82
   Qq/C0Vj578UVrC/2G6hVffvCRblVb6BL1U+wXcBXKxvJIe8pQAI9cgBVn
   /nVAabaL4tzwSFuI9lwjaLt04BvBbWYWxW9qp7/f7gcpqnGV2vHwYiWKJ
   GJvJMd9+PoBT8bLnT7FaQELeGS8JRPz5k5vo1IXF9XuMYFXYRSUnjcWyB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364208471"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="364208471"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 07:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="1051074425"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1051074425"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jul 2023 07:00:48 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIUxz-0003Ek-0s;
	Sun, 09 Jul 2023 14:00:47 +0000
Date: Sun, 9 Jul 2023 21:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-6.3.y 2593/2805]
 arch/arm/mach-omap1/irq.c:221:11: error: call to undeclared function
 'irq_domain_add_legacy'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202307092156.25wnWoY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.3.y
head:   c36188cdbe803adfeea94f8b4b1d2c5ebf1f0793
commit: 337771c7d078a130c6bc1bfe4878d04f67758a91 [2593/2805] ARM: omap1: Exorcise the legacy GPIO header
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20230709/202307092156.25wnWoY2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307092156.25wnWoY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307092156.25wnWoY2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-omap1/irq.c:221:11: error: call to undeclared function 'irq_domain_add_legacy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     221 |         domain = irq_domain_add_legacy(NULL, nr_irqs, irq_base, 0,
         |                  ^
>> arch/arm/mach-omap1/irq.c:222:13: error: use of undeclared identifier 'irq_domain_simple_ops'
     222 |                                        &irq_domain_simple_ops, NULL);
         |                                         ^
>> arch/arm/mach-omap1/irq.c:250:23: error: call to undeclared function 'irq_find_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     250 |         d = irq_get_irq_data(irq_find_mapping(domain, omap_l2_irq));
         |                              ^
   3 errors generated.


vim +/irq_domain_add_legacy +221 arch/arm/mach-omap1/irq.c

55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  204  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  205  	for (i = 0; i < irq_bank_count; i++) {
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  206  		irq_banks[i].va = ioremap(irq_banks[i].base_reg, 0xff);
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  207  		if (WARN_ON(!irq_banks[i].va))
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  208  			return;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  209  	}
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  210  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  211  	nr_irqs = irq_bank_count * 32;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  212  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  213  	irq_base = irq_alloc_descs(-1, 0, nr_irqs, 0);
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  214  	if (irq_base < 0) {
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  215  		pr_warn("Couldn't allocate IRQ numbers\n");
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  216  		irq_base = 0;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  217  	}
8825acd7cc8a13 arch/arm/mach-omap1/irq.c Arnd Bergmann  2022-09-29  218  	omap_l2_irq = irq_base;
685e2d08c54b1a arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  219  	omap_l2_irq -= NR_IRQS_LEGACY;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  220  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20 @221  	domain = irq_domain_add_legacy(NULL, nr_irqs, irq_base, 0,
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20 @222  				       &irq_domain_simple_ops, NULL);
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  223  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  224  	pr_info("Total of %lu interrupts in %i interrupt banks\n",
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  225  		nr_irqs, irq_bank_count);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  226  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  227  	/* Mask and clear all interrupts */
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  228  	for (i = 0; i < irq_bank_count; i++) {
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  229  		irq_bank_writel(~0x0, i, IRQ_MIR_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  230  		irq_bank_writel(0x0, i, IRQ_ITR_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  231  	}
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  232  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  233  	/* Clear any pending interrupts */
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  234  	irq_bank_writel(0x03, 0, IRQ_CONTROL_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  235  	irq_bank_writel(0x03, 1, IRQ_CONTROL_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  236  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  237  	/* Install the interrupt handlers for each bank */
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  238  	for (i = 0; i < irq_bank_count; i++) {
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  239  		for (j = i * 32; j < (i + 1) * 32; j++) {
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  240  			int irq_trigger;
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  241  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  242  			irq_trigger = irq_banks[i].trigger_map >> IRQ_BIT(j);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  243  			omap_irq_set_cfg(j, 0, 0, irq_trigger);
e8d36d5dbb6a6e arch/arm/mach-omap1/irq.c Rob Herring    2015-07-27  244  			irq_clear_status_flags(j, IRQ_NOREQUEST);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  245  		}
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20  246  		omap_alloc_gc(irq_banks[i].va, irq_base + i * 32, 32);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  247  	}
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  248  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds 2005-04-16  249  	/* Unmask level 2 handler */
b694331cfb2ec3 arch/arm/mach-omap1/irq.c Tony Lindgren  2015-05-20 @250  	d = irq_get_irq_data(irq_find_mapping(domain, omap_l2_irq));

:::::: The code at line 221 was first introduced by commit
:::::: 55b44774438959a957e717ecbdd9f2874b07ab31 ARM: OMAP1: Switch to use generic irqchip in preparation for sparse IRQ

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
