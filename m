Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D97C;
	Thu, 13 Jul 2023 02:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689217115; x=1720753115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRq7qbqHROBeda0aBft/5gS7DhzrNASW+fZq/q/qfvg=;
  b=NdfyT8aTGefLvGfhu6zye1ohn6PWHc5RVwaxdi3Hmw6rk4kNmv0SEZo3
   bPmyke9AP7rQef2cdc5l8RdcpSJuFfBK58fP0V4j9Ew3ym2tvnNzu/CyU
   drMvD+Sqzf3rBVdckXxNXrS0nMIWG5PXJfI7x4FWWvWWBz/BvK91ruUsI
   pz5pBwr7mysKD7MMroi8I5bEUr3s6BafrcjSwXh9WnBc6E2aXKsEU3gVu
   vbJMtJ7pg/Sk3k7W6RWW7hMVyEoX6pCsugPLHrChSRFzQ96MKL8l92EjA
   MlQOiWqxu6c0fFqyd/l+TQos1jdmMdy8mecwpBKA2aMsVfDDqMQYCMfh2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395869525"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="395869525"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 19:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="866373039"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="866373039"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2023 19:58:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJmXH-0006A7-0v;
	Thu, 13 Jul 2023 02:58:31 +0000
Date: Thu, 13 Jul 2023 10:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: [akpm-mm:mm-unstable 93/173] drivers/clk/clk-fixed-mmio.c:33:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307131033.JgvCSVz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   e726c62e70a70ae5536caa0aa131c5dce5c6f764
commit: 827057ff3ce7554741d431145c3b93f1a54125fc [93/173] s390: mm: convert to GENERIC_IOREMAP
config: s390-randconfig-r033-20230713 (https://download.01.org/0day-ci/archive/20230713/202307131033.JgvCSVz4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131033.JgvCSVz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131033.JgvCSVz4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/clk-fixed-mmio.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
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
   In file included from drivers/clk/clk-fixed-mmio.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/clk/clk-fixed-mmio.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
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
>> drivers/clk/clk-fixed-mmio.c:33:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |         iounmap(base);
         |         ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/clk/clk-fixed-mmio.c:33:2: note: did you mean 'vunmap'?
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   include/linux/vmalloc.h:167:13: note: 'vunmap' declared here
     167 | extern void vunmap(const void *addr);
         |             ^
   12 warnings and 1 error generated.


vim +/iounmap +33 drivers/clk/clk-fixed-mmio.c

50cc4caf531abb2 Jan Kotas 2018-12-13  17  
50cc4caf531abb2 Jan Kotas 2018-12-13  18  static struct clk_hw *fixed_mmio_clk_setup(struct device_node *node)
50cc4caf531abb2 Jan Kotas 2018-12-13  19  {
50cc4caf531abb2 Jan Kotas 2018-12-13  20  	struct clk_hw *clk;
50cc4caf531abb2 Jan Kotas 2018-12-13  21  	const char *clk_name = node->name;
50cc4caf531abb2 Jan Kotas 2018-12-13  22  	void __iomem *base;
50cc4caf531abb2 Jan Kotas 2018-12-13  23  	u32 freq;
50cc4caf531abb2 Jan Kotas 2018-12-13  24  	int ret;
50cc4caf531abb2 Jan Kotas 2018-12-13  25  
50cc4caf531abb2 Jan Kotas 2018-12-13  26  	base = of_iomap(node, 0);
50cc4caf531abb2 Jan Kotas 2018-12-13  27  	if (!base) {
50cc4caf531abb2 Jan Kotas 2018-12-13  28  		pr_err("%pOFn: failed to map address\n", node);
50cc4caf531abb2 Jan Kotas 2018-12-13  29  		return ERR_PTR(-EIO);
50cc4caf531abb2 Jan Kotas 2018-12-13  30  	}
50cc4caf531abb2 Jan Kotas 2018-12-13  31  
50cc4caf531abb2 Jan Kotas 2018-12-13  32  	freq = readl(base);
50cc4caf531abb2 Jan Kotas 2018-12-13 @33  	iounmap(base);
50cc4caf531abb2 Jan Kotas 2018-12-13  34  	of_property_read_string(node, "clock-output-names", &clk_name);
50cc4caf531abb2 Jan Kotas 2018-12-13  35  
50cc4caf531abb2 Jan Kotas 2018-12-13  36  	clk = clk_hw_register_fixed_rate(NULL, clk_name, NULL, 0, freq);
50cc4caf531abb2 Jan Kotas 2018-12-13  37  	if (IS_ERR(clk)) {
50cc4caf531abb2 Jan Kotas 2018-12-13  38  		pr_err("%pOFn: failed to register fixed rate clock\n", node);
50cc4caf531abb2 Jan Kotas 2018-12-13  39  		return clk;
50cc4caf531abb2 Jan Kotas 2018-12-13  40  	}
50cc4caf531abb2 Jan Kotas 2018-12-13  41  
50cc4caf531abb2 Jan Kotas 2018-12-13  42  	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, clk);
50cc4caf531abb2 Jan Kotas 2018-12-13  43  	if (ret) {
50cc4caf531abb2 Jan Kotas 2018-12-13  44  		pr_err("%pOFn: failed to add clock provider\n", node);
50cc4caf531abb2 Jan Kotas 2018-12-13  45  		clk_hw_unregister(clk);
50cc4caf531abb2 Jan Kotas 2018-12-13  46  		clk = ERR_PTR(ret);
50cc4caf531abb2 Jan Kotas 2018-12-13  47  	}
50cc4caf531abb2 Jan Kotas 2018-12-13  48  
50cc4caf531abb2 Jan Kotas 2018-12-13  49  	return clk;
50cc4caf531abb2 Jan Kotas 2018-12-13  50  }
50cc4caf531abb2 Jan Kotas 2018-12-13  51  

:::::: The code at line 33 was first introduced by commit
:::::: 50cc4caf531abb2075c6973451fccdaba9f02715 clk: Add Fixed MMIO clock driver

:::::: TO: Jan Kotas <jank@cadence.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
