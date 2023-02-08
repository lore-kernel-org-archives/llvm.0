Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8859477;
	Wed,  8 Feb 2023 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675859887; x=1707395887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rtfe/oTEQJ45Jl4F2AZoj2YmMjYRdTWtPVHW/GN0dfw=;
  b=dGRbu1iKZYjCwBZAqWTwWdkwggL4eYyid8rIP3TfpW8KA/qEQ9n3tie/
   NLMeZ2D2YPQ6WI32ubqaNwB0NAnbKQIt1RKFGEbDoPIbxLlb8uS8f+qgz
   wtnasgPTEDXbRZ56DPpPZYlp/Z2uE8FvBTSIjfnTDdzSXWeQJQPfEBvjK
   alYDODmg0/6E70Nfqs4kXZdd20zmLESVTtch8+2aGLA34V5/cYuc8QPqh
   zSYdez8RukXQoOgIJEjDFdtc17m4KbYR+fKec0hVpFNcXHxPEHKyiqyPX
   8Lt2GP3zKRQPdEucj+LykiXosPPAKRNNpcF2NUoaYwufVD4BDx3T4V88Z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313425675"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="313425675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 04:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809929264"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="809929264"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2023 04:38:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPji7-0004Rb-1O;
	Wed, 08 Feb 2023 12:38:03 +0000
Date: Wed, 8 Feb 2023 20:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915/wm: add .get_hw_state to
 watermark funcs
Message-ID: <202302082058.02NjQHJ5-lkp@intel.com>
References: <6fc335ec79f163b7a612af012ce07be6d98f2ef9.1675849634.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fc335ec79f163b7a612af012ce07be6d98f2ef9.1675849634.git.jani.nikula@intel.com>

Hi Jani,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-move-memory-frequency-detection-to-intel_dram-c/20230208-175057
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/6fc335ec79f163b7a612af012ce07be6d98f2ef9.1675849634.git.jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 04/10] drm/i915/wm: add .get_hw_state to watermark funcs
config: x86_64-randconfig-a002-20230206 (https://download.01.org/0day-ci/archive/20230208/202302082058.02NjQHJ5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3be1dad7406a8c767260601b10af82797025aae3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-i915-move-memory-frequency-detection-to-intel_dram-c/20230208-175057
        git checkout 3be1dad7406a8c767260601b10af82797025aae3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/i9xx_wm.c:3824:6: warning: no previous prototype for function 'ilk_wm_get_hw_state' [-Wmissing-prototypes]
   void ilk_wm_get_hw_state(struct drm_i915_private *dev_priv)
        ^
   drivers/gpu/drm/i915/display/i9xx_wm.c:3824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ilk_wm_get_hw_state(struct drm_i915_private *dev_priv)
   ^
   static 
   1 warning generated.


vim +/ilk_wm_get_hw_state +3824 drivers/gpu/drm/i915/display/i9xx_wm.c

f21b5d6fc26440 Jani Nikula 2023-02-08  3823  
f21b5d6fc26440 Jani Nikula 2023-02-08 @3824  void ilk_wm_get_hw_state(struct drm_i915_private *dev_priv)
f21b5d6fc26440 Jani Nikula 2023-02-08  3825  {
f21b5d6fc26440 Jani Nikula 2023-02-08  3826  	struct ilk_wm_values *hw = &dev_priv->display.wm.hw;
f21b5d6fc26440 Jani Nikula 2023-02-08  3827  	struct intel_crtc *crtc;
f21b5d6fc26440 Jani Nikula 2023-02-08  3828  
f21b5d6fc26440 Jani Nikula 2023-02-08  3829  	ilk_init_lp_watermarks(dev_priv);
f21b5d6fc26440 Jani Nikula 2023-02-08  3830  
f21b5d6fc26440 Jani Nikula 2023-02-08  3831  	for_each_intel_crtc(&dev_priv->drm, crtc)
f21b5d6fc26440 Jani Nikula 2023-02-08  3832  		ilk_pipe_wm_get_hw_state(crtc);
f21b5d6fc26440 Jani Nikula 2023-02-08  3833  
f21b5d6fc26440 Jani Nikula 2023-02-08  3834  	hw->wm_lp[0] = intel_uncore_read(&dev_priv->uncore, WM1_LP_ILK);
f21b5d6fc26440 Jani Nikula 2023-02-08  3835  	hw->wm_lp[1] = intel_uncore_read(&dev_priv->uncore, WM2_LP_ILK);
f21b5d6fc26440 Jani Nikula 2023-02-08  3836  	hw->wm_lp[2] = intel_uncore_read(&dev_priv->uncore, WM3_LP_ILK);
f21b5d6fc26440 Jani Nikula 2023-02-08  3837  
f21b5d6fc26440 Jani Nikula 2023-02-08  3838  	hw->wm_lp_spr[0] = intel_uncore_read(&dev_priv->uncore, WM1S_LP_ILK);
f21b5d6fc26440 Jani Nikula 2023-02-08  3839  	if (DISPLAY_VER(dev_priv) >= 7) {
f21b5d6fc26440 Jani Nikula 2023-02-08  3840  		hw->wm_lp_spr[1] = intel_uncore_read(&dev_priv->uncore, WM2S_LP_IVB);
f21b5d6fc26440 Jani Nikula 2023-02-08  3841  		hw->wm_lp_spr[2] = intel_uncore_read(&dev_priv->uncore, WM3S_LP_IVB);
f21b5d6fc26440 Jani Nikula 2023-02-08  3842  	}
f21b5d6fc26440 Jani Nikula 2023-02-08  3843  
f21b5d6fc26440 Jani Nikula 2023-02-08  3844  	if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv))
f21b5d6fc26440 Jani Nikula 2023-02-08  3845  		hw->partitioning = (intel_uncore_read(&dev_priv->uncore, WM_MISC) &
f21b5d6fc26440 Jani Nikula 2023-02-08  3846  				    WM_MISC_DATA_PARTITION_5_6) ?
f21b5d6fc26440 Jani Nikula 2023-02-08  3847  			INTEL_DDB_PART_5_6 : INTEL_DDB_PART_1_2;
f21b5d6fc26440 Jani Nikula 2023-02-08  3848  	else if (IS_IVYBRIDGE(dev_priv))
f21b5d6fc26440 Jani Nikula 2023-02-08  3849  		hw->partitioning = (intel_uncore_read(&dev_priv->uncore, DISP_ARB_CTL2) &
f21b5d6fc26440 Jani Nikula 2023-02-08  3850  				    DISP_DATA_PARTITION_5_6) ?
f21b5d6fc26440 Jani Nikula 2023-02-08  3851  			INTEL_DDB_PART_5_6 : INTEL_DDB_PART_1_2;
f21b5d6fc26440 Jani Nikula 2023-02-08  3852  
f21b5d6fc26440 Jani Nikula 2023-02-08  3853  	hw->enable_fbc_wm =
f21b5d6fc26440 Jani Nikula 2023-02-08  3854  		!(intel_uncore_read(&dev_priv->uncore, DISP_ARB_CTL) & DISP_FBC_WM_DIS);
f21b5d6fc26440 Jani Nikula 2023-02-08  3855  }
f21b5d6fc26440 Jani Nikula 2023-02-08  3856  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
