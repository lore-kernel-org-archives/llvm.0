Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA86FA1;
	Sat,  9 Sep 2023 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694267185; x=1725803185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lhwjatvnThJoGx4E09OgpYvJzejJkvVp718OBvZCsk=;
  b=bIeeRJ0LV2qQKyvEigTEw41E3AA2WprvGwjG+SHlPedHcM2JoFaq7wOl
   V+icXJxMhQBTVBVEhLkJrKQiQu8iMZjkDE88jI7feAbUEcK0aUCN7hCPu
   SafMeFyiz+RzYwMfdGZGPBkseTcPo4NQp4AOv0TJHb3Y0wb7Rf5DU/QIY
   PSuwvu0kw72VHhVJtRWN+B8yK4cJ+go8mHlMMKtzC0jKu0d8zwrGojE6n
   Jye9uD32FFRZPwh+zZSrqsWUVkX9BPk1M+vfTp8JbXuDpVUTX46AQi2BS
   XkEBaxshi9cLUzS6011symgZHJPW2PKRQ4zUiuncm6bRkbEVdQnzEzae7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377733871"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="377733871"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 06:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857735637"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="857735637"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2023 06:46:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeyI0-0003Yb-1T;
	Sat, 09 Sep 2023 13:46:20 +0000
Date: Sat, 9 Sep 2023 21:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 83/88]
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c:382:13: warning: variable
 'align' is uninitialized when used here
Message-ID: <202309092116.lgsPMi5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: 9cf54a6815a658bdf3a8fb1b2acb8cfab4d15b8a [83/88] WIPdrm/nouveau/gr/r535: initial support
config: arm-randconfig-r024-20230909 (https://download.01.org/0day-ci/archive/20230909/202309092116.lgsPMi5q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309092116.lgsPMi5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309092116.lgsPMi5q-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   1 warning generated.


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
