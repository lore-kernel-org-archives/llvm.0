Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B83679E0;
	Sat, 15 Apr 2023 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681597198; x=1713133198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6R9dyE0mEBmFKyqQ5dz9ZibiCp3qCxUkFlujQv9J1g=;
  b=BnVG9pkNFPEJTVMDmF8Qj+JlVbfH120TgxjfQGTU84goRMIn3hnpENDF
   tdKtA4KHBfGZJoNnjX1LqGLBkyZy5PAUEwkEBEp3DLRhms28DNK9HOhe5
   4uEzE+CjZKHgF5VCxYJJc69c+xrnAF3QaCVXFBXzckDy8deWnOFkVq71F
   ECee+GYRnYvnnHhCIfw+IfbjCv6uS6+5ijhYRcKsG9zyorVpsfteQxrNS
   +lRFdw4qL1ggVqAfrg8h95xpEteWzKSnDrKYEUyDcPtK9gLbMDFOSv+Zy
   QP2Ornnt15eVet1aaoxz/S4na3shII2EbMQnUoJIhISa+7z4gNsGRGoDc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="346527875"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="346527875"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 15:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="864580270"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="864580270"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Apr 2023 15:19:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnoFO-000bNn-25;
	Sat, 15 Apr 2023 22:19:54 +0000
Date: Sun, 16 Apr 2023 06:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.10 68/68]
 drivers/gpu/drm/i915/display/icl_dsi.c:283:6: error: implicit declaration of
 function 'DISPLAY_VER'
Message-ID: <202304160645.4WG086Kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   a0049fd9c865939ea0cf399d2440d1f5fc1c72c0
commit: a0049fd9c865939ea0cf399d2440d1f5fc1c72c0 [68/68] drm/i915/dsi: fix DSS CTL register offsets for TGL+
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230416/202304160645.4WG086Kj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=a0049fd9c865939ea0cf399d2440d1f5fc1c72c0
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout a0049fd9c865939ea0cf399d2440d1f5fc1c72c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160645.4WG086Kj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/icl_dsi.c:283:6: error: implicit declaration of function 'DISPLAY_VER' [-Werror,-Wimplicit-function-declaration]
           if (DISPLAY_VER(dev_priv) >= 12) {
               ^
   1 error generated.


vim +/DISPLAY_VER +283 drivers/gpu/drm/i915/display/icl_dsi.c

   273	
   274	static void configure_dual_link_mode(struct intel_encoder *encoder,
   275					     const struct intel_crtc_state *pipe_config)
   276	{
   277		struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
   278		struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
   279		i915_reg_t dss_ctl1_reg, dss_ctl2_reg;
   280		u32 dss_ctl1;
   281	
   282		/* FIXME: Move all DSS handling to intel_vdsc.c */
 > 283		if (DISPLAY_VER(dev_priv) >= 12) {
   284			struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
   285	
   286			dss_ctl1_reg = ICL_PIPE_DSS_CTL1(crtc->pipe);
   287			dss_ctl2_reg = ICL_PIPE_DSS_CTL2(crtc->pipe);
   288		} else {
   289			dss_ctl1_reg = DSS_CTL1;
   290			dss_ctl2_reg = DSS_CTL2;
   291		}
   292	
   293		dss_ctl1 = intel_de_read(dev_priv, dss_ctl1_reg);
   294		dss_ctl1 |= SPLITTER_ENABLE;
   295		dss_ctl1 &= ~OVERLAP_PIXELS_MASK;
   296		dss_ctl1 |= OVERLAP_PIXELS(intel_dsi->pixel_overlap);
   297	
   298		if (intel_dsi->dual_link == DSI_DUAL_LINK_FRONT_BACK) {
   299			const struct drm_display_mode *adjusted_mode =
   300						&pipe_config->hw.adjusted_mode;
   301			u32 dss_ctl2;
   302			u16 hactive = adjusted_mode->crtc_hdisplay;
   303			u16 dl_buffer_depth;
   304	
   305			dss_ctl1 &= ~DUAL_LINK_MODE_INTERLEAVE;
   306			dl_buffer_depth = hactive / 2 + intel_dsi->pixel_overlap;
   307	
   308			if (dl_buffer_depth > MAX_DL_BUFFER_TARGET_DEPTH)
   309				drm_err(&dev_priv->drm,
   310					"DL buffer depth exceed max value\n");
   311	
   312			dss_ctl1 &= ~LEFT_DL_BUF_TARGET_DEPTH_MASK;
   313			dss_ctl1 |= LEFT_DL_BUF_TARGET_DEPTH(dl_buffer_depth);
   314			dss_ctl2 = intel_de_read(dev_priv, dss_ctl2_reg);
   315			dss_ctl2 &= ~RIGHT_DL_BUF_TARGET_DEPTH_MASK;
   316			dss_ctl2 |= RIGHT_DL_BUF_TARGET_DEPTH(dl_buffer_depth);
   317			intel_de_write(dev_priv, dss_ctl2_reg, dss_ctl2);
   318		} else {
   319			/* Interleave */
   320			dss_ctl1 |= DUAL_LINK_MODE_INTERLEAVE;
   321		}
   322	
   323		intel_de_write(dev_priv, dss_ctl1_reg, dss_ctl1);
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
