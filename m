Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1343FD148;
	Tue, 24 Mar 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360823; cv=none; b=HmyatTCOUDXhFRQT3Ky/q8nruNHJ9z9eq5nGnfakBWxZlEO1WYXBGHeC55AGd7HmQBBmqJQgofLliuGLISSNd0DU3j+Acm/9bHqy2k7iDN8xuudi5QvBBQw4iBdiCRkvotGa3/W5HN9J4JpA4r11wIP2MCbojNly4/jYls9463I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360823; c=relaxed/simple;
	bh=AfiVERaj+Yi16gUTnLf2Dx10I0V4maPmgCyiqVYNLUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R/LjJ/281v5yKk36GjgbzjU2gMdMoKL8nB2JNV3CuJT6qoEb2q7nanCuSkI0zBaRMHnU39ZnIcMEBEEsw/Cc5Uj6zqSCiaDX1vwWGUxfkyBc8er9A00TueQb6P4i/H3/qvehHUDle4CIUpMLPqU5u3OX5pXIfs4V6ujSCYvRLAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Paq5i6Zg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Paq5i6Zg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774360820; x=1805896820;
  h=date:from:to:cc:subject:message-id;
  bh=AfiVERaj+Yi16gUTnLf2Dx10I0V4maPmgCyiqVYNLUA=;
  b=Paq5i6Zg1H9uEPAjyAtxEFnNBU5b2aMrby0e4NOV4GRchEfRY7nFbCa5
   sqYoaeNh+hYGq1OlU7zVhihbV7QZQCoW7agYenkc1PCVqmhHNHixpV0nQ
   bLBRvRb/riGINvw4hPXS0/BTEitGF0v5dtSasAJqkU+T/CJM9Abp5XYu4
   wLS92LB3ytTrODNhHzh+76ymkAY5EO6gsey4C6v4Jtf9bN2m7O7zMf+bT
   huoeMdDnBIJKBP0HceLe52og9hgRRsXUITw1nhtJWvrH7n/137cf4Ui4A
   /QKB4SLX3FfST4/Ae/nU2PhVovnD0FPJ2msqBNAl2cq8LURqLx+E2LQIn
   w==;
X-CSE-ConnectionGUID: IP+T/jweSte3avnIIip7KQ==
X-CSE-MsgGUID: DCEiQcVVT1igilQzBtoBQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100820136"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100820136"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:00:18 -0700
X-CSE-ConnectionGUID: O1pt3oFsTKqy8c0EfET6ww==
X-CSE-MsgGUID: tkWcHl+XRL2dwfdzvxvA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247432058"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 07:00:16 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w52In-000000004eT-3zZm;
	Tue, 24 Mar 2026 14:00:13 +0000
Date: Tue, 24 Mar 2026 21:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 20/27] drivers/tty/tty_io.c:3453:21: error:
 subscripted value is not an array, pointer, or vector
Message-ID: <202603242158.265VFIM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   5d42f0e906f51125dada29404e4278e3f40130e4
commit: 764e0f454dded65101e69eca896f8851d16f9b62 [20/27] tty: convert driver::ports to xarray
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603242158.265VFIM6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242158.265VFIM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242158.265VFIM6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/tty_io.c:3453:21: error: subscripted value is not an array, pointer, or vector
    3453 |                         if (driver->ports[i])
         |                             ~~~~~~~~~~~~~^~
   drivers/tty/tty_io.c:3454:42: error: subscripted value is not an array, pointer, or vector
    3454 |                                 tty_port_link_driver_wq(driver->ports[i], driver);
         |                                                         ~~~~~~~~~~~~~^~
   2 errors generated.


vim +3453 drivers/tty/tty_io.c

