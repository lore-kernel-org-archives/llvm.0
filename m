Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E331946AA;
	Thu,  7 Aug 2025 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754560316; cv=none; b=eurCuZ8D1FcW5KgyD3GE/Urv6c66f8VPtxgEbiAkf+xuHSOti6CSWG5rPG31875SuS2dYeQSAySDIJ3o/KHx9JloGIJ/t90wTB/V2aY0BhOGgDuG5NajTO2q7XxqqAou6LbXGQeHarvxVDuIv0QiB0HNbwvdeLZhqr/xgjwp49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754560316; c=relaxed/simple;
	bh=n3H7k+qMLSbRg64OaiKFLdUftAjzYbCeTRK1xSdD7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=falzmVLh74cDbsSWSMvLTtF2aPXztPt6mMB7FHvzrmVuw2SfQl+CtUflpLKYjV/Kv+vg17lf1hX6W2sDbFIOfnlDGJnuLIT0uRU0XI/lRCx1YXZt9/r4vXDtpHKd4ff1oc7NNmFm9M9J83l9Vt3lg9qlOA5juM54RgQ//XpnCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsxCYOHM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsxCYOHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754560315; x=1786096315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3H7k+qMLSbRg64OaiKFLdUftAjzYbCeTRK1xSdD7X0=;
  b=JsxCYOHMRzDc1GWeoybbzKrURl/FXRS3oBbD4wUhyTcY/tFWqAl78WRz
   uD4G6POEbBusSw8OYNlb+UIChTznmJw3TH/1IKsOgQhho8pbSlsrRfeJM
   c6FTZlEEXsIbBLgC1aARPGx+roxPCrnyHStvtuC0pQ1aWk0RpChtH4tfr
   56KvJmq4pQfbtxpED+5GxdFcqMzkYyAUPuirJCTivgIUlbbkKpjBkbLrW
   Zi6oEd6AD+cXaiTaKeJe0t3Fg0uSuYxUgH7qPCy0Tio1hNHLrM+Sb4so4
   HlHyZtGxbYrj/2CtTXbgnmG7mKlR7n39zhT7/Rkl+Oqmmb4MwD5hUYvig
   Q==;
X-CSE-ConnectionGUID: rxwYBa6tQg2FwFB5IpKQPQ==
X-CSE-MsgGUID: /xPdH1PFT+ew+PABVs1Ljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67158210"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67158210"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 02:51:54 -0700
X-CSE-ConnectionGUID: mlOgTmNPQYeh2F53+X8PqA==
X-CSE-MsgGUID: lWtTRSKqQYqJtrrsqFfjGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164670967"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Aug 2025 02:51:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujxHq-0002eM-0K;
	Thu, 07 Aug 2025 09:51:50 +0000
Date: Thu, 7 Aug 2025 17:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/arch_timer_mmio 4/5]
 drivers/clocksource/arm_arch_timer_mmio.c:73:4: error: call to undeclared
 function 'writeq_relaxed'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202508071719.gt7HNCye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/arch_timer_mmio
