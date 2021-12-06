Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69622CA6
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 13:14:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="237249277"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="237249277"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 05:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="514731535"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2021 05:14:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muDol-000LHq-C5; Mon, 06 Dec 2021 13:14:07 +0000
Date: Mon, 6 Dec 2021 21:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 02/14] drm/i915: Rename plane YUV order bits
Message-ID: <202112062144.pndb6yAj-lkp@intel.com>
References: <20211201152552.7821-3-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201152552.7821-3-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ville,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[cannot apply to drm-tip/drm-tip v5.16-rc4 next-20211206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ville-Syrjala/drm-i915-Plane-register-cleanup/20211202-010520
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a012-20211130 (https://download.01.org/0day-ci/archive/20211206/202112062144.pndb6yAj-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9e3683729de554eb265e6f4d8ec9cfc6eb591e52
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-i915-Plane-register-cleanup/20211202-010520
        git checkout 9e3683729de554eb265e6f4d8ec9cfc6eb591e52
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/fb_decoder.c:430:21: error: use of undeclared identifier 'SPRITE_YUV_BYTE_ORDER_MASK'
           yuv_order = (val & SPRITE_YUV_BYTE_ORDER_MASK) >>
                              ^
   1 error generated.


vim +/SPRITE_YUV_BYTE_ORDER_MASK +430 drivers/gpu/drm/i915/gvt/fb_decoder.c

9f31d1063b434c Tina Zhang  2017-11-23  401  
9f31d1063b434c Tina Zhang  2017-11-23  402  /**
9f31d1063b434c Tina Zhang  2017-11-23  403   * intel_vgpu_decode_sprite_plane - Decode sprite plane
9f31d1063b434c Tina Zhang  2017-11-23  404   * @vgpu: input vgpu
9f31d1063b434c Tina Zhang  2017-11-23  405   * @plane: sprite plane to save decoded info
9f31d1063b434c Tina Zhang  2017-11-23  406   * This function is called for decoding plane
9f31d1063b434c Tina Zhang  2017-11-23  407   *
9f31d1063b434c Tina Zhang  2017-11-23  408   * Returns:
9f31d1063b434c Tina Zhang  2017-11-23  409   * 0 on success, non-zero if failed.
9f31d1063b434c Tina Zhang  2017-11-23  410   */
9f31d1063b434c Tina Zhang  2017-11-23  411  int intel_vgpu_decode_sprite_plane(struct intel_vgpu *vgpu,
9f31d1063b434c Tina Zhang  2017-11-23  412  	struct intel_vgpu_sprite_plane_format *plane)
9f31d1063b434c Tina Zhang  2017-11-23  413  {
9f31d1063b434c Tina Zhang  2017-11-23  414  	u32 val, fmt;
9f31d1063b434c Tina Zhang  2017-11-23  415  	u32 color_order, yuv_order;
9f31d1063b434c Tina Zhang  2017-11-23  416  	int drm_format;
9f31d1063b434c Tina Zhang  2017-11-23  417  	int pipe;
9f31d1063b434c Tina Zhang  2017-11-23  418  
9f31d1063b434c Tina Zhang  2017-11-23  419  	pipe = get_active_pipe(vgpu);
9f31d1063b434c Tina Zhang  2017-11-23  420  	if (pipe >= I915_MAX_PIPES)
9f31d1063b434c Tina Zhang  2017-11-23  421  		return -ENODEV;
9f31d1063b434c Tina Zhang  2017-11-23  422  
90551a1296d4db Zhenyu Wang 2017-12-19  423  	val = vgpu_vreg_t(vgpu, SPRCTL(pipe));
9f31d1063b434c Tina Zhang  2017-11-23  424  	plane->enabled = !!(val & SPRITE_ENABLE);
9f31d1063b434c Tina Zhang  2017-11-23  425  	if (!plane->enabled)
9f31d1063b434c Tina Zhang  2017-11-23  426  		return -ENODEV;
9f31d1063b434c Tina Zhang  2017-11-23  427  
9f31d1063b434c Tina Zhang  2017-11-23  428  	plane->tiled = !!(val & SPRITE_TILED);
9f31d1063b434c Tina Zhang  2017-11-23  429  	color_order = !!(val & SPRITE_RGB_ORDER_RGBX);
9f31d1063b434c Tina Zhang  2017-11-23 @430  	yuv_order = (val & SPRITE_YUV_BYTE_ORDER_MASK) >>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
