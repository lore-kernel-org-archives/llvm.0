Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D93B193;
	Sat, 23 Mar 2024 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711227620; cv=none; b=WN3fd+nSOWgciC00HtqvkJLYmEiAAF+FHSWjJFkbsy76/yamJPCp+bA69QBQ+1PUKoZ5jTqJGr/UPWIvq4A8NLw0cMAaTFowPHKkItMBh5YppmwFnkWsDzsqsMfVmfNTYIsE2+23FIdeTL2X4b0YI7+XC9QcntR0roMYjn4q8Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711227620; c=relaxed/simple;
	bh=3rodCko/SVG/4Fhy3FDjkfn5wkUL4KjdnIynqZUXtwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHkVDQALhlX17yTS7a1khZpsAVRGLPS97350LWBYhQ9lYKxZwbvlJ88tR+t3YvsBKxo6DL9mR9PrB5O7TPPilZY2rT3qIgQvC2ShO2Bu7b1mRQxBjJAZawQu1DmZCKJgbVeRlbmdk93J4Rf0mvSMboBMd3N8efKsLBwxg5Tvskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAK28J22; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAK28J22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711227618; x=1742763618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rodCko/SVG/4Fhy3FDjkfn5wkUL4KjdnIynqZUXtwA=;
  b=OAK28J221+Niq9QPowz1upY775N7C9JLU3T37AGcchTgg8xqKq+Tpyl4
   z53tzafwfN++AAva0oZhp6U4qKNjcO/OAXlCDEL88bCC8llcB96SJxtCL
   6hu3t4y++GDf20/b+ukhfn8AgrUArJ8oBoTtUOF2x2tOUSpMQzG6k27oY
   P80sB8GF6rTdBIf7PQQlwIFBVmwcuLHMKU/eRuxn+z03m/x66Nc4blpTd
   B3AVnyd8YwAXaRKmXKY/u32AiSGKLUpANZendhRsgV9PHeuw5XJvqajYK
   OHM5a6NnRTHLdzJjUXHdJUsYBLQP6TuKPmUzpKNpeL1cNYPJVnR+ejSKc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="10063054"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="10063054"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 14:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15128335"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2024 14:00:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro8TN-000LSp-19;
	Sat, 23 Mar 2024 21:00:13 +0000
Date: Sun, 24 Mar 2024 04:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 17/87] drivers/base/bus.c:677:8: error:
 assigning to 'int' from incompatible type 'void'
Message-ID: <202403240412.7ji9DY0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   467039adc3ec86566cc6403e5b1fbb9785d66df1
commit: 578c86f00f746b9f504a03494a0e00d2d1082479 [17/87] [SUBMITTED 20240322] [v2] module: don't ignore sysfs_create_link() failures
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240324/202403240412.7ji9DY0F-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240412.7ji9DY0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240412.7ji9DY0F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/bus.c:677:8: error: assigning to 'int' from incompatible type 'void'
     677 |         error = module_add_driver(drv->owner, drv);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +677 drivers/base/bus.c

   637	
   638	/**
   639	 * bus_add_driver - Add a driver to the bus.
   640	 * @drv: driver.
   641	 */
   642	int bus_add_driver(struct device_driver *drv)
   643	{
   644		struct subsys_private *sp = bus_to_subsys(drv->bus);
   645		struct driver_private *priv;
   646		int error = 0;
   647	
   648		if (!sp)
   649			return -EINVAL;
   650	
   651		/*
   652		 * Reference in sp is now incremented and will be dropped when
   653		 * the driver is removed from the bus
   654		 */
   655		pr_debug("bus: '%s': add driver %s\n", sp->bus->name, drv->name);
   656	
   657		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   658		if (!priv) {
   659			error = -ENOMEM;
   660			goto out_put_bus;
   661		}
   662		klist_init(&priv->klist_devices, NULL, NULL);
   663		priv->driver = drv;
   664		drv->p = priv;
   665		priv->kobj.kset = sp->drivers_kset;
   666		error = kobject_init_and_add(&priv->kobj, &driver_ktype, NULL,
   667					     "%s", drv->name);
   668		if (error)
   669			goto out_unregister;
   670	
   671		klist_add_tail(&priv->knode_bus, &sp->klist_drivers);
   672		if (sp->drivers_autoprobe) {
   673			error = driver_attach(drv);
   674			if (error)
   675				goto out_del_list;
   676		}
 > 677		error = module_add_driver(drv->owner, drv);
   678		if (error) {
   679			printk(KERN_ERR "%s: failed to create module links for %s\n",
   680				__func__, drv->name);
   681			goto out_del_list;
   682		}
   683	
   684		error = driver_create_file(drv, &driver_attr_uevent);
   685		if (error) {
   686			printk(KERN_ERR "%s: uevent attr (%s) failed\n",
   687				__func__, drv->name);
   688		}
   689		error = driver_add_groups(drv, sp->bus->drv_groups);
   690		if (error) {
   691			/* How the hell do we get out of this pickle? Give up */
   692			printk(KERN_ERR "%s: driver_add_groups(%s) failed\n",
   693				__func__, drv->name);
   694		}
   695	
   696		if (!drv->suppress_bind_attrs) {
   697			error = add_bind_files(drv);
   698			if (error) {
   699				/* Ditto */
   700				printk(KERN_ERR "%s: add_bind_files(%s) failed\n",
   701					__func__, drv->name);
   702			}
   703		}
   704	
   705		return 0;
   706	
   707	out_del_list:
   708		klist_del(&priv->knode_bus);
   709	out_unregister:
   710		kobject_put(&priv->kobj);
   711		/* drv->p is freed in driver_release()  */
   712		drv->p = NULL;
   713	out_put_bus:
   714		subsys_put(sp);
   715		return error;
   716	}
   717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
