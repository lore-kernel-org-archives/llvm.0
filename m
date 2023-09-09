Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9117C5;
	Sat,  9 Sep 2023 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694243999; x=1725779999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GxGShMCtLQT6BUX9dh0NDFKcijVS+hph6wcdPY3PkTM=;
  b=AffCGfZA5aBiD5TQmStCOGjNQzU3ouMkciIIAvBXqVCeIMDX74NSGUh1
   MOltC5jXbpBVv/l4a7K2VbLZJzbxTsfGNFT2wTySKfx8CthnqnyCBXGzm
   4i/tYsuNX/pEJXUkWVs9S6ULZk9RcBabomabfWdsLiFYkDAH80ZjOyo2O
   KU11JTY9ELfT0fVMFyRGBjEIPLVz837oX84QU0XAbnyirglq7yhQbpKkk
   9XiH+5Tid4aNipyrOfhpDyuENUwGI5+JXfYa6xDIHQazoaS28PctsNoqH
   D24m9/xI0WTY6ml3BawSQV8oJ+BcEFQfCtY0rafWatA2S1M8gzd1VJ7Vn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357263610"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357263610"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885910891"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="885910891"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 00:19:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesFw-00034K-00;
	Sat, 09 Sep 2023 07:19:48 +0000
Date: Sat, 9 Sep 2023 15:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ben Skeggs <bskeggs@redhat.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 10/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2603:1: warning: no previous
 prototype for function 'nv50_display_read_hw_state'
Message-ID: <202309091541.fpYXkkhk-lkp@intel.com>
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
commit: c38b1778a9baee914921a6743ba924907b96caa2 [10/88] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: arm-randconfig-r024-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091541.fpYXkkhk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091541.fpYXkkhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091541.fpYXkkhk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2603:1: warning: no previous prototype for function 'nv50_display_read_hw_state' [-Wmissing-prototypes]
    2603 | nv50_display_read_hw_state(struct nouveau_drm *drm)
         | ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2602:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2602 | void
         | ^
         | static 
   1 warning generated.


vim +/nv50_display_read_hw_state +2603 drivers/gpu/drm/nouveau/dispnv50/disp.c

  2600	
  2601	/* Read back the currently programmed display state */
  2602	void
> 2603	nv50_display_read_hw_state(struct nouveau_drm *drm)
  2604	{
  2605		struct drm_device *dev = drm->dev;
  2606		struct drm_encoder *encoder;
  2607		struct drm_modeset_acquire_ctx ctx;
  2608		struct nv50_disp *disp = nv50_disp(dev);
  2609		int ret;
  2610	
  2611		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
  2612	
  2613		drm_for_each_encoder(encoder, dev) {
  2614			if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
  2615				continue;
  2616	
  2617			nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
  2618		}
  2619	
  2620		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
  2621	}
  2622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
