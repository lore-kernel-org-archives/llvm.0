Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650014A9D;
	Sun, 23 Jun 2024 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719118306; cv=none; b=bOK+xKJDeH2rp7nOP2fODhSURv6ghYJCc3F31ISe5lbLeozjR96icKxj1hqNLbSd6m9sVmcbQEVvwZ2yRj/AR3pwUOanK4DQW6MpqUz6qW40+7M70cb8JH9eWycruCJXrAZJZKFvho3ixF0kObL4kqK+db+BktHZ5QwPLLWidMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719118306; c=relaxed/simple;
	bh=Ypx8KkQf0Y/cGfSXporDygxgc5era0LyU2p/b1ax1Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tnus8BtkTv1Z6jO7/+x4PeyqH5j6XpTCLor+nNK5HXS3g2j6UcGnH9wTTylriAYn/xNY6f6cRQ+3yXPoSCxCT0BR8/+Rr4M/yG7gGwjWHIcbtNLk2H+c0pOSPK3ujRVNvzFETX/EzKHAJOUatE7CHD+3KcJUX5FxSGdG7m7m7bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=km3nyzQP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="km3nyzQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719118304; x=1750654304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ypx8KkQf0Y/cGfSXporDygxgc5era0LyU2p/b1ax1Aw=;
  b=km3nyzQPq1Vsk8dOFnNrpPwpfspW8AzvqI2I1h2hMpwep+nvpwlpVZDk
   00BSNzHpLdxiIZAo7iAh3VzsX+LADZqLp5lpSGFwWrO5z1lqeFPrPytwZ
   6TPxLN99boPjvYWLBJbRW8KPOyM/s8u7mrleJE/QvxoV3hdD8xmqp87JR
   B0Eszpag81cj3AslI7LJO3jDD6fUuSBZRBFw5LSlZjIhAzHkSeAYQtz9W
   17DwqOAW6n9TPN6hExJCq9UI4ocy4m/FXS7XvX94wnYPPRi9yAtpd2lR6
   NoIOjdgJO4tHzcvdvEEmpxlPnVtGIQndaKLCN8JWNR2SQAB0ttdDcxllG
   g==;
X-CSE-ConnectionGUID: Q3M832FcS2eqGU0xqMIAMw==
X-CSE-MsgGUID: 0umfOI6WSTqsyyrma4LWVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16231416"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="16231416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 21:51:42 -0700
X-CSE-ConnectionGUID: nx3oAuqxQ4++3fh1yLYtew==
X-CSE-MsgGUID: 2hypQYWwTiGGVnQB+syE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="47906658"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jun 2024 21:51:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLFCU-000AGQ-0Q;
	Sun, 23 Jun 2024 04:51:38 +0000
Date: Sun, 23 Jun 2024 12:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [srini-nvmem:for-next 9/12] drivers/nvmem/core.c:400:42: error:
 cannot assign to variable 'bin_attr_nvmem_eeprom_compat' with
 const-qualified type 'const struct bin_attribute'
