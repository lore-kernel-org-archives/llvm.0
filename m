Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A7168
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641422277; x=1672958277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cs5q4cdCR/1Zgk/JDTfTNrhMQcpvcaqYtDvIm2lfZFM=;
  b=iuFJ13aQd5hPXPmHJ4CkGzrZYx79ZjKSTxg4XxzWrPYPc5VMTj1eduNm
   yxRaIMnDle4/6KLRoI8NFeu3o2hd58fb5PC5TKXOSwFXIaK0Csw0cdyqO
   oaBQGribuC2gb2oy3X6NI9J7i9KnqnWcC9Q0Iebi0GFJg8shcWtAhIUcg
   7Yv2jznIonqGABO8WvEcOSL7XwSZu0bvRj3w06e9ZQdI2pboreyKc4moM
   nKUn35qOOr6oZQZlkNREz7erQ/auRp6L3UsVKnVnF6xxZwJdq4fTZxcCJ
   wC1w5ynFAwvpYd7vIhZiars55ZOPfWb8fM4srJ4v0GZIG3QY9mhI3aFqw
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303298827"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="303298827"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 14:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="472665843"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2022 14:37:55 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5Eup-000H64-2Y; Wed, 05 Jan 2022 22:37:55 +0000
Date: Thu, 6 Jan 2022 06:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
Message-ID: <202201060655.NBwUPRqC-lkp@intel.com>
References: <20220105120442.14418-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105120442.14418-1-linmq006@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linux/master linus/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/drm-v3d-Fix-PM-disable-depth-imbalance-in-v3d_platform_drm_probe/20220105-200602
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r013-20220105 (https://download.01.org/0day-ci/archive/20220106/202201060655.NBwUPRqC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/9e89d2b210d16b00d43b6cf5a8e70495403da480
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/drm-v3d-Fix-PM-disable-depth-imbalance-in-v3d_platform_drm_probe/20220105-200602
        git checkout 9e89d2b210d16b00d43b6cf5a8e70495403da480
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/v3d/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/v3d/v3d_drv.c:303:1: warning: unused label 'pm_disable' [-Wunused-label]
   pm_disable:
   ^~~~~~~~~~~
   1 warning generated.


vim +/pm_disable +303 drivers/gpu/drm/v3d/v3d_drv.c

   213	
   214	static int v3d_platform_drm_probe(struct platform_device *pdev)
   215	{
   216		struct device *dev = &pdev->dev;
   217		struct drm_device *drm;
   218		struct v3d_dev *v3d;
   219		int ret;
   220		u32 mmu_debug;
   221		u32 ident1;
   222	
   223		v3d = devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
   224		if (IS_ERR(v3d))
   225			return PTR_ERR(v3d);
   226	
   227		drm = &v3d->drm;
   228	
   229		platform_set_drvdata(pdev, drm);
   230	
   231		ret = map_regs(v3d, &v3d->hub_regs, "hub");
   232		if (ret)
   233			return ret;
   234	
   235		ret = map_regs(v3d, &v3d->core_regs[0], "core0");
   236		if (ret)
   237			return ret;
   238	
   239		mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
   240		dma_set_mask_and_coherent(dev,
   241			DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH)));
   242		v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
   243	
   244		ident1 = V3D_READ(V3D_HUB_IDENT1);
   245		v3d->ver = (V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_TVER) * 10 +
   246			    V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_REV));
   247		v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
   248		WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
   249	
   250		v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
   251		if (IS_ERR(v3d->reset)) {
   252			ret = PTR_ERR(v3d->reset);
   253	
   254			if (ret == -EPROBE_DEFER)
   255				return ret;
   256	
   257			v3d->reset = NULL;
   258			ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
   259			if (ret) {
   260				dev_err(dev,
   261					"Failed to get reset control or bridge regs\n");
   262				return ret;
   263			}
   264		}
   265	
   266		if (v3d->ver < 41) {
   267			ret = map_regs(v3d, &v3d->gca_regs, "gca");
   268			if (ret)
   269				return ret;
   270		}
   271	
   272		v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
   273						GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
   274		if (!v3d->mmu_scratch) {
   275			dev_err(dev, "Failed to allocate MMU scratch page\n");
   276			return -ENOMEM;
   277		}
   278	
   279		pm_runtime_use_autosuspend(dev);
   280		pm_runtime_set_autosuspend_delay(dev, 50);
   281		pm_runtime_enable(dev);
   282	
   283		ret = v3d_gem_init(drm);
   284		if (ret)
   285			goto dma_free;
   286	
   287		ret = v3d_irq_init(v3d);
   288		if (ret)
   289			goto gem_destroy;
   290	
   291		ret = drm_dev_register(drm, 0);
   292		if (ret)
   293			goto irq_disable;
   294	
   295		return 0;
   296	
   297	irq_disable:
   298		v3d_irq_disable(v3d);
   299	gem_destroy:
   300		v3d_gem_destroy(drm);
   301	dma_free:
   302		dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 > 303	pm_disable:
   304		pm_runtime_disable(dev);
   305		return ret;
   306	}
   307	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