7d7b93c1452f38 drivers/char/tty_io.c Alan Cox           2008-10-13  3413  
385812835431c9 drivers/tty/tty_io.c  Jiri Slaby         2021-11-26  3414  /**
c38f45ef5fe223 drivers/tty/tty_io.c  Jiri Slaby (SUSE   2023-09-19  3415)  * tty_register_driver - register a tty driver
385812835431c9 drivers/tty/tty_io.c  Jiri Slaby         2021-11-26  3416   * @driver: driver to register
385812835431c9 drivers/tty/tty_io.c  Jiri Slaby         2021-11-26  3417   *
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3418   * Called by a tty driver to register itself.
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3419   */
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3420  int tty_register_driver(struct tty_driver *driver)
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3421  {
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3422  	int error;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3423  	int i;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3424  	dev_t dev;
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3425  	struct device *d;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3426  
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3427  	if (!driver->major) {
37bdfb074ec035 drivers/char/tty_io.c Alan Cox           2008-02-08  3428  		error = alloc_chrdev_region(&dev, driver->minor_start,
37bdfb074ec035 drivers/char/tty_io.c Alan Cox           2008-02-08  3429  						driver->num, driver->name);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3430  		if (!error) {
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3431  			driver->major = MAJOR(dev);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3432  			driver->minor_start = MINOR(dev);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3433  		}
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3434  	} else {
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3435  		dev = MKDEV(driver->major, driver->minor_start);
e5717c48ed52fe drivers/char/tty_io.c Geert Uytterhoeven 2007-02-20  3436  		error = register_chrdev_region(dev, driver->num, driver->name);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3437  	}
9bb8a3d4109f3b drivers/tty/tty_io.c  Jiri Slaby         2012-06-04  3438  	if (error < 0)
16a02081baa15b drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3439  		goto err;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3440  
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3441  	/*
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3442  	 * Drivers that do not define driver_name are potentially in-memory devices
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3443  	 * like vty, which generally do not require special workqueue settings.
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3444  	 */
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3445  	if (!(driver->flags & TTY_DRIVER_NO_WORKQUEUE) && driver->driver_name) {
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3446  		driver->flip_wq = alloc_workqueue("%s-%s", WQ_UNBOUND | WQ_SYSFS,
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3447  						  0, driver->name, driver->driver_name);
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3448  		if (!driver->flip_wq) {
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3449  			error = -ENOMEM;
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3450  			goto err_unreg_char;
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3451  		}
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3452  		for (i = 0; i < driver->num; i++) {
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13 @3453  			if (driver->ports[i])
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3454  				tty_port_link_driver_wq(driver->ports[i], driver);
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3455  		}
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3456  	}
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3457  
7e73eca6a7b296 drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3458  	if (driver->flags & TTY_DRIVER_DYNAMIC_ALLOC) {
7e73eca6a7b296 drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3459  		error = tty_cdev_add(driver, dev, 0, driver->num);
9bb8a3d4109f3b drivers/tty/tty_io.c  Jiri Slaby         2012-06-04  3460  		if (error)
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3461  			goto err_destroy_wq;
7e73eca6a7b296 drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3462  	}
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3463  
f49573f2f53e0f drivers/tty/tty_io.c  Jiri Slaby (SUSE   2025-04-25  3464) 	scoped_guard(mutex, &tty_mutex)
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3465  		list_add(&driver->tty_drivers, &tty_drivers);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3466  
331b831983f9d7 drivers/char/tty_io.c Greg Kroah-Hartman 2005-06-20  3467  	if (!(driver->flags & TTY_DRIVER_DYNAMIC_DEV)) {
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3468  		for (i = 0; i < driver->num; i++) {
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3469  			d = tty_register_device(driver, i, NULL);
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3470  			if (IS_ERR(d)) {
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3471  				error = PTR_ERR(d);
16a02081baa15b drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3472  				goto err_unreg_devs;
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3473  			}
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3474  		}
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3475  	}
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3476  	proc_tty_register_driver(driver);
7d7b93c1452f38 drivers/char/tty_io.c Alan Cox           2008-10-13  3477  	driver->flags |= TTY_DRIVER_INSTALLED;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3478  	return 0;
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3479  
16a02081baa15b drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3480  err_unreg_devs:
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3481  	for (i--; i >= 0; i--)
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3482  		tty_unregister_device(driver, i);
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3483  
f49573f2f53e0f drivers/tty/tty_io.c  Jiri Slaby (SUSE   2025-04-25  3484) 	scoped_guard(mutex, &tty_mutex)
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3485  		list_del(&driver->tty_drivers);
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3486  
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3487  err_destroy_wq:
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3488  	if (driver->flip_wq)
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3489  		destroy_workqueue(driver->flip_wq);
eb3b0d92c9c398 drivers/tty/tty_io.c  Xin Zhao           2026-02-13  3490  
9bb8a3d4109f3b drivers/tty/tty_io.c  Jiri Slaby         2012-06-04  3491  err_unreg_char:
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3492  	unregister_chrdev_region(dev, driver->num);
16a02081baa15b drivers/tty/tty_io.c  Jiri Slaby         2012-08-08  3493  err:
b670bde0b24979 drivers/char/tty_io.c Vasiliy Kulikov    2010-09-05  3494  	return error;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3495  }
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3496  EXPORT_SYMBOL(tty_register_driver);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds     2005-04-16  3497  

:::::: The code at line 3453 was first introduced by commit
:::::: eb3b0d92c9c39890592cca6647601fe5c631efea tty: tty_port: add workqueue to flip TTY buffer

:::::: TO: Xin Zhao <jackzxcui1989@163.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
