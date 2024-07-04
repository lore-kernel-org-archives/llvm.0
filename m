Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE81A38EE;
	Thu,  4 Jul 2024 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089308; cv=none; b=Y/6fBla+lcS+cuG3ynp5LJ2EqxURcnt/4vgnkp+REAvmMP6JEgZFqTRFqR0EWv5ES2WXMx9KzLPCP2f50uMeKQfZPsaI564UbtWWcpmQhV8vvFpvSawBAbNIDYibXi0nZTgKwSR6Uc2lB8sX4h90ok1nQuHWzgBRw5E9QPp/ZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089308; c=relaxed/simple;
	bh=FG1lkIwlC763UgSJIvR6sEE/J2GMLe1QrmCmxxHy4H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fv3qFA0qNM1HI/D4y0YD6lTeK0l7Q1ui0c62FkB2FLZhLfJrQ1Ep9gNoautBzBu8j0AbYPbbdyHBwH9SwN9LUHS/ixkCHo25M5jRKsr5LZOeU2AvoPK7e6UqIMq5z0uJtptEytubNY9iL7Cx2hgQpSE9hsqnciE4XjVTfq7Uzvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/z/cPSL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/z/cPSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720089306; x=1751625306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FG1lkIwlC763UgSJIvR6sEE/J2GMLe1QrmCmxxHy4H0=;
  b=a/z/cPSLGS+IXlh4UjGzMveth+yTBXXO4EevkvPLGCkgV7yhjEv4wSkb
   lfgsz6JkJuI0ndpkC9nqnIJ+HlJvE1stJQmhwJG1W6CpHNsNoEL3srG8W
   dhLgNnKgTxvsWNnfQfiKyGo/uaO+wYpcnPRH9+Ifr5P5HSM9CylH9U+yK
   wbULXsT5LZACriKsGBII663gnVVuWGXLSaskATuEt8CQ000PQQ1LdtAdw
   7e9qih/4WXj0+6KOeDqV0Nreo0aCsJopzBc6bMuHbo6Gzz8ubWDrJP7jE
   VX479owy21QiCpj+GOp5asf+Lj1+K2iiOLIbD6Nek0ex+YXTDwwudmV17
   A==;
X-CSE-ConnectionGUID: mGYVRZ+ZTeOZMZxm+pLhOA==
X-CSE-MsgGUID: iWZX4r8LR/a9YY6gCwmG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17313163"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17313163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:35:06 -0700
X-CSE-ConnectionGUID: uWZ5uhi3RW6EnsqWcbxbXQ==
X-CSE-MsgGUID: 0MYzqnMnRjKmyuWNxhDckQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51425908"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2024 03:35:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPJnp-000Qs4-2U;
	Thu, 04 Jul 2024 10:35:01 +0000
Date: Thu, 4 Jul 2024 18:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:smmc_working_package 3/3]
 drivers/irqchip/irq-riscv-smmc.c:217:12: error: call to undeclared function
 'acpi_extract_package'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202407041850.T9QSEnn2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux smmc_working_package
