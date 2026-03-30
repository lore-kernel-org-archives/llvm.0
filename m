Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1F3BB48;
	Mon, 30 Mar 2026 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774829115; cv=none; b=qRsPYzzJQBeEux2QBhvtqJI+2n/NsOg1Z3u0CyFh32e4gjr+Tgf8di5Eq+5xgfG/IaDCwV0ijrkjv/Njk7oyw481eh4SFRj//anCfZIgjpf+8RvAUMg46aT0HefCROOOalok33ONpCg6dzJC5kI0jglvl9s9OJ2dKlXDdjigt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774829115; c=relaxed/simple;
	bh=sUQLoBfVD9vcQ4IFL/MMTJNIERNhvtcggYR/k7zQS8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hOMvihsHSn4rf1UO7yfAdvUnOY1fgCkxBId3NiHSz317xQREjjNkGZhNn1RAYpZJFBsgXNuY2y9P5pEobFStwRYxYrs1UGGrLOgZ1A3qsIORvcH1HE1YclV5fNmqWJyVYZHJjtAnCVoMZ7y9HMfC59TjJL9Gw7hcxPoYTSO6I/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRwzMGLt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRwzMGLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774829113; x=1806365113;
  h=date:from:to:cc:subject:message-id;
  bh=sUQLoBfVD9vcQ4IFL/MMTJNIERNhvtcggYR/k7zQS8A=;
  b=eRwzMGLtvn1PwKhL+JEi6H6dsI5ZWJu1errMRPdHg5fkNnn8tYu7gePo
   4AwWaAkXhum2i+FgUKUOM/pl+HRZ3nRH4rsK/r5t0Grv6OrIWvPRNvuTO
   LMgZ0Gl/QKWog5u0JAzAv42FUIjYY7MeFXFSardZjpj3IPjXooMOm/HeX
   wdu/NrXYQ9jtXc76UcvMC81tjBo2H6zjUIbYY8b1uaOj1KY+0raMXtvKg
   65VmW54Vv5zyrgaoiHTEq/2CtsSeVw282rASTKdxOzfUbSiSWafN6hdvT
   BIsxFL1M1JASvAukjiETemLWOhjVfsjmCuuQ74MAExDnQZ/L9SLeaokFJ
   A==;
X-CSE-ConnectionGUID: 5UJK2oH1QtiDywytComgnQ==
X-CSE-MsgGUID: upmEpmGFTJues4d+oIlfkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75705461"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75705461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 17:05:09 -0700
X-CSE-ConnectionGUID: VQtHRkwIQOeG+dIrWaOfrQ==
X-CSE-MsgGUID: MFiQ0c6eQL+3J2g/mI523g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="256395424"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Mar 2026 17:05:07 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w707s-000000000Pt-2E0i;
	Mon, 30 Mar 2026 00:05:04 +0000
Date: Mon, 30 Mar 2026 08:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: [tip:irq/drivers 5/41]
 drivers/irqchip/irq-pic32-evic.c:54:15: warning: variable
 'board_bind_eic_interrupt' set but not used
Message-ID: <202603300715.4HuMMAFb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   9fd2170d70178faa0427adaa9d2dfdbfa231d1b7
commit: 4b52df1b4e1d9cf4cb5a8e1b5287d1e3d1a6aa0c [5/41] irqchip/irq-pic32-evic: Allow driver to be compiled with COMPILE_TEST
config: arm-randconfig-002-20260330 (https://download.01.org/0day-ci/archive/20260330/202603300715.4HuMMAFb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300715.4HuMMAFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300715.4HuMMAFb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-pic32-evic.c:54:15: warning: variable 'board_bind_eic_interrupt' set but not used [-Wunused-but-set-global]
      54 | static void (*board_bind_eic_interrupt)(int irq, int regset);
         |               ^
   1 warning generated.


vim +/board_bind_eic_interrupt +54 drivers/irqchip/irq-pic32-evic.c

aaa8666ada780e8 Cristian Birsan 2016-01-13  44  
15f9b251fe40499 Brian Masney    2026-02-22  45  #ifdef CONFIG_MIPS
aaa8666ada780e8 Cristian Birsan 2016-01-13  46  asmlinkage void __weak plat_irq_dispatch(void)
aaa8666ada780e8 Cristian Birsan 2016-01-13  47  {
1fee9db9b42d821 Marc Zyngier    2021-07-06  48  	unsigned int hwirq;
aaa8666ada780e8 Cristian Birsan 2016-01-13  49  
aaa8666ada780e8 Cristian Birsan 2016-01-13  50  	hwirq = readl(evic_base + REG_INTSTAT) & 0xFF;
1fee9db9b42d821 Marc Zyngier    2021-07-06  51  	do_domain_IRQ(evic_irq_domain, hwirq);
aaa8666ada780e8 Cristian Birsan 2016-01-13  52  }
282f8b547d51d8a Brian Masney    2026-02-22  53  #else
282f8b547d51d8a Brian Masney    2026-02-22 @54  static void (*board_bind_eic_interrupt)(int irq, int regset);
15f9b251fe40499 Brian Masney    2026-02-22  55  #endif
aaa8666ada780e8 Cristian Birsan 2016-01-13  56  

:::::: The code at line 54 was first introduced by commit
:::::: 282f8b547d51d8a33b9230ba58e2324babe0a96a irqchip/irq-pic32-evic: Define board_bind_eic_interrupt for !MIPS builds

:::::: TO: Brian Masney <bmasney@redhat.com>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
