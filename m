Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A5469F;
	Thu, 13 Jul 2023 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689231293; x=1720767293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwLbD1jfFGVrYvC3uLH1ooDWLgmxa4QaJFk1OvGxhzQ=;
  b=JM4uyltlkroFY969bLaVvOWS/pI5KA1zEX+yZeg2+MThlH5HYNU2I3Qw
   OkGzoicKKRIDrqEZyenK4FmLpuMQVBrZn/uPoq+WtbXQX8pJBBHTLA6WY
   Xgp24e7uLjouVQITg4KvJzcvwgEOltz2vMLG6tQHifI48hN8/yJQ9fKjZ
   P1gBrlKWFnR5dNsNwGAKYT3eYREgrg3CLOeeaTmRPMv+PFOQII8Wz4mQG
   fCYefzAqkOaDPQEm9ygxSB4Zt4ka2t/+a+Rl0M36Uhet15MENuPvYZdLi
   FnYt9I+Xhd67U/HSC+K3zFAu1Kz6+hct083JIpzWiCBj5I5OuA7e9QcaV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="368640457"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="368640457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 23:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="757055084"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="757055084"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jul 2023 23:54:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJqDn-0006L1-1V;
	Thu, 13 Jul 2023 06:54:39 +0000
Date: Thu, 13 Jul 2023 14:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 78/83]
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:382:13: warning: variable
 'align' is uninitialized when used here
Message-ID: <202307131416.bRbzIoUq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   25db92a3e5514b0563efc2877003c303512d589a
commit: fc2c4965901a59ac99e785c25f08231208a7eb37 [78/83] WIPdrm/nouveau/gr/r535: initial support
config: s390-randconfig-r026-20230712 (https://download.01.org/0day-ci/archive/20230713/202307131416.bRbzIoUq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131416.bRbzIoUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131416.bRbzIoUq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h:27:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h:4:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h:27:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h:4:
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
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h:27:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h:4:
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
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:382:13: warning: variable 'align' is uninitialized when used here [-Wuninitialized]
     382 |                            size, align, (id < ARRAY_SIZE(map)) ? "*" : "");
         |                                  ^~~~~
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:90:67: note: expanded from macro 'nvkm_debug'
      90 | #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
         |                                                                   ^
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:85:73: note: expanded from macro 'nvkm_printk'
      85 | #define nvkm_printk(s,l,p,f,a...) nvkm_printk_((s), NV_DBG_##l, p, f, ##a)
         |                                                                         ^
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:84:71: note: expanded from macro 'nvkm_printk_'
      84 | #define nvkm_printk_(s,l,p,f,a...) nvkm_printk__((s), (l), p, " "f, ##a)
         |                                                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:78:66: note: expanded from macro 'nvkm_printk___'
      78 |                         dev_##p((s)->device->dev, "%s(%s):"f, (s)->name, (u)->name, ##a);    \
         |                                                                                       ^
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:373:11: note: initialize the variable 'align' to silence this warning
     373 |                 u8 align, page;
         |                         ^
         |                          = '\0'
   13 warnings generated.


