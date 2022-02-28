Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD0A4C9E
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 03:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646020146; x=1677556146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6nouob/2ISkZFDtEipaF8c8UebRwJCUz79/D2S7XKc=;
  b=CO/BZnUe5s7a+3fPHT3BhZ9SjFheLXfuku/B4jwbv8vj1LvY10we+uVY
   zoGVd6YA9X59EcqlnK6usVAZNlbxEBsbPlrfXFwm1HFbRFDbWtcWvmhHS
   Pq+RKCwToAEvD5sL1yEs24395YQ4X0LZtGS+ubgdMKP7rjGd/DWIUKNv1
   6GWzsJglF3RlsGVlP5Ojz5qNwKa1WngAVcK0CECf93CS2+E2vwztSX8Nn
   mWYtKx9ixMSisAPQhyp6wiQfU6gBJJcIoQFFlL1/qWBBPDS8naZ9QrS1n
   eF9dOvpUtF66SmcOfO36SX6wj4uDo+owG7Esw2OqDYfLj3Q/cT/4gG1fT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="236304291"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="236304291"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 19:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="708501381"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2022 19:48:52 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOX1n-00070R-HN; Mon, 28 Feb 2022 03:48:51 +0000
Date: Mon, 28 Feb 2022 11:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Subject: Re: [PATCH 9/9] drm: mxsfb: Add support for i.MX8MP LCDIF variant
Message-ID: <202202281124.RFKJe01p-lkp@intel.com>
References: <20220228004605.367040-9-marex@denx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228004605.367040-9-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20220225]
[cannot apply to drm/drm-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-mxsfb-Add-compatible-for-i-MX8MP/20220228-084809
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a002-20220228 (https://download.01.org/0day-ci/archive/20220228/202202281124.RFKJe01p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d6832d6fb879aabce18d9b451ed1ead1da38c333
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-mxsfb-Add-compatible-for-i-MX8MP/20220228-084809
        git checkout d6832d6fb879aabce18d9b451ed1ead1da38c333
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/mxsfb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/mxsfb_kms.c:258:3: warning: variable 'ctrl' is uninitialized when used here [-Wuninitialized]
                   ctrl |= CTRL_INV_HS;
                   ^~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:255:10: note: initialize the variable 'ctrl' to silence this warning
           u32 ctrl;
                   ^
                    = 0
   1 warning generated.


vim +/ctrl +258 drivers/gpu/drm/mxsfb/mxsfb_kms.c

   251	
   252	static void mxsfb_v8_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
   253	{
   254		struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
   255		u32 ctrl;
   256	
   257		if (m->flags & DRM_MODE_FLAG_PHSYNC)
 > 258			ctrl |= CTRL_INV_HS;
   259		if (m->flags & DRM_MODE_FLAG_PVSYNC)
   260			ctrl |= CTRL_INV_VS;
   261		/* Make sure Data Enable is high active by default */
   262		if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
   263			ctrl |= CTRL_INV_DE;
   264		if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
   265			ctrl |= CTRL_INV_PXCK;
   266	
   267		writel(ctrl, mxsfb->base + LCDC_CTRL);
   268	
   269		writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
   270		       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
   271		       mxsfb->base + LCDC_V8_DISP_SIZE);
   272	
   273		writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
   274		       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
   275		       mxsfb->base + LCDC_V8_HSYN_PARA);
   276	
   277		writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
   278		       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
   279		       mxsfb->base + LCDC_V8_VSYN_PARA);
   280	
   281		writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
   282		       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
   283		       mxsfb->base + LCDC_V8_VSYN_HSYN_WIDTH);
   284	
   285		writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
   286		       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
   287		       mxsfb->base + LCDC_V8_CTRLDESCL0_1);
   288	
   289		writel(CTRLDESCL0_3_PITCH(mxsfb->crtc.primary->state->fb->pitches[0]),
   290		       mxsfb->base + LCDC_V8_CTRLDESCL0_3);
   291	}
   292	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
