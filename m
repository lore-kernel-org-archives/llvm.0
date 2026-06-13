Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B949387364;
	Sat, 13 Jun 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347666; cv=none; b=XKWsPlPgQPTpxytxl4yOyMpR4FzJWN0gAYvjiszqeycyHv9VvgX4HzDe9clovJNvZ16zgklwuQW1tuhrcWp5oRHGqpYWCGcH9Wbq5FlKvZMMe781PAhTAFFRHTpmpjOgXnuZGHmXuMO9J0TOLgYsEqpOlLZF6sfc5H9bd9NUKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347666; c=relaxed/simple;
	bh=BFJhmLhHzS+sY/JEBVKeNKtm08rUtBHHIKLbciAQY7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OFU+Rtwou/0RXv2Y5ieVHhDJm7ERE1mVISJZR40YO7RV9Trmf5HVvAyn2h/BqQPGZzYG738SHAxSZ7aE4Irs+68mlDNlXqKRtOyror5nRVjcue49J6IBYVAXN68W8kR5MG1Yb+W2S4dU+AcKbjzUznfAh82MOtVn43y7d857a/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUGuECiJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUGuECiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781347661; x=1812883661;
  h=date:from:to:cc:subject:message-id;
  bh=BFJhmLhHzS+sY/JEBVKeNKtm08rUtBHHIKLbciAQY7o=;
  b=PUGuECiJ1EKtBbzcRo/75HfctT2tHEOGbaTMwe2ysTIvVW7GqJKopVBS
   WFBIs8eg1CFFr5WUNx17IsQO+rFUb3o7LRpcnSHHjO02q7qJ391v0oKfK
   0xbqWYx0AAfZ0LloPnvkJbX2KBelhSrefWwQwAfm02gQJO9dnGBWFJXj1
   rVmQWJvLbBaJgd8Re1k6rew10gXJiDPqEDtDkS6WxfKhdfvXyXtJeu5RJ
   mI5eQ9a/Iv23FJeQtRwhQTWzCdzr+jtOzml1Wvx07/bR6yv0FIPgTkGpD
   PTjz9g8EVjpGuwO2296J9c0g99qqnFuiKYpyW8Fwysi9nHLzwU93Qkfp/
   A==;
X-CSE-ConnectionGUID: 9DW314yHRP2RuHMgfFH7XA==
X-CSE-MsgGUID: Nd3GiV9zRO23rhCdtosIaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86011028"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="86011028"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 03:47:40 -0700
X-CSE-ConnectionGUID: QSgRV5ZaR/etelNPIXdqAQ==
X-CSE-MsgGUID: 9yaMUvENRom4MADwp/ilGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="247104013"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2026 03:47:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYLtn-00000000Ps0-40Q7;
	Sat, 13 Jun 2026 10:47:35 +0000
Date: Sat, 13 Jun 2026 18:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-tw-mpscq-batch 12/12] ERROR: modpost:
 "blk_comp_batch_notify" [drivers/block/ublk_drv.ko] undefined!
Message-ID: <202606131854.GcMzz1Nv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-tw-mpscq-batch
head:   2ac8547b7dc705766796fc2d637f43b7048b2792
commit: 2ac8547b7dc705766796fc2d637f43b7048b2792 [12/12] ublk: open a completion batch window around batch commit processing
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606131854.GcMzz1Nv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131854.GcMzz1Nv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131854.GcMzz1Nv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "blk_comp_batch_notify" [drivers/block/ublk_drv.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
