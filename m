Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5318B1844
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644989548; x=1676525548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L21kMTrGxDNdeX4jyf3m94UTHwyvHra7W9k6YdTErX0=;
  b=fac/vghQpIOkPIOwVjbtjDG7WZRBdj3F/ZAMznnEiXr9eCcmhLL+hVDu
   poOngDcDIRjfTM8CkxUwkOn3gF13FnhVDoy0Qocj4CgDgpmtsFEKpSlqs
   OFuexQCHqcZt6KW4o5tFCkppn/SEWT2nXaGcaRYUM1BO8BQusuCJXHJ/j
   DHu/hOO1/7AZrlquV5ayHxBcLx+poJUJqK4KTr+ZUfXxVXtdj+bFWQraJ
   q2F08NairR8evE4wM7Xbb1FpFvlEtM6QYZmiYM8i4jaKGbMQ1tvs0C/3T
   3itiI72/0Ut+ZKf1Kidw/Qa/5m9YkHDupHYoJwe1bvUjcJRDHARP1G6p3
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275107826"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="275107826"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 21:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="502862919"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Feb 2022 21:32:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKCvR-000ATP-Gt; Wed, 16 Feb 2022 05:32:25 +0000
Date: Wed, 16 Feb 2022 13:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 2/2] drm/msm/dp: enable widebus feature for display
 port
Message-ID: <202202161301.3AAqRD00-lkp@intel.com>
References: <1644960302-4096-3-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644960302-4096-3-git-send-email-quic_khsieh@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kuogee,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc4 next-20220215]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kuogee-Hsieh/drm-msm-dp-enable-widebus-feature-base-on-chip-hardware-revision/20220216-052636
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-buildonly-randconfig-r005-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161301.3AAqRD00-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/294e6c4f98a10e815d8673f550f4470b0b71e34d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/drm-msm-dp-enable-widebus-feature-base-on-chip-hardware-revision/20220216-052636
        git checkout 294e6c4f98a10e815d8673f550f4470b0b71e34d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:9:
   In file included from drivers/gpu/drm/msm/hdmi/hdmi.h:19:
>> drivers/gpu/drm/msm/msm_drv.h:453:6: warning: no previous prototype for function 'msm_dp_wide_bus_enable' [-Wmissing-prototypes]
   bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
        ^
   drivers/gpu/drm/msm/msm_drv.h:453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
   ^
   static 
   1 warning generated.
--
   In file included from drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c:9:
>> drivers/gpu/drm/msm/msm_drv.h:453:6: warning: no previous prototype for function 'msm_dp_wide_bus_enable' [-Wmissing-prototypes]
   bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
        ^
   drivers/gpu/drm/msm/msm_drv.h:453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
   ^
   static 
   drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c:29:20: warning: unused function 'mdss_write' [-Wunused-function]
   static inline void mdss_write(struct mdp5_mdss *mdp5_mdss, u32 reg, u32 data)
                      ^
   2 warnings generated.
--
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:17:
>> drivers/gpu/drm/msm/msm_drv.h:453:6: warning: no previous prototype for function 'msm_dp_wide_bus_enable' [-Wmissing-prototypes]
   bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
        ^
   drivers/gpu/drm/msm/msm_drv.h:453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
   ^
   static 
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1155:26: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
           struct msm_drm_private *priv;
                                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1192:26: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
           struct msm_drm_private *priv;
                                   ^
   3 warnings generated.


vim +/msm_dp_wide_bus_enable +453 drivers/gpu/drm/msm/msm_drv.h

   452	
 > 453	bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
   454	{
   455		return false;
   456	}
   457	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
