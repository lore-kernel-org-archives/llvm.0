Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34F2CA5
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643641229; x=1675177229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y5Ym/Q75yZiBpCCGoGsOHVJVIzTEDEFIfRQ+YKuNitw=;
  b=aBXfglylUFjKff6hXIqgJMIJDAkVXm0Wx4iAPGNSxQ5dZ321Wg2GBBFw
   F3v5askuvEr2ygi1MmkQUQrHaC9/tQCb1qVaqmPWgXRlYNWPTmH+c4ut9
   BFO//I7ewscTvAd+aKFMByWjg7xnQy2DQWVTrrfOpCU7TGujcM0KXv/Pp
   PIbf9vdgOJqTymvhVdyQDM1sgYgGmOtUP/vt3uo5w6gvVGRsovtCPBZqt
   /dT+vRaFQQp839XB58G8rEM2ugr7raVF2auyNhfBni50IxYm15QgsRro5
   XWdROyC+/UMEx4iCD264nYmAXHhPMUDpUh1oBgf1P0mbbUyJhzQGi4ieF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="308207489"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="308207489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="479180300"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2022 07:00:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEYAM-000S2T-Um; Mon, 31 Jan 2022 15:00:26 +0000
Date: Mon, 31 Jan 2022 22:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 5/20]
 drivers/irqchip/irq-versatile-fpga.c:188:9: error: use of undeclared
 identifier 'irq_start'
Message-ID: <202201312227.fAor6gZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/irq_chip_ro
head:   3feae85f6c2365d60a02d167b72a3e7410f82160
commit: b5c236add4c570b808f3e670cd0073490f03985a [5/20] irqchip/versatile-fpga: Switch to dynamic chip name output
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20220131/202201312227.fAor6gZc-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=b5c236add4c570b808f3e670cd0073490f03985a
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout b5c236add4c570b808f3e670cd0073490f03985a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-versatile-fpga.c:188:9: error: use of undeclared identifier 'irq_start'
                           if (!irq_start)
                                ^
   1 error generated.


vim +/irq_start +188 drivers/irqchip/irq-versatile-fpga.c

3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  161  
b5c236add4c570 drivers/irqchip/irq-versatile-fpga.c Marc Zyngier    2022-01-30  162  static void __init fpga_irq_init(void __iomem *base, int parent_irq,
b5c236add4c570 drivers/irqchip/irq-versatile-fpga.c Marc Zyngier    2022-01-30  163  				 u32 valid, struct device_node *node)
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  164  {
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  165  	struct fpga_irq_data *f;
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  166  	int i;
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  167  
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  168  	if (fpga_irq_id >= ARRAY_SIZE(fpga_irq_devices)) {
e6423f8be51bab drivers/irqchip/irq-versatile-fpga.c Paul Bolle      2013-03-25  169  		pr_err("%s: too few FPGA IRQ controllers, increase CONFIG_VERSATILE_FPGA_IRQ_NR\n", __func__);
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  170  		return;
c41b16f8c9d9dc arch/arm/plat-versatile/fpga-irq.c   Russell King    2011-01-19  171  	}
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  172  	f = &fpga_irq_devices[fpga_irq_id];
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  173  	f->base = base;
b5c236add4c570 drivers/irqchip/irq-versatile-fpga.c Marc Zyngier    2022-01-30  174  	f->np = node;
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  175  	f->valid = valid;
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  176  
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  177  	if (parent_irq != -1) {
fcd3c5bee16a2c drivers/irqchip/irq-versatile-fpga.c Thomas Gleixner 2015-06-21  178  		irq_set_chained_handler_and_data(parent_irq, fpga_irq_handle,
fcd3c5bee16a2c drivers/irqchip/irq-versatile-fpga.c Thomas Gleixner 2015-06-21  179  						 f);
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  180  	}
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  181  
b5c236add4c570 drivers/irqchip/irq-versatile-fpga.c Marc Zyngier    2022-01-30  182  	f->domain = irq_domain_add_linear(node, fls(valid),
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  183  					  &fpga_irqdomain_ops, f);
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  184  
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  185  	/* This will allocate all valid descriptors in the linear case */
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  186  	for (i = 0; i < fls(valid); i++)
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  187  		if (valid & BIT(i)) {
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27 @188  			if (!irq_start)
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  189  				irq_create_mapping(f->domain, i);
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  190  			f->used_irqs++;
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  191  		}
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  192  
bdd272cbb97a66 drivers/irqchip/irq-versatile-fpga.c Linus Walleij   2013-10-04  193  	pr_info("FPGA IRQ chip %d \"%s\" @ %p, %u irqs",
b5c236add4c570 drivers/irqchip/irq-versatile-fpga.c Marc Zyngier    2022-01-30  194  		fpga_irq_id, node->name, base, f->used_irqs);
bdd272cbb97a66 drivers/irqchip/irq-versatile-fpga.c Linus Walleij   2013-10-04  195  	if (parent_irq != -1)
bdd272cbb97a66 drivers/irqchip/irq-versatile-fpga.c Linus Walleij   2013-10-04  196  		pr_cont(", parent IRQ: %d\n", parent_irq);
bdd272cbb97a66 drivers/irqchip/irq-versatile-fpga.c Linus Walleij   2013-10-04  197  	else
bdd272cbb97a66 drivers/irqchip/irq-versatile-fpga.c Linus Walleij   2013-10-04  198  		pr_cont("\n");
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  199  
3a6ca8c5c9e310 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-10-27  200  	fpga_irq_id++;
9bc1503185a099 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-09-06  201  }
3108e6ab21a9b9 arch/arm/plat-versatile/fpga-irq.c   Linus Walleij   2012-04-28  202  

:::::: The code at line 188 was first introduced by commit
:::::: 3a6ca8c5c9e310d26fe090ac7c777c269661f0e6 ARM: plat-versatile: use simple irqdomain for FPGA IRQ

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
