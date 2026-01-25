Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585412EFD9E;
	Sun, 25 Jan 2026 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369034; cv=none; b=s+Bi0P01DBoyG7G58AYY54QQo1O+r7lb8EsjTsBBpRUa3m/YEgRNelCi8WhbgLVzDypnksCDnCJMMPwZ7X9WcJdZ2oQ2jatosOKNfTqCPihODuEVDeC8bmqsU0K8oX5Pq6x6PKnaV5mbB2oWI+qs12b80cf/2oOPu0UvH2ehVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369034; c=relaxed/simple;
	bh=ZvY+/dIefD4oYxaWRxIw+XqWndXIEC0UHyn4rMcgJM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kSKFWIjc7qR4816onsljmJRRGCAQhSr9e0yH7MWjLwfN5zZYaZtfYYJsrL+kwUy2Byk8aoekdc//VIJ+4JBNbcZfTN+/jU2KjtUktDxjnQu/VC1bmAlaR1O+HAqUIRVWX8PumfKcRQB34iP2Fa9lveYyHXnoR4xR9PzcQoCLJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ow7aAeCc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ow7aAeCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769369032; x=1800905032;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZvY+/dIefD4oYxaWRxIw+XqWndXIEC0UHyn4rMcgJM8=;
  b=Ow7aAeCc4LW5ZyUJSmqv+qWHP9BhrqWpEsIlH121t89TdlyJGKzYDG0i
   URsMLwqb+WHjAuRt1lbxIoTEjFqnO57wSaRINZeX/XLFTm4z91AovabWn
   ZUj80g6BfvG0bAVPmWrnzS05uuV/EyMxNXjVTXttMjOliyP9AgDmSEVAx
   k1c2CeY1St/LYTqO1YtTHcwvYuuWD/JvQ15zos8ApFQ/OzjIJo6kkJOYm
   mmc+jIVNf3PZi8UNCl8DztCJZfd+JHky+VcvHKjTagSJglYBTZsD7GmwY
   Ekkj9kqpD+mtQWl7lApUKDWr55GU+uAp36gZ6o3xcmZlguX4GSN8eJnHi
   Q==;
X-CSE-ConnectionGUID: FyBQ2p5lR3iunWKp15myPg==
X-CSE-MsgGUID: tfA7xHyzRc+uMXEh92JGFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70647721"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70647721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 11:23:51 -0800
X-CSE-ConnectionGUID: k36dFk4GQLSZBmGKtJjH1Q==
X-CSE-MsgGUID: ok/yCGfgQ62KKbKJ8OqBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="211970758"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2026 11:23:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk5i7-00000000WYz-2q5I;
	Sun, 25 Jan 2026 19:23:47 +0000
Date: Mon, 26 Jan 2026 03:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 17/17]
 drivers/s390/crypto/ap_bus.c:1507:20: error: initializing 'struct ap_driver
 *' with an expression of type 'const struct ap_driver *' discards qualifiers
Message-ID: <202601260335.bRgOolw4-lkp@intel.com>
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
commit: 92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d [17/17] bus_for_each_drv
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260126=
/202601260335.bRgOolw4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601260335.bRgOolw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260335.bRgOolw4-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/crypto/ap_bus.c:1507:20: error: initializing 'struct ap_dri=
ver *' with an expression of type 'const struct ap_driver *' discards quali=
fiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1507 |         struct ap_driver *ap_drv =3D to_ap_drv(drv);
         |                           ^        ~~~~~~~~~~~~~~
   1 error generated.


vim +1507 drivers/s390/crypto/ap_bus.c

7e0bdbe5c21cb8 Harald Freudenberger 2018-07-20  1503 =20
92cff81ee317b9 Thomas Wei=C3=9Fschuh     2026-01-25  1504  static int __ver=
ify_card_reservations(const struct device_driver *drv, void *data)
4f8206b882868b Tony Krowiak         2019-02-01  1505  {
4f8206b882868b Tony Krowiak         2019-02-01  1506  	int rc =3D 0;
4f8206b882868b Tony Krowiak         2019-02-01 @1507  	struct ap_driver *ap=
_drv =3D to_ap_drv(drv);
4f8206b882868b Tony Krowiak         2019-02-01  1508  	unsigned long *newap=
m =3D (unsigned long *)data;
6917f434fda346 Harald Freudenberger 2025-11-19  1509  	unsigned long aqm_an=
y[BITS_TO_LONGS(AP_DOMAINS)];
4f8206b882868b Tony Krowiak         2019-02-01  1510 =20
4f8206b882868b Tony Krowiak         2019-02-01  1511  	/*
4f8206b882868b Tony Krowiak         2019-02-01  1512  	 * increase the driv=
er's module refcounter to be sure it is not
4f8206b882868b Tony Krowiak         2019-02-01  1513  	 * going away when w=
e invoke the callback function.
4f8206b882868b Tony Krowiak         2019-02-01  1514  	 */
4f8206b882868b Tony Krowiak         2019-02-01  1515  	if (!try_module_get(=
drv->owner))
4f8206b882868b Tony Krowiak         2019-02-01  1516  		return 0;
4f8206b882868b Tony Krowiak         2019-02-01  1517 =20
4f8206b882868b Tony Krowiak         2019-02-01  1518  	if (ap_drv->in_use) {
6917f434fda346 Harald Freudenberger 2025-11-19  1519  		bitmap_fill(aqm_any=
, AP_DOMAINS);
6917f434fda346 Harald Freudenberger 2025-11-19  1520  		rc =3D ap_drv->in_u=
se(newapm, aqm_any);
4f8206b882868b Tony Krowiak         2019-02-01  1521  		if (rc)
4f8206b882868b Tony Krowiak         2019-02-01  1522  			rc =3D -EBUSY;
4f8206b882868b Tony Krowiak         2019-02-01  1523  	}
4f8206b882868b Tony Krowiak         2019-02-01  1524 =20
4f8206b882868b Tony Krowiak         2019-02-01  1525  	/* release the drive=
r's module */
4f8206b882868b Tony Krowiak         2019-02-01  1526  	module_put(drv->owne=
r);
4f8206b882868b Tony Krowiak         2019-02-01  1527 =20
4f8206b882868b Tony Krowiak         2019-02-01  1528  	return rc;
4f8206b882868b Tony Krowiak         2019-02-01  1529  }
4f8206b882868b Tony Krowiak         2019-02-01  1530 =20

:::::: The code at line 1507 was first introduced by commit
:::::: 4f8206b882868b62dc15ddfc0c17bb031876afb5 s390/ap: driver callback to=
 indicate resource in use

:::::: TO: Tony Krowiak <akrowiak@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
