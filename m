Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA213DDAE;
	Sun, 10 May 2026 06:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778393738; cv=none; b=XODDHGkcOR2tuSoEEx4TTVXLkGfGhpBxUM0R7kbPOS5mi6Ja+VCQFocvSG7ZCfStBkrWkVhrBzsaOAaC+TEcXxMPItLHj6KjEVGjIyJD4Exq4iOx0k9CW9ejfnuM4h0LmNvl4QCWK+meQoXbH9W25/ptpiW/w7v3E1un+eJ495Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778393738; c=relaxed/simple;
	bh=s7szFs8i6jU97ZyxoAnmXOXOlHxG0SLssYxvssyiN2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=otzvr9stMw1w7+2V8rmp+tsdjYrCPeHivEJGp6FvKKwtd0umAgbmk+l/G9PLwEZA2/weMYrHLd9psII3NMrTp77BAGt/mmwBeOTZcrdWaGH16P10yCflPcMYrIIM7LcGmXgcQNX4UZ7n9k8rabBStaVNYIei7lL9CNnfxMxnd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEihetIa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEihetIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778393736; x=1809929736;
  h=date:from:to:cc:subject:message-id;
  bh=s7szFs8i6jU97ZyxoAnmXOXOlHxG0SLssYxvssyiN2o=;
  b=ZEihetIap7lVnq2K7Clsr7YtjzaZ3GA6TfT3CUQpn2eBfZ7WEYtGfhgp
   fdXN92lAMHcpLzSrtULQZhiZoiTAL9LEtHsCfkjyMH5GPlT/VqGrw1wzV
   2xA4GdC3dKDBhqD6YB1iHlig1ekG4urSexD6lARnJ0gBagMIaP/fihhKQ
   8BBq5s3oy6Qf8fmarqiBE1oe3WcBx7mLeztDXGjRGsb9DoV5me8azHjE7
   t4KS3Ze0Pw9XMDHc6JeuBEFllHrKjUhgpX1Nw/7c/q+oJYXAoaLIAztUG
   7QCPyqm42SN/F6nCo5ytmg703r1Oht7qeNOv4S9oP4Yyv100eE0EyKbHs
   A==;
X-CSE-ConnectionGUID: UiuNzGrqSWSd/CYDwWsJIQ==
X-CSE-MsgGUID: YHWsbsp9TyOmP3tV4OvWDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="66848178"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="66848178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 23:15:35 -0700
X-CSE-ConnectionGUID: ofrzcxkpR4qorvGw/kQ2KQ==
X-CSE-MsgGUID: hs6KGBEATh6fbVLWDVB6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="241505970"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2026 23:15:34 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLxRr-000000001pT-1QUC;
	Sun, 10 May 2026 06:15:31 +0000
Date: Sun, 10 May 2026 14:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/53]
 drivers/media/platform/apple/isp/isp-cam.c:378:58: warning: format specifies
 type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202605101415.Q0gPRopK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   50d4a0c32a10908320be6a9f3971221f726d4a20
commit: 45af4de5649cf1b84dd0076a4c77e3e3d550ba0d [1/53] media: apple: Add Apple ISP driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101415.Q0gPRopK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101415.Q0gPRopK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101415.Q0gPRopK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-cam.c:378:58: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                                         ~~~            ^~~~~~~~
         |                                                         %zx
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.
--
   drivers/media/platform/apple/isp/isp-fw.c:246:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     246 |         if (!isp->data_surf) {
         |             ^~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:299:9: note: uninitialized use occurs here
     299 |         return err;
         |                ^~~
   drivers/media/platform/apple/isp/isp-fw.c:246:2: note: remove the 'if' if its condition is always false
     246 |         if (!isp->data_surf) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
     247 |                 isp_err(isp, "failed to alloc surface for data files\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     248 |                 goto free_extra;
         |                 ~~~~~~~~~~~~~~~~
     249 |         }
         |         ~
   drivers/media/platform/apple/isp/isp-fw.c:240:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     240 |         if (!isp->extra_surf) {
         |             ^~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:299:9: note: uninitialized use occurs here
     299 |         return err;
         |                ^~~
   drivers/media/platform/apple/isp/isp-fw.c:240:2: note: remove the 'if' if its condition is always false
     240 |         if (!isp->extra_surf) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     241 |                 isp_err(isp, "failed to alloc surface for extra heap\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     242 |                 goto free_ipc;
         |                 ~~~~~~~~~~~~~~
     243 |         }
         |         ~
   drivers/media/platform/apple/isp/isp-fw.c:217:9: note: initialize the variable 'err' to silence this warning
     217 |         int err, retries;
         |                ^
         |                 = 0
>> drivers/media/platform/apple/isp/isp-fw.c:365:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     363 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                                                                         ~~~~
         |                                                                         %x
     364 |                         chan->name, chan->type, chan->src, chan->num,
     365 |                         chan->iova);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:249:47: note: expanded from macro 'isp_dbg'
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
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
   drivers/media/platform/apple/isp/isp-fw.c:514:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     513 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                                               ~~~~
         |                                               %x
     514 |                         surf->iova, surf->size, (void *)surf->virt);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:249:47: note: expanded from macro 'isp_dbg'
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
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
   drivers/media/platform/apple/isp/isp-fw.c:581:5: warning: no previous prototype for function 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     581 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^
   drivers/media/platform/apple/isp/isp-fw.c:581:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     581 | int apple_isp_firmware_boot(struct apple_isp *isp)
         | ^
         | static 
   drivers/media/platform/apple/isp/isp-fw.c:602:6: warning: no previous prototype for function 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     602 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^
   drivers/media/platform/apple/isp/isp-fw.c:602:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     602 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         | ^
         | static 
   6 warnings generated.
--
>> drivers/media/platform/apple/isp/isp-iommu.c:137:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     136 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~~
         |                                                                      %x
     137 |                         surf->iova);
         |                         ^~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:183:16: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     182 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                                                                    ~~~~
         |                                                                    %x
     183 |                         surf->size, surf->iova);
         |                                     ^~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:213:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     212 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                                          ~~~~
         |                                                          %x
     213 |                         surf->iova, surf->iova + surf->size);
         |                         ^~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:261:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     260 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~~
         |                                                                      %x
     261 |                         surf->iova);
         |                         ^~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   4 warnings generated.
--
>> drivers/media/platform/apple/isp/isp-ipc.c:228:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     227 |                 isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
         |                                                     ~~~~
         |                                                     %x
     228 |                         surf->iova, surf->size);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:253:47: note: expanded from macro 'isp_err'
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


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
