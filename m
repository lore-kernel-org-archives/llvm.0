Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454BF146D58;
	Sun, 31 Mar 2024 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711911652; cv=none; b=QVuS72QWLaJClasstTNwOc6WXUal2Ydo0okQbipDJ7QZpRsJ0AT72wwM3ymwtfc4FJNWbe8gIb8RLq272g/xVzpWEDoDuvxlwDL/Jqte6mTHJhKoRwzkdmOtqMO/QP2FtnX5TaN7+d4bdxjI8j3BdWK2RcUllFMEAYtVj+ekuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711911652; c=relaxed/simple;
	bh=3/Qyh86UEltAhyqxq/IVUDUwxSUMGGmcaaSg6AHN1Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JN9UppDTUntOAOsVlwIgJNyER86HKMceZCNIK6+e4t9yu3WUq0C/Qm9rHvY/4fLKYW8KFS0LKfzm6RL+u97F2NHHfjEygqjpyYwwxKTzJMNgDuQGtjBgEadzXIaEHrBaYMwD+WN9+2ucE6fcjS0TC3jyoVKMqaK6lNUHYE0rrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jE1DOdu7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jE1DOdu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711911639; x=1743447639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/Qyh86UEltAhyqxq/IVUDUwxSUMGGmcaaSg6AHN1Wc=;
  b=jE1DOdu7+J4ynQzkOr0ZXqB2XfY4JwRufyH9LInlccrP75zC7v5ispJ1
   vUH0/mXtBvw/yY038PjIuDYE2f2QpEh8gZzeC1Ad7baHzmToOMQlobtOI
   ZC0JvzNp98eG91+h+NHs8z1pxGDqJ59kZdJC9zWDvnAGtdlX5Q6fPNkca
   BpFNrNkw/2mNHwEffEsHGRm+vi4ERwzaE+YrdvmKtYaMhcgOXmGPYp1Lr
   ZYW9h0Sl3uFniY/iUgVLoXLfFxmQR8oQlkHOVrUPFIJ5F5P3cJx7/Tk6K
   VaSH+lsjfSlrZckgDGnfl8DOEOWqDSf1nvSWNpm3R4/M6iKttCNqHiLKy
   Q==;
X-CSE-ConnectionGUID: wuTgbnuvSG6YrHxf/uV8ww==
X-CSE-MsgGUID: a0Ezbt+RSR6mTHpdgDgAGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="18189302"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="18189302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 12:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="21999539"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2024 12:00:37 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr0Pz-0001MQ-0E;
	Sun, 31 Mar 2024 19:00:35 +0000
Date: Mon, 1 Apr 2024 03:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm/for-nexxt 26/26] drivers/pwm/pwm-apple.c:125:8: error:
 call to undeclared function 'devm_clk_rate_exclusive_get'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202404010249.YO0QV41t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-nexxt
head:   0bac6aced1c550ec9628e0fa5d98036c6cbc51b4
commit: 0bac6aced1c550ec9628e0fa5d98036c6cbc51b4 [26/26] WIP: pwm: Fix clk rate using clk_rate_exclusive_get()
config: hexagon-randconfig-002-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010249.YO0QV41t-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010249.YO0QV41t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010249.YO0QV41t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-apple.c:19:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-apple.c:19:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-apple.c:19:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pwm/pwm-apple.c:125:8: error: call to undeclared function 'devm_clk_rate_exclusive_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     125 |         ret = devm_clk_rate_exclusive_get(&pdev->dev, clk);
         |               ^
   drivers/pwm/pwm-apple.c:125:8: note: did you mean 'clk_rate_exclusive_get'?
   include/linux/clk.h:284:19: note: 'clk_rate_exclusive_get' declared here
     284 | static inline int clk_rate_exclusive_get(struct clk *clk)
         |                   ^
   6 warnings and 1 error generated.


vim +/devm_clk_rate_exclusive_get +125 drivers/pwm/pwm-apple.c

   102	
   103	static int apple_pwm_probe(struct platform_device *pdev)
   104	{
   105		struct pwm_chip *chip;
   106		struct apple_pwm *fpwm;
   107		struct clk *clk;
   108		int ret;
   109	
   110		chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*fpwm));
   111		if (IS_ERR(chip))
   112			return PTR_ERR(chip);
   113	
   114		fpwm = to_apple_pwm(chip);
   115	
   116		fpwm->base = devm_platform_ioremap_resource(pdev, 0);
   117		if (IS_ERR(fpwm->base))
   118			return PTR_ERR(fpwm->base);
   119	
   120		clk = devm_clk_get_enabled(&pdev->dev, NULL);
   121		if (IS_ERR(clk))
   122			return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get the clock");
   123	
   124		/* Ensure that clk doesn't change behind our back */
 > 125		ret = devm_clk_rate_exclusive_get(&pdev->dev, clk);
   126		if (ret)
   127			return dev_err_probe(&pdev->dev, ret,
   128					     "unable to lock clock rate");
   129	
   130		/*
   131		 * Uses the 24MHz system clock on all existing devices, can only
   132		 * happen if the device tree is broken
   133		 *
   134		 * This check is done to prevent an overflow in .apply
   135		 */
   136		fpwm->clkrate = clk_get_rate(clk);
   137		if (fpwm->clkrate > NSEC_PER_SEC)
   138			return dev_err_probe(&pdev->dev, -EINVAL, "pwm clock out of range");
   139	
   140		chip->ops = &apple_pwm_ops;
   141	
   142		ret = devm_pwmchip_add(&pdev->dev, chip);
   143		if (ret < 0)
   144			return dev_err_probe(&pdev->dev, ret, "unable to add pwm chip");
   145	
   146		return 0;
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
