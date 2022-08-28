Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E3290C
	for <llvm@lists.linux.dev>; Sun, 28 Aug 2022 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661691177; x=1693227177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xp+5BzUTF9P0CTodjio/nblQ6c5nPyLGf7iX2a4ZwWU=;
  b=YisQ0F+Fmb1/Xa0V+egN9ERzLBQshu5qIFd9op3ZeoDZ+BvsX3u128ai
   NqnTEAtxu2ncaCx8m/EEuD4qyS+scLmgkrVjKaIBhz7C5aWSMrevTRhug
   PTvXf0bIyoYLCCtZwK2Zcw1ZNN1MIxLE+xX43y5cqk2LyBPbd+1EHj2ef
   sjbozgVuYjCaa/NELgT85ZztVOtoQN1nN42CLMI3Pb6NPhv+SDjVAhkgY
   UUuDxAg/cZgy98JBwgLNLB+7AlzdpXStnJEwxs9vBXjGCWjEybh3/i09H
   ScblBeYRUjnxoSXVIR9oDco51FsssCPtXUfyxTnHptvlFL+z5l2y0fA3L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="381041019"
X-IronPort-AV: E=Sophos;i="5.93,270,1654585200"; 
   d="scan'208";a="381041019"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 05:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,270,1654585200"; 
   d="scan'208";a="587851995"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2022 05:52:55 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSHmY-00015P-30;
	Sun, 28 Aug 2022 12:52:54 +0000
Date: Sun, 28 Aug 2022 20:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [pinchartl-media:drm/du/next 13/14]
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:614:6: warning: no previous
 prototype for function 'rcar_mipi_dsi_pclk_enable'
Message-ID: <202208282000.MtTNOyOx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git drm/du/next
head:   1a1ef49313becc3127e3bd2b6cdb27e5fc54f761
commit: 81c238208c6accde5592851b101986b8b91ec859 [13/14] drm: rcar-du: Fix DSI enable & disable sequence
config: riscv-randconfig-c006-20220828 (https://download.01.org/0day-ci/archive/20220828/202208282000.MtTNOyOx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media drm/du/next
        git checkout 81c238208c6accde5592851b101986b8b91ec859
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/rcar-du/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:614:6: warning: no previous prototype for function 'rcar_mipi_dsi_pclk_enable' [-Wmissing-prototypes]
   void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
        ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:614:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
   ^
   static 
>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:653:6: warning: no previous prototype for function 'rcar_mipi_dsi_pclk_disable' [-Wmissing-prototypes]
   void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
        ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:653:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
   ^
   static 
   2 warnings generated.


vim +/rcar_mipi_dsi_pclk_enable +614 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c

   613	
 > 614	void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
   615				       struct drm_atomic_state *state)
   616	{
   617		struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
   618		const struct drm_display_mode *mode;
   619		struct drm_connector *connector;
   620		struct drm_crtc *crtc;
   621		int ret;
   622	
   623		connector = drm_atomic_get_new_connector_for_encoder(state,
   624								     bridge->encoder);
   625		crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
   626		mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
   627	
   628		ret = rcar_mipi_dsi_clk_enable(dsi);
   629		if (ret < 0) {
   630			dev_err(dsi->dev, "failed to enable DSI clocks\n");
   631			return;
   632		}
   633	
   634		ret = rcar_mipi_dsi_startup(dsi, mode);
   635		if (ret < 0)
   636			goto err_dsi_startup;
   637	
   638		rcar_mipi_dsi_set_display_timing(dsi, mode);
   639	
   640		ret = rcar_mipi_dsi_start_hs_clock(dsi);
   641		if (ret < 0)
   642			goto err_dsi_start_hs;
   643	
   644		return;
   645	
   646	err_dsi_start_hs:
   647		rcar_mipi_dsi_shutdown(dsi);
   648	err_dsi_startup:
   649		rcar_mipi_dsi_clk_disable(dsi);
   650	}
   651	EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_enable);
   652	
 > 653	void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
   654	{
   655		struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
   656	
   657		rcar_mipi_dsi_shutdown(dsi);
   658		rcar_mipi_dsi_clk_disable(dsi);
   659	}
   660	EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_disable);
   661	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
