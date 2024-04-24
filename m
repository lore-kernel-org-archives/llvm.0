Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F71417BB9;
	Wed, 24 Apr 2024 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713986613; cv=none; b=r7Q3TJEiHlD0FrGEIR/JBmfC1qGIlenkybWSVxDQvQNQrqTJzhaWEcSDFUMGx6LiBLftdHhi5e1FTbANwV5xnclLfS756bFyPm7u9ZMjVhrZ54KUqq9mD8Vohh42u/+RnVy2d2oD7Wnja0Erobwg8/IcPar/EOEuOATo/4CCavk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713986613; c=relaxed/simple;
	bh=a3S0pRuLWCK4cT6IPeARX7L4MZ/Pic3Y3rETSh9aGH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhQ++25GlbvX1ZDkbbGV6SPDPchGZKeGKF7eZm8KdefDaGLMiO9/fSBomJqnmkrmyBHKW4Zj2nlfCoGC/KNsbYO8V4ec8DG/atcw1Gj0SvTDCE9Zq0o/7wx3FbwlyFcexOXbSLt8Vk6ecX8ULIZbGF9f/AQ5jEet4oPb9GLFaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe7hZ/44; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe7hZ/44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713986611; x=1745522611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3S0pRuLWCK4cT6IPeARX7L4MZ/Pic3Y3rETSh9aGH4=;
  b=Oe7hZ/44LUovRYyHekCMOq70qppEAB7y+uSHTTkHGQE8CHDjUzCfc7H+
   dDaZ6BYw3RZ/0w4XSc+pmWYmmfGMesPtDs9xbiA2h/nmNkuGyQQvnQ96a
   JCn4Vg+Lu0IAFzmDovZ4W9l3W5iCzd17dKSNKfGlR9uvXx80CeoyB9uml
   QltJhiljM6Cb/Lv0HEeYzKmnasg+TC3fVDBxEoguGihLw0pD8b/p2sm0a
   i+i4Re2GykicyfZ2Mybi4CmbYWITWuCgshTibqaWUpbpZNDms4ELdzjQt
   uu+5E8b6+vKsD1qPjcU81PAg8QdTCxM/2p4FSMQFh6toRGGanOBmKHWKU
   Q==;
X-CSE-ConnectionGUID: rZBxYGE9RVGG75h9Py5NxQ==
X-CSE-MsgGUID: CSqypGL4TGSY4QB1uAwxPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9569389"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9569389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 12:23:30 -0700
X-CSE-ConnectionGUID: 0hhcslXwSYaFMEwtxsm6rA==
X-CSE-MsgGUID: PSJZ+t1DRTCOrKA221S2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="56001562"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2024 12:23:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rziDG-0001aI-0O;
	Wed, 24 Apr 2024 19:23:26 +0000
Date: Thu, 25 Apr 2024 03:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jianbo Liu <jianbol@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Subject: [leon-rdma:rdma-next 9/11]
 drivers/net/ethernet/mellanox/mlx5/core/wc.c:409:23: error: no member named
 'parent_mdev' in 'struct mlx5_priv'
Message-ID: <202404250335.1fx0Fixl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   b037a9b68f9d91e3dd0fc7dc7ad916ad5a6fa8b2
commit: 2aefb0d55636a2b5744a6588d9bebcf782d17b28 [9/11] net/mlx5: Reimplement write combining test
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240425/202404250335.1fx0Fixl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250335.1fx0Fixl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250335.1fx0Fixl-lkp@intel.com/

Note: the leon-rdma/rdma-next HEAD b037a9b68f9d91e3dd0fc7dc7ad916ad5a6fa8b2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/wc.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/mellanox/mlx5/core/wc.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/mellanox/mlx5/core/wc.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/mellanox/mlx5/core/wc.c:5:
   In file included from include/linux/mlx5/transobj.h:36:
   In file included from include/linux/mlx5/driver.h:38:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/wc.c:409:23: error: no member named 'parent_mdev' in 'struct mlx5_priv'
     409 |                 parent = mdev->priv.parent_mdev;
         |                          ~~~~~~~~~~ ^
   17 warnings and 1 error generated.


vim +409 drivers/net/ethernet/mellanox/mlx5/core/wc.c

   382	
   383	bool mlx5_wc_support_get(struct mlx5_core_dev *mdev)
   384	{
   385		struct mlx5_core_dev *parent = NULL;
   386	
   387		if (!MLX5_CAP_GEN(mdev, bf)) {
   388			mlx5_core_dbg(mdev, "BlueFlame not supported\n");
   389			goto out;
   390		}
   391	
   392		if (!MLX5_CAP_GEN(mdev, log_max_sq)) {
   393			mlx5_core_dbg(mdev, "SQ not supported\n");
   394			goto out;
   395		}
   396	
   397		if (mdev->wc_state != MLX5_WC_STATE_UNINITIALIZED)
   398			/* No need to lock anything as we perform WC test only
   399			 * once for whole device and was already done.
   400			 */
   401			goto out;
   402	
   403		mutex_lock(&mdev->wc_state_lock);
   404	
   405		if (mdev->wc_state != MLX5_WC_STATE_UNINITIALIZED)
   406			goto unlock;
   407	
   408		if (mlx5_core_is_sf(mdev))
 > 409			parent = mdev->priv.parent_mdev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
