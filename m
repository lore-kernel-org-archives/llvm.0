Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9641D6DC4;
	Sat,  1 Mar 2025 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838872; cv=none; b=oBdDj2nETbTxz/Ko00iMhWivNJB4ohiGjxMQ0ntvzQZ8jJx/4yxbW8QzxS4bA8XtGmcWbKfBL4ctpq+354zli1jRO6ikbeVSCz++Bim1KB+Z6yjPaBiVfktXw6S7E+myj6fYu3V9kWhnKnLF6tYd3Q+JKa9eB49keh+2UGmaWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838872; c=relaxed/simple;
	bh=lJ/iH83PTpJ9b6HpLajQUKnrha7K4stqHgqp4A/HkQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P56mWrh1JnpbMIG6ZEaky1FTKQ6AjaIrya5FPVHfShVXipbgO3DYOg9OJKNL0jyZQ2KHea82Og7fJXGCwn8N//eX1FprheyJvTVVwm2A//7fYUzY65s2nhKayeWi6C2/zA0Pacs8TXG+Yh3l3s5cXTQD9+sdvlz8TbWSilzJODU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt9Qkf4n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt9Qkf4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740838871; x=1772374871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lJ/iH83PTpJ9b6HpLajQUKnrha7K4stqHgqp4A/HkQc=;
  b=mt9Qkf4nPGKZ+G561g3o6t9lACLyJddA/KURQAgBE2nsa6jGOO9XLBJH
   SIkVnU2VAs5vIONLjytX3zVBPSuHIwd+9y0XGU+hyD0Z999AkzzY/hZFb
   sDEE6cjn8FqhK+3UYMpUAvSO8/rwQNLPNWETJ6MfkI96tRvSS17/m/IoX
   pNL6Xc3SwAeSPdLQsmaJ9Uf3vnPNNd8XUZ+1nNaRSZ91NpmIX+oXPpCCO
   ArNsG2rPMYpimCC1mr0gcvljHl1/cITD9nFshdtIv3lVVofaPg/G2OcH3
   jNYHHUQUL6j4CgNLfbOeVDG0Mt3zY0o8E1TmRjnxYL+UqyyWmuk8z0hCi
   Q==;
X-CSE-ConnectionGUID: 9/oTILZPQXyRxqAipFw8tw==
X-CSE-MsgGUID: eimIEJ48SUGpMChgPm5TCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41950004"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41950004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 06:21:10 -0800
X-CSE-ConnectionGUID: u5FvO7N6SsW2+5WKmziBwg==
X-CSE-MsgGUID: E6q9gHWKRJ2eIQ9GNos45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="122204408"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2025 06:21:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toNiD-000GJo-2g;
	Sat, 01 Mar 2025 14:21:05 +0000
Date: Sat, 1 Mar 2025 22:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 58/86] drivers/mfd/twl6030-irq.c:367:24: warning:
 unused variable 'node'
Message-ID: <202503012236.TqoFd3IN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6a5773ba87efb03d0d268aa0936b43196309cbb6
commit: 097f513a0e046e029e70fca4fac92fab4dae8b59 [58/86] drop irq_domain_add_linear
config: x86_64-buildonly-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503012236.TqoFd3IN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503012236.TqoFd3IN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503012236.TqoFd3IN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mfd/twl6030-irq.c:27:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:493:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     493 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     494 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:513:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     513 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     514 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/twl6030-irq.c:367:24: warning: unused variable 'node' [-Wunused-variable]
     367 |         struct                  device_node *node = dev->of_node;
         |                                              ^~~~
   5 warnings generated.


vim +/node +367 drivers/mfd/twl6030-irq.c

