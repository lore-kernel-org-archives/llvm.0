Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137879DC;
	Thu,  5 Dec 2024 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366985; cv=none; b=V47SZ8gklS2+o3b9hNGk1fBy76mRz44XO063rRjuCSc2muTYVxUdK0I2zi+yhCEorfacBd1gdrpLmuZckj0GvGwFwV9Wb0YLnqe7Zq2WkMIQbWVxhbbu7bnrOmP68GmFWja0xHZuL7vDSGwXXv8Hjnwvf5yDqxTLE+vo4VCth8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366985; c=relaxed/simple;
	bh=JL7loctPblGCXYGwKsTLCX5haldDY591+xVlEjrSgO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrVd37euENoVn/jeDU3jprLbR2F6Lf+1BdSoKCURiV3a1eu4msJmOtnc5tLhDe/uy3CnlaJRH08XH5i4802T4fRdR7QdMwZSECHRy61Ej4mhnPdLcmh5oNy5bGCXavkw2Lb4eZ+6P2uJdrfQOBaXWsxxL1V5zIn+udayj91hPaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi1MXANu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi1MXANu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733366983; x=1764902983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JL7loctPblGCXYGwKsTLCX5haldDY591+xVlEjrSgO4=;
  b=Gi1MXANuaxJmXOifFHoAsHtD4bNtYyp0xJPNGofb3lNPqnmnrczviNGm
   qRTbA+jZFw5WQWU6D14WLFVYkPs6rqqQcYM/jUaPk9GrubFEUAosGtdN5
   utJTC73f578YAMoFF93BHvBroJpvZ4A9N/mWlGcgG5XeISIcys620vfZT
   NRf9PdLtOBBnaMB68KMClETW2oGXkte5uj36Q6r+42iEWyq2HmaIuudQv
   TIkH4kRfkblxdd06RxaLFfq0PgR03kbmBTjoP/bHxVzEHWryYQZHg2BrG
   vwsMRZVmiO07UuB9KSYrG1UjANv3iho01zdUUOTaetPUAIF0PQlGZ9t63
   A==;
X-CSE-ConnectionGUID: slJEGggVQ4yw1x/rBXe+kA==
X-CSE-MsgGUID: +S/iJKf4RsmC+9sQcDhzdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51073684"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51073684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 18:49:39 -0800
X-CSE-ConnectionGUID: 1i/Fq+lPTZmyDI66a3HwFA==
X-CSE-MsgGUID: AlExen+RTY6a2O4wFA0twQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98923948"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 18:49:37 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ1vq-0003hx-37;
	Thu, 05 Dec 2024 02:49:34 +0000
Date: Thu, 5 Dec 2024 10:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 2/4]
 drivers/irqchip/irq-ingenic-tcu.c:135:21: warning: shift count >= width of
 type
Message-ID: <202412051024.0dgRPoPN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   cc3b7ba41f14d666907c81d2b5079170659e37b1
commit: 6576e541fcc39fd4f68ddaf2e4851d7eb30c9791 [2/4] acpi/hmat / cxl: Add extended linear cache support for CXL
config: x86_64-buildonly-randconfig-001-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051024.0dgRPoPN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051024.0dgRPoPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051024.0dgRPoPN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-ingenic-tcu.c:9:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   include/linux/acpi.h:448:19: note: previous definition is here
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
>> drivers/irqchip/irq-ingenic-tcu.c:135:21: warning: shift count >= width of type [-Wshift-count-overflow]
     135 |         gc->wake_enabled = IRQ_MSK(32);
         |                            ^~~~~~~~~~~
   include/linux/irq.h:1225:41: note: expanded from macro 'IRQ_MSK'
    1225 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   drivers/irqchip/irq-ingenic-tcu.c:147:39: warning: shift count >= width of type [-Wshift-count-overflow]
     147 |         regmap_write(tcu->map, TCU_REG_TMSR, IRQ_MSK(32));
         |                                              ^~~~~~~~~~~
   include/linux/irq.h:1225:41: note: expanded from macro 'IRQ_MSK'
    1225 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   2 warnings and 1 error generated.


vim +135 drivers/irqchip/irq-ingenic-tcu.c

