Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D327E9;
	Fri, 12 May 2023 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683862198; x=1715398198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jp9KU1gqL0XDJ+c8CiqSsxELyhOji4trv48ES8DgvAk=;
  b=Fu9NuA6dEqyJawS1cBx5E21dFe+cJwyUrq1xJR7sqwj6HcP+ImcnCT+J
   t9q/kQYkaqZq1T701bj2UNZe9n7gd3faihxv2N46I8bnK4ZaRI1Nci5oD
   Laen5hkxcIxHc+spToatgH0SJdgF11Kxj2l+VMXcB0BubPbFwbfsbCElw
   7s3nKn4aAb95lxf8hh/OVZqdQNSKhIEOciTibUyeGBfcHt2WLqG5JGfuI
   EESx9YFW8SGKClhxngPjv1DF3ClQzgIyhGHC73emotESS4V4qZEtgF0Q0
   XJ4GCX8hcoaAloc5Qm63XlUs3stGmZgF98R0sTbFgrzy69UnmFYFMglzZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348188111"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="348188111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 20:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650477226"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650477226"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 May 2023 20:29:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxJTK-0004SA-0b;
	Fri, 12 May 2023 03:29:34 +0000
Date: Fri, 12 May 2023 11:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 8/30] drivers/irqchip/irq-ingenic-tcu.c:135:21:
 warning: shift count >= width of type
Message-ID: <202305121105.e73DdSNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 7d709841b48071e203642a18aef6b5e7ff850fe4 [8/30] acpi: tables: Add CDAT table parsing support
config: powerpc-randconfig-r001-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121105.e73DdSNe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=7d709841b48071e203642a18aef6b5e7ff850fe4
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 7d709841b48071e203642a18aef6b5e7ff850fe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121105.e73DdSNe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-ingenic-tcu.c:9:
   In file included from include/linux/irqchip.h:14:
   include/linux/acpi.h:1540:49: warning: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Wvisibility]
           struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
                                                          ^
   include/linux/acpi.h:1547:6: error: unknown type name 'acpi_tbl_entry_handler_arg'
                             acpi_tbl_entry_handler_arg handler, void *arg,
                             ^
>> drivers/irqchip/irq-ingenic-tcu.c:135:21: warning: shift count >= width of type [-Wshift-count-overflow]
           gc->wake_enabled = IRQ_MSK(32);
                              ^~~~~~~~~~~
   include/linux/irq.h:1193:41: note: expanded from macro 'IRQ_MSK'
   #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
                                           ^  ~~~
   drivers/irqchip/irq-ingenic-tcu.c:147:39: warning: shift count >= width of type [-Wshift-count-overflow]
           regmap_write(tcu->map, TCU_REG_TMSR, IRQ_MSK(32));
                                                ^~~~~~~~~~~
   include/linux/irq.h:1193:41: note: expanded from macro 'IRQ_MSK'
   #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
                                           ^  ~~~
   3 warnings and 1 error generated.


vim +135 drivers/irqchip/irq-ingenic-tcu.c

