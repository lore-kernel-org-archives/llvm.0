Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621131A7EE;
	Sun, 25 Jan 2026 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769357595; cv=none; b=ZH8Sb07ZKb8nHDm6pWHdyNRthzvN5xSPSfrFxEpvZNneb7o1yRxpDqA0pmIyUgtDhry5y45Qr+LLf0ezJhvF61hBGCnoNaLAAagchsXowuW1NtQS+IWeL0V79/onynE4q8Lq6F8q+dQ59t6NLB+t9DhjaEOypgbT+ms6GbGWCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769357595; c=relaxed/simple;
	bh=yfk8aeirk2ssYalYLibx3FnrbvQvCR/9FCJ8n6acUk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m63iLDijd3WdlgyIHocRH4e12jEWFj4KJHGAoX8Yp5DckdFt792WWyLb4Y58VE+eFjYwISr/1RZo6/MXBrv6zOjQ9NydXYri4wi8EDcnY4BZIvECuxSmdxffKjonup6dE1aykkVjmHi4cP/kx8f+IKiORVSJQObeeyR2YOMdF6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZ5rw4q1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZ5rw4q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769357592; x=1800893592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yfk8aeirk2ssYalYLibx3FnrbvQvCR/9FCJ8n6acUk0=;
  b=HZ5rw4q1Q+gUdv2OvkwpsK3DcehMfWzSu+jBOGHGPPx6rDPE1B2/vTmO
   LTKVJnMa40ZhJbQCRtbNWOQYXBEOvQ7m+gnOOmUw27m6Wibk5ewJ/7cEw
   EMMUZDmg6GdA9DiF9Kd8a+r2Rts1Z8tN78eIIetGqXuCxZb3jzM80ldrr
   NVpbEV4lvHJzFIQAHRaUV5loeMAp1mEnKKiqZa+TFLLU1Yowq88j4Bgvl
   QJ2WMb3fVMo2ZRRycnWGtBPBx84gSQEGCMjV5PgNebPo2oLYfpWYeh1q/
   zrC70m/3+vFKqYB/EWWIM4EujiQU0pXADEVPQz0KVUsanHaloUJ05/IjU
   Q==;
X-CSE-ConnectionGUID: bZQ1O9EjSI6sOjO/lLEaAw==
X-CSE-MsgGUID: mWGk4UopSzyv815UOGB8BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="88127098"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="88127098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 08:13:11 -0800
X-CSE-ConnectionGUID: O9YtIyZ9She0O3F5DRnGRQ==
X-CSE-MsgGUID: /Fui/nLySlWwJXC3svc46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207084414"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jan 2026 08:13:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2jc-000000001Ij-2Sbn;
	Sun, 25 Jan 2026 16:13:08 +0000
Date: Sun, 25 Jan 2026 17:12:16 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 drivers/input/serio/serio.c:707:23: error: initializing 'struct serio_driver
 *' with an expression of type 'const struct serio_driver *' discards
 qualifiers
Message-ID: <202601251740.4SJvARFU-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260125/2026=
01251740.4SJvARFU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601251740.4SJvARFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251740.4SJvARFU-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/input/serio/serio.c:707:23: error: initializing 'struct serio_dr=
iver *' with an expression of type 'const struct serio_driver *' discards q=
ualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     707 |         struct serio_driver *driver =3D to_serio_driver(drv);
         |                              ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:714:23: error: initializing 'struct serio_dr=
iver *' with an expression of type 'const struct serio_driver *' discards q=
ualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     714 |         struct serio_driver *serio_drv =3D to_serio_driver(drv);
         |                              ^           ~~~~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:720:23: error: initializing 'struct serio_dr=
iver *' with an expression of type 'const struct serio_driver *' discards q=
ualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     720 |         struct serio_driver *serio_drv =3D to_serio_driver(drv);
         |                              ^           ~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +707 drivers/input/serio/serio.c

3c803e8e2f15d0 Linus Torvalds   2005-06-27  699 =20
^1da177e4c3f41 Linus Torvalds   2005-04-16  700 =20
^1da177e4c3f41 Linus Torvalds   2005-04-16  701  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  702   * Serio driver operations
^1da177e4c3f41 Linus Torvalds   2005-04-16  703   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  704 =20
445ba0f479b21c Thomas Wei=C3=9Fschuh 2026-01-25  705  static ssize_t descri=
ption_show(const struct device_driver *drv, char *buf)
^1da177e4c3f41 Linus Torvalds   2005-04-16  706  {
^1da177e4c3f41 Linus Torvalds   2005-04-16 @707  	struct serio_driver *driv=
er =3D to_serio_driver(drv);
^1da177e4c3f41 Linus Torvalds   2005-04-16  708  	return sprintf(buf, "%s\n=
", driver->description ? driver->description : "(none)");
^1da177e4c3f41 Linus Torvalds   2005-04-16  709  }
445ba0f479b21c Thomas Wei=C3=9Fschuh 2026-01-25  710  static const DRIVER_A=
TTR_RO(description);
^1da177e4c3f41 Linus Torvalds   2005-04-16  711 =20

:::::: The code at line 707 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
