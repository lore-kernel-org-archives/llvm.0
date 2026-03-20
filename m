Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB353CFF4D;
	Fri, 20 Mar 2026 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023835; cv=none; b=QqMZgWBCqWNp5V2VRzzN/NjXGNVZ6L65QSAIaHvZ669rUieoOk6gLN0TfvEtaCEZayqi7ijLX8PVmrvpVWQ2uwjSzZBRSus8C/VaYkwbGoNxhCEGqOlO3lOx9xFuCGhin2b7YTyuySd+hdULBKXIEj3m22ZlaZzGuaydJ0VwPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023835; c=relaxed/simple;
	bh=KxdVgLtOTeImyENstNAgOZZQCVvGhMky6D0LvTxmWPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ekLmBd6FGVfFBv5H3XW309K+mmv+lSOo7LkXWEPf28iaZoNug5oJL5+4knzshlbOqWmeJpSA/BKddp0RZIshD9ZfiFVotdHA1ka+/S3WFBygjY5j81FSDMnYFKXFBHiqyvgCEuwPkZRvJMP3aPgJB87EbaMLmX7KwTmgd8K7QfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVzv7c+p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVzv7c+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774023833; x=1805559833;
  h=date:from:to:cc:subject:message-id;
  bh=KxdVgLtOTeImyENstNAgOZZQCVvGhMky6D0LvTxmWPk=;
  b=kVzv7c+pQHe9WTOxtRaHPmKRr4IAsk/538A57TSMwLzGBfTIwd3V6Rf3
   8ObzMfI0F+4XAbjo8J8n/7aYRCvImtSOKr6sHVSZOzU/C4ktA9DT49I/n
   7aef0unL7NpEGUHAyvKTfdyE7TufG4VZAKnlJn7JgQqyPvNdQuvoRFv3W
   x63JPtMJ26vT61GpPkpYkCpYOfq5kXs4mn8m2M1iNMM+Oab3C45C3X3F/
   a6uYUmrS+Yah1HRKfp590wh9g6WCqhGvBnRAUikCoFTavAYJWmsddjmVs
   gURdt9xMwsrrKVyp6baOGl18TyvuCYgWz+yu/yygkdvV1sZ5ittNWi7RG
   Q==;
X-CSE-ConnectionGUID: Yb5i1oLQTiGkOjPQCmAT9g==
X-CSE-MsgGUID: CyaplZpERlyJVukgBPOVEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74814897"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74814897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 09:23:48 -0700
X-CSE-ConnectionGUID: PY30DsFNTVWCzNA+DHyZ0w==
X-CSE-MsgGUID: ClIxtv3LTIaIJ/ULDH//LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220664933"
Received: from lkp-server01.sh.intel.com (HELO ba623fe84fe1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2026 09:23:45 -0700
Received: from kbuild by ba623fe84fe1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3cdT-00000000081-0F2p;
	Fri, 20 Mar 2026 16:23:43 +0000
Date: Sat, 21 Mar 2026 00:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 6897/7971]
 drivers/hsi/controllers/omap_ssi_port.c:1121:12: warning: address of array
 'ssi->port' will always evaluate to 'true'
