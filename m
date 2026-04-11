Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDE1EB5F8;
	Sat, 11 Apr 2026 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775870874; cv=none; b=J3ZxjbsthbKxSZSDW4NqAEdxr6gr4atHscqv/kDCXbVnspwvMPQgeoYLvGnksFc19Wh+XiahO3Pr2J8YeQFQP/SlmSNuZhcKG3/hEakOfyL+TARBRe36/bJOO1QII7J5HIrFs43Ue3DPdkeCskd8MNGRb9JIJu2hV0mbsxCb7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775870874; c=relaxed/simple;
	bh=nxUUKv9YbpMsaim5sgQO+WV521SmK4H3plal/gloVt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tGvKpxwT/anWl9m77bnzgD3bvyuK4xZKu1m0GAtWzcHaW5RlxCgKwAta1BOAoyYbxFvd+RzMcRlvqplF68B99gF9hp2QpLqO8rN60LwAX/iX+MMnj33wKzHHMG5xPnuT57uZviBQfSUZvNLmfL92GxHB89W9sDDF9a6PNFWmOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK9xW3Lc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK9xW3Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775870873; x=1807406873;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nxUUKv9YbpMsaim5sgQO+WV521SmK4H3plal/gloVt4=;
  b=KK9xW3LcF5VXT7aq7ij5D6Enl3nJFhob3NOXtEIGH4QUeKqJ1XWfkXX4
   QmpwRCBP+ChiBP5shNrfyb2WAeaptcFETqLcWnY+odsIJpjDStCHiP+xg
   NBb+FzJ+/hzoUuF42YWWbxI0xtv/TIw/nuQW914tM1TVkXWyT8bw6HgIs
   TaLQH6/Wk61AuhlzKLC8U4XU+opk3uz5TSNOVFrQdht5k4lmSUwefMSZg
   SjuEq4XfU65n5X76v26LZyxzu0cJMPsxoryjjSyYC/ea6co3iRgc8FhOG
   1C87Ug4Zo+qDmAdXhE9+6bx+59bQM0AW4e5w+f8Rcx44nU+o4c3dJHTvD
   w==;
X-CSE-ConnectionGUID: HLpv40X2SHGb1tCohfw2+A==
X-CSE-MsgGUID: eLQfwLZ+SQq0CWrUS710BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77077136"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="77077136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:27:52 -0700
X-CSE-ConnectionGUID: NbWn+U6EQmyGCkMZKtKqeA==
X-CSE-MsgGUID: 0Qcp/QarTmSejFqAma7QJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252630266"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 18:27:50 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBN8V-000000000Zp-3KTW;
	Sat, 11 Apr 2026 01:27:47 +0000
Date: Sat, 11 Apr 2026 09:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 91/98]
 drivers/platform/x86/intel/int3472/led.c:20:38: error: no member named 'led'
 in 'struct int3472_discrete_device'; did you mean 'leds'?
Message-ID: <202604110929.MbHQ51V1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git review-ilpo-next
head:   d0e6904dc063c19e470bb505eb010eb9f1b1148a
commit: bbd917d96aa152a5c4701964db5b28db666f7491 [91/98] platform/x86: int3=
472: Add support for GPIO type 0x02 (IR flood LED)
config: i386-buildonly-randconfig-001-20260411 (https://download.01.org/0da=
y-ci/archive/20260411/202604110929.MbHQ51V1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604110929.MbHQ51V1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110929.MbHQ51V1-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/int3472/led.c:20:38: error: no member named '=
led' in 'struct int3472_discrete_device'; did you mean 'leds'?
      20 |         struct int3472_led *led =3D &int3472->led;
         |                                             ^~~
         |                                             leds
   include/linux/platform_data/x86/int3472.h:132:4: note: 'leds' declared h=
ere
     132 |         } leds[INT3472_MAX_LEDS];
         |           ^
>> drivers/platform/x86/intel/int3472/led.c:20:22: error: incompatible poin=
ter types initializing 'struct int3472_led *' with an expression of type 's=
truct int3472_led (*)[2]' [-Werror,-Wincompatible-pointer-types]
      20 |         struct int3472_led *led =3D &int3472->led;
         |                             ^     ~~~~~~~~~~~~~
   drivers/platform/x86/intel/int3472/led.c:54:38: error: no member named '=
led' in 'struct int3472_discrete_device'; did you mean 'leds'?
      54 |         struct int3472_led *led =3D &int3472->led;
         |                                             ^~~
         |                                             leds
   include/linux/platform_data/x86/int3472.h:132:4: note: 'leds' declared h=
