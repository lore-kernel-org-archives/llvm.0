Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5639315D3B;
	Tue, 27 Jan 2026 03:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769486016; cv=none; b=MqZU5gejCm0T+nVWDwNH9C7is2mnuzOBbu3I6EqmVyTCVqRB/wDp9DdkHijf9m+CKeE5OrbWzYxLpKStwloSmbWtPtR1+76IvdxVrwpt4QQPcIUtO8e4HWujQLjjLX/Z3yPjRyhYwx/YPjK4ZnbX1XR+e/P7VQdkN6Fa/aU277w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769486016; c=relaxed/simple;
	bh=uOARA0uWX3ym2/MPalgqH1VyrH7+csZVSCI8n8Zg7YI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kSg17fDnXjf4PYmHklqRIXuw/c/uZ6wLjzLwZcOwQtKWVc6C8BVg/cbakrjNzdYoMsRmRhov/EkfA7ofliXwslBYrzoCSs0B3/Qfr2ZN2WR942B9CnWZEd7VLrnc9THmlAMOPa14YDIJp8MiEaa8oEAjc10uHPlbTMe8mQiFu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDn0MaYI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDn0MaYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769486014; x=1801022014;
  h=date:from:to:cc:subject:message-id;
  bh=uOARA0uWX3ym2/MPalgqH1VyrH7+csZVSCI8n8Zg7YI=;
  b=TDn0MaYIPxKoz8FT+l0yteJa8QPZ/kA8USnO//2Hf2mBC9cJofGoFz+b
   jzlZszavgQzDLbfporqR0y5NqaaEdqq/VcoLFitEk9xRzzZkMN0CInzyb
   CKm6BXLsNo6PoMlq259zwZO7uSBDnw2zYufYDzeN0wTHQm3Hxnh8iisWv
   SXsCLx5SW6o4kS+lPtbnn3XKbh6xVCjTv0TVisLdH5cogONZyuSUpeoiq
   gIQyPMWJtZL8HTss1XxGzHCM3VrA/9wqAJjPqG5y3/UOIj/O9Imyg8Zbz
   pXngR5JJyMjGjiLaEmFwQu5wc24JYm6DH7B85KE6vcZGSBplpQDIrXRGo
   w==;
X-CSE-ConnectionGUID: cbwhB3WLR52RYo/XwSn9/w==
X-CSE-MsgGUID: dosoihaXSrOmHaTnIGFwZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81782736"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81782736"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:53:34 -0800
X-CSE-ConnectionGUID: uzFUiKJrTeKqCAcxW0eDIA==
X-CSE-MsgGUID: Pa8fnSYmSLeoyTUALg0A/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="211968538"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jan 2026 19:53:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vka8v-00000000Xy4-0FUs;
	Tue, 27 Jan 2026 03:53:29 +0000
Date: Tue, 27 Jan 2026 11:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 drivers/irqchip/irq-stm32-exti.c:373:22: warning: shift count >= width of
 type
Message-ID: <202601271155.44Dl0PWg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: arm-randconfig-001-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271155.44Dl0PWg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271155.44Dl0PWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271155.44Dl0PWg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-stm32-exti.c:12:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^~~~~~~
>> drivers/irqchip/irq-stm32-exti.c:373:22: warning: shift count >= width of type [-Wshift-count-overflow]
     373 |                 gc->wake_enabled = IRQ_MSK(IRQS_PER_BANK);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:1215:41: note: expanded from macro 'IRQ_MSK'
    1215 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   1 warning and 1 error generated.


vim +373 drivers/irqchip/irq-stm32-exti.c

