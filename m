Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCE7C;
	Thu, 13 Jul 2023 01:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689211519; x=1720747519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNvnosYzDCc6sheIoCyRHCwT2RcAbNJulFMD0ACdl8A=;
  b=fj7qxI0QiDgm+rubVA48EnB2iStojuWMh6B+iJkFCquhmqc6FxquYbgh
   8ieBMJnBsnJ624vD9O96p6/roPx/vTyDOKqGtfSP2/cEItDcVLa/Bg4qm
   LJ/Gmg0jKHl1FR9H2fs1bbtn85YSyhfky2Rs0XsOTSvv6n1GTtyGbrpnq
   pEH3e6tDH/IU2/3Qno+NfYQhtEzBudqgr3WygvIk9blESwLX42OVgKCZ+
   k7sZrZE3X1w/fQfrmQJUL4Wm0o7fh7Y/dY7wTWWtPW7is2o3PqMaWDVfv
   FWGC704vh91IC4CVAnY8zA+WWtfDR+7gDuRvtTKVU74U9/Se/On+QjO+V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395853966"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="395853966"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 18:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725105266"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="725105266"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 18:25:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJl4w-00065Z-14;
	Thu, 13 Jul 2023 01:25:10 +0000
Date: Thu, 13 Jul 2023 09:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 101/101]
 drivers/power/supply/twl4030_charger.c:1021:54: error: incomplete definition
 of type 'struct device_node'
Message-ID: <202307130922.gi7EleJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: ac7a2a5947cf0a60d9614031b509c5b65e99f87a [101/101] WIP: Remove of.h include from headers
config: hexagon-randconfig-r045-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130922.gi7EleJ6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130922.gi7EleJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130922.gi7EleJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/twl4030_charger.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/power/supply/twl4030_charger.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/power/supply/twl4030_charger.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/power/supply/twl4030_charger.c:242:16: warning: variable 'cur_reg' set but not used [-Wunused-but-set-variable]
     242 |         unsigned reg, cur_reg;
         |                       ^
