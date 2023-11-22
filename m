Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2F1CF8F;
	Wed, 22 Nov 2023 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVSK8PB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700656879; x=1732192879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=veRGPfyCLrzhXLm5HSGw7ztPNb/49l7emhkcF8MvE/0=;
  b=gVSK8PB2fiESXqYCpEPCtAxPejAA38Tvp/z1SC++5O1OTeHJsZhoSDLe
   Myw+m3w+wFE1HixGf4rg1ZUo3umGXjzNwyS/o7M6nhml2iZoXYsAnR8Nx
   9Ouq2BVhhg48cRHe56PCSkmLfLItPdJJQrNvS8VqATRlrCTcWUZF6KtxB
   JnTFvHcKErXvKnPqISJLzRXozE01PDhz60y8g8ssStTRAWJWlTaiJ9NQE
   p+L26WmH9Bc2kd+cRQckCBcxcHZ3Rg2wrEU/y8e0JM6ND8xwvWs3dqWA6
   PQYD3DzoduqV+TzXmArA8/e85LxXdFIceAG0iahfa/bH4wMvZJwI4NtUt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391814861"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="391814861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="14903875"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2023 04:41:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5mXa-0000Sq-0P;
	Wed, 22 Nov 2023 12:41:14 +0000
Date: Wed, 22 Nov 2023 20:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY
 package in DT
Message-ID: <202311221752.DrpznDkj-lkp@intel.com>
References: <20231120135041.15259-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-5-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-extend-PHY-package-API-to-support-multiple-global-address/20231120-220405
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231120135041.15259-5-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY package in DT
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311221752.DrpznDkj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221752.DrpznDkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221752.DrpznDkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/mdio/of_mdio.c:222:6: warning: variable 'child' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (rc)
               ^~
   drivers/net/mdio/of_mdio.c:260:14: note: uninitialized use occurs here
           of_node_put(child);
                       ^~~~~
   drivers/net/mdio/of_mdio.c:222:2: note: remove the 'if' if its condition is always false
           if (rc)
           ^~~~~~~
   drivers/net/mdio/of_mdio.c:192:27: note: initialize the variable 'child' to silence this warning
           struct device_node *child;
                                    ^
                                     = NULL
   1 warning generated.


vim +222 drivers/net/mdio/of_mdio.c

   179	
   180	/**
   181	 * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
   182	 * @mdio: pointer to mii_bus structure
   183	 * @np: pointer to device_node of MDIO bus.
   184	 * @owner: module owning the @mdio object.
   185	 *
   186	 * This function registers the mii_bus structure and registers a phy_device
   187	 * for each child node of @np.
   188	 */
   189	int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
   190				  struct module *owner)
   191	{
   192		struct device_node *child;
   193		bool scanphys = false;
   194		int addr, rc;
   195	
   196		if (!np)
   197			return __mdiobus_register(mdio, owner);
   198	
   199		/* Do not continue if the node is disabled */
   200		if (!of_device_is_available(np))
   201			return -ENODEV;
   202	
   203		/* Mask out all PHYs from auto probing.  Instead the PHYs listed in
   204		 * the device tree are populated after the bus has been registered */
   205		mdio->phy_mask = ~0;
   206	
   207		device_set_node(&mdio->dev, of_fwnode_handle(np));
   208	
   209		/* Get bus level PHY reset GPIO details */
   210		mdio->reset_delay_us = DEFAULT_GPIO_RESET_DELAY;
   211		of_property_read_u32(np, "reset-delay-us", &mdio->reset_delay_us);
   212		mdio->reset_post_delay_us = 0;
   213		of_property_read_u32(np, "reset-post-delay-us", &mdio->reset_post_delay_us);
   214	
   215		/* Register the MDIO bus */
   216		rc = __mdiobus_register(mdio, owner);
   217		if (rc)
   218			return rc;
   219	
   220		/* Loop over the child nodes and register a phy_device for each phy */
   221		rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
 > 222		if (rc)
   223			goto unregister;
   224	
   225		if (!scanphys)
   226			return 0;
   227	
   228		/* auto scan for PHYs with empty reg property */
   229		for_each_available_child_of_node(np, child) {
   230			/* Skip PHYs with reg property set */
   231			if (of_property_present(child, "reg"))
   232				continue;
   233	
   234			for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
   235				/* skip already registered PHYs */
   236				if (mdiobus_is_registered_device(mdio, addr))
   237					continue;
   238	
   239				/* be noisy to encourage people to set reg property */
   240				dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
   241					 child, addr);
   242	
   243				if (of_mdiobus_child_is_phy(child)) {
   244					/* -ENODEV is the return code that PHYLIB has
   245					 * standardized on to indicate that bus
   246					 * scanning should continue.
   247					 */
   248					rc = of_mdiobus_register_phy(mdio, child, addr);
   249					if (!rc)
   250						break;
   251					if (rc != -ENODEV)
   252						goto unregister;
   253				}
   254			}
   255		}
   256	
   257		return 0;
   258	
   259	unregister:
   260		of_node_put(child);
   261		mdiobus_unregister(mdio);
   262		return rc;
   263	}
   264	EXPORT_SYMBOL(__of_mdiobus_register);
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