vim +/align +382 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c

   242	
   243	static int
   244	r535_gr_oneinit(struct nvkm_gr *base)
   245	{
   246		NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
   247		struct r535_gr *gr = container_of(base, typeof(*gr), base);
   248		struct nvkm_subdev *subdev = &gr->base.engine.subdev;
   249		struct nvkm_device *device = subdev->device;
   250		struct nvkm_gsp *gsp = device->gsp;
   251		struct nvkm_mmu *mmu = device->mmu;
   252		struct {
   253			struct nvkm_memory *inst;
   254			struct nvkm_vmm *vmm;
   255			struct nvkm_gsp_object chan;
   256			struct nvkm_vma *vma[R515_GR_MAX_CTXBUFS];
   257		} golden = {};
   258		int ret;
   259	
   260		/* Allocate a channel to use for golden context init. */
   261		ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x12000, 0, true, &golden.inst);
   262		if (ret)
   263			goto done;
   264	
   265		ret = nvkm_vmm_new(device, 0x1000, 0, NULL, 0, NULL, "grGoldenVmm", &golden.vmm);
   266		if (ret)
   267			goto done;
   268	
   269		ret = mmu->func->promote_vmm(golden.vmm);
   270		if (ret)
   271			goto done;
   272	
   273		{
   274			NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
   275	
   276			args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, 0xf1f00000,
   277						     device->fifo->func->chan.user.oclass,
   278						     sizeof(*args), &golden.chan);
   279			if (IS_ERR(args)) {
   280				ret = PTR_ERR(args);
   281				goto done;
   282			}
   283	
   284			args->gpFifoOffset = 0;
   285			args->gpFifoEntries = 0x1000 / 8;
   286			args->flags =
   287				NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL) |
   288				NVDEF(NVOS04, FLAGS, VPR, FALSE) |
   289				NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE) |
   290				NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, 0) |
   291				NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, TRUE) |
   292				NVDEF(NVOS04, FLAGS, DELAY_CHANNEL_SCHEDULING, FALSE) |
   293				NVDEF(NVOS04, FLAGS, CHANNEL_DENY_PHYSICAL_MODE_CE, FALSE) |
   294				NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_VALUE, 0) |
   295				NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_FIXED, FALSE) |
   296				NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_VALUE, 0) |
   297				NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_FIXED, TRUE) |
   298				NVDEF(NVOS04, FLAGS, CHANNEL_DENY_AUTH_LEVEL_PRIV, FALSE) |
   299				NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_SCRUBBER, FALSE) |
   300				NVDEF(NVOS04, FLAGS, CHANNEL_CLIENT_MAP_FIFO, FALSE) |
   301				NVDEF(NVOS04, FLAGS, SET_EVICT_LAST_CE_PREFETCH_CHANNEL, FALSE) |
   302				NVDEF(NVOS04, FLAGS, CHANNEL_VGPU_PLUGIN_CONTEXT, FALSE) |
   303				NVDEF(NVOS04, FLAGS, CHANNEL_PBDMA_ACQUIRE_TIMEOUT, FALSE) |
   304				NVDEF(NVOS04, FLAGS, GROUP_CHANNEL_THREAD, DEFAULT) |
   305				NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE) |
   306				NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
   307			args->hVASpace = golden.vmm->rm.object.handle;
   308			args->engineType = 1;
   309			args->instanceMem.base = nvkm_memory_addr(golden.inst);
   310			args->instanceMem.size = 0x1000;
   311			args->instanceMem.addressSpace = 2;
   312			args->instanceMem.cacheAttrib = 1;
   313			args->ramfcMem.base = nvkm_memory_addr(golden.inst);
   314			args->ramfcMem.size = 0x200;
   315			args->ramfcMem.addressSpace = 2;
   316			args->ramfcMem.cacheAttrib = 1;
   317			args->userdMem.base = nvkm_memory_addr(golden.inst) + 0x1000;
   318			args->userdMem.size = 0x200;
   319			args->userdMem.addressSpace = 2;
   320			args->userdMem.cacheAttrib = 1;
   321			args->mthdbufMem.base = nvkm_memory_addr(golden.inst) + 0x2000;
   322			args->mthdbufMem.size = 0x5000;
   323			args->mthdbufMem.addressSpace = 2;
   324			args->mthdbufMem.cacheAttrib = 1;
   325			args->internalFlags =
   326				NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, ADMIN) |
   327				NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE) |
   328				NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
   329	
   330			ret = nvkm_gsp_rm_alloc_wr(&golden.chan, args);
   331			if (ret)
   332				goto done;
   333		}
   334	
   335		/* Fetch context buffer info from RM and allocate each of them here to use
   336		 * during golden context init (or later as a global context buffer).
   337		 *
   338		 * Also build the information that'll be used to create channel contexts.
   339		 */
   340		info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
   341					   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
   342					   sizeof(*info));
   343		if (WARN_ON(IS_ERR(info))) {
   344			ret = PTR_ERR(info);
   345			goto done;
   346		}
   347	
   348		for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++) {
   349			static const struct {
   350				u32     id0; /* NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID */
   351				u32     id1; /* NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID */
   352				bool global;
   353				bool   init;
   354				bool     ro;
   355			} map[] = {
   356	#define _A(n,N,G,I,R) { .id0 = NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_##n, \
   357				.id1 = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_##N, \
   358				.global = (G), .init = (I), .ro = (R) }
   359	#define _B(N,G,I,R) _A(GRAPHICS_##N, N, (G), (I), (R))
   360				/*                                       global   init     ro */
   361				_A(           GRAPHICS,             MAIN, false,  true, false),
   362				_B(                                PATCH, false,  true, false),
   363				_A( GRAPHICS_BUNDLE_CB, BUFFER_BUNDLE_CB,  true, false, false),
   364				_B(                             PAGEPOOL,  true, false, false),
   365				_B(                         ATTRIBUTE_CB,  true, false, false),
   366				_B(                        RTV_CB_GLOBAL,  true, false, false),
   367				_B(                           FECS_EVENT,  true,  true, false),
   368				_B(                      PRIV_ACCESS_MAP,  true,  true,  true),
   369	#undef _B
   370	#undef _A
   371			};
   372			u32 size = info->engineContextBuffersInfo[0].engine[i].size;
   373			u8 align, page;
   374			int id;
   375	
   376			for (id = 0; id < ARRAY_SIZE(map); id++) {
   377				if (map[id].id0 == i)
   378					break;
   379			}
   380	
   381			nvkm_debug(subdev, "%02x: size:0x%08x align:0x%08x %s\n", i,
 > 382				   size, align, (id < ARRAY_SIZE(map)) ? "*" : "");
   383			if (id >= ARRAY_SIZE(map))
   384				continue;
   385	
   386			if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN)
   387				size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
   388	
   389			if      (size >= 1 << 21) page = 21;
   390			else if (size >= 1 << 16) page = 16;
   391			else			  page = 12;
   392	
   393			if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB)
   394				align = order_base_2(size);
   395			else
   396				align = page;
   397	
   398			if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
   399				continue;
   400	
   401			gr->ctxbuf[gr->ctxbuf_nr].bufferId = map[id].id1;
   402			gr->ctxbuf[gr->ctxbuf_nr].size     = size;
   403			gr->ctxbuf[gr->ctxbuf_nr].page     = page;
   404			gr->ctxbuf[gr->ctxbuf_nr].align    = align;
   405			gr->ctxbuf[gr->ctxbuf_nr].global   = map[id].global;
   406			gr->ctxbuf[gr->ctxbuf_nr].init     = map[id].init;
   407			gr->ctxbuf[gr->ctxbuf_nr].ro       = map[id].ro;
   408			gr->ctxbuf_nr++;
   409	
   410			if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP) {
   411				if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
   412					continue;
   413	
   414				gr->ctxbuf[gr->ctxbuf_nr] = gr->ctxbuf[gr->ctxbuf_nr - 1];
   415				gr->ctxbuf[gr->ctxbuf_nr].bufferId =
   416					NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
   417				gr->ctxbuf_nr++;
   418			}
   419		}
   420	
   421		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
   422	
   423		/* Promote golden context to RM. */
   424		ret = r535_gr_promote_ctx(gr, true, golden.vmm, gr->ctxbuf_mem, golden.vma, &golden.chan);
   425		if (ret)
   426			goto done;
   427	
   428		/* Allocate 3D class on channel to trigger golden context init in RM. */
   429		{
   430			int i;
   431	
   432			for (i = 0; gr->base.func->sclass[i].ctor; i++) {
   433				if ((gr->base.func->sclass[i].oclass & 0xff) == 0x97) {
   434					struct nvkm_gsp_object threed;
   435	
   436					ret = nvkm_gsp_rm_alloc(&golden.chan, 0x97000000,
   437								gr->base.func->sclass[i].oclass, 0,
   438								&threed);
   439					if (ret)
   440						goto done;
   441	
   442					nvkm_gsp_rm_free(&threed);
   443					break;
   444				}
   445			}
   446	
   447			if (WARN_ON(!gr->base.func->sclass[i].ctor)) {
   448				ret = -EINVAL;
   449				goto done;
   450			}
   451		}
   452	
   453	done:
   454		nvkm_gsp_rm_free(&golden.chan);
   455		for (int i = gr->ctxbuf_nr - 1; i >= 0; i--)
   456			nvkm_vmm_put(golden.vmm, &golden.vma[i]);
   457		nvkm_vmm_unref(&golden.vmm);
   458		nvkm_memory_unref(&golden.inst);
   459		return ret;
   460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
