Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78333F7;
	Sun, 15 Oct 2023 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg2O/L1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697395605; x=1728931605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/xLclot+rmIzcziyES3L27a2w5oRShtDTGO8Lr6uWI=;
  b=eg2O/L1kvwVst/N138l5ZnDbbL1+S5aTMxwN3WESBXqXIwm1SyNI8jFU
   mwAzrKynBQU+LyCiRjSmpi0OZ25Iz/RPAGxNz9cIJZPw8/pVL57rg1L4H
   tA2dt8zr1BQlDVHrJ2QRxRUeWpbW7bTIGTaZCJr3/xCjjSxlMIzyC26V+
   7oR3CtmotDnhs+hB2BZE6Suk0xy0VrZh8ctjOO3bbQH/H/ZS696QQAwM7
   I/F5EUONlh2rTy18hU/RmEFsVdchzItV+krg4AT7Xwr+qLwFEB3sGxdXp
   5LNNoZcHpfMIXBtMwUrFXOJfLP0OKdsbvztJgWHj4NubJDcTYyTrSZ0Ym
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416477779"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="416477779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 11:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755422806"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="755422806"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Oct 2023 11:46:42 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs68O-0007h9-2B;
	Sun, 15 Oct 2023 18:46:40 +0000
Date: Mon, 16 Oct 2023 02:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 20/54]
 drivers/media/platform/apple/isp/isp-fw.c:289:46: warning: shift count >=
 width of type
Message-ID: <202310160254.A0NwF0Oe-lkp@intel.com>
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
commit: b87aed78442345ce0de4a0d39f00d92eb5d41090 [20/54] media: apple: isp: Support >32bit VAs for t602x
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160254.A0NwF0Oe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160254.A0NwF0Oe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160254.A0NwF0Oe-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/media/platform/apple/isp/isp-fw.c:215:5: warning: no previous prototype for function 'apple_isp_alloc_firmware_surface' [-Wmissing-prototypes]
     215 | int apple_isp_alloc_firmware_surface(struct apple_isp *isp)
         |     ^
   drivers/media/platform/apple/isp/isp-fw.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | int apple_isp_alloc_firmware_surface(struct apple_isp *isp)
         | ^
         | static 
   drivers/media/platform/apple/isp/isp-fw.c:234:6: warning: no previous prototype for function 'apple_isp_free_firmware_surface' [-Wmissing-prototypes]
     234 | void apple_isp_free_firmware_surface(struct apple_isp *isp)
         |      ^
   drivers/media/platform/apple/isp/isp-fw.c:234:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     234 | void apple_isp_free_firmware_surface(struct apple_isp *isp)
         | ^
         | static 
>> drivers/media/platform/apple/isp/isp-fw.c:289:46: warning: shift count >= width of type [-Wshift-count-overflow]
     289 |         isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                     ^  ~~
   drivers/media/platform/apple/isp/isp-fw.c:383:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     383 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                                                                         ~~~~
         |                                                                         %x
     384 |                         chan->name, chan->type, chan->src, chan->num,
     385 |                         chan->iova);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:47: note: expanded from macro 'isp_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
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
   drivers/media/platform/apple/isp/isp-fw.c:533:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     533 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                                               ~~~~
         |                                               %x
     534 |                         surf->iova, surf->size, (void *)surf->virt);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:47: note: expanded from macro 'isp_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
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
   drivers/media/platform/apple/isp/isp-fw.c:600:5: warning: no previous prototype for function 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     600 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^
   drivers/media/platform/apple/isp/isp-fw.c:600:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     600 | int apple_isp_firmware_boot(struct apple_isp *isp)
         | ^
         | static 
   drivers/media/platform/apple/isp/isp-fw.c:621:6: warning: no previous prototype for function 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     621 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^
   drivers/media/platform/apple/isp/isp-fw.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         | ^
         | static 
   13 warnings generated.


vim +289 drivers/media/platform/apple/isp/isp-fw.c

   244	
   245	static int isp_firmware_boot_stage2(struct apple_isp *isp)
   246	{
   247		struct isp_firmware_bootargs args;
   248		dma_addr_t args_iova;
   249		int err, retries;
   250	
   251		u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
   252		u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
   253		u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
   254		isp->num_ipc_chans = num_ipc_chans;
   255	
   256		if (!isp->num_ipc_chans) {
   257			dev_err(isp->dev, "No IPC channels found\n");
   258			return -ENODEV;
   259		}
   260	
   261		if (isp->num_ipc_chans != 7)
   262			dev_warn(isp->dev, "unexpected channel count (%d)\n",
   263				 num_ipc_chans);
   264	
   265		isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
   266		if (!isp->extra_surf) {
   267			isp_err(isp, "failed to alloc surface for extra heap\n");
   268			return -ENOMEM;
   269		}
   270	
   271		args_iova = isp->ipc_surf->iova + args_offset + 0x40;
   272		isp->cmd_iova = args_iova + sizeof(args) + 0x40;
   273	
   274		memset(&args, 0, sizeof(args));
   275		args.ipc_iova = isp->ipc_surf->iova;
   276		args.ipc_size = isp->ipc_surf->size;
   277		args.shared_base = isp->fw.heap_top & 0xffffffff;
   278		args.shared_size = 0x10000000UL - args.shared_base;
   279		args.extra_iova = isp->extra_surf->iova;
   280		args.extra_size = isp->extra_surf->size;
   281		args.platform_id = isp->hw->platform_id;
   282		args.unk5 = 0x40;
   283		args.unk7 = 0x1;
   284		args.unk_iova1 = args_iova + sizeof(args) - 0xc;
   285		args.unk9 = 0x3;
   286		isp_iowrite(isp, args_iova, &args, sizeof(args));
   287	
   288		isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
 > 289		isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
   290		wmb();
   291	
   292		/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
   293		isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
   294	
   295		for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
   296			u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
   297			if (val == 0x8042006) {
   298				isp_dbg(isp,
   299					"got second magic number (0x%x) from firmware\n",
   300					val);
   301				break;
   302			}
   303			mdelay(ISP_FIRMWARE_MDELAY);
   304		}
   305		if (retries >= ISP_FIRMWARE_MAX_TRIES) {
   306			isp_err(isp,
   307				"never received second magic number from firmware\n");
   308			err = -ENODEV;
   309			goto free_extra;
   310		}
   311	
   312		return 0;
   313	
   314	free_extra:
   315		isp_free_surface(isp, isp->extra_surf);
   316		return err;
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
