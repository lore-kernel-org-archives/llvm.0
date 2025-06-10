Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137928B7C3;
	Tue, 10 Jun 2025 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549117; cv=none; b=hxSH5Hu0wjG60+2PIdoGadTZG633FPEdmTxjhZsO9j6pMweyh48h+7kcpfCwhjlsDdSbWLHNvgNc0RD4sIhuan0S7Cs2k6aRcJkps3oILocXvmDcoL43PCpCJVo0n2WqjTtAvYufI5Clhl1u/GvzimXWyqUwb92a+9HaDgY94Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549117; c=relaxed/simple;
	bh=f6gWw1H3YdJDzbM/ucy/WZCIlkiYQWHEKItuGu0xJfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ppc3yemHjE2iGY0ZckeelAC0fmROwaP+b2cjIBx14by+pfG+XaXskQ3rDzYyZl8lTBpUn3xQfAxytGcLaEOufwFA3h+Iv0H+KD7Vt6mG4Ae8NL5S6tWgClVB8EZoje7NBI+JHgUmJrNOrbPv4qE7ij73IslGN15fEAJd/iTGSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSaCXDN/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSaCXDN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549116; x=1781085116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6gWw1H3YdJDzbM/ucy/WZCIlkiYQWHEKItuGu0xJfM=;
  b=RSaCXDN/LvhL5UrORJvbdFW4oc6Q8Tnb4LYntJy/GsX6D/MfJR7Q4p2u
   h/mr/9Rt1beHgdnuIVwvdVAlpB+tnnzB2spwhrr4YLtMTVnb3KoYqVXkG
   bYNJeAcv/dmEYa1KCuRZSs+vJZ/LQo/H0wxwnoBr1+mNviuvLIIQeLoOf
   GypKq5In2K/JxGegTvp81VbRhoy1n6O2I3MfFBDVsVnI+sl6SXHLB/IHP
   I8+e6Ta2b7ABxDHIJDssZdxPm6lrjy7875wduMykjvF5eawsAt9v74QGr
   NHK74/683viYjPIuNfm32K/5KKNSFIVCuAyVR+wpYKsuqeYBmgut7SJ0X
   g==;
X-CSE-ConnectionGUID: rAfuj8z+RliD0QwDRmcnMg==
X-CSE-MsgGUID: 7MRJXAxKTwehc3JaUVcAdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="63002066"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="63002066"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:51:55 -0700
X-CSE-ConnectionGUID: 9VFHSgsrT5+avGYNJhd9ZA==
X-CSE-MsgGUID: tUp7FB70SqKGMPCrTnB7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147149673"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2025 02:51:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOve3-00084f-23;
	Tue, 10 Jun 2025 09:51:51 +0000
Date: Tue, 10 Jun 2025 17:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos 2/2] drivers/accel/ethos/ethos_drv.c:196:1:
 warning: unused label 'err_put_mod'
