Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B7442C;
	Fri,  9 Aug 2024 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723162916; cv=none; b=PSOMzcQqKOZQHpnhlWLVvpLy8RhYfj2wig4kANCkXAK7h0MUkHzvO9UCjcimn7krh+DaH1mix0zlst197gyo+Qd6vSK5ltf1qmrLuDWpLwShlEeMi7ysoC9wr10DtgqLXUtCQicnTgV4nzDEulu+j4bll35vJBXFF/+AKszF9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723162916; c=relaxed/simple;
	bh=dCUbBEU/pS/9lZMKLGujxYOPUmdVq+lGuol5FJHFO4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HE/ASoQfGOOWaHn4TsfOWSKPigDyXqqzLqgZhp3T2RnLlviMN+jmLk+DHvw09qEdqLfRNU1MmxX6EwtBDHJPJey4sSaDUDbJzKx5cLsK0j+jD/MkpfNvg0rFpTq4k6W+YxGcODxGeo4G25RFHNU9mvKlMnLTtBRlhNcg2yNrRdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaTGkGed; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaTGkGed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723162915; x=1754698915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCUbBEU/pS/9lZMKLGujxYOPUmdVq+lGuol5FJHFO4k=;
  b=PaTGkGed2PBasrbcm12xVnRk3qblvxFpY6qPZ9z6CAuGepC9HXQA/unP
   ZDncWbNKdseV63vLRwT+NTh2QR1ARMAeZTD/qqkyZ5A6KirMvGiQv53Jb
   ZmTN2EQnIsXRG9p44hZMMxgd0iVFX/MAB3AblMfg2XsEpk8dO0klLjFxl
   FL37TPsFhpfwb9aO/UL8gGxQZ4tSlhX/FYDHUCUDllYp74hr5dCfNOjoe
   0llTYRjuhNbnbHCsojPczImm3GHTa4IrvtZvIngsENdLQiEp9nnLgUjAR
   /jjx4xqUM22C1yi3SRVokktU+ezy/uelhwxdGAcnFiUurI1cVNjYxIx2I
   w==;
X-CSE-ConnectionGUID: YxdF0JxGT5u1bJdWy03Sow==
X-CSE-MsgGUID: 4TN9DIo4ThmVW7vYzh311A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21180491"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21180491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:21:55 -0700
X-CSE-ConnectionGUID: fEz5oJjfRh6hzBM7/ABtEA==
X-CSE-MsgGUID: 4dDeRx8tSOagV1TGwuh4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="80633095"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Aug 2024 17:21:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDO1-0006ft-1R;
	Fri, 09 Aug 2024 00:21:44 +0000
Date: Fri, 9 Aug 2024 08:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 24/37]
 drivers/infiniband/hw/mlx5/main.c:3219:17: warning: variable 'portnum' is
 used uninitialized whenever 'for' loop exits because its condition is false
Message-ID: <202408090843.g93uWYj8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   8f867b8b95b4aab452108f77167fae8d7e0d5056
commit: ee9ed4c68fd8349b2c53b0b6452423944da7c822 [24/37] RDMA/mlx5: Use IB set_netdev and get_netdev functions
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240809/202408090843.g93uWYj8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 4527fba9ad6bc682eceda603150bfaec65ec6916)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090843.g93uWYj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090843.g93uWYj8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/mlx5/main.c:8:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/infiniband/hw/mlx5/main.c:12:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/infiniband/hw/mlx5/main.c:12:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/infiniband/hw/mlx5/main.c:12:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/infiniband/hw/mlx5/main.c:3219:17: warning: variable 'portnum' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
    3219 |                                 for (i = 0; i < dev->num_ports; i++) {
         |                                             ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/main.c:3229:10: note: uninitialized use occurs here
    3229 |                                                    portnum + 1);
         |                                                    ^~~~~~~
   drivers/infiniband/hw/mlx5/main.c:3219:17: note: remove the condition if it is always true
    3219 |                                 for (i = 0; i < dev->num_ports; i++) {
         |                                             ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/main.c:3210:13: note: initialize the variable 'portnum' to silence this warning
    3210 |         int portnum, i, err;
         |                    ^
         |                     = 0
   18 warnings generated.


vim +3219 drivers/infiniband/hw/mlx5/main.c

  3202	
  3203	static int lag_event(struct notifier_block *nb, unsigned long event, void *data)
  3204	{
  3205		struct mlx5_ib_dev *dev = container_of(nb, struct mlx5_ib_dev,
  3206						       lag_events);
  3207		struct mlx5_core_dev *mdev = dev->mdev;
  3208		struct mlx5_ib_port *port;
  3209		struct net_device *ndev;
  3210		int portnum, i, err;
  3211	
  3212		switch (event) {
  3213		case MLX5_DRIVER_EVENT_ACTIVE_BACKUP_LAG_CHANGE_LOWERSTATE:
  3214			ndev = data;
  3215			if (ndev) {
  3216				if (mlx5_lag_is_roce(mdev))
  3217					portnum = 0;
  3218				else { // sriov lag
> 3219					for (i = 0; i < dev->num_ports; i++) {
  3220						port = &dev->port[i];
  3221						if (port->rep && port->rep->vport ==
  3222						    MLX5_VPORT_UPLINK) {
  3223							portnum = i;
  3224							break;
  3225						}
  3226					}
  3227				}
  3228				err = ib_device_set_netdev(&dev->ib_dev, ndev,
  3229							   portnum + 1);
  3230				dev_put(ndev);
  3231				if (err)
  3232					return err;
  3233			}
  3234			break;
  3235		default:
  3236			return NOTIFY_DONE;
  3237		}
  3238		return NOTIFY_OK;
  3239	}
  3240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
