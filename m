Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C643273FD;
	Sun, 23 Mar 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742726640; cv=none; b=F0fP2jaXJ2gym0o9sQ8ADvfx1xViDy+RGy/EBxUaURVujjG+Ixnfm45j03SBuYxopO4sXp+Zs+rLZN2TFDGPuWIYlMM6RGOvcgbsKmZmMvI35RJam7/AfM2vc0IUgCQYq7TcI3lnGTWjqLbYVQYACUSXFYJ36hvTXTicYBJNACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742726640; c=relaxed/simple;
	bh=56fghpzNcXcuJRMxoGiBZ6btoUwmvBYYxwm2FKh3Rbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qwsue3E1ixtRa7+M4S4D5rrhnu21rYKccIA66q7sGe2hVtEjp/ZJaQTERjy8HrDt2/N9t9IrX5ry+Pjy34J7E5KDQBzFqUQRKYy9cmuceh3N0eeT1EakYVbFQi0spFyV0XyEm3CBJF5y+wkkvJQgriy55vRA9e0rFEUhjPsAlPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCXMYm2w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCXMYm2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742726639; x=1774262639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56fghpzNcXcuJRMxoGiBZ6btoUwmvBYYxwm2FKh3Rbw=;
  b=LCXMYm2wucP8i/vy/vDMIYn4QDBkWqGfj9K9AzSQDbgZFZuqJND2uDBN
   FIjabAouno7SFLtv9IOwYRH6rLTf6YHS5Hc+mo39jnFRcwpFb3F8uEwA1
   UqHW6MPGsCISzwLqcxrJA4cMiweVZdPlXAlOfaO9NRIHXpWyhBkdpQmE+
   ypLEZAJ51EPmnZQQ0CKnApJ+KqqWOsVLADSGZynZoH5HMGqD3d7RUF5Mi
   N1x1dtJE4+m/RkyDjcG5v0Dv7At03Ew9BcIXDRkjvj3tXmg5vPhy3xWP0
   RQ9sFY+IsnGiFLY1wZXs8AVbmpUNeyjg9X750uTyIWqLA8zlTfBjmxPKZ
   g==;
X-CSE-ConnectionGUID: Mo+yhjRvSqGweXqLkcyF8w==
X-CSE-MsgGUID: Ks01B4/kT+e2t0iciyOzEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43817036"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="43817036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 03:43:58 -0700
X-CSE-ConnectionGUID: 6B7X1+YSTsa8njkp9SL7Ag==
X-CSE-MsgGUID: 5DUaBCn0TUK9zWq1dItmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="124253735"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2025 03:43:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twIo6-0002iJ-2a;
	Sun, 23 Mar 2025 10:43:54 +0000
Date: Sun, 23 Mar 2025 18:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 9/21] drivers/pwm/pwm-mediatek.c:142:34:
 error: incompatible integer to pointer conversion passing 'unsigned long' to
 parameter of type 'struct clk *'
Message-ID: <202503231837.DYHg04BB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   aecd65419533fc7a9eb88c055189d4ec4c9fbdca
commit: 38fca6d9fa6497b95c4b53427d3e83908b807cf3 [9/21] pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
config: i386-buildonly-randconfig-004-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231837.DYHg04BB-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503231837.DYHg04BB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231837.DYHg04BB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pwm/pwm-mediatek.c:142:34: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'struct clk *' [-Wint-conversion]
     142 |         do_div(resolution, clk_get_rate(clk_rate));
         |                                         ^~~~~~~~
   arch/x86/include/asm/div64.h:25:12: note: expanded from macro 'do_div'
      25 |         __base = (base);                                        \
         |                   ^~~~
   include/linux/clk.h:751:40: note: passing argument to parameter 'clk' here
     751 | unsigned long clk_get_rate(struct clk *clk);
         |                                        ^
   1 error generated.


vim +142 drivers/pwm/pwm-mediatek.c

   117	
   118	static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
   119				       int duty_ns, int period_ns)
   120	{
   121		struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
   122		u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
   123		    reg_thres = PWMTHRES;
   124		unsigned long clk_rate;
   125		u64 resolution;
   126		int ret;
   127	
   128		ret = pwm_mediatek_clk_enable(chip, pwm);
   129		if (ret < 0)
   130			return ret;
   131	
   132		clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
   133		if (!clk_rate)
   134			return -EINVAL;
   135	
   136		/* Make sure we use the bus clock and not the 26MHz clock */
   137		if (pc->soc->has_ck_26m_sel)
   138			writel(0, pc->regs + PWM_CK_26M_SEL);
   139	
   140		/* Using resolution in picosecond gets accuracy higher */
   141		resolution = (u64)NSEC_PER_SEC * 1000;
 > 142		do_div(resolution, clk_get_rate(clk_rate));
   143	
   144		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
   145		while (cnt_period > 8191) {
   146			resolution *= 2;
   147			clkdiv++;
   148			cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
   149							   resolution);
   150		}
   151	
   152		if (clkdiv > PWM_CLK_DIV_MAX) {
   153			pwm_mediatek_clk_disable(chip, pwm);
   154			dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
   155			return -EINVAL;
   156		}
   157	
   158		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
   159			/*
   160			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
   161			 * from the other PWMs on MT7623.
   162			 */
   163			reg_width = PWM45DWIDTH_FIXUP;
   164			reg_thres = PWM45THRES_FIXUP;
   165		}
   166	
   167		cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
   168		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
   169		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
   170		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
   171	
   172		pwm_mediatek_clk_disable(chip, pwm);
   173	
   174		return 0;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