Message-ID: <202603202333.o9PN1JUT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: e61af3ca893363838f263f3528476f6e1faed9aa [6897/7971] hsi: hsi_core: use kzalloc_flex
config: arm-randconfig-002-20260320 (https://download.01.org/0day-ci/archive/20260320/202603202333.o9PN1JUT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202333.o9PN1JUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202333.o9PN1JUT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hsi/controllers/omap_ssi_port.c:455:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     455 |         u32 val;
         |             ^
>> drivers/hsi/controllers/omap_ssi_port.c:1121:12: warning: address of array 'ssi->port' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1121 |         if (!ssi->port || !omap_ssi->port) {
         |             ~~~~~~^~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
>> drivers/hsi/controllers/omap_ssi_port.c:1121:12: warning: address of array 'ssi->port' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1121 |         if (!ssi->port || !omap_ssi->port) {
         |             ~~~~~~^~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/hsi/controllers/omap_ssi_port.c:1121:12: warning: address of array 'ssi->port' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1121 |         if (!ssi->port || !omap_ssi->port) {
         |             ~~~~~~^~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/hsi/controllers/omap_ssi_port.c:1302:6: warning: variable 'mode' set but not used [-Wunused-but-set-variable]
    1302 |         u32 mode;
         |             ^
   5 warnings generated.


vim +1121 drivers/hsi/controllers/omap_ssi_port.c

b209e047bc7432 Sebastian Reichel 2013-12-15  1107  
0845e1f20af100 Sebastian Reichel 2016-04-30  1108  static int ssi_port_probe(struct platform_device *pd)
b209e047bc7432 Sebastian Reichel 2013-12-15  1109  {
b209e047bc7432 Sebastian Reichel 2013-12-15  1110  	struct device_node *np = pd->dev.of_node;
b209e047bc7432 Sebastian Reichel 2013-12-15  1111  	struct hsi_port *port;
b209e047bc7432 Sebastian Reichel 2013-12-15  1112  	struct omap_ssi_port *omap_port;
b209e047bc7432 Sebastian Reichel 2013-12-15  1113  	struct hsi_controller *ssi = dev_get_drvdata(pd->dev.parent);
b209e047bc7432 Sebastian Reichel 2013-12-15  1114  	struct omap_ssi_controller *omap_ssi = hsi_controller_drvdata(ssi);
73e6ce09c068d4 Sebastian Reichel 2016-04-30  1115  	struct gpio_desc *cawake_gpio = NULL;
b209e047bc7432 Sebastian Reichel 2013-12-15  1116  	u32 port_id;
b209e047bc7432 Sebastian Reichel 2013-12-15  1117  	int err;
b209e047bc7432 Sebastian Reichel 2013-12-15  1118  
b209e047bc7432 Sebastian Reichel 2013-12-15  1119  	dev_dbg(&pd->dev, "init ssi port...\n");
b209e047bc7432 Sebastian Reichel 2013-12-15  1120  
b209e047bc7432 Sebastian Reichel 2013-12-15 @1121  	if (!ssi->port || !omap_ssi->port) {
b209e047bc7432 Sebastian Reichel 2013-12-15  1122  		dev_err(&pd->dev, "ssi controller not initialized!\n");
b209e047bc7432 Sebastian Reichel 2013-12-15  1123  		err = -ENODEV;
b209e047bc7432 Sebastian Reichel 2013-12-15  1124  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1125  	}
b209e047bc7432 Sebastian Reichel 2013-12-15  1126  
b209e047bc7432 Sebastian Reichel 2013-12-15  1127  	/* get id of first uninitialized port in controller */
b209e047bc7432 Sebastian Reichel 2013-12-15  1128  	for (port_id = 0; port_id < ssi->num_ports && omap_ssi->port[port_id];
b209e047bc7432 Sebastian Reichel 2013-12-15  1129  		port_id++)
b209e047bc7432 Sebastian Reichel 2013-12-15  1130  		;
b209e047bc7432 Sebastian Reichel 2013-12-15  1131  
b209e047bc7432 Sebastian Reichel 2013-12-15  1132  	if (port_id >= ssi->num_ports) {
b209e047bc7432 Sebastian Reichel 2013-12-15  1133  		dev_err(&pd->dev, "port id out of range!\n");
b209e047bc7432 Sebastian Reichel 2013-12-15  1134  		err = -ENODEV;
b209e047bc7432 Sebastian Reichel 2013-12-15  1135  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1136  	}
b209e047bc7432 Sebastian Reichel 2013-12-15  1137  
b209e047bc7432 Sebastian Reichel 2013-12-15  1138  	port = ssi->port[port_id];
b209e047bc7432 Sebastian Reichel 2013-12-15  1139  
b209e047bc7432 Sebastian Reichel 2013-12-15  1140  	if (!np) {
b209e047bc7432 Sebastian Reichel 2013-12-15  1141  		dev_err(&pd->dev, "missing device tree data\n");
b209e047bc7432 Sebastian Reichel 2013-12-15  1142  		err = -EINVAL;
b209e047bc7432 Sebastian Reichel 2013-12-15  1143  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1144  	}
b209e047bc7432 Sebastian Reichel 2013-12-15  1145  
73e6ce09c068d4 Sebastian Reichel 2016-04-30  1146  	cawake_gpio = devm_gpiod_get(&pd->dev, "ti,ssi-cawake", GPIOD_IN);
73e6ce09c068d4 Sebastian Reichel 2016-04-30  1147  	if (IS_ERR(cawake_gpio)) {
73e6ce09c068d4 Sebastian Reichel 2016-04-30  1148  		err = PTR_ERR(cawake_gpio);
73e6ce09c068d4 Sebastian Reichel 2016-04-30  1149  		dev_err(&pd->dev, "couldn't get cawake gpio (err=%d)!\n", err);
b209e047bc7432 Sebastian Reichel 2013-12-15  1150  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1151  	}
b209e047bc7432 Sebastian Reichel 2013-12-15  1152  
b209e047bc7432 Sebastian Reichel 2013-12-15  1153  	omap_port = devm_kzalloc(&port->device, sizeof(*omap_port), GFP_KERNEL);
b209e047bc7432 Sebastian Reichel 2013-12-15  1154  	if (!omap_port) {
b209e047bc7432 Sebastian Reichel 2013-12-15  1155  		err = -ENOMEM;
b209e047bc7432 Sebastian Reichel 2013-12-15  1156  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1157  	}
b209e047bc7432 Sebastian Reichel 2013-12-15  1158  	omap_port->wake_gpio = cawake_gpio;
b209e047bc7432 Sebastian Reichel 2013-12-15  1159  	omap_port->pdev = &pd->dev;
b209e047bc7432 Sebastian Reichel 2013-12-15  1160  	omap_port->port_id = port_id;
b209e047bc7432 Sebastian Reichel 2013-12-15  1161  
4e552310cdf0c8 Sebastian Reichel 2016-05-20  1162  	INIT_DEFERRABLE_WORK(&omap_port->errqueue_work, ssi_process_errqueue);
7c5d81620ecd37 Sebastian Reichel 2016-05-11  1163  	INIT_WORK(&omap_port->work, start_tx_work);
7c5d81620ecd37 Sebastian Reichel 2016-05-11  1164  
b209e047bc7432 Sebastian Reichel 2013-12-15  1165  	/* initialize HSI port */
b209e047bc7432 Sebastian Reichel 2013-12-15  1166  	port->async	= ssi_async;
b209e047bc7432 Sebastian Reichel 2013-12-15  1167  	port->setup	= ssi_setup;
b209e047bc7432 Sebastian Reichel 2013-12-15  1168  	port->flush	= ssi_flush;
b209e047bc7432 Sebastian Reichel 2013-12-15  1169  	port->start_tx	= ssi_start_tx;
b209e047bc7432 Sebastian Reichel 2013-12-15  1170  	port->stop_tx	= ssi_stop_tx;
b209e047bc7432 Sebastian Reichel 2013-12-15  1171  	port->release	= ssi_release;
b209e047bc7432 Sebastian Reichel 2013-12-15  1172  	hsi_port_set_drvdata(port, omap_port);
b209e047bc7432 Sebastian Reichel 2013-12-15  1173  	omap_ssi->port[port_id] = omap_port;
b209e047bc7432 Sebastian Reichel 2013-12-15  1174  
b209e047bc7432 Sebastian Reichel 2013-12-15  1175  	platform_set_drvdata(pd, port);
b209e047bc7432 Sebastian Reichel 2013-12-15  1176  
b209e047bc7432 Sebastian Reichel 2013-12-15  1177  	err = ssi_port_get_iomem(pd, "tx", &omap_port->sst_base,
b209e047bc7432 Sebastian Reichel 2013-12-15  1178  		&omap_port->sst_dma);
b209e047bc7432 Sebastian Reichel 2013-12-15  1179  	if (err < 0)
b209e047bc7432 Sebastian Reichel 2013-12-15  1180  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1181  	err = ssi_port_get_iomem(pd, "rx", &omap_port->ssr_base,
b209e047bc7432 Sebastian Reichel 2013-12-15  1182  		&omap_port->ssr_dma);
b209e047bc7432 Sebastian Reichel 2013-12-15  1183  	if (err < 0)
b209e047bc7432 Sebastian Reichel 2013-12-15  1184  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1185  
b209e047bc7432 Sebastian Reichel 2013-12-15  1186  	err = ssi_port_irq(port, pd);
b209e047bc7432 Sebastian Reichel 2013-12-15  1187  	if (err < 0)
b209e047bc7432 Sebastian Reichel 2013-12-15  1188  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1189  	err = ssi_wake_irq(port, pd);
b209e047bc7432 Sebastian Reichel 2013-12-15  1190  	if (err < 0)
b209e047bc7432 Sebastian Reichel 2013-12-15  1191  		goto error;
b209e047bc7432 Sebastian Reichel 2013-12-15  1192  
b209e047bc7432 Sebastian Reichel 2013-12-15  1193  	ssi_queues_init(omap_port);
b209e047bc7432 Sebastian Reichel 2013-12-15  1194  	spin_lock_init(&omap_port->lock);
b209e047bc7432 Sebastian Reichel 2013-12-15  1195  	spin_lock_init(&omap_port->wk_lock);
b209e047bc7432 Sebastian Reichel 2013-12-15  1196  	omap_port->dev = &port->device;
b209e047bc7432 Sebastian Reichel 2013-12-15  1197  
ad60db2f9fe336 Sebastian Reichel 2016-05-11  1198  	pm_runtime_use_autosuspend(omap_port->pdev);
ad60db2f9fe336 Sebastian Reichel 2016-05-11  1199  	pm_runtime_set_autosuspend_delay(omap_port->pdev, 250);
b209e047bc7432 Sebastian Reichel 2013-12-15  1200  	pm_runtime_enable(omap_port->pdev);
b209e047bc7432 Sebastian Reichel 2013-12-15  1201  

:::::: The code at line 1121 was first introduced by commit
:::::: b209e047bc743247f74ce79e8827ae1ed556bae0 HSI: Introduce OMAP SSI driver

:::::: TO: Sebastian Reichel <sre@kernel.org>
:::::: CC: Sebastian Reichel <sre@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
