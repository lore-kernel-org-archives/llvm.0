Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749337C;
	Mon, 24 Apr 2023 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682322404; x=1713858404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3pZTubpJKZfX8b+6VbLGCsLKvGeuXh1yc7C0hDKUM0=;
  b=kXKNZ86RDcOT1V4qkOIFYM0OP5VSye7bYmLZITk/VI2NzrfwUMf+cVbb
   XIJM1ujw5cbPW/LFd/TofzYfMf6AvDy/rPajYl1sn79Q7ethfbN8Cm2i9
   hNIU/nK1UZUC4Hi6gQdJV+BWeLkUG4qot5IRomF5IvZzSpdTIpqEC+++S
   bjI6rCrJDu+3zSIIiwk5EwqAlWnr+AY0XT8O5G/Iy3mbNBbjXASUCytwB
   QVpIcT7h+udfuinq2bR9tBwal561J5JEfB6aqTPkq47yzeHnZdB28dbi7
   MtM09WIL9aSHUyZhhnl00rcnrvlPHKjGO9kWLjIYub2Guv7PGRL7dtTld
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="335272799"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="335272799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 00:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="757594512"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="757594512"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2023 00:46:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqquH-000iJw-1g;
	Mon, 24 Apr 2023 07:46:41 +0000
Date: Mon, 24 Apr 2023 15:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-linux-v6.3.0 144/157]
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:649:28: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202304241515.ornmzM1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-v6.3.0
head:   dcb4f9644df6b6eab8d660a91c2a307d79b54020
commit: 558e3820e2f31f7438304aef66c6748783f991a0 [144/157] drm/msm/dpu: add HDMI output support
config: arm64-randconfig-r013-20230423 (https://download.01.org/0day-ci/archive/20230424/202304241515.ornmzM1i-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/steev/linux/commit/558e3820e2f31f7438304aef66c6748783f991a0
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-linux-v6.3.0
        git checkout 558e3820e2f31f7438304aef66c6748783f991a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241515.ornmzM1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:649:28: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
           info.h_tile_instance[0] = i;
                                     ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:629:7: note: initialize the variable 'i' to silence this warning
           int i;
                ^
                 = 0
   1 warning generated.


vim +/i +649 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c

   621	
   622	static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
   623					    struct msm_drm_private *priv,
   624					    struct dpu_kms *dpu_kms)
   625	{
   626		struct drm_encoder *encoder = NULL;
   627		struct msm_display_info info;
   628		int rc;
   629		int i;
   630	
   631		if (!priv->hdmi)
   632			return 0;
   633	
   634		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
   635		if (IS_ERR(encoder)) {
   636			DPU_ERROR("encoder init failed for HDMI display\n");
   637			return PTR_ERR(encoder);
   638		}
   639	
   640		memset(&info, 0, sizeof(info));
   641		rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
   642		if (rc) {
   643			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
   644			drm_encoder_cleanup(encoder);
   645			return rc;
   646		}
   647	
   648		info.num_of_h_tiles = 1;
 > 649		info.h_tile_instance[0] = i;
   650		info.intf_type = INTF_HDMI;
   651		rc = dpu_encoder_setup(dev, encoder, &info);
   652		if (rc) {
   653			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
   654				  encoder->base.id, rc);
   655			return rc;
   656		}
   657	
   658		return 0;
   659	}
   660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