9536eba03ec7f6 Paul Cercueil 2019-07-24   @9  #include <linux/irqchip.h>
9536eba03ec7f6 Paul Cercueil 2019-07-24   10  #include <linux/irqchip/chained_irq.h>
9536eba03ec7f6 Paul Cercueil 2019-07-24   11  #include <linux/mfd/ingenic-tcu.h>
9536eba03ec7f6 Paul Cercueil 2019-07-24   12  #include <linux/mfd/syscon.h>
9536eba03ec7f6 Paul Cercueil 2019-07-24   13  #include <linux/of_irq.h>
9536eba03ec7f6 Paul Cercueil 2019-07-24   14  #include <linux/regmap.h>
9536eba03ec7f6 Paul Cercueil 2019-07-24   15  
9536eba03ec7f6 Paul Cercueil 2019-07-24   16  struct ingenic_tcu {
9536eba03ec7f6 Paul Cercueil 2019-07-24   17  	struct regmap *map;
9536eba03ec7f6 Paul Cercueil 2019-07-24   18  	struct clk *clk;
9536eba03ec7f6 Paul Cercueil 2019-07-24   19  	struct irq_domain *domain;
9536eba03ec7f6 Paul Cercueil 2019-07-24   20  	unsigned int nb_parent_irqs;
9536eba03ec7f6 Paul Cercueil 2019-07-24   21  	u32 parent_irqs[3];
9536eba03ec7f6 Paul Cercueil 2019-07-24   22  };
9536eba03ec7f6 Paul Cercueil 2019-07-24   23  
9536eba03ec7f6 Paul Cercueil 2019-07-24   24  static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
9536eba03ec7f6 Paul Cercueil 2019-07-24   25  {
9536eba03ec7f6 Paul Cercueil 2019-07-24   26  	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
9536eba03ec7f6 Paul Cercueil 2019-07-24   27  	struct irq_domain *domain = irq_desc_get_handler_data(desc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   28  	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
9536eba03ec7f6 Paul Cercueil 2019-07-24   29  	struct regmap *map = gc->private;
9536eba03ec7f6 Paul Cercueil 2019-07-24   30  	uint32_t irq_reg, irq_mask;
0859bbb07d06d1 Kees Cook     2021-12-15   31  	unsigned long bits;
9536eba03ec7f6 Paul Cercueil 2019-07-24   32  	unsigned int i;
9536eba03ec7f6 Paul Cercueil 2019-07-24   33  
9536eba03ec7f6 Paul Cercueil 2019-07-24   34  	regmap_read(map, TCU_REG_TFR, &irq_reg);
9536eba03ec7f6 Paul Cercueil 2019-07-24   35  	regmap_read(map, TCU_REG_TMR, &irq_mask);
9536eba03ec7f6 Paul Cercueil 2019-07-24   36  
9536eba03ec7f6 Paul Cercueil 2019-07-24   37  	chained_irq_enter(irq_chip, desc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   38  
9536eba03ec7f6 Paul Cercueil 2019-07-24   39  	irq_reg &= ~irq_mask;
0859bbb07d06d1 Kees Cook     2021-12-15   40  	bits = irq_reg;
9536eba03ec7f6 Paul Cercueil 2019-07-24   41  
0859bbb07d06d1 Kees Cook     2021-12-15   42  	for_each_set_bit(i, &bits, 32)
046a6ee2343bb2 Marc Zyngier  2021-05-04   43  		generic_handle_domain_irq(domain, i);
9536eba03ec7f6 Paul Cercueil 2019-07-24   44  
9536eba03ec7f6 Paul Cercueil 2019-07-24   45  	chained_irq_exit(irq_chip, desc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   46  }
9536eba03ec7f6 Paul Cercueil 2019-07-24   47  
9536eba03ec7f6 Paul Cercueil 2019-07-24   48  static void ingenic_tcu_gc_unmask_enable_reg(struct irq_data *d)
9536eba03ec7f6 Paul Cercueil 2019-07-24   49  {
9536eba03ec7f6 Paul Cercueil 2019-07-24   50  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
9536eba03ec7f6 Paul Cercueil 2019-07-24   51  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
9536eba03ec7f6 Paul Cercueil 2019-07-24   52  	struct regmap *map = gc->private;
9536eba03ec7f6 Paul Cercueil 2019-07-24   53  	u32 mask = d->mask;
9536eba03ec7f6 Paul Cercueil 2019-07-24   54  
9536eba03ec7f6 Paul Cercueil 2019-07-24   55  	irq_gc_lock(gc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   56  	regmap_write(map, ct->regs.ack, mask);
9536eba03ec7f6 Paul Cercueil 2019-07-24   57  	regmap_write(map, ct->regs.enable, mask);
9536eba03ec7f6 Paul Cercueil 2019-07-24   58  	*ct->mask_cache |= mask;
9536eba03ec7f6 Paul Cercueil 2019-07-24   59  	irq_gc_unlock(gc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   60  }
9536eba03ec7f6 Paul Cercueil 2019-07-24   61  
9536eba03ec7f6 Paul Cercueil 2019-07-24   62  static void ingenic_tcu_gc_mask_disable_reg(struct irq_data *d)
9536eba03ec7f6 Paul Cercueil 2019-07-24   63  {
9536eba03ec7f6 Paul Cercueil 2019-07-24   64  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
9536eba03ec7f6 Paul Cercueil 2019-07-24   65  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
9536eba03ec7f6 Paul Cercueil 2019-07-24   66  	struct regmap *map = gc->private;
9536eba03ec7f6 Paul Cercueil 2019-07-24   67  	u32 mask = d->mask;
9536eba03ec7f6 Paul Cercueil 2019-07-24   68  
9536eba03ec7f6 Paul Cercueil 2019-07-24   69  	irq_gc_lock(gc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   70  	regmap_write(map, ct->regs.disable, mask);
9536eba03ec7f6 Paul Cercueil 2019-07-24   71  	*ct->mask_cache &= ~mask;
9536eba03ec7f6 Paul Cercueil 2019-07-24   72  	irq_gc_unlock(gc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   73  }
9536eba03ec7f6 Paul Cercueil 2019-07-24   74  
9536eba03ec7f6 Paul Cercueil 2019-07-24   75  static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct irq_data *d)
9536eba03ec7f6 Paul Cercueil 2019-07-24   76  {
9536eba03ec7f6 Paul Cercueil 2019-07-24   77  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
9536eba03ec7f6 Paul Cercueil 2019-07-24   78  	struct irq_chip_type *ct = irq_data_get_chip_type(d);
9536eba03ec7f6 Paul Cercueil 2019-07-24   79  	struct regmap *map = gc->private;
9536eba03ec7f6 Paul Cercueil 2019-07-24   80  	u32 mask = d->mask;
9536eba03ec7f6 Paul Cercueil 2019-07-24   81  
9536eba03ec7f6 Paul Cercueil 2019-07-24   82  	irq_gc_lock(gc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   83  	regmap_write(map, ct->regs.ack, mask);
9536eba03ec7f6 Paul Cercueil 2019-07-24   84  	regmap_write(map, ct->regs.disable, mask);
9536eba03ec7f6 Paul Cercueil 2019-07-24   85  	irq_gc_unlock(gc);
9536eba03ec7f6 Paul Cercueil 2019-07-24   86  }
9536eba03ec7f6 Paul Cercueil 2019-07-24   87  
9536eba03ec7f6 Paul Cercueil 2019-07-24   88  static int __init ingenic_tcu_irq_init(struct device_node *np,
9536eba03ec7f6 Paul Cercueil 2019-07-24   89  				       struct device_node *parent)
9536eba03ec7f6 Paul Cercueil 2019-07-24   90  {
9536eba03ec7f6 Paul Cercueil 2019-07-24   91  	struct irq_chip_generic *gc;
9536eba03ec7f6 Paul Cercueil 2019-07-24   92  	struct irq_chip_type *ct;
9536eba03ec7f6 Paul Cercueil 2019-07-24   93  	struct ingenic_tcu *tcu;
9536eba03ec7f6 Paul Cercueil 2019-07-24   94  	struct regmap *map;
9536eba03ec7f6 Paul Cercueil 2019-07-24   95  	unsigned int i;
9536eba03ec7f6 Paul Cercueil 2019-07-24   96  	int ret, irqs;
9536eba03ec7f6 Paul Cercueil 2019-07-24   97  
9536eba03ec7f6 Paul Cercueil 2019-07-24   98  	map = device_node_to_regmap(np);
9536eba03ec7f6 Paul Cercueil 2019-07-24   99  	if (IS_ERR(map))
9536eba03ec7f6 Paul Cercueil 2019-07-24  100  		return PTR_ERR(map);
9536eba03ec7f6 Paul Cercueil 2019-07-24  101  
9536eba03ec7f6 Paul Cercueil 2019-07-24  102  	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
9536eba03ec7f6 Paul Cercueil 2019-07-24  103  	if (!tcu)
9536eba03ec7f6 Paul Cercueil 2019-07-24  104  		return -ENOMEM;
9536eba03ec7f6 Paul Cercueil 2019-07-24  105  
9536eba03ec7f6 Paul Cercueil 2019-07-24  106  	tcu->map = map;
9536eba03ec7f6 Paul Cercueil 2019-07-24  107  
9536eba03ec7f6 Paul Cercueil 2019-07-24  108  	irqs = of_property_count_elems_of_size(np, "interrupts", sizeof(u32));
9536eba03ec7f6 Paul Cercueil 2019-07-24  109  	if (irqs < 0 || irqs > ARRAY_SIZE(tcu->parent_irqs)) {
9536eba03ec7f6 Paul Cercueil 2019-07-24  110  		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
9536eba03ec7f6 Paul Cercueil 2019-07-24  111  		ret = -EINVAL;
9536eba03ec7f6 Paul Cercueil 2019-07-24  112  		goto err_free_tcu;
9536eba03ec7f6 Paul Cercueil 2019-07-24  113  	}
9536eba03ec7f6 Paul Cercueil 2019-07-24  114  
9536eba03ec7f6 Paul Cercueil 2019-07-24  115  	tcu->nb_parent_irqs = irqs;
9536eba03ec7f6 Paul Cercueil 2019-07-24  116  
9536eba03ec7f6 Paul Cercueil 2019-07-24  117  	tcu->domain = irq_domain_add_linear(np, 32, &irq_generic_chip_ops,
9536eba03ec7f6 Paul Cercueil 2019-07-24  118  					    NULL);
9536eba03ec7f6 Paul Cercueil 2019-07-24  119  	if (!tcu->domain) {
9536eba03ec7f6 Paul Cercueil 2019-07-24  120  		ret = -ENOMEM;
9536eba03ec7f6 Paul Cercueil 2019-07-24  121  		goto err_free_tcu;
9536eba03ec7f6 Paul Cercueil 2019-07-24  122  	}
9536eba03ec7f6 Paul Cercueil 2019-07-24  123  
9536eba03ec7f6 Paul Cercueil 2019-07-24  124  	ret = irq_alloc_domain_generic_chips(tcu->domain, 32, 1, "TCU",
9536eba03ec7f6 Paul Cercueil 2019-07-24  125  					     handle_level_irq, 0,
9536eba03ec7f6 Paul Cercueil 2019-07-24  126  					     IRQ_NOPROBE | IRQ_LEVEL, 0);
9536eba03ec7f6 Paul Cercueil 2019-07-24  127  	if (ret) {
9536eba03ec7f6 Paul Cercueil 2019-07-24  128  		pr_crit("%s: Invalid 'interrupts' property\n", __func__);
9536eba03ec7f6 Paul Cercueil 2019-07-24  129  		goto out_domain_remove;
9536eba03ec7f6 Paul Cercueil 2019-07-24  130  	}
9536eba03ec7f6 Paul Cercueil 2019-07-24  131  
9536eba03ec7f6 Paul Cercueil 2019-07-24  132  	gc = irq_get_domain_generic_chip(tcu->domain, 0);
9536eba03ec7f6 Paul Cercueil 2019-07-24  133  	ct = gc->chip_types;
9536eba03ec7f6 Paul Cercueil 2019-07-24  134  
9536eba03ec7f6 Paul Cercueil 2019-07-24 @135  	gc->wake_enabled = IRQ_MSK(32);

:::::: The code at line 135 was first introduced by commit
:::::: 9536eba03ec7f64fc65144b1323aef7c5e9aafcd irqchip: Add irq-ingenic-tcu driver

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
