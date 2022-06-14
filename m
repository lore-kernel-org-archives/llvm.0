Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611FD1840
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655165168; x=1686701168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZbLAdm2DBY7N3CrHyYwNyjGTTL8/gtIlWA/FLS2kfKM=;
  b=PUc6qQw2URJ21qT9FQOZ2aWh6GqLbEGQeqZ2TwNJ6H8Xqcc3pgxuS3pV
   vSsAHkqlgEYFECfJ9J8rs7cCS9F9vwtDT/k4mjHvWALPEYzjJqs+0+ys1
   AywAlK+uz5zFlz/4Uwcysol9xLv8GLNtsm4mcRh83+tOjEUrmCHXxdiAx
   3LUx5zkAmGyJ3s4t8baw3XknvPzqVGbhzt9PGF3mGhmBjf0HGZAsWpkZN
   5GWir4valbpSR3vxS+ykajDgb0IeXm/pCeyjTQtVYqif2cqrtxeEqYMh2
   vJbVCpqMiXKnp0ZINEiAcTuDDrIHQ9+enFPsEGduICmgNr8UYt+ciosz4
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279171457"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="279171457"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 17:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="535331147"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jun 2022 17:06:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0u4L-000LH3-CB;
	Tue, 14 Jun 2022 00:06:05 +0000
Date: Tue, 14 Jun 2022 08:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/8] drm: Drop drm_framebuffer.h from
 drm_crtc.h
Message-ID: <202206140726.CJoShN1E-lkp@intel.com>
References: <20220613200317.11305-3-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613200317.11305-3-ville.syrjala@linux.intel.com>

Hi Ville,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220610]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next v5.19-rc2 v5.19-rc1 v5.18 v5.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Clean-up-drm_crtc-h/20220614-040443
base:    6d0c806803170f120f8cb97b321de7bd89d3a791
config: arm64-randconfig-r004-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140726.CJoShN1E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/be7de5c4289616ee04e75a6fe7df89e80a184da0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ville-Syrjala/drm-Clean-up-drm_crtc-h/20220614-040443
        git checkout be7de5c4289616ee04e75a6fe7df89e80a184da0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/ingenic/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:499:22: error: incomplete definition of type 'struct drm_framebuffer'
                   new_plane_state->fb->format->format == DRM_FORMAT_C8;
                   ~~~~~~~~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:511:26: error: incomplete definition of type 'struct drm_framebuffer'
                old_plane_state->fb->format->format != new_plane_state->fb->format->format))
                ~~~~~~~~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:511:65: error: incomplete definition of type 'struct drm_framebuffer'
                old_plane_state->fb->format->format != new_plane_state->fb->format->format))
                                                       ~~~~~~~~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:677:21: error: incomplete definition of type 'struct drm_framebuffer'
                   cpp = newstate->fb->format->cpp[0];
                         ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:695:24: error: incomplete definition of type 'struct drm_framebuffer'
                           switch (newstate->fb->format->format) {
                                   ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:715:25: error: incomplete definition of type 'struct drm_framebuffer'
                           fourcc = newstate->fb->format->format;
                                    ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   6 errors generated.
--
>> drivers/gpu/drm/ingenic/ingenic-ipu.c:342:38: error: incomplete definition of type 'struct drm_framebuffer'
           finfo = drm_format_info(newstate->fb->format->format);
                                   ~~~~~~~~~~~~^
   include/drm/drm_mode_config.h:83:9: note: forward declaration of 'struct drm_framebuffer'
           struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                  ^
   1 error generated.


vim +499 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

90b86fcc47b4d18 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019-06-03  451  
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  452  static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
7c11b99a8e58c08 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  453  					  struct drm_atomic_state *state)
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  454  {
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  455  	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  456  										 plane);
7c11b99a8e58c08 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  457  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
7c11b99a8e58c08 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  458  										 plane);
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  459  	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  460  	struct ingenic_drm_private_state *priv_state;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  461  	struct drm_crtc_state *crtc_state;
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  462  	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  463  	int ret;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  464  
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  465  	if (!crtc)
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  466  		return 0;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  467  
5357402398784be drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2022-02-12  468  	if (priv->soc_info->plane_f0_not_working && plane == &priv->f0)
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  469  		return -EINVAL;
b807fd2c43fe008 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021-12-02  470  
dec92020671c48d drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  471  	crtc_state = drm_atomic_get_existing_crtc_state(state,
ba5c1649465d40a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  472  							crtc);
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  473  	if (WARN_ON(!crtc_state))
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  474  		return -EINVAL;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  475  
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  476  	priv_state = ingenic_drm_get_priv_state(priv, state);
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  477  	if (IS_ERR(priv_state))
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  478  		return PTR_ERR(priv_state);
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  479  
ba5c1649465d40a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  480  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  481  						  DRM_PLANE_HELPER_NO_SCALING,
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  482  						  DRM_PLANE_HELPER_NO_SCALING,
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  483  						  priv->soc_info->has_osd,
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  484  						  true);
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  485  	if (ret)
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  486  		return ret;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  487  
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  488  	/*
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  489  	 * If OSD is not available, check that the width/height match.
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  490  	 * Note that state->src_* are in 16.16 fixed-point format.
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  491  	 */
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  492  	if (!priv->soc_info->has_osd &&
ba5c1649465d40a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  493  	    (new_plane_state->src_x != 0 ||
ba5c1649465d40a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  494  	     (new_plane_state->src_w >> 16) != new_plane_state->crtc_w ||
ba5c1649465d40a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  495  	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  496  		return -EINVAL;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  497  
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  498  	priv_state->use_palette = new_plane_state->fb &&
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26 @499  		new_plane_state->fb->format->format == DRM_FORMAT_C8;
6055466203df46a drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-10-26  500  
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  501  	/*
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  502  	 * Require full modeset if enabling or disabling a plane, or changing
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  503  	 * its position, size or depth.
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  504  	 */
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  505  	if (priv->soc_info->has_osd &&
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  506  	    (!old_plane_state->fb || !new_plane_state->fb ||
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  507  	     old_plane_state->crtc_x != new_plane_state->crtc_x ||
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  508  	     old_plane_state->crtc_y != new_plane_state->crtc_y ||
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  509  	     old_plane_state->crtc_w != new_plane_state->crtc_w ||
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  510  	     old_plane_state->crtc_h != new_plane_state->crtc_h ||
0b6aaf9d76f0420 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021-02-19  511  	     old_plane_state->fb->format->format != new_plane_state->fb->format->format))
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  512  		crtc_state->mode_changed = true;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  513  
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  514  	if (priv->soc_info->map_noncoherent)
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  515  		drm_atomic_helper_check_plane_damage(state, new_plane_state);
4a791cb6d34f42e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021-05-23  516  
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  517  	return 0;
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  518  }
3c9bea4ef32bdcd drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020-07-16  519  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
