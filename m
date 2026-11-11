Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385901;
	b=dbIWjZ+m0NDHRWJxk/Usqz7cTU3uSQ7BKrdda8HEgt6suaKlojiQLN2L/JtHKClmrUR+
	 1aUnCd+tjjge+7TqXA5Dp2ji9VXJ+jI1eqQszpI6nd/XEsQThe4cbCC28ydIKgvLEqkxT
	 q++ZMY5SqwRacptvJQjjYOqtEIQEtkfCww3MFWRUaddZk5UAsJQ7kTNG5Tcwla7EiPITi
	 0jP0olaN08VuVNUVTK6jIdMq0M9/VGaTeNdIRttVfcXz+McAV2H4ewRlCm00CR4BDIySO
	 a5ooU+rtDhbQ2M7iKQZkNg1Q/44dcIopi78bR8Gucb5L1Hn4IpcoZmUcWpNx7m0GvBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385901;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fnpg8++pCSHxAySt0By1k1tE0/H2x/Ojwwrq0p+nEA0=;
	b=OiuEU2lavUdE94oVgPOmnP1CvJR1JcSXiD8aL9Cgx3duvQSDnxAsLlDM3JkLGnFEQI3L
	 OTyLQy0i/eMPvL+Rh0LHdgMdVcstpff3uUkKa4lBgaddR+f9yowB3tu82mBWYD1DjMwpK
	 vGRlQSsggrlA+wSVBMOEY4ffCu39xnUu2Fq5px4H9wYdySC4jl3ZwEfZsx8i8S4QRIJFh
	 fJwUYpJAcWoCdvhoEeMZEH5fBBNCcta1YCyY3whww0HHPHdT2vfKp/HnAZCqM9r8+kDMV
	 AKlhjqMLYo6QnF1anX16XShPeitB37UgaTT1Z4SJ/rw8g+Ouua3kxo7Np4tNM9oKvQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AN7nsDIt;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB1606A321;
	Wed, 11 Nov 2026 08:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CB1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AN7nsDIt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794385900; x=1825921900;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LuCmyYom3oMHL4Y2LbIgsHBortL/481HciQGfC98Plc=;
  b=AN7nsDItdX0WfIfaGhZiivGHT4AZJC3ERzqRlzhOj43daOarfgSUjfne
   JT0AfNlE3nVGOfERvcMgbDnKkV0Kq+hkuoLttdvHfmhOOAoZ1qZ+t2FQe
   qGxo17kNyZX9/aV+yXwwU+i9lroFfUpH+ESKkO5l45J4GT2XgZvixrTDJ
   x+fxLMGVisN9u+dCNqrNtOqNVfxNiWSfm8xeNngaT9qlTtTysuxiYpBlZ
   mF9/4/EL37NvQV88FR7qrRg6v7uNf9ZsuaC2Q/hvXc3fUw6FgdZiMFYET
   ae+IJmlvOnKgcHMw+wOsWHfU6fX4AydZ7qAGR3InxLhDXLYKMSwfK7Bpc
   Q==;
X-CSE-ConnectionGUID: 62QV6o9xRpK1JUDvYgTzfg==
X-CSE-MsgGUID: oJR59bd5RQqkbLNGx1pHjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3036648"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3036648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 00:31:40 -0800
X-CSE-ConnectionGUID: pRAqIq2NR/GTWPqaWdxA4Q==
X-CSE-MsgGUID: 9jk+JpjORiylE+j6NeYJPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8250021"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Nov 2026 00:31:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR3k0-00000000yR3-1jHi;
	Wed, 11 Nov 2026 08:31:36 +0000
Date: Wed, 11 Nov 2026 16:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:bleeding-edge 9/22]
 drivers/platform/x86/acer-wmi-battery.c:292:9: error: call to undeclared
 function 'devm_battery_hook_register'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202611111639.D9pOcfbe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 bleeding-edge
head:   51bafe2e7302403a43ba45415bf9a268a7fcaa05
commit: fafe4f5166bc3d43e28967efb9ea82b1f456b798 [9/22] Merge branch 'acpi-=
battery' into bleeding-edge
config: x86_64-randconfig-1000-20261111 (https://download.01.org/0day-ci/ar=
chive/20261111/202611111639.D9pOcfbe-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261111/202611111639.D9pOcfbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111639.D9pOcfbe-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/acer-wmi-battery.c:292:9: error: call to undeclared=
 function 'devm_battery_hook_register'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
     292 |         return devm_battery_hook_register(&data->wdev->dev, &dat=
a->hook);
         |                ^
   drivers/platform/x86/acer-wmi-battery.c:292:9: note: did you mean 'acpi_=
battery_hook_register'?
   include/acpi/battery.h:26:6: note: 'acpi_battery_hook_register' declared=
 here
      26 | void acpi_battery_hook_register(struct acpi_battery_hook *hook);
         |      ^
   1 error generated.


vim +/devm_battery_hook_register +292 drivers/platform/x86/acer-wmi-battery=
.c

c72dd9994952eb Jelle van der Waa 2026-09-13  275 =20
c72dd9994952eb Jelle van der Waa 2026-09-13  276  static int acer_wmi_batte=
ry_probe(struct wmi_device *wdev, const void *context)
c72dd9994952eb Jelle van der Waa 2026-09-13  277  {
c72dd9994952eb Jelle van der Waa 2026-09-13  278  	struct acer_wmi_battery_=
data *data;
c72dd9994952eb Jelle van der Waa 2026-09-13  279 =20
4dd10fbbeb9c33 Kees Cook         2026-10-28  280  	data =3D devm_kzalloc_ob=
j(&wdev->dev, *data);
c72dd9994952eb Jelle van der Waa 2026-09-13  281  	if (!data)
c72dd9994952eb Jelle van der Waa 2026-09-13  282  		return -ENOMEM;
c72dd9994952eb Jelle van der Waa 2026-09-13  283 =20
c72dd9994952eb Jelle van der Waa 2026-09-13  284  	dev_set_drvdata(&wdev->d=
ev, data);
c72dd9994952eb Jelle van der Waa 2026-09-13  285  	data->wdev =3D wdev;
c72dd9994952eb Jelle van der Waa 2026-09-13  286  	data->battery_ext =3D he=
alth_mode ? &acer_wmi_battery_extension_v2
c72dd9994952eb Jelle van der Waa 2026-09-13  287  					: &acer_wmi_battery_=
extension_v1;
c72dd9994952eb Jelle van der Waa 2026-09-13  288  	data->hook.name =3D "Ace=
r Battery Extension";
c72dd9994952eb Jelle van der Waa 2026-09-13  289  	data->hook.add_battery =
=3D acer_battery_add;
c72dd9994952eb Jelle van der Waa 2026-09-13  290  	data->hook.remove_batter=
y =3D acer_battery_remove;
c72dd9994952eb Jelle van der Waa 2026-09-13  291 =20
c72dd9994952eb Jelle van der Waa 2026-09-13 @292  	return devm_battery_hook=
_register(&data->wdev->dev, &data->hook);
c72dd9994952eb Jelle van der Waa 2026-09-13  293  }
c72dd9994952eb Jelle van der Waa 2026-09-13  294 =20

:::::: The code at line 292 was first introduced by commit
:::::: c72dd9994952eb09442827caecb945474ae3072b platform/x86: add Acer batt=
ery control driver

:::::: TO: Jelle van der Waa <jelle@vdwaa.nl>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
