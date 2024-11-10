Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B1381AF;
	Sun, 10 Nov 2024 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731264397; cv=none; b=t3EJxF9K71G7m31+gSgXuWm5afb4oGakmD7JjB+7SCh5259A1V+tJn41pcg8fjfLS1+XpXmiZtT5xA0l/7JHLj7N8PkA39nD6M4U0irRmk2VxHlnYoo9ydujiuYKuenq3T0aOp0kOJhxHf4nn6NHt7YX7ihoBOo73EQqjCIeHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731264397; c=relaxed/simple;
	bh=8W9wh51pmo0zI4oowrqw2HFTQTMGty2kHt8++d+tMmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrDCaqIcsobBUHZqqqIs23tOOaKWJgq3EZcUKSJoGTlWKkGhpihNowKdP/+fMM8U8YFzX6HFFSnh2EDeHe1qgABMqVfFxnsD9AYEO8RFmmzq6Seh0p9DW+djKDSChxE3Wjx/ur38/IAB2gt/MOaaXMPnnX/RnEjcxH8oNrt1AaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B64FEPj1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B64FEPj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731264394; x=1762800394;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8W9wh51pmo0zI4oowrqw2HFTQTMGty2kHt8++d+tMmo=;
  b=B64FEPj1cExTDqHMWiX9+C8KLB9XkPJFqep6ZmHjr8r0oR1Ze4Y+TyBG
   DPwgGMdqot2JB8rttcjzH+UNh3Pljg0KZOYBSyB4KBN7ZFRsT7aVyva7+
   j84hZ3wgt0sOsKTeiZiJqq4VleKXn8AOMif2Ew/wDJrTgJ+svH2yHHD6l
   iI3YPQ+ZTx/auEW5swNizUygsTpDTti/pfG803RIaem8Eqyvi7Uoc7DQ6
   942OKun+0Sw+kFahKga4/E4Xrbgi5ukWuLjxXTT7Ys8jcbP4G+OnUYOey
   VzJ6wZhslA6PUKG4Pz9lqU3r4rnNFU4ULdoNvM+TU86B+9HDxOUfF5f3y
   g==;
X-CSE-ConnectionGUID: V2Jd1BWMRMOY532oy8qEZA==
X-CSE-MsgGUID: WYe7xIbuTrihqHsRKK0/Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30491324"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="30491324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 10:46:33 -0800
X-CSE-ConnectionGUID: JD4th0RdRaGxHaO82hGoXg==
X-CSE-MsgGUID: oDiAcnibQxmdVzDL/kGisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="91640779"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2024 10:46:32 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tACxC-0000Kr-0S;
	Sun, 10 Nov 2024 18:46:30 +0000
Date: Mon, 11 Nov 2024 02:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/power-supply-extensions 8/10]
 drivers/power/supply/power_supply_core.c:1562:3: error: cannot jump from
 this goto statement to its label
Message-ID: <202411110228.WLGCL9mP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/power-supply-extensions
head:   ee235561e04ef46714a1798c637adca0f42d465a
commit: d1e25c2e1ac4bd056f2b848a35158363df567751 [8/10] power: supply: core: implement extension API
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241111/202411110228.WLGCL9mP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411110228.WLGCL9mP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411110228.WLGCL9mP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/power_supply_core.c:1562:3: error: cannot jump from this goto statement to its label
    1562 |                 goto register_thermal_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1564:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1564 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:48:1: note: expanded from here
      48 | __UNIQUE_ID_guard508
         | ^
   drivers/power/supply/power_supply_core.c:1558:3: error: cannot jump from this goto statement to its label
    1558 |                 goto wakeup_init_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1564:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1564 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:48:1: note: expanded from here
      48 | __UNIQUE_ID_guard508
         | ^
   drivers/power/supply/power_supply_core.c:1554:3: error: cannot jump from this goto statement to its label
    1554 |                 goto device_add_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1564:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1564 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:48:1: note: expanded from here
      48 | __UNIQUE_ID_guard508
         | ^
   drivers/power/supply/power_supply_core.c:1545:4: error: cannot jump from this goto statement to its label
    1545 |                         goto check_supplies_failed;
         |                         ^
   drivers/power/supply/power_supply_core.c:1564:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1564 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:48:1: note: expanded from here
      48 | __UNIQUE_ID_guard508
         | ^
   drivers/power/supply/power_supply_core.c:1534:3: error: cannot jump from this goto statement to its label
    1534 |                 goto check_supplies_failed;
         |                 ^
   drivers/power/supply/power_supply_core.c:1564:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1564 |         guard(rwsem_read)(&psy->extensions_sem);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b


