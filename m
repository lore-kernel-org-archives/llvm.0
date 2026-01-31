Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD42318EED;
	Sat, 31 Jan 2026 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824185; cv=none; b=exyGYRyg4qnS/YeZJLDBU5jXHjh8NTAQ6UNvCPQjgHZ11gYNOcY0mhKmPTpaoK6nuQ9dm9VfooyA0xCVmGORCRZtocfIOuJaebV4jza+P4nEnisImFQS08H0lRJ009g/mo5Ee403ZYRJNux7l+jlwhIwBIoSBkmEkPERxdo7nGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824185; c=relaxed/simple;
	bh=DyCkOmA2uzFhiwv/OdBBFJxggncw0n9/yIuGCieF3BY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZYDbzuhlLFOa9Cos+jj/OhH3Y4YPosFHCXGpkUj9gmK1j+CD5lIFR8czqQ5R6eUJB/Y93UxNQ+01fISpcgQB5ci5NuuYdVSp5wo66FgLuYSBjC1fYKVeIBHAXKtVisa696QZoJaXyJWqqPWVN+ggsrxBjKjQO0CQNUaoUjqhPxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoP5R3Va; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoP5R3Va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769824183; x=1801360183;
  h=date:from:to:cc:subject:message-id;
  bh=DyCkOmA2uzFhiwv/OdBBFJxggncw0n9/yIuGCieF3BY=;
  b=aoP5R3VaW5kW5KhL62qkmCcm4jnNLVRQgY4dvRQQvmT9tAw3hhQZV589
   M3nsFbJjFJMbT734HtOMQEgq8/a1g8yVQs/WMPrapiL5hGEWAKKVfLChH
   FT/X3ddFDPuog6IrHiuyMRnhMt5pEzrgBzyV7UY9QoM6uFxecGm0m7O8Q
   dB4q6q+q24obiMmP0IEn0XrdGie8KFp/DGI6TJfX7Ax9be1yktmlOmqDs
   T/ZHpQL1uZiqhauXX3xGQA55q2n16CK+kF2tfODNQmWKlTToZe1nrdpKG
   soK7LT7l+72QEjb1ylv2uxNbGN1JKwBTQBNxII+1REbaUgVZ4qA7vPpbt
   A==;
X-CSE-ConnectionGUID: X6fnT77jQJ2YUaeXbR5Pyw==
X-CSE-MsgGUID: Tg1CzDQYQS2Ufd+A32JQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88494798"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="88494798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 17:49:42 -0800
X-CSE-ConnectionGUID: X1F3wu5bRHq3BLz1ADcDUw==
X-CSE-MsgGUID: TcrXUoS7QoKS0v/qcFlR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208983139"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Jan 2026 17:49:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm07F-00000000dYK-33nu;
	Sat, 31 Jan 2026 01:49:37 +0000
Date: Sat, 31 Jan 2026 09:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Carlos Song <carlos.song@nxp.com>,
 Adrian Fluturel <fluturel.adrian@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [linux-next:master 1765/11028] ld.lld: error: undefined
 symbol: i3cdev_to_dev
Message-ID: <202601310904.DueZdiuY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
commit: 6e5f6bf2e3f036e6d7466d2a3322445729ea3356 [1765/11028] iio: magnetometer: Add mmc5633 sensor
config: arm64-randconfig-002-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310904.DueZdiuY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310904.DueZdiuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310904.DueZdiuY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i3cdev_to_dev
   >>> referenced by mmc5633.c:559 (drivers/iio/magnetometer/mmc5633.c:559)
   >>>               drivers/iio/magnetometer/mmc5633.o:(mmc5633_i3c_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: i3c_driver_register_with_owner
   >>> referenced by device.h:268 (include/linux/i3c/device.h:268)
   >>>               drivers/iio/magnetometer/mmc5633.o:(mmc5633_i3c_driver_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: i3c_driver_unregister
   >>> referenced by device.h:288 (include/linux/i3c/device.h:288)
   >>>               drivers/iio/magnetometer/mmc5633.o:(mmc5633_i3c_driver_exit) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_I3C
   Depends on [m]: I3C [=m]
   Selected by [y]:
   - MMC5633 [=y] && IIO [=y] && (I2C [=y] || I3C [=m])
   Selected by [m]:
   - AMD_SBRMI_I2C [=m] && I2C [=y] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && (I3C [=m] || !I3C [=m]) && I3C [=m]
   - INV_ICM45600_I3C [=m] && IIO [=y] && I3C [=m]
   - IIO_ST_LSM6DSX_I3C [=m] && IIO [=y] && I3C [=m] && IIO_ST_LSM6DSX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