74d85e47ab8a7cd Oleksandr Dmytryshyn    2013-07-25  364  
78518ffa08fceee Benoit Cousson          2012-02-29  365  int twl6030_init_irq(struct device *dev, int irq_num)
e8deb28ca8e221d Balaji T K              2009-12-14  366  {
78518ffa08fceee Benoit Cousson          2012-02-29 @367  	struct			device_node *node = dev->of_node;
b32408f64427096 Grygorii Strashko       2013-07-25  368  	int			nr_irqs;
a820e5686f5f048 Grygorii Strashko       2013-07-25  369  	int			status;
14591d888e35c12 Peter Ujfalusi          2012-11-13  370  	u8			mask[3];
7a29fa05aeca2c1 Peter Ujfalusi          2023-10-29  371  	const struct of_device_id *of_id;
74d85e47ab8a7cd Oleksandr Dmytryshyn    2013-07-25  372  
7a29fa05aeca2c1 Peter Ujfalusi          2023-10-29  373  	of_id = of_match_device(twl6030_of_match, dev);
7a29fa05aeca2c1 Peter Ujfalusi          2023-10-29  374  	if (!of_id || !of_id->data) {
74d85e47ab8a7cd Oleksandr Dmytryshyn    2013-07-25  375  		dev_err(dev, "Unknown TWL device model\n");
74d85e47ab8a7cd Oleksandr Dmytryshyn    2013-07-25  376  		return -EINVAL;
74d85e47ab8a7cd Oleksandr Dmytryshyn    2013-07-25  377  	}
e8deb28ca8e221d Balaji T K              2009-12-14  378  
78518ffa08fceee Benoit Cousson          2012-02-29  379  	nr_irqs = TWL6030_NR_IRQS;
78518ffa08fceee Benoit Cousson          2012-02-29  380  
0aa8c6853121a05 Grygorii Strashko       2013-07-25  381  	twl6030_irq = devm_kzalloc(dev, sizeof(*twl6030_irq), GFP_KERNEL);
9363be216aa65ef Markus Elfring          2018-03-09  382  	if (!twl6030_irq)
0aa8c6853121a05 Grygorii Strashko       2013-07-25  383  		return -ENOMEM;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  384  
14591d888e35c12 Peter Ujfalusi          2012-11-13  385  	mask[0] = 0xFF;
e8deb28ca8e221d Balaji T K              2009-12-14  386  	mask[1] = 0xFF;
e8deb28ca8e221d Balaji T K              2009-12-14  387  	mask[2] = 0xFF;
ec1a07b3440cc28 Benoit Cousson          2012-03-02  388  
ec1a07b3440cc28 Benoit Cousson          2012-03-02  389  	/* mask all int lines */
a820e5686f5f048 Grygorii Strashko       2013-07-25  390  	status = twl_i2c_write(TWL_MODULE_PIH, &mask[0], REG_INT_MSK_LINE_A, 3);
ec1a07b3440cc28 Benoit Cousson          2012-03-02  391  	/* mask all int sts */
a820e5686f5f048 Grygorii Strashko       2013-07-25  392  	status |= twl_i2c_write(TWL_MODULE_PIH, &mask[0], REG_INT_MSK_STS_A, 3);
ec1a07b3440cc28 Benoit Cousson          2012-03-02  393  	/* clear INT_STS_A,B,C */
a820e5686f5f048 Grygorii Strashko       2013-07-25  394  	status |= twl_i2c_write(TWL_MODULE_PIH, &mask[0], REG_INT_STS_A, 3);
a820e5686f5f048 Grygorii Strashko       2013-07-25  395  
a820e5686f5f048 Grygorii Strashko       2013-07-25  396  	if (status < 0) {
a820e5686f5f048 Grygorii Strashko       2013-07-25  397  		dev_err(dev, "I2C err writing TWL_MODULE_PIH: %d\n", status);
a820e5686f5f048 Grygorii Strashko       2013-07-25  398  		return status;
a820e5686f5f048 Grygorii Strashko       2013-07-25  399  	}
e8deb28ca8e221d Balaji T K              2009-12-14  400  
ec1a07b3440cc28 Benoit Cousson          2012-03-02  401  	/*
ec1a07b3440cc28 Benoit Cousson          2012-03-02  402  	 * install an irq handler for each of the modules;
e8deb28ca8e221d Balaji T K              2009-12-14  403  	 * clone dummy irq_chip since PIH can't *do* anything
e8deb28ca8e221d Balaji T K              2009-12-14  404  	 */
0aa8c6853121a05 Grygorii Strashko       2013-07-25  405  	twl6030_irq->irq_chip = dummy_irq_chip;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  406  	twl6030_irq->irq_chip.name = "twl6030";
0aa8c6853121a05 Grygorii Strashko       2013-07-25  407  	twl6030_irq->irq_chip.irq_set_type = NULL;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  408  	twl6030_irq->irq_chip.irq_set_wake = twl6030_irq_set_wake;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  409  
0aa8c6853121a05 Grygorii Strashko       2013-07-25  410  	twl6030_irq->pm_nb.notifier_call = twl6030_irq_pm_notifier;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  411  	atomic_set(&twl6030_irq->wakeirqs, 0);
7a29fa05aeca2c1 Peter Ujfalusi          2023-10-29  412  	twl6030_irq->irq_mapping_tbl = of_id->data;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  413  
0aa8c6853121a05 Grygorii Strashko       2013-07-25  414  	twl6030_irq->irq_domain =
097f513a0e046e0 Jiri Slaby (SUSE        2025-02-28  415) 		irq_domain_create_linear(of_fwnode_handle(node), nr_irqs,
0aa8c6853121a05 Grygorii Strashko       2013-07-25  416  				      &twl6030_irq_domain_ops, twl6030_irq);
0aa8c6853121a05 Grygorii Strashko       2013-07-25  417  	if (!twl6030_irq->irq_domain) {
b32408f64427096 Grygorii Strashko       2013-07-25  418  		dev_err(dev, "Can't add irq_domain\n");
b32408f64427096 Grygorii Strashko       2013-07-25  419  		return -ENOMEM;
e8deb28ca8e221d Balaji T K              2009-12-14  420  	}
e8deb28ca8e221d Balaji T K              2009-12-14  421  
b32408f64427096 Grygorii Strashko       2013-07-25  422  	dev_info(dev, "PIH (irq %d) nested IRQs\n", irq_num);
e8deb28ca8e221d Balaji T K              2009-12-14  423  
e8deb28ca8e221d Balaji T K              2009-12-14  424  	/* install an irq handler to demultiplex the TWL6030 interrupt */
87343e534117c29 Naga Venkata Srikanth V 2013-07-25  425  	status = request_threaded_irq(irq_num, NULL, twl6030_irq_thread,
0aa8c6853121a05 Grygorii Strashko       2013-07-25  426  				      IRQF_ONESHOT, "TWL6030-PIH", twl6030_irq);
e8deb28ca8e221d Balaji T K              2009-12-14  427  	if (status < 0) {
ec1a07b3440cc28 Benoit Cousson          2012-03-02  428  		dev_err(dev, "could not claim irq %d: %d\n", irq_num, status);
e8deb28ca8e221d Balaji T K              2009-12-14  429  		goto fail_irq;
e8deb28ca8e221d Balaji T K              2009-12-14  430  	}
862de70c12bb622 Axel Lin                2011-08-11  431  
0aa8c6853121a05 Grygorii Strashko       2013-07-25  432  	twl6030_irq->twl_irq = irq_num;
0aa8c6853121a05 Grygorii Strashko       2013-07-25  433  	register_pm_notifier(&twl6030_irq->pm_nb);
b32408f64427096 Grygorii Strashko       2013-07-25  434  	return 0;
e8deb28ca8e221d Balaji T K              2009-12-14  435  
862de70c12bb622 Axel Lin                2011-08-11  436  fail_irq:
0aa8c6853121a05 Grygorii Strashko       2013-07-25  437  	irq_domain_remove(twl6030_irq->irq_domain);
e8deb28ca8e221d Balaji T K              2009-12-14  438  	return status;
e8deb28ca8e221d Balaji T K              2009-12-14  439  }
e8deb28ca8e221d Balaji T K              2009-12-14  440  

:::::: The code at line 367 was first introduced by commit
:::::: 78518ffa08fceee42d61359303c58bdd0a82033f mfd: Move twl-core IRQ allocation into twl[4030|6030]-irq files

:::::: TO: Benoit Cousson <b-cousson@ti.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
