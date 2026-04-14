Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C26385527;
	Tue, 14 Apr 2026 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185103; cv=none; b=QI2wHq2AGOcY4/ZAMk+w4S0ipjm+Fe1ESTZWak69cP4dsvtfPskaluAEI2nHD+D27ikHK6Ur+S2/UC26ntkTrlsLLSHXP9bCTO+16szbpHm0XFfPLXzsur/W66Dcm4YtmVoRepGCtC4mpbScdDPI+U9XGSZBXFlyQGZSa9YdGKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185103; c=relaxed/simple;
	bh=QzAwMTyBOgaTgjx9AUZMG2uXTXE0esl8k7CpBBTwxCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t56Xf37es/WzFqmjw2/jQaBcQPgZ8ad4Mz89FRUisKOYboqUkfU8pnfoo/uiplpKmGG7VF8PxtS3tJwllGMQHvUGTpo9l61n5erk0Qs2DCrHQC/6V4N/NuSPIVWheieiD7Zh2ugz2hkK8D6nh2cYHUeZ0G6bW6tEscRabWiqL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHbF8SSi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHbF8SSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776185102; x=1807721102;
  h=date:from:to:cc:subject:message-id;
  bh=QzAwMTyBOgaTgjx9AUZMG2uXTXE0esl8k7CpBBTwxCE=;
  b=LHbF8SSiekm8YloNgH6PTsTISjBUGDQ3lT+GTatQGY4GQySdS/iaXCEu
   DUpH2zUQ9BGqvgQt+d1RrQYV3KmAFzp/HXqThRZaMP5brTpPGLIUryjrI
   hyRSAa7DCr2CZ6uQnxoM43GR7u4DT3XaCAeZenzoAKStMAnu6crvSRvWf
   1bkb/B0SGiAKCJoz4gLBtg6jr9sGvJDHAJPSY5sgTd3IvGTT9yaR/9aBQ
   BP5M4Bu9i4DbRjK6KbF7xV4G7h30QmZGFosu6Dtp3dksEXnH21T50nUlS
   M9KxgMrnvSGrHAPxu6aTOdWKw3lrONc14tbZ6AWddZTT2xJqPIletgMlh
   Q==;
X-CSE-ConnectionGUID: S3xV1jrmRrqwKEdJtNAAXQ==
X-CSE-MsgGUID: YtecD8HXQpmjJ0gUtbLB2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99793462"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99793462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:45:00 -0700
X-CSE-ConnectionGUID: Qc+PS2iPSLyiGJROh95wzQ==
X-CSE-MsgGUID: g6PPu6kMQPuBIFBEfcFuKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="223639856"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2026 09:44:58 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCgsi-000000001fN-0m3V;
	Tue, 14 Apr 2026 16:44:56 +0000
Date: Wed, 15 Apr 2026 00:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 18/25]
 drivers/thermal/thermal_core.c:1200:10: warning: variable 'tcd' is
 uninitialized when used here
Message-ID: <202604150002.sljttjeq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 10ad4e2ee1d7bd68d2c7c0d50cb052920305f455 [18/25] thermal/core: Register cooling device non-OF drivers
config: x86_64-buildonly-randconfig-004-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150002.sljttjeq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150002.sljttjeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150002.sljttjeq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/thermal_core.c:1200:10: warning: variable 'tcd' is uninitialized when used here [-Wuninitialized]
    1200 |                 return tcd;
         |                        ^~~
   drivers/thermal/thermal_core.c:1190:43: note: initialize the variable 'tcd' to silence this warning
    1190 |         struct thermal_cooling_device **ptr, *tcd;
         |                                                  ^
         |                                                   = NULL
   1 warning generated.


vim +/tcd +1200 drivers/thermal/thermal_core.c

  1170	
  1171	/**
  1172	 * devm_thermal_cooling_device_register() - register a thermal cooling device
  1173	 * @dev:	a valid struct device pointer of a sensor device.
  1174	 * @type:	the thermal cooling device type.
  1175	 * @devdata:	device private data.
  1176	 * @ops:	standard thermal cooling devices callbacks.
  1177	 *
  1178	 * This function will register a cooling device with device tree node reference.
  1179	 * This interface function adds a new thermal cooling device (fan/processor/...)
  1180	 * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
  1181	 * to all the thermal zone devices registered at the same time.
  1182	 *
  1183	 * Return: a pointer to the created struct thermal_cooling_device or an
  1184	 * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  1185	 */
  1186	struct thermal_cooling_device *
  1187	devm_thermal_cooling_device_register(struct device *dev, const char *type,
  1188					     void *devdata, const struct thermal_cooling_device_ops *ops)
  1189	{
  1190		struct thermal_cooling_device **ptr, *tcd;
  1191	
  1192		ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
  1193				   GFP_KERNEL);
  1194		if (!ptr)
  1195			return ERR_PTR(-ENOMEM);
  1196	
  1197		thermal_cooling_device_register(type, devdata, ops);
  1198		if (IS_ERR(tcd)) {
  1199			devres_free(ptr);
> 1200			return tcd;
  1201		}
  1202	
  1203		*ptr = tcd;
  1204		devres_add(dev, ptr);
  1205	
  1206		return tcd;
  1207	}
  1208	EXPORT_SYMBOL_GPL(devm_thermal_cooling_device_register);
  1209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
