Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA2378F4A;
	Thu, 22 May 2025 06:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894642; cv=none; b=DoalykDV7NWp24IgNoKMtkmioP8nJpG7ecBNA8DZlC2BXZXcSk9FSzUSjFp4oM19fyNerLp3Uhs9UvXZR63kbZBP4HbVllQEtdabZph+YPpHhha/Q3gBoJYJZ/kiYEx3C5npvJbK7bQU0TaRzUiqZb7LFkRh44l/MgPpaPIS8/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894642; c=relaxed/simple;
	bh=SyCSMyRMpu4SHJK7MQPa8Pi+hh3+RUU6EeCTNMsTHVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQTmONE0p9InRfMUH0AovL5L1DyW2A37iVzQ5TZ2rhxyt4JMbwlI9Gc1cXepm2FWAda6XxsNI3rD7L5g4z4q4YtjH4sNykCsXLugnRWoGnYCJMZI7S1dEyAmAavOxgNlQCitFZCDNaUCocyBsDNHwQOn0rmaZaUCxxIuFiVHXjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsAyguah; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsAyguah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747894640; x=1779430640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyCSMyRMpu4SHJK7MQPa8Pi+hh3+RUU6EeCTNMsTHVc=;
  b=jsAyguahb8THOpPvRlNsZ2EYjdDK0ffG7282LznwioFLK1qrSoc4Y8q5
   XTddxE96XrHV9IB/1K6nssehI2ybnKr5NCY5wKO5CJQoEBLhcSZygD0rh
   A1cbfr3T9wmGZvs2K0+mXpbInH1KJu3Z50RAWLzC3ttiddTbM+9QS2Wtq
   315CXE1eLQ12zJfl5tU7AenNQr6XGRkcng4DHUBAibSfwiRrHADSfcNEJ
   3IIIe2Ak4qZtZfvRKS8Xbbi1awjtH54QYIKHqMar3dnBJ0NHSc/ykbNGv
   g+DUqxJ49i7UNJ1I80VjjLCtdlIlK4BZkVBrSVMLIQrhKXhh3DHiWB4eO
   w==;
X-CSE-ConnectionGUID: l5Ew9VpcT+i8FfT/Nnn9Ug==
X-CSE-MsgGUID: iyY1Fe3NTeiWKK20/Trapg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53568095"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="53568095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:17:20 -0700
X-CSE-ConnectionGUID: hAHtUuleTl+v7snlus3qhA==
X-CSE-MsgGUID: tPsxc7rTTZiIYQvyK/GKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140205593"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2025 23:17:17 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzEx-0001El-1d;
	Thu, 22 May 2025 06:17:15 +0000
Date: Thu, 22 May 2025 14:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [broonie-ci:v8_20250509_mathieu_dubois_briand_add_support_for_max7360
 1/1] drivers/base/regmap/regmap-irq.c:914:74: error: too few arguments
 provided to function-like macro invocation
