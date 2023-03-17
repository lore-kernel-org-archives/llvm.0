Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18318810;
	Fri, 17 Mar 2023 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679043369; x=1710579369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTy2NJho5RiuYClpICQ9i+xbX9kVfnrUyYNI7b6hYlA=;
  b=dUs+7yCFXgHA0ERRrNC56c+StmJ9UPiuUhfELQ73HdrlI1t3rXdWfek/
   43yI+HyJXo2WO+/iA0gaeYIFGxKMtJfzuRaOXbLMW7W5TIShIEeV0RC0E
   by3EYQlg+7s1qRCE7E/qIeSOFoeKenfXIh7ntWhi8nrJUaQs6VKgdL1yM
   pFLThA8l/lVpsbLaxKiluYIX7nBfqFOQfVfhPx2xFajCQtCxTiZ8a0O0M
   zm+VtfnTHtwaaDPynDWsnfrN1DYMbYfQUHqr/wFTmpJlm6qYDgXNbxR+B
   la1fyfc6QUhWUOkNYa/iuoT7UA9urDTbAecTG80m/RvxSko5u+wAP2zSm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317869995"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="317869995"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 01:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769293429"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="769293429"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 01:56:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd5sY-0009F2-0q;
	Fri, 17 Mar 2023 08:56:02 +0000
Date: Fri, 17 Mar 2023 16:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 15/28] ld.lld: error: undefined
 symbol: devm_mdiobus_alloc_size
Message-ID: <202303171620.8orB8rbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   8a9b1a5ad5dd0e48585009020088a2ee5bdd6688
commit: a246542cd7588a620c3d96c875f6cdb25cc61ed0 [15/28] net: phy: Add a binding for PHY LEDs
config: x86_64-randconfig-a013-20230313 (https://download.01.org/0day-ci/archive/20230317/202303171620.8orB8rbX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/a246542cd7588a620c3d96c875f6cdb25cc61ed0
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout a246542cd7588a620c3d96c875f6cdb25cc61ed0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171620.8orB8rbX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_mdiobus_alloc_size
   >>> referenced by phy.h:458 (include/linux/phy.h:458)
   >>>               drivers/net/ethernet/engleder/tsnep_main.o:(tsnep_probe) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [m]: NETDEVICES [=y] && LEDS_CLASS [=m]
   Selected by [y]:
   - TSNEP [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_ENGLEDER [=y] && HAS_IOMEM [=y] && HAS_DMA [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   - XILINX_EMACLITE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - PHYLINK [=m] && NETDEVICES [=y]
   - ALTERA_TSE [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_DMA [=y]
   - DNET [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y]
   - ETHOC [=m] && NETDEVICES [=y] && ETHERNET [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - MVMDIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MARVELL [=y] && HAS_IOMEM [=y]
   - NI_XGE_MANAGEMENT_ENET [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_NI [=y] && HAS_IOMEM [=y] && HAS_DMA [=y]
   - XILINX_LL_TEMAC [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y]
   - USB_LAN78XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m]
   - USB_NET_AX88179_178A [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]
   - USB_NET_SMSC95XX [=m] && NETDEVICES [=y] && USB_NET_DRIVERS [=m] && USB_USBNET [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
