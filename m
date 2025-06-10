Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7D25B312;
	Tue, 10 Jun 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562877; cv=none; b=m0JsGQW01KDZ2yoH2PfVxiMrJ9l2WUWdlWiOykFz3awj0ZujgKaaMp1CsBfhakPJ7bntaHAZNWcSH8B4oLbRWbj8eh6MYDrE2+BN2W0G0E8hWkQEyuyboDth5gCJoFpV9cGIIi6MCe7sfmqaZiO3MFFdKWj9b7dH8+fU49zvY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562877; c=relaxed/simple;
	bh=iyAVdnka31hmqeUEKmgduM023sQRYvdBTymmKMrYcw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNCwDRO3//tE/XcMhTc+sRMWAgH97GOnsre9j8lU7/7z/h+neWT23ME8uFA+2Vd+wyc90umgYZ5gJnHu91sdX/RhQ8qZAp8Qb0Yn1E+5gWTSn11T/m7x33sintPvfIYO9GxZPJgOpOWi9L1ounGIwjYM5rYxToR1X/l3TLsVsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQiy4s59; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQiy4s59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749562876; x=1781098876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyAVdnka31hmqeUEKmgduM023sQRYvdBTymmKMrYcw4=;
  b=gQiy4s59XPAeomhqMDZUFyReiZwjgvjCn9Ty9X2yT97uHr1/u5SoL8S5
   VD1j4y2NCvXCn9RSY48lI6gLOyRswhUTzau6Uhzq+u0NRMPzRVQcqrI7R
   UzzOBgmKt5j0phZqfo+HL1D4VRWmJkJc3FiRg9lRJwICov8U80NDCkPX7
   hhTptEh0RWQTPtnuhREmH8nMd3vjUhW12c2r37hhHQ4bypWVQJHVMdPC1
   +lpODJxqASZHDmCmf6bHmdhKoGelC158VlGdsc2EkhXmwYnX2if2rux+O
   vNl4iKxXOwRQvfCzNFQSJJj/n192irrwOkKqT14ZW/ZZDkhq2/lJRqvBM
   Q==;
X-CSE-ConnectionGUID: XWqLTCUNTx+qMki/jSOM2A==
X-CSE-MsgGUID: jVc49nQPS/K7sTaZbc0ibw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62328455"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="62328455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:41:15 -0700
X-CSE-ConnectionGUID: ChgbwVTjRgGHvDGnfX97/A==
X-CSE-MsgGUID: pDy5jALAQpiVn3ZmJyc4tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="152089428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2025 06:41:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOzDy-0008Ha-2e;
	Tue, 10 Jun 2025 13:41:10 +0000
Date: Tue, 10 Jun 2025 21:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos 2/2] drivers/accel/ethos/ethos_drv.c:341:3: error:
 call to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202506102120.Te26gGUr-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250610/202506102120.Te26gGUr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506102120.Te26gGUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506102120.Te26gGUr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/ethos/ethos_drv.c:196:1: warning: unused label 'err_put_mod' [-Wunused-label]
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
>> drivers/accel/ethos/ethos_drv.c:341:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     341 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^
   drivers/accel/ethos/ethos_drv.c:341:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
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


vim +/FIELD_GET +341 drivers/accel/ethos/ethos_drv.c

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
