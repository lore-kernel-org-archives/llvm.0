Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A393185E;
	Sun, 15 Oct 2023 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKx6tsTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697370402; x=1728906402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1UhkjN+dDfJXbl8IqejJHX8ps6EPQmAWj+ZLPrfwwk=;
  b=UKx6tsTSZ/r9n5Kx98DzPqQRj6lsRWSIH3pauRaD2wb4zh+lbBOW/SYW
   B8LuvJxIFA5q8OwmrXpyxOIedB1tm2Jbd9fix4MXLdyVXNeCyk+5etvXa
   UEPkZ9H7dBCdLMwQmWJkY5Y7e6k3Q38sMemn6raIBSuitAbHhYy2X/F/O
   6+qM8/sfH9c2RxV9ukriBKVroe9Be/BHLKSkoE3N0GCFZ4VNOVhAu72bx
   EdXyorA59WqmYPqAhm0PztR87ro8c629TRQbeQ+OB7Ij56GizkXIOV6f3
   +XjK00OQdvBWuHur659X0iSG2xPx6k6/UcOw4fMB/Z54eZ3Y8ru0X4XfC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384256519"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="384256519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 04:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821246752"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="821246752"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2023 04:46:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrzZt-0007NF-0w;
	Sun, 15 Oct 2023 11:46:37 +0000
Date: Sun, 15 Oct 2023 19:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 1/54]
 drivers/media/platform/apple/isp/isp-cam.c:378:58: warning: format specifies
 type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202310151949.HqZIKANt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   345b0eda7c39b11429a7f06e4c83618167aa2f40
commit: f0f1b152058cd2c9ee3a042da1349a1f88663d82 [1/54] media: apple: Add Apple ISP driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151949.HqZIKANt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151949.HqZIKANt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151949.HqZIKANt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/isp/isp-cam.c:6:
   In file included from drivers/media/platform/apple/isp/isp-cam.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/apple/isp/isp-cam.c:6:
   In file included from drivers/media/platform/apple/isp/isp-cam.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/apple/isp/isp-cam.c:6:
   In file included from drivers/media/platform/apple/isp/isp-cam.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
>> drivers/media/platform/apple/isp/isp-cam.c:378:58: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                                         ~~~            ^~~~~~~~
         |                                                         %zx
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   7 warnings generated.
--
   In file included from drivers/media/platform/apple/isp/isp-fw.c:7:
   In file included from drivers/media/platform/apple/isp/isp-cmd.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/apple/isp/isp-fw.c:7:
   In file included from drivers/media/platform/apple/isp/isp-cmd.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/apple/isp/isp-fw.c:7:
   In file included from drivers/media/platform/apple/isp/isp-cmd.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   drivers/media/platform/apple/isp/isp-fw.c:245:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     245 |         if (!isp->data_surf) {
         |             ^~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:298:9: note: uninitialized use occurs here
     298 |         return err;
         |                ^~~
   drivers/media/platform/apple/isp/isp-fw.c:245:2: note: remove the 'if' if its condition is always false
     245 |         if (!isp->data_surf) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
     246 |                 isp_err(isp, "failed to alloc surface for data files\n");
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     247 |                 goto free_extra;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |         }
         | ~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:239:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     239 |         if (!isp->extra_surf) {
         |             ^~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:298:9: note: uninitialized use occurs here
     298 |         return err;
         |                ^~~
   drivers/media/platform/apple/isp/isp-fw.c:239:2: note: remove the 'if' if its condition is always false
     239 |         if (!isp->extra_surf) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     240 |                 isp_err(isp, "failed to alloc surface for extra heap\n");
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |                 goto free_ipc;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     242 |         }
         | ~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:216:9: note: initialize the variable 'err' to silence this warning
     216 |         int err, retries;
         |                ^
         |                 = 0
>> drivers/media/platform/apple/isp/isp-fw.c:364:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     364 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                                                                         ~~~~
         |                                                                         %x
     365 |                         chan->name, chan->type, chan->src, chan->num,
     366 |                         chan->iova);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:249:47: note: expanded from macro 'isp_dbg'
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
     272 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:513:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     513 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                                               ~~~~
         |                                               %x
     514 |                         surf->iova, surf->size, (void *)surf->virt);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:249:47: note: expanded from macro 'isp_dbg'
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
     272 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:580:5: warning: no previous prototype for function 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     580 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^
   drivers/media/platform/apple/isp/isp-fw.c:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | int apple_isp_firmware_boot(struct apple_isp *isp)
         | ^
         | static 
   drivers/media/platform/apple/isp/isp-fw.c:601:6: warning: no previous prototype for function 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     601 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^
   drivers/media/platform/apple/isp/isp-fw.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     601 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         | ^
         | static 
   12 warnings generated.
--
   In file included from drivers/media/platform/apple/isp/isp-iommu.c:4:
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
   In file included from drivers/media/platform/apple/isp/isp-iommu.c:4:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/apple/isp/isp-iommu.c:4:
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
>> drivers/media/platform/apple/isp/isp-iommu.c:136:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     136 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~~
         |                                                                      %x
     137 |                         surf->iova);
         |                         ^~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:182:16: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     182 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                                                                    ~~~~
         |                                                                    %x
     183 |                         surf->size, surf->iova);
         |                                     ^~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:212:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     212 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                                          ~~~~
         |                                                          %x
     213 |                         surf->iova, surf->iova + surf->size);
         |                         ^~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:260:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     260 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~~
         |                                                                      %x
     261 |                         surf->iova);
         |                         ^~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   10 warnings generated.
..


vim +378 drivers/media/platform/apple/isp/isp-cam.c

   361	
   362	static int isp_ch_load_setfile(struct apple_isp *isp, u32 ch)
   363	{
   364		struct isp_format *fmt = isp_get_format(isp, ch);
   365		const struct isp_setfile *setfile = &isp_setfiles[fmt->id];
   366		const struct firmware *fw;
   367		u32 magic;
   368		int err;
   369	
   370		err = request_firmware(&fw, setfile->path, isp->dev);
   371		if (err) {
   372			dev_err(isp->dev, "failed to request setfile '%s': %d\n",
   373				setfile->path, err);
   374			return err;
   375		}
   376	
   377		if (fw->size < setfile->size) {
 > 378			dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
   379				setfile->size);
   380			release_firmware(fw);
   381			return -EINVAL;
   382		}
   383	
   384		magic = be32_to_cpup((__be32 *)fw->data);
   385		if (magic != setfile->magic) {
   386			dev_err(isp->dev, "setfile '%s' corrupted?\n", setfile->path);
   387			release_firmware(fw);
   388			return -EINVAL;
   389		}
   390	
   391		isp_iowrite(isp, isp->data_surf->iova, (void *)fw->data, setfile->size);
   392		release_firmware(fw);
   393	
   394		return isp_cmd_ch_set_file_load(isp, ch, isp->data_surf->iova,
   395						setfile->size);
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
