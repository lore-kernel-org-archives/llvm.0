Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820242F27
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643823036; x=1675359036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+PLAUe/TeUxUnpfKEmRsqaHOntLulDQ6GHF27AQNik=;
  b=F6nZTlEf55l9YLfgcbasX098YYUqPc2vcZKQ5/Nb/GMOzKNxFLp2Vhh0
   Q5IY1J9J5wTgBZBXHW2OfPkmQX66K+uFwNSy5GsBuQYKlCtUgWe/yBjIn
   ptknOSFte/uYvCi8az8+5jQHvmC6mq5Difu7h/2R7NRS/czGOuQKjkhMo
   Vbsebt1exAZbgHMMu6XuYqp2dXqA/Ebeq/BBcFq5MPdsj2v8uaJTJR9kA
   mnBxNLX/lW6tSfcbSO/51imCRjPlKPKVEIow+O2io2kjMxCyJvpWUvG0g
   c3BIzmHfQSl0vTvlNRtdFyIqb/asrVrcL/RkuXN15Xa/IHrSGkpMyxavz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="248197768"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="248197768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 09:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="771512963"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 09:25:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFJNW-000UtG-3W; Wed, 02 Feb 2022 17:25:10 +0000
Date: Thu, 3 Feb 2022 01:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 2/20]
 drivers/irqchip/irq-lpc32xx.c:123:13: error: variable has incomplete type
 'void'
Message-ID: <202202030107.7RLxUlag-lkp@intel.com>
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
head:   e213bc00d319ce834a4ce12725995bd94495f72b
commit: f04634837211212b53e98e2282ff04936842699a [2/20] irqchip/lpc32xx: Switch to dynamic chip name output
config: arm-randconfig-c002-20220201 (https://download.01.org/0day-ci/archive/20220203/202202030107.7RLxUlag-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=f04634837211212b53e98e2282ff04936842699a
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout f04634837211212b53e98e2282ff04936842699a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-lpc32xx.c:123:13: error: variable has incomplete type 'void'
   static void lpc32xx_irq+print_chip(struct ir_data *d, struct seq_file *p)
               ^
>> drivers/irqchip/irq-lpc32xx.c:123:24: error: expected ';' after top level declarator
   static void lpc32xx_irq+print_chip(struct ir_data *d, struct seq_file *p)
                          ^
                          ;
>> drivers/irqchip/irq-lpc32xx.c:210:30: error: use of undeclared identifier 'lpc32xx_irq_print_chip'; did you mean 'lpc32xx_irq_set_type'?
           irqc->chip.irq_print_chip = lpc32xx_irq_print_chip;
                                       ^~~~~~~~~~~~~~~~~~~~~~
                                       lpc32xx_irq_set_type
   drivers/irqchip/irq-lpc32xx.c:73:12: note: 'lpc32xx_irq_set_type' declared here
   static int lpc32xx_irq_set_type(struct irq_data *d, unsigned int type)
              ^
>> drivers/irqchip/irq-lpc32xx.c:213:12: error: use of undeclared identifier 'lpc32xx_irq_domain_ops'
                                                &lpc32xx_irq_domain_ops, irqc);
                                                 ^
>> drivers/irqchip/irq-lpc32xx.c:223:18: error: use of undeclared identifier 'lpc32xx_handle_irq'
                   set_handle_irq(lpc32xx_handle_irq);
                                  ^
>> drivers/irqchip/irq-lpc32xx.c:229:8: error: use of undeclared identifier 'lpc32xx_sic_handler'
                                                    lpc32xx_sic_handler, irqc);
                                                    ^
   6 errors generated.


