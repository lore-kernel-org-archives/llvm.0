Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2220FC;
	Sat,  9 Sep 2023 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694261301; x=1725797301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y8xE6jFCmrJ5Ox+uwDmo4Kknz3V161gvwiS1YVVRtIY=;
  b=TJcSbmwqpT4Bv8KAOAZnwmxlr/f+vbGfLaxFMcYRiebFCZ+/udVCn1E4
   HEL+CtYPFI3Mg/FMYNx2wlY67JZv4TGJy0j07YQhnQthxzoedyIK6y1kp
   sk+GV7RJksOSo5+MPFxFtvexik1qmDhlKaw5iDvfhyVe1OgXsZrWTCBWe
   4IV5gGNP4f4CfCEDnu/dDkg0sPOOsBuFDEFEZPxZYOBfc1FjmXkvxonW5
   K49asUJqM6CCNJ4wa2eugTwo+QsjwmVEa3CpRZX+FTY25tIQQBgJKCGw9
   IDAJY0mUloMQHBRoLP6Btd9SiH0+6nB4N38xXtTu8swWokV8dEPU4eLv6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358120955"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="358120955"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 05:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885952513"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="885952513"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 05:08:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qewl6-0003Tc-2L;
	Sat, 09 Sep 2023 12:08:16 +0000
Date: Sat, 9 Sep 2023 20:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 81/88]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous
 prototype for function 'r535_fifo_runl_ctor'
Message-ID: <202309092043.3xiJffw8-lkp@intel.com>
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
commit: 7de06e53ab58182c4b24ac4e35ff28ed5ba26d13 [81/88] WIPdrm/nouveau/fifo/r535: initial support
config: arm-randconfig-r024-20230909 (https://download.01.org/0day-ci/archive/20230909/202309092043.3xiJffw8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309092043.3xiJffw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309092043.3xiJffw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:303:1: warning: no previous prototype for function 'r535_fifo_runl_ctor' [-Wmissing-prototypes]
     303 | r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
         | ^
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:302:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     302 | int
         | ^
         | static 
   1 warning generated.


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
