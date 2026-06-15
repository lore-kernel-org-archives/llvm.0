Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E97A3B71AA;
	Mon, 15 Jun 2026 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561311; cv=none; b=XdMLMRyuBJ1HkkzpSNkpgMVXM/qiNfHHjcGt3aI0zacbu77B48a+/ZAMqByATQ3/q7jSzInxpq5j3K5CXzJOW6W9gGbbtBUYVrHB7FOd4LMCBIWWei4cPnLYjRXBSQOIDTPYwpeKTGMICJcfeljswGJxMflnWq+YI142atZCjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561311; c=relaxed/simple;
	bh=A1u3CCew+XEdU9sVqkQt/9+6IQRkv0lNH1B+dqzCaTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VAJL3HSwOeuEN9sGgPBjDienh8c+9zWVNrflNVnnCYGUBy9x9TIZ+fOMEypuU1Fk9cLO5CQihMppqR8vRuaBnvb7Ps/g3OSzb+28/gWljtYVy/8NXhHb21sRlRKuHsSaS/TPcUJONvI+04TptyJrwgFXKS4IExTPHWg9pG4PvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcpG2CRs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcpG2CRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781561309; x=1813097309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1u3CCew+XEdU9sVqkQt/9+6IQRkv0lNH1B+dqzCaTo=;
  b=NcpG2CRsX8Rjle67UpbNbT1PJPZlKkvnHGU1IZnY8pGKIHhAhvYNU9M+
   +yN7fSgexq+o1OPRH31r1+XaX/As4I2oXQMP3rIjxPYHRe5iUUDZlx3/n
   NiCCZxz9KUqQyVNK6AqOItqwS8P+iEtl76LnQOhsRiWdJdkylWhY+Af//
   QhoNZjHnWCXOyZGXKG0VJPCbNj3nMgnoS9pvZjJpI3p8zuJrx0IRMhxB+
   GmVVs68MNpl/H+rGuTPUiQBGod5s/jOKIEWRNWvE8bX0y3lBR7vGSOKF9
   MB7IErn7mtp33+6lIDPW1HVJ4TegikItOCkaT7yWcEBRUvrUAcIQAUTGw
   Q==;
X-CSE-ConnectionGUID: vTYp1O0tRraU2f88lqH8MA==
X-CSE-MsgGUID: ZPKsJr+uTDai7M811+7PpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82163995"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82163995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 15:08:29 -0700
X-CSE-ConnectionGUID: imRkFM9IRCyfFMUV1Ltvrw==
X-CSE-MsgGUID: taP2ecybTbK5wPswf4pnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247645560"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 15:08:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZFTk-00000000SPc-3f8C;
	Mon, 15 Jun 2026 22:08:24 +0000
Date: Tue, 16 Jun 2026 06:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-fan-curve 6/8]
 drivers/hwmon/cros_ec_hwmon.c:426:11: warning: result of comparison of
 constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned
 int') is always false
Message-ID: <202606160631.PYJS1WF9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_ec-hwmon-fan-curve
head:   582a1b36e53f5d5ee673ad6414dd5c643373093b
commit: 0bd9cb0132cfadeb570112043e378431fe8b6484 [6/8] hwmon: (cros_ec) Add support for displaying fan curves
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606160631.PYJS1WF9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160631.PYJS1WF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160631.PYJS1WF9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.c:426:11: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     426 |         if (temp > LONG_MAX || cros_ec_hwmon_kelvin_to_millicelsius(temp, &temp_millicelsius))
         |             ~~~~ ^ ~~~~~~~~
   1 warning generated.


vim +426 drivers/hwmon/cros_ec_hwmon.c

   401	
   402	static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attribute *attr,
   403						 char *buf)
   404	{
   405		struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
   406		struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
   407		struct ec_thermal_config config;
   408		long temp_millicelsius;
   409		u32 temp;
   410		int ret;
   411	
   412		scoped_guard(hwmon_lock, dev) {
   413			ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
   414			if (ret)
   415				return ret;
   416		}
   417	
   418		if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
   419			temp = config.temp_fan_off;
   420		else /* temp_fan_max */
   421			temp = config.temp_fan_max;
   422	
   423		if (temp == 0)
   424			return -ENODATA;
   425	
 > 426		if (temp > LONG_MAX || cros_ec_hwmon_kelvin_to_millicelsius(temp, &temp_millicelsius))
   427			return -ERANGE;
   428	
   429		return sysfs_emit(buf, "%ld\n", temp_millicelsius);
   430	}
   431	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
