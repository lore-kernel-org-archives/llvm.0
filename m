Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D329CA
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642751920; x=1674287920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kevsgNciJBR+LRPzf88FECiRtTMvPbKQx4fQhKnRjOc=;
  b=ThbR3uF26jRe1P3Fy+vtJJ0clGBhWDAhN21yGLkcOKGhQhjK3sa7ALM9
   9OuyC8ZoGQ6kGYG2z3WmGUT6DGxZUOKiJMbMVp1qm+uVniElEIdb7uzPC
   1qIE9uHnkaQWEs3czjJZAvWzQQ5X1bcvCBgcfh2ENZejLpHB7dxG6x3Jl
   xd0JRGOesKtRbLmpfF8GtB2j9rBfLIJHavpVEU0WHVI/K8OB9k5FRCsua
   rMPA+Nb+URO+ukzvbEQOS3ehi/GTYFpF14DgtG2HOOVXe3DU0xMxIdx08
   XDq4hKqZ/HYgrmQYU57wYOZPkgI+aZfQ2NKTrl8LvKn9g2CF7LICebJMU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="331943667"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="331943667"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 23:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="767921830"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2022 23:58:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAoog-000F4h-04; Fri, 21 Jan 2022 07:58:38 +0000
Date: Fri, 21 Jan 2022 15:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] drm: allow passing a real encoder object for wb
 connector
Message-ID: <202201211543.ZApV4jVl-lkp@intel.com>
References: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Abhinav,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.16 next-20220121]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Abhinav-Kumar/drm-allow-passing-a-real-encoder-object-for-wb-connector/20220121-103231
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-randconfig-r011-20220120 (https://download.01.org/0day-ci/archive/20220121/202201211543.ZApV4jVl-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/ce1d81913d9146f6e753c39f41929266a5885f99
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Abhinav-Kumar/drm-allow-passing-a-real-encoder-object-for-wb-connector/20220121-103231
        git checkout ce1d81913d9146f6e753c39f41929266a5885f99
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/arm/ drivers/gpu/drm/rcar-du/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/arm/malidp_mw.c:215:30: error: member reference type 'struct drm_encoder *' is a pointer; did you mean to use '->'?
           malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
                                       ->
   1 error generated.
--
>> drivers/gpu/drm/rcar-du/rcar_du_writeback.c:203:18: error: member reference type 'struct drm_encoder *' is a pointer; did you mean to use '->'?
           wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
           ~~~~~~~~~~~~~~~~^
                           ->
   1 error generated.
--
>> drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c:158:18: error: member reference type 'struct drm_encoder *' is a pointer; did you mean to use '->'?
           wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
           ~~~~~~~~~~~~~~~~^
                           ->
   1 error generated.


vim +215 drivers/gpu/drm/arm/malidp_mw.c

8cbc5caf36ef7a Brian Starkey 2017-11-02  205  
8cbc5caf36ef7a Brian Starkey 2017-11-02  206  int malidp_mw_connector_init(struct drm_device *drm)
8cbc5caf36ef7a Brian Starkey 2017-11-02  207  {
8cbc5caf36ef7a Brian Starkey 2017-11-02  208  	struct malidp_drm *malidp = drm->dev_private;
8cbc5caf36ef7a Brian Starkey 2017-11-02  209  	u32 *formats;
8cbc5caf36ef7a Brian Starkey 2017-11-02  210  	int ret, n_formats;
8cbc5caf36ef7a Brian Starkey 2017-11-02  211  
8cbc5caf36ef7a Brian Starkey 2017-11-02  212  	if (!malidp->dev->hw->enable_memwrite)
8cbc5caf36ef7a Brian Starkey 2017-11-02  213  		return 0;
8cbc5caf36ef7a Brian Starkey 2017-11-02  214  
8cbc5caf36ef7a Brian Starkey 2017-11-02 @215  	malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
8cbc5caf36ef7a Brian Starkey 2017-11-02  216  	drm_connector_helper_add(&malidp->mw_connector.base,
8cbc5caf36ef7a Brian Starkey 2017-11-02  217  				 &malidp_mw_connector_helper_funcs);
8cbc5caf36ef7a Brian Starkey 2017-11-02  218  
8cbc5caf36ef7a Brian Starkey 2017-11-02  219  	formats = get_writeback_formats(malidp, &n_formats);
8cbc5caf36ef7a Brian Starkey 2017-11-02  220  	if (!formats)
8cbc5caf36ef7a Brian Starkey 2017-11-02  221  		return -ENOMEM;
8cbc5caf36ef7a Brian Starkey 2017-11-02  222  
8cbc5caf36ef7a Brian Starkey 2017-11-02  223  	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
8cbc5caf36ef7a Brian Starkey 2017-11-02  224  					   &malidp_mw_connector_funcs,
8cbc5caf36ef7a Brian Starkey 2017-11-02  225  					   &malidp_mw_encoder_helper_funcs,
8cbc5caf36ef7a Brian Starkey 2017-11-02  226  					   formats, n_formats);
8cbc5caf36ef7a Brian Starkey 2017-11-02  227  	kfree(formats);
8cbc5caf36ef7a Brian Starkey 2017-11-02  228  	if (ret)
8cbc5caf36ef7a Brian Starkey 2017-11-02  229  		return ret;
8cbc5caf36ef7a Brian Starkey 2017-11-02  230  
8cbc5caf36ef7a Brian Starkey 2017-11-02  231  	return 0;
8cbc5caf36ef7a Brian Starkey 2017-11-02  232  }
8cbc5caf36ef7a Brian Starkey 2017-11-02  233  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
