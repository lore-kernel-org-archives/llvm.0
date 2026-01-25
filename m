Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F17223323;
	Sun, 25 Jan 2026 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769363195; cv=none; b=SzESo3VzzfhRIBqlRto2qTR7vHzLl0u/op88BlxTd1HCZ79/x9Lhqg73CDU56LhsNA2QcxZZ47xQXENgrqW1H4R/FDBx0Z5pWDULUsnVgWK9/K/yWegVu6TpFiSEoMUVhEW48cXvHlQEu03j69yFFi3QtowWp+WNkkFPLjTBdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769363195; c=relaxed/simple;
	bh=gtomOP3T+g24/ZRBgKqSkB37M02PRFS6hzq/HmMVzow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nBhU/G6wZSntJsl6DiiHWAyq7hRqjAbVvBuWP7mkzp1I7eoy/Rila4t87tBrY/e6uG4ZUE569Bheh5+PscNEcI3hf+wSADUXJ3kmV5uMRu+zpRHPPkC1KVVrHofvoXxVI6WUwSEdeV+PccTBPmok98sEFuGVtU2fQX3Aq7gl2F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua/5QqHj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua/5QqHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769363193; x=1800899193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gtomOP3T+g24/ZRBgKqSkB37M02PRFS6hzq/HmMVzow=;
  b=Ua/5QqHjvD3OnXZGvslubArR0t+EyuXYqrU7SzvUUAWBYr4i8nnPqgpt
   75lM5xc64xZfr/ka2MlGzZESFFlQ1Hm/cUuIT+OhqBnlhA1bXAVEauV1W
   7k7l7h5CD3whhA+TCJOkyER5cLp5n5rF72Q8W8A7QveB0uRDwMGKUdWDI
   j/9LIfht9XJockHSoAhpDNw1gKBaAB7cGM9IncyoFBTBLhWMBdbnZjlRW
   r1FITEQM2ng9yRGr3rVS5/27rI2NUmFp3g2FUF1q7qcFNmsBVbCr/FGgM
   V+f16tF2bN/3dqlvFG+Oh98ObADtSdT5709jcV/A3pqQL7BuZJ/LLARAX
   A==;
X-CSE-ConnectionGUID: hfl4QP0KTbytc/H/Sx6+6Q==
X-CSE-MsgGUID: QxyFQXbwQzKTtgzfa0k6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70609870"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70609870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:46:31 -0800
X-CSE-ConnectionGUID: ksNWieZFTJ+gPU08DjfrDQ==
X-CSE-MsgGUID: LG7RvCBdRemOT0NU/xW6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207391816"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 09:46:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4Bv-00000000WJT-2Ie6;
	Sun, 25 Jan 2026 17:46:27 +0000
Date: Mon, 26 Jan 2026 01:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 15/17]
 drivers/s390/cio/ccwgroup.c:385:20: error: assigning to 'struct device_driver
 *' from 'const struct device_driver *' discards qualifiers
Message-ID: <202601260131.sVHgbus8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/sysfs-const-driver-attribute
head:   92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d
commit: 28a546377e7351001aec8530b9b5c171928dd1a5 [15/17] s390 prep
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260126=
/202601260131.sVHgbus8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601260131.sVHgbus8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260131.sVHgbus8-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/ccwgroup.c:385:20: error: assigning to 'struct device_d=
river *' from 'const struct device_driver *' discards qualifiers [-Werror,-=
Wincompatible-pointer-types-discards-qualifiers]
     385 |                 gdev->dev.driver =3D &gdrv->driver;
         |                                  ^ ~~~~~~~~~~~~~
   1 error generated.


vim +385 drivers/s390/cio/ccwgroup.c

022b660ae5d075 Ursula Braun        2008-04-24  300 =20
b2ffd8e9a76ec9 Cornelia Huck       2007-10-12  301  /**
f2962dae0efd81 Sebastian Ott       2012-05-15  302   * ccwgroup_create_dev(=
) - create and register a ccw group device
f2962dae0efd81 Sebastian Ott       2012-05-15  303   * @parent: parent devi=
ce for the new device
f2962dae0efd81 Sebastian Ott       2012-05-15  304   * @gdrv: driver for th=
e new group device
022b660ae5d075 Ursula Braun        2008-04-24  305   * @num_devices: number=
 of slave devices
022b660ae5d075 Ursula Braun        2008-04-24  306   * @buf: buffer contain=
ing comma separated bus ids of slave devices
b2ffd8e9a76ec9 Cornelia Huck       2007-10-12  307   *
f2962dae0efd81 Sebastian Ott       2012-05-15  308   * Create and register =
a new ccw group device as a child of @parent. Slave
b7a610f7b4cb95 Sebastian Ott       2012-05-15  309   * devices are obtained=
 from the list of bus ids given in @buf.
b2ffd8e9a76ec9 Cornelia Huck       2007-10-12  310   * Returns:
b2ffd8e9a76ec9 Cornelia Huck       2007-10-12  311   *  %0 on success and a=
n error code on failure.
b2ffd8e9a76ec9 Cornelia Huck       2007-10-12  312   * Context:
b2ffd8e9a76ec9 Cornelia Huck       2007-10-12  313   *  non-atomic
^1da177e4c3f41 Linus Torvalds      2005-04-16  314   */
28a546377e7351 Thomas Wei=C3=9Fschuh    2026-01-25  315  int ccwgroup_creat=
e_dev(struct device *parent, const struct ccwgroup_driver *gdrv,
9814fdfbecbb03 Sebastian Ott       2012-05-15  316  			int num_devices, con=
st char *buf)
^1da177e4c3f41 Linus Torvalds      2005-04-16  317  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  318  	struct ccwgroup_device=
 *gdev;
