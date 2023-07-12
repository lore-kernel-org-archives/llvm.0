Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961C4DDC8;
	Wed, 12 Jul 2023 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689195610; x=1720731610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZThj7MLqPowzwrJj6pzs7RmC7CycTcfjL00CIwEQpqc=;
  b=ZlohZ+ODvbkrRo2ZePN8paU5wPQizsF27y2EMS4gDd7Af1fWLwagF749
   KucNmun13Q6zzpeIagpdhPLqEk6QIk8eKMEB+LcT/ubOeO2mkCb7nCS3e
   O0XFAiAMtEltsVwpn/4xdAVQkPtFxJ78YWB8xeJg8Pdsxlhf/xb7ZDHbc
   D/jsp9XsRIVcIlj2QBbXuocQnCtUysJIyAUQx1QsEAnrqKGB91IFgjlFN
   kF8P5Grljcvuku+LdEZdRFdFxBAlhZyol16Pe81G1n1ZjAWqxJd8VhJ/R
   G/ylnnTNBnm4oIv7iZYD8iYu6rvpQ6toU8Z78uXeZXGyVS/AD+gtzFt3v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="365038246"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="365038246"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 14:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="845782629"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="845782629"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jul 2023 14:00:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJgwQ-0005z7-0m;
	Wed, 12 Jul 2023 21:00:06 +0000
Date: Thu, 13 Jul 2023 04:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 78/83]
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:381:13: warning: variable
 'align' is uninitialized when used here
Message-ID: <202307130438.aTVcvZsq-lkp@intel.com>
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
commit: 2f331c626dfe7f0f631509e197d72be4d91a02e3 [78/83] WIPdrm/nouveau/gr/r535: initial support
config: s390-randconfig-r044-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130438.aTVcvZsq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130438.aTVcvZsq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130438.aTVcvZsq-lkp@intel.com/

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
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:381:13: warning: variable 'align' is uninitialized when used here [-Wuninitialized]
     381 |                            size, align, (id < ARRAY_SIZE(map)) ? "*" : "");
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
   drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:372:11: note: initialize the variable 'align' to silence this warning
     372 |                 u8 align, page;
         |                         ^
         |                          = '\0'
   13 warnings generated.


