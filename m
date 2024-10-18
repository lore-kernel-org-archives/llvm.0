Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BD713BC26;
	Fri, 18 Oct 2024 04:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729224911; cv=none; b=ZGlkjl3J400QbeZqZpMinu5VERnrCZNiGVQOrfxQrutJjt+IA3kkqYST2+EFswpYkHn5Pe+pe2gUro4/hwJL4EHEFi0WI0PQTnnmAmYknf+iAdHnMC2rgVT7+PTMkjtDwy2EQbVuTLCfaa+uP5MEZqTmWuOf34vZoVzgfQr4Y+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729224911; c=relaxed/simple;
	bh=FbQqc1zQSgkYKn9lIqCD8eHE5RYQPBRfj23Mrk7HTWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpLmuqndCBGa4p/NYMtUptnFZjoe+kByrt7P7ZHRo8nvrkGGic7/idaXFP/r5pcR1Tpve5zbKU04Vb69tqBP7DVkQd4Ui7rmPfXOE1rpSKVcGMG6WxoTD9pF9yXTZESncP2BX2F4JJo/H2n7/5ZBStDQkojbuwBbn55PAVbuayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PviSbnGN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PviSbnGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729224910; x=1760760910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbQqc1zQSgkYKn9lIqCD8eHE5RYQPBRfj23Mrk7HTWU=;
  b=PviSbnGNTAEJpLHiJlHUjGwmcTxD8upxdoVmblvm9ub8bg+VGZh2xZuB
   36wyA2e5y1Vxf6dy+mkFW6Um6aI8qgTHoiBUzBAVWCrk3IHZCpY895FM/
   ojsXePH/4Q7L2i5eO890GTiBLkwPme+AfcESrF5o7mi5bfYsDw8YAy8tl
   2LpSQ5bChItCF3xtFz0m4rVra/evzxklIOf4K5it9XCXGdU5n1IZ0SM3H
   3uJDOMbN1St9gxNdcOKBlc1ebx8LqxMVQNDOkW0zI2dsdc0p0ZLdR2sma
   hcX5WoZcKdFtbSjjOOqz+ledW//hKTE8w5MkxVhVlEQk37DgAPXL2tv6k
   A==;
X-CSE-ConnectionGUID: iPKAlen8RcOrLs3iQcgA6w==
X-CSE-MsgGUID: vm8vwB8jTxy255D/kXKKrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28621689"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28621689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:15:10 -0700
X-CSE-ConnectionGUID: Q9u/UBQjSDWMD21Yh50Xmg==
X-CSE-MsgGUID: 8mfI0yr8R/21HKhCUmlGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="109569637"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 21:15:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1eOD-000NFv-1o;
	Fri, 18 Oct 2024 04:15:01 +0000
Date: Fri, 18 Oct 2024 12:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Amit Cohen <amcohen@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 28/41]
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:19: error: use of
 undeclared identifier 'dev'
Message-ID: <202410181221.6D97Ylog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   c70959e2f11b805035442d8a222cc9e8a18c2b84
commit: dc3c6de632d0a35d3e4a1b8416d8941f113c156a [28/41] ndo_fdb_add: Shift responsibility for notifying to drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241018/202410181221.6D97Ylog-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181221.6D97Ylog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181221.6D97Ylog-lkp@intel.com/

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