b7a610f7b4cb95 Sebastian Ott       2012-05-15  319  	struct ccw_dev_id dev_=
id;
022b660ae5d075 Ursula Braun        2008-04-24  320  	int rc, i;
^1da177e4c3f41 Linus Torvalds      2005-04-16  321 =20
ab7efda477f976 Julian Wiedmann     2018-01-30  322  	if (num_devices < 1)
ab7efda477f976 Julian Wiedmann     2018-01-30  323  		return -EINVAL;
ab7efda477f976 Julian Wiedmann     2018-01-30  324 =20
acafe7e3021616 Kees Cook           2018-05-08  325  	gdev =3D kzalloc(struc=
t_size(gdev, cdev, num_devices), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds      2005-04-16  326  	if (!gdev)
^1da177e4c3f41 Linus Torvalds      2005-04-16  327  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds      2005-04-16  328 =20
^1da177e4c3f41 Linus Torvalds      2005-04-16  329  	atomic_set(&gdev->onof=
f, 0);
d76123eb357a4b Cornelia Huck       2007-04-27  330  	mutex_init(&gdev->reg_=
mutex);
d76123eb357a4b Cornelia Huck       2007-04-27  331  	mutex_lock(&gdev->reg_=
mutex);
0b60f9ead5d481 Tejun Heo           2014-02-03  332  	INIT_WORK(&gdev->ungro=
up_work, ccwgroup_ungroup_workfn);
16f7f9564c3ae1 Peter Oberparleiter 2008-08-21  333  	gdev->count =3D num_de=
vices;
16f7f9564c3ae1 Peter Oberparleiter 2008-08-21  334  	gdev->dev.bus =3D &ccw=
group_bus_type;
f2962dae0efd81 Sebastian Ott       2012-05-15  335  	gdev->dev.parent =3D p=
arent;
16f7f9564c3ae1 Peter Oberparleiter 2008-08-21  336  	gdev->dev.release =3D =
ccwgroup_release;
16f7f9564c3ae1 Peter Oberparleiter 2008-08-21  337  	device_initialize(&gde=
v->dev);
16f7f9564c3ae1 Peter Oberparleiter 2008-08-21  338 =20
b7a610f7b4cb95 Sebastian Ott       2012-05-15  339  	for (i =3D 0; i < num_=
devices && buf; i++) {
b7a610f7b4cb95 Sebastian Ott       2012-05-15  340  		rc =3D __get_next_id(=
&buf, &dev_id);
022b660ae5d075 Ursula Braun        2008-04-24  341  		if (rc !=3D 0)
022b660ae5d075 Ursula Braun        2008-04-24  342  			goto error;
b7a610f7b4cb95 Sebastian Ott       2012-05-15  343  		gdev->cdev[i] =3D get=
_ccwdev_by_dev_id(&dev_id);
022b660ae5d075 Ursula Braun        2008-04-24  344  		/*
022b660ae5d075 Ursula Braun        2008-04-24  345  		 * All devices have t=
o be of the same type in
022b660ae5d075 Ursula Braun        2008-04-24  346  		 * order to be groupe=
d.
022b660ae5d075 Ursula Braun        2008-04-24  347  		 */
b7a610f7b4cb95 Sebastian Ott       2012-05-15  348  		if (!gdev->cdev[i] ||=
 !gdev->cdev[i]->drv ||
b7a610f7b4cb95 Sebastian Ott       2012-05-15  349  		    gdev->cdev[i]->dr=
v !=3D gdev->cdev[0]->drv ||
b7a610f7b4cb95 Sebastian Ott       2012-05-15  350  		    gdev->cdev[i]->id=
.driver_info !=3D
^1da177e4c3f41 Linus Torvalds      2005-04-16  351  		    gdev->cdev[0]->id=
.driver_info) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  352  			rc =3D -EINVAL;
d76123eb357a4b Cornelia Huck       2007-04-27  353  			goto error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  354  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  355  		/* Don't allow a devi=
ce to belong to more than one group. */
c560d105a19746 Sebastian Ott       2010-05-26  356  		spin_lock_irq(gdev->c=
dev[i]->ccwlock);
db6a64238a9277 Cornelia Huck       2008-01-26  357  		if (dev_get_drvdata(&=
gdev->cdev[i]->dev)) {
c560d105a19746 Sebastian Ott       2010-05-26  358  			spin_unlock_irq(gdev=
->cdev[i]->ccwlock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  359  			rc =3D -EINVAL;
d76123eb357a4b Cornelia Huck       2007-04-27  360  			goto error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  361  		}
db6a64238a9277 Cornelia Huck       2008-01-26  362  		dev_set_drvdata(&gdev=
->cdev[i]->dev, gdev);
c560d105a19746 Sebastian Ott       2010-05-26  363  		spin_unlock_irq(gdev-=
>cdev[i]->ccwlock);
17088229846c07 Cornelia Huck       2006-07-27  364  	}
022b660ae5d075 Ursula Braun        2008-04-24  365  	/* Check for sufficien=
t number of bus ids. */
b7a610f7b4cb95 Sebastian Ott       2012-05-15  366  	if (i < num_devices) {
022b660ae5d075 Ursula Braun        2008-04-24  367  		rc =3D -EINVAL;
022b660ae5d075 Ursula Braun        2008-04-24  368  		goto error;
022b660ae5d075 Ursula Braun        2008-04-24  369  	}
022b660ae5d075 Ursula Braun        2008-04-24  370  	/* Check for trailing =
stuff. */
ea298e6ee8b34b Vasily Gorbik       2019-09-17  371  	if (i =3D=3D num_devic=
es && buf && strlen(buf) > 0) {
022b660ae5d075 Ursula Braun        2008-04-24  372  		rc =3D -EINVAL;
022b660ae5d075 Ursula Braun        2008-04-24  373  		goto error;
022b660ae5d075 Ursula Braun        2008-04-24  374  	}
f9a5d70cfaf3e3 Julian Wiedmann     2017-09-14  375  	/* Check if the device=
s are bound to the required ccw driver. */
ab7efda477f976 Julian Wiedmann     2018-01-30  376  	if (gdrv && gdrv->ccw_=
driver &&
f9a5d70cfaf3e3 Julian Wiedmann     2017-09-14  377  	    gdev->cdev[0]->drv=
 !=3D gdrv->ccw_driver) {
f9a5d70cfaf3e3 Julian Wiedmann     2017-09-14  378  		rc =3D -EINVAL;
f9a5d70cfaf3e3 Julian Wiedmann     2017-09-14  379  		goto error;
f9a5d70cfaf3e3 Julian Wiedmann     2017-09-14  380  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  381 =20
1bf5b2853925cf Cornelia Huck       2008-10-10  382  	dev_set_name(&gdev->de=
v, "%s", dev_name(&gdev->cdev[0]->dev));
f2962dae0efd81 Sebastian Ott       2012-05-15  383 =20
f2962dae0efd81 Sebastian Ott       2012-05-15  384  	if (gdrv) {
f2962dae0efd81 Sebastian Ott       2012-05-15 @385  		gdev->dev.driver =3D =
&gdrv->driver;
f2962dae0efd81 Sebastian Ott       2012-05-15  386  		rc =3D gdrv->setup ? =
gdrv->setup(gdev) : 0;
f2962dae0efd81 Sebastian Ott       2012-05-15  387  		if (rc)
f2962dae0efd81 Sebastian Ott       2012-05-15  388  			goto error;
f2962dae0efd81 Sebastian Ott       2012-05-15  389  	}
16f7f9564c3ae1 Peter Oberparleiter 2008-08-21  390  	rc =3D device_add(&gde=
v->dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  391  	if (rc)
d76123eb357a4b Cornelia Huck       2007-04-27  392  		goto error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  393  	rc =3D __ccwgroup_crea=
te_symlinks(gdev);
dad572e3701385 Sebastian Ott       2011-10-30  394  	if (rc) {
dad572e3701385 Sebastian Ott       2011-10-30  395  		device_del(&gdev->dev=
);
dad572e3701385 Sebastian Ott       2011-10-30  396  		goto error;
dad572e3701385 Sebastian Ott       2011-10-30  397  	}
d76123eb357a4b Cornelia Huck       2007-04-27  398  	mutex_unlock(&gdev->re=
g_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  399  	return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  400  error:
d76123eb357a4b Cornelia Huck       2007-04-27  401  	mutex_unlock(&gdev->re=
g_mutex);
d76123eb357a4b Cornelia Huck       2007-04-27  402  	put_device(&gdev->dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  403  	return rc;
^1da177e4c3f41 Linus Torvalds      2005-04-16  404  }
f2962dae0efd81 Sebastian Ott       2012-05-15  405  EXPORT_SYMBOL(ccwgroup_=
create_dev);
f2962dae0efd81 Sebastian Ott       2012-05-15  406 =20

:::::: The code at line 385 was first introduced by commit
:::::: f2962dae0efd81fed06d0687f300725ab063587a s390/ccwgroup: introduce cc=
wgroup_create_dev

:::::: TO: Sebastian Ott <sebott@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
