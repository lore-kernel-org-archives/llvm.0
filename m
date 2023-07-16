Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A015A0;
	Sun, 16 Jul 2023 03:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689476412; x=1721012412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ArcSLTwzBdaldN5OIRk3HVZ5I/hWuxrlQwuGaqIJzk=;
  b=A25MDCcJZW1IIwwtcBC85RhZv414N+G3JrjCJsxRRoFiJVOWLxEWs13x
   GsmZrvNDLkQg6t70cMzfpBbYH1QWOayeYxn/H0GLXKr37/Y7/1lHw/tpB
   RCZUYEfc/byK78bcC0QVeIY7lb5cyJeuCXTip4pE9a9U7qBt/oie/3fa7
   d56Qf3t7uzs+COwp0ZZkMRm3KMJjGfhL7gs0rCgqllsLFenmeAVY+fJ0L
   X5OPq/cm/ZijiZ0Hn1LNvZ6zbJHF/X0yTZjc5h9fBmAouFXVulQN4C8jY
   saZOsKR1MtA+I1CVYDSsb1+DhLQ4RnCEFGr2Xo7M0TfDt9UJAvfAv58SZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="350592462"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="350592462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="673126047"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="673126047"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jul 2023 20:00:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrzW-0008V1-0z;
	Sun, 16 Jul 2023 03:00:10 +0000
Date: Sun, 16 Jul 2023 11:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 349/365]
 include/linux/hugetlb.h:485:58: warning: declaration of 'struct
 hugepage_subpool' will not be visible outside of this function
Message-ID: <202307161023.gb31ysJc-lkp@intel.com>
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
commit: c8c40c9db949fdf0d8844aaf62ddd4a02febdb42 [349/365] mm: hugetlb: Decouple hstate, subpool from inode
config: hexagon-randconfig-r045-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161023.gb31ysJc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161023.gb31ysJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161023.gb31ysJc-lkp@intel.com/

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
   include/linux/hugetlb.h:482:9: warning: declaration of 'struct hstate' will not be visible outside of this function [-Wvisibility]
     482 |         struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
         |                ^
   include/linux/hugetlb.h:485:40: warning: declaration of 'struct hstate' will not be visible outside of this function [-Wvisibility]
     485 |         struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
         |                                               ^
>> include/linux/hugetlb.h:485:58: warning: declaration of 'struct hugepage_subpool' will not be visible outside of this function [-Wvisibility]
     485 |         struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
         |                                                                 ^
   9 warnings generated.


vim +485 include/linux/hugetlb.h

   480	
   481	static inline void hugetlb_zero_partial_page(
 > 482		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   483	
   484	static inline void remove_mapping_hugepages(
 > 485		struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
   486		struct inode *inode, loff_t lstart, loff_t lend) {}
   487	static inline void remove_inode_hugepages(struct inode *inode, loff_t lstart, loff_t lend) {}
   488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
