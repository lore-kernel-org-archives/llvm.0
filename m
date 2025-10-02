Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71087156230;
	Thu,  2 Oct 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418662; cv=none; b=ZbETnRzB/yXncMX/zqCobPxfzyWFShL9VoFcBMHfBNf2i/NPXOSIjMTFtMh/eyx/RNFRd8MA/CSSsKT86PmKMHYn22+ocXH7QbENgJiCvg6UwiIkSh9KYaNejLDeylmJJf4mc5ygdjLwNMGJtdvLO1kmBA+Wlx492cuhAeljyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418662; c=relaxed/simple;
	bh=KTW3ZnSUOwjzPpITRy4BCvcebORZReQ0eliDIO1mQvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYy4LQ0G8YCiipQ9PCc+e4xkUcTa7McZMoOknVitWPtGcI1YExs01sLIJnoijtaKPLbllQYu5OxkMGlNz4sw/jANrG+iIUer2jMtMfJr+3J3jfUXLnmIz+OGuqyItq2mymgE7QP3lxmt8R6z18Du0gJZVuud16Ppii1FiuDFrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzYh/Cet; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzYh/Cet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759418661; x=1790954661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTW3ZnSUOwjzPpITRy4BCvcebORZReQ0eliDIO1mQvA=;
  b=dzYh/CetM8Cj5WOrlz1NZgE1wlYak7U6SKArnzA6qeS0P12ipZ/zjRDv
   ozmXmwgXdoDkb3+ZOHm+PSERawkqba4YxEETyP72IcLKhBvXkipOCl3I2
   hC5nmyS4Q9tVb7sfFXfpAf4gEWZczMRRLTvXDG6TKGaVLz+Yhrtij273i
   MqH1pYzbO5ODLld3NjVf/0R6wJtxcVNQkLr26wTH/3geuNG9Y8kR/i+W2
   oj9D0n1lYtm8pPu3I9qSnNYRB0WhhXKsDU1QSdCBnXtN6WOVo5f5O7fVd
   YDNJaW7jJlhOjyvN58E3ltjJhW2h37a8aLOpovv6hUbApFiu2vSQcmCGB
   A==;
X-CSE-ConnectionGUID: zlsd5rN9QjWbdR4M+q2LKA==
X-CSE-MsgGUID: pX2cXbOGRPmJ+6nE/MD7pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61415847"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="61415847"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:24:20 -0700
X-CSE-ConnectionGUID: HUFcQhV0RjeDEAWhH/N+xg==
X-CSE-MsgGUID: 1WEBNXCWQSCY/YEeOP3HfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="210029743"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2025 08:24:19 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4LAG-0003tT-16;
	Thu, 02 Oct 2025 15:24:16 +0000
Date: Thu, 2 Oct 2025 23:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu-fwspec 4/14] drivers/iommu/riscv/iommu.c:1483:29:
 error: redefinition of 'iommu' with a different type: 'struct
 riscv_iommu_device *' vs 'struct iommu_device *'
Message-ID: <202510022323.BvXzi3Uv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu-fwspec
head:   670b33a8cfd32984040c12e995134b9cb4cdf0a5
commit: db8ec1fd99f998cb3daefa01d8eadffbbb9aa439 [4/14] iommu/riscv: Use probe_device_fwspec()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251002/202510022323.BvXzi3Uv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510022323.BvXzi3Uv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510022323.BvXzi3Uv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/riscv/iommu.c:1483:29: error: redefinition of 'iommu' with a different type: 'struct riscv_iommu_device *' vs 'struct iommu_device *'
    1483 |         struct riscv_iommu_device *iommu =
         |                                    ^
   drivers/iommu/riscv/iommu.c:1479:65: note: previous definition is here
    1479 | static int riscv_iommu_probe_device_fwspec(struct iommu_device *iommu,
         |                                                                 ^
>> drivers/iommu/riscv/iommu.c:1484:44: error: no member named 'iommu' in 'struct iommu_device'
    1484 |                 container_of(iommu, struct iommu_device, iommu);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/container_of.h:21:49: note: expanded from macro 'container_of'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      22 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:507:74: note: expanded from macro '__same_type'
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/iommu/riscv/iommu.c:1484:3: error: no member named 'iommu' in 'iommu_device'
    1484 |                 container_of(iommu, struct iommu_device, iommu);
         |                 ^                                        ~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/iommu/riscv/iommu.c:1494:13: error: no member named 'ddt_mode' in 'struct iommu_device'
    1494 |         if (iommu->ddt_mode <= RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
         |             ~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1505:13: error: no member named 'caps' in 'struct iommu_device'
    1505 |         if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
         |             ~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1508:27: error: incompatible pointer types passing 'struct iommu_device *' to parameter of type 'struct riscv_iommu_device *' [-Wincompatible-pointer-types]
    1508 |                 dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
         |                                         ^~~~~
   drivers/iommu/riscv/iommu.c:561:77: note: passing argument to parameter 'iommu' here
     561 | static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
         |                                                                             ^
   6 errors generated.


vim +1483 drivers/iommu/riscv/iommu.c

  1478	
  1479	static int riscv_iommu_probe_device_fwspec(struct iommu_device *iommu,
  1480						   struct device *dev)
  1481	{
  1482		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> 1483		struct riscv_iommu_device *iommu =
> 1484			container_of(iommu, struct iommu_device, iommu);
  1485		struct riscv_iommu_info *info;
  1486		struct riscv_iommu_dc *dc;
  1487		u64 tc;
  1488		int i;
  1489	
  1490		/*
  1491		 * IOMMU hardware operating in fail-over BARE mode will provide
  1492		 * identity translation for all connected devices anyway...
  1493		 */
> 1494		if (iommu->ddt_mode <= RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
  1495			return -ENODEV;
  1496	
  1497		info = kzalloc(sizeof(*info), GFP_KERNEL);
  1498		if (!info)
  1499			return -ENOMEM;
  1500		/*
  1501		 * Allocate and pre-configure device context entries in
  1502		 * the device directory. Do not mark the context valid yet.
  1503		 */
  1504		tc = 0;
> 1505		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
  1506			tc |= RISCV_IOMMU_DC_TC_SADE;
  1507		for (i = 0; i < fwspec->num_ids; i++) {
> 1508			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
  1509			if (!dc) {
  1510				kfree(info);
  1511				return -ENODEV;
  1512			}
  1513			if (READ_ONCE(dc->tc) & RISCV_IOMMU_DC_TC_V)
  1514				dev_warn(dev, "already attached to IOMMU device directory\n");
  1515			WRITE_ONCE(dc->tc, tc);
  1516		}
  1517	
  1518		dev_iommu_priv_set(dev, info);
  1519	
  1520		return 0;
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
