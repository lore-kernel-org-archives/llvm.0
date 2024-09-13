Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987062B9C6;
	Fri, 13 Sep 2024 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241836; cv=none; b=E9/feucUjVhuQfZyoFVj73LS7ddl1GFkEboxGFYuPZj5/PpWNDnef4XK/K0UqzMgJ4lwIzF2LmSAX9GhxfSHPrZjb9zQDLgLg7nOwIfAUcVhWu2RlMC/X23iI2jgAoYBLAYgXZGjOL9IuSFk3gVC3wYsO4AgA/WntyKB4VF8GhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241836; c=relaxed/simple;
	bh=whItXbnjgKXPBFBAY5/abP2Y+pZahqYQgWM3dfr+lJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXXiOlc+t2QHAxL2NNRLdfzOv5UWVbSHIymMNY0OGRVf4V/ObkbEJuiWMxNereB1zzuxgbGYS1qZG9tBRaVyu3FBae+3StxsmLM9AnCXbi9/HPE9kDi7z3PVEJmKOQKt4B/d81EFHN6YrUuifqzdZdg3ZHT0qF+S+3FIEJVa+CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gybjdkCf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gybjdkCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726241834; x=1757777834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whItXbnjgKXPBFBAY5/abP2Y+pZahqYQgWM3dfr+lJo=;
  b=gybjdkCfGcXrDVAK6OlAqcUFZVTExE2Vz8+sHw7Z6DY4dF8Ht7deNiXy
   sD7Y7r0FzO4C4/yI0Xog0eznAmUnK8es9m0Os2KfQ7uWnBYDGx5jtYy11
   oPHHdZ3Gba3GNKiYD22tlhU4e32su99JTan3tZLkq9DsnFoI/i2w6gxp2
   WiiQOuBrgu+lDZgV1jrlGDavlBQjWP906zq7IoP/btrXhxXIKdf101EEN
   +eBQ4IxdE/HWQ0p1OVg8qOC5AEO0kWgEZ7uj6O6Pyz+sBVOjhYVbvK1zf
   i93yYtYek6b/0ThAoqTngeMTGJgF+vIVOkhgT7cBtkY+7HQd7Y6V9Gmrq
   Q==;
X-CSE-ConnectionGUID: C+dwXHz/ThuL/opX013IHw==
X-CSE-MsgGUID: Wb1uIgdhR+SvybUSFEMsVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25345504"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25345504"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 08:37:02 -0700
X-CSE-ConnectionGUID: u6RwDCW8TTa4DiKZw9Q7GA==
X-CSE-MsgGUID: S2IDiUcASkicQKuJ5iGDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="91352231"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 08:37:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp8Ly-0006d9-0f;
	Fri, 13 Sep 2024 15:36:58 +0000
Date: Fri, 13 Sep 2024 23:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for
 regulator support
Message-ID: <202409132350.owzYFq9z-lkp@intel.com>
References: <20240911072751.365361-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-8-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20240913]
[cannot apply to robh/for-next wsa/i2c/for-next linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240911-153237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240911072751.365361-8-wenst%40chromium.org
patch subject: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for regulator support
config: x86_64-buildonly-randconfig-004-20240913 (https://download.01.org/0day-ci/archive/20240913/202409132350.owzYFq9z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132350.owzYFq9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132350.owzYFq9z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/i2c-core-of-prober.c:214:11: error: call to undeclared function 'of_regulator_get_optional'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     214 |         supply = of_regulator_get_optional(dev, node, supply_name);
         |                  ^
   drivers/i2c/i2c-core-of-prober.c:214:11: note: did you mean 'regulator_get_optional'?
   include/linux/regulator/consumer.h:345:1: note: 'regulator_get_optional' declared here
     345 | regulator_get_optional(struct device *dev, const char *id)
         | ^
>> drivers/i2c/i2c-core-of-prober.c:214:9: error: incompatible integer to pointer conversion assigning to 'struct regulator *' from 'int' [-Wint-conversion]
     214 |         supply = of_regulator_get_optional(dev, node, supply_name);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/of_regulator_get_optional +214 drivers/i2c/i2c-core-of-prober.c

   197	
   198	static int i2c_of_probe_simple_get_supply(struct device *dev, struct device_node *node,
   199						  struct i2c_of_probe_simple_ctx *ctx)
   200	{
   201		const char *supply_name;
   202		struct regulator *supply;
   203	
   204		/*
   205		 * It's entirely possible for the component's device node to not have regulator
   206		 * supplies. While it does not make sense from a hardware perspective, the
   207		 * supplies could be always on or otherwise not modeled in the device tree, but
   208		 * the device would still work.
   209		 */
   210		supply_name = ctx->opts->supply_name;
   211		if (!supply_name)
   212			return 0;
   213	
 > 214		supply = of_regulator_get_optional(dev, node, supply_name);
   215		if (IS_ERR(supply)) {
   216			return dev_err_probe(dev, PTR_ERR(supply),
   217					     "Failed to get regulator supply \"%s\" from %pOF\n",
   218					     supply_name, node);
   219		}
   220	
   221		ctx->supply = supply;
   222	
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
