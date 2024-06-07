Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3136615A878;
	Fri,  7 Jun 2024 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717748575; cv=none; b=kjpRuOJAcOdcj0BYNRl2fkirgvQgA4Pxqe0KzojyTvly0v6NsyjjT4a7DChgWVOXzbmEcp+5oH/PawdP6sUjMfBK96Pf0kHRrsVAnjYGly2etBrVCo9/hhM+j/APDY7uT7lFYFi53JtsT5An/UKvr0RGolvzROTkX2tkTtJRIwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717748575; c=relaxed/simple;
	bh=lWPbR3v3o0Z+OC/0kvmbFkP8LFEpztRQDmSIicYZXmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OYabWmvexT9nu7mJ8/AfN191uM1e/f+3wySfoamJsPM2bsN7bUZDQVhrWsAp7FF8gf+qd5TnfDMvrKgp7azC5wQYfWRXULwAVFitGOK8rnBl/zgtJYfNxWWY0xFfmibzux/52m5aq/YEb0Ja/6f4XR+gAd3SHXgN1jTUR0LzDnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBoN+zGG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBoN+zGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717748574; x=1749284574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWPbR3v3o0Z+OC/0kvmbFkP8LFEpztRQDmSIicYZXmU=;
  b=LBoN+zGGHvip2jyQgCaXFwFRqvmtgP3I+v+rhFFh5wVZ6+fW7I6gPDSD
   LmqsBst32CEX2wktY3QbW24K9RbVCG1aXBt4pJT22pqJQlZZ5PbIWGxrX
   MbKFEUjWrFDAwv3kf4p3DXGd1hlLf7AeTP3b3ZrkVm87PMzUDLD1xveLH
   CpPUFJLjkad/45bEKAzff/Smk7JMAkMFPBV6vj/wB7WuBc2JEuAQ7XseG
   09vt/pI6CVvEjhIxzp8ZSI9rzomHm95/I2A75BQ3//FhQj/aqB0RcjL6K
   9WQmNpAfVMz0Uc7LMW0esfQ0aGIGx1Xsm0tZUi41WsqPrO2bPt0xwuW+7
   Q==;
X-CSE-ConnectionGUID: RUcqqtgSRtm584NNP3rHNQ==
X-CSE-MsgGUID: bHdl2Tm0R7uDD0G+jRX7PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14615723"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14615723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 01:22:54 -0700
X-CSE-ConnectionGUID: Pn0xOz2LTI2GEkO6ozyJ+Q==
X-CSE-MsgGUID: 2o52gF5ER7SY+w8O8ea/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="43188142"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Jun 2024 01:22:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFUs4-0004Fk-2u;
	Fri, 07 Jun 2024 08:22:49 +0000
Date: Fri, 7 Jun 2024 16:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4304/4582] drivers/hwmon/pmbus/mp2975.c:1069:34:
 warning: unused variable 'mp2975_of_match'
Message-ID: <202406071624.o81nLJmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: d62e74bcb173cab374d582014dc1183a09efd25d [4304/4582] hwmon: (pmbus/mp2975) Use i2c_get_match_data() [take 2]
config: x86_64-buildonly-randconfig-003-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071624.o81nLJmG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071624.o81nLJmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071624.o81nLJmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp2975.c:1069:34: warning: unused variable 'mp2975_of_match' [-Wunused-const-variable]
    1069 | static const struct of_device_id mp2975_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/mp2975_of_match +1069 drivers/hwmon/pmbus/mp2975.c

  1068	
> 1069	static const struct of_device_id mp2975_of_match[] = {
  1070		{.compatible = "mps,mp2971", .data = (void *)mp2971},
  1071		{.compatible = "mps,mp2973", .data = (void *)mp2973},
  1072		{.compatible = "mps,mp2975", .data = (void *)mp2975},
  1073		{}
  1074	};
  1075	MODULE_DEVICE_TABLE(of, mp2975_of_match);
  1076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
