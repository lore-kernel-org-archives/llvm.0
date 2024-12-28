Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18195FDA7;
	Sat, 28 Dec 2024 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735369707; cv=none; b=QlC4EbdkXoFBletTiz9A2zIkuoZisZvWgoKYOkTDAYcA82uLJTObzJaXCT3OFxrLrMWt4MAM2Aqr6Ky+QZHKhaLiElDeOZMtaUULC7BX5i+90KiJ8Iw78pjB1HvrbDsiKgIk2frk//wDSxWJeN4WzOD8RrgSiFkj0H/9WPu3oNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735369707; c=relaxed/simple;
	bh=ZJC0Y50fVBT6tyrKd9rUNqpGbvrAIfH8EP2VAEwrsIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hhiicFTWNO1P9gtrWRf163LgXy/Y3/gvyuVNUG2cq14gQM923aURUeEaHmdXaNQNQEOtSRu48/Ka67FW5ESOQRj1Nm257hN/dvNO+GIghsjwttq2+ZVN543qDw++iv+uktx9wilbVIQY/5t+aXtECTT75w//dnVE5negV1O1Ph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzYTqPSR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzYTqPSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735369706; x=1766905706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJC0Y50fVBT6tyrKd9rUNqpGbvrAIfH8EP2VAEwrsIQ=;
  b=LzYTqPSRlSsUC4sGTw24cLSfcbilGE3tJFS7V52CNUE1OoQh66NkPQcI
   2BND3fVgF4hYPpUB3R76gNLfvAKNEWx0JW3+xSYgkcZOGv9qV5ZC5y3gm
   y5jvio15GkYx2aE0IaZVfHG3JjO5ReV007jHRy4C/MkttzKnbKKPf1lqw
   mRBjJQmIU9u3rjV0QV3LtYNDLxJm57nS8aTDcmvst7EGlDsGL6PFLaAFe
   VpSxJq9AkLbaFzpgmYNa3zj/wp3Fjg/B5ODl99n6WoXFTwLAR14uG0tad
   pa68s3cjNmI/PcCVO9ZN7vp7ZTNvjl7bA/tW0IBwBsCtgvJ3WK7YnR8Bb
   A==;
X-CSE-ConnectionGUID: hyLO4trkQByDP7GXsbwBVQ==
X-CSE-MsgGUID: 24ofmQQyT/mAILqGt5dEzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35461366"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35461366"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 23:08:25 -0800
X-CSE-ConnectionGUID: CaqMPHTyRuqKT2qpgdomKg==
X-CSE-MsgGUID: oRHcza2XQruORGuQzIjS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131284811"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 23:08:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRQvt-0003vT-1G;
	Sat, 28 Dec 2024 07:08:21 +0000
Date: Sat, 28 Dec 2024 15:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: drivers/watchdog/max77620_wdt.c:43: warning: Excess struct member
 'wdt_info' description in 'max77620_variant'
Message-ID: <202412281555.YMBF9azh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 254099d8fafcd80e11a3246f6ff62af816a2b566 watchdog: max77620: Add support for the max77714 variant
date:   2 years, 10 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241228/202412281555.YMBF9azh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281555.YMBF9azh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281555.YMBF9azh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/max77620_wdt.c:43: warning: Excess struct member 'wdt_info' description in 'max77620_variant'


vim +43 drivers/watchdog/max77620_wdt.c

    25	
    26	/**
    27	 * struct max77620_variant - Data specific to a chip variant
    28	 * @wdt_info:            watchdog descriptor
    29	 * @reg_onoff_cnfg2:     ONOFF_CNFG2 register offset
    30	 * @reg_cnfg_glbl2:      CNFG_GLBL2 register offset
    31	 * @reg_cnfg_glbl3:      CNFG_GLBL3 register offset
    32	 * @wdtc_mask:           WDTC bit mask in CNFG_GLBL3 (=bits to update to ping the watchdog)
    33	 * @bit_wd_rst_wk:       WD_RST_WK bit offset within ONOFF_CNFG2
    34	 * @cnfg_glbl2_cfg_bits: configuration bits to enable in CNFG_GLBL2 register
    35	 */
    36	struct max77620_variant {
    37		u8 reg_onoff_cnfg2;
    38		u8 reg_cnfg_glbl2;
    39		u8 reg_cnfg_glbl3;
    40		u8 wdtc_mask;
    41		u8 bit_wd_rst_wk;
    42		u8 cnfg_glbl2_cfg_bits;
  > 43	};
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
