Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42532CA7
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643561569; x=1675097569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hNVBpl+u5GXAAgBcaTrR3+DcnLRoflSqjB63DI989ig=;
  b=LfYhj3kpa4FsD+m3956Fd5LnwYWsH3nGFUwxmG1KbXyt14c7beAxNrfu
   FiyWe40mfVfJwwuUiL2m/Y5GrYPHrTOmPG5nQ1mPWtVP8WiOGVd6ZuwDx
   Rab2vUncP065opNRm0pr4ECL2gpQZQ3oEEwqZKb9z1H/yFdc5Itx2QtFc
   Y/k3taEzozYCCozSnFHUghiIn9/6jJjn9COk8WanSVFFRVUoKB92divjy
   DhFWX8BZeO3rfuN5fShVT+NHCpSUMN9Qr/K2mnA8AfvYFlBgJakw3Pghu
   D2iL2DlMa+5Qu5CvZA1Kx6oCLYNRH+WkZuGk4m7sgISIjZ1cc9qgjh5FZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="228025249"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="228025249"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 08:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="496641961"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2022 08:52:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEDRT-000Qki-BU; Sun, 30 Jan 2022 16:52:43 +0000
Date: Mon, 31 Jan 2022 00:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Roland Scheidegger <sroland@vmware.com>,
	Zack Rusin <zackr@vmware.com>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/1] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <202201310032.kOqILulA-lkp@intel.com>
References: <20220130060412.12100-2-15330273260@189.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130060412.12100-2-15330273260@189.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220130-150458
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220131/202201310032.kOqILulA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/cdef436d42a3499744f8fd5a1613a157dd703819
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220130-150458
        git checkout cdef436d42a3499744f8fd5a1613a157dd703819
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/lsdc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/lsdc/lsdc_plane.c:139:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (index == 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:147:32: note: uninitialized use occurs here
                   index, lsdc_pixfmt_to_string(val));
                                                ^~~
   include/drm/drm_print.h:429:36: note: expanded from macro 'drm_info'
           __drm_printk((drm), info,, fmt, ##__VA_ARGS__)
                                             ^~~~~~~~~~~
   include/drm/drm_print.h:425:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                         ^~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                            ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:139:9: note: remove the 'if' if its condition is always true
           } else if (index == 1) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:113:9: note: initialize the variable 'val' to silence this warning
           u32 val;
                  ^
                   = 0
>> drivers/gpu/drm/lsdc/lsdc_plane.c:167:3: warning: variable 'priv_crtc_state' is uninitialized when used here [-Wuninitialized]
                   priv_crtc_state->pix_fmt = LSDC_PF_NONE;
                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:155:41: note: initialize the variable 'priv_crtc_state' to silence this warning
           struct lsdc_crtc_state *priv_crtc_state;
                                                  ^
                                                   = NULL
   drivers/gpu/drm/lsdc/lsdc_plane.c:162:12: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   else if (index == 1)
                            ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:165:30: note: uninitialized use occurs here
                   priv_crtc_state->pix_fmt = val & CFG_PIX_FMT_MASK;
                                              ^~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:162:8: note: remove the 'if' if its condition is always true
                   else if (index == 1)
                        ^~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:156:9: note: initialize the variable 'val' to silence this warning
           u32 val;
                  ^
                   = 0
>> drivers/gpu/drm/lsdc/lsdc_plane.c:201:13: warning: variable 'addr_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (index == 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:216:25: note: uninitialized use occurs here
           lsdc_reg_write32(ldev, addr_reg, paddr);
                                  ^~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:201:9: note: remove the 'if' if its condition is always true
           } else if (index == 1) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:179:14: note: initialize the variable 'addr_reg' to silence this warning
           u32 addr_reg;
                       ^
                        = 0