f9fc1745501e7b9 Ludovic Barre     2018-04-26  324  
f9fc1745501e7b9 Ludovic Barre     2018-04-26  325  static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
f9fc1745501e7b9 Ludovic Barre     2018-04-26  326  				  struct device_node *node)
f9fc1745501e7b9 Ludovic Barre     2018-04-26  327  {
f9fc1745501e7b9 Ludovic Barre     2018-04-26  328  	struct stm32_exti_host_data *host_data;
e072041688ca73f Alexandre TORGUE  2016-09-20  329  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
f9fc1745501e7b9 Ludovic Barre     2018-04-26  330  	int nr_irqs, ret, i;
e072041688ca73f Alexandre TORGUE  2016-09-20  331  	struct irq_chip_generic *gc;
e072041688ca73f Alexandre TORGUE  2016-09-20  332  	struct irq_domain *domain;
e072041688ca73f Alexandre TORGUE  2016-09-20  333  
f9fc1745501e7b9 Ludovic Barre     2018-04-26  334  	host_data = stm32_exti_host_init(drv_data, node);
4096165d55218a6 Dan Carpenter     2018-08-08  335  	if (!host_data)
4096165d55218a6 Dan Carpenter     2018-08-08  336  		return -ENOMEM;
e072041688ca73f Alexandre TORGUE  2016-09-20  337  
affdc0d1bdfa544 Jiri Slaby (SUSE  2025-03-19  338) 	domain = irq_domain_create_linear(of_fwnode_handle(node), drv_data->bank_nr * IRQS_PER_BANK,
e072041688ca73f Alexandre TORGUE  2016-09-20  339  					  &irq_exti_domain_ops, NULL);
e072041688ca73f Alexandre TORGUE  2016-09-20  340  	if (!domain) {
f9c75bca44d4754 Yangtao Li        2018-11-23  341  		pr_err("%pOFn: Could not register interrupt domain.\n",
f9c75bca44d4754 Yangtao Li        2018-11-23  342  		       node);
e072041688ca73f Alexandre TORGUE  2016-09-20  343  		ret = -ENOMEM;
e072041688ca73f Alexandre TORGUE  2016-09-20  344  		goto out_unmap;
e072041688ca73f Alexandre TORGUE  2016-09-20  345  	}
e072041688ca73f Alexandre TORGUE  2016-09-20  346  
6dd64ee17e04c39 Ludovic Barre     2017-11-06  347  	ret = irq_alloc_domain_generic_chips(domain, IRQS_PER_BANK, 1, "exti",
e072041688ca73f Alexandre TORGUE  2016-09-20  348  					     handle_edge_irq, clr, 0, 0);
e072041688ca73f Alexandre TORGUE  2016-09-20  349  	if (ret) {
e81f54c668d89e5 Rob Herring       2017-07-18  350  		pr_err("%pOF: Could not allocate generic interrupt chip.\n",
e81f54c668d89e5 Rob Herring       2017-07-18  351  		       node);
e072041688ca73f Alexandre TORGUE  2016-09-20  352  		goto out_free_domain;
e072041688ca73f Alexandre TORGUE  2016-09-20  353  	}
e072041688ca73f Alexandre TORGUE  2016-09-20  354  
f9fc1745501e7b9 Ludovic Barre     2018-04-26  355  	for (i = 0; i < drv_data->bank_nr; i++) {
f9fc1745501e7b9 Ludovic Barre     2018-04-26  356  		const struct stm32_exti_bank *stm32_bank;
f9fc1745501e7b9 Ludovic Barre     2018-04-26  357  		struct stm32_exti_chip_data *chip_data;
6dd64ee17e04c39 Ludovic Barre     2017-11-06  358  
f9fc1745501e7b9 Ludovic Barre     2018-04-26  359  		stm32_bank = drv_data->exti_banks[i];
cfbf9e497094dcf Fabien Dessenne   2019-04-17  360  		chip_data = stm32_exti_chip_init(host_data, i, node);
d9e2b19b0274406 Ludovic Barre     2018-04-26  361  
6dd64ee17e04c39 Ludovic Barre     2017-11-06  362  		gc = irq_get_domain_generic_chip(domain, i * IRQS_PER_BANK);
6dd64ee17e04c39 Ludovic Barre     2017-11-06  363  
f9fc1745501e7b9 Ludovic Barre     2018-04-26  364  		gc->reg_base = host_data->base;
e072041688ca73f Alexandre TORGUE  2016-09-20  365  		gc->chip_types->type = IRQ_TYPE_EDGE_BOTH;
be6230f0c2bd5d2 Ludovic Barre     2018-04-26  366  		gc->chip_types->chip.irq_ack = stm32_irq_ack;
e072041688ca73f Alexandre TORGUE  2016-09-20  367  		gc->chip_types->chip.irq_mask = irq_gc_mask_clr_bit;
e072041688ca73f Alexandre TORGUE  2016-09-20  368  		gc->chip_types->chip.irq_unmask = irq_gc_mask_set_bit;
e072041688ca73f Alexandre TORGUE  2016-09-20  369  		gc->chip_types->chip.irq_set_type = stm32_irq_set_type;
d9e2b19b0274406 Ludovic Barre     2018-04-26  370  		gc->chip_types->chip.irq_set_wake = irq_gc_set_wake;
d9e2b19b0274406 Ludovic Barre     2018-04-26  371  		gc->suspend = stm32_irq_suspend;
d9e2b19b0274406 Ludovic Barre     2018-04-26  372  		gc->resume = stm32_irq_resume;
d9e2b19b0274406 Ludovic Barre     2018-04-26 @373  		gc->wake_enabled = IRQ_MSK(IRQS_PER_BANK);
d9e2b19b0274406 Ludovic Barre     2018-04-26  374  
6dd64ee17e04c39 Ludovic Barre     2017-11-06  375  		gc->chip_types->regs.mask = stm32_bank->imr_ofst;
d9e2b19b0274406 Ludovic Barre     2018-04-26  376  		gc->private = (void *)chip_data;
6dd64ee17e04c39 Ludovic Barre     2017-11-06  377  	}
e072041688ca73f Alexandre TORGUE  2016-09-20  378  
e072041688ca73f Alexandre TORGUE  2016-09-20  379  	nr_irqs = of_irq_count(node);
e072041688ca73f Alexandre TORGUE  2016-09-20  380  	for (i = 0; i < nr_irqs; i++) {
e072041688ca73f Alexandre TORGUE  2016-09-20  381  		unsigned int irq = irq_of_parse_and_map(node, i);
e072041688ca73f Alexandre TORGUE  2016-09-20  382  
e072041688ca73f Alexandre TORGUE  2016-09-20  383  		irq_set_handler_data(irq, domain);
e072041688ca73f Alexandre TORGUE  2016-09-20  384  		irq_set_chained_handler(irq, stm32_irq_handler);
e072041688ca73f Alexandre TORGUE  2016-09-20  385  	}
e072041688ca73f Alexandre TORGUE  2016-09-20  386  
e072041688ca73f Alexandre TORGUE  2016-09-20  387  	return 0;
e072041688ca73f Alexandre TORGUE  2016-09-20  388  
e072041688ca73f Alexandre TORGUE  2016-09-20  389  out_free_domain:
e072041688ca73f Alexandre TORGUE  2016-09-20  390  	irq_domain_remove(domain);
e072041688ca73f Alexandre TORGUE  2016-09-20  391  out_unmap:
f9fc1745501e7b9 Ludovic Barre     2018-04-26  392  	iounmap(host_data->base);
f9fc1745501e7b9 Ludovic Barre     2018-04-26  393  	kfree(host_data->chips_data);
f9fc1745501e7b9 Ludovic Barre     2018-04-26  394  	kfree(host_data);
e072041688ca73f Alexandre TORGUE  2016-09-20  395  	return ret;
e072041688ca73f Alexandre TORGUE  2016-09-20  396  }
e072041688ca73f Alexandre TORGUE  2016-09-20  397  

:::::: The code at line 373 was first introduced by commit
:::::: d9e2b19b02744068b1cc16ca7d5249a62e789601 irqchip/stm32: Add suspend support

:::::: TO: Ludovic Barre <ludovic.barre@st.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
