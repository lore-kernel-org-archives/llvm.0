Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFA19EEBF;
	Mon, 24 Jun 2024 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719256889; cv=none; b=WagKNGb/u7w9R9m48BulwbDe6QYQ7XvO+yOsRjc/fnrTMfmYeGUsY2Ywjjp7QTAmg3bsJc8FJ8FQHjyp/pbDIfg+CqrSfmXPne3KqUtW4jIhzENaL7c84JjkieELK2LDGSglhDdE279m99JMSUfodUpAYLhvxnw3EalWJCihx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719256889; c=relaxed/simple;
	bh=rLaykuAc3vmVYbHc3IB2pbm0yn37absLrtirOsgKYMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGzSfk3SAzr1WnFR1OMvPtf9R67sedpyX10UguYgH7tU8ifAASIAZekDmrg9G8dX/4xIt7ZbIAh/ahHomA1UKsoayRQT5IjwMhvlj+O/QcuDmsBmQHe/tY6bPwiT1URiWF3LNf0KG4qrc+FNcCXfqT3Bn24km7rCU+smcQS1auM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQUnEPZ3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQUnEPZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719256887; x=1750792887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLaykuAc3vmVYbHc3IB2pbm0yn37absLrtirOsgKYMM=;
  b=iQUnEPZ3OUhcl4SXN9GAYo5SBVa2Vk3/oN1tIblrS7yk4Ui7hGxnZmsY
   RO7NWCcKOITJE770tgkA/mtrTbgAUlBJHKW5Dl6ULTDemI1gZ0lAnVp1s
   3nbg5V5waVW4eXiiegnWB7RGH8FSbCSWK/Jz8pL6UxRTgywHoiEvYbxnO
   mJ73vqlXga9Sn2i3hlkwP63TFm3Je3S63vMp97CzdGoOh7Z5aaILAHGU8
   Ec87UoQYpR7p2L7jeEJEmCk7FEG/0L65pgdSTMXpfgZmkJM+u/3oUZ8+3
   +oCjSvPH3iH6cfeCSPVYUHxBdwklofpJPjQ6MBYOFPKq+BLUMA6PmX6dV
   g==;
X-CSE-ConnectionGUID: w46KIR30QDCySq1h5Gv5hw==
X-CSE-MsgGUID: nv5ni7gYTUmPS76akYJOvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19149198"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="19149198"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 12:21:25 -0700
X-CSE-ConnectionGUID: 9QDSnTCqR6G/WFpBy7K97A==
X-CSE-MsgGUID: FowTUtupQGuJqz6S1EaoBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43833263"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2024 12:21:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLpFg-000DeX-2g;
	Mon, 24 Jun 2024 19:21:20 +0000
Date: Tue, 25 Jun 2024 03:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:irq/core 41/49] drivers/irqchip/irq-dw-apb-ictl.c:33:13: error:
 variable has incomplete type 'void'
Message-ID: <202406250323.bMydP9v3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jisheng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   f2605e1715dd28e8943b557453fed3a40421d3b5
commit: 7cc4f309c933ec5d64eea31066fe86bbf9e48819 [41/49] irqchip/dw-apb-ictl: Support building as module
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240625/202406250323.bMydP9v3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250323.bMydP9v3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250323.bMydP9v3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-dw-apb-ictl.c:33:13: error: variable has incomplete type 'void'
      33 | static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)
         |             ^
   arch/x86/include/asm/irq.h:19:21: note: expanded from macro '__irq_entry'
      19 | #define __irq_entry __invalid_section
         |                     ^
>> drivers/irqchip/irq-dw-apb-ictl.c:33:24: error: expected ';' after top level declarator
      33 | static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)
         |                        ^
         |                        ;
>> drivers/irqchip/irq-dw-apb-ictl.c:206:18: error: use of undeclared identifier 'dw_apb_ictl_handle_irq'
     206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
         |                                ^
   3 errors generated.


vim +/void +33 drivers/irqchip/irq-dw-apb-ictl.c

