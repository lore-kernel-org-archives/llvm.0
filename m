Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F8E1F4717;
	Wed,  7 May 2025 05:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596693; cv=none; b=bLZG3KktwqOaa4Hww0Wz0uFUl3sfyLKi8Qha8w8GekjaMFVqFadsCBz273LMCaH8Ec4/knNmHAPVp1tXfcEppVpbGAnm0XhhmnURRpUZHh4Zx39ypT6ISnJZd6OromEqDMbqFmlafPcAyhN+pCbbQhFUAKGhKFJ5By7kDSBntYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596693; c=relaxed/simple;
	bh=3ATaZf5dBsZZ4YN98qpEvH0PLIKcTO92FLOHof5AkxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJlo9NvOVgz2QsxGsksCMwiZ0vlCGSpq/7r9PhtQ0Y2HsOB9JdjKfzZ8mHYji6OzM4yJ2TN5dYTAljnb6Syzr1zYFjxiVfCM/CH2oZEUWwWk0df2Iw65N6BKWDkoXDtFhwgbAK/4Fs+3AXsPe6QaP5anT8d1ccZJAYvCvVGDUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3i43o2Z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3i43o2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596692; x=1778132692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ATaZf5dBsZZ4YN98qpEvH0PLIKcTO92FLOHof5AkxI=;
  b=U3i43o2ZaD4+OkXeTvtBZnBqOX3MSHe8IyRmoCzl2Rxw89LreZqvf/6m
   XImjCv8cS5raostCf0tKRudzfKCjol0GKAQjQBbN+OW+Gur4v22BK2vAG
   NoSA0h07MVBtwGMJcDLgmVBC4gWI/zP0AzrnJ+bALMhEb+aAg6REOhEIz
   kLeust77/3UWoaiGTY81ysdH4mbUxZlmw9q0m41HowBn0LFl99DaP2mGb
   F0uJN7mSTHBNZYq/vwNZdW5l+90P7qTxcBYRdmp0sGX9CN+H2Qfetzweb
   MYuBRWk70+qm6bGST5hSTKRaxkDKpS9+TOFFshECt2DdGgrPw7ZlMu+od
   A==;
X-CSE-ConnectionGUID: ePhv4Q5yQG6veZJG4wOV1w==
X-CSE-MsgGUID: Ym3J5y2eQzOkUFOcblcHBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48202522"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48202522"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: IHkSUpdTQ4+tNTA3+ybgBQ==
X-CSE-MsgGUID: Q4gVwJPdSjOy5DW9XLNuGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135844094"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaF-00076R-33;
	Wed, 07 May 2025 05:44:43 +0000
Date: Wed, 7 May 2025 13:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 7/87] drivers/misc/ti_fpc202.c:287:20: error: call
 to undeclared function 'of_node_to_fwnode'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505071305.kAjxIWyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: 53bb244074f4a81f664c6c88ec64284e80bb279f [7/87] irqdomain: Drop of_node_to_fwnode()
config: arm-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250507/202505071305.kAjxIWyg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071305.kAjxIWyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071305.kAjxIWyg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/ti_fpc202.c:287:20: error: call to undeclared function 'of_node_to_fwnode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |         desc.bus_handle = of_node_to_fwnode(i2c_handle);
         |                           ^
   drivers/misc/ti_fpc202.c:287:20: note: did you mean 'of_node_to_nid'?
   include/linux/of.h:935:19: note: 'of_node_to_nid' declared here
     935 | static inline int of_node_to_nid(struct device_node *device)
         |                   ^
>> drivers/misc/ti_fpc202.c:287:18: error: incompatible integer to pointer conversion assigning to 'struct fwnode_handle *' from 'int' [-Wint-conversion]
     287 |         desc.bus_handle = of_node_to_fwnode(i2c_handle);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/of_node_to_fwnode +287 drivers/misc/ti_fpc202.c

1e5c9b1efa1c37 Romain Gantois 2025-03-06  277  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  278  static int fpc202_probe_port(struct fpc202_priv *priv, struct device_node *i2c_handle, int port_id)
1e5c9b1efa1c37 Romain Gantois 2025-03-06  279  {
1e5c9b1efa1c37 Romain Gantois 2025-03-06  280  	u16 aliases[FPC202_ALIASES_PER_PORT] = { };
1e5c9b1efa1c37 Romain Gantois 2025-03-06  281  	struct device *dev = &priv->client->dev;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  282  	struct i2c_atr_adap_desc desc = { };
1e5c9b1efa1c37 Romain Gantois 2025-03-06  283  	int ret = 0;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  284  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  285  	desc.chan_id = port_id;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  286  	desc.parent = dev;
1e5c9b1efa1c37 Romain Gantois 2025-03-06 @287  	desc.bus_handle = of_node_to_fwnode(i2c_handle);
1e5c9b1efa1c37 Romain Gantois 2025-03-06  288  	desc.num_aliases = FPC202_ALIASES_PER_PORT;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  289  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  290  	fpc202_fill_alias_table(priv->client, aliases, port_id);
1e5c9b1efa1c37 Romain Gantois 2025-03-06  291  	desc.aliases = aliases;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  292  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  293  	ret = i2c_atr_add_adapter(priv->atr, &desc);
1e5c9b1efa1c37 Romain Gantois 2025-03-06  294  	if (ret)
1e5c9b1efa1c37 Romain Gantois 2025-03-06  295  		return ret;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  296  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  297  	set_bit(port_id, priv->probed_ports);
1e5c9b1efa1c37 Romain Gantois 2025-03-06  298  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  299  	ret = fpc202_write_dev_addr(priv, port_id, 0, FPC202_REG_DEV_INVALID);
1e5c9b1efa1c37 Romain Gantois 2025-03-06  300  	if (ret)
1e5c9b1efa1c37 Romain Gantois 2025-03-06  301  		return ret;
1e5c9b1efa1c37 Romain Gantois 2025-03-06  302  
1e5c9b1efa1c37 Romain Gantois 2025-03-06  303  	return fpc202_write_dev_addr(priv, port_id, 1, FPC202_REG_DEV_INVALID);
1e5c9b1efa1c37 Romain Gantois 2025-03-06  304  }
1e5c9b1efa1c37 Romain Gantois 2025-03-06  305  

:::::: The code at line 287 was first introduced by commit
:::::: 1e5c9b1efa1c37ef3fc5c67b1c6e7025ec7b2330 misc: add FPC202 dual port controller driver

:::::: TO: Romain Gantois <romain.gantois@bootlin.com>
:::::: CC: Wolfram Sang <wsa+renesas@sang-engineering.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
