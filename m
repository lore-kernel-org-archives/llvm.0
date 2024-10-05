Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF6139578;
	Sat,  5 Oct 2024 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728133693; cv=none; b=p+9wONH28YsIo4cHOdVrDHAGlX56WECVniChDpt8swEkZQrLHfdkPXaAV4Qkj+o+GEfKQZsClNhtRovD0qwTfAWkbjKbbAAQQuMfk2IkjxZ8b39xHvo12yOKchy+LV4+wnDn1FGhdrSVQ2eItZVOREY1t2lWnFk5lq4KttfVS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728133693; c=relaxed/simple;
	bh=+o44pqABeFX6WQzGzj4ikbYxaUs6xEpUzzatHPXfIns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbjnLnngS8SGDg5Z7fpx14hlF2HH4aaHpLJ3O4jB2KApMMFfAbdo5IO5ZcHZ1THI5zLsOyH0Op74BZubvC+MOppjxwNtJAEVp6MDTzcRpSq2c2U9VkC5I4JD4VDBjYzjV4Qdi0sXuRis3BSnJ//6MnCQdLsIE16KKBUGfv3ebgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPYFiJh4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPYFiJh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728133692; x=1759669692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+o44pqABeFX6WQzGzj4ikbYxaUs6xEpUzzatHPXfIns=;
  b=JPYFiJh4ZiwZXmvQ1Fc47nqRfMk3QsFFOLNSIJodVgzyP0IjKmVOqQKz
   bsN60ZrWh9CgLScVpYBo1ztioXI7wt+Y+JPGTxCEuuLtdZjQkVIRTi9dd
   3Ll+VtcA86fvfQ8xabX1/ywBjhAHKhCk9e8HtGbqvHbHenTTjCzBN7hkC
   CNBQrdtNLl3T1WyjtwnR5f8gwcgYH5U/eJyWRv9bTG7c+PTuj+9SzgccU
   vM+di7rZsTgiFIKOMvCvGO3bYc9WpegQVP2jgqBqmb9Rg7/uJSw5Ps60N
   o6INIzzHPA/oD6MmZ5wVFI1TF12sIGly+Y0X8KHFaIH/I/0Z164t7IL2E
   A==;
X-CSE-ConnectionGUID: rNJydBGKRXGxCLik8+ChFg==
X-CSE-MsgGUID: H0OF8TESSaGSwULNHW9l5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26807005"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="26807005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 06:08:11 -0700
X-CSE-ConnectionGUID: DjD0FtFHRPaLh5lujpzM+Q==
X-CSE-MsgGUID: ajNags+XScG0RRO+MomtZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="112447335"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 06:08:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx4Vz-0002xs-0w;
	Sat, 05 Oct 2024 13:08:07 +0000
Date: Sat, 5 Oct 2024 21:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: [jgunthorpe:for-vasant 2/10]
 drivers/net/ethernet/intel/e1000e/netdev.c:4460:22: warning: shift count >=
 width of type
