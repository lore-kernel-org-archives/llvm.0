Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289253B775E;
	Mon, 15 Jun 2026 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564517; cv=none; b=K/3tqBWUnxlugU2STEaJy/wN+8dcHg/2fN6mOAskksYRH9pMFKy+4l919ISrf8rVyBeCtpaoVfAI5bVU1RVhcTpIZ79O6plrqhsWbKex82lNHWcn+HkEPu8bd0fq9BlgzUCxEpZJ/GksfbVbt3wmqeyJiNsRVXuJV1m2hg2HTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564517; c=relaxed/simple;
	bh=CSh4RZZ6ovAF3dtUMLB5BD0uw5TCy5j5+If8wW+IJRI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzsHprUCY1pNnB2RzaXyRWjmFp15TZPe9smoXamTuXEbkJST5AoK3HyiJNlSxUad4H+6ZXQjNPfXAqvuHFdxYKWAEL+YReh9fg2oUwZmj3/jvpR9EUjpgu6U4MCVVgokPenNn7nGedrIeVFIKfGcoX9ENYXh6LrJxh90WUHq6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9YhGnn2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9YhGnn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781564517; x=1813100517;
  h=date:from:to:cc:subject:message-id;
  bh=CSh4RZZ6ovAF3dtUMLB5BD0uw5TCy5j5+If8wW+IJRI=;
  b=H9YhGnn2oH0KmGQQvKDQxD4iuynvELz2R92NXrpH4wzYDqhc+CBVeeBx
   ZtGvm9rRqjtFk20Y9sCgMK943o/arSIaT/tLlpn++gEBNfqp+RbP/nMuA
   F6828LyIWVziuDhxwjkYifUdSv6m3lf4LyuyyUS0UDOAIp3uN8C3mXATt
   eiYEI/dYbRlvKXWiIVR1hEup4eoUoKsqH/9CFTd0zYBRT83hFHf1//iSx
   5fwxMjtKgqXeM104WPkC6yA+vJufmgpLjS+0MN8Jl1qmERd7SrXrHAOWz
   MckOP5JLALhmDoICywDDiXdcLJELoS3eKeT40L1U1aOdx0FFjwaw3oO/N
   A==;
X-CSE-ConnectionGUID: qbEH77+sTKijj2UWwabg7A==
X-CSE-MsgGUID: G9+qAG+URx+5+Ag30p3tkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99737715"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="99737715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 16:01:54 -0700
X-CSE-ConnectionGUID: Pg7Cm88DTVKOB/pMzB5GtA==
X-CSE-MsgGUID: HCWP6rHOSp60sOi1Pcka9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="244701875"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2026 16:01:52 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZGJR-000000004zv-3L6L;
	Mon, 15 Jun 2026 23:01:49 +0000
Date: Tue, 16 Jun 2026 01:01:01 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/phy/phylink.c:1983:34: warning: variable 'pl' is
 uninitialized when used here
