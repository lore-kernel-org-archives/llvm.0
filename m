Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9AB248886;
	Tue, 16 Jun 2026 01:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574837; cv=none; b=L19/ZapO5P8JzGejB3RZp63s9CzY+oGEzza4iU6Wpk5P+MkRRX3ZIBWCFlL1Px3qvMKFTDrso0L4ZSAqSMKFOoOACPvOmT1luXDAR6P6IlLrTSo+fb7rE3l5DcoEwYXDSmJf9aRe0LoKTgOpEjsVL59Pt+od9ZIu8tbCOGTIazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574837; c=relaxed/simple;
	bh=c0fGTUzVSCMd1KDXVd4fqIwkb1qp+gTtFUIXA2U576E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnsKlZDxXQ9UvKZLI3+wKaTEudUSN7I0alJfdERu0fs8gl+yOYksgXRAh/pU/iqYj4nley825SELoxCod7gjPV1F0sIFoaYZ2yHP75lXVWIJPGWTkf/dknoKFAz7zntda2UoCtaVlOs9N10F7vUqgvpIgTMAIx9+9dPUHu5UTiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0ObOFHB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0ObOFHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781574836; x=1813110836;
  h=date:from:to:cc:subject:message-id;
  bh=c0fGTUzVSCMd1KDXVd4fqIwkb1qp+gTtFUIXA2U576E=;
  b=I0ObOFHBr5RpLVcfSxy5Q0GmqBoapXKGLT9F5OxfiifeuGjbFDKAsV+r
   cVFVValWXheKdpQ7jRfIOlsLkWVRv+r9sPad9Ugts3ep7JK2oVnT11uTj
   ATXwnkT2Q2cguVBjpxOiV8jmioHx7mmmvnOv6nZKYQKUnGMxf27/oHzxg
   dktPcT89SSa4yNlXuYzZZ9UI/qrY9KNDe2VD7AHii0KmabKC4TM70tQWI
   w9QiqFgkSTQbhvnuSQjZSui3iYNYs2LEXQ9dSHYv4LOwuhohhcgfAI6FE
   oqrbJeH20cmq4hiwiIERZAS3lTK+vGrGAWZcH0uUKdPbPsmn12CeQSVli
   w==;
X-CSE-ConnectionGUID: W43tLX+0QqmnZ/E3DQMM8Q==
X-CSE-MsgGUID: lIFayG46SLC08UtYuQ/zvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86229911"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="86229911"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 18:53:55 -0700
X-CSE-ConnectionGUID: hQMSHub1Tue2KEJ3dvjf3A==
X-CSE-MsgGUID: 4Rj1ItxNSHaGxnt7zGBtaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="271695195"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jun 2026 18:53:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZIzv-0000000051t-2D8z;
	Tue, 16 Jun 2026 01:53:51 +0000
Date: Tue, 16 Jun 2026 03:53:45 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/phy/phylink.c:2209:3: error: call to undeclared
 function 'unregister_fwnode_pcs_notifier'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606160351.gbTsXg5I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20260615-212009
head:   10bf93a42ff6fa44dfd5bc9e6f71cca15ba1750a
commit: fc6fa24f5fd3fbc958ba44beefce3dea9843a70b net: phylink: support late PCS provider attach
date:   13 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/202606160351.gbTsXg5I-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160351.gbTsXg5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160351.gbTsXg5I-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phylink.c:2083:34: warning: variable 'pl' is uninitialized when used here [-Wuninitialized]
    2083 |         if (config->num_possible_pcs && pl->mac_ops->mac_select_pcs) {
         |                                         ^~
   drivers/net/phy/phylink.c:2069:20: note: initialize the variable 'pl' to silence this warning
    2069 |         struct phylink *pl;
         |                           ^
         |                            = NULL
>> drivers/net/phy/phylink.c:2209:3: error: call to undeclared function 'unregister_fwnode_pcs_notifier'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2209 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
         |                 ^
   drivers/net/phy/phylink.c:2209:3: note: did you mean 'register_fwnode_pcs_notifier'?
   include/linux/pcs/pcs.h:104:19: note: 'register_fwnode_pcs_notifier' declared here
     104 | static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |                   ^
   1 warning and 1 error generated.


vim +/unregister_fwnode_pcs_notifier +2209 drivers/net/phy/phylink.c

  2189	
  2190	/**
  2191	 * phylink_destroy() - cleanup and destroy the phylink instance
  2192	 * @pl: a pointer to a &struct phylink returned from phylink_create()
  2193	 *
  2194	 * Destroy a phylink instance. Any PHY that has been attached must have been
  2195	 * cleaned up via phylink_disconnect_phy() prior to calling this function.
  2196	 *
  2197	 * Note: the rtnl lock must not be held when calling this function.
  2198	 */
  2199	void phylink_destroy(struct phylink *pl)
  2200	{
  2201		struct phylink_pcs *pcs, *tmp;
  2202	
  2203		sfp_bus_del_upstream(pl->sfp_bus);
  2204		if (pl->link_gpio)
  2205			gpiod_put(pl->link_gpio);
  2206	
  2207		/* Unregister notifier for late PCS attach */
  2208		if (pl->fwnode_pcs_nb.notifier_call)
> 2209			unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
  2210	
  2211		/* Drop link between PCS and phylink */
  2212		list_for_each_entry(pcs, &pl->pcs_list, list)
  2213			pcs->phylink = NULL;
  2214	
  2215		/* Remove every PCS from phylink PCS list */
  2216		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
  2217			list_del(&pcs->list);
  2218	
  2219		cancel_work_sync(&pl->resolve);
  2220		kfree(pl);
  2221	}
  2222	EXPORT_SYMBOL_GPL(phylink_destroy);
  2223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
