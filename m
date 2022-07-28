Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705157A
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659028054; x=1690564054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kURNBGI8zKjMPtixW8T3WHeLX7X04ValgfTzIHfvulQ=;
  b=ngJhBSUUlamSflfMG2LogVkbz5ZOt/MBFuU4R6CUakto6EJo5iQihUPh
   yXfDDfG/pn8nYAi5fwsAx8fPp5SUUP4+N9++XLS6+ATAgt+vZJb5KI5Cw
   tJW55Vaco3U5iYh4HqR4aa8RX9IJyrniwQveJ4XAsZyihfZXa38ZtD6Uz
   DghOhcX2CubKb9tOjj4tX5rwfNd9hWi2H0wUsQcDP70vnFM2lwFI8nSFP
   i/BsOW6Txbufq0fQ2rshhD7K7IRA2cI5b0HqLvS1mOg4QtOhCy8YQD++3
   47rgchs+bSqeBjIg//KW3NPFQ05fNOFpoTHNdE63Ze6epv/AkSeIYzlfp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="271607391"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="271607391"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 10:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="551390744"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2022 10:07:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH6yy-000APa-0d;
	Thu, 28 Jul 2022 17:07:32 +0000
Date: Fri, 29 Jul 2022 01:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 01/23] drm/i915: Read graphics/media/display
 arch version from hw
Message-ID: <202207290003.4201IaYT-lkp@intel.com>
References: <20220728013420.3750388-2-radhakrishna.sripada@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728013420.3750388-2-radhakrishna.sripada@intel.com>

Hi Radhakrishna,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhakrishna-Sripada/Initial-Meteorlake-Support/20220728-093858
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220729/202207290003.4201IaYT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9c25e8c3f0f22894b5d8e14135eef61c2cf61a2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Radhakrishna-Sripada/Initial-Meteorlake-Support/20220728-093858
        git checkout 9c25e8c3f0f22894b5d8e14135eef61c2cf61a2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_driver.c:929:7: error: use of undeclared identifier 'match_info'
               !match_info->has_gmd_id && DISPLAY_VER(i915) < 5)
                ^
   drivers/gpu/drm/i915/i915_driver.c:944:38: error: use of undeclared identifier 'match_info'; did you mean 'acpi_info'?
           ret = i915_driver_early_probe(i915, match_info);
                                               ^~~~~~~~~~
                                               acpi_info
   include/acpi/acpixf.h:906:5: note: 'acpi_info' declared here
                                   acpi_info(const char *format, ...))
                                   ^
   2 errors generated.


vim +/match_info +929 drivers/gpu/drm/i915/i915_driver.c

   906	
   907	/**
   908	 * i915_driver_probe - setup chip and create an initial config
   909	 * @pdev: PCI device
   910	 * @ent: matching PCI ID entry
   911	 *
   912	 * The driver probe routine has to do several things:
   913	 *   - drive output discovery via intel_modeset_init()
   914	 *   - initialize the memory manager
   915	 *   - allocate initial config memory
   916	 *   - setup the DRM framebuffer with the allocated memory
   917	 */
   918	int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
   919	{
   920		struct drm_i915_private *i915;
   921		int ret;
   922	
   923		i915 = i915_driver_create(pdev, ent);
   924		if (IS_ERR(i915))
   925			return PTR_ERR(i915);
   926	
   927		/* Disable nuclear pageflip by default on pre-ILK */
   928		if (!i915->params.nuclear_pageflip &&
 > 929		    !match_info->has_gmd_id && DISPLAY_VER(i915) < 5)
   930			i915->drm.driver_features &= ~DRIVER_ATOMIC;
   931	
   932		ret = pci_enable_device(pdev);
   933		if (ret)
   934			goto out_fini;
   935	
   936		/*
   937		 * GRAPHICS_VER() and DISPLAY_VER() will return 0 before this is
   938		 * called, so we want to take care of this very early in the
   939		 * initialization process (as soon as we can peek into the MMIO BAR),
   940		 * even before we setup regular MMIO access.
   941		 */
   942		intel_ipver_early_init(i915);
   943	
   944		ret = i915_driver_early_probe(i915, match_info);
   945		if (ret < 0)
   946			goto out_pci_disable;
   947	
   948		disable_rpm_wakeref_asserts(&i915->runtime_pm);
   949	
   950		intel_vgpu_detect(i915);
   951	
   952		ret = intel_gt_probe_all(i915);
   953		if (ret < 0)
   954			goto out_runtime_pm_put;
   955	
   956		ret = i915_driver_mmio_probe(i915);
   957		if (ret < 0)
   958			goto out_tiles_cleanup;
   959	
   960		ret = i915_driver_hw_probe(i915);
   961		if (ret < 0)
   962			goto out_cleanup_mmio;
   963	
   964		ret = intel_modeset_init_noirq(i915);
   965		if (ret < 0)
   966			goto out_cleanup_hw;
   967	
   968		ret = intel_irq_install(i915);
   969		if (ret)
   970			goto out_cleanup_modeset;
   971	
   972		ret = intel_modeset_init_nogem(i915);
   973		if (ret)
   974			goto out_cleanup_irq;
   975	
   976		ret = i915_gem_init(i915);
   977		if (ret)
   978			goto out_cleanup_modeset2;
   979	
   980		ret = intel_modeset_init(i915);
   981		if (ret)
   982			goto out_cleanup_gem;
   983	
   984		i915_driver_register(i915);
   985	
   986		enable_rpm_wakeref_asserts(&i915->runtime_pm);
   987	
   988		i915_welcome_messages(i915);
   989	
   990		i915->do_release = true;
   991	
   992		return 0;
   993	
   994	out_cleanup_gem:
   995		i915_gem_suspend(i915);
   996		i915_gem_driver_remove(i915);
   997		i915_gem_driver_release(i915);
   998	out_cleanup_modeset2:
   999		/* FIXME clean up the error path */
  1000		intel_modeset_driver_remove(i915);
  1001		intel_irq_uninstall(i915);
  1002		intel_modeset_driver_remove_noirq(i915);
  1003		goto out_cleanup_modeset;
  1004	out_cleanup_irq:
  1005		intel_irq_uninstall(i915);
  1006	out_cleanup_modeset:
  1007		intel_modeset_driver_remove_nogem(i915);
  1008	out_cleanup_hw:
  1009		i915_driver_hw_remove(i915);
  1010		intel_memory_regions_driver_release(i915);
  1011		i915_ggtt_driver_release(i915);
  1012		i915_gem_drain_freed_objects(i915);
  1013		i915_ggtt_driver_late_release(i915);
  1014	out_cleanup_mmio:
  1015		i915_driver_mmio_release(i915);
  1016	out_tiles_cleanup:
  1017		intel_gt_release_all(i915);
  1018	out_runtime_pm_put:
  1019		enable_rpm_wakeref_asserts(&i915->runtime_pm);
  1020		i915_driver_late_release(i915);
  1021	out_pci_disable:
  1022		pci_disable_device(pdev);
  1023	out_fini:
  1024		i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
  1025		return ret;
  1026	}
  1027	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
