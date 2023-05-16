Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF61D2B4;
	Tue, 16 May 2023 06:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684218060; x=1715754060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1LYibf3XqHBB5FM2eKDuLasLLZNKoSKYxu/8aebyPfc=;
  b=W+Lv8IZliXSddWxbb/X40W2JgNabEW71LI/cGpgjcQQGKiAUhkctsppp
   m4V05Ps7xceSo5IhMelq5JRZH1PtSuBCzD/J97no3aflZZuSP2JJ7KHn0
   pgxHi6L7jEc2FHcsqyfKoxLUjeVsKQQQ3rGzZZP9rOEaB6SU9D7Y3lo3x
   NuqHVz1eYKReaEonoZtw2CNCe057r+GgmCUexYZ5utmQa2/rj0XyDd/rm
   WBOsU35ujGnw7pTIMMZVjI8CFwiAipHH+4DLb3eeAWzNlM/T9EGLmr907
   4oAVneJ7L22G1k3IodHd2TBmc/GCZz9LUhSNBsUtoaPPaOGnKh1g+0gio
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331010746"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="331010746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 23:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="845559047"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="845559047"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 May 2023 23:20:58 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyo3N-00076Q-33;
	Tue, 16 May 2023 06:20:57 +0000
Date: Tue, 16 May 2023 14:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] Revert "sc16is7xx: Separate GPIOs from modem control
 lines"
Message-ID: <202305161450.DFSDFYLS-lkp@intel.com>
References: <20230515160206.2801991-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515160206.2801991-1-hugo@hugovil.com>

Hi Hugo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.4-rc2 next-20230516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hugo-Villeneuve/Revert-sc16is7xx-Separate-GPIOs-from-modem-control-lines/20230516-022330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230515160206.2801991-1-hugo%40hugovil.com
patch subject: [RFC PATCH] Revert "sc16is7xx: Separate GPIOs from modem control lines"
config: i386-randconfig-i053-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161450.DFSDFYLS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/07f35c5b5f2d204418ea211f585d140c9df5506b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hugo-Villeneuve/Revert-sc16is7xx-Separate-GPIOs-from-modem-control-lines/20230516-022330
        git checkout 07f35c5b5f2d204418ea211f585d140c9df5506b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161450.DFSDFYLS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/sc16is7xx.c:1454:16: error: no member named 'has_mctrl' in 'struct sc16is7xx_devtype'
                   if (devtype->has_mctrl)
                       ~~~~~~~  ^
   1 error generated.


vim +1454 drivers/tty/serial/sc16is7xx.c