>> drivers/power/supply/twl4030_charger.c:1021:13: error: call to undeclared function 'of_get_compatible_child'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1021 |                 phynode = of_get_compatible_child(bci->dev->of_node->parent,
         |                           ^
>> drivers/power/supply/twl4030_charger.c:1021:54: error: incomplete definition of type 'struct device_node'
    1021 |                 phynode = of_get_compatible_child(bci->dev->of_node->parent,
         |                                                   ~~~~~~~~~~~~~~~~~^
   include/linux/arch_topology.h:18:8: note: forward declaration of 'struct device_node'
      18 | struct device_node;
         |        ^
>> drivers/power/supply/twl4030_charger.c:1027:4: error: call to undeclared function 'of_node_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1027 |                         of_node_put(phynode);
         |                         ^
>> drivers/power/supply/twl4030_charger.c:1140:21: error: call to undeclared function 'of_match_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1140 |                 .of_match_table = of_match_ptr(twl_bci_of_match),
         |                                   ^
>> drivers/power/supply/twl4030_charger.c:1140:21: error: incompatible integer to pointer conversion initializing 'const struct of_device_id *' with an expression of type 'int' [-Wint-conversion]
    1140 |                 .of_match_table = of_match_ptr(twl_bci_of_match),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/twl4030_charger.c:1140:21: error: initializer element is not a compile-time constant
    1140 |                 .of_match_table = of_match_ptr(twl_bci_of_match),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 6 errors generated.


vim +1021 drivers/power/supply/twl4030_charger.c

297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12   973  
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek         2015-07-30   974  static int twl4030_bci_probe(struct platform_device *pdev)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   975  {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   976  	struct twl4030_bci *bci;
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   977  	const struct twl4030_bci_platform_data *pdata = pdev->dev.platform_data;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   978  	int ret;
28d48f04ead4143 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2011-06-03   979  	u32 reg;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   980  
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23   981  	bci = devm_kzalloc(&pdev->dev, sizeof(*bci), GFP_KERNEL);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   982  	if (bci == NULL)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   983  		return -ENOMEM;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   984  
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   985  	if (!pdata)
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   986  		pdata = twl4030_bci_parse_dt(&pdev->dev);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31   987  
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   988  	bci->ichg_eoc = 80100; /* Stop charging when current drops to here */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   989  	bci->ichg_lo = 241000; /* Low threshold */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   990  	bci->ichg_hi = 500000; /* High threshold */
e4ae537e0482e99 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   991  	bci->ac_cur = 500000; /* 500mA */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   992  	if (allow_usb)
21ae40404f3ca66 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   993  		bci->usb_cur_target = 500000;  /* 500mA */
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   994  	else
21ae40404f3ca66 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   995  		bci->usb_cur_target = 100000;  /* 100mA */
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   996  	bci->usb_mode = CHARGE_AUTO;
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   997  	bci->ac_mode = CHARGE_AUTO;
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30   998  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27   999  	bci->dev = &pdev->dev;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1000  	bci->irq_chg = platform_get_irq(pdev, 0);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1001  	bci->irq_bci = platform_get_irq(pdev, 1);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1002  
61a7784efd3c89f drivers/power/twl4030_charger.c        Nishanth Menon       2014-05-28  1003  	platform_set_drvdata(pdev, bci);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1004  
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1005  	INIT_WORK(&bci->work, twl4030_bci_usb_work);
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1006  	INIT_DELAYED_WORK(&bci->current_worker, twl4030_current_worker);
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1007  
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1008  	bci->channel_vac = devm_iio_channel_get(&pdev->dev, "vac");
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1009  	if (IS_ERR(bci->channel_vac)) {
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1010  		ret = PTR_ERR(bci->channel_vac);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1011  		if (ret == -EPROBE_DEFER)
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1012  			return ret;	/* iio not ready */
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1013  		dev_warn(&pdev->dev, "could not request vac iio channel (%d)",
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1014  			ret);
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1015  		bci->channel_vac = NULL;
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1016  	}
5e6eb025b0d7ee7 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1017  
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1018  	if (bci->dev->of_node) {
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1019  		struct device_node *phynode;
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1020  
9844fb2e3513112 drivers/power/supply/twl4030_charger.c Johan Hovold         2018-08-27 @1021  		phynode = of_get_compatible_child(bci->dev->of_node->parent,
9844fb2e3513112 drivers/power/supply/twl4030_charger.c Johan Hovold         2018-08-27  1022  						  "ti,twl4030-usb");
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1023  		if (phynode) {
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1024  			bci->usb_nb.notifier_call = twl4030_bci_usb_ncb;
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1025  			bci->transceiver = devm_usb_get_phy_by_node(
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1026  				bci->dev, phynode, &bci->usb_nb);
9844fb2e3513112 drivers/power/supply/twl4030_charger.c Johan Hovold         2018-08-27 @1027  			of_node_put(phynode);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1028  			if (IS_ERR(bci->transceiver)) {
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1029  				ret = PTR_ERR(bci->transceiver);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1030  				if (ret == -EPROBE_DEFER)
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1031  					return ret;	/* phy not ready */
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1032  				dev_warn(&pdev->dev, "could not request transceiver (%d)",
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1033  					ret);
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1034  				bci->transceiver = NULL;
7bb5a650f3471e4 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1035  			}
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1036  		}
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1037  	}
3950c95e2c39b99 drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-07-03  1038  
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1039  	bci->ac = devm_power_supply_register(&pdev->dev, &twl4030_bci_ac_desc,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1040  					     NULL);
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1041  	if (IS_ERR(bci->ac)) {
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1042  		ret = PTR_ERR(bci->ac);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1043  		dev_err(&pdev->dev, "failed to register ac: %d\n", ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1044  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1045  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1046  
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1047  	bci->usb = devm_power_supply_register(&pdev->dev, &twl4030_bci_usb_desc,
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1048  					      NULL);
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1049  	if (IS_ERR(bci->usb)) {
297d716f6260cc9 drivers/power/twl4030_charger.c        Krzysztof Kozlowski  2015-03-12  1050  		ret = PTR_ERR(bci->usb);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1051  		dev_err(&pdev->dev, "failed to register usb: %d\n", ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1052  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1053  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1054  
1b7cac23419e139 drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1055  	ret = devm_request_threaded_irq(&pdev->dev, bci->irq_chg, NULL,
a2778b0fe15d7ad drivers/power/twl4030_charger.c        Fengguang Wu         2012-08-23  1056  			twl4030_charger_interrupt, IRQF_ONESHOT, pdev->name,
a2778b0fe15d7ad drivers/power/twl4030_charger.c        Fengguang Wu         2012-08-23  1057  			bci);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1058  	if (ret < 0) {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1059  		dev_err(&pdev->dev, "could not request irq %d, status %d\n",
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1060  			bci->irq_chg, ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1061  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1062  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1063  
1b7cac23419e139 drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1064  	ret = devm_request_threaded_irq(&pdev->dev, bci->irq_bci, NULL,
a2778b0fe15d7ad drivers/power/twl4030_charger.c        Fengguang Wu         2012-08-23  1065  			twl4030_bci_interrupt, IRQF_ONESHOT, pdev->name, bci);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1066  	if (ret < 0) {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1067  		dev_err(&pdev->dev, "could not request irq %d, status %d\n",
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1068  			bci->irq_bci, ret);
325b50aa5d1c7da drivers/power/twl4030_charger.c        NeilBrown            2015-03-23  1069  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1070  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1071  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1072  	/* Enable interrupts now. */
28d48f04ead4143 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2011-06-03  1073  	reg = ~(u32)(TWL4030_ICHGLOW | TWL4030_ICHGEOC | TWL4030_TBATOR2 |
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1074  		TWL4030_TBATOR1 | TWL4030_BATSTS);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1075  	ret = twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, reg,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1076  			       TWL4030_INTERRUPTS_BCIIMR1A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1077  	if (ret < 0) {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1078  		dev_err(&pdev->dev, "failed to unmask interrupts: %d\n", ret);
e8847c565421f1c drivers/power/supply/twl4030_charger.c H. Nikolaus Schaller 2017-06-14  1079  		return ret;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1080  	}
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1081  
28d48f04ead4143 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2011-06-03  1082  	reg = ~(u32)(TWL4030_VBATOV | TWL4030_VBUSOV | TWL4030_ACCHGOV);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1083  	ret = twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, reg,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1084  			       TWL4030_INTERRUPTS_BCIIMR2A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1085  	if (ret < 0)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1086  		dev_warn(&pdev->dev, "failed to unmask interrupts: %d\n", ret);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1087  
1098cb58aed8eb4 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1088  	twl4030_charger_update_current(bci);
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1089  	if (device_create_file(&bci->usb->dev, &dev_attr_mode))
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1090  		dev_warn(&pdev->dev, "could not create sysfs file\n");
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1091  	if (device_create_file(&bci->ac->dev, &dev_attr_mode))
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1092  		dev_warn(&pdev->dev, "could not create sysfs file\n");
aca3c3546396b30 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1093  
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1094  	twl4030_charger_enable_ac(bci, true);
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1095  	if (!IS_ERR_OR_NULL(bci->transceiver))
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1096  		twl4030_bci_usb_ncb(&bci->usb_nb,
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1097  				    bci->transceiver->last_event,
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1098  				    NULL);
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1099  	else
6e37ec8c77e3e65 drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1100  		twl4030_charger_enable_usb(bci, false);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1101  	if (pdata)
210d4bc8a3128e3 drivers/power/twl4030_charger.c        NeilBrown            2012-05-09  1102  		twl4030_charger_enable_backup(pdata->bb_uvolt,
210d4bc8a3128e3 drivers/power/twl4030_charger.c        NeilBrown            2012-05-09  1103  					      pdata->bb_uamp);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1104  	else
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1105  		twl4030_charger_enable_backup(0, 0);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1106  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1107  	return 0;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1108  }
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1109  
420b2d443b7ee2a drivers/power/supply/twl4030_charger.c Dmitry Torokhov      2017-03-01  1110  static int twl4030_bci_remove(struct platform_device *pdev)
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1111  {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1112  	struct twl4030_bci *bci = platform_get_drvdata(pdev);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1113  
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1114  	twl4030_charger_enable_ac(bci, false);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1115  	twl4030_charger_enable_usb(bci, false);
210d4bc8a3128e3 drivers/power/twl4030_charger.c        NeilBrown            2012-05-09  1116  	twl4030_charger_enable_backup(0, 0);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1117  
22d4c33f7335ddf drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1118  	device_remove_file(&bci->usb->dev, &dev_attr_mode);
b04b908d8a2901c drivers/power/twl4030_charger.c        NeilBrown            2015-07-30  1119  	device_remove_file(&bci->ac->dev, &dev_attr_mode);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1120  	/* mask interrupts */
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1121  	twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, 0xff,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1122  			 TWL4030_INTERRUPTS_BCIIMR1A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1123  	twl_i2c_write_u8(TWL4030_MODULE_INTERRUPTS, 0xff,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1124  			 TWL4030_INTERRUPTS_BCIIMR2A);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1125  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1126  	return 0;
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1127  }
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1128  
9e2480d437f99aa drivers/power/supply/twl4030_charger.c Krzysztof Kozlowski  2023-03-11  1129  static const struct of_device_id twl_bci_of_match[] __maybe_unused = {
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1130  	{.compatible = "ti,twl4030-bci", },
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1131  	{ }
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1132  };
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1133  MODULE_DEVICE_TABLE(of, twl_bci_of_match);
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31  1134  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1135  static struct platform_driver twl4030_bci_driver = {
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek         2015-07-30  1136  	.probe = twl4030_bci_probe,
420b2d443b7ee2a drivers/power/supply/twl4030_charger.c Dmitry Torokhov      2017-03-01  1137  	.remove	= twl4030_bci_remove,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1138  	.driver	= {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1139  		.name	= "twl4030_bci",
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown            2013-10-31 @1140  		.of_match_table = of_match_ptr(twl_bci_of_match),
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1141  	},
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1142  };
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek         2015-07-30  1143  module_platform_driver(twl4030_bci_driver);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas    2010-09-27  1144  

:::::: The code at line 1021 was first introduced by commit
:::::: 9844fb2e351311210e6660a9a1c62d17424a6145 power: supply: twl4030-charger: fix OF sibling-node lookup

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