head:   4b341bbc18d791b6c5a6bc373d303c4d3b35434a
commit: d094e2d0772b8f22c47c9d3e7ab908c82ade83bf [4/5] clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver
config: arm-axm55xx_defconfig (https://download.01.org/0day-ci/archive/20250807/202508071719.gt7HNCye-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071719.gt7HNCye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071719.gt7HNCye-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clocksource/arm_arch_timer_mmio.c:73:4: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                         writeq_relaxed(val, timer->base + CNTP_CVAL_LO);
         |                         ^
   drivers/clocksource/arm_arch_timer_mmio.c:84:4: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |                         writeq_relaxed(val, timer->base + CNTV_CVAL_LO);
         |                         ^
   drivers/clocksource/arm_arch_timer_mmio.c:262:54: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 72057594037927935 to 4294967295 [-Wconstant-conversion]
     262 |         clockevents_config_and_register(clk, at->rate, 0xf, CLOCKSOURCE_MASK(56));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/clocksource.h:153:32: note: expanded from macro 'CLOCKSOURCE_MASK'
     153 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:89:29: note: expanded from macro 'GENMASK_ULL'
      89 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/writeq_relaxed +73 drivers/clocksource/arm_arch_timer_mmio.c

9920c260a9b738 Marc Zyngier 2025-08-06  55  
9920c260a9b738 Marc Zyngier 2025-08-06  56  static void arch_timer_reg_write(enum arch_timer_access access,
9920c260a9b738 Marc Zyngier 2025-08-06  57  				 enum arch_timer_reg reg, u64 val,
9920c260a9b738 Marc Zyngier 2025-08-06  58  				 struct clock_event_device *clk)
9920c260a9b738 Marc Zyngier 2025-08-06  59  {
9920c260a9b738 Marc Zyngier 2025-08-06  60  	struct arch_timer *timer = evt_to_arch_timer(clk);
9920c260a9b738 Marc Zyngier 2025-08-06  61  
9920c260a9b738 Marc Zyngier 2025-08-06  62  	switch (access) {
9920c260a9b738 Marc Zyngier 2025-08-06  63  	case PHYS_ACCESS:
9920c260a9b738 Marc Zyngier 2025-08-06  64  		switch (reg) {
9920c260a9b738 Marc Zyngier 2025-08-06  65  		case ARCH_TIMER_REG_CTRL:
9920c260a9b738 Marc Zyngier 2025-08-06  66  			writel_relaxed((u32)val, timer->base + CNTP_CTL);
9920c260a9b738 Marc Zyngier 2025-08-06  67  			return;
9920c260a9b738 Marc Zyngier 2025-08-06  68  		case ARCH_TIMER_REG_CVAL:
9920c260a9b738 Marc Zyngier 2025-08-06  69  			/*
9920c260a9b738 Marc Zyngier 2025-08-06  70  			 * Not guaranteed to be atomic, so the timer
9920c260a9b738 Marc Zyngier 2025-08-06  71  			 * must be disabled at this point.
9920c260a9b738 Marc Zyngier 2025-08-06  72  			 */
9920c260a9b738 Marc Zyngier 2025-08-06 @73  			writeq_relaxed(val, timer->base + CNTP_CVAL_LO);
9920c260a9b738 Marc Zyngier 2025-08-06  74  			return;
9920c260a9b738 Marc Zyngier 2025-08-06  75  		}
9920c260a9b738 Marc Zyngier 2025-08-06  76  		break;
9920c260a9b738 Marc Zyngier 2025-08-06  77  	case VIRT_ACCESS:
9920c260a9b738 Marc Zyngier 2025-08-06  78  		switch (reg) {
9920c260a9b738 Marc Zyngier 2025-08-06  79  		case ARCH_TIMER_REG_CTRL:
9920c260a9b738 Marc Zyngier 2025-08-06  80  			writel_relaxed((u32)val, timer->base + CNTV_CTL);
9920c260a9b738 Marc Zyngier 2025-08-06  81  			return;
9920c260a9b738 Marc Zyngier 2025-08-06  82  		case ARCH_TIMER_REG_CVAL:
9920c260a9b738 Marc Zyngier 2025-08-06  83  			/* Same restriction as above */
9920c260a9b738 Marc Zyngier 2025-08-06  84  			writeq_relaxed(val, timer->base + CNTV_CVAL_LO);
9920c260a9b738 Marc Zyngier 2025-08-06  85  			return;
9920c260a9b738 Marc Zyngier 2025-08-06  86  		}
9920c260a9b738 Marc Zyngier 2025-08-06  87  		break;
9920c260a9b738 Marc Zyngier 2025-08-06  88  	}
9920c260a9b738 Marc Zyngier 2025-08-06  89  
9920c260a9b738 Marc Zyngier 2025-08-06  90  	/* Should never be here */
9920c260a9b738 Marc Zyngier 2025-08-06  91  	WARN_ON_ONCE(1);
9920c260a9b738 Marc Zyngier 2025-08-06  92  }
9920c260a9b738 Marc Zyngier 2025-08-06  93  

:::::: The code at line 73 was first introduced by commit
:::::: 9920c260a9b73875557f4b2e6c9f68685b9c07e8 clocksource/drivers/arm_arch_timer: Add standalone MMIO driver

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
