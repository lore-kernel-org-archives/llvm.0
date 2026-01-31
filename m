Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB232BDC27;
	Sat, 31 Jan 2026 07:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769843636; cv=none; b=ODlnBt/b2ozlaIIRClRTPQ9msrSHbKjDQ9WfnXPtVNNbv7hrmCDsnGPzNbHo6qKVIv1x5mN3StkY2oXODKYx1FnPFsblHxWoHVRcgLvc/D8DgySfzuSx+etQ9ro5DdQBKC2q6qof4CR/Ce0oUMEO6tIvRHVjws9ruIqA2IEcVUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769843636; c=relaxed/simple;
	bh=4UWATXGl5/7caiuc/yJepcImFmS9tsG8Gy/OmKXfvJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jP5dxWSNdGGbvfrE1O8K9PXDVJJpdXJcBDCTwZGnzsAggCDRGeD4H21xlmb5vGjp/9MRkMeYn8A304kIWeKT2SrLOi0fEhNoesvm+rl1QSl8a/YhGtQpw9SYye6qY7paM0Y0KIfKu7rdJMXHRMmWGNMoN9Fq/Dj59guJ2eHUdAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NB7aQ3b0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NB7aQ3b0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769843635; x=1801379635;
  h=date:from:to:cc:subject:message-id;
  bh=4UWATXGl5/7caiuc/yJepcImFmS9tsG8Gy/OmKXfvJY=;
  b=NB7aQ3b05mQlhXH1mdDHSwP6qAUzDWPBA8oN1BW3CVWwtrQ65DFCQAeC
   7oRS+8f4/KvH2IUYKwfEOuKXOueiYpKNrd/7z39ztv+Hu0BQeGJ7mDpPe
   LjQbdM8+PSP5CBQi+8rKwRaypEwHAgoqpwNEzSZHsNEusq28ERKax4egn
   TSiv/yJhx74hK9a+dGwyoQ960lofeAGme90QHzOfqCNQFPu2WdUJF2GgH
   6MCoAkhEMeVQYCFo25FwGIXXihEqAVONBcD46+ZRVHv7uqQLdCcnrMvzA
   GsVq3dJYvdKgLXbm0xJVxjL1T73GqxeEbhXcT/VhU/3LlqqiXyW2847xe
   Q==;
X-CSE-ConnectionGUID: 0PArdg2LQOSIGXlkhARQVw==
X-CSE-MsgGUID: owcHxUvVQ1WLlvzzXao0bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82511219"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82511219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 23:13:54 -0800
X-CSE-ConnectionGUID: eIPBPjaSRSSL/6oYAsvzCw==
X-CSE-MsgGUID: M3e5vriIRc2rLGY+IG0QrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213974108"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2026 23:13:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm5Az-00000000dki-3dJh;
	Sat, 31 Jan 2026 07:13:49 +0000
Date: Sat, 31 Jan 2026 15:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [linux-next:master 8054/11028] ld.lld: error: undefined
 symbol: __devm_regmap_init_i3c
Message-ID: <202601311515.8OLhEuaV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
commit: e559c864146070905ce7bc6da1e9d269232d609b [8054/11028] iio: magn: mmc5633: Ensure REGMAP_I2C / I3C not build if I2C / I3C is not.
config: arm64-randconfig-002-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311515.8OLhEuaV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311515.8OLhEuaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311515.8OLhEuaV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __devm_regmap_init_i3c
   >>> referenced by mmc5633.c:567 (drivers/iio/magnetometer/mmc5633.c:567)
   >>>               drivers/iio/magnetometer/mmc5633.o:(mmc5633_i3c_probe) in archive vmlinux.a
   >>> did you mean: __devm_regmap_init_i2c
   >>> defined in: vmlinux.a(drivers/base/regmap/regmap-i2c.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