Message-ID: <202410052054.U16MM7J8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-vasant
head:   8aa0df6ce0d35430baeac4ee5e0ea77f82cf2ead
commit: 9d7523756e213acff67f3b9264211becfbb5b7bb [2/10] iommu: Introduce iommu_paging_domain_alloc_flags()
config: powerpc-currituck_defconfig (https://download.01.org/0day-ci/archive/20241005/202410052054.U16MM7J8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052054.U16MM7J8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052054.U16MM7J8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/e1000e/netdev.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/intel/e1000e/netdev.c:9:
   In file included from include/linux/pci.h:2079:
   In file included from arch/powerpc/include/asm/pci.h:17:
   In file included from arch/powerpc/include/asm/pci-bridge.h:11:
   include/linux/iommu.h:1103:1: error: declaration of anonymous struct must be a definition
    1103 | struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
         | ^
   include/linux/iommu.h:1103:1: warning: declaration does not declare anything [-Wmissing-declarations]
>> drivers/net/ethernet/intel/e1000e/netdev.c:4460:22: warning: shift count >= width of type [-Wshift-count-overflow]
    4460 |                 adapter->cc.mask = CYCLECOUNTER_MASK(64);
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
      14 | #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
         |                                                           ^ ~~~~~~
   drivers/net/ethernet/intel/e1000e/netdev.c:7386:46: warning: shift count >= width of type [-Wshift-count-overflow]
    7386 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   4 warnings and 1 error generated.


vim +4460 drivers/net/ethernet/intel/e1000e/netdev.c

98942d70538a16 drivers/net/ethernet/intel/e1000e/netdev.c Miroslav Lichvar 2018-11-09  4430  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4431  /**
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4432   * e1000_sw_init - Initialize general software structures (struct e1000_adapter)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4433   * @adapter: board private structure to initialize
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4434   *
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4435   * e1000_sw_init initializes the Adapter private data structure.
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4436   * Fields are initialized based on PCI device information and
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4437   * OS network device settings (MTU size).
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4438   **/
9f9a12f8ca7983 drivers/net/ethernet/intel/e1000e/netdev.c Bill Pemberton   2012-12-03  4439  static int e1000_sw_init(struct e1000_adapter *adapter)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4440  {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4441  	struct net_device *netdev = adapter->netdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4442  
8084b86dcfbc4b drivers/net/ethernet/intel/e1000e/netdev.c Alexander Duyck  2015-05-02  4443  	adapter->rx_buffer_len = VLAN_ETH_FRAME_LEN + ETH_FCS_LEN;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4444  	adapter->rx_ps_bsize0 = 128;
8084b86dcfbc4b drivers/net/ethernet/intel/e1000e/netdev.c Alexander Duyck  2015-05-02  4445  	adapter->max_frame_size = netdev->mtu + VLAN_ETH_HLEN + ETH_FCS_LEN;
318a94d68979cb drivers/net/e1000e/netdev.c                Jeff Kirsher     2008-03-28  4446  	adapter->min_frame_size = ETH_ZLEN + ETH_FCS_LEN;
55aa69854a93d7 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2011-12-16  4447  	adapter->tx_ring_count = E1000_DEFAULT_TXD;
55aa69854a93d7 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2011-12-16  4448  	adapter->rx_ring_count = E1000_DEFAULT_RXD;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4449  
67fd4fcb78a7ce drivers/net/e1000e/netdev.c                Jeff Kirsher     2011-01-07  4450  	spin_lock_init(&adapter->stats64_lock);
67fd4fcb78a7ce drivers/net/e1000e/netdev.c                Jeff Kirsher     2011-01-07  4451  
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan      2008-08-26  4452  	e1000e_set_interrupt_capability(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4453  
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan      2008-08-26  4454  	if (e1000_alloc_queues(adapter))
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan      2008-08-26  4455  		return -ENOMEM;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4456  
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4457  	/* Setup hardware time stamping cyclecounter */
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4458  	if (adapter->flags & FLAG_HAS_HW_TIMESTAMP) {
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4459  		adapter->cc.read = e1000e_cyclecounter_read;
4d045b4c06b1f7 drivers/net/ethernet/intel/e1000e/netdev.c Richard Cochran  2015-01-02 @4460  		adapter->cc.mask = CYCLECOUNTER_MASK(64);
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4461  		adapter->cc.mult = 1;
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4462  		/* cc.shift set in e1000e_get_base_tininca() */
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4463  
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4464  		spin_lock_init(&adapter->systim_lock);
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4465  		INIT_WORK(&adapter->tx_hwtstamp_work, e1000e_tx_hwtstamp_work);
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4466  	}
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4467  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4468  	/* Explicitly disable IRQ since the NIC can be in any state. */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4469  	e1000_irq_disable(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4470  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4471  	set_bit(__E1000_DOWN, &adapter->state);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4472  	return 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4473  }
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4474  

:::::: The code at line 4460 was first introduced by commit
:::::: 4d045b4c06b1f7d65d8e69d39821dcfaa783feea e1000e: convert to CYCLECOUNTER_MASK macro.

:::::: TO: Richard Cochran <richardcochran@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
