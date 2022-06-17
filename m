Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFAE3201
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655484532; x=1687020532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2VC7mik9w+9dUx7rYCUaY4bTWFXVK+BGRfFpvu1g5bI=;
  b=RO6j4LNo556dHz6Om+ZAxiNuTwPfb8GeLxZOb8Cq5rrvm1durkuj8wah
   hp+85GpwvLZgy/7ObdA6c0xeAbzrDK9hpSkKzAj9Lr4rCEVFreXvrVldu
   oxcGljAhv9M/EkJhGAe2V3lkIdJeh8TAryUIv4RRtXvSCqQgP+tP74a82
   FljX8/7/zAM3luTgd2n7eZRGW/PvLgZiPBb+pfgmhbrjWpVJp6e8wV9Zd
   vVMEdr1au04KymyV0SUEMKvRbUMcrznqCbYtgMHT5bNp5pjmFVXugqTDX
   5mO3k61v7lqLK1wiyIw4aYPHN6w66xCohWAPBbklrD1TZYm0whFNqDxx3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268229682"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268229682"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 09:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="763288840"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Jun 2022 09:05:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2ETj-000Pa9-JG;
	Fri, 17 Jun 2022 16:05:47 +0000
Date: Sat, 18 Jun 2022 00:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
	robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
	dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
	airlied@linux.ie, agross@kernel.org, dmitry.baryshkov@linaro.org,
	bjorn.andersson@linaro.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
	quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
	quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] drm/msm/dp: clean up pixel_rate from dp_ctrl.c
Message-ID: <202206172356.J5CB8zDf-lkp@intel.com>
References: <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>

Hi Kuogee,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/force-link-training-for-display-resolution-change/20220617-011110
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220617/202206172356.J5CB8zDf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b04f0b39a03a9fc3728e9414157f9d5f0b8b2366
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/force-link-training-for-display-resolution-change/20220617-011110
        git checkout b04f0b39a03a9fc3728e9414157f9d5f0b8b2366
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_ctrl.c:1587:5: warning: no previous prototype for function 'dp_ctrl_on_stream_phy_test_report' [-Wmissing-prototypes]
   int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
       ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
   ^
   static 
   1 warning generated.


vim +/dp_ctrl_on_stream_phy_test_report +1587 drivers/gpu/drm/msm/dp/dp_ctrl.c

  1586	
> 1587	int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
  1588	{
  1589		int ret = 0;
  1590		struct dp_ctrl_private *ctrl;
  1591		unsigned long pixel_rate;
  1592	
  1593		ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
  1594	
  1595		pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
  1596		ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
  1597		if (ret) {
  1598			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
  1599			return ret;
  1600		}
  1601	
  1602		dp_ctrl_send_phy_test_pattern(ctrl);
  1603	
  1604		return 0;
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
