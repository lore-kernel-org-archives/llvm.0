Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3771EB1B8;
	Thu, 13 Mar 2025 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741888256; cv=none; b=QnUuX035qHptiqrUcsBBAHoWUY2f40xDVPkoRsVUwokzu+m1pAXUIqzrAlr9+f3k+eA1EHyiAj0ToXSouTw34VztH85e7sKhXh9sHM7aglRcVf3SX98779B2yNZYf0ex0yjYELuKgMBpwHz8g+lNb4P4p7dN8iMg2jO1R15PYbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741888256; c=relaxed/simple;
	bh=DHiQ2X/+ZqgncOV0DdBIbwS7t12qpLghEOM88szNpP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKAydM6Z3RZbnm+4NXFbjDLR446h+a7hStv1NcqhgqSLQLzAYQNgFEiCDS6Z+X3D/ytllxKwZx4YfTOECfY9cX89VMbcsnyWbM/wLQfoxDfBzagE4CJYX4u1D7GeBKgd9HOhQLZZWiKX12ug08cM9IMKAGwriHXF6iUCLoH/pEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLMBHj05; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLMBHj05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741888254; x=1773424254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHiQ2X/+ZqgncOV0DdBIbwS7t12qpLghEOM88szNpP8=;
  b=cLMBHj05/BcA/WKc0+a94dCtyq5k85Ei2TGFZYui+kT4BRtDGBQmWn3L
   +iUJ+xcqyC5oynq0lq9YZ/NvjGD3OQFQLzjlOEm5lY5Q0tgI3fFnWjnfv
   WzxfMgV9LkrJzHOGc4Q4nMGmeoKXkLoTkuAbWGG/iZkYCwF8yHaMjr6P+
   rJxqTKfhugDwWtar9vsMiSIEi99HV66zSoaHNE39SzzRShelTx3t+NKQC
   NP+bG+LHWnGlczLK4DxHyHHArIg6FdwKb1eEUcGXTZ4IlRGJz4NDZXDV+
   RGfauQeH1TPoV1xUFUQzc4LspfUFwFJLoebT0KjCDjMZbJItPysMh5IDJ
   A==;
X-CSE-ConnectionGUID: a2SWfVemRTygiLixhXDCSQ==
X-CSE-MsgGUID: 6rgMGxN8SBKhs5pBdId/jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43199397"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="43199397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 10:50:53 -0700
X-CSE-ConnectionGUID: XFWgDZdyQCeL20Q4zsBnRA==
X-CSE-MsgGUID: NSl+LZ/fRwCXVLI5K9rmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="126073241"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Mar 2025 10:50:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsmhm-0009jK-07;
	Thu, 13 Mar 2025 17:50:50 +0000
Date: Fri, 14 Mar 2025 01:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next 4/4]
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1576:35: error: redefinition of
 'bcm281xx_pinctrl_regmap_config'
Message-ID: <202503140136.vO23XO0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   a40b63c773c236026b956cbf6f16cf688c9ed21e
commit: a40b63c773c236026b956cbf6f16cf688c9ed21e [4/4] Merge branch 'devel' into for-next
config: arm-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503140136.vO23XO0f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140136.vO23XO0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140136.vO23XO0f-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1576:35: error: redefinition of 'bcm281xx_pinctrl_regmap_config'
    1576 | static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:963:35: note: previous definition of 'bcm281xx_pinctrl_regmap_config' with type 'const struct regmap_config'
     963 | static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1576:35: warning: 'bcm281xx_pinctrl_regmap_config' defined but not used [-Wunused-const-variable=]
    1576 | static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bcm281xx_pinctrl_regmap_config +1576 drivers/pinctrl/bcm/pinctrl-bcm281xx.c

7418b5cc81185e4 drivers/pinctrl/pinctrl-bcm281xx.c     Sherman Yin         2014-04-02  1575  
63b5aed37b769d6 drivers/pinctrl/pinctrl-bcm281xx.c     Krzysztof Kozlowski 2015-01-05 @1576  static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
7418b5cc81185e4 drivers/pinctrl/pinctrl-bcm281xx.c     Sherman Yin         2014-04-02  1577  	.reg_bits = 32,
7418b5cc81185e4 drivers/pinctrl/pinctrl-bcm281xx.c     Sherman Yin         2014-04-02  1578  	.reg_stride = 4,
7418b5cc81185e4 drivers/pinctrl/pinctrl-bcm281xx.c     Sherman Yin         2014-04-02  1579  	.val_bits = 32,
68283c1cb573143 drivers/pinctrl/bcm/pinctrl-bcm281xx.c Artur Weber         2025-02-07  1580  	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
7418b5cc81185e4 drivers/pinctrl/pinctrl-bcm281xx.c     Sherman Yin         2014-04-02  1581  };
7418b5cc81185e4 drivers/pinctrl/pinctrl-bcm281xx.c     Sherman Yin         2014-04-02  1582  

:::::: The code at line 1576 was first introduced by commit
:::::: 63b5aed37b769d6b9f5b322e1e29f31c18da5d17 pinctrl: bcm281xx: Constify struct regmap_config

:::::: TO: Krzysztof Kozlowski <k.kozlowski@samsung.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
