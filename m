Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D501F461D;
	Sun, 25 Jan 2026 16:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769358137; cv=none; b=qILo48M9MXK7jqgdYWyg/kkU3yEQVNVF155PBTu2lJFmreqY+mIKOry6gHij9w8UkubRgzesi7GJCUI41N4G4Spko9wQ1m1WGSODjL4Betn8kDHj+NFHh/qJkKgNOcP/suE0/9tHOvgM0O+CnV62saqMOxo1+i9Ao8SvblGJ2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769358137; c=relaxed/simple;
	bh=jdAAY0yRmS21l6XF8jBAv5BGk3guOSelx3J3S858kLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G+fI46697Yc0cbp4Whi9PLDbN292o1HdwI9olMeNKYbD6S91LonYCEtXC6niyJk0RamLvR0EVzLU7L+B7Q2I5tAyx0834hQMJ53PG6r8aLpfcaLv9dp/SMGd3oA9RMCL7NGmunlrg6ULRRiZ0WN8qXQyTWGDS2ocjmbWUZbm5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gK/RGivW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gK/RGivW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769358135; x=1800894135;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jdAAY0yRmS21l6XF8jBAv5BGk3guOSelx3J3S858kLM=;
  b=gK/RGivW+ehKu5eJeryZ+8f/JwskfW+xRWbZgI7a/mrQ0ymGReYdelVZ
   rQxPWm8CBek73jRfght8Po07DVo6BJYvgI+L80YCnpxdgwFYzUX4q5Hzu
   XSrCoYOJ2TH6qQrKR8kKatXiqiJl9Kq+vP6kKRHhhtpD+Bj9W6eqQ37lO
   NUQFwNQgBKBVfZZcVafasHHU3exrCW5gj9J4z0vgg2XWjifC/lzf4HGz9
   niQuFsGulG9zGPGL3WM83pupZWlN5c0VQEgErNPzxn2PdeEiFqOtr+coX
   RrU5vAGMKSg1ktRYG1kNODRS1oje5VEQg3gIPHaRIkOJ7DwUkaKU8cLRx
   A==;
X-CSE-ConnectionGUID: /Q/Dtr/pRlifsU6kE68nuw==
X-CSE-MsgGUID: 5c03ZUTeTze/F3FaThDetA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87964383"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="87964383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 08:22:15 -0800
X-CSE-ConnectionGUID: UdCEy2TsQz+wHPu2oLb1pA==
X-CSE-MsgGUID: MtyxOX/eR4y7iwfBIvuwcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="212352936"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2026 08:22:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2sM-00000000WBA-32jm;
	Sun, 25 Jan 2026 16:22:10 +0000
