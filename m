Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373E281723;
	Sat, 12 Oct 2024 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728721201; cv=none; b=Hn4ywUb0bjR8LkxkWd38qdGEL0rS4Om1xOU9r3UseLVhSLPtcrbVTCpb4pYjSoJD+A1n8bcmWmRV8ipW0bzEbt1Nj2rWzUxuIuQ5jewjVX1x2CZ1c4FihtsuhIF9o9VTg3Hf5xh0IfmqCMqsidqNM5GMaBAtxCFL0wdI0EFpFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728721201; c=relaxed/simple;
	bh=NqIiEhbbxN8hJyx4P7r6NaG/98K5LACXmeO9phrs+RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfM4RnYj9Io83WM471enCEsIRQFNMa9RcCu7xHEwNJkE7N6EfSWAv81jRlzcli5Uu0kokoxgomixmuPSDuK4q0LKUGPkGeeRDsgqLT9Cuwi6E0PhB3+zZW6o+QyJxOKvF3D8u1nRmUBr1gRkd1AFu+CqpChqrATgwu+wvJz44Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOc1EFo5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOc1EFo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728721200; x=1760257200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqIiEhbbxN8hJyx4P7r6NaG/98K5LACXmeO9phrs+RE=;
  b=UOc1EFo5LcrvwLzuw2Bmme1Qt2zIE9bXfLIZCR8wQ6Mp60avT1dZ69+U
   xvactM+wWHTaQNgtlBarbd8pcWHCPJE9C8Ocddri4aHqiz0hBfcWSf4xo
   K90ymJ2mqfc98IyAnjG3DOZYMV0OvaGKa9kG37iBYgJqVnj3aC8L++AvT
   NlZZX16c88Qrj/W14upp4UOPkwaSDcDmR+bxsTXRD5qgXvyKm032kVGBv
   572fYtgJuVG+ZYYvLbatMZl1AOT4zN82Dv30Yl2G2+7Wo+i5lhfL/KDFr
   /H8DeYYc0jGZ/VF1tYI1g0/kdkjtV/RuNCg1sIuMpNVwVXFeg9O9NuXFA
   g==;
X-CSE-ConnectionGUID: 40A2FpNuT5WIsXPL/3W3Qw==
X-CSE-MsgGUID: Zty7onhIQ+Spm7SMpfp9kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45600181"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45600181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 01:19:59 -0700
X-CSE-ConnectionGUID: U6aJh22jQRuRziwmOkcrhQ==
X-CSE-MsgGUID: 8r2eiGJBTUes0KzaKjtqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="76992768"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Oct 2024 01:19:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szXLv-000DCB-0U;
	Sat, 12 Oct 2024 08:19:55 +0000
Date: Sat, 12 Oct 2024 16:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Holla <pholla@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: [lee-mfd:for-mfd-next 13/27] drivers/mfd/cros_ec_dev.c:132:10:
 error: use of undeclared identifier 'EC_FEATURE_UCSI_PPM'; did you mean
 'EC_FEATURE_USB_PD'?
Message-ID: <202410121638.6L1KYC3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   bc37b44978d38e1b38373b2a5774e4b4753a7523
commit: e5d1202b6b1efa2a533564e21476dadb1b838f6b [13/27] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
config: i386-buildonly-randconfig-002-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121638.6L1KYC3r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121638.6L1KYC3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121638.6L1KYC3r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/cros_ec_dev.c:132:10: error: use of undeclared identifier 'EC_FEATURE_UCSI_PPM'; did you mean 'EC_FEATURE_USB_PD'?
     132 |                 .id             = EC_FEATURE_UCSI_PPM,
         |                                   ^~~~~~~~~~~~~~~~~~~
         |                                   EC_FEATURE_USB_PD
   include/linux/platform_data/cros_ec_commands.h:1252:2: note: 'EC_FEATURE_USB_PD' declared here
    1252 |         EC_FEATURE_USB_PD = 22,
         |         ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +132 drivers/mfd/cros_ec_dev.c

   114	
   115	static const struct cros_feature_to_cells cros_subdevices[] = {
   116		{
   117			.id		= EC_FEATURE_CEC,
   118			.mfd_cells	= cros_ec_cec_cells,
   119			.num_cells	= ARRAY_SIZE(cros_ec_cec_cells),
   120		},
   121		{
   122			.id		= EC_FEATURE_GPIO,
   123			.mfd_cells	= cros_ec_gpio_cells,
   124			.num_cells	= ARRAY_SIZE(cros_ec_gpio_cells),
   125		},
   126		{
   127			.id		= EC_FEATURE_RTC,
   128			.mfd_cells	= cros_ec_rtc_cells,
   129			.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
   130		},
   131		{
 > 132			.id		= EC_FEATURE_UCSI_PPM,
   133			.mfd_cells	= cros_ec_ucsi_cells,
   134			.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
   135		},
   136		{
   137			.id		= EC_FEATURE_USB_PD,
   138			.mfd_cells	= cros_usbpd_charger_cells,
   139			.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
   140		},
   141		{
   142			.id		= EC_FEATURE_HANG_DETECT,
   143			.mfd_cells	= cros_ec_wdt_cells,
   144			.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
   145		},
   146		{
   147			.id		= EC_FEATURE_LED,
   148			.mfd_cells	= cros_ec_led_cells,
   149			.num_cells	= ARRAY_SIZE(cros_ec_led_cells),
   150		},
   151		{
   152			.id		= EC_FEATURE_PWM_KEYB,
   153			.mfd_cells	= cros_ec_keyboard_leds_cells,
   154			.num_cells	= ARRAY_SIZE(cros_ec_keyboard_leds_cells),
   155		},
   156	};
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
