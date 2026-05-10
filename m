Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A1B278161;
	Sun, 10 May 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432267; cv=none; b=iQmvtzfRm9GvwZgdZZmFS/zUz0jYsg2qEmEQSHpY+n5zKp46vYqxkpTRxc9WgpqtzPXUVzibNbsw6eV4lHz1jCHUKxrW0ct+tUL9Kv6A/+UM5GOz62/BySwwTVfivmYsfXoCqADg7uGgKFcuPNIAv81y0uFt3o8cPf61J83qCcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432267; c=relaxed/simple;
	bh=NC+DVt0N3zXCYWcS3iYtNGz6Korao8ifXNvqJC7YAQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aWVlHEo02/rcmfSGd/662R8rnQ0kmhMES3g8LXywrXonZSPiXoyUVK/cyUTNCI0AHh8J+ytecpKaXzafNA4hMsEoNMK7hWvizfsuFKTF9PAIU6zWxIfvLzTd5EolnmOJGvAZM5//BvrsWJESnjWXAmFrL1PQ92WPdwNKCR/u7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCpRr+6V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCpRr+6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778432265; x=1809968265;
  h=date:from:to:cc:subject:message-id;
  bh=NC+DVt0N3zXCYWcS3iYtNGz6Korao8ifXNvqJC7YAQg=;
  b=TCpRr+6Vugf9HFwF50ieyEZiqfV/h8lpt5qu/a2+d2Bf729t50h2Iez+
   CjEdLNz6lsCFg6/pD+ZypYmN23nCL6PGOWUlhSg39bGFKgvl50+80u/nC
   WeiWSeZhtvedAIODm/8oBdooCWMc83GNnqmfaPyqfb/4hbNxc+frrLxzN
   AUBVmf3zKWWl6RxaBurvZGmLFnoi+gdDqHf+IlcmveIWTyWX7TEjx5e7J
   uqRKzRpHuT79nwO89XF4QJ6RSbBXZ2AyPPu0VdrSd/p5oaDB7rYW2Mhwc
   E42uXfhx5XKBksMM/sQ8FRUaMqKjn5Gj3/W8eCJTB+ebOd/TQrPIoLoGV
   g==;
X-CSE-ConnectionGUID: KM6ntBPIS7eZfEGivuaJGg==
X-CSE-MsgGUID: UyEY2yFjRFe8o7W/JVvc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79194579"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79194579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 09:57:44 -0700
X-CSE-ConnectionGUID: nZZQgt6fTLGK3QNNPzOXZg==
X-CSE-MsgGUID: glV0KjofQcufrmlDpZ+XDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="237343842"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2026 09:57:42 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM7TH-000000002Qr-0Tb4;
	Sun, 10 May 2026 16:57:39 +0000
Date: Mon, 11 May 2026 00:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 20/53]
 drivers/media/platform/apple/isp/isp-fw.c:290:46: warning: shift count >=
 width of type
Message-ID: <202605110032.WXJJE5s2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   50d4a0c32a10908320be6a9f3971221f726d4a20
commit: ea1d8ea146083e1beae8ebba03a97a558205cec6 [20/53] media: apple: isp: Support >32bit VAs for t602x
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260511/202605110032.WXJJE5s2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110032.WXJJE5s2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110032.WXJJE5s2-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
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
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
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
   7 warnings generated.


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
