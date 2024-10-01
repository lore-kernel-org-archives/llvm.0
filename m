Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E181CCB2E;
	Tue,  1 Oct 2024 19:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811163; cv=none; b=aQEOGNQn5Jsx3mMpGh7QnUdfL2kyXf+O8o1GnE3VDSeOQhJRfoauY4tcgm9E5okdKHDAX9+z3aEzhw4N7SiZBp7/On5Z3cPbukWlvmgBDmk6Qld+V0moeZsNmCDzkfw0cRQsHHyH+O1n7H6KOd68L9K1ne/CoQG1ESRpSo75GeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811163; c=relaxed/simple;
	bh=6KrP12zfjaP1XH/L+ECfgoddch2uxz4T19/v8DCZZ2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXQWK1KugUSdiAT0OE3tHhWxd7Vamto/NeFWtQ4g1XyfHNJ36v6NjomR7rFYt7Tebn0suaXnuiZIz/I/e0ZPuwHybJ1PlR/B5j2HxXfzPqxfOuT9JEzOoOnD7gaJz8u9kVpAZmm5WDk+2jEHIB5dDbIFwanI3A0yVjJiJkZHH84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqsCrTe6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqsCrTe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727811161; x=1759347161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KrP12zfjaP1XH/L+ECfgoddch2uxz4T19/v8DCZZ2A=;
  b=IqsCrTe64tQ7ud0yYzMSSjs5579upjd1613Adv3pTWIb1i1LRoqZeAdx
   2PVUQqk/2RI9MFVy7ax+jkbvvMRQLZqmMgAsCLVtEIRwPRLO8TfsXDtB0
   +XdDySMKxkWt8TgVxaG8CQOsY+tsdYo0dYP6Telnqdd9GDuXVI1/hO68O
   CbrKEDRZ80rDhYKSkFvhRkLuyizt4GSQ7epQYG6V3kncGA7QMAO2T4zvP
   /iD5MTJT6jsNMdCbDQNuE5InA20bJRtXmSsHZY94GMId7QzC/J3gcKeoc
   1IFKS/QnYwYZWYlgQ3adeuvlzcnmzAIQ8jnHS21zFLrf4Y2Gn50a7WMJb
   A==;
X-CSE-ConnectionGUID: vIxXaM8UTaiqUN3ciWJtHw==
X-CSE-MsgGUID: y8S5qlfDQ2uCTXNyb4uZeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27122929"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27122929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 12:32:39 -0700
X-CSE-ConnectionGUID: wtz4I1g6TX2ZGvOmFpzlCg==
X-CSE-MsgGUID: FrHd4NvsS0OTaiXArQdYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="74573039"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2024 12:32:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svibr-000R6H-2o;
	Tue, 01 Oct 2024 19:32:35 +0000
Date: Wed, 2 Oct 2024 03:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: ObiKeahloa <63236194+ObiKeahloa@users.noreply.github.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/329 2/2] drivers/gpio/gpio-macsmc.c:360:65: warning:
 expression result unused
Message-ID: <202410020320.5jmuhtXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/329
head:   6abdb8e437d3e97f886f07131659d40379c912bd
commit: 6abdb8e437d3e97f886f07131659d40379c912bd [2/2] Update gpio-macsmc.c
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410020320.5jmuhtXL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020320.5jmuhtXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020320.5jmuhtXL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-macsmc.c:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpio-macsmc.c:12:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpio/gpio-macsmc.c:12:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpio/gpio-macsmc.c:12:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpio/gpio-macsmc.c:360:65: warning: expression result unused [-Wunused-value]
     360 |         smcgp->ic.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED, IRQCHIP_MASK_ON_SUSPEND;
         |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +360 drivers/gpio/gpio-macsmc.c

   312	
   313	static int macsmc_gpio_probe(struct platform_device *pdev)
   314	{
   315		struct macsmc_gpio *smcgp;
   316		struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
   317		smc_key key;
   318		int ret;
   319	
   320		smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
   321		if (!smcgp)
   322			return -ENOMEM;
   323	
   324		pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");
   325	
   326		smcgp->dev = &pdev->dev;
   327		smcgp->smc = smc;
   328		smcgp->first_index = apple_smc_find_first_key_index(smc, SMC_KEY(gP00));
   329	
   330		if (smcgp->first_index >= apple_smc_get_key_count(smc))
   331			return -ENODEV;
   332	
   333		ret = apple_smc_get_key_by_index(smc, smcgp->first_index, &key);
   334		if (ret < 0)
   335			return ret;
   336	
   337		if (key > macsmc_gpio_key(MAX_GPIO - 1))
   338			return -ENODEV;
   339	
   340		dev_info(smcgp->dev, "First GPIO key: %p4ch\n", &key);
   341	
   342		smcgp->gc.label = "macsmc-pmu-gpio";
   343		smcgp->gc.owner = THIS_MODULE;
   344		smcgp->gc.get = macsmc_gpio_get;
   345		smcgp->gc.set = macsmc_gpio_set;
   346		smcgp->gc.get_direction = macsmc_gpio_get_direction;
   347		smcgp->gc.init_valid_mask = macsmc_gpio_init_valid_mask;
   348		smcgp->gc.can_sleep = true;
   349		smcgp->gc.ngpio = MAX_GPIO;
   350		smcgp->gc.base = -1;
   351		smcgp->gc.parent = &pdev->dev;
   352	
   353		smcgp->ic.name = "macsmc-pmu-gpio";
   354		smcgp->ic.irq_mask = macsmc_gpio_irq_disable;
   355		smcgp->ic.irq_unmask = macsmc_gpio_irq_enable;
   356		smcgp->ic.irq_set_type = macsmc_gpio_irq_set_type;
   357		smcgp->ic.irq_bus_lock = macsmc_gpio_irq_bus_lock;
   358		smcgp->ic.irq_bus_sync_unlock = macsmc_gpio_irq_bus_sync_unlock;
   359		smcgp->ic.irq_set_type = macsmc_gpio_irq_set_type;
 > 360		smcgp->ic.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED, IRQCHIP_MASK_ON_SUSPEND;
   361	
   362		smcgp->gc.irq.chip = &smcgp->ic;
   363		smcgp->gc.irq.parent_handler = NULL;
   364		smcgp->gc.irq.num_parents = 0;
   365		smcgp->gc.irq.parents = NULL;
   366		smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
   367		smcgp->gc.irq.handler = handle_simple_irq;
   368	
   369		mutex_init(&smcgp->irq_mutex);
   370	
   371		smcgp->nb.notifier_call = macsmc_gpio_event;
   372		apple_smc_register_notifier(smc, &smcgp->nb);
   373	
   374		return devm_gpiochip_add_data(&pdev->dev, &smcgp->gc, smcgp);
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
