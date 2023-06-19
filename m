Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3614A8B;
	Mon, 19 Jun 2023 21:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687211688; x=1718747688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvfDxTUeEwl3u4Dhs0uBFoPv8EOwdevXVgngFY8M7PA=;
  b=IqZEdYzLBtAOUjxv/FL7DIzbr2oPEhSOakdCFYtqfzwy3BFVGqytgEOD
   BZUB5D7gZzz0FGOa6Es+uWj6GTEJBz/XG18L6B67PammGbvD+wFi6Xj3J
   smsCLFOuIHeKycz+9K3rHj2rrnVlKuNx1cnJnCRbHP/UU6wV+qLSU4qEX
   ZZLDs/prbwjWwIo1w2DECrSOWGbNT9uAkKXOxyykb3dgAPm4LtuXhlT1/
   dJBIBVwOe5/AHob4YgETH8ShQMiQBNJFqHH+Sougnpc3Xhwbcvlbn+7MZ
   ybJzlp4FMmRdIxlATkaYkIeJ0w8VVXo2m+Lvec9+MWLIwniigFn6kSaUg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="344464970"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="344464970"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 14:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="783832186"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="783832186"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jun 2023 14:54:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBMpi-0005BM-1T;
	Mon, 19 Jun 2023 21:54:46 +0000
Date: Tue, 20 Jun 2023 05:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.4.0-rc7-hot 113/140]
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:647:28: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202306200518.Ft7v4vkz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.4.0-rc7-hot
head:   6cedced75eb5ec70f59c98a202ba8dd3e4e224c2
commit: 0fa917e9bd85f5fdf28d74a3ab85101fd8e87abf [113/140] drm/msm/dpu: add HDMI output support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230620/202306200518.Ft7v4vkz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200518.Ft7v4vkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200518.Ft7v4vkz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:647:28: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
           info.h_tile_instance[0] = i;
                                     ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:627:7: note: initialize the variable 'i' to silence this warning
           int i;
                ^
                 = 0
   1 warning generated.


vim +/i +647 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c

   619	
   620	static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
   621					    struct msm_drm_private *priv,
   622					    struct dpu_kms *dpu_kms)
   623	{
   624		struct drm_encoder *encoder = NULL;
   625		struct msm_display_info info;
   626		int rc;
   627		int i;
   628	
   629		if (!priv->hdmi)
   630			return 0;
   631	
   632		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
   633		if (IS_ERR(encoder)) {
   634			DPU_ERROR("encoder init failed for HDMI display\n");
   635			return PTR_ERR(encoder);
   636		}
   637	
   638		memset(&info, 0, sizeof(info));
   639		rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
   640		if (rc) {
   641			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
   642			drm_encoder_cleanup(encoder);
   643			return rc;
   644		}
   645	
   646		info.num_of_h_tiles = 1;
 > 647		info.h_tile_instance[0] = i;
   648		info.intf_type = INTF_HDMI;
   649		rc = dpu_encoder_setup(dev, encoder, &info);
   650		if (rc) {
   651			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
   652				  encoder->base.id, rc);
   653			return rc;
   654		}
   655	
   656		return 0;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
