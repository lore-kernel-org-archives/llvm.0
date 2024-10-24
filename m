Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F82804;
	Thu, 24 Oct 2024 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729728568; cv=none; b=X5Z6YIwyP4nwnSx52Lh+cMZAs7je5nOyeUY/ywr7oWcyBAw+TWEcliCfto3DSxxdCzTdW26pohQW4u1mWjPRBwmVP55tfDWW8cN+s1gMow2OKNFDmWA6z0qTGyk5jkIdMzUvqCy6h638emt8W+QBgRxM3UXRq5TSnUShADn76mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729728568; c=relaxed/simple;
	bh=QTMmNUpTt3FtGqjkLvo7MvH2smBkY99/jJIA+AaJrhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXBQF3OtxFmNzWpyVEcKqn01gp6KPrECxwL9byojD2iBOeMAFx+7aC39DFskDtfdimU3+/qRIHSpm+K7/dmFaDNl4K4Ao16o1r+qRLtPAAX9Zt2rpGYCd9ZhqvtkKD8wcX/FDecyPWWPbcm3pdZyO05bv1sIy5tx7nROELhrqY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GusoloeI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GusoloeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729728567; x=1761264567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QTMmNUpTt3FtGqjkLvo7MvH2smBkY99/jJIA+AaJrhI=;
  b=GusoloeIoZ77K3mPkc5Ncg6An2uQJ9q9pTRQzy05HnGdPMRzoD5S8X3z
   l9xkgKeWJja05y0UQBp/J/ib1ZDVCX3nkYFW7lfsdMvVMxdHK6qkWK6ZU
   2z5rJRodef6HKBKsQq0Nx1HhCMkeRcOh+vDK0F7m5g5ZypH548oC/Aewg
   4bS7kN7BHkdet1XQVVajHT7B7TnDIMna2MdF6B0CwFZomHrXctmwzPKQL
   hz5muYQPGN5/KHyvgZ0V7mhMTYNc50Mjy8vTFmYGHREBX4K2wRzLA4OM4
   dbFOfZry4QPYb8cYAGKoDb7H1Qo2plp4e7KJt6F6iAcWKqwWOfGtEtab+
   A==;
X-CSE-ConnectionGUID: mfGydlKJRX6bBBoyFl/Y1Q==
X-CSE-MsgGUID: pqz2d0gfTDW6X9osHxS3HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29273704"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29273704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:09:25 -0700
X-CSE-ConnectionGUID: Fd4hAXleTgWT1wk0rJb8AA==
X-CSE-MsgGUID: l2R/yLqKT6uqGYLisbiwxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="84980629"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2024 17:09:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3lPl-000VjO-0S;
	Thu, 24 Oct 2024 00:09:21 +0000
Date: Thu, 24 Oct 2024 08:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 2/8] ndo_fdb_add: Shift responsibility for
 notifying to drivers
Message-ID: <202410240831.djzzgAk3-lkp@intel.com>
References: <00caa74f6dea128400472b5dec77f61b16d0f9d4.1729607879.git.petrm@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00caa74f6dea128400472b5dec77f61b16d0f9d4.1729607879.git.petrm@nvidia.com>

Hi Petr,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Machata/net-rtnetlink-Publish-rtnl_fdb_notify/20241022-225301
base:   net-next/main
patch link:    https://lore.kernel.org/r/00caa74f6dea128400472b5dec77f61b16d0f9d4.1729607879.git.petrm%40nvidia.com
patch subject: [PATCH net-next 2/8] ndo_fdb_add: Shift responsibility for notifying to drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241024/202410240831.djzzgAk3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240831.djzzgAk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240831.djzzgAk3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:19: error: use of undeclared identifier 'dev'
     427 |                 rtnl_fdb_notify(dev, addr, vid, RTM_NEWNEIGH, ndm->ndm_state);
         |                                 ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:2440:46: warning: shift count >= width of type [-Wshift-count-overflow]
    2440 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +/dev +427 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c

   393	
   394	static int qlcnic_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
   395				struct net_device *netdev,
   396				const unsigned char *addr, u16 vid, u16 flags,
   397				struct netlink_ext_ack *extack)
   398	{
   399		struct qlcnic_adapter *adapter = netdev_priv(netdev);
   400		int err = 0;
   401	
   402		if (!adapter->fdb_mac_learn)
   403			return ndo_dflt_fdb_add(ndm, tb, netdev, addr, vid, flags);
   404	
   405		if (!(adapter->flags & QLCNIC_ESWITCH_ENABLED) &&
   406		    !qlcnic_sriov_check(adapter)) {
   407			pr_info("%s: FDB e-switch is not enabled\n", __func__);
   408			return -EOPNOTSUPP;
   409		}
   410	
   411		if (ether_addr_equal(addr, adapter->mac_addr))
   412			goto out;
   413	
   414		if (is_unicast_ether_addr(addr)) {
   415			if (netdev_uc_count(netdev) < adapter->ahw->max_uc_count)
   416				err = dev_uc_add_excl(netdev, addr);
   417			else
   418				err = -ENOMEM;
   419		} else if (is_multicast_ether_addr(addr)) {
   420			err = dev_mc_add_excl(netdev, addr);
   421		} else {
   422			err = -EINVAL;
   423		}
   424	
   425	out:
   426		if (!err)
 > 427			rtnl_fdb_notify(dev, addr, vid, RTM_NEWNEIGH, ndm->ndm_state);
   428	
   429		return err;
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
