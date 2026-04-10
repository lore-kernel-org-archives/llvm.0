Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979E3822BA;
	Fri, 10 Apr 2026 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864789; cv=none; b=jjOR/6KV6m/tMHRUJ0sRojmE6uJ239gLyJ8odCGI6WIx2byU3CcqLsq19tK4IEV61xylXWndknzQVAL4jfCPC6N1AaFczvWHPfZSKwLLRjn3RKoHifhGA62DEFL7Lb5EXSs0oEeei5rV9h2oID4IM0D/RXSyNaFfk0np84Ml3gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864789; c=relaxed/simple;
	bh=sfM3CZFB2U59RzAe5hjFyLx97s4ccAT/tNco5iWVbCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Djvehe8QrIwqSXqW+HGbl8D6JsE4oHJjtAPv4ZVAukUYqPEHvCKToc0aVYO0Y3bvvC1ITkxjDDlqAeUHn7SBPWaPoP7QputTVvFgsK2X50A3qMzowzoCJDIG/yaDFk7V5YCjwP0AhUKm0U5LTMJh868E+cOJ3DLExODkcmBc8nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li6uPIY5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li6uPIY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775864787; x=1807400787;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sfM3CZFB2U59RzAe5hjFyLx97s4ccAT/tNco5iWVbCc=;
  b=Li6uPIY5qB/IkqykzcXMuGPBrqUc1BIdH7zL9z12H2Cn2sQeAyPjM3Me
   J+RBcVRfjK5zb49zF3O5+CjLVJeSVPcmlKEdyHLdtR4jczsGeJB081YQg
   4p+DUrb5rbPUTEw5lF9RDeMwexuk0MB/RJs4tMDBMKScSRiczfhZcoLTr
   Wq9+Zal1x4OvNDZV1R72PS8IkgMimu7sG8wh2sOoKb2k3yfZUrsEufO5e
   9lXiYLKp0rNJvtwRc5E3JijI58PHZ7KUBrXVedgBs4QQN5agWDElBLisk
   DU4VeLThwBBRhjywJIcGEg9zwJnjWm2zBmSDsA491QG/CPIHCiYQ9bS8L
   g==;
X-CSE-ConnectionGUID: EKye8sZ3R8ue8O9tSmMm1g==
X-CSE-MsgGUID: JVUoPdo6SvWWkmx46T4f4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94282061"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="94282061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:46:26 -0700
X-CSE-ConnectionGUID: camOGe0rS6mZ6wgCUBQf7A==
X-CSE-MsgGUID: wCo1SJlKSEmjnVX+9Ftvvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222746875"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 16:46:25 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLYM-000000000Ot-1xZk;
	Fri, 10 Apr 2026 23:46:22 +0000
Date: Sat, 11 Apr 2026 07:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 91/98]
 drivers/platform/x86/intel/int3472/led.c:52:6: warning: no previous prototype
 for function 'skl_int3472_unregister_led'
Message-ID: <202604110739.2oKNvfbw-lkp@intel.com>
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
y-ci/archive/20260411/202604110739.2oKNvfbw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604110739.2oKNvfbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110739.2oKNvfbw-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/intel/int3472/led.c:20:38: error: no member named '=
led' in 'struct int3472_discrete_device'; did you mean 'leds'?
      20 |         struct int3472_led *led =3D &int3472->led;
         |                                             ^~~
         |                                             leds
   include/linux/platform_data/x86/int3472.h:132:4: note: 'leds' declared h=
ere
     132 |         } leds[INT3472_MAX_LEDS];
         |           ^
   drivers/platform/x86/intel/int3472/led.c:20:22: error: incompatible poin=
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
>> drivers/platform/x86/intel/int3472/led.c:52:6: warning: no previous prot=
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


vim +/skl_int3472_unregister_led +52 drivers/platform/x86/intel/int3472/led=
.c

5ae20a8050d08a Hans de Goede    2023-01-27  51 =20
39237e3208209d Marco Nenciarini 2026-04-01 @52  void skl_int3472_unregister=
_led(struct int3472_discrete_device *int3472)

:::::: The code at line 52 was first introduced by commit
:::::: 39237e3208209d1bb35d939d6fee1f36b642f562 platform/x86: int3472: Rena=
me pled to led in LED registration code

:::::: TO: Marco Nenciarini <mnencia@kcore.it>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
