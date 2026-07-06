Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172D3AB496;
	Mon,  6 Jul 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359111; cv=none; b=adcMxpAyNE1wBNcW/vEzM1ue/R07kT8ahoK9vJgjvMu0HCS4bO9e1FRfJmtTt5MFxcHWjNoYHhetsXA27jBrA80EHO5VoYFZ7+SOAy81381B8cTIto62GLPmdGkMi5AXt2dyCffAT7ADVaG3PiZ6Q/jtl3RK8PhH4IWAAdy6uKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359111; c=relaxed/simple;
	bh=WrNRJJ2EoNtOxmubTFXzaPxi3V3HPOQ9SHNhTk3Dlls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fjTxDKQKg1ZIaIqHbCjv2V/FgiOT36LIcvv831osyX+OlDLi0ymvQKSp5pW5f+mbBLD5BC+HYvnkHLkRMKir1HFbL2GcDIGC+1wM6CGAEUVedfRRciYBiRgR8ct+4YEN60nc99g55/gh5rDwY3t1K99dnSXdjTdCgazQVmENfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTaWha83; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTaWha83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783359109; x=1814895109;
  h=date:from:to:cc:subject:message-id;
  bh=WrNRJJ2EoNtOxmubTFXzaPxi3V3HPOQ9SHNhTk3Dlls=;
  b=FTaWha83zuUSMMGSw7aHgkwA93qwx+OSsJeIn847e7Laz+NUxN19kJxE
   hicD7KxOJgd3TB7ulXlKsTkrESBGd7uMHG7jRjbLZe3j0YANhTe3YGZw/
   mM8WCy+rANqip4gXGvs3Ud+3VMoZJbJG7hlfKWraFrvDHcQpK1ycOjzKB
   e2UyypTWVdtDm0s/1p4KMVQ3EUIUpoeIGjNNQwkkaTy6VVDlCXbZ5xf8b
   pZ3W2VR6xn9pXjWUWO/3M0BocKqv9f+z+fqWOLnCp/f65vX9Y6sxjvnYB
   pF/2aKR1N6SepDmJj8NppXfTcHFBsDz56iWr0Ma4N4WM44sPU9CB/PuKF
   A==;
X-CSE-ConnectionGUID: Aw0FNNr2ReaJ/8zJpSWoXQ==
X-CSE-MsgGUID: OVTOtKLTSziBZ7SNsDuMvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="106799093"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="106799093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 10:31:49 -0700
X-CSE-ConnectionGUID: vB6H+mcNQDmN3wB1sK2tBw==
X-CSE-MsgGUID: vknEVmtaTASsAlislVky4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="276980290"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2026 10:31:47 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgnAW-000000002FZ-3hfY;
	Mon, 06 Jul 2026 17:31:44 +0000
Date: Mon, 06 Jul 2026 19:30:46 +0200
From: kernel test robot <lkp@intel.com>
To: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:7572:4: error:
 call to undeclared function 'e_error'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202607061929.RJUqNzb7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jedrzej-Jagielski/ixgbe-E610-force-phy-link-to-get-down-when-interface-is-down/20260706-180351
head:   b8e03a74851f0fa738c3784da3c3e8df9b0a30ce
commit: b8e03a74851f0fa738c3784da3c3e8df9b0a30ce ixgbe: E610: force phy link to get down when interface is down
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260706/202607061929.RJUqNzb7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061929.RJUqNzb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061929.RJUqNzb7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:7572:4: error: call to undeclared function 'e_error'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7572 |                         e_error(drv, "Cannot set PHY link down\n");
         |                         ^
>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:7572:12: error: use of undeclared identifier 'drv'
    7572 |                         e_error(drv, "Cannot set PHY link down\n");
         |                                 ^~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8928:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8928 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_HW_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8929 |                                    IXGBE_ADVTXD_DCMD_VLE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8932:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8932 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8933 |                                    IXGBE_ADVTXD_DCMD_TSE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8936:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8936 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8937 |                                    IXGBE_ADVTXD_MAC_TSTAMP);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8940:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8940 |         cmd_type ^= IXGBE_SET_FLAG(skb->no_fcs, 1, IXGBE_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8951:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8951 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8952 |                                         IXGBE_TX_FLAGS_CSUM,
         |                                         ~~~~~~~~~~~~~~~~~~~~
    8953 |                                         IXGBE_ADVTXD_POPTS_TXSM);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8956:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8956 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8957 |                                         IXGBE_TX_FLAGS_IPV4,
         |                                         ~~~~~~~~~~~~~~~~~~~~
    8958 |                                         IXGBE_ADVTXD_POPTS_IXSM);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8961:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8961 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8962 |                                         IXGBE_TX_FLAGS_IPSEC,
         |                                         ~~~~~~~~~~~~~~~~~~~~~
    8963 |                                         IXGBE_ADVTXD_POPTS_IPSEC);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8969:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8969 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8970 |                                         IXGBE_TX_FLAGS_CC,
         |                                         ~~~~~~~~~~~~~~~~~~
    8971 |                                         IXGBE_ADVTXD_CC);
         |                                         ~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8918:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8918 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   8 warnings and 2 errors generated.


vim +/e_error +7572 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c

  7544	
  7545	/**
  7546	 * ixgbe_close - Disables a network interface
  7547	 * @netdev: network interface device structure
  7548	 *
  7549	 * Returns 0, this is not allowed to fail
  7550	 *
  7551	 * The close entry point is called when an interface is de-activated
  7552	 * by the OS.  The hardware is still under the drivers control, but
  7553	 * needs to be disabled.  A global MAC reset is issued to stop the
  7554	 * hardware, and all transmit and receive resources are freed.
  7555	 **/
  7556	int ixgbe_close(struct net_device *netdev)
  7557	{
  7558		struct ixgbe_adapter *adapter = ixgbe_from_netdev(netdev);
  7559	
  7560		ixgbe_ptp_stop(adapter);
  7561	
  7562		if (netif_device_present(netdev))
  7563			ixgbe_close_suspend(adapter);
  7564	
  7565		ixgbe_fdir_filter_exit(adapter);
  7566	
  7567		if (adapter->flags2 & IXGBE_FLAG2_LINK_DOWN_ON_CLOSE) {
  7568			int err;
  7569	
  7570			err = ixgbe_disable_phy_link(&adapter->hw);
  7571			if (err)
> 7572				e_error(drv, "Cannot set PHY link down\n");
  7573	
  7574			ixgbe_handle_link_down(adapter);
  7575		}
  7576	
  7577		ixgbe_release_hw_control(adapter);
  7578	
  7579		return 0;
  7580	}
  7581	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