54a38440b84f893 Zhen Lei              2020-09-24   32  
54a38440b84f893 Zhen Lei              2020-09-24  @33  static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)
54a38440b84f893 Zhen Lei              2020-09-24   34  {
54a38440b84f893 Zhen Lei              2020-09-24   35  	struct irq_domain *d = dw_apb_ictl_irq_domain;
54a38440b84f893 Zhen Lei              2020-09-24   36  	int n;
54a38440b84f893 Zhen Lei              2020-09-24   37  
54a38440b84f893 Zhen Lei              2020-09-24   38  	for (n = 0; n < d->revmap_size; n += 32) {
54a38440b84f893 Zhen Lei              2020-09-24   39  		struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, n);
54a38440b84f893 Zhen Lei              2020-09-24   40  		u32 stat = readl_relaxed(gc->reg_base + APB_INT_FINALSTATUS_L);
54a38440b84f893 Zhen Lei              2020-09-24   41  
54a38440b84f893 Zhen Lei              2020-09-24   42  		while (stat) {
54a38440b84f893 Zhen Lei              2020-09-24   43  			u32 hwirq = ffs(stat) - 1;
54a38440b84f893 Zhen Lei              2020-09-24   44  
0953fb263714e1c Mark Rutland          2021-10-20   45  			generic_handle_domain_irq(d, hwirq);
54a38440b84f893 Zhen Lei              2020-09-24   46  			stat &= ~BIT(hwirq);
54a38440b84f893 Zhen Lei              2020-09-24   47  		}
54a38440b84f893 Zhen Lei              2020-09-24   48  	}
54a38440b84f893 Zhen Lei              2020-09-24   49  }
54a38440b84f893 Zhen Lei              2020-09-24   50  
d59f7d159891466 Zhen Lei              2020-09-24   51  static void dw_apb_ictl_handle_irq_cascaded(struct irq_desc *desc)
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   52  {
b66231183a8542d Thomas Gleixner       2015-07-06   53  	struct irq_domain *d = irq_desc_get_handler_data(desc);
b66231183a8542d Thomas Gleixner       2015-07-06   54  	struct irq_chip *chip = irq_desc_get_chip(desc);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   55  	int n;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   56  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   57  	chained_irq_enter(chip, desc);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   58  
b66231183a8542d Thomas Gleixner       2015-07-06   59  	for (n = 0; n < d->revmap_size; n += 32) {
b66231183a8542d Thomas Gleixner       2015-07-06   60  		struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, n);
b66231183a8542d Thomas Gleixner       2015-07-06   61  		u32 stat = readl_relaxed(gc->reg_base + APB_INT_FINALSTATUS_L);
b66231183a8542d Thomas Gleixner       2015-07-06   62  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   63  		while (stat) {
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   64  			u32 hwirq = ffs(stat) - 1;
046a6ee2343bb26 Marc Zyngier          2021-05-04   65  			generic_handle_domain_irq(d, gc->irq_base + hwirq);
b66231183a8542d Thomas Gleixner       2015-07-06   66  
d59f7d159891466 Zhen Lei              2020-09-24   67  			stat &= ~BIT(hwirq);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   68  		}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   69  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   70  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   71  	chained_irq_exit(chip, desc);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   72  }
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09   73  
54a38440b84f893 Zhen Lei              2020-09-24   74  static int dw_apb_ictl_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
54a38440b84f893 Zhen Lei              2020-09-24   75  				unsigned int nr_irqs, void *arg)
54a38440b84f893 Zhen Lei              2020-09-24   76  {
54a38440b84f893 Zhen Lei              2020-09-24   77  	int i, ret;
54a38440b84f893 Zhen Lei              2020-09-24   78  	irq_hw_number_t hwirq;
54a38440b84f893 Zhen Lei              2020-09-24   79  	unsigned int type = IRQ_TYPE_NONE;
54a38440b84f893 Zhen Lei              2020-09-24   80  	struct irq_fwspec *fwspec = arg;
54a38440b84f893 Zhen Lei              2020-09-24   81  
54a38440b84f893 Zhen Lei              2020-09-24   82  	ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
54a38440b84f893 Zhen Lei              2020-09-24   83  	if (ret)
54a38440b84f893 Zhen Lei              2020-09-24   84  		return ret;
54a38440b84f893 Zhen Lei              2020-09-24   85  
54a38440b84f893 Zhen Lei              2020-09-24   86  	for (i = 0; i < nr_irqs; i++)
54a38440b84f893 Zhen Lei              2020-09-24   87  		irq_map_generic_chip(domain, virq + i, hwirq + i);
54a38440b84f893 Zhen Lei              2020-09-24   88  
54a38440b84f893 Zhen Lei              2020-09-24   89  	return 0;
54a38440b84f893 Zhen Lei              2020-09-24   90  }
54a38440b84f893 Zhen Lei              2020-09-24   91  
54a38440b84f893 Zhen Lei              2020-09-24   92  static const struct irq_domain_ops dw_apb_ictl_irq_domain_ops = {
54a38440b84f893 Zhen Lei              2020-09-24   93  	.translate = irq_domain_translate_onecell,
54a38440b84f893 Zhen Lei              2020-09-24   94  	.alloc = dw_apb_ictl_irq_domain_alloc,
54a38440b84f893 Zhen Lei              2020-09-24   95  	.free = irq_domain_free_irqs_top,
54a38440b84f893 Zhen Lei              2020-09-24   96  };
54a38440b84f893 Zhen Lei              2020-09-24   97  
1655b0530d9502e Jisheng Zhang         2014-11-12   98  #ifdef CONFIG_PM
1655b0530d9502e Jisheng Zhang         2014-11-12   99  static void dw_apb_ictl_resume(struct irq_data *d)
1655b0530d9502e Jisheng Zhang         2014-11-12  100  {
1655b0530d9502e Jisheng Zhang         2014-11-12  101  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
1655b0530d9502e Jisheng Zhang         2014-11-12  102  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
1655b0530d9502e Jisheng Zhang         2014-11-12  103  
1655b0530d9502e Jisheng Zhang         2014-11-12  104  	irq_gc_lock(gc);
1655b0530d9502e Jisheng Zhang         2014-11-12  105  	writel_relaxed(~0, gc->reg_base + ct->regs.enable);
1655b0530d9502e Jisheng Zhang         2014-11-12  106  	writel_relaxed(*ct->mask_cache, gc->reg_base + ct->regs.mask);
1655b0530d9502e Jisheng Zhang         2014-11-12  107  	irq_gc_unlock(gc);
1655b0530d9502e Jisheng Zhang         2014-11-12  108  }
1655b0530d9502e Jisheng Zhang         2014-11-12  109  #else
1655b0530d9502e Jisheng Zhang         2014-11-12  110  #define dw_apb_ictl_resume	NULL
1655b0530d9502e Jisheng Zhang         2014-11-12  111  #endif /* CONFIG_PM */
1655b0530d9502e Jisheng Zhang         2014-11-12  112  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  113  static int __init dw_apb_ictl_init(struct device_node *np,
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  114  				   struct device_node *parent)
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  115  {
d59f7d159891466 Zhen Lei              2020-09-24  116  	const struct irq_domain_ops *domain_ops;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  117  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  118  	struct resource r;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  119  	struct irq_domain *domain;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  120  	struct irq_chip_generic *gc;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  121  	void __iomem *iobase;
d59f7d159891466 Zhen Lei              2020-09-24  122  	int ret, nrirqs, parent_irq, i;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  123  	u32 reg;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  124  
7cc4f309c933ec5 Jisheng Zhang         2024-06-14  125  	if (!parent && IS_BUILTIN(CONFIG_DW_APB_ICTL)) {
54a38440b84f893 Zhen Lei              2020-09-24  126  		/* Used as the primary interrupt controller */
54a38440b84f893 Zhen Lei              2020-09-24  127  		parent_irq = 0;
54a38440b84f893 Zhen Lei              2020-09-24  128  		domain_ops = &dw_apb_ictl_irq_domain_ops;
54a38440b84f893 Zhen Lei              2020-09-24  129  	} else {
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  130  		/* Map the parent interrupt for the chained handler */
d59f7d159891466 Zhen Lei              2020-09-24  131  		parent_irq = irq_of_parse_and_map(np, 0);
d59f7d159891466 Zhen Lei              2020-09-24  132  		if (parent_irq <= 0) {
e81f54c668d89e5 Rob Herring           2017-07-18  133  			pr_err("%pOF: unable to parse irq\n", np);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  134  			return -EINVAL;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  135  		}
54a38440b84f893 Zhen Lei              2020-09-24  136  		domain_ops = &irq_generic_chip_ops;
54a38440b84f893 Zhen Lei              2020-09-24  137  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  138  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  139  	ret = of_address_to_resource(np, 0, &r);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  140  	if (ret) {
e81f54c668d89e5 Rob Herring           2017-07-18  141  		pr_err("%pOF: unable to get resource\n", np);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  142  		return ret;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  143  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  144  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  145  	if (!request_mem_region(r.start, resource_size(&r), np->full_name)) {
e81f54c668d89e5 Rob Herring           2017-07-18  146  		pr_err("%pOF: unable to request mem region\n", np);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  147  		return -ENOMEM;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  148  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  149  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  150  	iobase = ioremap(r.start, resource_size(&r));
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  151  	if (!iobase) {
e81f54c668d89e5 Rob Herring           2017-07-18  152  		pr_err("%pOF: unable to map resource\n", np);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  153  		ret = -ENOMEM;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  154  		goto err_release;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  155  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  156  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  157  	/*
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  158  	 * DW IP can be configured to allow 2-64 irqs. We can determine
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  159  	 * the number of irqs supported by writing into enable register
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  160  	 * and look for bits not set, as corresponding flip-flops will
c5f48c0a7aa1a8c Ingo Molnar           2018-12-03  161  	 * have been removed by synthesis tool.
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  162  	 */
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  163  
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  164  	/* mask and enable all interrupts */
8876ce7d1cbaca4 Jisheng Zhang         2014-11-12  165  	writel_relaxed(~0, iobase + APB_INT_MASK_L);
8876ce7d1cbaca4 Jisheng Zhang         2014-11-12  166  	writel_relaxed(~0, iobase + APB_INT_MASK_H);
8876ce7d1cbaca4 Jisheng Zhang         2014-11-12  167  	writel_relaxed(~0, iobase + APB_INT_ENABLE_L);
8876ce7d1cbaca4 Jisheng Zhang         2014-11-12  168  	writel_relaxed(~0, iobase + APB_INT_ENABLE_H);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  169  
8876ce7d1cbaca4 Jisheng Zhang         2014-11-12  170  	reg = readl_relaxed(iobase + APB_INT_ENABLE_H);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  171  	if (reg)
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  172  		nrirqs = 32 + fls(reg);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  173  	else
8876ce7d1cbaca4 Jisheng Zhang         2014-11-12  174  		nrirqs = fls(readl_relaxed(iobase + APB_INT_ENABLE_L));
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  175  
d59f7d159891466 Zhen Lei              2020-09-24  176  	domain = irq_domain_add_linear(np, nrirqs, domain_ops, NULL);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  177  	if (!domain) {
e81f54c668d89e5 Rob Herring           2017-07-18  178  		pr_err("%pOF: unable to add irq domain\n", np);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  179  		ret = -ENOMEM;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  180  		goto err_unmap;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  181  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  182  
b66231183a8542d Thomas Gleixner       2015-07-06  183  	ret = irq_alloc_domain_generic_chips(domain, 32, 1, np->name,
b66231183a8542d Thomas Gleixner       2015-07-06  184  					     handle_level_irq, clr, 0,
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  185  					     IRQ_GC_INIT_MASK_CACHE);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  186  	if (ret) {
e81f54c668d89e5 Rob Herring           2017-07-18  187  		pr_err("%pOF: unable to alloc irq domain gc\n", np);
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  188  		goto err_unmap;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  189  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  190  
b66231183a8542d Thomas Gleixner       2015-07-06  191  	for (i = 0; i < DIV_ROUND_UP(nrirqs, 32); i++) {
b66231183a8542d Thomas Gleixner       2015-07-06  192  		gc = irq_get_domain_generic_chip(domain, i * 32);
b66231183a8542d Thomas Gleixner       2015-07-06  193  		gc->reg_base = iobase + i * APB_INT_BASE_OFFSET;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  194  		gc->chip_types[0].regs.mask = APB_INT_MASK_L;
1655b0530d9502e Jisheng Zhang         2014-11-12  195  		gc->chip_types[0].regs.enable = APB_INT_ENABLE_L;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  196  		gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  197  		gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
1655b0530d9502e Jisheng Zhang         2014-11-12  198  		gc->chip_types[0].chip.irq_resume = dw_apb_ictl_resume;
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  199  	}
350d71b94fc9ed4 Sebastian Hesselbarth 2013-09-09  200  
54a38440b84f893 Zhen Lei              2020-09-24  201  	if (parent_irq) {
d59f7d159891466 Zhen Lei              2020-09-24  202  		irq_set_chained_handler_and_data(parent_irq,
d59f7d159891466 Zhen Lei              2020-09-24  203  				dw_apb_ictl_handle_irq_cascaded, domain);
54a38440b84f893 Zhen Lei              2020-09-24  204  	} else {
54a38440b84f893 Zhen Lei              2020-09-24  205  		dw_apb_ictl_irq_domain = domain;
54a38440b84f893 Zhen Lei              2020-09-24 @206  		set_handle_irq(dw_apb_ictl_handle_irq);

:::::: The code at line 33 was first introduced by commit
:::::: 54a38440b84f8933b555c23273deca6a396f6708 irqchip/dw-apb-ictl: Add primary interrupt controller support

:::::: TO: Zhen Lei <thunder.leizhen@huawei.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
