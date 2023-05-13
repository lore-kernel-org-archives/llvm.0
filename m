Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7466122623;
	Sat, 13 May 2023 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684020020; x=1715556020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2pwekUEwPifF9xXa7e60mZIUn0GXkjrc3LEc8lXdXs=;
  b=AsoTnXXA0rSm3cWKJjm9qGBTbFuXiVJDhwjD6wyh/mgF280Zkt0JnRP2
   NYiDMJtDs5UfjrBlSaA+JZE1gYNQpUtGCwp4t67DFxTO/gzBUccC4XFgf
   ANSNPq0UbKJA2n56pk2I/eCCz/3lxr1HGnh5+uJMNkU4pJD6tc+fyOw9d
   MGAriygpcRrWSdPfUBeOTfamNZg094ORQzqZWxhWkxOTPEpYZEBMOPDcN
   kCwAbtLHi6zWzVhuhv82dYsD4iJCWXBMLFsxIPaVoZsy9uFXeq3/3SoUV
   8YY5G/bXV1nb4Po4ciP0t2kxkiK6Jn+c1l+7yfeKKPFJD4t7V0iqJQlPm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="353261149"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="353261149"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 16:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="812487056"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="812487056"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 May 2023 16:20:18 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxyXB-0005iy-1U;
	Sat, 13 May 2023 23:20:17 +0000
Date: Sun, 14 May 2023 07:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 191/453] drivers/pci/endpoint/functions/pci-epf-mhi.c:447:5: warning: no
 previous prototype for function 'pci_epf_mhi_core_init'
Message-ID: <202305140727.ysgXB9e4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   255ec801b7a09e914735a942f27f3c74f5e8e810
commit: 7965d9ce6732a510b9c38995707c25ae0cdba1d0 [191/453] PCI: endpoint: epf-mhi: Switch to new interface between EPC and EPF
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230514/202305140727.ysgXB9e4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/krzk/linux/commit/7965d9ce6732a510b9c38995707c25ae0cdba1d0
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 7965d9ce6732a510b9c38995707c25ae0cdba1d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140727.ysgXB9e4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-mhi.c:171:6: warning: no previous prototype for function 'pci_epf_mhi_raise_irq' [-Wmissing-prototypes]
   void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
        ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
   ^
   static 
   drivers/pci/endpoint/functions/pci-epf-mhi.c:184:5: warning: no previous prototype for function 'pci_epf_mhi_iatu_read' [-Wmissing-prototypes]
   int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
   ^
   static 
   drivers/pci/endpoint/functions/pci-epf-mhi.c:221:5: warning: no previous prototype for function 'pci_epf_mhi_iatu_write' [-Wmissing-prototypes]
   int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:447:5: warning: no previous prototype for function 'pci_epf_mhi_core_init' [-Wmissing-prototypes]
   int pci_epf_mhi_core_init(struct pci_epf *epf)
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:447:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_core_init(struct pci_epf *epf)
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:482:5: warning: no previous prototype for function 'pci_epf_mhi_link_up' [-Wmissing-prototypes]
   int pci_epf_mhi_link_up(struct pci_epf *epf)
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:482:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_link_up(struct pci_epf *epf)
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:533:5: warning: no previous prototype for function 'pci_epf_mhi_link_down' [-Wmissing-prototypes]
   int pci_epf_mhi_link_down(struct pci_epf *epf)
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:533:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_link_down(struct pci_epf *epf)
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:550:5: warning: no previous prototype for function 'pci_epf_mhi_bme' [-Wmissing-prototypes]
   int pci_epf_mhi_bme(struct pci_epf *epf)
       ^
   drivers/pci/endpoint/functions/pci-epf-mhi.c:550:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_epf_mhi_bme(struct pci_epf *epf)
   ^
   static 
   7 warnings generated.


