Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322B1E5207;
	Tue, 14 Apr 2026 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776126117; cv=none; b=KnTYbDkQ2Gr35e3i5vajJWRXVdjJwUIIx2baumO52pd4dQyux9ZWCbaHIFIqxztIL+GEHJoFcM8iTqpyfSNPRxBqpJaNXapLXe+tAS908pGfRspOWbBot9KR1VGKEJ9/jUFgGVrx4qhPi8bdYJMnij/ZhWBkeMbhh9EBFo6+71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776126117; c=relaxed/simple;
	bh=fmZrpnvZSiXcP9RKUulKAGAGo5Cfb77IoKRT2p8KJQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xe7MdeBywQx6aHVdbMMiDc1faFuo3/Z4PpHs86OXl8cuEfp5oUwqnwKAkSh7wrauVHFX4dHfGQyURmz8wbYwz4HsUIfzH87DcPposl/Z82o7qX7F0pjDZJ7WvF4YPkE4WtthNyM/hp1ia0AIzWZmCRGZiVl3Rm0RKzD9grCrze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvjfMJgK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvjfMJgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776126116; x=1807662116;
  h=date:from:to:cc:subject:message-id;
  bh=fmZrpnvZSiXcP9RKUulKAGAGo5Cfb77IoKRT2p8KJQ0=;
  b=WvjfMJgK3bWwg0l1Jw6RkAcjYXlPJ7UmvN111E+1dbdPLXsyDDcyW1aE
   poVa5kqnptlEBex7HMGD7EYu11Hu45vwYqkhrYh92V36X/Kk9d3rvGzWR
   kJ6cNXYmDzzbyW+YKFuk7E4o87u4xcP3dWwkz0CfbU0ENJEEvV7XD3VZy
   fYWwL0N8Pu3pz4DbfVwir6sYPv9QTDtqidixvMMMPlAn0XBwknq20zlaU
   HG1TOb3O77J3vQ37JWMN1Yu/xpQ0H/dONHIuXSgKvOdEuFDxVhw7xfr4s
   738Bk1R8ZyJO8dPqjuMw5K9a23l29oLpXVyT+r3GwfNjiVlrTsWjbdb38
   A==;
X-CSE-ConnectionGUID: 8izBWk4jScOtRCUKyFRwzA==
X-CSE-MsgGUID: mLkDvKXkQXm1Y99jndL5LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77254468"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="77254468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 17:21:56 -0700
X-CSE-ConnectionGUID: TwemIVmaQYeXXmfH3qHFSA==
X-CSE-MsgGUID: t+obGsjsQnWmL8+nGiwK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="229057294"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Apr 2026 17:21:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCRXL-000000000G9-2ssq;
	Tue, 14 Apr 2026 00:21:51 +0000
Date: Tue, 14 Apr 2026 02:21:34 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 18/25]
 drivers/thermal/thermal_core.c:1200:10: warning: variable 'tcd' is
 uninitialized when used here
Message-ID: <202604140217.Kmk4ayFu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 10ad4e2ee1d7bd68d2c7c0d50cb052920305f455 [18/25] thermal/core: Register cooling device non-OF drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604140217.Kmk4ayFu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140217.Kmk4ayFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140217.Kmk4ayFu-lkp@intel.com/

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