vim +/void +123 drivers/irqchip/irq-lpc32xx.c

   122	
 > 123	static void lpc32xx_irq+print_chip(struct ir_data *d, struct seq_file *p)
   124	{
   125		struct lpc32xx_irq_chip *ic = irq_data_get_irq_chip_data(d);
   126	
   127		if (ic == lpc32xx_mic_irqc)
   128			seq_printf(p, "%08x.mic", ic->addr);
   129		else
   130			seq_printf(p, "%08x.sic", ic->addr);
   131	}
   132	
   133	static void __exception_irq_entry lpc32xx_handle_irq(struct pt_regs *regs)
   134	{
   135		struct lpc32xx_irq_chip *ic = lpc32xx_mic_irqc;
   136		u32 hwirq = lpc32xx_ic_read(ic, LPC32XX_INTC_STAT), irq;
   137	
   138		while (hwirq) {
   139			irq = __ffs(hwirq);
   140			hwirq &= ~BIT(irq);
   141			generic_handle_domain_irq(lpc32xx_mic_irqc->domain, irq);
   142		}
   143	}
   144	
   145	static void lpc32xx_sic_handler(struct irq_desc *desc)
   146	{
   147		struct lpc32xx_irq_chip *ic = irq_desc_get_handler_data(desc);
   148		struct irq_chip *chip = irq_desc_get_chip(desc);
   149		u32 hwirq = lpc32xx_ic_read(ic, LPC32XX_INTC_STAT), irq;
   150	
   151		chained_irq_enter(chip, desc);
   152	
   153		while (hwirq) {
   154			irq = __ffs(hwirq);
   155			hwirq &= ~BIT(irq);
   156			generic_handle_domain_irq(ic->domain, irq);
   157		}
   158	
   159		chained_irq_exit(chip, desc);
   160	}
   161	
   162	static int lpc32xx_irq_domain_map(struct irq_domain *id, unsigned int virq,
   163					  irq_hw_number_t hw)
   164	{
   165		struct lpc32xx_irq_chip *ic = id->host_data;
   166	
   167		irq_set_chip_data(virq, ic);
   168		irq_set_chip_and_handler(virq, &ic->chip, handle_level_irq);
   169		irq_set_status_flags(virq, IRQ_LEVEL);
   170		irq_set_noprobe(virq);
   171	
   172		return 0;
   173	}
   174	
   175	static void lpc32xx_irq_domain_unmap(struct irq_domain *id, unsigned int virq)
   176	{
   177		irq_set_chip_and_handler(virq, NULL, NULL);
   178	}
   179	
   180	static const struct irq_domain_ops lpc32xx_irq_domain_ops = {
   181		.map    = lpc32xx_irq_domain_map,
   182		.unmap	= lpc32xx_irq_domain_unmap,
   183		.xlate  = irq_domain_xlate_twocell,
   184	};
   185	
   186	static int __init lpc32xx_of_ic_init(struct device_node *node,
   187					     struct device_node *parent)
   188	{
   189		struct lpc32xx_irq_chip *irqc;
   190		bool is_mic = of_device_is_compatible(node, "nxp,lpc3220-mic");
   191		const __be32 *reg = of_get_property(node, "reg", NULL);
   192		u32 parent_irq, i, addr = reg ? be32_to_cpu(*reg) : 0;
   193	
   194		irqc = kzalloc(sizeof(*irqc), GFP_KERNEL);
   195		if (!irqc)
   196			return -ENOMEM;
   197	
   198		irqc->addr = addr;
   199		irqc->base = of_iomap(node, 0);
   200		if (!irqc->base) {
   201			pr_err("%pOF: unable to map registers\n", node);
   202			kfree(irqc);
   203			return -EINVAL;
   204		}
   205	
   206		irqc->chip.irq_ack = lpc32xx_irq_ack;
   207		irqc->chip.irq_mask = lpc32xx_irq_mask;
   208		irqc->chip.irq_unmask = lpc32xx_irq_unmask;
   209		irqc->chip.irq_set_type = lpc32xx_irq_set_type;
 > 210		irqc->chip.irq_print_chip = lpc32xx_irq_print_chip;
   211	
   212		irqc->domain = irq_domain_add_linear(node, NR_LPC32XX_IC_IRQS,
 > 213						     &lpc32xx_irq_domain_ops, irqc);
   214		if (!irqc->domain) {
   215			pr_err("unable to add irq domain\n");
   216			iounmap(irqc->base);
   217			kfree(irqc);
   218			return -ENODEV;
   219		}
   220	
   221		if (is_mic) {
   222			lpc32xx_mic_irqc = irqc;
 > 223			set_handle_irq(lpc32xx_handle_irq);
   224		} else {
   225			for (i = 0; i < of_irq_count(node); i++) {
   226				parent_irq = irq_of_parse_and_map(node, i);
   227				if (parent_irq)
   228					irq_set_chained_handler_and_data(parent_irq,
 > 229							 lpc32xx_sic_handler, irqc);
   230			}
   231		}
   232	
   233		lpc32xx_ic_write(irqc, LPC32XX_INTC_MASK, 0x00);
   234		lpc32xx_ic_write(irqc, LPC32XX_INTC_POL,  0x00);
   235		lpc32xx_ic_write(irqc, LPC32XX_INTC_TYPE, 0x00);
   236	
   237		return 0;
   238	}
   239	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
