Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A620F8E;
	Wed, 12 Jul 2023 19:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689188831; x=1720724831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M1Dp/cbEsk1JdVsJnQjzTXulT6UHNErky1OV1oQ7O2Q=;
  b=iDAm0bc/1GN4onk0Z5ONK8o4BnRtRcB5Rx5edP9PSNGXvX8zeaoa9ile
   4n9YRxq2CkmiBvUj6vExBs4WAcBiRp8L3ncg1JbzQdMhMPr/RLYy1h4b2
   XNxZE0ke9NvuYwapX1XUx+YQRczXW726EHhBzcYjaFRELXsf02ge0eUJa
   YmF5cyYOOTArtua3IhRYIrk4A2nbUm9xq6jmnYdfpJloNduUTj0ze0Q3J
   dav2vxPVSWzfSoU5+9m340rT6wmEgdP4bmpwsNntM/bOPBS5w4+wx9+9e
   hKM8u9PwjEsKk8PN2dwWvwTsUvo7vGmKkzw5QLbIbaOnresttJ0Fxpt9S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344578369"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="344578369"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 12:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="671973965"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="671973965"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2023 12:07:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJfB2-0005w6-2X;
	Wed, 12 Jul 2023 19:07:04 +0000
Date: Thu, 13 Jul 2023 03:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 76/83]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous
 prototype for function 'r535_fifo_runl_ctor'
Message-ID: <202307130343.InlOx9Mq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3f6fc48703e02597683babc04c512ca13bb95e19
commit: bb6ac47f73075e361e7abcafa3a4dd5610596e8c [76/83] WIPdrm/nouveau/fifo/r535: initial support
config: s390-randconfig-r044-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130343.InlOx9Mq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130343.InlOx9Mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130343.InlOx9Mq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
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
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous prototype for function 'r535_fifo_runl_ctor' [-Wmissing-prototypes]
     303 | r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
         | ^
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:302:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     302 | int
         | ^
         | static 
   13 warnings generated.


vim +/r535_fifo_runl_ctor +303 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c

   300	
   301	
   302	int
 > 303	r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
   304	{
   305		struct nvkm_subdev *subdev = &fifo->engine.subdev;
   306		struct nvkm_gsp *gsp = subdev->device->gsp;
   307		struct nvkm_runl *runl;
   308		struct nvkm_engn *engn;
   309		int ret;
   310		NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
   311	
   312		//XXX: chid<->userd + per-RL chid
   313		if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->cgid)) ||
   314		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->chid)))
   315			return ret;
   316	
   317		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
   318					   NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE, sizeof(*ctrl));
   319		if (WARN_ON(IS_ERR(ctrl)))
   320			return PTR_ERR(ctrl);
   321	
   322		for (int i = 0; i < ctrl->numEntries; i++) {
   323			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   324			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   325	
   326			runl = nvkm_runl_get(fifo, id, addr);
   327			if (!runl) {
   328				runl = nvkm_runl_new(fifo, id, addr, 0 /*XXX: chid<->userd + per-RL chid*/);
   329				if (WARN_ON(IS_ERR(runl)))
   330					continue;
   331			}
   332		}
   333	
   334		for (int i = 0; i < ctrl->numEntries; i++) {
   335			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   336			const u32 rmid = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RM_ENGINE_TYPE];
   337			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   338			enum nvkm_subdev_type type;
   339			int inst, nv2080;
   340	
   341			runl = nvkm_runl_get(fifo, id, addr);
   342			if (!runl)
   343				continue;
   344	
   345			inst = r535_fifo_engn_type(rmid, &type);
   346			if (inst < 0) {
   347				nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", rmid);
   348				nvkm_runl_del(runl);
   349				continue;
   350			}
   351	
   352			nv2080 = r535_fifo_2080_type(type, inst);
   353			if (nv2080 < 0) {
   354				nvkm_runl_del(runl);
   355				continue;
   356			}
   357	
   358			switch (type) {
   359			case NVKM_ENGINE_CE:
   360			case NVKM_ENGINE_GR:
   361				engn = nvkm_runl_add(runl, nv2080, &r535_engn, type, inst);
   362				break;
   363			case NVKM_ENGINE_SW:
   364				continue;
   365			default:
   366				engn = NULL;
   367				break;
   368			}
   369	
   370			if (!engn) {
   371				nvkm_runl_del(runl);
   372				continue;
   373			}
   374		}
   375	
   376		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
   377		return 0;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
