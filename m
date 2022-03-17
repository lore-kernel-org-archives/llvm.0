Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8974A9F
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 21:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647553817; x=1679089817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qBEZF6yRa+414/RM17VzJuin5ptD1M2x8Pk22hpDAUY=;
  b=HbsBF025IRAlbU7DYdc3uRFuekhxsoc4Eg509iuL3j78SGUQXXM8Vk6o
   xq3Kao8k9PLk64ZnNqK4kHj1t+0ktbc1sEk2WNL+Z9TKPqK0z58j4WRNn
   9ei9YTzj8NCTHCwELkGe+RqIonnOG/p/PewyON0aDyYfwBdhgj9b1YK8j
   oMttWl06LVKSm/0Mqxc2W/YMTg9Dc48QgZ1LyJBxtiUUPdLkxT9i+Fg7a
   uLS49nvdzdye/cOOR6Yjhw6rDFt9S7RNrbFl5z5eF842RZYXZ508Zs43J
   56DOcZlO5vjx/BByTgDZKFWCeC1Zlan4X2V5q8i2cNiAosI+mR7+Tsn+O
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="239151610"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="239151610"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 14:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="647211282"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Mar 2022 14:50:02 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUy0Q-000E8I-5Z; Thu, 17 Mar 2022 21:50:02 +0000
Date: Fri, 18 Mar 2022 05:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, daniel.vetter@ffwll.ch,
	sam@ravnborg.org, tzimmermann@suse.de
Subject: Re: [PATCH 1/4] drm/gma500: Remove unused declarations and other
 cruft
Message-ID: <202203180538.gWcM5ABA-lkp@intel.com>
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Patrik,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc8 next-20220317]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220318/202203180538.gWcM5ABA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0d50efabcb4ad52bd7a036e2542dbf51bbcf93b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
        git checkout 0d50efabcb4ad52bd7a036e2542dbf51bbcf93b4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/gma500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/gma500/psb_drv.c:102:6: warning: no previous prototype for function 'psb_spank' [-Wmissing-prototypes]
   void psb_spank(struct drm_psb_private *dev_priv)
        ^
   drivers/gpu/drm/gma500/psb_drv.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void psb_spank(struct drm_psb_private *dev_priv)
   ^
   static 
   drivers/gpu/drm/gma500/psb_drv.c:419:20: warning: unused function 'get_brightness' [-Wunused-function]
   static inline void get_brightness(struct backlight_device *bd)
                      ^
   2 warnings generated.


vim +/psb_spank +102 drivers/gpu/drm/gma500/psb_drv.c

5c49fd3aa0ab02 Alan Cox         2011-11-03   95  
5c209d8056b976 Patrik Jakobsson 2021-02-01   96  /**
5c209d8056b976 Patrik Jakobsson 2021-02-01   97   *	psb_spank		-	reset the 2D engine
5c209d8056b976 Patrik Jakobsson 2021-02-01   98   *	@dev_priv: our PSB DRM device
5c209d8056b976 Patrik Jakobsson 2021-02-01   99   *
5c209d8056b976 Patrik Jakobsson 2021-02-01  100   *	Soft reset the graphics engine and then reload the necessary registers.
5c209d8056b976 Patrik Jakobsson 2021-02-01  101   */
5c209d8056b976 Patrik Jakobsson 2021-02-01 @102  void psb_spank(struct drm_psb_private *dev_priv)
5c209d8056b976 Patrik Jakobsson 2021-02-01  103  {
5c209d8056b976 Patrik Jakobsson 2021-02-01  104  	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
5c209d8056b976 Patrik Jakobsson 2021-02-01  105  		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
5c209d8056b976 Patrik Jakobsson 2021-02-01  106  		_PSB_CS_RESET_ISP_RESET | _PSB_CS_RESET_TSP_RESET |
5c209d8056b976 Patrik Jakobsson 2021-02-01  107  		_PSB_CS_RESET_TWOD_RESET, PSB_CR_SOFT_RESET);
5c209d8056b976 Patrik Jakobsson 2021-02-01  108  	PSB_RSGX32(PSB_CR_SOFT_RESET);
5c209d8056b976 Patrik Jakobsson 2021-02-01  109  
5c209d8056b976 Patrik Jakobsson 2021-02-01  110  	msleep(1);
5c209d8056b976 Patrik Jakobsson 2021-02-01  111  
5c209d8056b976 Patrik Jakobsson 2021-02-01  112  	PSB_WSGX32(0, PSB_CR_SOFT_RESET);
5c209d8056b976 Patrik Jakobsson 2021-02-01  113  	wmb();
5c209d8056b976 Patrik Jakobsson 2021-02-01  114  	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) | _PSB_CB_CTRL_CLEAR_FAULT,
5c209d8056b976 Patrik Jakobsson 2021-02-01  115  		   PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  116  	wmb();
5c209d8056b976 Patrik Jakobsson 2021-02-01  117  	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  118  
5c209d8056b976 Patrik Jakobsson 2021-02-01  119  	msleep(1);
5c209d8056b976 Patrik Jakobsson 2021-02-01  120  	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) & ~_PSB_CB_CTRL_CLEAR_FAULT,
5c209d8056b976 Patrik Jakobsson 2021-02-01  121  		   PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  122  	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  123  	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
5c209d8056b976 Patrik Jakobsson 2021-02-01  124  }
5c209d8056b976 Patrik Jakobsson 2021-02-01  125  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
