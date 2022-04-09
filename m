Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7105621
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 04:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649476858; x=1681012858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f0STnqFn6gc7mAgH7r5NxAlmkxuVedk3L3mvJYOIuno=;
  b=DGWlX+yGtn2t/GtTwz+ABXW22AXK2TaHib4cLFPPCdOMTXJXmIs2DX7n
   yPZhjI+JnIVRKUuld3UmiQy4RN3XSGmo0kIxvHsXUUpd+Wc75ADg2Emtl
   Z+O2vHNdDKFIM/pEeiJEW1cbBYw46SIXYVi7WgZ/WU85dZCoJRCiLhv/f
   RqTLLMDo+Z9szC+p3PGpIQu5BORCw2i/qoCRTG/ddF87W0HBDyzAxGTk2
   SDBSyNUWnOVgGEQmjOrR1C3Jwj7o4Xs9QRIUjBY3Cilu7dhaZgN2Li/Qd
   KZ4mVhuflvkOyOfaHq5llnYc/+saoO+QYkAZ34nw/+O7FD0zif0JUMn7m
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="348191416"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="348191416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 21:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="653565533"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2022 21:00:55 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nd2HO-0000rE-MH;
	Sat, 09 Apr 2022 04:00:54 +0000
Date: Sat, 9 Apr 2022 12:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
Subject: [l1k:smsc95xx_5.17 95/887] drivers/irqchip/irq-bcm2835.c:204:15:
 warning: variable 'last_irq' set but not used
Message-ID: <202204091144.FB1a2hA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   05d68ced287b30f62f18f95b5476135ef669804a
commit: d721ee482d0edde5df2ddd15556b1e2754bdc5c0 [95/887] irqchip: irq-bcm2835: Calc. FIQ_START at boot-time
config: arm64-randconfig-r006-20220408 (https://download.01.org/0day-ci/archive/20220409/202204091144.FB1a2hA7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/l1k/linux/commit/d721ee482d0edde5df2ddd15556b1e2754bdc5c0
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k smsc95xx_5.17
        git checkout d721ee482d0edde5df2ddd15556b1e2754bdc5c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-bcm2835.c:204:15: warning: variable 'last_irq' set but not used [-Wunused-but-set-variable]
           int irq = 0, last_irq, b, i;
                        ^
   1 warning generated.


vim +/last_irq +204 drivers/irqchip/irq-bcm2835.c

   198	
   199	static int __init armctrl_of_init(struct device_node *node,
   200					  struct device_node *parent,
   201					  bool is_2836)
   202	{
   203		void __iomem *base;
 > 204		int irq = 0, last_irq, b, i;
   205		u32 reg;
   206	
   207		base = of_iomap(node, 0);
   208		if (!base)
   209			panic("%pOF: unable to map IC registers\n", node);
   210	
   211		intc.base = base;
   212		intc.domain = irq_domain_add_linear(node, NUMBER_IRQS * 2,
   213						    &armctrl_ops, NULL);
   214		if (!intc.domain)
   215			panic("%pOF: unable to create IRQ domain\n", node);
   216	
   217		for (b = 0; b < NR_BANKS; b++) {
   218			intc.pending[b] = base + reg_pending[b];
   219			intc.enable[b] = base + reg_enable[b];
   220			intc.disable[b] = base + reg_disable[b];
   221	
   222			for (i = 0; i < bank_irqs[b]; i++) {
   223				irq = irq_create_mapping(intc.domain, MAKE_HWIRQ(b, i));
   224				BUG_ON(irq <= 0);
   225				irq_set_chip_and_handler(irq, &armctrl_chip,
   226					handle_level_irq);
   227				irq_set_probe(irq);
   228			}
   229	
   230			reg = readl_relaxed(intc.enable[b]);
   231			if (reg) {
   232				writel_relaxed(reg, intc.disable[b]);
   233				pr_err(FW_BUG "Bootloader left irq enabled: "
   234				       "bank %d irq %*pbl\n", b, IRQS_PER_BANK, &reg);
   235			}
   236		}
   237	
   238		reg = readl_relaxed(base + REG_FIQ_CONTROL);
   239		if (reg & FIQ_CONTROL_ENABLE) {
   240			writel_relaxed(0, base + REG_FIQ_CONTROL);
   241			pr_err(FW_BUG "Bootloader left fiq enabled\n");
   242		}
   243	
   244		last_irq = irq;
   245	
   246		if (is_2836) {
   247			int parent_irq = irq_of_parse_and_map(node, 0);
   248	
   249			if (!parent_irq) {
   250				panic("%pOF: unable to get parent interrupt.\n",
   251				      node);
   252			}
   253			irq_set_chained_handler(parent_irq, bcm2836_chained_handle_irq);
   254		} else {
   255			set_handle_irq(bcm2835_handle_irq);
   256		}
   257	
   258		if (is_2836) {
   259			extern void __iomem * __attribute__((weak)) arm_local_intc;
   260			intc.local_base = arm_local_intc;
   261			if (!intc.local_base)
   262				pr_err("Failed to get local intc base. FIQ is disabled for cpus > 1\n");
   263		}
   264	
   265		/* Make a duplicate irq range which is used to enable FIQ */
   266		for (b = 0; b < NR_BANKS; b++) {
   267			for (i = 0; i < bank_irqs[b]; i++) {
   268				irq = irq_create_mapping(intc.domain,
   269						MAKE_HWIRQ(b, i) + NUMBER_IRQS);
   270				BUG_ON(irq <= 0);
   271				irq_set_chip(irq, &armctrl_chip);
   272				irq_set_probe(irq);
   273			}
   274		}
   275	#ifndef CONFIG_ARM64
   276		init_FIQ(irq - last_irq);
   277	#endif
   278	
   279		return 0;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
