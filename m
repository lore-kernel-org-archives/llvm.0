Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58472215171;
	Fri, 11 Apr 2025 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370465; cv=none; b=nILkxgsNe9gOZIi4XZEWksh70tHN7RtFCTyXq5SPjhYnqNx8Uiq4zRmIuhBXBQVGnT1pQgcd/qBbfdH1MwkmhIAWNrfdoHtZ+rNeAqbyBX9RaXmvdpdQFHKBH/Ji37UzyNpo5YbgenHDqdeHrdC9LgTzwsjMyeLPSqAkDhdTDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370465; c=relaxed/simple;
	bh=NSveI23s9412QiAqOw8E532iM1cE8lp56+Z/2k1s+hY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iW8LxCvOq0vemhH9TY4ldMr2EonCaB3gf+bnaykMFBDEH41XNcGIuBdrWhgT1l8uuAwWwtznWgvjRNcx4ME0N4J7bc7uQrnODOVuYn6KJaW2phSDxQWCqQu5vDEA0CcVDvxTKdK2qeyv4g4BeqyRuTj8/wbVQJlUFe/tMWhmh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbyzMtLH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbyzMtLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744370464; x=1775906464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSveI23s9412QiAqOw8E532iM1cE8lp56+Z/2k1s+hY=;
  b=gbyzMtLHrQdBZsjk9JK5ZAvudfXux6jyoq6Sf9xIczYnahJ/MTCpEAd1
   IRss6NY6HNh6PbLKewf6hZKWO1QgKqEaHDF5Kcc1PPuVj4aPgrke88zBZ
   YLzD8FIfsRE1wpZOoMdP8xPkK/OcnfklRckiS2ivjeEYg8JJdxQO8ZJM3
   cL2iN4m4hMd61ROQlHEV3U8p84RdGsFUe/+dJ8BRUr7ANiyYUEqf74Kyn
   3bakHndBroLRbr7LukkRL/X3T/vP/PDqZvUdOGsWWWD30qh4uEiqYTPzV
   UvxMjgI0CJyphahTsIHrjfSdHQdwj/cFfRuhcirpJwIJzIQ1pQFbltyRW
   g==;
X-CSE-ConnectionGUID: Dq8lRonFQR2eT33x1jUAgQ==
X-CSE-MsgGUID: izvGDu38RRGz6Akm6nDTjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46047550"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="46047550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 04:21:03 -0700
X-CSE-ConnectionGUID: fvpOpq8nRBCyXCxGMy41YA==
X-CSE-MsgGUID: wIUTuWeERYG4CR3g4c+Uww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="134033970"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 04:21:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3CRO-000B38-2D;
	Fri, 11 Apr 2025 11:20:58 +0000
Date: Fri, 11 Apr 2025 19:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 10/12] drivers/leds/leds-lp8860.c:103:
 warning: Excess struct member 'regulator' description in 'lp8860_led'
Message-ID: <202504111959.7WtsLney-lkp@intel.com>
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
commit: fa604baf13ced084636afbfa8d93f030ad8b593c [10/12] leds: lp8860: Enable regulator using enable_optional helper
config: arm-randconfig-002-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111959.7WtsLney-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111959.7WtsLney-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111959.7WtsLney-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-lp8860.c:103: warning: Excess struct member 'regulator' description in 'lp8860_led'


vim +103 drivers/leds/leds-lp8860.c

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
7a8685accb9580 Dan Murphy       2014-11-19  102  	struct gpio_desc *enable_gpio;
7a8685accb9580 Dan Murphy       2014-11-19 @103  };
7a8685accb9580 Dan Murphy       2014-11-19  104  

:::::: The code at line 103 was first introduced by commit
:::::: 7a8685accb95801bb29ab85d5b370999d3fb8e32 leds: lp8860: Introduce TI lp8860 4 channel LED driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Bryan Wu <cooloney@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