vim +/pci_epf_mhi_core_init +447 drivers/pci/endpoint/functions/pci-epf-mhi.c

   446	
 > 447	int pci_epf_mhi_core_init(struct pci_epf *epf)
   448	{
   449		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   450		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   451		struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
   452		struct pci_epc *epc = epf->epc;
   453		struct device *dev = &epf->dev;
   454		int ret;
   455	
   456		epf_bar->phys_addr = epf_mhi->mmio_phys;
   457		epf_bar->size = epf_mhi->mmio_size;
   458		epf_bar->barno = info->bar_num;
   459		epf_bar->flags = info->epf_flags;
   460		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
   461		if (ret) {
   462			dev_err(dev, "Failed to set BAR: %d\n", ret);
   463			return ret;
   464		}
   465	
   466		ret = pci_epc_set_msi(epc, epf->func_no, epf->vfunc_no,
   467				      order_base_2(info->msi_count));
   468		if (ret) {
   469			dev_err(dev, "Failed to set MSI configuration: %d\n", ret);
   470			return ret;
   471		}
   472	
   473		ret = pci_epc_write_header(epc, epf->func_no, epf->vfunc_no, epf->header);
   474		if (ret) {
   475			dev_err(dev, "Failed to set Configuration header: %d\n", ret);
   476			return ret;
   477		}
   478	
   479		return 0;
   480	}
   481	
 > 482	int pci_epf_mhi_link_up(struct pci_epf *epf)
   483	{
   484		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   485		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   486		struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
   487		struct pci_epc *epc = epf->epc;
   488		struct device *dev = &epf->dev;
   489		int ret;
   490	
   491		if (info->flags & MHI_EPF_USE_DMA) {
   492			ret = pci_epf_mhi_dma_init(epf_mhi);
   493			if (ret) {
   494				dev_err(dev, "Failed to initialize DMA: %d\n", ret);
   495				return ret;
   496			}
   497		}
   498	
   499		mhi_cntrl->mmio = epf_mhi->mmio;
   500		mhi_cntrl->irq = epf_mhi->irq;
   501		mhi_cntrl->mru = info->mru;
   502	
   503		/* Assign the struct dev of PCI EP as MHI controller device */
   504		mhi_cntrl->cntrl_dev = epc->dev.parent;
   505		mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
   506		mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
   507		mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
   508		mhi_cntrl->read_from_host = pci_epf_mhi_iatu_read;
   509		mhi_cntrl->write_to_host = pci_epf_mhi_iatu_write;
   510		if (info->flags & MHI_EPF_USE_DMA) {
   511			mhi_cntrl->transfer_from_host = pci_epf_mhi_edma_read;
   512			mhi_cntrl->transfer_to_host = pci_epf_mhi_edma_write;
   513		} else {
   514			mhi_cntrl->transfer_from_host = pci_epf_mhi_iatu_read;
   515			mhi_cntrl->transfer_to_host = pci_epf_mhi_iatu_write;
   516		}
   517	
   518		/* Register the MHI EP controller */
   519		ret = mhi_ep_register_controller(mhi_cntrl, info->config);
   520		if (ret) {
   521			dev_err(dev, "Failed to register MHI EP controller: %d\n", ret);
   522			if (info->flags & MHI_EPF_USE_DMA)
   523				pci_epf_mhi_dma_deinit(epf_mhi);
   524	
   525			return ret;
   526		}
   527	
   528		epf_mhi->mhi_registered = true;
   529	
   530		return 0;
   531	}
   532	
 > 533	int pci_epf_mhi_link_down(struct pci_epf *epf)
   534	{
   535		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   536		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   537		struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
   538	
   539		if (epf_mhi->mhi_registered) {
   540			mhi_ep_power_down(mhi_cntrl);
   541			if (info->flags & MHI_EPF_USE_DMA)
   542				pci_epf_mhi_dma_deinit(epf_mhi);
   543			mhi_ep_unregister_controller(mhi_cntrl);
   544			epf_mhi->mhi_registered = false;
   545		}
   546	
   547		return 0;
   548	}
   549	
 > 550	int pci_epf_mhi_bme(struct pci_epf *epf)
   551	{
   552		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   553		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   554		struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
   555		struct device *dev = &epf->dev;
   556		int ret;
   557	
   558		/* Power up the MHI EP stack if link is up and stack is in power down state */
   559		if (!mhi_cntrl->enabled && epf_mhi->mhi_registered) {
   560			ret = mhi_ep_power_up(mhi_cntrl);
   561			if (ret) {
   562				dev_err(dev, "Failed to power up MHI EP: %d\n", ret);
   563				if (info->flags & MHI_EPF_USE_DMA)
   564					pci_epf_mhi_dma_deinit(epf_mhi);
   565				mhi_ep_unregister_controller(mhi_cntrl);
   566				epf_mhi->mhi_registered = false;
   567			}
   568		}
   569	
   570		return 0;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
