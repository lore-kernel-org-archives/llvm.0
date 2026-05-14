Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4775314D34;
	Thu, 14 May 2026 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765525; cv=none; b=isti7uMWHC9ijTpqibVaUfedZ2RUAXPBWWopw6wwqeQV0/zpO0+QGqMYAKhhYeKgafOJr0ei1euHM4GX0LrUld5as2be9/BznBKh1/UjQD2LsOAfEYpiz7gApgj6Lawbjldnb1K9laV4xNms0tz17OSzp4mYTclliSQj+J78Bpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765525; c=relaxed/simple;
	bh=9vjkP3SHT2epwkx1bZ9EbbspQhfuOSGQak3c0rXInfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VGVbfPJKtbjl2X3N/noCPAdEnV57lynKDmNHcYmBQriTM9ustfX0InlHYlTyniwt9NPBYP60nbEfCRUPKMMaL3k4MNgkPZSiOtjPrg9F3dkViYojXm4FXnnKTBYSJLnFBiXT7HQzvvtWM0ontSyaFO9AHTO348RoMWMVrHAGm+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgoXsg49; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgoXsg49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778765522; x=1810301522;
  h=date:from:to:cc:subject:message-id;
  bh=9vjkP3SHT2epwkx1bZ9EbbspQhfuOSGQak3c0rXInfE=;
  b=HgoXsg499nLuBSQyAF0Vd4Tc2tgCmBKvheiUoeldNqjwx36ejY0N5ukj
   BICaCrLSwpIglTc/hCoRm4CYgcgFBwAJ2C578a84TFUOJfvuxZqTHzQ5d
   GtN3xa0gUGxqqv+HNGs7pEZEVL03nz9lYJp8CQQKARr6Jz4FdbW+HIgYh
   ds985oSTLALS9BKmNUZtBLAcS89N+zBQvKSP5bg8xo9nUkgEQBipj50Sl
   xhDnSj0vqoJzbvigEvBvicNJt9Ml2dtkwnVExOxkrdUB5w/oxgO3Fqv67
   derA2pynvB8Zzfp1TkKdNIUaMbAGkH4HG/pNayPU4GIlPge+TkMWTwPn1
   A==;
X-CSE-ConnectionGUID: U6WM1dq8RFiymL3EXzqzSA==
X-CSE-MsgGUID: 5uaq2jeETKi82pNqfxKgGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79824447"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79824447"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 06:32:00 -0700
X-CSE-ConnectionGUID: cL+G1xtqS/i/Zjz3NEv5Wg==
X-CSE-MsgGUID: 8UB8TJyPT7yzx5gMrbcCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237402229"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 06:31:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNWAO-000000008oj-12RS;
	Thu, 14 May 2026 13:31:56 +0000
Date: Thu, 14 May 2026 15:31:02 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/printk/sysctl.c:11:18: warning: unused variable
 'ten_thousand'
Message-ID: <202605141518.BQGr9VpG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Murray/printk-remove-BOOT_PRINTK_DELAY/20260514-132813
head:   fa13da135c46ed95604a44c0723b4abeddd5eb7f
commit: fa13da135c46ed95604a44c0723b4abeddd5eb7f printk: remove BOOT_PRINTK_DELAY
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605141518.BQGr9VpG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141518.BQGr9VpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141518.BQGr9VpG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/sysctl.c:11:18: warning: unused variable 'ten_thousand' [-Wunused-const-variable]
      11 | static const int ten_thousand = 10000;
         |                  ^~~~~~~~~~~~
   1 warning generated.


vim +/ten_thousand +11 kernel/printk/sysctl.c

faaa357a55e034 Xiaoming Ni 2022-01-21  10  
faaa357a55e034 Xiaoming Ni 2022-01-21 @11  static const int ten_thousand = 10000;
faaa357a55e034 Xiaoming Ni 2022-01-21  12  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
