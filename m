Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662D23A7;
	Mon, 13 Mar 2023 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678701310; x=1710237310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Lo0W/gQruyw6MIUumFx51URQ+ycLvofKkX4btabde4=;
  b=bYl2x/+p5z5uh5d9LoSuclmXkf45W9Wh+t05D5v+rHkEYkk/7qyto7cQ
   XZFBQAhZWRX+Qi55FlveyMcFY1zItsb6iYKC0tv5Qe0EppHTLzoI9S7s2
   HaSHQbpnOdWNr3UzIKPPgL4b60kV9DjSqGUTKQFjYD4uDzi+aCDbjFMK2
   CSX0R+C9R/WUQRfSnPwuTa4gQDWw5aqG4i5+iiHUd3c+bA+oqrnBwBZb4
   9zRKxfxiDT1PhUVtwgtMFvBzX6HJ9poRgM6HltYGHUOvgpL1utau44Qre
   4bHaOyuGBQyKPI/qIAUWOkLHsE3YTLgG1p4wscOvmUBsEXyzOEKuf85I3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338655793"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="338655793"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 02:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="671836652"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="671836652"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Mar 2023 02:55:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbetY-0005Xa-0R;
	Mon, 13 Mar 2023 09:55:08 +0000
Date: Mon, 13 Mar 2023 17:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 58/68]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:287:1: warning: no previous
 prototype for function 'r525_fifo_runl_ctor'
Message-ID: <202303131759.upyDcLQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   89da5e5109a92f4be025e40b80d1f1a6c1d6d8c7
commit: 09e551038a5b001eb367789a28e56c5bca36af72 [58/68] fifo
config: riscv-randconfig-r026-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131759.upyDcLQv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout 09e551038a5b001eb367789a28e56c5bca36af72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131759.upyDcLQv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:287:1: warning: no previous prototype for function 'r525_fifo_runl_ctor' [-Wmissing-prototypes]
   r525_fifo_runl_ctor(struct nvkm_fifo *fifo)
   ^
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.


vim +/r525_fifo_runl_ctor +287 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r525.c

   284	
   285	
   286	int
 > 287	r525_fifo_runl_ctor(struct nvkm_fifo *fifo)
   288	{
   289		struct nvkm_subdev *subdev = &fifo->engine.subdev;
   290		struct nvkm_gsp *gsp = subdev->device->gsp;
   291		struct nvkm_runl *runl;
   292		int ret;
   293		NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
   294	
   295		//XXX: chid<->userd + per-RL chid
   296		if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->cgid)) ||
   297		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, 2048, 0, 2048, &fifo->chid)))
   298			return ret;
   299	
   300		ctrl = nvkm_gsp_rm_ctrl_get(gsp, gsp->client, gsp->subdevice,
   301					    NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE, sizeof(*ctrl));
   302		if (WARN_ON(IS_ERR(ctrl)))
   303			return PTR_ERR(ctrl);
   304	
   305		ctrl = nvkm_gsp_rm_ctrl_push(gsp, ctrl, sizeof(*ctrl));
   306		if (WARN_ON(IS_ERR(ctrl)))
   307			return PTR_ERR(ctrl);
   308	
   309		for (int i = 0; i < ctrl->numEntries; i++) {
   310			const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
   311			const u32 engn = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RM_ENGINE_TYPE];
   312			const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
   313			enum nvkm_subdev_type type;
   314			int inst, nv2080;
   315	
   316			runl = nvkm_runl_get(fifo, id, addr);
   317			if (!runl) {
   318				runl = nvkm_runl_new(fifo, id, addr, 0 /*XXX: chid<->userd + per-RL chid*/);
   319				if (WARN_ON(IS_ERR(runl)))
   320					continue;
   321			}
   322	
   323			inst = r525_fifo_engn_type(engn, &type);
   324			if (inst < 0) {
   325				nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", engn);
   326				continue;
   327			}
   328	
   329			nv2080 = r525_fifo_2080_type(type, inst);
   330			if (nv2080 < 0)
   331				continue;
   332	
   333			if (type == NVKM_ENGINE_CE)
   334				nvkm_runl_add(runl, nv2080, fifo->func->engn_ce, type, inst);
   335			else
   336				nvkm_runl_add(runl, nv2080, fifo->func->engn, type, inst);
   337		}
   338	
   339		nvkm_gsp_rm_ctrl_done(gsp, ctrl);
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
