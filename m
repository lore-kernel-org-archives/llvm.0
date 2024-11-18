Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BA18A6C6;
	Mon, 18 Nov 2024 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731921593; cv=none; b=dHOVqMrekG44VwvA1nwGPttfGi485Qyvf/iAYR9XvNyuUoqVievYF/62WqL7pCMAPnwB/9gv3eQbsQVIzZ1YSDAA/ytkwhxwd+yvTziC33WXB1nmhjhfZFx/xSil67Otf2gNT8FmDesZQk59u1gAVmZI4os4XxuPJxkhHfcILsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731921593; c=relaxed/simple;
	bh=jWRSDeooLQ3eaEGLpCQCurCRbXVY8ysESwTWbnbB83s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUQsErRQhCZdAUj6IbfQ7nFXAC+iZDofBDfYHZP+NAqwp7LFhd1mL7jK2zbWxgyS0DtUvsb6m7dl4UTwAPVLNtpmNR1XIZSyj5BazQlbOu2Xj83uIh++4S24c4vm9sWHfGb1D33HR0uurpJjPsRxwKCeWTY3njy/9GjnDfRlrd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpRx855h; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpRx855h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731921591; x=1763457591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWRSDeooLQ3eaEGLpCQCurCRbXVY8ysESwTWbnbB83s=;
  b=bpRx855h90nZ5Eq53gVs4ecCQ/PfezvbPsZBWjRtwn66RoqIYSXefmxL
   DzxE3NYiSW35qi3ajVjUkXVWZjKGZxuvF4S2g7m55DIAaolP5txL3fH+J
   VZpH8bAtLlriLNjE6WyiM1GEvSwPRetz+L90NxbF6QIwKlZcR2Xa+guNb
   UCNf+t6/3zLc8gmh0182StmWQcwUIgZmDlejW+RctwvrjW+zy0w6lKs6i
   KHN9qsXuDBJnc6Umtiy8HkNw+W2pe1xmre9V04d46jXe5hlxKkwZjrBU7
   AR6E83HEl0pI0ucwa1JRCKU2wAacTlWcNGomDVlPiVFAnD1RVlksI3+1y
   A==;
X-CSE-ConnectionGUID: GJ9umMQ0TZiTtJ6v9bnAbw==
X-CSE-MsgGUID: jGBSvgOWSPKBEq4LcCzblQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49403634"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49403634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:19:48 -0800
X-CSE-ConnectionGUID: srS860NSRw6Abno98WC5Bg==
X-CSE-MsgGUID: Nhd4KlVYTYGo81S9D2rAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120105265"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 01:19:47 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCxv6-0002LT-1V;
	Mon, 18 Nov 2024 09:19:44 +0000
Date: Mon, 18 Nov 2024 17:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 20/54]
 drivers/media/platform/apple/isp/isp-fw.c:290:46: warning: shift count >=
 width of type
Message-ID: <202411181744.C6bGNo9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   168f992948f0f021255ff3cfb365098fd122a225
commit: 71fe5bbcb639393e679bc25ba6a99e477f33b942 [20/54] media: apple: isp: Support >32bit VAs for t602x
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411181744.C6bGNo9v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181744.C6bGNo9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181744.C6bGNo9v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/isp/isp-fw.c:8:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/apple/isp/isp-fw.c:8:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/apple/isp/isp-fw.c:8:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/apple/isp/isp-fw.c:8:
   In file included from drivers/media/platform/apple/isp/isp-cmd.h:7:
   In file included from drivers/media/platform/apple/isp/isp-drv.h:13:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/media/platform/apple/isp/isp-fw.c:216:5: warning: no previous prototype for function 'apple_isp_alloc_firmware_surface' [-Wmissing-prototypes]
     216 | int apple_isp_alloc_firmware_surface(struct apple_isp *isp)
         |     ^
   drivers/media/platform/apple/isp/isp-fw.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     216 | int apple_isp_alloc_firmware_surface(struct apple_isp *isp)
         | ^
         | static 
   drivers/media/platform/apple/isp/isp-fw.c:235:6: warning: no previous prototype for function 'apple_isp_free_firmware_surface' [-Wmissing-prototypes]
     235 | void apple_isp_free_firmware_surface(struct apple_isp *isp)
         |      ^
   drivers/media/platform/apple/isp/isp-fw.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | void apple_isp_free_firmware_surface(struct apple_isp *isp)
         | ^
         | static 
