Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BA7FA;
	Sat, 15 Jul 2023 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689410338; x=1720946338;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XoAe8BHfO9UiVAkfoYPDy5aTXTGVu3Hifi1bv5bLdr4=;
  b=jxCCOJCXuZk9ncHpZtz3z2/ejpLnIcACd4+leZHnMhh4OVp9vfbJSetQ
   f5kCM7v0//rprCmxJZhylaPcyEO/GOLMIhB4iGYqcZ/6thSvJxOjjiDKi
   A9edS9iJqEADUy2zX2YnlgQhLOv+4ajBAvPoBMkoqWG0FgvtH8v2dDfGk
   neHoGkhTdxDC9WC0A/FoZM0S6W+K9e7gX9PGBcHlHwNC6AnYgiUFticTd
   ay4wXHpNJqo/EGInJCZh7w4Y9H0M7zBwNMtPT0FN26Akg85khxnUqTEyq
   rSpuhniyWeUriMlW75Ck7A08tKKFWocuBR3ChRoVu+KuxuvD3wa9WZwje
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="368286091"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="368286091"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 01:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896664747"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="896664747"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jul 2023 01:38:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKanm-00083N-2e;
	Sat, 15 Jul 2023 08:38:54 +0000
Date: Sat, 15 Jul 2023 16:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 104/106]
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:926:14: error: use of
 undeclared identifier 'match'