Message-ID: <202506101725.xvNUZtPD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos
head:   701683c5d514adf30a2a48ccd7c17124be2461b6
commit: 701683c5d514adf30a2a48ccd7c17124be2461b6 [2/2] accel: Add Arm Ethos stub driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250610/202506101725.xvNUZtPD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101725.xvNUZtPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101725.xvNUZtPD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/ethos/ethos_drv.c:196:1: warning: unused label 'err_put_mod' [-Wunused-label]
     196 | err_put_mod:
         | ^~~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:212:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     212 |         ETHOS_IOCTL(DEV_QUERY, bo_create, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:209:2: note: expanded from macro 'ETHOS_IOCTL'
     209 |         DRM_IOCTL_DEF_DRV(ETHOS_##n, ethos_ioctl_##func, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_ioctl.h:152:57: note: expanded from macro 'DRM_IOCTL_DEF_DRV'
     152 |         [DRM_IOCTL_NR(DRM_IOCTL_##ioctl) - DRM_COMMAND_BASE] = {        \
         |                                                                ^~~~~~~~~~
     153 |                 .cmd = DRM_IOCTL_##ioctl,                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 .func = _func,                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     155 |                 .flags = _flags,                                        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                 .name = #ioctl                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |         }
         |         ~
   drivers/accel/ethos/ethos_drv.c:211:2: note: previous initialization is here
     211 |         ETHOS_IOCTL(DEV_QUERY, dev_query, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:209:2: note: expanded from macro 'ETHOS_IOCTL'
     209 |         DRM_IOCTL_DEF_DRV(ETHOS_##n, ethos_ioctl_##func, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_ioctl.h:152:57: note: expanded from macro 'DRM_IOCTL_DEF_DRV'
     152 |         [DRM_IOCTL_NR(DRM_IOCTL_##ioctl) - DRM_COMMAND_BASE] = {        \
         |                                                                ^~~~~~~~~~
     153 |                 .cmd = DRM_IOCTL_##ioctl,                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 .func = _func,                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     155 |                 .flags = _flags,                                        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                 .name = #ioctl                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |         }
         |         ~
   drivers/accel/ethos/ethos_drv.c:213:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     213 |         ETHOS_IOCTL(DEV_QUERY, bo_mmap_offset, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:209:2: note: expanded from macro 'ETHOS_IOCTL'
     209 |         DRM_IOCTL_DEF_DRV(ETHOS_##n, ethos_ioctl_##func, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_ioctl.h:152:57: note: expanded from macro 'DRM_IOCTL_DEF_DRV'
     152 |         [DRM_IOCTL_NR(DRM_IOCTL_##ioctl) - DRM_COMMAND_BASE] = {        \
         |                                                                ^~~~~~~~~~
     153 |                 .cmd = DRM_IOCTL_##ioctl,                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 .func = _func,                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     155 |                 .flags = _flags,                                        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                 .name = #ioctl                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |         }
         |         ~
   drivers/accel/ethos/ethos_drv.c:212:2: note: previous initialization is here
     212 |         ETHOS_IOCTL(DEV_QUERY, bo_create, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:209:2: note: expanded from macro 'ETHOS_IOCTL'
     209 |         DRM_IOCTL_DEF_DRV(ETHOS_##n, ethos_ioctl_##func, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_ioctl.h:152:57: note: expanded from macro 'DRM_IOCTL_DEF_DRV'
     152 |         [DRM_IOCTL_NR(DRM_IOCTL_##ioctl) - DRM_COMMAND_BASE] = {        \
         |                                                                ^~~~~~~~~~
     153 |                 .cmd = DRM_IOCTL_##ioctl,                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                 .func = _func,                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     155 |                 .flags = _flags,                                        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                 .name = #ioctl                                          \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |         }
         |         ~
   drivers/accel/ethos/ethos_drv.c:341:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^
>> drivers/accel/ethos/ethos_drv.c:341:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     340 |                 "Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
         |                                         ~~~
         |                                         %d
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:342:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     340 |                 "Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
         |                                             ~~~
         |                                             %d
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     342 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:343:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     340 |                 "Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
         |                                                 ~~~
         |                                                 %d
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     342 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     343 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:344:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     340 |                 "Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
         |                                                           ~~~
         |                                                           %d
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     342 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     343 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     344 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:345:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     340 |                 "Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
         |                                                               ~~~
         |                                                               %d
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     342 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     343 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     344 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
     345 |                 FIELD_GET(ID_VER_MINOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:346:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     340 |                 "Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
         |                                                                                  ~~~
         |                                                                                  %d
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     342 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     343 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     344 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
     345 |                 FIELD_GET(ID_VER_MINOR_MASK, id),
     346 |                 FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   9 warnings and 1 error generated.


vim +/err_put_mod +196 drivers/accel/ethos/ethos_drv.c

   185	
   186	static int
   187	ethos_open(struct drm_device *ddev, struct drm_file *file)
   188	{
   189		int ret = 0;
   190	
   191		if (!try_module_get(THIS_MODULE))
   192			return -EINVAL;
   193	
   194		return 0;
   195	
 > 196	err_put_mod:
   197		module_put(THIS_MODULE);
   198		return ret;
   199	}
   200	
   201	static void
   202	ethos_postclose(struct drm_device *ddev, struct drm_file *file)
   203	{
   204		module_put(THIS_MODULE);
   205	}
   206	
   207	static const struct drm_ioctl_desc ethos_drm_driver_ioctls[] = {
   208	#define ETHOS_IOCTL(n, func, flags) \
   209		DRM_IOCTL_DEF_DRV(ETHOS_##n, ethos_ioctl_##func, flags)
   210	
   211		ETHOS_IOCTL(DEV_QUERY, dev_query, 0),
   212		ETHOS_IOCTL(DEV_QUERY, bo_create, 0),
   213		ETHOS_IOCTL(DEV_QUERY, bo_mmap_offset, 0),
   214	};
   215	
   216	DEFINE_DRM_ACCEL_FOPS(ethos_drm_driver_fops);
   217	
   218	/*
   219	 * Ethos driver version:
   220	 * - 1.0 - initial interface
   221	 */
   222	static const struct drm_driver ethos_drm_driver = {
   223		.driver_features = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
   224		.open = ethos_open,
   225		.postclose = ethos_postclose,
   226		.ioctls = ethos_drm_driver_ioctls,
   227		.num_ioctls = ARRAY_SIZE(ethos_drm_driver_ioctls),
   228		.fops = &ethos_drm_driver_fops,
   229		.name = "ethos",
   230		.desc = "Arm Ethos Accel driver",
   231		.major = 1,
   232		.minor = 0,
   233	
   234		.gem_create_object = ethos_gem_create_object,
   235	};
   236	
   237	static int ethos_device_resume(struct device *dev)
   238	{
   239		struct ethos_device *ethosdev = dev_get_drvdata(dev);
   240		int ret;
   241	
   242		ret = clk_prepare_enable(ethosdev->core_clk);
   243		if (ret)
   244			return ret;
   245	
   246		ret = clk_prepare_enable(ethosdev->apb_clk);
   247		if (ret)
   248			goto err_disable_core_clk;
   249	
   250		return 0;
   251	
   252	err_disable_core_clk:
   253		clk_disable_unprepare(ethosdev->core_clk);
   254		return ret;
   255	}
   256	
   257	static int ethos_device_suspend(struct device *dev)
   258	{
   259		struct ethos_device *ethosdev = dev_get_drvdata(dev);
   260	
   261		clk_disable_unprepare(ethosdev->apb_clk);
   262		clk_disable_unprepare(ethosdev->core_clk);
   263		return 0;
   264	}
   265	
   266	static int ethos_reset(struct ethos_device *ethosdev)
   267	{
   268		int ret;
   269		u32 reg;
   270	
   271		writel_relaxed(0x3, ethosdev->regs + NPU_REG_RESET);
   272	
   273		ret = readl_poll_timeout(ethosdev->regs + NPU_REG_STATUS, reg, !(reg & 0x4),
   274					 USEC_PER_MSEC, USEC_PER_SEC);
   275		if (ret)
   276			return ret;
   277	
   278		if ((readl_relaxed(ethosdev->regs + NPU_REG_PROT) & 0x3) != 0x3)
   279			return -EINVAL;
   280	
   281		// TODO AXI port config, defaults might work
   282	
   283		writel_relaxed(0x0, ethosdev->regs + NPU_BASEP(0));			// DRAM
   284		writel_relaxed(ethosdev->sramphys, ethosdev->regs + NPU_BASEP(1));	// SRAM
   285	
   286		memset(ethosdev->sram, 0, ethosdev->npu_info.sram_size);
   287	
   288		return 0;
   289	}
   290	
   291	static int ethos_sram_init(struct ethos_device *ethosdev)
   292	{
   293		ethosdev->npu_info.sram_size = 0;
   294	
   295		ethosdev->srampool = of_gen_pool_get(ethosdev->base.dev->of_node, "sram", 0);
   296		if (!ethosdev->srampool) {
   297			dev_err(ethosdev->base.dev, "sram pool not found\n");
   298			return -EPROBE_DEFER;
   299		}
   300		ethosdev->npu_info.sram_size = gen_pool_size(ethosdev->srampool);
   301	
   302		ethosdev->sram = (void __iomem *)gen_pool_dma_alloc(ethosdev->srampool,
   303								    ethosdev->npu_info.sram_size,
   304								    &ethosdev->sramphys);
   305		if (!ethosdev->sram) {
   306			dev_err(ethosdev->base.dev, "failed to allocate from TX pool\n");
   307			return -ENOMEM;
   308		}
   309	
   310		return 0;
   311	}
   312	
   313	static int ethos_init(struct ethos_device *ethosdev)
   314	{
   315		int ret;
   316		u32 id, config;
   317	
   318		ret = devm_pm_runtime_enable(ethosdev->base.dev);
   319		if (ret)
   320			return ret;
   321	
   322		ret = pm_runtime_resume_and_get(ethosdev->base.dev);
   323		if (ret)
   324			return ret;
   325	
   326		pm_runtime_set_autosuspend_delay(ethosdev->base.dev, 50);
   327		pm_runtime_use_autosuspend(ethosdev->base.dev);
   328	
   329		/* If PM is disabled, we need to call ethos_device_resume() manually. */
   330		if (!IS_ENABLED(CONFIG_PM)) {
   331			ret = ethos_device_resume(ethosdev->base.dev);
   332			if (ret)
   333				return ret;
   334		}
   335	
   336		ethosdev->npu_info.id = id = readl_relaxed(ethosdev->regs + NPU_REG_ID);
   337		ethosdev->npu_info.config = config = readl_relaxed(ethosdev->regs + NPU_REG_CONFIG);
   338	
   339		dev_info(ethosdev->base.dev,
   340			"Found Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs\n",
 > 341			FIELD_GET(ID_ARCH_MAJOR_MASK, id),
   342			FIELD_GET(ID_ARCH_MINOR_MASK, id),
   343			FIELD_GET(ID_ARCH_PATCH_MASK, id),
   344			FIELD_GET(ID_VER_MAJOR_MASK, id),
   345			FIELD_GET(ID_VER_MINOR_MASK, id),
   346			FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
   347			1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config));
   348	
   349		ethos_sram_init(ethosdev);
   350	
   351		return ethos_reset(ethosdev);
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