head:   c5f4dcedbb148c0b500d39f8387e4488af669c4c
commit: c5f4dcedbb148c0b500d39f8387e4488af669c4c [3/3] Add SMMC driver package based.
config: riscv-randconfig-001-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041850.T9QSEnn2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041850.T9QSEnn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041850.T9QSEnn2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-riscv-smmc.c:12:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:48:40: warning: format specifies type 'int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      48 |                 pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
         |                               ~~                     ^~~~~~~~~~~~~~~~~~
         |                               %llu
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:48:60: warning: format specifies type 'unsigned long' but the argument has type 'void *' [-Wformat]
      48 |                 pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
         |                                       ~~~                                ^~~~~~~~~~~~
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:48:74: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      48 |                 pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
         |                                              ~~~                                       ^~~~~~~~~~~~~~~~~~~~
         |                                              %llx
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:104:23: warning: format specifies type 'int' but the argument has type 'irq_hw_number_t' (aka 'unsigned long') [-Wformat]
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |                                        ~~
         |                                        %lu
     104 |            __func__, d->irq, d->hwirq, msg->address_hi, msg->address_lo, msg->data);
         |                              ^~~~~~~~
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:104:33: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |                                                  ~~~
         |                                                  %x
     104 |            __func__, d->irq, d->hwirq, msg->address_hi, msg->address_lo, msg->data);
         |                                        ^~~~~~~~~~~~~~~
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:104:50: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |                                                              ~~~
         |                                                              %x
     104 |            __func__, d->irq, d->hwirq, msg->address_hi, msg->address_lo, msg->data);
         |                                                         ^~~~~~~~~~~~~~~
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:104:67: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     103 |         pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
         |                                                                       ~~~
         |                                                                       %x
     104 |            __func__, d->irq, d->hwirq, msg->address_hi, msg->address_lo, msg->data);
         |                                                                          ^~~~~~~~~
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:217:12: error: call to undeclared function 'acpi_extract_package'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     217 |                 status = acpi_extract_package(&(smmc_obj->package.elements[i]),
         |                          ^
   drivers/irqchip/irq-riscv-smmc.c:224:72: warning: format specifies type 'int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     224 |                 pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
         |                                                         ~~                           ^~~~~~~~~~~~~~~
         |                                                         %llu
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:224:89: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     224 |                 pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
         |                                                            ~~~                                        ^~~~~~~~~~~~~~~~~~
         |                                                            %llx
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/irqchip/irq-riscv-smmc.c:224:109: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     224 |                 pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
         |                                                                ~~~                                                        ^~~~~~~~~~~~~~~~~
         |                                                                %llx
   include/linux/printk.h:507:33: note: expanded from macro 'pr_err'
     507 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/irqchip/irq-riscv-smmc.c:284:2: error: call to undeclared function 'acpi_dev_clear_dependencies'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
         |         ^
   15 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RISCV_SMMC
   Depends on [n]: ACPI [=n] && RISCV [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/acpi_extract_package +217 drivers/irqchip/irq-riscv-smmc.c

    40	
    41	static struct smmc_dev_res *smmc_find_dres_for_gsi(struct smmc_data *data, int hwirq)
    42	{
    43		struct smmc_dev_res *devres = NULL;
    44		int gsi = data->gsi_base + hwirq;
    45	
    46		pr_err("data->gsi_base %d hwirq %d gsi %d\n", data->gsi_base, hwirq, gsi);
    47		list_for_each_entry(devres, &data->dev_res_list, list) {
  > 48			pr_err("gsino %d regs %lx ah %lx\n", devres->cfg->gsino, devres->regs, devres->cfg->addr_hi);
    49			if (gsi == devres->cfg->gsino)
    50				return devres;
    51		}
    52	
    53		if (!devres)
    54			pr_err("can't find a dev resource for gsi %d\n", hwirq);
    55	
    56		return NULL;
    57	}
    58	
    59	static void smmc_msi_irq_unmask(struct irq_data *d)
    60	{
    61		struct smmc_data *data = irq_data_get_irq_chip_data(d);
    62		struct smmc_dev_res *devres = smmc_find_dres_for_gsi(data, d->hwirq);
    63	
    64		if (!devres)
    65			return;
    66	
    67		irq_chip_unmask_parent(d);
    68		pr_err("%s: In \n", __func__);
    69		writel(1, devres->regs + devres->cfg->enable);
    70	}
    71	
    72	static void smmc_msi_irq_mask(struct irq_data *d)
    73	{
    74		struct smmc_data *data = irq_data_get_irq_chip_data(d);
    75		struct smmc_dev_res *devres = smmc_find_dres_for_gsi(data, d->hwirq);
    76	
    77		if (!devres)
    78			return;
    79	
    80		writel(0, devres->regs + devres->cfg->enable);
    81		irq_chip_mask_parent(d);
    82	}
    83	
    84	static int smmc_msi_irq_set_type(struct irq_data *d, unsigned int type)
    85	{
    86	    pr_err("%s: In type %d \n", __func__, type);
    87	
    88	    return 0;
    89	}
    90	
    91	static void smmc_msi_write_msg(struct irq_data *d, struct msi_msg *msg)
    92	{
    93		struct smmc_data *data = irq_data_get_irq_chip_data(d);
    94		struct smmc_dev_res *devres = smmc_find_dres_for_gsi(data, d->hwirq);
    95	
    96		if (!devres)
    97			return;
    98	
    99		//TODO: Remove this
   100		if (d->hwirq == 1)
   101			return;
   102	
   103		pr_err("%s: In d->irq %d hwirq %d msg_hi %lx msg_low %lx data %lx\n",
 > 104		   __func__, d->irq, d->hwirq, msg->address_hi, msg->address_lo, msg->data);
   105	
   106		writel(msg->address_lo, devres->regs + devres->cfg->addr_low);
   107		writel(msg->address_hi, devres->regs + devres->cfg->addr_hi);
   108		writel(msg->data, devres->regs + devres->cfg->msidata);
   109		pr_err("%s: regs.0 %x\n", __func__, readl(devres->regs + devres->cfg->addr_low));
   110		pr_err("%s: regs.1 %x\n", __func__, readl(devres->regs + devres->cfg->addr_hi));
   111		pr_err("%s: regs.2 %x\n", __func__, readl(devres->regs + devres->cfg->msidata));
   112		pr_err("%s: regs.3 %x\n", __func__, readl(devres->regs + devres->cfg->enable));
   113	}
   114	
   115	static void smmc_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
   116	{
   117		arg->desc = desc;
   118		arg->hwirq = (u32)desc->data.icookie.value;
   119	}
   120	
   121	static int smmc_msi_irqdomain_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
   122				       unsigned long *hwirq, unsigned int *type)
   123	{
   124		struct msi_domain_info *info = d->host_data;
   125		struct smmc_data *data = info->data;
   126	
   127	    	if (WARN_ON(fwspec->param_count < 2))
   128			return -EINVAL;
   129		if (WARN_ON(!fwspec->param[0]))
   130			return -EINVAL;
   131	
   132		/* For DT, gsi_base is always zero. */
   133		*hwirq = fwspec->param[0] - data->gsi_base;
   134		*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
   135	
   136		WARN_ON(*type == IRQ_TYPE_NONE);
   137	
   138		return 0;
   139	}
   140	
   141	static const struct msi_domain_template smmc_msi_template = {
   142		.chip = {
   143			.name			= "SMMC-MSI",
   144			.irq_mask		= smmc_msi_irq_mask,
   145			.irq_unmask		= smmc_msi_irq_unmask,
   146			.irq_set_type	= smmc_msi_irq_set_type,
   147			//.irq_eoi		= aplic_msi_irq_eoi,
   148	#ifdef CONFIG_SMP
   149			.irq_set_affinity	= irq_chip_set_affinity_parent,
   150	#endif
   151			.irq_write_msi_msg	= smmc_msi_write_msg,
   152			.flags			= IRQCHIP_SET_TYPE_MASKED |
   153						  IRQCHIP_SKIP_SET_WAKE |
   154						  IRQCHIP_MASK_ON_SUSPEND,
   155		},
   156	
   157		.ops = {
   158			.set_desc		= smmc_msi_set_desc,
   159			.msi_translate		= smmc_msi_irqdomain_translate,
   160		},
   161	
   162		.info = {
   163			.bus_token		= DOMAIN_BUS_WIRED_TO_MSI, //TODO: Check
   164			.flags			= MSI_FLAG_USE_DEV_FWNODE,
   165			//.handler		= handle_fasteoi_irq,
   166			//.handler_name		= "fasteoi",
   167		},
   168	};
   169	
   170	static int smmc_parse_package_resource(struct platform_device *pdev, struct smmc_data *data)
   171	{
   172		struct device *dev = &pdev->dev;
   173		int result = -EFAULT;
   174		acpi_status status = AE_OK;
   175		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
   176		union acpi_object *smmc_obj = NULL;
   177		struct acpi_buffer format = {sizeof("NNNNN"), "NNNNN"};
   178		struct acpi_buffer state = {0, NULL};
   179		struct smmc_dev_res *res;
   180		int i;
   181	
   182		struct acpi_handle *handle = ACPI_HANDLE_FWNODE(dev->fwnode);
   183	
   184		status = acpi_evaluate_object_typed(handle, "CFGN", NULL,
   185						    &buffer, ACPI_TYPE_PACKAGE);
   186		if (status == AE_NOT_FOUND)
   187			return 0;
   188		if (ACPI_FAILURE(status))
   189			return -ENODEV;
   190	
   191		smmc_obj = buffer.pointer;
   192		if (!smmc_obj || smmc_obj->package.count != 2) {
   193			pr_err("Invalid SMMC data\n");
   194			goto end;
   195		}
   196	
   197		pr_err("%s: package count %d\n", __func__, smmc_obj->package.count);
   198	
   199		for (i = 0; i < smmc_obj->package.count; i++) {
   200			res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
   201			if (!res)
   202				goto end_nomem;
   203			res->cfg = devm_kzalloc(dev, sizeof(struct smmc_dev_cfg), GFP_KERNEL);
   204			if (!res->cfg)
   205				goto end_nomem;
   206	
   207			res->regs = devm_platform_ioremap_resource(pdev, i);
   208			if (IS_ERR(res->regs)) {
   209				result = PTR_ERR(res->regs);
   210				//TODO: Free up the list/memory for cfg
   211				goto end;
   212			}
   213	
   214			state.length = sizeof(struct smmc_dev_cfg);
   215			state.pointer = res->cfg;
   216	
 > 217			status = acpi_extract_package(&(smmc_obj->package.elements[i]),
   218					      &format, &state);
   219			if (ACPI_FAILURE(status)) {
   220				pr_err("Invalid SMMC CFG %d\n", status);
   221				goto end;
   222			}
   223	
   224			pr_err("%s: smmc_obj data package i %d: %d %lx %lx \n", __func__, i, res->cfg->gsino, res->cfg->addr_low, res->cfg->addr_hi);
   225			list_add(&res->list, &data->dev_res_list);
   226		}
   227		result = 0;
   228	
   229	end_nomem:
   230		result = -ENOMEM;
   231	end:
   232		kfree(buffer.pointer);
   233		return result;
   234	}
   235	
   236	static int smmc_probe(struct platform_device *pdev)
   237	{
   238		struct device *dev = &pdev->dev;
   239		int rc = 0;
   240	    	const struct imsic_global_config *imsic_global;
   241		struct irq_domain *msi_domain;
   242		struct smmc_data *data;
   243	
   244		/* SMMC device is only valid for ACPI supported platforms */
   245		if (acpi_disabled)
   246			return -ENODEV;
   247	
   248		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   249		if (!data)
   250			return -ENOMEM;
   251	
   252		data->dev = dev;
   253		INIT_LIST_HEAD(&data->dev_res_list);
   254	
   255	    	rc = riscv_acpi_get_gsi_info(dev->fwnode, &data->gsi_base, &data->id,
   256						     &data->nr_irqs, NULL);
   257		if (rc) {
   258			dev_err(dev, "failed to find GSI mapping\n");
   259			return rc;
   260		}
   261	
   262		smmc_parse_package_resource(pdev, data);
   263		//TODO: Setup any initial state of the device and enable MSI delivery
   264	
   265		imsic_global = imsic_get_global_config();
   266		if (!imsic_global) {
   267			dev_err(dev, "IMSIC global config not found\n");
   268			return -ENODEV;
   269		}
   270	
   271		if (!dev_get_msi_domain(dev)) {
   272			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
   273								DOMAIN_BUS_PLATFORM_MSI);
   274				if (msi_domain)
   275					dev_set_msi_domain(dev, msi_domain);
   276		}
   277	
   278		if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN, &smmc_msi_template,
   279							data->nr_irqs + 1, data, data)) {
   280			dev_err(dev, "failed to create MSI irq domain\n");
   281			return -ENOMEM;
   282		}
   283	
 > 284		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
   285	
   286		return rc;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