>> drivers/gpu/drm/lsdc/lsdc_plane.c:201:13: warning: variable 'cfg_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (index == 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:222:25: note: uninitialized use occurs here
           lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
                                  ^~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:201:9: note: remove the 'if' if its condition is always true
           } else if (index == 1) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:180:13: note: initialize the variable 'cfg_reg' to silence this warning
           u32 cfg_reg;
                      ^
                       = 0
   drivers/gpu/drm/lsdc/lsdc_plane.c:201:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (index == 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:222:34: note: uninitialized use occurs here
           lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
                                           ^~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:201:9: note: remove the 'if' if its condition is always true
           } else if (index == 1) {
                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:181:9: note: initialize the variable 'val' to silence this warning
           u32 val;
                  ^
                   = 0
   drivers/gpu/drm/lsdc/lsdc_plane.c:583:19: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
           struct drm_crtc *crtc;
                            ^
>> drivers/gpu/drm/lsdc/lsdc_plane.c:660:7: warning: variable 'format_count' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case DRM_PLANE_TYPE_OVERLAY:
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:667:21: note: uninitialized use occurs here
                                          formats, format_count,
                                                   ^~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:644:27: note: initialize the variable 'format_count' to silence this warning
           unsigned int format_count;
                                    ^
                                     = 0
   8 warnings generated.


vim +139 drivers/gpu/drm/lsdc/lsdc_plane.c

   104	
   105	
   106	
   107	static void lsdc_update_fb_format(struct lsdc_device *ldev,
   108					  struct drm_crtc *crtc,
   109					  const struct drm_format_info *fmt_info)
   110	{
   111		unsigned int index = drm_crtc_index(crtc);
   112		u32 fmt;
   113		u32 val;
   114	
   115		switch (fmt_info->format) {
   116		case DRM_FORMAT_RGB565:
   117			fmt = LSDC_PF_RGB565;
   118			break;
   119		case DRM_FORMAT_XRGB8888:
   120			fmt = LSDC_PF_XRGB8888;
   121			break;
   122		case DRM_FORMAT_ARGB8888:
   123			fmt = LSDC_PF_XRGB8888;
   124			break;
   125		default:
   126			fmt = LSDC_PF_XRGB8888;
   127			break;
   128		}
   129	
   130		drm_dbg_kms(&ldev->drm, "fmt wanted is %s\n",
   131					lsdc_pixfmt_to_string(fmt));
   132	
   133		if (index == 0) {
   134			val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
   135			val = (val & ~CFG_PIX_FMT_MASK) | fmt;
   136			lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
   137			val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
   138	
 > 139		} else if (index == 1) {
   140			val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
   141			val = (val & ~CFG_PIX_FMT_MASK) | fmt;
   142			lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
   143			val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
   144		}
   145	
   146		drm_info(&ldev->drm, "after update fb%d format is %s\n",
   147			index, lsdc_pixfmt_to_string(val));
   148	}
   149	
   150	
   151	static void lsdc_primary_get_default_format(struct drm_crtc *crtc)
   152	{
   153		struct lsdc_device *ldev = to_lsdc(crtc->dev);
   154		unsigned int index = drm_crtc_index(crtc);
   155		struct lsdc_crtc_state *priv_crtc_state;
   156		u32 val;
   157	
   158		if (crtc->state) {
   159			priv_crtc_state = to_lsdc_crtc_state(crtc->state);
   160			if (index == 0)
   161				val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
   162			else if (index == 1)
   163				val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
   164	
   165			priv_crtc_state->pix_fmt = val & CFG_PIX_FMT_MASK;
   166		} else
 > 167			priv_crtc_state->pix_fmt = LSDC_PF_NONE;
   168	
   169		drm_dbg_kms(crtc->dev, "current fb format: %d\n",
   170					priv_crtc_state->pix_fmt);
   171	}
   172	
   173	
   174	static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
   175					      struct drm_crtc *crtc,
   176					      u64 paddr)
   177	{
   178		unsigned int index = drm_crtc_index(crtc);
   179		u32 addr_reg;
   180		u32 cfg_reg;
   181		u32 val;
   182	
   183		/*
   184		 * Find which framebuffer address register should update.
   185		 * if FB_ADDR0_REG is in using, we write the addr to FB_ADDR1_REG,
   186		 * if FB_ADDR1_REG is in using, we write the addr to FB_ADDR0_REG
   187		 */
   188		if (index == 0) {
   189			/* CRTC0 */
   190			val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
   191	
   192			cfg_reg = LSDC_CRTC0_CFG_REG;
   193	
   194			if (val & CFG_FB_IDX_BIT) {
   195				addr_reg = LSDC_CRTC0_FB_ADDR0_REG;
   196				drm_dbg_kms(&ldev->drm, "CRTC0 FB0 will be use\n");
   197			} else {
   198				addr_reg = LSDC_CRTC0_FB_ADDR1_REG;
   199				drm_dbg_kms(&ldev->drm, "CRTC0 FBq will be use\n");
   200			}
 > 201		} else if (index == 1) {
   202			/* CRTC1 */
   203			val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
   204	
   205			cfg_reg = LSDC_CRTC1_CFG_REG;
   206	
   207			if (val & CFG_FB_IDX_BIT) {
   208				addr_reg = LSDC_CRTC1_FB_ADDR0_REG;
   209				drm_dbg_kms(&ldev->drm, "CRTC1 FB0 will be use\n");
   210			} else {
   211				addr_reg = LSDC_CRTC1_FB_ADDR1_REG;
   212				drm_dbg_kms(&ldev->drm, "CRTC1 FBq will be use\n");
   213			}
   214		}
   215	
   216		lsdc_reg_write32(ldev, addr_reg, paddr);
   217	
   218		/*
   219		 * Then, we triger the fb switch, the switch of the framebuffer
   220		 * to be scanout will complete at the next vblank.
   221		 */
   222		lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
   223	
   224		drm_dbg_kms(&ldev->drm, "crtc%u scantout from 0x%llx\n", index, paddr);
   225	}
   226	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