267913ecf73745 Ilpo Järvinen       2022-06-06  1352  
dfeae619d781de Jon Ringle          2014-04-24  1353  static int sc16is7xx_probe(struct device *dev,
68be64ca7e2adc Jakub Kicinski      2015-07-31  1354  			   const struct sc16is7xx_devtype *devtype,
37f3965d74d5b5 Daniel Mack         2020-05-21  1355  			   struct regmap *regmap, int irq)
dfeae619d781de Jon Ringle          2014-04-24  1356  {
24bc6e68efa00f Andy Shevchenko     2019-03-18  1357  	unsigned long freq = 0, *pfreq = dev_get_platdata(dev);
2aa916e67db3e6 Daniel Mack         2020-05-21  1358  	unsigned int val;
24bc6e68efa00f Andy Shevchenko     2019-03-18  1359  	u32 uartclk = 0;
dfeae619d781de Jon Ringle          2014-04-24  1360  	int i, ret;
dfeae619d781de Jon Ringle          2014-04-24  1361  	struct sc16is7xx_port *s;
dfeae619d781de Jon Ringle          2014-04-24  1362  
dfeae619d781de Jon Ringle          2014-04-24  1363  	if (IS_ERR(regmap))
dfeae619d781de Jon Ringle          2014-04-24  1364  		return PTR_ERR(regmap);
dfeae619d781de Jon Ringle          2014-04-24  1365  
2aa916e67db3e6 Daniel Mack         2020-05-21  1366  	/*
2aa916e67db3e6 Daniel Mack         2020-05-21  1367  	 * This device does not have an identification register that would
2aa916e67db3e6 Daniel Mack         2020-05-21  1368  	 * tell us if we are really connected to the correct device.
2aa916e67db3e6 Daniel Mack         2020-05-21  1369  	 * The best we can do is to check if communication is at all possible.
2aa916e67db3e6 Daniel Mack         2020-05-21  1370  	 */
2aa916e67db3e6 Daniel Mack         2020-05-21  1371  	ret = regmap_read(regmap,
2aa916e67db3e6 Daniel Mack         2020-05-21  1372  			  SC16IS7XX_LSR_REG << SC16IS7XX_REG_SHIFT, &val);
2aa916e67db3e6 Daniel Mack         2020-05-21  1373  	if (ret < 0)
158e800e0fde91 Annaliese McDermond 2021-03-29  1374  		return -EPROBE_DEFER;
2aa916e67db3e6 Daniel Mack         2020-05-21  1375  
dfeae619d781de Jon Ringle          2014-04-24  1376  	/* Alloc port structure */
84f1c5c0174ace Gustavo A. R. Silva 2019-01-04  1377  	s = devm_kzalloc(dev, struct_size(s, p, devtype->nr_uart), GFP_KERNEL);
dfeae619d781de Jon Ringle          2014-04-24  1378  	if (!s) {
dfeae619d781de Jon Ringle          2014-04-24  1379  		dev_err(dev, "Error allocating port structure\n");
dfeae619d781de Jon Ringle          2014-04-24  1380  		return -ENOMEM;
dfeae619d781de Jon Ringle          2014-04-24  1381  	}
dfeae619d781de Jon Ringle          2014-04-24  1382  
24bc6e68efa00f Andy Shevchenko     2019-03-18  1383  	/* Always ask for fixed clock rate from a property. */
24bc6e68efa00f Andy Shevchenko     2019-03-18  1384  	device_property_read_u32(dev, "clock-frequency", &uartclk);
24bc6e68efa00f Andy Shevchenko     2019-03-18  1385  
cb1b206cff461d Andy Shevchenko     2021-05-17  1386  	s->clk = devm_clk_get_optional(dev, NULL);
cb1b206cff461d Andy Shevchenko     2021-05-17  1387  	if (IS_ERR(s->clk))
cb1b206cff461d Andy Shevchenko     2021-05-17  1388  		return PTR_ERR(s->clk);
cb1b206cff461d Andy Shevchenko     2021-05-17  1389  
cb1b206cff461d Andy Shevchenko     2021-05-17  1390  	ret = clk_prepare_enable(s->clk);
cb1b206cff461d Andy Shevchenko     2021-05-17  1391  	if (ret)
cb1b206cff461d Andy Shevchenko     2021-05-17  1392  		return ret;
cb1b206cff461d Andy Shevchenko     2021-05-17  1393  
cb1b206cff461d Andy Shevchenko     2021-05-17  1394  	freq = clk_get_rate(s->clk);
cb1b206cff461d Andy Shevchenko     2021-05-17  1395  	if (freq == 0) {
24bc6e68efa00f Andy Shevchenko     2019-03-18  1396  		if (uartclk)
24bc6e68efa00f Andy Shevchenko     2019-03-18  1397  			freq = uartclk;
dfeae619d781de Jon Ringle          2014-04-24  1398  		if (pfreq)
dfeae619d781de Jon Ringle          2014-04-24  1399  			freq = *pfreq;
24bc6e68efa00f Andy Shevchenko     2019-03-18  1400  		if (freq)
24bc6e68efa00f Andy Shevchenko     2019-03-18  1401  			dev_dbg(dev, "Clock frequency: %luHz\n", freq);
dfeae619d781de Jon Ringle          2014-04-24  1402  		else
cb1b206cff461d Andy Shevchenko     2021-05-17  1403  			return -EINVAL;
dfeae619d781de Jon Ringle          2014-04-24  1404  	}
dfeae619d781de Jon Ringle          2014-04-24  1405  
dfeae619d781de Jon Ringle          2014-04-24  1406  	s->regmap = regmap;
dfeae619d781de Jon Ringle          2014-04-24  1407  	s->devtype = devtype;
dfeae619d781de Jon Ringle          2014-04-24  1408  	dev_set_drvdata(dev, s);
30ec514d440cf2 Phil Elwell         2018-09-12  1409  	mutex_init(&s->efr_lock);
dfeae619d781de Jon Ringle          2014-04-24  1410  
3989144f863ac5 Petr Mladek         2016-10-11  1411  	kthread_init_worker(&s->kworker);
9e6f4ca3e567d5 Jakub Kicinski      2015-05-29  1412  	s->kworker_task = kthread_run(kthread_worker_fn, &s->kworker,
9e6f4ca3e567d5 Jakub Kicinski      2015-05-29  1413  				      "sc16is7xx");
9e6f4ca3e567d5 Jakub Kicinski      2015-05-29  1414  	if (IS_ERR(s->kworker_task)) {
9e6f4ca3e567d5 Jakub Kicinski      2015-05-29  1415  		ret = PTR_ERR(s->kworker_task);
c64349722d1417 Jakub Kicinski      2015-07-31  1416  		goto out_clk;
9e6f4ca3e567d5 Jakub Kicinski      2015-05-29  1417  	}
28d2f209cd1620 Peter Zijlstra      2020-04-21  1418  	sched_set_fifo(s->kworker_task);
9e6f4ca3e567d5 Jakub Kicinski      2015-05-29  1419  
43c51bb573aab6 Florian Vallee      2016-07-19  1420  	/* reset device, purging any pending irq / data */
43c51bb573aab6 Florian Vallee      2016-07-19  1421  	regmap_write(s->regmap, SC16IS7XX_IOCONTROL_REG << SC16IS7XX_REG_SHIFT,
43c51bb573aab6 Florian Vallee      2016-07-19  1422  			SC16IS7XX_IOCONTROL_SRESET_BIT);
43c51bb573aab6 Florian Vallee      2016-07-19  1423  
dfeae619d781de Jon Ringle          2014-04-24  1424  	for (i = 0; i < devtype->nr_uart; ++i) {
e92a886bf7841c Jakub Kicinski      2015-07-31  1425  		s->p[i].line		= i;
dfeae619d781de Jon Ringle          2014-04-24  1426  		/* Initialize port data */
dfeae619d781de Jon Ringle          2014-04-24  1427  		s->p[i].port.dev	= dev;
dfeae619d781de Jon Ringle          2014-04-24  1428  		s->p[i].port.irq	= irq;
dfeae619d781de Jon Ringle          2014-04-24  1429  		s->p[i].port.type	= PORT_SC16IS7XX;
dfeae619d781de Jon Ringle          2014-04-24  1430  		s->p[i].port.fifosize	= SC16IS7XX_FIFO_SIZE;
dfeae619d781de Jon Ringle          2014-04-24  1431  		s->p[i].port.flags	= UPF_FIXED_TYPE | UPF_LOW_LATENCY;
5da6b1c079e680 Daniel Mack         2020-09-01  1432  		s->p[i].port.iobase	= i;
dfeae619d781de Jon Ringle          2014-04-24  1433  		s->p[i].port.iotype	= UPIO_PORT;
dfeae619d781de Jon Ringle          2014-04-24  1434  		s->p[i].port.uartclk	= freq;
b57d15fe8b37fe Ricardo Ribalda     2014-11-06  1435  		s->p[i].port.rs485_config = sc16is7xx_config_rs485;
0139da50dc53f0 Ilpo Järvinen       2022-07-04  1436  		s->p[i].port.rs485_supported = sc16is7xx_rs485_supported;
dfeae619d781de Jon Ringle          2014-04-24  1437  		s->p[i].port.ops	= &sc16is7xx_ops;
21144bab4f1191 Tomasz Moń          2022-03-01  1438  		s->p[i].old_mctrl	= 0;
c64349722d1417 Jakub Kicinski      2015-07-31  1439  		s->p[i].port.line	= sc16is7xx_alloc_line();
21144bab4f1191 Tomasz Moń          2022-03-01  1440  
c64349722d1417 Jakub Kicinski      2015-07-31  1441  		if (s->p[i].port.line >= SC16IS7XX_MAX_DEVS) {
c64349722d1417 Jakub Kicinski      2015-07-31  1442  			ret = -ENOMEM;
c64349722d1417 Jakub Kicinski      2015-07-31  1443  			goto out_ports;
c64349722d1417 Jakub Kicinski      2015-07-31  1444  		}
c64349722d1417 Jakub Kicinski      2015-07-31  1445  
dfeae619d781de Jon Ringle          2014-04-24  1446  		/* Disable all interrupts */
dfeae619d781de Jon Ringle          2014-04-24  1447  		sc16is7xx_port_write(&s->p[i].port, SC16IS7XX_IER_REG, 0);
dfeae619d781de Jon Ringle          2014-04-24  1448  		/* Disable TX/RX */
dfeae619d781de Jon Ringle          2014-04-24  1449  		sc16is7xx_port_write(&s->p[i].port, SC16IS7XX_EFCR_REG,
dfeae619d781de Jon Ringle          2014-04-24  1450  				     SC16IS7XX_EFCR_RXDISABLE_BIT |
dfeae619d781de Jon Ringle          2014-04-24  1451  				     SC16IS7XX_EFCR_TXDISABLE_BIT);
21144bab4f1191 Tomasz Moń          2022-03-01  1452  
21144bab4f1191 Tomasz Moń          2022-03-01  1453  		/* Use GPIO lines as modem status registers */
21144bab4f1191 Tomasz Moń          2022-03-01 @1454  		if (devtype->has_mctrl)
21144bab4f1191 Tomasz Moń          2022-03-01  1455  			sc16is7xx_port_write(&s->p[i].port,
21144bab4f1191 Tomasz Moń          2022-03-01  1456  					     SC16IS7XX_IOCONTROL_REG,
21144bab4f1191 Tomasz Moń          2022-03-01  1457  					     SC16IS7XX_IOCONTROL_MODEM_BIT);
21144bab4f1191 Tomasz Moń          2022-03-01  1458  
a0104085362ff9 Jakub Kicinski      2015-05-29  1459  		/* Initialize kthread work structs */
3989144f863ac5 Petr Mladek         2016-10-11  1460  		kthread_init_work(&s->p[i].tx_work, sc16is7xx_tx_proc);
3989144f863ac5 Petr Mladek         2016-10-11  1461  		kthread_init_work(&s->p[i].reg_work, sc16is7xx_reg_proc);
21144bab4f1191 Tomasz Moń          2022-03-01  1462  		kthread_init_delayed_work(&s->p[i].ms_work, sc16is7xx_ms_proc);
dfeae619d781de Jon Ringle          2014-04-24  1463  		/* Register port */
c64349722d1417 Jakub Kicinski      2015-07-31  1464  		uart_add_one_port(&sc16is7xx_uart, &s->p[i].port);
43c51bb573aab6 Florian Vallee      2016-07-19  1465  
43c51bb573aab6 Florian Vallee      2016-07-19  1466  		/* Enable EFR */
43c51bb573aab6 Florian Vallee      2016-07-19  1467  		sc16is7xx_port_write(&s->p[i].port, SC16IS7XX_LCR_REG,
43c51bb573aab6 Florian Vallee      2016-07-19  1468  				     SC16IS7XX_LCR_CONF_MODE_B);
43c51bb573aab6 Florian Vallee      2016-07-19  1469  
43c51bb573aab6 Florian Vallee      2016-07-19  1470  		regcache_cache_bypass(s->regmap, true);
43c51bb573aab6 Florian Vallee      2016-07-19  1471  
43c51bb573aab6 Florian Vallee      2016-07-19  1472  		/* Enable write access to enhanced features */
43c51bb573aab6 Florian Vallee      2016-07-19  1473  		sc16is7xx_port_write(&s->p[i].port, SC16IS7XX_EFR_REG,
43c51bb573aab6 Florian Vallee      2016-07-19  1474  				     SC16IS7XX_EFR_ENABLE_BIT);
43c51bb573aab6 Florian Vallee      2016-07-19  1475  
43c51bb573aab6 Florian Vallee      2016-07-19  1476  		regcache_cache_bypass(s->regmap, false);
43c51bb573aab6 Florian Vallee      2016-07-19  1477  
43c51bb573aab6 Florian Vallee      2016-07-19  1478  		/* Restore access to general registers */
43c51bb573aab6 Florian Vallee      2016-07-19  1479  		sc16is7xx_port_write(&s->p[i].port, SC16IS7XX_LCR_REG, 0x00);
43c51bb573aab6 Florian Vallee      2016-07-19  1480  
dfeae619d781de Jon Ringle          2014-04-24  1481  		/* Go to suspend mode */
dfeae619d781de Jon Ringle          2014-04-24  1482  		sc16is7xx_power(&s->p[i].port, 0);
dfeae619d781de Jon Ringle          2014-04-24  1483  	}
dfeae619d781de Jon Ringle          2014-04-24  1484  
9eb90d57b55a0a Pascal Huerst       2020-05-29  1485  	if (dev->of_node) {
9eb90d57b55a0a Pascal Huerst       2020-05-29  1486  		struct property *prop;
9eb90d57b55a0a Pascal Huerst       2020-05-29  1487  		const __be32 *p;
9eb90d57b55a0a Pascal Huerst       2020-05-29  1488  		u32 u;
9eb90d57b55a0a Pascal Huerst       2020-05-29  1489  
9eb90d57b55a0a Pascal Huerst       2020-05-29  1490  		of_property_for_each_u32(dev->of_node, "irda-mode-ports",
9eb90d57b55a0a Pascal Huerst       2020-05-29  1491  					 prop, p, u)
9eb90d57b55a0a Pascal Huerst       2020-05-29  1492  			if (u < devtype->nr_uart)
9eb90d57b55a0a Pascal Huerst       2020-05-29  1493  				s->p[u].irda_mode = true;
9eb90d57b55a0a Pascal Huerst       2020-05-29  1494  	}
9eb90d57b55a0a Pascal Huerst       2020-05-29  1495  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
