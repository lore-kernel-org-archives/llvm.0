Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09862980DA;
	Fri, 11 Apr 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373531; cv=none; b=SwVaYH6+g5jxk7kGSQjnT5aruSf/1t2+hscqEk3EDEAwj6QwlDw1lAi/8KTFKzfmTiD4jdjgMhB6Tzpu5+aa9fczE7RHSl5z+6pmr8EFQeKix6XdbYgd1Ku6m8cqcZVO+TsSLrg7E2BsM5AMIyfdtUo7PP85e4ouAgGtUo03BgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373531; c=relaxed/simple;
	bh=TDJhpY7Hej3tcVAalIVnCRg8/TAzGWJ4eomNFY+33LU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBpdAqk60KJxFNUUeT5zvJ5Lfj/2Qv8GLkb7xdd4L/CuasVYr4/mTdZlKra+TxxTij2wW/i/9te1DWsSkRWQi3bhAuE/UPs3AP0PYi0FfhOKLXOdJoRJMQ5NZIMr12DUvJfFMGSF1wZVsF04wqAf0x7yDU1riFzXI/0762vkxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfBY2Rkr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfBY2Rkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744373529; x=1775909529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDJhpY7Hej3tcVAalIVnCRg8/TAzGWJ4eomNFY+33LU=;
  b=NfBY2RkrkFc8/SRvkPo4gkOm07RVrBY0PgMQTXfjs3JHDXIQdnKseV1+
   gPBXSK07u0C20YskQLnh8gwe75w7tcCySIHmrTOOskj6unwnM60Pqlw1c
   bvq0zut9y6J86I0U55fFsPivvZzY3vrVMBZMCRFScZ+WyEAXDEE8dELoV
   ZszkjW13ZkJOMuPfChH0HBKmnrKubr4OJRldKp+2rZLq+5HqKMErpP+kw
   0RKodFIQDdvv43mIRsLFiAhRQrfThKwJX9fnMFn09AtJNUCiI76n0d2gA
   PJqN0Ywh/cJUs1Mju1j0rv4F7eTOrh2rkIiTO2ihWOCH+0CCmq3PIpoNA
   w==;
X-CSE-ConnectionGUID: BM1V/IIEQ3m5wqqMyps4Cw==
X-CSE-MsgGUID: vQJQs1usRm6I7ElD38srOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71309678"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="71309678"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:12:07 -0700
X-CSE-ConnectionGUID: G1M2IF1OROqmZckF7IRfPQ==
X-CSE-MsgGUID: kqut3c30RXuS8Sc8Jtsrcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="128951131"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 05:12:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3DEp-000B4g-1N;
	Fri, 11 Apr 2025 12:12:03 +0000
Date: Fri, 11 Apr 2025 20:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 12/12] drivers/leds/leds-lp8860.c:102:
 warning: Excess struct member 'enable_gpio' description in 'lp8860_led'
Message-ID: <202504112024.AFtTNUuX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   e9bde6230972ad76fc91279850edd8dbc6f1cb4d
commit: e9bde6230972ad76fc91279850edd8dbc6f1cb4d [12/12] leds: lp8860: Disable GPIO with devm action
config: arm-randconfig-002-20250411 (https://download.01.org/0day-ci/archive/20250411/202504112024.AFtTNUuX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504112024.AFtTNUuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504112024.AFtTNUuX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-lp8860.c:102: warning: Excess struct member 'enable_gpio' description in 'lp8860_led'
   drivers/leds/leds-lp8860.c:102: warning: Excess struct member 'regulator' description in 'lp8860_led'


vim +102 drivers/leds/leds-lp8860.c

99ca0ea5730971 Jacek Anaszewski 2019-06-09   85  
7a8685accb9580 Dan Murphy       2014-11-19   86  /**
46cc5941a091bd Lee Jones        2021-05-28   87   * struct lp8860_led
46cc5941a091bd Lee Jones        2021-05-28   88   * @lock: Lock for reading/writing the device
46cc5941a091bd Lee Jones        2021-05-28   89   * @client: Pointer to the I2C client
46cc5941a091bd Lee Jones        2021-05-28   90   * @led_dev: led class device pointer
46cc5941a091bd Lee Jones        2021-05-28   91   * @regmap: Devices register map
46cc5941a091bd Lee Jones        2021-05-28   92   * @eeprom_regmap: EEPROM register map
46cc5941a091bd Lee Jones        2021-05-28   93   * @enable_gpio: VDDIO/EN gpio to enable communication interface
46cc5941a091bd Lee Jones        2021-05-28   94   * @regulator: LED supply regulator pointer
8a7a76c8004387 Dan Murphy       2017-11-15   95   */
7a8685accb9580 Dan Murphy       2014-11-19   96  struct lp8860_led {
7a8685accb9580 Dan Murphy       2014-11-19   97  	struct mutex lock;
7a8685accb9580 Dan Murphy       2014-11-19   98  	struct i2c_client *client;
7a8685accb9580 Dan Murphy       2014-11-19   99  	struct led_classdev led_dev;
7a8685accb9580 Dan Murphy       2014-11-19  100  	struct regmap *regmap;
7a8685accb9580 Dan Murphy       2014-11-19  101  	struct regmap *eeprom_regmap;
7a8685accb9580 Dan Murphy       2014-11-19 @102  };
7a8685accb9580 Dan Murphy       2014-11-19  103  

:::::: The code at line 102 was first introduced by commit
:::::: 7a8685accb95801bb29ab85d5b370999d3fb8e32 leds: lp8860: Introduce TI lp8860 4 channel LED driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Bryan Wu <cooloney@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
