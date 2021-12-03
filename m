Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACBC2C9E
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 14:19:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236918500"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="236918500"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 06:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="678105847"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Dec 2021 06:19:11 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mt9P4-000HfQ-SI; Fri, 03 Dec 2021 14:19:10 +0000
Date: Fri, 3 Dec 2021 22:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [asahilinux:asahi 55/56] drivers/pci/controller/pcie-apple.c:537:11:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202112032209.qdsH6oP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/AsahiLinux/linux asahi
head:   69711d887d3f10a4f7dd6fd648bfff63ff66ba18
commit: 1dcce995852337e04880b91baef1994681d62f9c [55/56] PCI: apple: Configure link speeds properly
config: riscv-randconfig-r024-20211203 (https://download.01.org/0day-ci/archive/20211203/202112032209.qdsH6oP3-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/1dcce995852337e04880b91baef1994681d62f9c
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux asahi
        git checkout 1dcce995852337e04880b91baef1994681d62f9c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/pcie-apple.c:23:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/pci/controller/pcie-apple.c:23:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/pci/controller/pcie-apple.c:23:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/pci/controller/pcie-apple.c:537:11: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           ctrl2 |= FIELD_PREP(PCI_EXP_LNKCTL2_TLS, max_gen);
                    ^
   7 warnings and 1 error generated.


vim +/FIELD_PREP +537 drivers/pci/controller/pcie-apple.c

   523	
   524	static int apple_pcie_link_configure_max_speed(struct apple_pcie_port *port)
   525	{
   526		int max_gen;
   527		u32 ctrl2;
   528	
   529		max_gen = of_pci_get_max_link_speed(port->np);
   530		if (max_gen < 0) {
   531			dev_err(port->pcie->dev, "max link speed not specified\n");
   532			return max_gen;
   533		}
   534	
   535		ctrl2 = readw_relaxed(bridge_reg(port, PCIE_CAP_BASE + PCI_EXP_LNKCTL2));
   536		ctrl2 &= ~PCI_EXP_LNKCTL2_TLS;
 > 537		ctrl2 |= FIELD_PREP(PCI_EXP_LNKCTL2_TLS, max_gen);
   538		writew_relaxed(ctrl2, bridge_reg(port, PCIE_CAP_BASE + PCI_EXP_LNKCTL2));
   539	
   540		return 0;
   541	}
   542	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
