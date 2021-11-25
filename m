Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD672
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 20:50:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222436856"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="222436856"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 12:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="457963232"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Nov 2021 12:50:51 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqLhj-0006ur-6X; Thu, 25 Nov 2021 20:50:51 +0000
Date: Fri, 26 Nov 2021 04:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 4414/10206]
 drivers/pci/controller/dwc/pci-keystone.c:299:6: warning: no previous
 prototype for function 'ks_pcie_irq_eoi'
Message-ID: <202111260411.MYHzZdON-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kishon,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   0c67d996db8f3c9149598bc98657ae28fee22208
commit: f765f578153d8bfc7a035b1fce2c09d2c41bd980 [4414/10206] PCI: keystone: Convert to using hierarchy domain for legacy interrupts
config: arm-randconfig-r015-20211118 (https://download.01.org/0day-ci/archive/20211126/202111260411.MYHzZdON-lkp@intel.com/config)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout f765f578153d8bfc7a035b1fce2c09d2c41bd980
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-keystone.c:299:6: warning: no previous prototype for function 'ks_pcie_irq_eoi' [-Wmissing-prototypes]
   void ks_pcie_irq_eoi(struct irq_data *data)
        ^
   drivers/pci/controller/dwc/pci-keystone.c:299:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ks_pcie_irq_eoi(struct irq_data *data)
   ^
   static 
>> drivers/pci/controller/dwc/pci-keystone.c:308:6: warning: no previous prototype for function 'ks_pcie_irq_enable' [-Wmissing-prototypes]
   void ks_pcie_irq_enable(struct irq_data *data)
        ^
   drivers/pci/controller/dwc/pci-keystone.c:308:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ks_pcie_irq_enable(struct irq_data *data)
   ^
   static 
>> drivers/pci/controller/dwc/pci-keystone.c:317:6: warning: no previous prototype for function 'ks_pcie_irq_disable' [-Wmissing-prototypes]
   void ks_pcie_irq_disable(struct irq_data *data)
        ^
   drivers/pci/controller/dwc/pci-keystone.c:317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ks_pcie_irq_disable(struct irq_data *data)
   ^
   static 
   3 warnings generated.


vim +/ks_pcie_irq_eoi +299 drivers/pci/controller/dwc/pci-keystone.c

   298	
 > 299	void ks_pcie_irq_eoi(struct irq_data *data)
   300	{
   301		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   302		irq_hw_number_t hwirq = data->hwirq;
   303	
   304		ks_pcie_app_writel(ks_pcie, IRQ_EOI, hwirq);
   305		irq_chip_eoi_parent(data);
   306	}
   307	
 > 308	void ks_pcie_irq_enable(struct irq_data *data)
   309	{
   310		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   311		irq_hw_number_t hwirq = data->hwirq;
   312	
   313		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_SET(hwirq), INTx_EN);
   314		irq_chip_enable_parent(data);
   315	}
   316	
 > 317	void ks_pcie_irq_disable(struct irq_data *data)
   318	{
   319		struct keystone_pcie *ks_pcie = irq_data_get_irq_chip_data(data);
   320		irq_hw_number_t hwirq = data->hwirq;
   321	
   322		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_CLR(hwirq), INTx_EN);
   323		irq_chip_disable_parent(data);
   324	}
   325	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
