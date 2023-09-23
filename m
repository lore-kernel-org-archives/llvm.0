Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3C1C38;
	Sat, 23 Sep 2023 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695474167; x=1727010167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64rg1Lw0DnzdNL3WI6AOoUhQKm6AoDbr7gwnVo2CHlk=;
  b=JzYwIzZEFENd4SBfrEsgvkv460trz9jADzA6ryI3vOba1nsj0EUxKH5I
   2l6n/+JSZh02UJhuVzSAYEn8Vm7dQJhbdF+bicERwzj3PfcOFXLUHN0NW
   5FqBH3S821cmBTUkCsY8yRwBMz4PW8ehSe9OVCge2u4321mZD7GV8YFBT
   m2WDuzDAzTPB8hemUnTwxVLL+E0A77CmEIt9ek385GlzvWCp0lrF66Ykk
   UniLI+WfNR/6mfLflT7HtL/WASGGeeBvtxJ6IQEdmZSDZKiGK2dsMApp3
   0AecfvH6ThPoHJljfpmWbCOi6hHXNYP0/OU604FfGNxyVxCnIrI3IXObC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371332807"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371332807"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 06:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838088331"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="838088331"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2023 06:02:42 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk2HQ-0002O1-0V;
	Sat, 23 Sep 2023 13:02:40 +0000
Date: Sat, 23 Sep 2023 21:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"jingyang.wang" <wjy7717@126.com>
Subject: [nbd168-wireless:pr/4 1/1] include/linux/pci_ids.h:3134:9: warning:
 'PCI_VENDOR_ID_ITTIM' macro redefined
Message-ID: <202309232030.4Vp5B88T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless pr/4
head:   ca4db2945103cfd433731260f3d6fbf582913e68
commit: ca4db2945103cfd433731260f3d6fbf582913e68 [1/1] Merge branch 'mt76' into mt76
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230923/202309232030.4Vp5B88T-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232030.4Vp5B88T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232030.4Vp5B88T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/rtnetlink.c:28:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from net/core/rtnetlink.c:28:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/core/rtnetlink.c:28:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from net/core/rtnetlink.c:37:
   In file included from include/linux/pci.h:44:
>> include/linux/pci_ids.h:3134:9: warning: 'PCI_VENDOR_ID_ITTIM' macro redefined [-Wmacro-redefined]
    3134 | #define PCI_VENDOR_ID_ITTIM             0x0B48
         |         ^
   include/linux/pci_ids.h:183:9: note: previous definition is here
     183 | #define PCI_VENDOR_ID_ITTIM             0x0b48
         |         ^
   13 warnings generated.


vim +/PCI_VENDOR_ID_ITTIM +3134 include/linux/pci_ids.h

9fd0e09a4e8649 Anthony Wong  2018-08-31  3133  
db0b72509eef7f Jingyang Wang 2023-09-06 @3134  #define PCI_VENDOR_ID_ITTIM		0x0B48
db0b72509eef7f Jingyang Wang 2023-09-06  3135  

:::::: The code at line 3134 was first introduced by commit
:::::: db0b72509eef7fdb59313890e42c225279247770 wifi: mt76: mt7922: Add support ITTIM PE50-M75C

:::::: TO: Jingyang Wang <wjy7717@126.com>
:::::: CC: Jingyang Wang <wjy7717@126.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