Message-ID: <202606160043.ahaHDwRS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20260615-212009
head:   10bf93a42ff6fa44dfd5bc9e6f71cca15ba1750a
commit: b4845a8d884960b6aa5c8e16baa2604017e93fb9 net: phylink: introduce internal phylink PCS handling
date:   10 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/202606160043.ahaHDwRS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160043.ahaHDwRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160043.ahaHDwRS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:1983:34: warning: variable 'pl' is uninitialized when used here [-Wuninitialized]
    1983 |         if (config->num_possible_pcs && pl->mac_ops->mac_select_pcs) {
         |                                         ^~
   drivers/net/phy/phylink.c:1969:20: note: initialize the variable 'pl' to silence this warning
    1969 |         struct phylink *pl;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +/pl +1983 drivers/net/phy/phylink.c

  1946	
  1947	/**
  1948	 * phylink_create() - create a phylink instance
  1949	 * @config: a pointer to the target &struct phylink_config
  1950	 * @fwnode: a pointer to a &struct fwnode_handle describing the network
  1951	 *	interface
  1952	 * @iface: the desired link mode defined by &typedef phy_interface_t
  1953	 * @mac_ops: a pointer to a &struct phylink_mac_ops for the MAC.
  1954	 *
  1955	 * Create a new phylink instance, and parse the link parameters found in @np.
  1956	 * This will parse in-band modes, fixed-link or SFP configuration.
  1957	 *
  1958	 * Note: the rtnl lock must not be held when calling this function.
  1959	 *
  1960	 * Returns a pointer to a &struct phylink, or an error-pointer value. Users
  1961	 * must use IS_ERR() to check for errors from this function.
  1962	 */
  1963	struct phylink *phylink_create(struct phylink_config *config,
  1964				       const struct fwnode_handle *fwnode,
  1965				       phy_interface_t iface,
  1966				       const struct phylink_mac_ops *mac_ops)
  1967	{
  1968		struct phylink_pcs *pcs;
  1969		struct phylink *pl;
  1970		int ret;
  1971	
  1972		/* Validate the supplied configuration */
  1973		if (phy_interface_empty(config->supported_interfaces)) {
  1974			dev_err(config->dev,
  1975				"phylink: error: empty supported_interfaces\n");
  1976			return ERR_PTR(-EINVAL);
  1977		}
  1978	
  1979		/*
  1980		 * Make sure either PCS internal validation or .mac_select_pcs
  1981		 * is used. Return error if both are defined.
  1982		 */
> 1983		if (config->num_possible_pcs && pl->mac_ops->mac_select_pcs) {
  1984			dev_err(config->dev,
  1985				"phylink: error: either phylink_config .num_possible_pcs or .mac_select_pcs must be used\n");
  1986			return ERR_PTR(-EINVAL);
  1987		}
  1988	
  1989		pl = kzalloc_obj(*pl);
  1990		if (!pl)
  1991			return ERR_PTR(-ENOMEM);
  1992	
  1993		mutex_init(&pl->phydev_mutex);
  1994		mutex_init(&pl->state_mutex);
  1995		INIT_WORK(&pl->resolve, phylink_resolve);
  1996		INIT_LIST_HEAD(&pl->pcs_list);
  1997	
  1998		/* Fill the PCS list with available PCS from phylink config */
  1999		ret = phylink_fill_available_pcs(pl, config);
  2000		if (ret < 0) {
  2001			kfree(pl);
  2002			return ERR_PTR(ret);
  2003		}
  2004	
  2005		/* Link available PCS to phylink */
  2006		list_for_each_entry(pcs, &pl->pcs_list, list)
  2007			pcs->phylink = pl;
  2008	
  2009		phy_interface_copy(pl->supported_interfaces,
  2010				   config->supported_interfaces);
  2011	
  2012		/* Update supported interfaces */
  2013		list_for_each_entry(pcs, &pl->pcs_list, list)
  2014			phy_interface_or(pl->supported_interfaces,
  2015					 pl->supported_interfaces,
  2016					 pcs->supported_interfaces);
  2017	
  2018		pl->config = config;
  2019		if (config->type == PHYLINK_NETDEV) {
  2020			pl->netdev = to_net_dev(config->dev);
  2021			netif_carrier_off(pl->netdev);
  2022		} else if (config->type == PHYLINK_DEV) {
  2023			pl->dev = config->dev;
  2024		} else {
  2025			kfree(pl);
  2026			return ERR_PTR(-EINVAL);
  2027		}
  2028	
  2029		pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
  2030		pl->mac_supports_eee = pl->mac_supports_eee_ops &&
  2031				       pl->config->lpi_capabilities &&
  2032				       !phy_interface_empty(pl->config->lpi_interfaces);
  2033	
  2034		/* Set the default EEE configuration */
  2035		pl->eee_cfg.eee_enabled = pl->config->eee_enabled_default;
  2036		pl->eee_cfg.tx_lpi_enabled = pl->eee_cfg.eee_enabled;
  2037		pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;
  2038	
  2039		pl->phy_state.interface = iface;
  2040		pl->link_interface = iface;
  2041		if (iface == PHY_INTERFACE_MODE_MOCA)
  2042			pl->link_port = PORT_BNC;
  2043		else
  2044			pl->link_port = PORT_MII;
  2045		pl->link_config.interface = iface;
  2046		pl->link_config.pause = MLO_PAUSE_AN;
  2047		pl->link_config.speed = SPEED_UNKNOWN;
  2048		pl->link_config.duplex = DUPLEX_UNKNOWN;
  2049		pl->pcs_state = PCS_STATE_DOWN;
  2050		pl->mac_ops = mac_ops;
  2051		__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
  2052		timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
  2053	
  2054		linkmode_fill(pl->supported);
  2055		linkmode_copy(pl->link_config.advertising, pl->supported);
  2056		phylink_validate(pl, pl->supported, &pl->link_config);
  2057	
  2058		ret = phylink_parse_mode(pl, fwnode);
  2059		if (ret < 0) {
  2060			kfree(pl);
  2061			return ERR_PTR(ret);
  2062		}
  2063	
  2064		if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
  2065			ret = phylink_parse_fixedlink(pl, fwnode);
  2066			if (ret < 0) {
  2067				kfree(pl);
  2068				return ERR_PTR(ret);
  2069			}
  2070		}
  2071	
  2072		pl->req_link_an_mode = pl->cfg_link_an_mode;
  2073	
  2074		ret = phylink_register_sfp(pl, fwnode);
  2075		if (ret < 0) {
  2076			kfree(pl);
  2077			return ERR_PTR(ret);
  2078		}
  2079	
  2080		return pl;
  2081	}
  2082	EXPORT_SYMBOL_GPL(phylink_create);
  2083	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
