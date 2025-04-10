Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C951E5B62;
	Thu, 10 Apr 2025 21:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320397; cv=none; b=hpefHpjwyIZeZ+BdQWVOc59UEkcDGMY5a22ObWB3jCWyU0zuDQANyT3sf0/+mjNdiH7gbT5OlM7UYVp/AKGF0c0ytwxuUMKr5jf7QXAp2OuLJhpQRwdYrhbRWmgie/dIqGy2zDQDQDkmCV6p2YF6h7jiTsRRR1uRyxxsMlQfVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320397; c=relaxed/simple;
	bh=Cfw+afD5n1+iPh5C7Us0PjcDdg8SQLEw+wgsprvF8do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxupyz5PoUJgGAePdPKABERMmoCM2fPAvmTW+r5VK+LoBFbYgssbqq+kAyq7VzMSfFbfieWbWHyzCSQ6hn93T2G7aC1tGdjpkIyYTmXJV9RcqW5bEzsjYiPpjTyxYqHq6Hxrrw0o75EDWUWLwmp2r8ExtgXg1MF/AZGvGS6PM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGiPJhhp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGiPJhhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744320395; x=1775856395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cfw+afD5n1+iPh5C7Us0PjcDdg8SQLEw+wgsprvF8do=;
  b=jGiPJhhpKgQCjxZ94KyGOQvepKD0wo8Xly9XyQClALD5JmFkUL+PZAW9
   Aap1xmzT3jcAQJXZUZ82bsoL9MqFaoCW948S67RmdpOs/omjEinOt5jaL
   OuPYe5PGsd4qMWIQfGQ6/iEexgNO8rLhhsmiiVXvLceUJQWMyf4OM+bIe
   fESb3TyZQ/q1dRThn46tAzHjBDFgrjw+N8ZnHWBQViV5AxwlgmSH4U5x8
   9Jt+rGfYq4bChyTtWOViznr7qP/KKkpWrU/wL+BxYbzTt8tZbZAKbxE25
   M2MX5HkL6dy+N1ZyyS5Umld5VuFqqeKnMAd92Qc6SQBlEcatjAMBSTMzp
   g==;
X-CSE-ConnectionGUID: 8WECT1eeQtSPwxqtjK3Pwg==
X-CSE-MsgGUID: qxaESkSXRiidPur9pCzoqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46001603"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="46001603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 14:26:34 -0700
X-CSE-ConnectionGUID: HhBmI7e3SPGBmPL73VlNeQ==
X-CSE-MsgGUID: 4I/XWNxaQuy4kGtMsmKm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134184332"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2025 14:26:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2zPk-000AYh-15;
	Thu, 10 Apr 2025 21:26:24 +0000