vim +/align +381 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c

   241	
   242	static int
   243	r535_gr_oneinit(struct nvkm_gr *base)
   244	{
   245		NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
   246		struct r535_gr *gr = container_of(base, typeof(*gr), base);
   247		struct nvkm_subdev *subdev = &gr->base.engine.subdev;
   248		struct nvkm_device *device = subdev->device;
   249		struct nvkm_gsp *gsp = device->gsp;
   250		struct nvkm_mmu *mmu = device->mmu;
   251		struct {
   252			struct nvkm_memory *inst;
   253			struct nvkm_vmm *vmm;
   254			struct nvkm_gsp_object chan;
   255			struct nvkm_vma *vma[R515_GR_MAX_CTXBUFS];
   256		} golden = {};
   257		int ret;
   258	
   259		/* Allocate a channel to use for golden context init. */
   260		ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x12000, 0, true, &golden.inst);
   261		if (ret)
   262			goto done;
   263	
   264		ret = nvkm_vmm_new(device, 0x1000, 0, NULL, 0, NULL, "grGoldenVmm", &golden.vmm);
   265		if (ret)
   266			goto done;
   267	
   268		ret = mmu->func->promote_vmm(golden.vmm);
   269		if (ret)
   270			goto done;
   271	
   272		{
   273			NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
   274	
   275			args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, 0xf1f00000,
   276						     device->fifo->func->chan.user.oclass,
   277						     sizeof(*args), &golden.chan);
   278			if (IS_ERR(args)) {
   279				ret = PTR_ERR(args);
   280				goto done;
   281			}
   282	
   283			args->gpFifoOffset = 0;
   284			args->gpFifoEntries = 0x1000 / 8;
   285			args->flags =
   286				NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL) |
   287				NVDEF(NVOS04, FLAGS, VPR, FALSE) |
   288				NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE) |
   289				NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, 0) |
   290				NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, TRUE) |
   291				NVDEF(NVOS04, FLAGS, DELAY_CHANNEL_SCHEDULING, FALSE) |
   292				NVDEF(NVOS04, FLAGS, CHANNEL_DENY_PHYSICAL_MODE_CE, FALSE) |
   293				NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_VALUE, 0) |
   294				NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_FIXED, FALSE) |
   295				NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_VALUE, 0) |
   296				NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_FIXED, TRUE) |
   297				NVDEF(NVOS04, FLAGS, CHANNEL_DENY_AUTH_LEVEL_PRIV, FALSE) |
   298				NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_SCRUBBER, FALSE) |
   299				NVDEF(NVOS04, FLAGS, CHANNEL_CLIENT_MAP_FIFO, FALSE) |
   300				NVDEF(NVOS04, FLAGS, SET_EVICT_LAST_CE_PREFETCH_CHANNEL, FALSE) |
   301				NVDEF(NVOS04, FLAGS, CHANNEL_VGPU_PLUGIN_CONTEXT, FALSE) |
   302				NVDEF(NVOS04, FLAGS, CHANNEL_PBDMA_ACQUIRE_TIMEOUT, FALSE) |
   303				NVDEF(NVOS04, FLAGS, GROUP_CHANNEL_THREAD, DEFAULT) |
   304				NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE) |
   305				NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
   306			args->hVASpace = golden.vmm->rm.object.handle;
   307			args->engineType = 1;
   308			args->instanceMem.base = nvkm_memory_addr(golden.inst);
   309			args->instanceMem.size = 0x1000;
   310			args->instanceMem.addressSpace = 2;
   311			args->instanceMem.cacheAttrib = 1;
   312			args->ramfcMem.base = nvkm_memory_addr(golden.inst);
   313			args->ramfcMem.size = 0x200;
   314			args->ramfcMem.addressSpace = 2;
   315			args->ramfcMem.cacheAttrib = 1;
   316			args->userdMem.base = nvkm_memory_addr(golden.inst) + 0x1000;
   317			args->userdMem.size = 0x200;
   318			args->userdMem.addressSpace = 2;
   319			args->userdMem.cacheAttrib = 1;
   320			args->mthdbufMem.base = nvkm_memory_addr(golden.inst) + 0x2000;
   321			args->mthdbufMem.size = 0x5000;
   322			args->mthdbufMem.addressSpace = 2;
   323			args->mthdbufMem.cacheAttrib = 1;
   324			args->internalFlags =
   325				NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, ADMIN) |
   326				NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE) |
   327				NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
   328	
   329			ret = nvkm_gsp_rm_alloc_wr(&golden.chan, args);
   330			if (ret)
   331				goto done;
   332		}
   333	
   334		/* Fetch context buffer info from RM and allocate each of them here to use
   335		 * during golden context init (or later as a global context buffer).
   336		 *
   337		 * Also build the information that'll be used to create channel contexts.
   338		 */
   339		info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
   340					   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
   341					   sizeof(*info));
   342		if (WARN_ON(IS_ERR(info))) {
   343			ret = PTR_ERR(info);
   344			goto done;
   345		}
   346	
   347		for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++) {
   348			static const struct {
   349				u32     id0; /* NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID */
   350				u32     id1; /* NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID */
   351				bool global;
   352				bool   init;
   353				bool     ro;
   354			} map[] = {
   355	#define _A(n,N,G,I,R) { .id0 = NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_##n, \
   356				.id1 = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_##N, \
   357				.global = (G), .init = (I), .ro = (R) }
   358	#define _B(N,G,I,R) _A(GRAPHICS_##N, N, (G), (I), (R))
   359				/*                                       global   init     ro */
   360				_A(           GRAPHICS,             MAIN, false,  true, false),
   361				_B(                                PATCH, false,  true, false),
   362				_A( GRAPHICS_BUNDLE_CB, BUFFER_BUNDLE_CB,  true, false, false),
   363				_B(                             PAGEPOOL,  true, false, false),
   364				_B(                         ATTRIBUTE_CB,  true, false, false),
   365				_B(                        RTV_CB_GLOBAL,  true, false, false),
   366				_B(                           FECS_EVENT,  true,  true, false),
   367				_B(                      PRIV_ACCESS_MAP,  true,  true,  true),
   368	#undef _B
   369	#undef _A
   370			};
   371			u32 size = info->engineContextBuffersInfo[0].engine[i].size;
   372			u8 align, page;
   373			int id;
   374	
   375			for (id = 0; id < ARRAY_SIZE(map); id++) {
   376				if (map[id].id0 == i)
   377					break;
   378			}
   379	
   380			nvkm_debug(subdev, "%02x: size:0x%08x align:0x%08x %s\n", i,
 > 381				   size, align, (id < ARRAY_SIZE(map)) ? "*" : "");
   382			if (id >= ARRAY_SIZE(map))
   383				continue;
   384	
   385			if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN)
   386				size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
   387	
   388			if      (size >= 1 << 21) page = 21;
   389			else if (size >= 1 << 16) page = 16;
   390			else			  page = 12;
   391	
   392			if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB)
   393				align = order_base_2(size);
   394			else
   395				align = page;
   396	
   397			if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
   398				continue;
   399	
   400			gr->ctxbuf[gr->ctxbuf_nr].bufferId = map[id].id1;
   401			gr->ctxbuf[gr->ctxbuf_nr].size     = size;
   402			gr->ctxbuf[gr->ctxbuf_nr].page     = page;
   403			gr->ctxbuf[gr->ctxbuf_nr].align    = align;
   404			gr->ctxbuf[gr->ctxbuf_nr].global   = map[id].global;
   405			gr->ctxbuf[gr->ctxbuf_nr].init     = map[id].init;
   406			gr->ctxbuf[gr->ctxbuf_nr].ro       = map[id].ro;
   407			gr->ctxbuf_nr++;
   408	
   409			if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP) {
   410				if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
   411					continue;
   412	
   413				gr->ctxbuf[gr->ctxbuf_nr] = gr->ctxbuf[gr->ctxbuf_nr - 1];
   414				gr->ctxbuf[gr->ctxbuf_nr].bufferId =
   415					NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
   416				gr->ctxbuf_nr++;
   417			}
   418		}
   419	
   420		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
   421	
   422		/* Promote golden context to RM. */
   423		ret = r535_gr_promote_ctx(gr, true, golden.vmm, gr->ctxbuf_mem, golden.vma, &golden.chan);
   424		if (ret)
   425			goto done;
   426	
   427		/* Allocate 3D class on channel to trigger golden context init in RM. */
   428		{
   429			int i;
   430	
   431			for (i = 0; gr->base.func->sclass[i].ctor; i++) {
   432				if ((gr->base.func->sclass[i].oclass & 0xff) == 0x97) {
   433					struct nvkm_gsp_object threed;
   434	
   435					ret = nvkm_gsp_rm_alloc(&golden.chan, 0x97000000,
   436								gr->base.func->sclass[i].oclass, 0,
   437								&threed);
   438					if (ret)
   439						goto done;
   440	
   441					nvkm_gsp_rm_free(&threed);
   442					break;
   443				}
   444			}
   445	
   446			if (WARN_ON(!gr->base.func->sclass[i].ctor)) {
   447				ret = -EINVAL;
   448				goto done;
   449			}
   450		}
   451	
   452	done:
   453		nvkm_gsp_rm_free(&golden.chan);
   454		for (int i = gr->ctxbuf_nr - 1; i >= 0; i--)
   455			nvkm_vmm_put(golden.vmm, &golden.vma[i]);
   456		nvkm_vmm_unref(&golden.vmm);
   457		nvkm_memory_unref(&golden.inst);
   458		return ret;
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
