Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85C33D1;
	Sun, 20 Oct 2024 01:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729389317; cv=none; b=mnyV5NiXAXw/oz/O67n2/QBwUrt191yRsn+sL+SChargU053QKbewluTxEopNEo8Xe2163LqlHUwjVJU7feRahBa/eJJ7l26wudXruTzPC+wy7tfnOimQmmRD4kYBayZujzbxRwrHJz+0oHxUEuX2d9p1siqQahsXkMG/lTfA4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729389317; c=relaxed/simple;
	bh=I9vJH/W8PUuqdSoTWuUTr9qcm+hzB8FZyAOah39SItw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0xhPkFBXAC2dcihAK1U5qv1IDyCwSLd+BsvBt2i4DNKz8uE8ZZePEaPYEFyfGxd2xHwoiPOrzG4Zq8mmP1YDCBEV9MHXUUmJGYZ7k5bHtY20H87RPJG3pRciqX3X7jAdTuLtnaIeR3ruY71zgV0xu1wU3O5M0VmBn0MpWfdNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bthivcOk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bthivcOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729389315; x=1760925315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9vJH/W8PUuqdSoTWuUTr9qcm+hzB8FZyAOah39SItw=;
  b=bthivcOkh3+0OzwrJXyAqedZjseaP6sBocb/Xry6MBOpBhJfuo7BvBBi
   LGyrb7n1uxQgrX3D/QKe72sNeJuFjEWM/YdapM4ZyYV94u1W1yU1zWGiS
   aLhUquxVdLWuLD19+w4GGpLXHgoTV7QwQ3KX0haSGDYfi55xPBOqiRJOk
   WxpsaR6eZARedgrYRK3lFDWPYbvgUxkp3UsgFg2zfHlPhXV2AxP66IHPH
   Llgwc/3YjUpUhCOBikbpux5qm4jPZFux2QxpjMmoPFg+lXEbuAPninbeN
   6FmxD91i036tH0YinNQB0nv2edihI1Jto+5J4iDpAtmAIUTPoEoMj5Ilx
   g==;
X-CSE-ConnectionGUID: 7eB1eA7xSlmCBIHKoT2DEQ==
X-CSE-MsgGUID: Yihvp1HcQN2qpfVSmJkqKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29059004"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29059004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 18:55:12 -0700
X-CSE-ConnectionGUID: N/LA9hmiTgmpJ0xXJze40A==
X-CSE-MsgGUID: j6+klyNTS4GdcNdlKj3z4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="84259687"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2024 18:55:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2L9w-000Plp-0h;
	Sun, 20 Oct 2024 01:55:08 +0000
Date: Sun, 20 Oct 2024 09:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Amit Cohen <amcohen@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 28/41]
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:19: error: use of
 undeclared identifier 'dev'
Message-ID: <202410200950.RkX3mTFG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   434a55e58cae87be301996f043f25929ad2bf403
commit: fe2143eeb389621b04e984beacbf1d900ab3127d [28/41] ndo_fdb_add: Shift responsibility for notifying to drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241020/202410200950.RkX3mTFG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200950.RkX3mTFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200950.RkX3mTFG-lkp@intel.com/

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
