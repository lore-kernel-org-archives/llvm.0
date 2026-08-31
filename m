Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5EF3C1D62;
	Mon, 31 Aug 2026 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150147; cv=none; b=RKNEggTbT7FCA5/DFLumU2V2EMAjw73JhdgM0Qekj++h/BlV6aV9+KNFoztTW5pglD3nzoM6gtcin5yr0AmTin4PFQpTl/AZsK7E3gW5k6cqijY0NNhsViKa2XLn8/oeOCCA+jp+LrvbZbX4sMO6fftKKr0e4eMKFP+Cwi2CglA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150147; c=relaxed/simple;
	bh=wnKyq1n4yvhBG4cBtpiL2AdFKxXSvJDhhcy1WJsWZpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxP9keq+nQz7UcGN+qmKCgrN9M0RVvBICRsQwww47Jz9RIp8WtZnZBIGzGVYsrfrPbSbOYkMhB1R/N0sEM3Axx7dEEKQ49tlgCANjvSszRptCSNvZN4LI+h8tqLC05A5jFDpkaJDysJ8VrDsWg0UVGO2s7E2ZDK4vV/Tjs/EmC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDgO8let; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDgO8let"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788150144; x=1819686144;
  h=date:from:to:cc:subject:message-id;
  bh=wnKyq1n4yvhBG4cBtpiL2AdFKxXSvJDhhcy1WJsWZpA=;
  b=IDgO8letHBjsE62N9JRg9ao+NiQuECEKtZ9pAhaV+5/XDzpDb5JglY4P
   mJNur4SVbWPAA6YH+dro0otcmNnHALJUW2qkiIsNsWmkIU0pJxWs3KTw5
   8tOJ2Rku4JHiVfv2qzPicOGVxYuN/TmYn32vXuhNjBjZaD1f9FYxd6q9C
   S3UpqC3GmKMHfa6khA1FhJYB8L37+E9ged2fs2IpKUUstZteW1oSzqjgr
   EfmbReMZ3ELTZrN2xT6noCMvTtOQi6by2OgH+lRCLrDeMmKpkMkEuomcH
   yiZ3G7CJ9J8B+6bWnCjWARKbTXu5sce/BA8GFMYX0Dwf2TcT8Q3voa2nf
   Q==;
X-CSE-ConnectionGUID: vXFywN3dQVSte1/4qcxH7w==
X-CSE-MsgGUID: UAfhUqpGTum8nbzv9u0KUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99707764"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99707764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 21:22:20 -0700
X-CSE-ConnectionGUID: Ayyyr93PTZ29YV0plV0z9w==
X-CSE-MsgGUID: JsDP8x8ATzeyS+kFFkhWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="264939056"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2026 21:22:18 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0tXE-000000000OR-1vb2;
	Mon, 31 Aug 2026 04:22:16 +0000
Date: Mon, 31 Aug 2026 06:22:09 +0200
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [groeck-staging:hwmon-next 18/32]
 drivers/hwmon/hwmon.c:344:13: error: redefinition of 'is_hwmon_device'
Message-ID: <202608310650.HNAE53Na-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   6d28113b5ea75542b72d9f73ab9aaf0d0a49a104
commit: 40b20f8e6b53ea701f250fe2d3cac82e07c18468 [18/32] hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260831/202608310650.HNAE53Na-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310650.HNAE53Na-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310650.HNAE53Na-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/hwmon.c:344:13: error: redefinition of 'is_hwmon_device'
     344 | static bool is_hwmon_device(struct device *dev)
         |             ^
   drivers/hwmon/hwmon.c:321:13: note: previous definition is here
     321 | static bool is_hwmon_device(struct device *dev)
         |             ^
   1 error generated.


vim +/is_hwmon_device +344 drivers/hwmon/hwmon.c

   327	
   328	/*
   329	 * PEC support
   330	 *
   331	 * The 'pec' attribute is attached to I2C client devices. It is only provided
   332	 * if the i2c controller supports PEC.
   333	 *
   334	 * The mutex ensures that PEC configuration between i2c device and the hardware
   335	 * is consistent. Use a single mutex because attribute writes are supposed to be
   336	 * rare, and maintaining a separate mutex for each hardware monitoring device
   337	 * would add substantial complexity to the driver for little if any gain.
   338	 *
   339	 * The hardware monitoring device is identified as child of the i2c client
   340	 * device. This assumes that only a single hardware monitoring device is
   341	 * attached to an i2c client device.
   342	 */
   343	
 > 344	static bool is_hwmon_device(struct device *dev)
   345	{
   346		return is_hwmon_device(dev);
   347	}
   348	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