Date: Fri, 11 Apr 2025 05:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH 04/19] drm: Pass the format info to .fb_create()
Message-ID: <202504110434.QQdqu4gU-lkp@intel.com>
References: <20250410163218.15130-5-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-5-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc1 next-20250410]
[cannot apply to drm-exynos/exynos-drm-next tegra/for-next rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Pass-pixel_format-modifier-to-get_format_info/20250411-005845
base:   linus/master
patch link:    https://lore.kernel.org/r/20250410163218.15130-5-ville.syrjala%40linux.intel.com
patch subject: [PATCH 04/19] drm: Pass the format info to .fb_create()
config: hexagon-randconfig-001-20250411 (https://download.01.org/0day-ci/archive/20250411/202504110434.QQdqu4gU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504110434.QQdqu4gU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110434.QQdqu4gU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:287: warning: Function parameter or struct member 'info' not described in 'drm_gem_fb_create'
>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:326: warning: Function parameter or struct member 'info' not described in 'drm_gem_fb_create_with_dirty'


vim +287 drivers/gpu/drm/drm_gem_framebuffer_helper.c

4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  260  
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  261  /**
2e187b2099034a2 Noralf Trønnes 2017-09-22  262   * drm_gem_fb_create() - Helper function for the
2e187b2099034a2 Noralf Trønnes 2017-09-22  263   *                       &drm_mode_config_funcs.fb_create callback
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  264   * @dev: DRM device
2e187b2099034a2 Noralf Trønnes 2017-09-22  265   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
2e187b2099034a2 Noralf Trønnes 2017-09-22  266   * @mode_cmd: Metadata from the userspace framebuffer creation request
2e187b2099034a2 Noralf Trønnes 2017-09-22  267   *
2e187b2099034a2 Noralf Trønnes 2017-09-22  268   * This function creates a new framebuffer object described by
2e187b2099034a2 Noralf Trønnes 2017-09-22  269   * &drm_mode_fb_cmd2. This description includes handles for the buffer(s)
2e187b2099034a2 Noralf Trønnes 2017-09-22  270   * backing the framebuffer.
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  271   *
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  272   * If your hardware has special alignment or pitch requirements these should be
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  273   * checked before calling this function. The function does buffer size
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  274   * validation. Use drm_gem_fb_create_with_dirty() if you need framebuffer
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  275   * flushing.
2e187b2099034a2 Noralf Trønnes 2017-09-22  276   *
2e187b2099034a2 Noralf Trønnes 2017-09-22  277   * Drivers can use this as their &drm_mode_config_funcs.fb_create callback.
2e187b2099034a2 Noralf Trønnes 2017-09-22  278   * The ADDFB2 IOCTL calls into this callback.
2e187b2099034a2 Noralf Trønnes 2017-09-22  279   *
2e187b2099034a2 Noralf Trønnes 2017-09-22  280   * Returns:
2e187b2099034a2 Noralf Trønnes 2017-09-22  281   * Pointer to a &drm_framebuffer on success or an error pointer on failure.
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  282   */
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  283  struct drm_framebuffer *
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  284  drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
7b2bf36de2fd436 Ville Syrjälä  2025-04-10  285  		  const struct drm_format_info *info,
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  286  		  const struct drm_mode_fb_cmd2 *mode_cmd)
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13 @287  {
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  288  	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  289  					    &drm_gem_fb_funcs);
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  290  }
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  291  EXPORT_SYMBOL_GPL(drm_gem_fb_create);
4c3dbb2c312c9fa Noralf Trønnes 2017-08-13  292  
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  293  static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  294  	.destroy	= drm_gem_fb_destroy,
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  295  	.create_handle	= drm_gem_fb_create_handle,
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  296  	.dirty		= drm_atomic_helper_dirtyfb,
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  297  };
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  298  
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  299  /**
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  300   * drm_gem_fb_create_with_dirty() - Helper function for the
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  301   *                       &drm_mode_config_funcs.fb_create callback
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  302   * @dev: DRM device
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  303   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  304   * @mode_cmd: Metadata from the userspace framebuffer creation request
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  305   *
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  306   * This function creates a new framebuffer object described by
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  307   * &drm_mode_fb_cmd2. This description includes handles for the buffer(s)
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  308   * backing the framebuffer. drm_atomic_helper_dirtyfb() is used for the dirty
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  309   * callback giving framebuffer flushing through the atomic machinery. Use
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  310   * drm_gem_fb_create() if you don't need the dirty callback.
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  311   * The function does buffer size validation.
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  312   *
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  313   * Drivers should also call drm_plane_enable_fb_damage_clips() on all planes
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  314   * to enable userspace to use damage clips also with the ATOMIC IOCTL.
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  315   *
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  316   * Drivers can use this as their &drm_mode_config_funcs.fb_create callback.
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  317   * The ADDFB2 IOCTL calls into this callback.
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  318   *
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  319   * Returns:
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  320   * Pointer to a &drm_framebuffer on success or an error pointer on failure.
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  321   */
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  322  struct drm_framebuffer *
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  323  drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
7b2bf36de2fd436 Ville Syrjälä  2025-04-10  324  			     const struct drm_format_info *info,
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  325  			     const struct drm_mode_fb_cmd2 *mode_cmd)
dbd62e16fd53d37 Noralf Trønnes 2019-01-15 @326  {
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  327  	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  328  					    &drm_gem_fb_funcs_dirtyfb);
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  329  }
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  330  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
dbd62e16fd53d37 Noralf Trønnes 2019-01-15  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