Message-ID: <202307151630.8ZZV9MIJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   7beaa9a181711c2419017fa2a75c70fef24991f5
commit: 02f7b4ddcae35ec8925995b6d2774e2b0efbe5ca [104/106] Use of_device_get_match_data
config: powerpc-mpc885_ads_defconfig (https://download.01.org/0day-ci/archive/20230715/202307151630.8ZZV9MIJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151630.8ZZV9MIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151630.8ZZV9MIJ-lkp@intel.com/

All errors (new ones prefixed by >>):

      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:187:1: note: expanded from here
     187 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:189:1: note: expanded from here
     189 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:191:1: note: expanded from here
     191 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:193:1: note: expanded from here
     193 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:195:1: note: expanded from here
     195 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:319:33: warning: variable 'fpi' set but not used [-Wunused-but-set-variable]
     319 |         const struct fs_platform_info *fpi;
         |                                        ^
>> drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:926:14: error: use of undeclared identifier 'match'
     926 |         if (!IS_FEC(match)) {
         |                     ^
   7 warnings and 1 error generated.


vim +/match +926 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c

8c02acd7986707 drivers/net/fs_enet/fs_enet-main.c                    Alexander Beregalov 2009-04-09   905  
4f2c53ea27a8d1 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Bill Pemberton      2012-12-03   906  static int fs_enet_probe(struct platform_device *ofdev)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   907  {
02f7b4ddcae35e drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Rob Herring         2023-07-14   908  	const struct fs_ops *ops;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   909  	struct net_device *ndev;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   910  	struct fs_enet_private *fep;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   911  	struct fs_platform_info *fpi;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   912  	const u32 *data;
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   913  	struct clk *clk;
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   914  	int err;
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   915  	const char *phy_connection_type;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   916  	int privsize, len, ret = -ENODEV;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   917  
02f7b4ddcae35e drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Rob Herring         2023-07-14   918  	ops = of_device_get_match_data(&ofdev->dev);
02f7b4ddcae35e drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Rob Herring         2023-07-14   919  	if (!ops)
74888760d40b3a drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-02-22   920  		return -EINVAL;
74888760d40b3a drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-02-22   921  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   922  	fpi = kzalloc(sizeof(*fpi), GFP_KERNEL);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   923  	if (!fpi)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   924  		return -ENOMEM;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   925  
b1608d69cb804e drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2011-05-18  @926  	if (!IS_FEC(match)) {
61c7a080a5a061 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2010-04-13   927  		data = of_get_property(ofdev->dev.of_node, "fsl,cpm-command", &len);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   928  		if (!data || len != 4)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   929  			goto out_free_fpi;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   930  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   931  		fpi->cp_command = *data;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   932  	}
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   933  
8572763af48728 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Leroy    2016-09-09   934  	fpi->rx_ring = RX_RING_SIZE;
8572763af48728 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Leroy    2016-09-09   935  	fpi->tx_ring = TX_RING_SIZE;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   936  	fpi->rx_copybreak = 240;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   937  	fpi->napi_weight = 17;
61c7a080a5a061 drivers/net/fs_enet/fs_enet-main.c                    Grant Likely        2010-04-13   938  	fpi->phy_node = of_parse_phandle(ofdev->dev.of_node, "phy-handle", 0);
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   939  	if (!fpi->phy_node && of_phy_is_fixed_link(ofdev->dev.of_node)) {
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   940  		err = of_phy_register_fixed_link(ofdev->dev.of_node);
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   941  		if (err)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   942  			goto out_free_fpi;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   943  
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   944  		/* In the case of a fixed PHY, the DT node associated
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   945  		 * to the PHY is the Ethernet MAC DT node.
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   946  		 */
129cc83a0b7ed9 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Uwe Kleine-König    2014-08-07   947  		fpi->phy_node = of_node_get(ofdev->dev.of_node);
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   948  	}
bb74d9a4a87b07 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Florian Fainelli    2014-05-22   949  
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   950  	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec")) {
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   951  		phy_connection_type = of_get_property(ofdev->dev.of_node,
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   952  						"phy-connection-type", NULL);
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   953  		if (phy_connection_type && !strcmp("rmii", phy_connection_type))
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   954  			fpi->use_rmii = 1;
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   955  	}
ba568335b089e0 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Vladimir Ermakov    2012-03-17   956  
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   957  	/* make clock lookup non-fatal (the driver is shared among platforms),
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   958  	 * but require enable to succeed when a clock was specified/found,
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   959  	 * keep a reference to the clock upon successful acquisition
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   960  	 */
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   961  	clk = devm_clk_get(&ofdev->dev, "per");
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   962  	if (!IS_ERR(clk)) {
e9ea828f62891c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10   963  		ret = clk_prepare_enable(clk);
e9ea828f62891c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10   964  		if (ret)
b9755f03728b21 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28   965  			goto out_deregister_fixed_link;
e9ea828f62891c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10   966  
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   967  		fpi->clk_per = clk;
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   968  	}
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22   969  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   970  	privsize = sizeof(*fep) +
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   971  	           sizeof(struct sk_buff **) *
4fc9b87bae25e8 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   972  		     (fpi->rx_ring + fpi->tx_ring) +
4fc9b87bae25e8 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   973  		   sizeof(char) * fpi->tx_ring;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   974  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   975  	ndev = alloc_etherdev(privsize);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   976  	if (!ndev) {
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   977  		ret = -ENOMEM;
e8f7f43a4ad451 drivers/net/fs_enet/fs_enet-main.c                    Julia Lawall        2010-09-04   978  		goto out_put;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   979  	}
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   980  
eedbc705f9a094 drivers/net/fs_enet/fs_enet-main.c                    Anton Vorontsov     2009-07-16   981  	SET_NETDEV_DEV(ndev, &ofdev->dev);
8513fbd880093f drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jingoo Han          2013-05-23   982  	platform_set_drvdata(ofdev, ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   983  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   984  	fep = netdev_priv(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   985  	fep->dev = &ofdev->dev;
f860f49ee2e59d drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-17   986  	fep->ndev = ndev;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   987  	fep->fpi = fpi;
02f7b4ddcae35e drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Rob Herring         2023-07-14   988  	fep->ops = ops;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   989  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   990  	ret = fep->ops->setup_data(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   991  	if (ret)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   992  		goto out_free_dev;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   993  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   994  	fep->rx_skbuff = (struct sk_buff **)&fep[1];
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   995  	fep->tx_skbuff = fep->rx_skbuff + fpi->rx_ring;
4fc9b87bae25e8 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   996  	fep->mapped_as_page = (char *)(fep->rx_skbuff + fpi->rx_ring +
4fc9b87bae25e8 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02   997  				       fpi->tx_ring);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   998  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02   999  	spin_lock_init(&fep->lock);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1000  	spin_lock_init(&fep->tx_lock);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1001  
9ca01b25dffffe drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jakub Kicinski      2021-10-06  1002  	of_get_ethdev_address(ofdev->dev.of_node, ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1003  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1004  	ret = fep->ops->allocate_bd(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1005  	if (ret)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1006  		goto out_cleanup_data;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1007  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1008  	fep->rx_bd_base = fep->ring_base;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1009  	fep->tx_bd_base = fep->rx_bd_base + fpi->rx_ring;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1010  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1011  	fep->tx_ring = fpi->tx_ring;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1012  	fep->rx_ring = fpi->rx_ring;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1013  
8c02acd7986707 drivers/net/fs_enet/fs_enet-main.c                    Alexander Beregalov 2009-04-09  1014  	ndev->netdev_ops = &fs_enet_netdev_ops;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1015  	ndev->watchdog_timeo = 2 * HZ;
f8b39039cbf2a1 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Leroy    2018-01-16  1016  	INIT_WORK(&fep->timeout_work, fs_timeout_work);
b707b89f7be361 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jakub Kicinski      2022-05-06  1017  	netif_napi_add_weight(ndev, &fep->napi, fs_enet_napi,
b707b89f7be361 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Jakub Kicinski      2022-05-06  1018  			      fpi->napi_weight);
f860f49ee2e59d drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-17  1019  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1020  	ndev->ethtool_ops = &fs_ethtool_ops;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1021  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1022  	netif_carrier_off(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1023  
4fc9b87bae25e8 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02  1024  	ndev->features |= NETIF_F_SG;
4fc9b87bae25e8 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c LEROY Christophe    2015-02-02  1025  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1026  	ret = register_netdev(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1027  	if (ret)
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1028  		goto out_free_bd;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1029  
fcb6a1c83e48c3 drivers/net/fs_enet/fs_enet-main.c                    Anatolij Gustschin  2010-02-26  1030  	pr_info("%s: fs_enet: %pM\n", ndev->name, ndev->dev_addr);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1031  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1032  	return 0;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1033  
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1034  out_free_bd:
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1035  	fep->ops->free_bd(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1036  out_cleanup_data:
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1037  	fep->ops->cleanup_data(ndev);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1038  out_free_dev:
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1039  	free_netdev(ndev);
e8f7f43a4ad451 drivers/net/fs_enet/fs_enet-main.c                    Julia Lawall        2010-09-04  1040  out_put:
2771399ac9986c drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Gerhard Sittig      2013-08-22  1041  	clk_disable_unprepare(fpi->clk_per);
b9755f03728b21 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28  1042  out_deregister_fixed_link:
1f8f1e89e0183e drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Christophe Jaillet  2017-02-10  1043  	of_node_put(fpi->phy_node);
b9755f03728b21 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28  1044  	if (of_phy_is_fixed_link(ofdev->dev.of_node))
b9755f03728b21 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c Johan Hovold        2016-11-28  1045  		of_phy_deregister_fixed_link(ofdev->dev.of_node);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1046  out_free_fpi:
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1047  	kfree(fpi);
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1048  	return ret;
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1049  }
976de6a8c304dc drivers/net/fs_enet/fs_enet-main.c                    Scott Wood          2007-10-02  1050  

:::::: The code at line 926 was first introduced by commit
:::::: b1608d69cb804e414d0887140ba08a9398e4e638 drivercore: revert addition of of_match to struct device

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
