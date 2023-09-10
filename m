Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E88BE6;
	Sun, 10 Sep 2023 21:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694381188; x=1725917188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtS02JcLtVK0VsPON2AfWniG9MozFEquNp2a8LSR+iQ=;
  b=iti23FoksKLwfeEsYse40Dw1+pzhyeCixJ3LyXVCro03/LKqTHk1pOR7
   eLArPKAO0xOnFkskEkX/fjoawUqNVwz1Hea1EzFPFZ5XK3ooP7FBS5Qlu
   mrwgFEjSJF1JjemodSx8wM9z7VG6tNba9cJa5BheYf7v7ADFB+WiRpCC2
   zq4lrk+NkceGC8jxeDYJDGY+5BVvDiqMYIOku+zBhGWb6MLhwJBAtFVtu
   nJYy9BsnliOzFKsGuebuK2+9exRVpk+sFrLToBM4WNrRO0UE6Vei2oZfP
   Z2kVK59wrbJEXD0xQrJDU2EsuSsEygiYQWwLKwAMraeeG/ghkaC8aIKNV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="408901768"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="408901768"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 14:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="866721143"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="866721143"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Sep 2023 14:26:25 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRwl-0005Qk-1E;
	Sun, 10 Sep 2023 21:26:23 +0000
Date: Mon, 11 Sep 2023 05:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:isp/heap-alloc 130/143]
 drivers/media/platform/apple/isp/isp-drv.c:116:44: warning: format specifies
 type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202309110549.J17LCWJn-lkp@intel.com>
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
commit: 0b076abdfbca374da4e01d40f74eda178e438dc3 [130/143] isp: Use preallocated heap
config: hexagon-randconfig-r024-20230911 (https://download.01.org/0day-ci/archive/20230911/202309110549.J17LCWJn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110549.J17LCWJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110549.J17LCWJn-lkp@intel.com/

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
   drivers/media/platform/apple/isp/isp-drv.c:116:33: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |                         ~~~~           ^~~~~~~~~
         |                         %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/media/platform/apple/isp/isp-drv.c:116:44: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |                                ~~~                ^~~~~~~~~
         |                                %zx
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:306:34: warning: unused variable 'apple_isp_hw_t6000' [-Wunused-const-variable]
     306 | static const struct apple_isp_hw apple_isp_hw_t6000 = {
         |                                  ^
   drivers/media/platform/apple/isp/isp-drv.c:333:34: warning: unused variable 'apple_isp_hw_t8110' [-Wunused-const-variable]
     333 | static const struct apple_isp_hw apple_isp_hw_t8110 = {
         |                                  ^
   10 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +116 drivers/media/platform/apple/isp/isp-drv.c

    78	
    79	static int apple_isp_init_iommu(struct apple_isp *isp)
    80	{
    81		struct device *dev = isp->dev;
    82		phys_addr_t heap_base;
    83		size_t heap_size;
    84		u64 vm_size;
    85		int err;
    86		int idx;
    87		int size;
    88		struct device_node *mem_node;
    89		const __be32 *maps, *end;
    90	
    91		isp->domain = iommu_get_domain_for_dev(isp->dev);
    92		if (!isp->domain)
    93			return -EPROBE_DEFER;
    94		isp->shift = __ffs(isp->domain->pgsize_bitmap);
    95	
    96		idx = of_property_match_string(dev->of_node, "memory-region-names", "heap");
    97		mem_node = of_parse_phandle(dev->of_node, "memory-region", idx);
    98		if (!mem_node) {
    99			dev_err(dev, "No memory-region found for heap\n");
   100			return -ENODEV;
   101		}
   102	
   103		maps = of_get_property(mem_node, "iommu-addresses", &size);
   104		if (!maps || !size) {
   105			dev_err(dev, "No valid iommu-addresses found for heap\n");
   106			return -ENODEV;
   107		}
   108	
   109		end = maps + size / sizeof(__be32);
   110	
   111		while (maps < end) {
   112			maps++;
   113			maps = of_translate_dma_region(dev->of_node, maps, &heap_base, &heap_size);
   114		}
   115	
 > 116		printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
   117	
   118		isp->fw.heap_top = heap_base + heap_size;
   119	
   120		err = of_property_read_u64(dev->of_node, "apple,dart-vm-size",
   121					   &vm_size);
   122		if (err) {
   123			dev_err(dev, "failed to read 'apple,dart-vm-size': %d\n", err);
   124			return err;
   125		}
   126	
   127		drm_mm_init(&isp->iovad, isp->fw.heap_top, vm_size - heap_base);
   128	
   129		apple_isp_iommu_sync_ttbr(isp);
   130	
   131		return 0;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
