Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8756A16728D;
	Wed, 29 May 2024 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716962302; cv=none; b=kXL91KUQHHAjbNw2rPsLOhiiygtVS+Mn8dqz0Jjn5mI5gPthp5PYq+qZjG5gcGo2v6dWm2L3eUSixVR8TlN/OTGet7P3PHzZT1q1cQqL28L8LuYkI80E0pY6zfrohZXfGLvU8WAfqc14U1oc/yUxnTMjFTSab2zXMiS8bvIGpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716962302; c=relaxed/simple;
	bh=rC6sJIzmyV9lzYEJy7EVUUCCyjovjdkPkirJjFnT4PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZRaUCE6h5TpY6O+Ep9yTqAVenn+5hRa7L8qpJ5g1MhD1oHvxu++kloUoe2ttPb8QFuHL+HdtQlIsn6YVTSsPSAVeBDTXqTBDdkkfC7xf6ZeyShEffD+q01yOvlDyQdCX8Mg8rm+J4QMN9V8KmG5hdEUy5f2DR5LjhWm5n1WEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hT5Rzv7E; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hT5Rzv7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716962301; x=1748498301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rC6sJIzmyV9lzYEJy7EVUUCCyjovjdkPkirJjFnT4PY=;
  b=hT5Rzv7EfICxTC0plcC0AK/LW1208pcguyHIM/g0W2YLYk1swSLn5CIE
   ZtyiVMc8G+6rizl7yRThlo93YqDrVg5BVtDJU/ga6hE87zdnqLXQerEcW
   F/rkz9O1TctqDv+S5Ld5Z1wO8pv4iTp8MuM3IUlOeaBn/pZlktuZj0KXx
   AlNFIM3euJqFUMAU6RLrnfRSYqeElbQ0XFAzSU4iLY2zEhSRraFtTlT+J
   zT9Rgh53oyXzwKCfOAG3RTl+OpHSD4PR5snEdT8Wkhm3Z36WdEOkTjm5k
   6HCm0D4Rf3g/BFV0sXtidIWthmgXBBm0iSuL926f7n+bJfg8n+5/aLm6i
   g==;
X-CSE-ConnectionGUID: dfjcqvbhTCqBJ4t00s/Vhw==
X-CSE-MsgGUID: p+qr6wNpTiuuhw8iBOXSmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13193098"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13193098"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 22:58:20 -0700
X-CSE-ConnectionGUID: tvK1npEaSnqrYtM8d5bItA==
X-CSE-MsgGUID: G0Si5JCWRVunRTUebbFEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="66511251"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2024 22:58:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCCKD-000DBP-1G;
	Wed, 29 May 2024 05:58:16 +0000
Date: Wed, 29 May 2024 13:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 6/20] drivers/opp/core.c:1406:20: error:
 conflicting types for '_add_opp_dev'
Message-ID: <202405291343.wYiRn1MH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   f37061809bb98e131179785e0d1ff3fe5bfbd819
commit: 038d6d6ae0da46eb5240a2a5ec65e8bd8cb149bc [6/20] driver core/cpu: Move the CPUID into struct cpu
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240529/202405291343.wYiRn1MH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291343.wYiRn1MH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291343.wYiRn1MH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/opp/core.c:1406:20: error: conflicting types for '_add_opp_dev'
   struct opp_device *_add_opp_dev(const struct device *dev,
                      ^
   drivers/opp/opp.h:257:20: note: previous declaration is here
   struct opp_device *_add_opp_dev(struct device *dev, struct opp_table *opp_table);
                      ^
>> drivers/opp/core.c:1416:15: error: assigning to 'struct device *' from 'const struct device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           opp_dev->dev = dev;
                        ^ ~~~
   2 errors generated.


vim +/_add_opp_dev +1406 drivers/opp/core.c

064416586190cb0 drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1405  
ef43f01ac06976b drivers/opp/core.c            Viresh Kumar       2020-10-22 @1406  struct opp_device *_add_opp_dev(const struct device *dev,
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1407  				struct opp_table *opp_table)
064416586190cb0 drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1408  {
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1409  	struct opp_device *opp_dev;
064416586190cb0 drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1410  
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1411  	opp_dev = kzalloc(sizeof(*opp_dev), GFP_KERNEL);
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1412  	if (!opp_dev)
064416586190cb0 drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1413  		return NULL;
064416586190cb0 drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1414  
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1415  	/* Initialize opp-dev */
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16 @1416  	opp_dev->dev = dev;
3d2556992a878a2 drivers/opp/core.c            Viresh Kumar       2018-08-03  1417  
ef43f01ac06976b drivers/opp/core.c            Viresh Kumar       2020-10-22  1418  	mutex_lock(&opp_table->lock);
052c6f19141dd13 drivers/base/power/opp/core.c Viresh Kumar       2017-01-23  1419  	list_add(&opp_dev->node, &opp_table->dev_list);
ef43f01ac06976b drivers/opp/core.c            Viresh Kumar       2020-10-22  1420  	mutex_unlock(&opp_table->lock);
064416586190cb0 drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1421  
2c2709dc6921c5d drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1422  	/* Create debugfs entries for the opp_table */
a2dea4cb9070224 drivers/opp/core.c            Greg Kroah-Hartman 2019-01-22  1423  	opp_debug_register(opp_dev, opp_table);
283d55e68d8a0f3 drivers/opp/core.c            Viresh Kumar       2018-09-07  1424  
283d55e68d8a0f3 drivers/opp/core.c            Viresh Kumar       2018-09-07  1425  	return opp_dev;
283d55e68d8a0f3 drivers/opp/core.c            Viresh Kumar       2018-09-07  1426  }
283d55e68d8a0f3 drivers/opp/core.c            Viresh Kumar       2018-09-07  1427  

:::::: The code at line 1406 was first introduced by commit
:::::: ef43f01ac06976b2aa2b17266d307bb1a4f7e6f9 opp: Always add entries in dev_list with opp_table->lock held

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
