Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986AE173
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642697713; x=1674233713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GL5IivbbKGtWqDKE+KxHI0YESkG6nhRYOiLH5hK++/E=;
  b=PcA8DdW4vBz8n5wl5tmmCUFNEkWyQlS04WEsGCujo/QEL/oZhixz7ioS
   JRn8jQH3cwoFHsYf9qHFX5mgGxTjsAMxqiEAM4NDKp+FtNrAQROVGIcCc
   DTuZbTx29vdd9pUSOz40U2lVwee7gnK375UIsL7s6g9VhCYScb4iatB2l
   kFhQCPR/86UlaeXCWj+ibxnOuUya77PiM3890jtWsX+v8DzATUnQnobqT
   GTnAzzZzaCHgbsFl1yikY4A0dWfwZZmWZ7sOwlP5jootyHKt1Elb0AVrJ
   KslYXcm67HjkLjw1U7AH7/V6SI/Pwy33LpCiou18JiXDF2ISuJFGFaw2b
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306128305"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="306128305"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 08:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="475592794"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2022 08:55:11 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAaiN-000EUd-AY; Thu, 20 Jan 2022 16:55:11 +0000
Date: Fri, 21 Jan 2022 00:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 5/6] drm/meson: add DSI encoder
Message-ID: <202201210035.iKVahxg2-lkp@intel.com>
References: <20220120083357.1541262-6-narmstrong@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120083357.1541262-6-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Neil,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on drm-exynos/exynos-drm-next next-20220120]
[cannot apply to drm/drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Neil-Armstrong/drm-meson-add-support-for-MIPI-DSI-Display/20220120-163607
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arm-randconfig-r002-20220120 (https://download.01.org/0day-ci/archive/20220121/202201210035.iKVahxg2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/2684fdff4655533195eb3db9760865fea5a13dc7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Neil-Armstrong/drm-meson-add-support-for-MIPI-DSI-Display/20220120-163607
        git checkout 2684fdff4655533195eb3db9760865fea5a13dc7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/meson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_encoder_dsi.c:59:22: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_VFIFO_EN'
           writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
                               ^
   drivers/gpu/drm/meson/meson_encoder_dsi.c:59:52: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_VFIFO_EN'
           writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
                                                             ^
>> drivers/gpu/drm/meson/meson_encoder_dsi.c:59:22: error: use of undeclared identifier 'ENCL_VIDEO_MODE_ADV_VFIFO_EN'
           writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
                               ^
   3 errors generated.


vim +/ENCL_VIDEO_MODE_ADV_VFIFO_EN +59 drivers/gpu/drm/meson/meson_encoder_dsi.c

    44	
    45	static void meson_encoder_dsi_mode_set(struct drm_bridge *bridge,
    46					       const struct drm_display_mode *mode,
    47					       const struct drm_display_mode *adjusted_mode)
    48	{
    49		struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
    50		struct meson_drm *priv = encoder_dsi->priv;
    51	
    52		meson_vclk_setup(priv, MESON_VCLK_TARGET_DSI, mode->clock, 0, 0, 0, false);
    53	
    54		meson_venc_mipi_dsi_mode_set(priv, mode);
    55		meson_encl_load_gamma(priv);
    56	
    57		writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
    58	
  > 59		writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
    60				    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
    61		writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
    62	}
    63	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
