Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179918E1E;
	Mon, 25 Sep 2023 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695641752; x=1727177752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obtdksO5Wy78pInJMPlOObfxrimyl6DmXmsB8Rk6BmM=;
  b=Ct7IbIRW4sUbQ7tRv0lDLx9AxCyc9t4wVoBYWttabPBKZ8rw9a+po0+Q
   yIXD5eTWFEqHX6P1H/WA6yALQdRxM5nvqhJ5o6L3KDDheCoZs7JJ97T1a
   pPCO3prfyT4nP3joIJiGoL+lwHYP9XWeJnqNZXnW306RuVtg7VfHNhpyF
   2P9C5GS6EVUYUMBJ7dYCk9upG/rKsTHfVl/NFJvbsU3biEHJFzwheDhxs
   eS9qReG2dUGAAZlLZjDx63Y60i5yDjuhPgQpwGliQbPdSZkzHORcVjjis
   sBwaEpwfsvSVMDoKyDcYk7v5BlUdPCalJrylmzDpw1sNK5ZRI17sUMt+w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378496988"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="378496988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751640858"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="751640858"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 04:35:49 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkjsR-0001St-17;
	Mon, 25 Sep 2023 11:35:47 +0000
Date: Mon, 25 Sep 2023 19:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tinazhangzw:per-iommu_IOTLB_invalidation 9/14]
 include/linux/iommu.h:117:24: error: field has incomplete type 'struct
 mmu_notifier'
Message-ID: <202309251937.zHCduPla-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git per-iommu_IOTLB_invalidation
head:   c5144840fce67da51a43d9b6ef05b4b344f5786f
commit: fa8b08eb650d3a32f2190224035305d113bbea75 [9/14] iommu: Add mmu_notifier to iommu_domain
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230925/202309251937.zHCduPla-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251937.zHCduPla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251937.zHCduPla-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/init-mm.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/init-mm.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/init-mm.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
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
   In file included from mm/init-mm.c:13:
>> include/linux/iommu.h:117:24: error: field has incomplete type 'struct mmu_notifier'
     117 |                         struct mmu_notifier notifier;
         |                                             ^
   include/linux/iommu.h:117:11: note: forward declaration of 'struct mmu_notifier'
     117 |                         struct mmu_notifier notifier;
         |                                ^
   12 warnings and 1 error generated.


vim +117 include/linux/iommu.h

    94	
    95	struct iommu_domain {
    96		unsigned type;
    97		const struct iommu_domain_ops *ops;
    98		unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
    99		struct iommu_domain_geometry geometry;
   100		struct iommu_dma_cookie *iova_cookie;
   101		enum iommu_page_response_code (*iopf_handler)(struct iommu_fault *fault,
   102							      void *data);
   103		void *fault_data;
   104		union {
   105			struct {
   106				iommu_fault_handler_t handler;
   107				void *handler_token;
   108			};
   109			struct {	/* IOMMU_DOMAIN_SVA */
   110				struct mm_struct *mm;
   111				int users;
   112				/*
   113				 * Next iommu_domain in mm->iommu_mm->sva-domains list
   114				 * protected by iommu_sva_lock.
   115				 */
   116				struct list_head next;
 > 117				struct mmu_notifier notifier;
   118			};
   119		};
   120	};
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
