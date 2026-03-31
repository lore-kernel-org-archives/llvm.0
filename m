Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6893290A1;
	Tue, 31 Mar 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956169; cv=none; b=N4sDL7KkCt5BuyVB76/la4b3ZKJlvXd7TnzK3OCsWDAr3UxspHjBWdPoyWkIiOMjIGvt9M8SUDqGg1dx4/na0otfbb40cQbDg36Y4ewqcsG+uLZHeu5lqYBIkuip83f+YtALpO7YV/znJbMUois1535FwG4XPxPLzO7i7miYON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956169; c=relaxed/simple;
	bh=j0QLhq23iBwDgCuWN2xN3U3wN7btOwQEVxK6wwS5TKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pdlt+W5v24NBF4yj4KR/r0T4ZHEBjj331RN7Y2Ret6x5qEd+bHN/1bV38Xz3wZGAL9thxrqiy/4M91aAon2gmHAKcMwAZg0ZPfn4/28QNMGEG9PMZqIZb9x3lHbrb2CwfpBG3bzC1H/cGX6i7A9ZZiTy3uzGuS7ZkrwD+OXgxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkOq9b9m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkOq9b9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774956169; x=1806492169;
  h=date:from:to:cc:subject:message-id;
  bh=j0QLhq23iBwDgCuWN2xN3U3wN7btOwQEVxK6wwS5TKA=;
  b=QkOq9b9m1MNz1apxVY7TNBuzcua5HvDHdupUazB/NnnYoVwvr6NsPlr5
   mZ7UgVzZwziUFA1MYBAWd8PNPETWlXvLJ1bpKU5eR7jc5blUwZNDhh2be
   bOltUcK2d3Nb4md2Mv6lOXzNrWP3j9/IVPRH+mx8SFQX3hWpgiY/aBwlR
   Mv0kueNYEZ0c+qH1KZIw2faIQaLiNfXxMHKfBSCQ36CNnn/nD5aoNCEhs
   D4mYhr8p8TGUMsPZOBDLUv8H/KkEmK+9A1HWkFV1bajDxfDd6qGiZuRoC
   T3kCe5UtXyEIE8xLDmz2IF/4CO1lohqXpZzeI5PyMpbDSRdXPZpII5tTi
   g==;
X-CSE-ConnectionGUID: 5xTHsHL9TuCSztMR4rdrNQ==
X-CSE-MsgGUID: X7yw+1xdTkmhwXJVFFjyRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76157636"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76157636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:22:48 -0700
X-CSE-ConnectionGUID: qClb18sES+GGtgsAHc9rzg==
X-CSE-MsgGUID: eoYMF8g7R+ST9X5SQFtt1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225333339"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Mar 2026 04:22:45 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7XBC-000000002ZD-1mAw;
	Tue, 31 Mar 2026 11:22:42 +0000
Date: Tue, 31 Mar 2026 19:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "Alexandru-Catalin Ionita" <alexandru-catalin.ionita@nxp.com>,
 Ciprian Costea <ciprianmarian.costea@nxp.com>,
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: ld.lld: error: undefined symbol: __bad_ndelay
Message-ID: <202603311958.ly6uROit-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 4434072a893e4864519c167947083ff3e4cc2d95 iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms
date:   3 months ago
config: x86_64-buildonly-randconfig-001-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311958.ly6uROit-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311958.ly6uROit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311958.ly6uROit-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bad_ndelay
   >>> referenced by delay.h:78 (include/asm-generic/delay.h:78)
   >>>               vmlinux.o:(nxp_sar_adc_probe)
   >>> referenced by delay.h:78 (include/asm-generic/delay.h:78)
   >>>               vmlinux.o:(nxp_sar_adc_read_raw)
   >>> referenced by delay.h:78 (include/asm-generic/delay.h:78)
   >>>               vmlinux.o:(nxp_sar_adc_read_raw)
   >>> referenced 2 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
