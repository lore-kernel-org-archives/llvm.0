Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417F356747;
	Sun,  4 Oct 2026 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791102962; cv=none; b=VYi0KD1H03paFzDF/XomLBC0bk+K2OdAIvyj/P7utGv3kfokQS+rRr2C5ZqmganmI+8Q3vGyjvcIr/ZWTnVDJk4B1UEpI3eiJPhtiTH7hEbYdlYS4YqtPPUVJKvkKgZAWT2EO4ImIPKYAzGCHw7ILh8RMcUNUQKOgrFEEVtyPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791102962; c=relaxed/simple;
	bh=eXm++8lOqx6oRdsFzA8PTSq9wNGXBZ7+/BOjaOGbCqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pHEfWViBwPsYeR6RRHXgLkZnybtTUXndkLsYmSmpczI6cx5iTJdVySGCFeEMLwRIPSZPeDoyD08BNtozpgxm5bqlZc3zhQjYDgjeDu2UseV3jr/cEYt0ofr6pmWlS+6OLz4uQhAMRbjVSAl7WnFjChhH858M4obrMaZSjyU4TPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMhxIAIC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMhxIAIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791102960; x=1822638960;
  h=date:from:to:cc:subject:message-id;
  bh=eXm++8lOqx6oRdsFzA8PTSq9wNGXBZ7+/BOjaOGbCqI=;
  b=jMhxIAIC2J0sdNT5nVtBJtfQHP6o9LrvcRbEIRgycEebW1M+1e8sHK4r
   WLDGKHKRleBbTh27eaN81jdjxaa7PcvTg0G6cG5vtvdTkZh7HI5kdN7ym
   7x2hvhtd9f+r2WA6tlZoyOvvjnEhEyQ3Tj1CedW8bl3KEnyhsGQdczgb0
   bO6fthORyVssmTaOmrhFUpDh/dMo7/VE3jspPG/CLL6QQWvv6GCow7KA8
   YLQHmr3CpXucHJeaZAqSleAo9na85Dst15EOgA4FuWvJZlhnsMEMR9ctb
   KthYb18w7mLx5BfNsJla9u9JWlBzagPw62Po2P8CDAoXMwqCt8GDmGp++
   A==;
X-CSE-ConnectionGUID: uDQwqR+YTt2ADAdWZa7iBw==
X-CSE-MsgGUID: YY6qlZl6QHqs4eGowQn1Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109290040"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="109290040"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:35:59 -0700
X-CSE-ConnectionGUID: NbeGxD+0SxODxNql2awPKQ==
X-CSE-MsgGUID: ikXmrnoCSS6iOFd7scejcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="657579"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 04 Oct 2026 01:35:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDHhL-00000000Ubp-3EjU;
	Sun, 04 Oct 2026 08:35:55 +0000
Date: Sun, 04 Oct 2026 16:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:r64-bench 14/14] ERROR: modpost:
 drivers/pps/clients/pps-gpio.ko: symbol 'arch_timer_inline_read_pct'
 undefined!
Message-ID: <202610041637.RuSOiub3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux r64-bench
head:   51a9948e6ac20d8b60df0f50408133c864a66b8b
commit: 51a9948e6ac20d8b60df0f50408133c864a66b8b [14/14] [TEST HACKS] bench instrumentation for R64 PPS soak
config: arm64-randconfig-1000-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041637.RuSOiub3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041637.RuSOiub3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041637.RuSOiub3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/pps/clients/pps-gpio.ko: symbol 'arch_timer_inline_read_pct' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