>> drivers/media/platform/apple/isp/isp-fw.c:290:46: warning: shift count >= width of type [-Wshift-count-overflow]
     290 |         isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                     ^  ~~
   drivers/media/platform/apple/isp/isp-fw.c:384:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     382 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                                                                         ~~~~
         |                                                                         %x
     383 |                         chan->name, chan->type, chan->src, chan->num,
     384 |                         chan->iova);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:47: note: expanded from macro 'isp_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:534:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     533 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                                               ~~~~
         |                                               %x
     534 |                         surf->iova, surf->size, (void *)surf->virt);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:47: note: expanded from macro 'isp_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:601:5: warning: no previous prototype for function 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     601 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^
   drivers/media/platform/apple/isp/isp-fw.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     601 | int apple_isp_firmware_boot(struct apple_isp *isp)
         | ^
         | static 
   drivers/media/platform/apple/isp/isp-fw.c:622:6: warning: no previous prototype for function 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     622 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^
   drivers/media/platform/apple/isp/isp-fw.c:622:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     622 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         | ^
         | static 
   14 warnings generated.


vim +290 drivers/media/platform/apple/isp/isp-fw.c

   245	
   246	static int isp_firmware_boot_stage2(struct apple_isp *isp)
   247	{
   248		struct isp_firmware_bootargs args;
   249		dma_addr_t args_iova;
   250		int err, retries;
   251	
   252		u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
   253		u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
   254		u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
   255		isp->num_ipc_chans = num_ipc_chans;
   256	
   257		if (!isp->num_ipc_chans) {
   258			dev_err(isp->dev, "No IPC channels found\n");
   259			return -ENODEV;
   260		}
   261	
   262		if (isp->num_ipc_chans != 7)
   263			dev_warn(isp->dev, "unexpected channel count (%d)\n",
   264				 num_ipc_chans);
   265	
   266		isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
   267		if (!isp->extra_surf) {
   268			isp_err(isp, "failed to alloc surface for extra heap\n");
   269			return -ENOMEM;
   270		}
   271	
   272		args_iova = isp->ipc_surf->iova + args_offset + 0x40;
   273		isp->cmd_iova = args_iova + sizeof(args) + 0x40;
   274	
   275		memset(&args, 0, sizeof(args));
   276		args.ipc_iova = isp->ipc_surf->iova;
   277		args.ipc_size = isp->ipc_surf->size;
   278		args.shared_base = isp->fw.heap_top & 0xffffffff;
   279		args.shared_size = 0x10000000UL - args.shared_base;
   280		args.extra_iova = isp->extra_surf->iova;
   281		args.extra_size = isp->extra_surf->size;
   282		args.platform_id = isp->hw->platform_id;
   283		args.unk5 = 0x40;
   284		args.unk7 = 0x1;
   285		args.unk_iova1 = args_iova + sizeof(args) - 0xc;
   286		args.unk9 = 0x3;
   287		isp_iowrite(isp, args_iova, &args, sizeof(args));
   288	
   289		isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
 > 290		isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
   291		wmb();
   292	
   293		/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
   294		isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
   295	
   296		for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
   297			u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
   298			if (val == 0x8042006) {
   299				isp_dbg(isp,
   300					"got second magic number (0x%x) from firmware\n",
   301					val);
   302				break;
   303			}
   304			mdelay(ISP_FIRMWARE_MDELAY);
   305		}
   306		if (retries >= ISP_FIRMWARE_MAX_TRIES) {
   307			isp_err(isp,
   308				"never received second magic number from firmware\n");
   309			err = -ENODEV;
   310			goto free_extra;
   311		}
   312	
   313		return 0;
   314	
   315	free_extra:
   316		isp_free_surface(isp, isp->extra_surf);
   317		return err;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
