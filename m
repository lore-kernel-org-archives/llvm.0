Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C121ABB6;
	Fri,  7 Mar 2025 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358672; cv=none; b=lWtQh63Bhlq+d4NvBdjCyz5hba3AJNNbe45JVW1yZ62aXqhp1gxeFIuoPvfE+Y0ibkJs632D6isURgTse6TPoiZVt4c7Onr2VBged1fvPaSgmiyIFg3DU8CUDUSnYU6m0B9q7K3ilrUgr3cbNIlOCQt/nraCy0ktGkJx0HGrpVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358672; c=relaxed/simple;
	bh=Pon7ODoTxoNcce+huTwStkjHq3PDpXylw4w//cwIeD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JeL47lW1uCbSiKfmJ/46j+Qh/ojahGpujhpaCbnkh78o9nXJMYKztihXq6p4Bz/ntpg5oL3HnXaVjhzD9eemfgQ/A+g6fNLETn5xcL22wkhW3Vppli8C2fDeqBMsPjxR3En9YHvZhz9Ye7/dWaZ+cGlRe26M4w4+pqRE8RYcp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQGhKsw7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQGhKsw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741358671; x=1772894671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pon7ODoTxoNcce+huTwStkjHq3PDpXylw4w//cwIeD8=;
  b=cQGhKsw75Dbk/r6OKbgeloAKirxNJdSg42w+AG4YzfB/W6/87Xgp7wAQ
   Z+i0CfWCQWJDnvKopsJr2TunhXuxbIroSqnT8XwyUsEImifetzvp2wjcR
   MdLe6rKpdgE+zZxxQBHi6P7hoIRpF45d/baMEU+a2/l1PWcOO2D6DooOw
   EJkA7+qOMCnu7P6kP8+d8Pd740Fa+pkUnEJTAZlkLE5qq10AJ2eW8PDyS
   Ccn77ATnFVwbaQk+vK8oQandI8zfdFzmKr3g+ARbWWrI535eLzyzFIL/X
   YO5IV/f7krbDmA8vMNc9cY1INY0w3ebIzxLDoa7IwBvmNAuPLJ3ZigUom
   Q==;
X-CSE-ConnectionGUID: mrDo2d6eTtyOvEGRnHyyqg==
X-CSE-MsgGUID: AOCTn587RxGnSjmUwYHoOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42264043"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42264043"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 06:44:30 -0800
X-CSE-ConnectionGUID: c61mI4LvTHKcqlSC0VSPkw==
X-CSE-MsgGUID: gmtHIQ2iSsCTBgUtbNH+3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="142571818"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2025 06:44:29 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqYvz-0000aX-0i;
	Fri, 07 Mar 2025 14:44:21 +0000
Date: Fri, 7 Mar 2025 22:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 9380/9634] drivers/rtc/rtc-pl031.c:87: warning:
 Excess struct member 'range_maximum' description in 'pl031_vendor_data'
Message-ID: <202503072239.fEPJgP3W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 6571ef7dc9cfcf04fb858b54c15c1b645d7b2bc6 [9380/9634] rtc: pl031: document struct pl031_vendor_data members
config: arm-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072239.fEPJgP3W-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072239.fEPJgP3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072239.fEPJgP3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-pl031.c:87: warning: Function parameter or struct member 'range_max' not described in 'pl031_vendor_data'
>> drivers/rtc/rtc-pl031.c:87: warning: Excess struct member 'range_maximum' description in 'pl031_vendor_data'


vim +87 drivers/rtc/rtc-pl031.c

8ae6e163c1b637e Deepak Saxena     2006-06-25  68  
aff05ed5d103524 Linus Walleij     2012-07-30  69  /**
aff05ed5d103524 Linus Walleij     2012-07-30  70   * struct pl031_vendor_data - per-vendor variations
aff05ed5d103524 Linus Walleij     2012-07-30  71   * @ops: the vendor-specific operations used on this silicon version
1bb457fc9268bb7 Linus Walleij     2012-07-30  72   * @clockwatch: if this is an ST Microelectronics silicon version with a
1bb457fc9268bb7 Linus Walleij     2012-07-30  73   *	clockwatch function
1bb457fc9268bb7 Linus Walleij     2012-07-30  74   * @st_weekday: if this is an ST Microelectronics silicon version that need
1bb457fc9268bb7 Linus Walleij     2012-07-30  75   *	the weekday fix
559a6fc0508392a Mattias Wallin    2012-07-30  76   * @irqflags: special IRQ flags per variant
6571ef7dc9cfcf0 Alexandre Belloni 2025-03-05  77   * @range_min: minimum date/time supported by the RTC
6571ef7dc9cfcf0 Alexandre Belloni 2025-03-05  78   * @range_maximum: maximum date/time supported by the RTC
aff05ed5d103524 Linus Walleij     2012-07-30  79   */
aff05ed5d103524 Linus Walleij     2012-07-30  80  struct pl031_vendor_data {
aff05ed5d103524 Linus Walleij     2012-07-30  81  	struct rtc_class_ops ops;
1bb457fc9268bb7 Linus Walleij     2012-07-30  82  	bool clockwatch;
1bb457fc9268bb7 Linus Walleij     2012-07-30  83  	bool st_weekday;
559a6fc0508392a Mattias Wallin    2012-07-30  84  	unsigned long irqflags;
03f2a0e45f395bc Alexandre Belloni 2020-03-06  85  	time64_t range_min;
03f2a0e45f395bc Alexandre Belloni 2020-03-06  86  	timeu64_t range_max;
aff05ed5d103524 Linus Walleij     2012-07-30 @87  };
aff05ed5d103524 Linus Walleij     2012-07-30  88  

:::::: The code at line 87 was first introduced by commit
:::::: aff05ed5d103524bd69bd9d7b621c5c8a6c63198 rtc: pl031: encapsulate per-vendor ops

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