Message-ID: <202406231219.Rw6IC4E6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   050e51c214c5bbe5ffd9e7f5927ccdcd2da18fe3
commit: 178a9aea2c5db8328757fdea66922bda0236e95c [9/12] nvmem: core: mark bin_attr_nvmem_eeprom_compat as const
config: i386-buildonly-randconfig-003-20240623 (https://download.01.org/0day-ci/archive/20240623/202406231219.Rw6IC4E6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406231219.Rw6IC4E6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406231219.Rw6IC4E6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/core.c:400:42: error: cannot assign to variable 'bin_attr_nvmem_eeprom_compat' with const-qualified type 'const struct bin_attribute'
     400 |                 bin_attr_nvmem_eeprom_compat.attr.name = "fram";
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/nvmem/core.c:375:35: note: variable 'bin_attr_nvmem_eeprom_compat' declared const here
     375 | static const struct bin_attribute bin_attr_nvmem_eeprom_compat = {
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     376 |         .attr   = {
         |         ~~~~~~~~~~~
     377 |                 .name   = "eeprom",
         |                 ~~~~~~~~~~~~~~~~~~~
     378 |         },
         |         ~~
     379 |         .read   = bin_attr_nvmem_read,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     380 |         .write  = bin_attr_nvmem_write,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     381 | };
         | ~
   1 error generated.


vim +400 drivers/nvmem/core.c

844003052719375 Srinivas Kandagatla 2020-03-25  382  
844003052719375 Srinivas Kandagatla 2020-03-25  383  /*
844003052719375 Srinivas Kandagatla 2020-03-25  384   * nvmem_setup_compat() - Create an additional binary entry in
844003052719375 Srinivas Kandagatla 2020-03-25  385   * drivers sys directory, to be backwards compatible with the older
844003052719375 Srinivas Kandagatla 2020-03-25  386   * drivers/misc/eeprom drivers.
844003052719375 Srinivas Kandagatla 2020-03-25  387   */
844003052719375 Srinivas Kandagatla 2020-03-25  388  static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
844003052719375 Srinivas Kandagatla 2020-03-25  389  				    const struct nvmem_config *config)
844003052719375 Srinivas Kandagatla 2020-03-25  390  {
844003052719375 Srinivas Kandagatla 2020-03-25  391  	int rval;
844003052719375 Srinivas Kandagatla 2020-03-25  392  
844003052719375 Srinivas Kandagatla 2020-03-25  393  	if (!config->compat)
844003052719375 Srinivas Kandagatla 2020-03-25  394  		return 0;
844003052719375 Srinivas Kandagatla 2020-03-25  395  
844003052719375 Srinivas Kandagatla 2020-03-25  396  	if (!config->base_dev)
844003052719375 Srinivas Kandagatla 2020-03-25  397  		return -EINVAL;
844003052719375 Srinivas Kandagatla 2020-03-25  398  
fd307a4ad332ef5 Jiri Prchal         2021-06-11  399  	if (config->type == NVMEM_TYPE_FRAM)
fd307a4ad332ef5 Jiri Prchal         2021-06-11 @400  		bin_attr_nvmem_eeprom_compat.attr.name = "fram";
fd307a4ad332ef5 Jiri Prchal         2021-06-11  401  
2a4542e55f1b592 Srinivas Kandagatla 2020-04-17  402  	nvmem->eeprom = bin_attr_nvmem_eeprom_compat;
2a4542e55f1b592 Srinivas Kandagatla 2020-04-17  403  	nvmem->eeprom.attr.mode = nvmem_bin_attr_get_umode(nvmem);
844003052719375 Srinivas Kandagatla 2020-03-25  404  	nvmem->eeprom.size = nvmem->size;
844003052719375 Srinivas Kandagatla 2020-03-25  405  #ifdef CONFIG_DEBUG_LOCK_ALLOC
844003052719375 Srinivas Kandagatla 2020-03-25  406  	nvmem->eeprom.attr.key = &eeprom_lock_key;
844003052719375 Srinivas Kandagatla 2020-03-25  407  #endif
844003052719375 Srinivas Kandagatla 2020-03-25  408  	nvmem->eeprom.private = &nvmem->dev;
844003052719375 Srinivas Kandagatla 2020-03-25  409  	nvmem->base_dev = config->base_dev;
844003052719375 Srinivas Kandagatla 2020-03-25  410  
844003052719375 Srinivas Kandagatla 2020-03-25  411  	rval = device_create_bin_file(nvmem->base_dev, &nvmem->eeprom);
844003052719375 Srinivas Kandagatla 2020-03-25  412  	if (rval) {
844003052719375 Srinivas Kandagatla 2020-03-25  413  		dev_err(&nvmem->dev,
844003052719375 Srinivas Kandagatla 2020-03-25  414  			"Failed to create eeprom binary file %d\n", rval);
844003052719375 Srinivas Kandagatla 2020-03-25  415  		return rval;
844003052719375 Srinivas Kandagatla 2020-03-25  416  	}
844003052719375 Srinivas Kandagatla 2020-03-25  417  
844003052719375 Srinivas Kandagatla 2020-03-25  418  	nvmem->flags |= FLAG_COMPAT;
844003052719375 Srinivas Kandagatla 2020-03-25  419  
844003052719375 Srinivas Kandagatla 2020-03-25  420  	return 0;
844003052719375 Srinivas Kandagatla 2020-03-25  421  }
844003052719375 Srinivas Kandagatla 2020-03-25  422  

:::::: The code at line 400 was first introduced by commit
:::::: fd307a4ad332ef50be5569c92490219e7cd84ce5 nvmem: prepare basics for FRAM support

:::::: TO: Jiri Prchal <jiri.prchal@aksignal.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
