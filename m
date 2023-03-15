Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0D52C9E;
	Wed, 15 Mar 2023 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678905064; x=1710441064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unusQsGlyTAos+LjRFiMYV4Ij0sp0S95EduscJcW4Tk=;
  b=nqQDiBTj+BBVow35y5CM5jHB5WCUBZLpvQggimVUnUCa/xINyIIWf4a8
   jA88Vjy9NXczMB8GbxLA4BAHq/PiSHsyC6qsg/gdeb5ekL2rUdg+fYx+p
   D+XQLmygfNq2ThAedxxvsmvbUu0ORdX4jmyhWgzerK21gxTUHmE8Ff+Z6
   4jbjk9MB/3DV7LPedk+It5UKzQwisWP1F7HTqX04qDYSQLDQHCXP9wMR/
   F9lk7SVW/K+qs6N7UBHyeyvFJSCJ5xZZBoNxgHMfZgdm0KjEwJ6Ef34TG
   qsZcSTN7CMukOwW5VHK4W5UG6NBswRbqD6eP0uMkM0UEUl/I+bTXuUudx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337810607"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="337810607"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 11:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629562020"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="629562020"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 11:31:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcVtt-0007wt-1V;
	Wed, 15 Mar 2023 18:31:01 +0000
Date: Thu, 16 Mar 2023 02:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Wertenbroek <rick.wertenbroek@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	0day robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-rockchip-ep.c:302:6: error: use of
 undeclared identifier 'mmc'
Message-ID: <202303160212.3VjAyNG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Damien-Le-Moal/PCI-endpoint-Automatically-create-a-function-specific-attributes-group/20230308-170657
head:   7b6ed26025e4f5d5c353ad7f4f06e1c58643ceb1
commit: f87a7257008e97aba171ff131f59060d9b7f7e87 PCI: rockchip: Add parameter check for RK3399 PCIe endpoint core set_msi()
date:   7 days ago
config: riscv-randconfig-r006-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160212.3VjAyNG1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f87a7257008e97aba171ff131f59060d9b7f7e87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Damien-Le-Moal/PCI-endpoint-Automatically-create-a-function-specific-attributes-group/20230308-170657
        git checkout f87a7257008e97aba171ff131f59060d9b7f7e87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160212.3VjAyNG1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-rockchip-ep.c:302:6: error: use of undeclared identifier 'mmc'
           if (mmc > 0x5) {
               ^
   drivers/pci/controller/pcie-rockchip-ep.c:543:6: warning: unused variable 'cfg' [-Wunused-variable]
           u32 cfg;
               ^
   1 warning and 1 error generated.


vim +/mmc +302 drivers/pci/controller/pcie-rockchip-ep.c

   289	
   290	static int rockchip_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
   291					    u8 multi_msg_cap)
   292	{
   293		struct rockchip_pcie_ep *ep = epc_get_drvdata(epc);
   294		struct rockchip_pcie *rockchip = &ep->rockchip;
   295		u32 flags;
   296	
   297		if (fn) {
   298			dev_err(&epc->dev, "This endpoint controller only supports a single physical function\n");
   299			return -EINVAL;
   300		}
   301	
 > 302		if (mmc > 0x5) {
   303			dev_err(&epc->dev, "Number of MSI IRQs cannot be more than 32\n");
   304			return -EINVAL;
   305		}
   306	
   307		flags = rockchip_pcie_read(rockchip,
   308					   ROCKCHIP_PCIE_EP_FUNC_BASE(fn) +
   309					   ROCKCHIP_PCIE_EP_MSI_CTRL_REG);
   310		flags &= ~ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_MASK;
   311		flags |=
   312		   (multi_msg_cap << ROCKCHIP_PCIE_EP_MSI_CTRL_MMC_OFFSET) |
   313		   (PCI_MSI_FLAGS_64BIT << ROCKCHIP_PCIE_EP_MSI_FLAGS_OFFSET);
   314		flags &= ~ROCKCHIP_PCIE_EP_MSI_CTRL_MASK_MSI_CAP;
   315		rockchip_pcie_write(rockchip, flags,
   316				    ROCKCHIP_PCIE_EP_FUNC_BASE(fn) +
   317				    ROCKCHIP_PCIE_EP_MSI_CTRL_REG);
   318		return 0;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
