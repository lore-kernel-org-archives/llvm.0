Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625A56AA1
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645642547; x=1677178547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55FeCcb1ARGRmEKxVh+6A3zlRphXv2FFw32s6I+V6sk=;
  b=DFo0qSOI16BsmGd+qiL8vDFxbxG9uqY/Ek5nGRbFDrlR67ShEvnarXvY
   le5O4LZjBMKHkFQGYV4EQEEie7Ql4GHV8MtICokHkQakL7vYF9/YptMpp
   y9XgHNxHMKkl//baOO7yawmgxI/UIBSMmmmAl03MCvivKDxPmZFEHiKmF
   KN1LOkolCzwZ/i33/gjouTieVCpgREP6O46aXPd/+iHRkQcyLWvJnC7GR
   FLUUflvMhtvzW4frdlA9sQkuTL/eGm6FaHrXiMRBv9bJZF38DQmBl6sKR
   rBGjmMabaYxp/SPWbkCiJFz+Xlk03y4mbZzouMZsB74AjjGhxLmkfSFnx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="252247819"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="252247819"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 10:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="707153545"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Feb 2022 10:55:44 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMwnf-0001iF-LT; Wed, 23 Feb 2022 18:55:43 +0000
Date: Thu, 24 Feb 2022 02:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>,
	Lee Shawn C <shawn.c.lee@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_cursor.c:155:6: error: implicit
 declaration of function 'intel_crtc_is_bigjoiner_slave'
Message-ID: <202202240216.mijx1JlB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220223-215130/Ville-Syrjala/drm-i915-Fix-cursor-coordinates-on-bigjoiner-slave/20220215-142435
head:   57b0973986ab3f838289ef1e4d27e8638c04b72f
commit: 57b0973986ab3f838289ef1e4d27e8638c04b72f drm/i915: Fix cursor coordinates on bigjoiner slave
date:   5 hours ago
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220224/202202240216.mijx1JlB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/57b0973986ab3f838289ef1e4d27e8638c04b72f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220223-215130/Ville-Syrjala/drm-i915-Fix-cursor-coordinates-on-bigjoiner-slave/20220215-142435
        git checkout 57b0973986ab3f838289ef1e4d27e8638c04b72f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_cursor.c:155:6: error: implicit declaration of function 'intel_crtc_is_bigjoiner_slave' [-Werror,-Wimplicit-function-declaration]
           if (intel_crtc_is_bigjoiner_slave(crtc_state))
               ^
   1 error generated.


vim +/intel_crtc_is_bigjoiner_slave +155 drivers/gpu/drm/i915/display/intel_cursor.c

   130	
   131	static int intel_check_cursor(struct intel_crtc_state *crtc_state,
   132				      struct intel_plane_state *plane_state)
   133	{
   134		const struct drm_framebuffer *fb = plane_state->hw.fb;
   135		struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
   136		const struct drm_rect src = plane_state->uapi.src;
   137		const struct drm_rect dst = plane_state->uapi.dst;
   138		int ret;
   139	
   140		if (fb && fb->modifier != DRM_FORMAT_MOD_LINEAR) {
   141			drm_dbg_kms(&i915->drm, "cursor cannot be tiled\n");
   142			return -EINVAL;
   143		}
   144	
   145		ret = intel_atomic_plane_check_clipping(plane_state, crtc_state,
   146							DRM_PLANE_HELPER_NO_SCALING,
   147							DRM_PLANE_HELPER_NO_SCALING,
   148							true);
   149		if (ret)
   150			return ret;
   151	
   152		/* Use the unclipped src/dst rectangles, which we program to hw */
   153		plane_state->uapi.src = src;
   154		plane_state->uapi.dst = dst;
 > 155		if (intel_crtc_is_bigjoiner_slave(crtc_state))
   156			drm_rect_translate(&plane_state->uapi.dst,
   157					   -crtc_state->pipe_src_w, 0);
   158	
   159		ret = intel_cursor_check_surface(plane_state);
   160		if (ret)
   161			return ret;
   162	
   163		if (!plane_state->uapi.visible)
   164			return 0;
   165	
   166		ret = intel_plane_check_src_coordinates(plane_state);
   167		if (ret)
   168			return ret;
   169	
   170		return 0;
   171	}
   172	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