Message-ID: <202505221401.QiZZ8jvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v8_20250509_mathieu_dubois_briand_add_support_for_max7360
head:   f1d49f15e78ac1fa3092f1c0bbf56882345b349f
commit: f1d49f15e78ac1fa3092f1c0bbf56882345b349f [1/1] regmap: irq: Add support for chips without separate IRQ status
config: x86_64-randconfig-2001-20250515 (https://download.01.org/0day-ci/archive/20250522/202505221401.QiZZ8jvg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221401.QiZZ8jvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221401.QiZZ8jvg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/regmap/regmap-irq.c:914:74: error: too few arguments provided to function-like macro invocation
     914 |                 memcpy(d->prev_status_buf, d->status_buf, array_size(d->prev_status_buf));
         |                                                                                        ^
   include/linux/overflow.h:327:9: note: macro 'array_size' defined here
     327 | #define array_size(a, b)        size_mul(a, b)
         |         ^
>> drivers/base/regmap/regmap-irq.c:914:45: error: use of undeclared identifier 'array_size'
     914 |                 memcpy(d->prev_status_buf, d->status_buf, array_size(d->prev_status_buf));
         |                                                           ^
   2 errors generated.


vim +914 drivers/base/regmap/regmap-irq.c

   651	
   652	
   653	/**
   654	 * regmap_add_irq_chip_fwnode() - Use standard regmap IRQ controller handling
   655	 *
   656	 * @fwnode: The firmware node where the IRQ domain should be added to.
   657	 * @map: The regmap for the device.
   658	 * @irq: The IRQ the device uses to signal interrupts.
   659	 * @irq_flags: The IRQF_ flags to use for the primary interrupt.
   660	 * @irq_base: Allocate at specific IRQ number if irq_base > 0.
   661	 * @chip: Configuration for the interrupt controller.
   662	 * @data: Runtime data structure for the controller, allocated on success.
   663	 *
   664	 * Returns 0 on success or an errno on failure.
   665	 *
   666	 * In order for this to be efficient the chip really should use a
   667	 * register cache.  The chip driver is responsible for restoring the
   668	 * register values used by the IRQ controller over suspend and resume.
   669	 */
   670	int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
   671				       struct regmap *map, int irq,
   672				       int irq_flags, int irq_base,
   673				       const struct regmap_irq_chip *chip,
   674				       struct regmap_irq_chip_data **data)
   675	{
   676		struct regmap_irq_chip_data *d;
   677		int i;
   678		int ret = -ENOMEM;
   679		u32 reg;
   680	
   681		if (chip->num_regs <= 0)
   682			return -EINVAL;
   683	
   684		if (chip->clear_on_unmask && (chip->ack_base || chip->use_ack))
   685			return -EINVAL;
   686	
   687		if (chip->mask_base && chip->unmask_base && !chip->mask_unmask_non_inverted)
   688			return -EINVAL;
   689	
   690		for (i = 0; i < chip->num_irqs; i++) {
   691			if (chip->irqs[i].reg_offset % map->reg_stride)
   692				return -EINVAL;
   693			if (chip->irqs[i].reg_offset / map->reg_stride >=
   694			    chip->num_regs)
   695				return -EINVAL;
   696		}
   697	
   698		if (irq_base) {
   699			irq_base = irq_alloc_descs(irq_base, 0, chip->num_irqs, 0);
   700			if (irq_base < 0) {
   701				dev_warn(map->dev, "Failed to allocate IRQs: %d\n",
   702					 irq_base);
   703				return irq_base;
   704			}
   705		}
   706	
   707		d = kzalloc(sizeof(*d), GFP_KERNEL);
   708		if (!d)
   709			return -ENOMEM;
   710	
   711		if (chip->num_main_regs) {
   712			d->main_status_buf = kcalloc(chip->num_main_regs,
   713						     sizeof(*d->main_status_buf),
   714						     GFP_KERNEL);
   715	
   716			if (!d->main_status_buf)
   717				goto err_alloc;
   718		}
   719	
   720		d->status_buf = kcalloc(chip->num_regs, sizeof(*d->status_buf),
   721					GFP_KERNEL);
   722		if (!d->status_buf)
   723			goto err_alloc;
   724	
   725		if (chip->status_is_level) {
   726			d->prev_status_buf = kcalloc(chip->num_regs, sizeof(*d->prev_status_buf),
   727						     GFP_KERNEL);
   728			if (!d->prev_status_buf)
   729				goto err_alloc;
   730		}
   731	
   732		d->mask_buf = kcalloc(chip->num_regs, sizeof(*d->mask_buf),
   733				      GFP_KERNEL);
   734		if (!d->mask_buf)
   735			goto err_alloc;
   736	
   737		d->mask_buf_def = kcalloc(chip->num_regs, sizeof(*d->mask_buf_def),
   738					  GFP_KERNEL);
   739		if (!d->mask_buf_def)
   740			goto err_alloc;
   741	
   742		if (chip->wake_base) {
   743			d->wake_buf = kcalloc(chip->num_regs, sizeof(*d->wake_buf),
   744					      GFP_KERNEL);
   745			if (!d->wake_buf)
   746				goto err_alloc;
   747		}
   748	
   749		if (chip->type_in_mask) {
   750			d->type_buf_def = kcalloc(chip->num_regs,
   751						  sizeof(*d->type_buf_def), GFP_KERNEL);
   752			if (!d->type_buf_def)
   753				goto err_alloc;
   754	
   755			d->type_buf = kcalloc(chip->num_regs, sizeof(*d->type_buf), GFP_KERNEL);
   756			if (!d->type_buf)
   757				goto err_alloc;
   758		}
   759	
   760		if (chip->num_config_bases && chip->num_config_regs) {
   761			/*
   762			 * Create config_buf[num_config_bases][num_config_regs]
   763			 */
   764			d->config_buf = kcalloc(chip->num_config_bases,
   765						sizeof(*d->config_buf), GFP_KERNEL);
   766			if (!d->config_buf)
   767				goto err_alloc;
   768	
   769			for (i = 0; i < chip->num_config_bases; i++) {
   770				d->config_buf[i] = kcalloc(chip->num_config_regs,
   771							   sizeof(**d->config_buf),
   772							   GFP_KERNEL);
   773				if (!d->config_buf[i])
   774					goto err_alloc;
   775			}
   776		}
   777	
   778		d->irq_chip = regmap_irq_chip;
   779		d->irq_chip.name = chip->name;
   780		d->irq = irq;
   781		d->map = map;
   782		d->chip = chip;
   783		d->irq_base = irq_base;
   784	
   785		if (chip->irq_reg_stride)
   786			d->irq_reg_stride = chip->irq_reg_stride;
   787		else
   788			d->irq_reg_stride = 1;
   789	
   790		if (chip->get_irq_reg)
   791			d->get_irq_reg = chip->get_irq_reg;
   792		else
   793			d->get_irq_reg = regmap_irq_get_irq_reg_linear;
   794	
   795		if (regmap_irq_can_bulk_read_status(d)) {
   796			d->status_reg_buf = kmalloc_array(chip->num_regs,
   797							  map->format.val_bytes,
   798							  GFP_KERNEL);
   799			if (!d->status_reg_buf)
   800				goto err_alloc;
   801		}
   802	
   803		mutex_init(&d->lock);
   804	
   805		for (i = 0; i < chip->num_irqs; i++)
   806			d->mask_buf_def[chip->irqs[i].reg_offset / map->reg_stride]
   807				|= chip->irqs[i].mask;
   808	
   809		/* Mask all the interrupts by default */
   810		for (i = 0; i < chip->num_regs; i++) {
   811			d->mask_buf[i] = d->mask_buf_def[i];
   812	
   813			if (chip->handle_mask_sync) {
   814				ret = chip->handle_mask_sync(i, d->mask_buf_def[i],
   815							     d->mask_buf[i],
   816							     chip->irq_drv_data);
   817				if (ret)
   818					goto err_alloc;
   819			}
   820	
   821			if (chip->mask_base && !chip->handle_mask_sync) {
   822				reg = d->get_irq_reg(d, chip->mask_base, i);
   823				ret = regmap_update_bits(d->map, reg,
   824							 d->mask_buf_def[i],
   825							 d->mask_buf[i]);
   826				if (ret) {
   827					dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
   828						reg, ret);
   829					goto err_alloc;
   830				}
   831			}
   832	
   833			if (chip->unmask_base && !chip->handle_mask_sync) {
   834				reg = d->get_irq_reg(d, chip->unmask_base, i);
   835				ret = regmap_update_bits(d->map, reg,
   836						d->mask_buf_def[i], ~d->mask_buf[i]);
   837				if (ret) {
   838					dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
   839						reg, ret);
   840					goto err_alloc;
   841				}
   842			}
   843	
   844			if (!chip->init_ack_masked)
   845				continue;
   846	
   847			/* Ack masked but set interrupts */
   848			if (d->chip->no_status) {
   849				/* no status register so default to all active */
   850				d->status_buf[i] = UINT_MAX;
   851			} else {
   852				reg = d->get_irq_reg(d, d->chip->status_base, i);
   853				ret = regmap_read(map, reg, &d->status_buf[i]);
   854				if (ret != 0) {
   855					dev_err(map->dev, "Failed to read IRQ status: %d\n",
   856						ret);
   857					goto err_alloc;
   858				}
   859			}
   860	
   861			if (chip->status_invert)
   862				d->status_buf[i] = ~d->status_buf[i];
   863	
   864			if (d->status_buf[i] && (chip->ack_base || chip->use_ack)) {
   865				reg = d->get_irq_reg(d, d->chip->ack_base, i);
   866				if (chip->ack_invert)
   867					ret = regmap_write(map, reg,
   868						~(d->status_buf[i] & d->mask_buf[i]));
   869				else
   870					ret = regmap_write(map, reg,
   871						d->status_buf[i] & d->mask_buf[i]);
   872				if (chip->clear_ack) {
   873					if (chip->ack_invert && !ret)
   874						ret = regmap_write(map, reg, UINT_MAX);
   875					else if (!ret)
   876						ret = regmap_write(map, reg, 0);
   877				}
   878				if (ret != 0) {
   879					dev_err(map->dev, "Failed to ack 0x%x: %d\n",
   880						reg, ret);
   881					goto err_alloc;
   882				}
   883			}
   884		}
   885	
   886		/* Wake is disabled by default */
   887		if (d->wake_buf) {
   888			for (i = 0; i < chip->num_regs; i++) {
   889				d->wake_buf[i] = d->mask_buf_def[i];
   890				reg = d->get_irq_reg(d, d->chip->wake_base, i);
   891	
   892				if (chip->wake_invert)
   893					ret = regmap_update_bits(d->map, reg,
   894								 d->mask_buf_def[i],
   895								 0);
   896				else
   897					ret = regmap_update_bits(d->map, reg,
   898								 d->mask_buf_def[i],
   899								 d->wake_buf[i]);
   900				if (ret != 0) {
   901					dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
   902						reg, ret);
   903					goto err_alloc;
   904				}
   905			}
   906		}
   907	
   908		/* Store current levels */
   909		if (chip->status_is_level) {
   910			ret = read_irq_data(d);
   911			if (ret < 0)
   912				goto err_alloc;
   913	
 > 914			memcpy(d->prev_status_buf, d->status_buf, array_size(d->prev_status_buf));
   915		}
   916	
   917		ret = regmap_irq_create_domain(fwnode, irq_base, chip, d);
   918		if (ret)
   919			goto err_alloc;
   920	
   921		ret = request_threaded_irq(irq, NULL, regmap_irq_thread,
   922					   irq_flags | IRQF_ONESHOT,
   923					   chip->name, d);
   924		if (ret != 0) {
   925			dev_err(map->dev, "Failed to request IRQ %d for %s: %d\n",
   926				irq, chip->name, ret);
   927			goto err_domain;
   928		}
   929	
   930		*data = d;
   931	
   932		return 0;
   933	
   934	err_domain:
   935		/* Should really dispose of the domain but... */
   936	err_alloc:
   937		kfree(d->type_buf);
   938		kfree(d->type_buf_def);
   939		kfree(d->wake_buf);
   940		kfree(d->mask_buf_def);
   941		kfree(d->mask_buf);
   942		kfree(d->main_status_buf);
   943		kfree(d->status_buf);
   944		kfree(d->prev_status_buf);
   945		kfree(d->status_reg_buf);
   946		if (d->config_buf) {
   947			for (i = 0; i < chip->num_config_bases; i++)
   948				kfree(d->config_buf[i]);
   949			kfree(d->config_buf);
   950		}
   951		kfree(d);
   952		return ret;
   953	}
   954	EXPORT_SYMBOL_GPL(regmap_add_irq_chip_fwnode);
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
