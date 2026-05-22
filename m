Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3022F74A;
	Fri, 22 May 2026 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466643; cv=none; b=cTAYXKnW3GXg6xZtdDsngFrX+1BiNAm+SgHRP33Ne+1zCpHXHi4Oalt8fWn02wAzuwLFXlAkCTk6esphbAKxot9qliR+ZhfGUKV1L+XIZTptbqZgeY0fdf3VE8VJnS8eHe/UtIEcyNygEyt5lQalqpz7dIJrtmH7WcZbFWsKdQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466643; c=relaxed/simple;
	bh=4EN09ObEgcEbxqBD0a4wjiqZ51yD396NsQB+sGeBrA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hqqS1a+9c+yY4woZ150KSYpdrbP+KVcXoFbH9gdUtX/DwJh0Qn058yayavLD5hofdWmGJ8cezcSaAMWh6lVcSpkbxwuXMSnQMsScxmTMR1DhwNf5afI+J42qR+poEAVtdjO8x4wXh92AHgvSCbb2DiHLQt3C5gX/hMZtuXVAVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwqzS7VK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwqzS7VK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779466641; x=1811002641;
  h=date:from:to:cc:subject:message-id;
  bh=4EN09ObEgcEbxqBD0a4wjiqZ51yD396NsQB+sGeBrA4=;
  b=nwqzS7VKgKF5Bqki3fnFy3xZJvbBjbAE+59ATFJ376NnVPQdNImTli8O
   s6FIh/sKCkVXFnz9yZfp9omdj9cmc2mZSvbm+af4BoGeAfa2kePJvwx6Z
   2LcNLjJ7WmJegSiXDbDT+7Nsimp0lpWOkhDqx156KOI3N3tD6Uk7gBf7q
   iK9LAhfjTMTRy0QAPyBC2vfxYY+8IhBZxTT4/4R7oDYOdaaeJqaX9TpkI
   gixLtv45AvesTHRveep/TZaS2n7TH0SnkQmEA0+llWrfXY3xfDprx9lo4
   lfrgXV94FZO03kZCnz6Qx66cnHK7nEXDZf3vJF5nYTesq21fgmlLU0DTq
   Q==;
X-CSE-ConnectionGUID: O73tk+ojSzOf04gOmx+QMQ==
X-CSE-MsgGUID: IhjBsyReTnO2o8nn+Sdiww==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84282275"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84282275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 09:17:21 -0700
X-CSE-ConnectionGUID: XoVlKaRCS6WRMBhlh1nu+Q==
X-CSE-MsgGUID: QI3w6SBgSTyVdq/7RYErJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240122086"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 May 2026 09:17:19 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQSYm-000000002hZ-0r42;
	Fri, 22 May 2026 16:17:16 +0000
Date: Sat, 23 May 2026 00:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1042/1130]
 drivers/video/fbdev/sis/sis_main.c:1659:48: error: call to undeclared
 function 'compat_ptr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605230018.6ULvHAlC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 29215d96a50fc1e78f4341de622e393c45325bea [1042/1130] cheri: riscv: compat64: Enable compat64 in default configs
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605230018.6ULvHAlC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230018.6ULvHAlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230018.6ULvHAlC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/sis/sis_main.c:1659:48: error: call to undeclared function 'compat_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1659 |         return sisfb_ioctl(info, cmd, (user_uintptr_t)compat_ptr(arg));
         |                                                       ^
   drivers/video/fbdev/sis/sis_main.c:4547:5: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
    4547 |         u8 reg;
         |            ^
   1 warning and 1 error generated.


vim +/compat_ptr +1659 drivers/video/fbdev/sis/sis_main.c

  1654	
  1655	/* ----------- FBDev related routines for all series ---------- */
  1656	static int	sisfb_compat_ioctl(struct fb_info *info, unsigned int cmd,
  1657					   unsigned long arg)
  1658	{
> 1659		return sisfb_ioctl(info, cmd, (user_uintptr_t)compat_ptr(arg));
  1660	}
  1661	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
