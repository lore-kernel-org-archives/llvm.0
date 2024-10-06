Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91F14C588;
	Sun,  6 Oct 2024 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728208217; cv=none; b=CDF9hqftcgqsa9AUbbOpgYL9sEmaxph1p807EsXbPZZau7+dfzOW1L59AgYr8w0U+I/DivJtPL1fxa0wY0oQUOF86ZMh315DhpxN2CIUwoMYqrJgflmXKN05a+cUU7dTDi2iN3RJ1BvTrifKl6eCfBhBnq6NyLS3Ka/7kC3uouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728208217; c=relaxed/simple;
	bh=1ml4gjMbuCfo9zhJFsfiVUwN89hRvbBn2IxwDD8iRIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYr1DQ9qSGGTp49CPhbh1tQRb/xCi6YcBuhsYNM8e9G65EioTG2H4BwNlnRvqPoEXmlJC4JSs5UsMD6kvpm1B9zutsCbaW2V3zKCGMpKEVoxgHncJU23/Zw3krRNBtdQeSdNzCmgZFZR8zU+Km5ubcqvJV27axkD+IptqWt4VHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFy0or13; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFy0or13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728208215; x=1759744215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ml4gjMbuCfo9zhJFsfiVUwN89hRvbBn2IxwDD8iRIk=;
  b=QFy0or13vw7DVQwaFxTNHgGTWZu3BgeYhq+eQN5xRO4NyW3QPPKdPHlO
   SaN2lJePmKR991skrz3QMmTjtF8PKKnC3h2WL98yxcDCNJLo/YQ0yk5Lf
   R+ANNwiw87ff+fHk4gsJzWWnNE+W3zgfS3HD2AtfBc6CROle38CXQVjCz
   RaYI31SPqxwXGLRUUq+dAlNslRIHwwnUKgJri3nEFOjmvfuHqVxXX00IN
   C9LaOQuDjLNWabwdmnJPhI4t9U3Bycx/4QNzhPebEdGfVAZbW69ZMYO1u
   QP3vzvkviyAeouZlCczaVozql1kfhm3UHguWfX3ok3YQykR0FE5Lcduy2
   w==;
X-CSE-ConnectionGUID: o5NV+BzQR/itveg1pt4Aqw==
X-CSE-MsgGUID: krtEEfBUQLivcT+9Fiw7UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="52771996"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="52771996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 02:50:14 -0700
X-CSE-ConnectionGUID: sfG8I+lNS9ySYYP8iwTP9Q==
X-CSE-MsgGUID: 1bZ0a7TrT5KQ5oTq+QI7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="106003330"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Oct 2024 02:50:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxNtx-0003mC-1f;
	Sun, 06 Oct 2024 09:50:09 +0000
Date: Sun, 6 Oct 2024 17:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>
Subject: [morimoto:renesas-bsp/v6.1.112-2024-10-03-2 865/874]
 drivers/net/phy/marvell-88q2xxx.c:160:8: error: call to undeclared function
 'genphy_c45_pma_baset1_read_abilities'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202410061759.FT55A4Fy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.112-2024-10-03-2
head:   a62d720bf07c29f512cd9a2785e089c98277256f
commit: ed34f19dbdc7a70ed09e863a509fb79f127694a3 [865/874] net: phy: marvell-88q2xxx: add driver for the Marvell 88Q2110 PHY
config: s390-randconfig-002-20241006 (https://download.01.org/0day-ci/archive/20241006/202410061759.FT55A4Fy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061759.FT55A4Fy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061759.FT55A4Fy-lkp@intel.com/

All errors (new ones prefixed by >>):

                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/net/phy/marvell-88q2xxx.c:5:
   In file included from include/linux/ethtool_netlink.h:6:
   In file included from include/uapi/linux/ethtool_netlink.h:12:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/net/phy/marvell-88q2xxx.c:5:
   In file included from include/linux/ethtool_netlink.h:6:
   In file included from include/uapi/linux/ethtool_netlink.h:12:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   drivers/net/phy/marvell-88q2xxx.c:36:8: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL'
                               MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
                               ^
   drivers/net/phy/marvell-88q2xxx.c:36:31: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL_RESET'
                               MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
                                                      ^
   drivers/net/phy/marvell-88q2xxx.c:41:7: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL'
                                            MDIO_PCS_1000BT1_CTRL, val,
                                            ^
   drivers/net/phy/marvell-88q2xxx.c:42:15: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL_RESET'
                                            !(val & MDIO_PCS_1000BT1_CTRL_RESET),
                                                    ^
   drivers/net/phy/marvell-88q2xxx.c:41:7: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL'
                                            MDIO_PCS_1000BT1_CTRL, val,
                                            ^
   drivers/net/phy/marvell-88q2xxx.c:42:15: error: use of undeclared identifier 'MDIO_PCS_1000BT1_CTRL_RESET'
                                            !(val & MDIO_PCS_1000BT1_CTRL_RESET),
                                                    ^
   drivers/net/phy/marvell-88q2xxx.c:40:9: error: initializing 'int' with an expression of incompatible type 'void'
           return phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/phy.h:1146:6: note: expanded from macro 'phy_read_mmd_poll_timeout'
           int __ret = read_poll_timeout(phy_read_mmd, val, (cond) || val < 0, \
               ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/marvell-88q2xxx.c:66:45: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT'
                           ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_STAT);
                                                                    ^
   drivers/net/phy/marvell-88q2xxx.c:69:19: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT_LINK'
                           else if (ret & MDIO_PCS_1000BT1_STAT_LINK)
                                          ^
   drivers/net/phy/marvell-88q2xxx.c:74:45: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT'
                           ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_STAT);
                                                                    ^
   drivers/net/phy/marvell-88q2xxx.c:77:19: error: use of undeclared identifier 'MDIO_PCS_1000BT1_STAT_LINK'
                           else if (ret & MDIO_PCS_1000BT1_STAT_LINK)
                                          ^
>> drivers/net/phy/marvell-88q2xxx.c:160:8: error: call to undeclared function 'genphy_c45_pma_baset1_read_abilities'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = genphy_c45_pma_baset1_read_abilities(phydev);
                 ^
   drivers/net/phy/marvell-88q2xxx.c:160:8: note: did you mean 'genphy_c45_pma_read_abilities'?
   include/linux/phy.h:1664:5: note: 'genphy_c45_pma_read_abilities' declared here
   int genphy_c45_pma_read_abilities(struct phy_device *phydev);
       ^
   12 warnings and 12 errors generated.


vim +/genphy_c45_pma_baset1_read_abilities +160 drivers/net/phy/marvell-88q2xxx.c

   147	
   148	static int mv88q2xxx_get_features(struct phy_device *phydev)
   149	{
   150		int ret;
   151	
   152		ret = genphy_c45_pma_read_abilities(phydev);
   153		if (ret)
   154			return ret;
   155	
   156		/* We need to read the baset1 extended abilities manually because the
   157		 * PHY does not signalize it has the extended abilities register
   158		 * available.
   159		 */
 > 160		ret = genphy_c45_pma_baset1_read_abilities(phydev);
   161		if (ret)
   162			return ret;
   163	
   164		/* The PHY signalizes it supports autonegotiation. Unfortunately, so
   165		 * far it was not possible to get a link even when following the init
   166		 * sequence provided by Marvell. Disable it for now until a proper
   167		 * workaround is found or a new PHY revision is released.
   168		 */
   169		linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, phydev->supported);
   170	
   171		return 0;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