ere
     132 |         } leds[INT3472_MAX_LEDS];
         |           ^
   drivers/platform/x86/intel/int3472/led.c:54:22: error: incompatible poin=
ter types initializing 'struct int3472_led *' with an expression of type 's=
truct int3472_led (*)[2]' [-Werror,-Wincompatible-pointer-types]
      54 |         struct int3472_led *led =3D &int3472->led;
         |                             ^     ~~~~~~~~~~~~~
   drivers/platform/x86/intel/int3472/led.c:52:6: warning: no previous prot=
otype for function 'skl_int3472_unregister_led' [-Wmissing-prototypes]
      52 | void skl_int3472_unregister_led(struct int3472_discrete_device *=
int3472)
         |      ^
   drivers/platform/x86/intel/int3472/led.c:52:1: note: declare 'static' if=
 the function is not intended to be used outside of this translation unit
      52 | void skl_int3472_unregister_led(struct int3472_discrete_device *=
int3472)
         | ^
         | static=20
   1 warning and 4 errors generated.


vim +20 drivers/platform/x86/intel/int3472/led.c

5ae20a8050d08a Hans de Goede    2023-01-27  16 =20
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  17  int skl_int3472_register_le=
d(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  18  			     const char *con_id)
5ae20a8050d08a Hans de Goede    2023-01-27  19  {
39237e3208209d Marco Nenciarini 2026-04-01 @20  	struct int3472_led *led =
=3D &int3472->led;
53c5f7f6e7930f Hans de Goede    2023-10-04  21  	char *p;
5ae20a8050d08a Hans de Goede    2023-01-27  22  	int ret;
5ae20a8050d08a Hans de Goede    2023-01-27  23 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  24  	if (led->classdev.dev)
5ae20a8050d08a Hans de Goede    2023-01-27  25  		return -EBUSY;
5ae20a8050d08a Hans de Goede    2023-01-27  26 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  27  	led->gpio =3D gpio;
5ae20a8050d08a Hans de Goede    2023-01-27  28 =20
5ae20a8050d08a Hans de Goede    2023-01-27  29  	/* Generate the name, repl=
acing the ':' in the ACPI devname with '_' */
d6116d86e58a04 Marco Nenciarini 2026-04-01  30  	snprintf(led->name, sizeof=
(led->name),
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  31  		 "%s::%s_led", acpi_dev_n=
ame(int3472->sensor), con_id);
d6116d86e58a04 Marco Nenciarini 2026-04-01  32  	p =3D strchr(led->name, ':=
');
5ae20a8050d08a Hans de Goede    2023-01-27  33  	if (p)
5ae20a8050d08a Hans de Goede    2023-01-27  34  		*p =3D '_';
5ae20a8050d08a Hans de Goede    2023-01-27  35 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  36  	led->classdev.name =3D led=
->name;
d6116d86e58a04 Marco Nenciarini 2026-04-01  37  	led->classdev.max_brightne=
ss =3D 1;
39237e3208209d Marco Nenciarini 2026-04-01  38  	led->classdev.brightness_s=
et_blocking =3D int3472_led_set;
5ae20a8050d08a Hans de Goede    2023-01-27  39 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  40  	ret =3D led_classdev_regis=
ter(int3472->dev, &led->classdev);
5ae20a8050d08a Hans de Goede    2023-01-27  41  	if (ret)
5ccf9873ab2bcb Hans de Goede    2023-10-04  42  		return ret;
5ae20a8050d08a Hans de Goede    2023-01-27  43 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  44  	led->lookup.provider =3D l=
ed->name;
d6116d86e58a04 Marco Nenciarini 2026-04-01  45  	led->lookup.dev_id =3D int=
3472->sensor_name;
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  46  	led->lookup.con_id =3D con=
_id;
d6116d86e58a04 Marco Nenciarini 2026-04-01  47  	led_add_lookup(&led->looku=
p);
5ae20a8050d08a Hans de Goede    2023-01-27  48 =20
5ae20a8050d08a Hans de Goede    2023-01-27  49  	return 0;
5ae20a8050d08a Hans de Goede    2023-01-27  50  }
5ae20a8050d08a Hans de Goede    2023-01-27  51 =20

:::::: The code at line 20 was first introduced by commit
:::::: 39237e3208209d1bb35d939d6fee1f36b642f562 platform/x86: int3472: Rena=
me pled to led in LED registration code

:::::: TO: Marco Nenciarini <mnencia@kcore.it>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