Date: Mon, 26 Jan 2026 00:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 drivers/pci/pci-driver.c:191:21: error: initializing 'struct pci_driver *'
 with an expression of type 'typeof (*((driver ? _Generic(driver, const typeof
 (*(driver)) *: ((const struct pci_driver *)({
Message-ID: <202601260027.74GOM5YW-lkp@intel.com>
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
commit: 445ba0f479b21cc9310a99aefa9de3d53559eeb0 [16/17] x
config: powerpc64-randconfig-002-20260125 (https://download.01.org/0day-ci/=
archive/20260126/202601260027.74GOM5YW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601260027.74GOM5YW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260027.74GOM5YW-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci-driver.c:191:21: error: initializing 'struct pci_driver =
*' with an expression of type 'typeof (*((driver ? _Generic(driver, const t=
ypeof (*(driver)) *: ((const struct pci_driver *)({
       void *__mptr =3D (void *)(driver);
       static_assert(__builtin_types_compatible_p(typeof (*(driver)), typeo=
f (((struct pci_driver *)0)->driver)) || __builtin_types_compatible_p(typeo=
f (*(driver)), typeof(void)), "pointer type mismatch in container_of()");
       ((struct pci_driver *)(__mptr - __builtin_offsetof(struct pci_driver=
, driver)));
   })), default: ((struct pci_driver *)({
       void *__mptr =3D (void *)(driver);
       static_assert(__builtin_types_compatible_p(typeof (*(driver)), typeo=
f (((struct pci_driver *)0)->driver)) || __builtin_types_compatible_p(typeo=
f (*(driver)), typeof(void)), "pointer type mismatch in container_of()");
       ((struct pci_driver *)(__mptr - __builtin_offsetof(struct pci_driver=
, driver)));
   }))) : ((void *)0)))) *' (aka 'const struct pci_driver *') discards qual=
ifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     191 |         struct pci_driver *pdrv =3D ptr_unqual(to_pci_driver(dri=
ver));
         |                            ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/pci/pci-driver.c:260:21: error: initializing 'struct pci_driver =
*' with an expression of type 'typeof (*((driver ? _Generic(driver, const t=
ypeof (*(driver)) *: ((const struct pci_driver *)({
       void *__mptr =3D (void *)(driver);
       static_assert(__builtin_types_compatible_p(typeof (*(driver)), typeo=
f (((struct pci_driver *)0)->driver)) || __builtin_types_compatible_p(typeo=
f (*(driver)), typeof(void)), "pointer type mismatch in container_of()");
       ((struct pci_driver *)(__mptr - __builtin_offsetof(struct pci_driver=
, driver)));
   })), default: ((struct pci_driver *)({
       void *__mptr =3D (void *)(driver);
       static_assert(__builtin_types_compatible_p(typeof (*(driver)), typeo=
f (((struct pci_driver *)0)->driver)) || __builtin_types_compatible_p(typeo=
f (*(driver)), typeof(void)), "pointer type mismatch in container_of()");
       ((struct pci_driver *)(__mptr - __builtin_offsetof(struct pci_driver=
, driver)));
   }))) : ((void *)0)))) *' (aka 'const struct pci_driver *') discards qual=
ifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     260 |         struct pci_driver *pdrv =3D ptr_unqual(to_pci_driver(dri=
ver));
         |                            ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   2 errors generated.


vim +191 drivers/pci/pci-driver.c

1f40704bb01b9fb Zhenzhong Duan        2020-11-17  179 =20
^1da177e4c3f415 Linus Torvalds        2005-04-16  180  /**
2f0cd59c6ff91b4 Mauro Carvalho Chehab 2020-10-23  181   * new_id_store - sy=
sfs frontend to pci_add_dynid()
8f7020d36374dda Randy Dunlap          2005-10-23  182   * @driver: target d=
evice driver
8f7020d36374dda Randy Dunlap          2005-10-23  183   * @buf: buffer for =
scanning device ID data
8f7020d36374dda Randy Dunlap          2005-10-23  184   * @count: input size
^1da177e4c3f415 Linus Torvalds        2005-04-16  185   *
9dba910e9de2c4a Tejun Heo             2009-09-03  186   * Allow PCI IDs to =
be added to an existing driver via sysfs.
^1da177e4c3f415 Linus Torvalds        2005-04-16  187   */
445ba0f479b21cc Thomas Wei=C3=9Fschuh      2026-01-25  188  static ssize_t =
new_id_store(const struct device_driver *driver, const char *buf,
3c78bc61f5ef3bc Ryan Desfosses        2014-04-18  189  			    size_t count)
^1da177e4c3f415 Linus Torvalds        2005-04-16  190  {
9d887b3bf2fb75d Thomas Wei=C3=9Fschuh      2026-01-25 @191  	struct pci_dri=
ver *pdrv =3D ptr_unqual(to_pci_driver(driver));
b41d6cf38e27a94 Jean Delvare          2008-08-17  192  	const struct pci_de=
vice_id *ids =3D pdrv->id_table;
20a796a969efe37 Logan Gunthorpe       2019-02-08  193  	u32 vendor, device,=
 subvendor =3D PCI_ANY_ID,
^1da177e4c3f415 Linus Torvalds        2005-04-16  194  		subdevice =3D PCI_=
ANY_ID, class =3D 0, class_mask =3D 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  195  	unsigned long drive=
r_data =3D 0;
a49287d32d57b1b Bjorn Helgaas         2020-10-06  196  	int fields;
8895d3bcb8ba960 Bandan Das            2014-04-01  197  	int retval =3D 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  198 =20
b41d6cf38e27a94 Jean Delvare          2008-08-17  199  	fields =3D sscanf(b=
uf, "%x %x %x %x %x %x %lx",
^1da177e4c3f415 Linus Torvalds        2005-04-16  200  			&vendor, &device,=
 &subvendor, &subdevice,
^1da177e4c3f415 Linus Torvalds        2005-04-16  201  			&class, &class_ma=
sk, &driver_data);
6ba186361ed2cda Jean Delvare          2007-04-07  202  	if (fields < 2)
^1da177e4c3f415 Linus Torvalds        2005-04-16  203  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds        2005-04-16  204 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  205  	if (fields !=3D 7) {
8895d3bcb8ba960 Bandan Das            2014-04-01  206  		struct pci_dev *pd=
ev =3D kzalloc(sizeof(*pdev), GFP_KERNEL);
8895d3bcb8ba960 Bandan Das            2014-04-01  207  		if (!pdev)
8895d3bcb8ba960 Bandan Das            2014-04-01  208  			return -ENOMEM;
8895d3bcb8ba960 Bandan Das            2014-04-01  209 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  210  		pdev->vendor =3D v=
endor;
8895d3bcb8ba960 Bandan Das            2014-04-01  211  		pdev->device =3D d=
evice;
8895d3bcb8ba960 Bandan Das            2014-04-01  212  		pdev->subsystem_ve=
ndor =3D subvendor;
8895d3bcb8ba960 Bandan Das            2014-04-01  213  		pdev->subsystem_de=
vice =3D subdevice;
8895d3bcb8ba960 Bandan Das            2014-04-01  214  		pdev->class =3D cl=
ass;
8895d3bcb8ba960 Bandan Das            2014-04-01  215 =20
3853f9123c185eb Zhenzhong Duan        2020-11-17  216  		if (pci_match_devi=
ce(pdrv, pdev))
8895d3bcb8ba960 Bandan Das            2014-04-01  217  			retval =3D -EEXIS=
T;
8895d3bcb8ba960 Bandan Das            2014-04-01  218 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  219  		kfree(pdev);
8895d3bcb8ba960 Bandan Das            2014-04-01  220 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  221  		if (retval)
8895d3bcb8ba960 Bandan Das            2014-04-01  222  			return retval;
8895d3bcb8ba960 Bandan Das            2014-04-01  223  	}
8895d3bcb8ba960 Bandan Das            2014-04-01  224 =20
b41d6cf38e27a94 Jean Delvare          2008-08-17  225  	/* Only accept driv=
er_data values that match an existing id_table
b41d6cf38e27a94 Jean Delvare          2008-08-17  226  	   entry */
2debb4d2019fa05 Chris Wright          2008-11-25  227  	if (ids) {
b41d6cf38e27a94 Jean Delvare          2008-08-17  228  		retval =3D -EINVAL;
b41d6cf38e27a94 Jean Delvare          2008-08-17  229  		while (ids->vendor=
 || ids->subvendor || ids->class_mask) {
b41d6cf38e27a94 Jean Delvare          2008-08-17  230  			if (driver_data =
=3D=3D ids->driver_data) {
b41d6cf38e27a94 Jean Delvare          2008-08-17  231  				retval =3D 0;
b41d6cf38e27a94 Jean Delvare          2008-08-17  232  				break;
b41d6cf38e27a94 Jean Delvare          2008-08-17  233  			}
b41d6cf38e27a94 Jean Delvare          2008-08-17  234  			ids++;
b41d6cf38e27a94 Jean Delvare          2008-08-17  235  		}
b41d6cf38e27a94 Jean Delvare          2008-08-17  236  		if (retval)	/* No =
match */
b41d6cf38e27a94 Jean Delvare          2008-08-17  237  			return retval;
2debb4d2019fa05 Chris Wright          2008-11-25  238  	}
b41d6cf38e27a94 Jean Delvare          2008-08-17  239 =20
9dba910e9de2c4a Tejun Heo             2009-09-03  240  	retval =3D pci_add_=
dynid(pdrv, vendor, device, subvendor, subdevice,
9dba910e9de2c4a Tejun Heo             2009-09-03  241  			       class, cla=
ss_mask, driver_data);
b19441af1855591 Greg Kroah-Hartman    2006-08-28  242  	if (retval)
b19441af1855591 Greg Kroah-Hartman    2006-08-28  243  		return retval;
^1da177e4c3f415 Linus Torvalds        2005-04-16  244  	return count;
^1da177e4c3f415 Linus Torvalds        2005-04-16  245  }
445ba0f479b21cc Thomas Wei=C3=9Fschuh      2026-01-25  246  static const DR=
IVER_ATTR_WO(new_id);
^1da177e4c3f415 Linus Torvalds        2005-04-16  247 =20

:::::: The code at line 191 was first introduced by commit
:::::: 9d887b3bf2fb75db857ad0aa0aef1598f4f1111d pci: ptr_unqual

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
