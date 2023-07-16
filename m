Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F9115A0;
	Sun, 16 Jul 2023 03:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689478994; x=1721014994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZL69/sHnvhHg7m0dM59b78zzMQBy924MMNaqjDEKRQ=;
  b=ICGPgLdQcy3k2ftLsqet4m1cG1q074Qc+WaaY6U33zKWNAJbV+/1nMeI
   IEC3pZ/ZPsfafw8kf9z5tvY9Ia92N5R6D2uxpv7jQtNKoyY0E/3SkP4Nv
   sAx2CmKH1aC0OKL3GK34W+f1H3etyGhMjjSPUG4cv+tpKNmzd4lDfjwyT
   uO5D07tRVw8+/fQLQEpu9mLd3DGh3bV5Cz5xe1xeVw2HP4VUWwB3ICfxx
   UmcGAEvdKn6kfoxQBJpuvcaNIw0JDMxW9XpRSNLSjCLp9waK5sK3/ECj8
   maT09FIQVOTv2KZJuDtTUnqhPXiEISbVe1YtfPMtU2zAMPmKOB4DvYEAe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="431898377"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="431898377"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="726122435"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="726122435"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2023 20:43:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKsf9-0008XZ-29;
	Sun, 16 Jul 2023 03:43:11 +0000
Date: Sun, 16 Jul 2023 11:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 356/365]
 include/linux/hugetlb.h:488:9: warning: declaration of 'struct resv_map'
 will not be visible outside of this function
Message-ID: <202307161134.SIOakK2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: f896a70f60673d612d27d0a8c2a3f37f4c1a6338 [356/365] mm: hugetlb: Parametrize hugetlb functions by resv_map
config: hexagon-randconfig-r045-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161134.SIOakK2W-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161134.SIOakK2W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161134.SIOakK2W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/vaddr.c:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/damon/vaddr.c:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/damon/vaddr.c:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from mm/damon/vaddr.c:12:
   include/linux/hugetlb.h:484:9: warning: declaration of 'struct hstate' will not be visible outside of this function [-Wvisibility]
     484 |         struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
         |                ^
   include/linux/hugetlb.h:487:40: warning: declaration of 'struct hstate' will not be visible outside of this function [-Wvisibility]
     487 |         struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
         |                                               ^
   include/linux/hugetlb.h:487:58: warning: declaration of 'struct hugepage_subpool' will not be visible outside of this function [-Wvisibility]
     487 |         struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
         |                                                                 ^
>> include/linux/hugetlb.h:488:9: warning: declaration of 'struct resv_map' will not be visible outside of this function [-Wvisibility]
     488 |         struct resv_map *resv_map, struct inode *inode, loff_t lstart, loff_t lend) {}
         |                ^
   10 warnings generated.


vim +488 include/linux/hugetlb.h

   482	
   483	static inline void hugetlb_zero_partial_page(
 > 484		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   485	
   486	static inline void remove_mapping_hugepages(
   487		struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
 > 488		struct resv_map *resv_map, struct inode *inode, loff_t lstart, loff_t lend) {}
   489	static inline void remove_inode_hugepages(struct inode *inode, loff_t lstart, loff_t lend) {}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