vim +1562 drivers/power/supply/power_supply_core.c

3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09  1482  
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1483  static struct power_supply *__must_check
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1484  __power_supply_register(struct device *parent,
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1485  				   const struct power_supply_desc *desc,
85d319e14f301e drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-10-05  1486  				   const struct power_supply_config *cfg)
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1487  {
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1488  	struct device *dev;
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1489  	struct power_supply *psy;
9ba533eb99bb2a drivers/power/supply/power_supply_core.c Matthias Kaehlcke   2021-09-01  1490  	int rc;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1491  
bfaecf465a058b drivers/power/supply/power_supply_core.c qinyu               2023-02-23  1492  	if (!desc || !desc->name || !desc->properties || !desc->num_properties)
bfaecf465a058b drivers/power/supply/power_supply_core.c qinyu               2023-02-23  1493  		return ERR_PTR(-EINVAL);
bfaecf465a058b drivers/power/supply/power_supply_core.c qinyu               2023-02-23  1494  
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1495  	if (!parent)
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1496  		pr_warn("%s: Expected proper parent device for '%s'\n",
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1497  			__func__, desc->name);
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1498  
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1499  	psy = kzalloc(sizeof(*psy), GFP_KERNEL);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1500  	if (!psy)
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1501  		return ERR_PTR(-ENOMEM);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1502  
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1503  	dev = &psy->dev;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1504  
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1505  	device_initialize(dev);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1506  
71c2cc5cbf686c drivers/power/supply/power_supply_core.c Ricardo B. Marliere 2024-03-01  1507  	dev->class = &power_supply_class;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1508  	dev->type = &power_supply_dev_type;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1509  	dev->parent = parent;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1510  	dev->release = power_supply_dev_release;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1511  	dev_set_drvdata(dev, psy);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1512  	psy->desc = desc;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1513  	if (cfg) {
cef8fe6a382cb5 drivers/power/supply/power_supply_core.c Sebastian Reichel   2018-09-27  1514  		dev->groups = cfg->attr_grp;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1515  		psy->drv_data = cfg->drv_data;
ece711b5a42ce9 drivers/power/supply/power_supply_core.c Adam Thomson        2018-05-22  1516  		psy->of_node =
ece711b5a42ce9 drivers/power/supply/power_supply_core.c Adam Thomson        2018-05-22  1517  			cfg->fwnode ? to_of_node(cfg->fwnode) : cfg->of_node;
58e4aacb746321 drivers/power/supply/power_supply_core.c Vincent Whitchurch  2023-09-15  1518  		dev->of_node = psy->of_node;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1519  		psy->supplied_to = cfg->supplied_to;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1520  		psy->num_supplicants = cfg->num_supplicants;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1521  	}
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1522  
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1523  	rc = dev_set_name(dev, "%s", desc->name);
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan          2013-11-22  1524  	if (rc)
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan          2013-11-22  1525  		goto dev_set_name_failed;
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan          2013-11-22  1526  
97774672573ac4 drivers/power/power_supply_core.c        Lars-Peter Clausen  2011-02-21  1527  	INIT_WORK(&psy->changed_work, power_supply_changed_work);
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1528  	INIT_DELAYED_WORK(&psy->deferred_register_work,
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1529  			  power_supply_deferred_register_work);
97774672573ac4 drivers/power/power_supply_core.c        Lars-Peter Clausen  2011-02-21  1530  
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein       2013-04-01  1531  	rc = power_supply_check_supplies(psy);
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein       2013-04-01  1532  	if (rc) {
3af26e2ad514df drivers/power/supply/power_supply_core.c Sebastian Reichel   2021-03-09  1533  		dev_dbg(dev, "Not all required supplies found, defer probe\n");
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein       2013-04-01  1534  		goto check_supplies_failed;
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein       2013-04-01  1535  	}
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein       2013-04-01  1536  
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1537  	/*
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1538  	 * Expose constant battery info, if it is available. While there are
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1539  	 * some chargers accessing constant battery data, we only want to
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1540  	 * expose battery data to userspace for battery devices.
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1541  	 */
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1542  	if (desc->type == POWER_SUPPLY_TYPE_BATTERY) {
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1543  		rc = power_supply_get_battery_info(psy, &psy->battery_info);
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1544  		if (rc && rc != -ENODEV && rc != -ENOENT)
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1545  			goto check_supplies_failed;
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1546  	}
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel   2023-03-17  1547  
948dcf96622814 drivers/power/power_supply_core.c        Zoran Markovic      2013-08-02  1548  	spin_lock_init(&psy->changed_lock);
d1e25c2e1ac4bd drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-06-02  1549  	init_rwsem(&psy->extensions_sem);
d1e25c2e1ac4bd drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-06-02  1550  	INIT_LIST_HEAD(&psy->extensions);
d1e25c2e1ac4bd drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-06-02  1551  
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1552  	rc = device_add(dev);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1553  	if (rc)
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1554  		goto device_add_failed;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov     2010-05-18  1555  
85d319e14f301e drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-10-05  1556  	rc = device_init_wakeup(dev, cfg ? !cfg->no_wakeup_source : true);
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd        2019-08-01  1557  	if (rc)
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd        2019-08-01  1558  		goto wakeup_init_failed;
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd        2019-08-01  1559  
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09  1560  	rc = psy_register_thermal(psy);
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09  1561  	if (rc)
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09 @1562  		goto register_thermal_failed;
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09  1563  
d1e25c2e1ac4bd drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-06-02  1564  	guard(rwsem_read)(&psy->extensions_sem);
d1e25c2e1ac4bd drivers/power/supply/power_supply_core.c Thomas Weißschuh    2024-06-02  1565  
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1566  	rc = power_supply_create_triggers(psy);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1567  	if (rc)
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1568  		goto create_triggers_failed;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1569  
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov      2019-06-12  1570  	rc = power_supply_add_hwmon_sysfs(psy);
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov      2019-06-12  1571  	if (rc)
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov      2019-06-12  1572  		goto add_hwmon_sysfs_failed;
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov      2019-06-12  1573  
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1574  	/*
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1575  	 * Update use_cnt after any uevents (most notably from device_add()).
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1576  	 * We are here still during driver's probe but
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1577  	 * the power_supply_uevent() calls back driver's get_property
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1578  	 * method so:
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1579  	 * 1. Driver did not assigned the returned struct power_supply,
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1580  	 * 2. Driver could not finish initialization (anything in its probe
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1581  	 *    after calling power_supply_register()).
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1582  	 */
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1583  	atomic_inc(&psy->use_cnt);
e380538529e83c drivers/power/power_supply_core.c        Rhyland Klein       2016-06-22  1584  	psy->initialized = true;
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1585  
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1586  	queue_delayed_work(system_power_efficient_wq,
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1587  			   &psy->deferred_register_work,
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-05-19  1588  			   POWER_SUPPLY_DEFERRED_REGISTER_TIME);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1589  
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1590  	return psy;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1591  
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov      2019-06-12  1592  add_hwmon_sysfs_failed:
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov      2019-06-12  1593  	power_supply_remove_triggers(psy);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1594  create_triggers_failed:
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09  1595  	psy_unregister_thermal(psy);
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC            2012-05-09  1596  register_thermal_failed:
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan          2013-11-22  1597  wakeup_init_failed:
5b79480ce19788 drivers/power/supply/power_supply_core.c Zeng Heng           2022-11-17  1598  	device_del(dev);
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd        2019-08-01  1599  device_add_failed:
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein       2013-04-01  1600  check_supplies_failed:
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan          2013-11-22  1601  dev_set_name_failed:
3a2dbd611b38cf drivers/power/power_supply_core.c        Vasiliy Kulikov     2010-11-19  1602  	put_device(dev);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski 2015-03-12  1603  	return ERR_PTR(rc);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov     2007-05-04  1604  }
9113e260767b1c drivers/power/power_supply_core.c        Zhang Rui           2014-05-28  1605  

:::::: The code at line 1562 was first introduced by commit
:::::: 3be330bf8860dc6079da5acc81295787a04cf4c9 power_supply: Register battery as a thermal zone

:::::: TO: Jenny TC <jenny.tc@intel.com>
:::::: CC: Anton Vorontsov <cbouatmailru@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
