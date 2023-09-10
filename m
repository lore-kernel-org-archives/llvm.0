Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C4A49;
	Sun, 10 Sep 2023 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694378663; x=1725914663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vaI0e2p5kAQ8nq5Abb+EbDRe8947YaghZ6sy6z+yRS4=;
  b=YqLe2KE+2TzDlTiDZC83ga0I9NtzXZ1BzLW3xDaBdfWVfu/pywS8Z/xl
   oKJ3zLl3PrMtB/0F83nxjlBmNQ0OSVs5kl+wOFJ28YMFNAoitx1PquLZM
   Eai7yHsPmnYRz66svMPQSh9mvPQX74PJsmTouOpyuj3k/772PYdjsomjF
   m0sIdeAoGWh/0vOfMDIvC9yFbVIQQlyOud5jsnxbjpCYbPREFoxjSNiGh
   czUwQhilApV/ccpsKAjJq30Pzfu/0y30g74GvrtcJqvTguNP8EB/Xatzi
   LkAo2GEyYFTPLokCigLx4sUgrVjjMo6uKpMWp2LQcR+zkcVq/g9JWhXYm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381743870"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="381743870"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 13:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="989846730"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="989846730"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2023 13:44:21 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRI3-0005NQ-13;
	Sun, 10 Sep 2023 20:44:19 +0000
Date: Mon, 11 Sep 2023 04:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:isp/heap-alloc 113/143]
 drivers/media/platform/apple/isp/isp-drv.c:392:34: warning: unused variable
 'apple_isp_hw_t8110'
Message-ID: <202309110434.IG9NsNRi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   fdd4fa0037948a22f3fff6d893e4ccb26cdb2396
commit: 0d0847e7706a7944b9c5a7ddbd497517e5ff1c64 [113/143] media: apple: isp: IMX558 initial support
config: hexagon-randconfig-r024-20230911 (https://download.01.org/0day-ci/archive/20230911/202309110434.IG9NsNRi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110434.IG9NsNRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110434.IG9NsNRi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/isp/isp-drv.c:12:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/media/platform/apple/isp/isp-drv.c:12:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/apple/isp/isp-drv.c:12:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   drivers/media/platform/apple/isp/isp-drv.c:112:10: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     112 |         isp_dbg(isp, "reserving: %d: phys: 0x%llx size: 0x%llx iova: 0x%llx\n",
         |                                              ~~~~
         |                                              %x
     113 |                 index, resv->phys, resv->size, resv->iova);
         |                        ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:252:47: note: expanded from macro 'isp_dbg'
     252 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:112:34: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     112 |         isp_dbg(isp, "reserving: %d: phys: 0x%llx size: 0x%llx iova: 0x%llx\n",
         |                                                                        ~~~~
         |                                                                        %x
     113 |                 index, resv->phys, resv->size, resv->iova);
         |                                                ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:252:47: note: expanded from macro 'isp_dbg'
     252 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:365:34: warning: unused variable 'apple_isp_hw_t6000' [-Wunused-const-variable]
     365 | static const struct apple_isp_hw apple_isp_hw_t6000 = {
         |                                  ^
>> drivers/media/platform/apple/isp/isp-drv.c:392:34: warning: unused variable 'apple_isp_hw_t8110' [-Wunused-const-variable]
     392 | static const struct apple_isp_hw apple_isp_hw_t8110 = {
         |                                  ^
   10 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/apple_isp_hw_t8110 +392 drivers/media/platform/apple/isp/isp-drv.c

   364	
 > 365	static const struct apple_isp_hw apple_isp_hw_t6000 = {
   366		.pmu_base = 0x28e584000,
   367	
   368		.dsid_clr_base0 = 0x200014000,
   369		.dsid_clr_base1 = 0x200054000,
   370		.dsid_clr_base2 = 0x200094000,
   371		.dsid_clr_base3 = 0x2000d4000,
   372		.dsid_clr_range0 = 0x1000,
   373		.dsid_clr_range1 = 0x1000,
   374		.dsid_clr_range2 = 0x1000,
   375		.dsid_clr_range3 = 0x1000,
   376	
   377		.clock_scratch = 0x28e3d0868,
   378		.clock_base = 0x0,
   379		.clock_bit = 0x0,
   380		.clock_size = 0x8,
   381		.bandwidth_scratch = 0x28e3d0980,
   382		.bandwidth_base = 0x0,
   383		.bandwidth_bit = 0x0,
   384		.bandwidth_size = 0x8,
   385	
   386		.stream_command = DART_T8020_STREAM_COMMAND,
   387		.stream_select = DART_T8020_STREAM_SELECT,
   388		.ttbr = DART_T8020_TTBR,
   389		.stream_command_invalidate = DART_T8020_STREAM_COMMAND_INVALIDATE,
   390	};
   391	
 > 392	static const struct apple_isp_hw apple_isp_hw_t8110 = {
   393		.pmu_base = 0x23b704000,
   394	
   395		.dsid_clr_base0 = 0x200014000, // TODO
   396		.dsid_clr_base1 = 0x200054000,
   397		.dsid_clr_base2 = 0x200094000,
   398		.dsid_clr_base3 = 0x2000d4000,
   399		.dsid_clr_range0 = 0x1000,
   400		.dsid_clr_range1 = 0x1000,
   401		.dsid_clr_range2 = 0x1000,
   402		.dsid_clr_range3 = 0x1000,
   403	
   404		.clock_scratch = 0x23b3d0560,
   405		.clock_base = 0x0,
   406		.clock_bit = 0x0,
   407		.clock_size = 0x8,
   408		.bandwidth_scratch = 0x23b3d05d0,
   409		.bandwidth_base = 0x0,
   410		.bandwidth_bit = 0x0,
   411		.bandwidth_size = 0x8,
   412	
   413		.stream_command = DART_T8020_STREAM_COMMAND, // TODO
   414		.stream_select = DART_T8020_STREAM_SELECT,
   415		.ttbr = DART_T8020_TTBR,
   416		.stream_command_invalidate = DART_T8020_STREAM_COMMAND_INVALIDATE,
   417	};
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
