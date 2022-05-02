Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37777F
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 07:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651474945; x=1683010945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRyLlJLvu19lLwxcC7JKQKdYckR3OJ2ppVlcOdhNaMY=;
  b=VJen3gMtd7qr9tbRLSAfW2/83BKTDw8ag4gKEmyymvHqgs/flXhd7aBT
   6tKusqjEjfunDjAjQANbQJvrqQXaaDY+qKFxdqGE+/t1lKH/aCjnSxSzW
   co2BLRalbly86VsAa+tdfjLjoeGAHZQqFA2Xx8p4/UCLt156n0yc7pN2q
   AWT+HtRnC1OzJJL5el1vdGFeUknYqdNc7fap5c907xouCIGg+uDvWZi1/
   NKQ9B7c/5f2PdpjUA167rWBbC0kv8sVM0AquMPEhtp1dlIZYdwHwg9uL3
   uQb/ocooBzLFk6WLvAzO09DCh0OHy7bOYnqTIOQ7z8b1RifLNXWh4Yvg6
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247693204"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247693204"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 00:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="545906944"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 May 2022 00:02:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlQ4c-0009MB-Lm;
	Mon, 02 May 2022 07:02:22 +0000
Date: Mon, 2 May 2022 15:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-msm:msm-next-staging 61/96]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:253:22: warning:
 variable 'mode' is uninitialized when used here
Message-ID: <202205021439.HE0yB3Rm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   f1fc2b87de4719cfa8e193e0746cc524dd9f7472
commit: d7d0e73f7de33a2b9998b607707a3e944ef3b86d [61/96] drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220502/202205021439.HE0yB3Rm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next-staging
        git checkout d7d0e73f7de33a2b9998b607707a3e944ef3b86d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma/ti/ drivers/gpu/drm/msm/ drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:253:22: warning: variable 'mode' is uninitialized when used here [-Wuninitialized]
                           phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
                                             ^~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:36:21: note: expanded from macro 'DPU_DEBUG'
                           DRM_DEBUG(fmt, ##__VA_ARGS__); \
                                            ^~~~~~~~~~~
   include/drm/drm_print.h:526:32: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
                                         ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:250:37: note: initialize the variable 'mode' to silence this warning
           const struct drm_display_mode *mode;
                                              ^
                                               = NULL
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:410:6: warning: variable 'refcount' set but not used [-Wunused-but-set-variable]
           int refcount;
               ^
   2 warnings generated.


vim +/mode +253 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c

   237	
   238	/**
   239	 * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
   240	 * @phys_enc:	Pointer to physical encoder
   241	 * @crtc_state:	Pointer to CRTC atomic state
   242	 * @conn_state:	Pointer to connector atomic state
   243	 */
   244	static int dpu_encoder_phys_wb_atomic_check(
   245			struct dpu_encoder_phys *phys_enc,
   246			struct drm_crtc_state *crtc_state,
   247			struct drm_connector_state *conn_state)
   248	{
   249		struct drm_framebuffer *fb;
   250		const struct drm_display_mode *mode;
   251	
   252		DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
 > 253				phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
   254	
   255		if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
   256			return 0;
   257	
   258		fb = conn_state->writeback_job->fb;
   259		mode = &crtc_state->mode;
   260	
   261		if (!conn_state || !conn_state->connector) {
   262			DPU_ERROR("invalid connector state\n");
   263			return -EINVAL;
   264		} else if (conn_state->connector->status !=
   265				connector_status_connected) {
   266			DPU_ERROR("connector not connected %d\n",
   267					conn_state->connector->status);
   268			return -EINVAL;
   269		}
   270	
   271		DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
   272				fb->width, fb->height);
   273	
   274		if (fb->width != mode->hdisplay) {
   275			DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
   276					mode->hdisplay);
   277			return -EINVAL;
   278		} else if (fb->height != mode->vdisplay) {
   279			DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
   280					  mode->vdisplay);
   281			return -EINVAL;
   282		} else if (fb->width > DEFAULT_MAX_WRITEBACK_WIDTH) {
   283			DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
   284					  fb->width, DEFAULT_MAX_WRITEBACK_WIDTH);
   285			return -EINVAL;
   286		}
   287	
   288		return 0;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
