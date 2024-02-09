Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7582F6F06C;
	Fri,  9 Feb 2024 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707495335; cv=none; b=YilakU4oSVpBRuTXcEFN+TthbWx5gFPQcc9MBfK4mkuS1Pau7el7rHICGMXaYzLBiTM6tQbtbzz6OoZHJ2Lfi5qljaG1V87TKRXhksmumqsVS3sNr1Cnrz62K8YrdMQwzycjiUrm8G6RwIeL2qkMTEo5xlBlSe9DFg5i1fyn7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707495335; c=relaxed/simple;
	bh=r11DU+XTmPt95MYxRQJdklSHxLcf2Kzval2EIkxhmIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mt+xhFyGX5UewUhkNDnmpFxHqBpbkWm1QeUgMq/p6iCcy+5y9CQ1p9g9mLdrZo7LLsibcJqKBBQSXtsYx1vq2qj7i+UfPgKMB+VfdGOWxJxdudPm0gSVSyKCDcdonVenqs1wupDvfDBsnTrl7z7PgvmK44KkyFF3QUhD6sKHYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mES36W/5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mES36W/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707495334; x=1739031334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r11DU+XTmPt95MYxRQJdklSHxLcf2Kzval2EIkxhmIQ=;
  b=mES36W/5FgMAmd0T3S3bAlaNx/xiVn2jbxi26IFm88ORRi/qYylnX16H
   5NoanyVH6qEr68/r35UzWSwo/PFXN6Vlb9NkVgfcbxn20H4t7l872E57L
   YgouWzcmmbtIdchuo0chSQ0I2pxTIqXGomAfhfqBc6/ZzdyZYS/SRgFMj
   Cyhc+/sU8jzVG9maq2TEGxzoK1Z32b4v0pLb0+SV0FLNNl8U7skZ/3QaT
   fcSmnJXzWgZp3JKH6a4FSeI2EjXnXzJCzYKhAZrYNRkwVvs0DDMqqJTsK
   khZUMOHOCq5XT3c4TY6OG50J/RZ7jYuBYY2EMayPbysfJFZbDNJ3nj1mP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1589340"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1589340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 08:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6619784"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2024 08:15:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYTXF-0004sw-0u;
	Fri, 09 Feb 2024 16:15:29 +0000
Date: Sat, 10 Feb 2024 00:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm-lifetime-tracking 83/148]
 drivers/pwm/pwm-rz-mtu3.c:82: warning: Excess struct member 'chip'
 description in 'rz_mtu3_pwm_chip'
Message-ID: <202402100028.vCE2IzC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm-lifetime-tracking
head:   f10ff6c7e1f341afe7f15a1f5f53379a0752bcb0
commit: 83b56e4776beceee8834fa082c64988bacd4d203 [83/148] pwm: rz-mtu3: Make use of devm_pwmchip_alloc() function
config: x86_64-buildonly-randconfig-001-20240208 (https://download.01.org/0day-ci/archive/20240210/202402100028.vCE2IzC1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100028.vCE2IzC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100028.vCE2IzC1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-rz-mtu3.c:82: warning: Excess struct member 'chip' description in 'rz_mtu3_pwm_chip'


vim +82 drivers/pwm/pwm-rz-mtu3.c

254d3a727421cc Biju Das 2023-06-02  60  
254d3a727421cc Biju Das 2023-06-02  61  /**
254d3a727421cc Biju Das 2023-06-02  62   * struct rz_mtu3_pwm_chip - MTU3 pwm private data
254d3a727421cc Biju Das 2023-06-02  63   *
254d3a727421cc Biju Das 2023-06-02  64   * @chip: MTU3 pwm chip data
254d3a727421cc Biju Das 2023-06-02  65   * @clk: MTU3 module clock
254d3a727421cc Biju Das 2023-06-02  66   * @lock: Lock to prevent concurrent access for usage count
254d3a727421cc Biju Das 2023-06-02  67   * @rate: MTU3 clock rate
254d3a727421cc Biju Das 2023-06-02  68   * @user_count: MTU3 usage count
254d3a727421cc Biju Das 2023-06-02  69   * @enable_count: MTU3 enable count
254d3a727421cc Biju Das 2023-06-02  70   * @prescale: MTU3 prescale
254d3a727421cc Biju Das 2023-06-02  71   * @channel_data: MTU3 pwm channel data
254d3a727421cc Biju Das 2023-06-02  72   */
254d3a727421cc Biju Das 2023-06-02  73  
254d3a727421cc Biju Das 2023-06-02  74  struct rz_mtu3_pwm_chip {
254d3a727421cc Biju Das 2023-06-02  75  	struct clk *clk;
254d3a727421cc Biju Das 2023-06-02  76  	struct mutex lock;
254d3a727421cc Biju Das 2023-06-02  77  	unsigned long rate;
254d3a727421cc Biju Das 2023-06-02  78  	u32 user_count[RZ_MTU3_MAX_HW_CHANNELS];
254d3a727421cc Biju Das 2023-06-02  79  	u32 enable_count[RZ_MTU3_MAX_HW_CHANNELS];
254d3a727421cc Biju Das 2023-06-02  80  	u8 prescale[RZ_MTU3_MAX_HW_CHANNELS];
254d3a727421cc Biju Das 2023-06-02  81  	struct rz_mtu3_pwm_channel channel_data[RZ_MTU3_MAX_HW_CHANNELS];
254d3a727421cc Biju Das 2023-06-02 @82  };
254d3a727421cc Biju Das 2023-06-02  83  

:::::: The code at line 82 was first introduced by commit
:::::: 254d3a727421ccc935f085eaa9bae51cb6c9df25 pwm: Add Renesas RZ/G2L MTU3a PWM driver

:::::: TO: Biju Das <biju.das.jz@bp.renesas.com>
:::::: CC: Thierry Reding <thierry.reding@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