9536eba03ec7f64 Paul Cercueil 2019-07-24   @9  #include <linux/irqchip.h>
9536eba03ec7f64 Paul Cercueil 2019-07-24   10  #include <linux/irqchip/chained_irq.h>
9536eba03ec7f64 Paul Cercueil 2019-07-24   11  #include <linux/mfd/ingenic-tcu.h>
9536eba03ec7f64 Paul Cercueil 2019-07-24   12  #include <linux/mfd/syscon.h>
9536eba03ec7f64 Paul Cercueil 2019-07-24   13  #include <linux/of_irq.h>
9536eba03ec7f64 Paul Cercueil 2019-07-24   14  #include <linux/regmap.h>
9536eba03ec7f64 Paul Cercueil 2019-07-24   15  
9536eba03ec7f64 Paul Cercueil 2019-07-24   16  struct ingenic_tcu {
9536eba03ec7f64 Paul Cercueil 2019-07-24   17  	struct regmap *map;
9536eba03ec7f64 Paul Cercueil 2019-07-24   18  	struct clk *clk;
9536eba03ec7f64 Paul Cercueil 2019-07-24   19  	struct irq_domain *domain;
9536eba03ec7f64 Paul Cercueil 2019-07-24   20  	unsigned int nb_parent_irqs;
9536eba03ec7f64 Paul Cercueil 2019-07-24   21  	u32 parent_irqs[3];
9536eba03ec7f64 Paul Cercueil 2019-07-24   22  };
9536eba03ec7f64 Paul Cercueil 2019-07-24   23  
9536eba03ec7f64 Paul Cercueil 2019-07-24   24  static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
9536eba03ec7f64 Paul Cercueil 2019-07-24   25  {
9536eba03ec7f64 Paul Cercueil 2019-07-24   26  	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
9536eba03ec7f64 Paul Cercueil 2019-07-24   27  	struct irq_domain *domain = irq_desc_get_handler_data(desc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   28  	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
9536eba03ec7f64 Paul Cercueil 2019-07-24   29  	struct regmap *map = gc->private;
9536eba03ec7f64 Paul Cercueil 2019-07-24   30  	uint32_t irq_reg, irq_mask;
0859bbb07d06d13 Kees Cook     2021-12-15   31  	unsigned long bits;
9536eba03ec7f64 Paul Cercueil 2019-07-24   32  	unsigned int i;
9536eba03ec7f64 Paul Cercueil 2019-07-24   33  
9536eba03ec7f64 Paul Cercueil 2019-07-24   34  	regmap_read(map, TCU_REG_TFR, &irq_reg);
9536eba03ec7f64 Paul Cercueil 2019-07-24   35  	regmap_read(map, TCU_REG_TMR, &irq_mask);
9536eba03ec7f64 Paul Cercueil 2019-07-24   36  
9536eba03ec7f64 Paul Cercueil 2019-07-24   37  	chained_irq_enter(irq_chip, desc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   38  
9536eba03ec7f64 Paul Cercueil 2019-07-24   39  	irq_reg &= ~irq_mask;
0859bbb07d06d13 Kees Cook     2021-12-15   40  	bits = irq_reg;
9536eba03ec7f64 Paul Cercueil 2019-07-24   41  
0859bbb07d06d13 Kees Cook     2021-12-15   42  	for_each_set_bit(i, &bits, 32)
046a6ee2343bb26 Marc Zyngier  2021-05-04   43  		generic_handle_domain_irq(domain, i);
9536eba03ec7f64 Paul Cercueil 2019-07-24   44  
9536eba03ec7f64 Paul Cercueil 2019-07-24   45  	chained_irq_exit(irq_chip, desc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   46  }
9536eba03ec7f64 Paul Cercueil 2019-07-24   47  
9536eba03ec7f64 Paul Cercueil 2019-07-24   48  static void ingenic_tcu_gc_unmask_enable_reg(struct irq_data *d)
9536eba03ec7f64 Paul Cercueil 2019-07-24   49  {
9536eba03ec7f64 Paul Cercueil 2019-07-24   50  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
9536eba03ec7f64 Paul Cercueil 2019-07-24   51  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
9536eba03ec7f64 Paul Cercueil 2019-07-24   52  	struct regmap *map = gc->private;
9536eba03ec7f64 Paul Cercueil 2019-07-24   53  	u32 mask = d->mask;
9536eba03ec7f64 Paul Cercueil 2019-07-24   54  
9536eba03ec7f64 Paul Cercueil 2019-07-24   55  	irq_gc_lock(gc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   56  	regmap_write(map, ct->regs.ack, mask);
9536eba03ec7f64 Paul Cercueil 2019-07-24   57  	regmap_write(map, ct->regs.enable, mask);
9536eba03ec7f64 Paul Cercueil 2019-07-24   58  	*ct->mask_cache |= mask;
9536eba03ec7f64 Paul Cercueil 2019-07-24   59  	irq_gc_unlock(gc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   60  }
9536eba03ec7f64 Paul Cercueil 2019-07-24   61  
9536eba03ec7f64 Paul Cercueil 2019-07-24   62  static void ingenic_tcu_gc_mask_disable_reg(struct irq_data *d)
9536eba03ec7f64 Paul Cercueil 2019-07-24   63  {
9536eba03ec7f64 Paul Cercueil 2019-07-24   64  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
9536eba03ec7f64 Paul Cercueil 2019-07-24   65  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
9536eba03ec7f64 Paul Cercueil 2019-07-24   66  	struct regmap *map = gc->private;
9536eba03ec7f64 Paul Cercueil 2019-07-24   67  	u32 mask = d->mask;
9536eba03ec7f64 Paul Cercueil 2019-07-24   68  
9536eba03ec7f64 Paul Cercueil 2019-07-24   69  	irq_gc_lock(gc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   70  	regmap_write(map, ct->regs.disable, mask);
9536eba03ec7f64 Paul Cercueil 2019-07-24   71  	*ct->mask_cache &= ~mask;
9536eba03ec7f64 Paul Cercueil 2019-07-24   72  	irq_gc_unlock(gc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   73  }
9536eba03ec7f64 Paul Cercueil 2019-07-24   74  
9536eba03ec7f64 Paul Cercueil 2019-07-24   75  static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct irq_data *d)
9536eba03ec7f64 Paul Cercueil 2019-07-24   76  {
9536eba03ec7f64 Paul Cercueil 2019-07-24   77  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
9536eba03ec7f64 Paul Cercueil 2019-07-24   78  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
9536eba03ec7f64 Paul Cercueil 2019-07-24   79  	struct regmap *map = gc->private;
9536eba03ec7f64 Paul Cercueil 2019-07-24   80  	u32 mask = d->mask;
9536eba03ec7f64 Paul Cercueil 2019-07-24   81  
9536eba03ec7f64 Paul Cercueil 2019-07-24   82  	irq_gc_lock(gc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   83  	regmap_write(map, ct->regs.ack, mask);
9536eba03ec7f64 Paul Cercueil 2019-07-24   84  	regmap_write(map, ct->regs.disable, mask);
9536eba03ec7f64 Paul Cercueil 2019-07-24   85  	irq_gc_unlock(gc);
9536eba03ec7f64 Paul Cercueil 2019-07-24   86  }
9536eba03ec7f64 Paul Cercueil 2019-07-24   87  
9536eba03ec7f64 Paul Cercueil 2019-07-24   88  static int __init ingenic_tcu_irq_init(struct device_node *np,
9536eba03ec7f64 Paul Cercueil 2019-07-24   89  				       struct device_node *parent)
9536eba03ec7f64 Paul Cercueil 2019-07-24   90  {
9536eba03ec7f64 Paul Cercueil 2019-07-24   91  	struct irq_chip_generic *gc;
9536eba03ec7f64 Paul Cercueil 2019-07-24   92  	struct irq_chip_type *ct;
9536eba03ec7f64 Paul Cercueil 2019-07-24   93  	struct ingenic_tcu *tcu;
9536eba03ec7f64 Paul Cercueil 2019-07-24   94  	struct regmap *map;
9536eba03ec7f64 Paul Cercueil 2019-07-24   95  	unsigned int i;
9536eba03ec7f64 Paul Cercueil 2019-07-24   96  	int ret, irqs;
9536eba03ec7f64 Paul Cercueil 2019-07-24   97  
9536eba03ec7f64 Paul Cercueil 2019-07-24   98  	map = device_node_to_regmap(np);
9536eba03ec7f64 Paul Cercueil 2019-07-24   99  	if (IS_ERR(map))
9536eba03ec7f64 Paul Cercueil 2019-07-24  100  		return PTR_ERR(map);
9536eba03ec7f64 Paul Cercueil 2019-07-24  101  
9536eba03ec7f64 Paul Cercueil 2019-07-24  102  	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
9536eba03ec7f64 Paul Cercueil 2019-07-24  103  	if (!tcu)
9536eba03ec7f64 Paul Cercueil 2019-07-24  104  		return -ENOMEM;
9536eba03ec7f64 Paul Cercueil 2019-07-24  105  
9536eba03ec7f64 Paul Cercueil 2019-07-24  106  	tcu->map = map;
9536eba03ec7f64 Paul Cercueil 2019-07-24  107  
9536eba03ec7f64 Paul Cercueil 2019-07-24  108  	irqs = of_property_count_elems_of_size(np, "interrupts", sizeof(u32));
9536eba03ec7f64 Paul Cercueil 2019-07-24  109  	if (irqs < 0 || irqs > ARRAY_SIZE(tcu->parent_irqs)) {
9536eba03ec7f64 Paul Cercueil 2019-07-24  110  		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
9536eba03ec7f64 Paul Cercueil 2019-07-24  111  		ret = -EINVAL;
9536eba03ec7f64 Paul Cercueil 2019-07-24  112  		goto err_free_tcu;
9536eba03ec7f64 Paul Cercueil 2019-07-24  113  	}
9536eba03ec7f64 Paul Cercueil 2019-07-24  114  
9536eba03ec7f64 Paul Cercueil 2019-07-24  115  	tcu->nb_parent_irqs = irqs;
9536eba03ec7f64 Paul Cercueil 2019-07-24  116  
9536eba03ec7f64 Paul Cercueil 2019-07-24  117  	tcu->domain = irq_domain_add_linear(np, 32, &irq_generic_chip_ops,
9536eba03ec7f64 Paul Cercueil 2019-07-24  118  					    NULL);
9536eba03ec7f64 Paul Cercueil 2019-07-24  119  	if (!tcu->domain) {
9536eba03ec7f64 Paul Cercueil 2019-07-24  120  		ret = -ENOMEM;
9536eba03ec7f64 Paul Cercueil 2019-07-24  121  		goto err_free_tcu;
9536eba03ec7f64 Paul Cercueil 2019-07-24  122  	}
9536eba03ec7f64 Paul Cercueil 2019-07-24  123  
9536eba03ec7f64 Paul Cercueil 2019-07-24  124  	ret = irq_alloc_domain_generic_chips(tcu->domain, 32, 1, "TCU",
9536eba03ec7f64 Paul Cercueil 2019-07-24  125  					     handle_level_irq, 0,
9536eba03ec7f64 Paul Cercueil 2019-07-24  126  					     IRQ_NOPROBE | IRQ_LEVEL, 0);
9536eba03ec7f64 Paul Cercueil 2019-07-24  127  	if (ret) {
9536eba03ec7f64 Paul Cercueil 2019-07-24  128  		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
9536eba03ec7f64 Paul Cercueil 2019-07-24  129  		goto out_domain_remove;
9536eba03ec7f64 Paul Cercueil 2019-07-24  130  	}
9536eba03ec7f64 Paul Cercueil 2019-07-24  131  
9536eba03ec7f64 Paul Cercueil 2019-07-24  132  	gc = irq_get_domain_generic_chip(tcu->domain, 0);
9536eba03ec7f64 Paul Cercueil 2019-07-24  133  	ct = gc->chip_types;
9536eba03ec7f64 Paul Cercueil 2019-07-24  134  
9536eba03ec7f64 Paul Cercueil 2019-07-24 @135  	gc->wake_enabled = IRQ_MSK(32);

:::::: The code at line 135 was first introduced by commit
:::::: 9536eba03ec7f64fc65144b1323aef7c5e9aafcd irqchip: Add irq-ingenic-tcu driver

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
