Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF186110B;
	Sat, 12 Aug 2023 00:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691800257; x=1723336257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1x2P4E8j/zpafgm3RPuB/Lf62dZ486F/xTO92Iio97w=;
  b=XTEBk4d+4SmfiYSBHUbQa/3HNgmKDDWoNyg/L7LQ4TnQ7eXDWwCpkOFV
   Hx9xI6uCEfgdUYgUV2wsxiYUBkONbYNbWEsFVvpCe8/3lcKfyk0LWS541
   jpcBG2DItzFBTmBwr8QclY368IKI7Y9pDq84MikjnvvC799bq5VVFxCeu
   D9tJqGBla5jPOGh/pPtjKclrNWjaHd8DvVLtBum5LZRaCbuoVwbu/BEI7
   rXWe+owjI2yWrIE/ImQJ3AnfX1Sg2WrcDopB5qG72Z8imrBnhHkn32qHQ
   hEiQLW4ysdVDYfQImBwEshQMCqdoWbwvBHI7xa0tTe1hX9yu/sF+zVSjf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402768333"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="402768333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 17:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846948744"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="846948744"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 17:30:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUcWt-00088s-14;
	Sat, 12 Aug 2023 00:30:55 +0000
Date: Sat, 12 Aug 2023 08:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24] include/linux/pci.h:352:32: error:
 variable has incomplete type 'enum pci_ide_stream_type'
Message-ID: <202308120818.3XfeoT0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   3e25c6d783287d7b5807e5df623589e7d53b64a8
commit: cba36ee4e7f4d5d50334a59f5a5af09605bfdde6 [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: s390-randconfig-r012-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120818.3XfeoT0R-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120818.3XfeoT0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120818.3XfeoT0R-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:609:
   In file included from arch/s390/include/asm/hw_irq.h:6:
>> include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
>> include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                                                   ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
   13 warnings and 1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/s390/kernel/asm-offsets.s] Error 1 shuffle=139011430
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=139011430
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=139011430
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=139011430
   make: Target 'prepare' not remade because of errors.


vim +352 include/linux/pci.h

   338	
   339	struct pci_ide {
   340		unsigned int			link_num;
   341		unsigned int			select_num;
   342		struct ida			stream_pos_ids;
   343		struct ida			stream_ids;
   344		int				stream_min;
   345		int				stream_max;
   346		const struct pci_ide_ops	*ops;
   347		enum pci_ide_stream_type	stream_type;
   348	};
   349	#else
   350	static inline int pcie_ide_stream_create(struct pci_dev *pdev1,
   351						 struct pci_dev *pdev2,
 > 352						 enum pci_ide_stream_type type)
   353	{
   354		return -EOPNOTSUPP;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
