Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6C211A00;
	Mon, 19 May 2025 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683185; cv=none; b=R1jEWI+Quus6lfEFjOJHkTHYVe6RJrWKc11s/mJXKyXfCKshfSP2Mk7x0B2L1oiYZN2mSoIgiNptWKCzCK6dv+TGt6BLcbGyDofJvO202JATXNVfG+IIKlhAehfnlTRG98gbIIvtz8jEIy2Krj5SIEZT2cYwAIRU9z4iMdCkZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683185; c=relaxed/simple;
	bh=RkSJvHP+GHi3a0hSKGQyINsPNayGfM36dNCLowBUDWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H4a98mk9mCum8wMPiwCvkjjWPVpKm5wHoFHkpvS5UbywWrMktHWQyVmc3WOlCeDEq64sQjkEc2GNyQvt9E4FSa9qu6kEdYXavc3QZyg/KRI5h3j20P8yP5unh6f6qxO94R+GBFtmfTl4nrCr9uE+XwWYhel6UiyHKXRkfXRUxZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVot1cvh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVot1cvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747683184; x=1779219184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RkSJvHP+GHi3a0hSKGQyINsPNayGfM36dNCLowBUDWs=;
  b=IVot1cvhtjlgFI/my1kSHq2i/lRg9+qKacE1XF6EDBud/xhcaMZS5+AK
   vcuttAAIZPZOFrAyqpbCPp/U4IcWe0qPm0tCKTgQqLNXYEBb1OYv9UTWl
   g00LPkVegacGuVKZEL7pGqgL3+gd5e2j43n7wZXwPM0y7m/Y6PidthbH9
   D25owPMYWW4aCKZSdtP1FzNC44XVTzIqj4Ct6DCgbGyzv9qY0QR39m0mW
   gkhXqiZQneDJUK2flH1kxvWC/eU5VL84HiSLsuSQNJ9J5VAXjwICdsskx
   RgODZS6Zxfa/RYDslXvJVgwD549OxvvuIfA5TQJQDpXHVLsqm+NyLGwmY
   Q==;
X-CSE-ConnectionGUID: KFJ4HjzFSX2djjEKJMrc5A==
X-CSE-MsgGUID: jAHdH/NqT06OKYEOWoFucA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49295909"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49295909"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 12:33:02 -0700
X-CSE-ConnectionGUID: 52LR4ImpT3iw1y4KCAiLyA==
X-CSE-MsgGUID: ccaFYIirRaaoKLEnG6G99g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144219720"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2025 12:33:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH6EL-000Lmo-2S;
	Mon, 19 May 2025 19:32:57 +0000
Date: Tue, 20 May 2025 03:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw 7/21] drivers/mfd/adp5585.c:160:21: warning:
 cast to smaller integer type 'enum adp5585_variant' from 'const void *'
Message-ID: <202505200334.H4lCtBr0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw
head:   0e85f43105aa62dc12515e1cd861a56e63b26e5d
commit: 856adcbce38d0b06ff00f64778d1094bf2521ea1 [7/21] mfd: adp5585: refactor how regmap defaults are handled
config: powerpc64-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200334.H4lCtBr0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200334.H4lCtBr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200334.H4lCtBr0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/adp5585.c:160:21: warning: cast to smaller integer type 'enum adp5585_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     160 |         adp5585->variant = (enum adp5585_variant)i2c_get_match_data(i2c);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +160 drivers/mfd/adp5585.c

   146	
   147	static int adp5585_i2c_probe(struct i2c_client *i2c)
   148	{
   149		struct regmap_config regmap_config;
   150		struct adp5585_dev *adp5585;
   151		unsigned int id;
   152		int ret;
   153	
   154		adp5585 = devm_kzalloc(&i2c->dev, sizeof(*adp5585), GFP_KERNEL);
   155		if (!adp5585)
   156			return -ENOMEM;
   157	
   158		i2c_set_clientdata(i2c, adp5585);
   159	
 > 160		adp5585->variant = (enum adp5585_variant)i2c_get_match_data(i2c);
   161		if (!adp5585->variant)
   162			return -ENODEV;
   163	
   164		adp5585_fill_regmap_config(adp5585, &regmap_config);
   165	
   166		adp5585->regmap = devm_regmap_init_i2c(i2c, &regmap_config);
   167		if (IS_ERR(adp5585->regmap))
   168			return dev_err_probe(&i2c->dev, PTR_ERR(adp5585->regmap),
   169					     "Failed to initialize register map\n");
   170	
   171		ret = regmap_read(adp5585->regmap, ADP5585_ID, &id);
   172		if (ret)
   173			return dev_err_probe(&i2c->dev, ret,
   174					     "Failed to read device ID\n");
   175	
   176		if ((id & ADP5585_MAN_ID_MASK) != ADP5585_MAN_ID_VALUE)
   177			return dev_err_probe(&i2c->dev, -ENODEV,
   178					     "Invalid device ID 0x%02x\n", id);
   179	
   180		/*
   181		 * Enable the internal oscillator, as it's shared between multiple
   182		 * functions.
   183		 *
   184		 * As a future improvement, power consumption could possibly be
   185		 * decreased in some use cases by enabling and disabling the oscillator
   186		 * dynamically based on the needs of the child drivers.
   187		 */
   188		ret = regmap_set_bits(adp5585->regmap, ADP5585_GENERAL_CFG, ADP5585_OSC_EN);
   189		if (ret)
   190			return ret;
   191	
   192		ret = devm_add_action_or_reset(&i2c->dev, adp5585_osc_disable, adp5585);
   193		if (ret)
   194			return ret;
   195	
   196		return adp5585_add_devices(&i2c->dev);
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
