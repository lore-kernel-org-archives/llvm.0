Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20069525F;
	Fri, 24 Mar 2023 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679657836; x=1711193836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Da93ipLAbjMdB8xPzHB5Z8npwIdfZ+9GmGCXnO0te8M=;
  b=gcwhpQw2ra7j/CNXhcTvCm7JDigJXSku3jMlfjkqu1jzt+Tamdd8teXI
   UCvgqXEH1M2ouQYcFj6atePbFLNRDKs3sM1r3SiHmNETmkTo5RZwGkvNm
   iedjBCV7pyzDY2oLAubGh0QhWsJAbUXJ2yaZU9OYzAjCjrg/PQrjXCY0r
   sOvE6j185aXasHQ31lWdsmKC2IOg2Z2aSK7w9QhjtXyTVsTYv6mfJgKRW
   RFqD3imiSoAbm7oN2qzBzMdMW1vQPhMVlG504yJFYVfWIN5V76+j5Ndhk
   NtWRL+CjyqT/6Oi+NClsjjeTQVvv1qKpAM+tE+FxV3AmaPEFwBZKoz8TW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320150512"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="320150512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 04:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="713057607"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="713057607"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 04:37:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pffjN-000FG0-08;
	Fri, 24 Mar 2023 11:37:13 +0000
Date: Fri, 24 Mar 2023 19:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 5/15] ld.lld: error: undefined
 symbol: devm_mdiobus_alloc_size
Message-ID: <202303241935.xRMa6mc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   0e205e6fad28ba805941ac8889c66a1607c4d505
commit: ee27c28a24b23132532d52fb82b00add65dc29dc [5/15] net: phy: Add a binding for PHY LEDs
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230324/202303241935.xRMa6mc6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/ee27c28a24b23132532d52fb82b00add65dc29dc
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout ee27c28a24b23132532d52fb82b00add65dc29dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241935.xRMa6mc6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_mdiobus_alloc_size
   >>> referenced by phy.h:458 (include/linux/phy.h:458)
   >>>               drivers/net/ethernet/microchip/lan743x_main.o:(lan743x_pcidev_probe) in archive vmlinux.a
   >>> referenced by phy.h:458 (include/linux/phy.h:458)
   >>>               drivers/net/ethernet/ni/nixge.o:(nixge_probe) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && (LEDS_CLASS [=m] || LEDS_CLASS [=m]=n)
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]
   - TIGON3 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - LAN743X [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - NI_XGE_MANAGEMENT_ENET [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_NI [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - XILINX_EMACLITE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - ALTERA_TSE [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_DMA [=y]
   - DNET [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y]
   - B44 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && SSB_POSSIBLE [=y] && HAS_DMA [=y]
   - KS8851_MLL [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICREL [=y] && HAS_IOMEM [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - SMSC911X [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SMSC [=y] && HAS_IOMEM [=y]
   - SMSC9420 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_SMSC [=y] && PCI [=y]
   - XILINX_LL_TEMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - USB_NET_AX88179_178A [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
