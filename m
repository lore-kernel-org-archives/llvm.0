Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382FD1CAB1;
	Fri, 26 Jul 2024 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721962479; cv=none; b=qrSJcF7j/CUvad2/kbMNr/cHAetGk8B3Y3idyHJ2v4S9rYR8IVYme/+N8BboamG2ultpM8ilzdOYP9WQ+on0FleRfhX7J+jHmEjV9DTheErmagFBJuBBrT9b3XR6OwzfrX+pSloeWVt/Om+wdJ7DPEUhtMdpXBRymb5KR3Q1JRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721962479; c=relaxed/simple;
	bh=/PgB+88hhm3S3Mk0zPqdhBecXyJCYcC80yqe8QtPREM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4z//CTJltJYuPQGV5ZNvGwgdVb2cz7/2TA6569IOwBUDW/VGydhPkOSwadkckVx1VC8h1UHU3hT1bogUqDoFj0mqmoaopzAH7f2U4IX5mUIiCiuZEufMh+7luK+pUlMQ2mEJKNc7jWW1M7NX2F23Z+iQqMzmddXeWucoR56MNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb4DyyUd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb4DyyUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721962477; x=1753498477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PgB+88hhm3S3Mk0zPqdhBecXyJCYcC80yqe8QtPREM=;
  b=Yb4DyyUdOhiT8J2EsrSgWYW67UqKFQP9e6PTqfV1wU5OElnLHZXXpdFK
   x5/HJW3ynf3Ygea+5h9CuK1P0p/idbBF5XMsYB8aFbQmSLxpuHzNxJzvw
   4GbZml7vI4y0C785hfLrVEBJHPXbRG/CObJBZp9MjHlYejyy7j2t9GNcb
   wn5IKh0RuKW/wMsDCKw+K7OSILS8AXQAIxuqAuKzuTrf1xwiB6geDenmS
   k3pHWVulkg8mLD3pixAZ04ySCcyFtzpT2A76RmP4xnbnnV/Z5dzROont2
   AuyCJCKqWpT3BkTkt39LzwUxEnTmrShn29HbX6Bsf4O7pb5V1FeeJwffM
   w==;
X-CSE-ConnectionGUID: nONqFaeWRhuH9lTUyRuWcg==
X-CSE-MsgGUID: 5ZDrLpg2S5iyxSzyRvR64w==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42268779"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="42268779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 19:54:36 -0700
X-CSE-ConnectionGUID: qtjGT05/R6KWaCiqMxyIUw==
X-CSE-MsgGUID: 6rUEs2VlQ1uOxS4HNIplvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="58244244"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jul 2024 19:54:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXB6G-000olu-30;
	Fri, 26 Jul 2024 02:54:32 +0000
Date: Fri, 26 Jul 2024 10:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v2 7/23] drivers/iommu/dma-iommu.c:1829:6:
 error: call to undeclared function 'cc_platform_has'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202407261007.pjOZIhA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v2
head:   b957d69a55716514597d798fb534c7df6a7619f5
commit: 5d7d3730d83d48c6ae1c71882b9cabd4126edcff [7/23] iommu/dma: Add check if IOVA can be used
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240726/202407261007.pjOZIhA2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261007.pjOZIhA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261007.pjOZIhA2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/dma-iommu.c:11:
   In file included from include/linux/acpi_iort.h:10:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
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
   In file included from drivers/iommu/dma-iommu.c:13:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
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
   In file included from drivers/iommu/dma-iommu.c:13:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
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
   In file included from drivers/iommu/dma-iommu.c:13:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
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
>> drivers/iommu/dma-iommu.c:1829:6: error: call to undeclared function 'cc_platform_has'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1829 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
         |             ^
>> drivers/iommu/dma-iommu.c:1829:22: error: use of undeclared identifier 'CC_ATTR_MEM_ENCRYPT'
    1829 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
         |                             ^
   17 warnings and 2 errors generated.


vim +/cc_platform_has +1829 drivers/iommu/dma-iommu.c

  1819	
  1820	bool iommu_can_use_iova(struct device *dev, struct page *page, size_t size,
  1821				enum dma_data_direction dir)
  1822	{
  1823		enum pci_p2pdma_map_type map;
  1824	
  1825		if (is_swiotlb_force_bounce(dev) || dev_use_swiotlb(dev, size, dir))
  1826			return false;
  1827	
  1828		/* TODO: Rewrite this check to rely on specific struct page flags */
> 1829		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
  1830			return false;
  1831	
  1832		if (page && is_pci_p2pdma_page(page)) {
  1833			map = pci_p2pdma_map_type(page->pgmap, dev);
  1834			return map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE;
  1835		}
  1836	
  1837		return true;
  1838	}
  1839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
