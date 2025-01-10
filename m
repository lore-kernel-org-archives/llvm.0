Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1EB2139D4;
	Fri, 10 Jan 2025 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530068; cv=none; b=ZXxy124h2vzGJi9wgKniRjb3jxo4/vHJiNHOqwjhB7z2/exl39w1735YV9JTXLp12QljZYZtcCmALFhMf7oBVeH1iOIvd4AfhblvYfOYucaCV8OcFKXhDytlMDWR3j7AQoWZjz8RlvHWz5rl5M5Uw/3AACDr3tgBJYNvo85FDPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530068; c=relaxed/simple;
	bh=I/txI/DPzUuxaT3tZ02aOlchnZNNv8+CCHUeGN2pD30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BocuA3eMwle7qoqDKZJBLXOMKhESoc7en+ZeVrqId4YrBFT6gDWBLNcHbmi1NmIlpy+5riqH/O4roBLXBsAKxbw5lc0kcX+rpmbjEhRhysbD4ae/44HVKeT2/nPCM5q1pwmRXHdq08pJtE0tf9JgtJT2+gQgigAEVNzYnzWZIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njslnIkJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njslnIkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736530066; x=1768066066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/txI/DPzUuxaT3tZ02aOlchnZNNv8+CCHUeGN2pD30=;
  b=njslnIkJsCj/n230+HSbGIaIDWhqo1UZGluaKAJgbkdZPkGEl4WaXzLU
   z96EQbPcabtW98n724o9JfpCcOqHwjpoOAUZ6JDBmYVSVCbX5dSgxCZb1
   bfj8Ddg9+glmvh6EVYs1nAFf1eg/VI8dtajWE0xnBFCexEwouZIL3aBPi
   sNi6WFmtKrTEZOOO3+UDhawMIEu75dBfwjuQRkygIqzTIgR/FRIiuruVQ
   HNG/pi0rN46/kT6HJx1pA7gKmZLNJlvLvlOP0YcOoD9GRwBbLQ7m+xixv
   98oONuq186pLk5CPpG3Yk9g+DU3YpmKg7zL5pdExGri+fCxRtDXUzEK88
   g==;
X-CSE-ConnectionGUID: AdujpKAySRSm2CMF3qW95A==
X-CSE-MsgGUID: Qc0q2R5pSrmeOgQOr912sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24437170"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="24437170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 09:27:45 -0800
X-CSE-ConnectionGUID: NmRqdqh1SP+pgvF5NME8jA==
X-CSE-MsgGUID: b1a6d8s2SPSURnLjUYQ0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141084699"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2025 09:27:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWInN-000JXb-05;
	Fri, 10 Jan 2025 17:27:41 +0000
Date: Sat, 11 Jan 2025 01:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 59/504]
 drivers/irqchip/irq-imx-mu-msi.c:440:1: error: use of undeclared identifier
 'IRQCHIP_PLATFORM_DRIVER_END'
Message-ID: <202501110101.sLBd1yS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 14781d6a50ec5c5d2152f30447ccfc139e849d79 [59/504] irqchip: xilinx: Avoid __init macro usage for xilinx_intc_of_init
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110101.sLBd1yS0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110101.sLBd1yS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110101.sLBd1yS0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-imx-mu-msi.c:14:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from drivers/irqchip/irq-imx-mu-msi.c:14:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/irqchip/irq-imx-mu-msi.c:14:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from drivers/irqchip/irq-imx-mu-msi.c:14:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-imx-mu-msi.c:440:41: error: too many arguments provided to function-like macro invocation
     440 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         |                                         ^
   include/linux/irqchip.h:68:9: note: macro 'IRQCHIP_PLATFORM_DRIVER_END' defined here
      68 | #define IRQCHIP_PLATFORM_DRIVER_END(drv_name)                           \
         |         ^
>> drivers/irqchip/irq-imx-mu-msi.c:440:1: error: use of undeclared identifier 'IRQCHIP_PLATFORM_DRIVER_END'
     440 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         | ^
>> drivers/irqchip/irq-imx-mu-msi.c:445:23: error: expected '}'
     445 | MODULE_LICENSE("GPL");
         |                       ^
   drivers/irqchip/irq-imx-mu-msi.c:436:1: note: to match this '{'
     436 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
         | ^
   include/linux/irqchip.h:45:69: note: expanded from macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
      45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
         |                                                                     ^
>> drivers/irqchip/irq-imx-mu-msi.c:445:23: error: expected ';' after top level declarator
     445 | MODULE_LICENSE("GPL");
         |                       ^
         |                       ;
   16 warnings and 4 errors generated.


vim +/IRQCHIP_PLATFORM_DRIVER_END +440 drivers/irqchip/irq-imx-mu-msi.c

70afdab904d2d1 Frank Li 2022-09-22  435  
70afdab904d2d1 Frank Li 2022-09-22  436  IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
70afdab904d2d1 Frank Li 2022-09-22  437  IRQCHIP_MATCH("fsl,imx7ulp-mu-msi", imx_mu_imx7ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22  438  IRQCHIP_MATCH("fsl,imx6sx-mu-msi", imx_mu_imx6sx_of_init)
70afdab904d2d1 Frank Li 2022-09-22  439  IRQCHIP_MATCH("fsl,imx8ulp-mu-msi", imx_mu_imx8ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22 @440  IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
70afdab904d2d1 Frank Li 2022-09-22  441  
70afdab904d2d1 Frank Li 2022-09-22  442  
70afdab904d2d1 Frank Li 2022-09-22  443  MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
70afdab904d2d1 Frank Li 2022-09-22  444  MODULE_DESCRIPTION("Freescale MU MSI controller driver");
70afdab904d2d1 Frank Li 2022-09-22 @445  MODULE_LICENSE("GPL");

:::::: The code at line 440 was first introduced by commit
:::::: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
