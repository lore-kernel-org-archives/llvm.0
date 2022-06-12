Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C466AEC0
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655041211; x=1686577211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UGM/ADNUwmGyFflTyjWzM7h6423qH4hEnlmOb9hXOPk=;
  b=ar1mrdvcgt5sGKxIgCLh3P4XeSvdWkyBIP4MWBwnKWQp2DmoY2SfNi2b
   S9jyFS+OmfyR5MR8jP5Sm3ZPoIXBC+9D7pygMx3VwMxE+CaiTuFRteLg9
   jt5HBM74zZK9gvxC0fvOH8+Hi8D6ZrDpaPb/XNoxMnpFeOoL6yZYkyk/+
   FbNVg8OuXM+RoFMUqPkpGdmAhDiEO+0JM+l6/LPxHCD+Nq25z1CPH1jWX
   Y0zfA/AHC3IS/ncGULT3uYSDGkNRB9+UbB38ige0XN3HhW+qu1lA6FSDf
   DoSbRhxwUk1ziY0/Gpl1PE1H7/vSPrH+Ym8dOKhZ1pK9CIPuNAp/9I69l
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="257882947"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="257882947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 06:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="639188705"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2022 06:40:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0Np2-000Jwv-4h;
	Sun, 12 Jun 2022 13:40:08 +0000
Date: Sun, 12 Jun 2022 21:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [drm-misc:for-linux-next 9/10]
 drivers/gpu/drm/msm/dp/dp_parser.c:110:5: error: use of undeclared
 identifier 'data_lane_property'
Message-ID: <202206122125.gkajULO7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   d643daaf1694b7565fbe3982b630e1c7b95f1600
commit: 185443efa26a62b7d1401c89b83c89a1a2601350 [9/10] drm/msm: Convert to drm_of_get_data_lanes_count
config: hexagon-randconfig-r045-20220612 (https://download.01.org/0day-ci/archive/20220612/202206122125.gkajULO7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6466c9abf3674bade1f6ee859f24ebc7aaf9cd88)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 185443efa26a62b7d1401c89b83c89a1a2601350
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_parser.c:110:5: error: use of undeclared identifier 'data_lane_property'
                                   data_lane_property, DP_MAX_NUM_DP_LANES);
                                   ^
   1 error generated.
--
>> drivers/gpu/drm/msm/dsi/dsi_host.c:1676:14: error: call to undeclared function 'drm_of_get_data_lanes_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           num_lanes = drm_of_get_data_lanes_count(ep, 1, 4);
                       ^
   1 error generated.


vim +/data_lane_property +110 drivers/gpu/drm/msm/dp/dp_parser.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  101  
c943b4948b5848 Chandan Uddaraju 2020-08-27  102  static int dp_parser_misc(struct dp_parser *parser)
c943b4948b5848 Chandan Uddaraju 2020-08-27  103  {
c943b4948b5848 Chandan Uddaraju 2020-08-27  104  	struct device_node *of_node = parser->pdev->dev.of_node;
185443efa26a62 Marek Vasut      2022-05-24  105  	int len;
c943b4948b5848 Chandan Uddaraju 2020-08-27  106  
185443efa26a62 Marek Vasut      2022-05-24  107  	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
c943b4948b5848 Chandan Uddaraju 2020-08-27  108  	if (len < 0) {
c943b4948b5848 Chandan Uddaraju 2020-08-27  109  		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
c943b4948b5848 Chandan Uddaraju 2020-08-27 @110  				data_lane_property, DP_MAX_NUM_DP_LANES);
c943b4948b5848 Chandan Uddaraju 2020-08-27  111  		len = DP_MAX_NUM_DP_LANES;
c943b4948b5848 Chandan Uddaraju 2020-08-27  112  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  113  
c943b4948b5848 Chandan Uddaraju 2020-08-27  114  	parser->max_dp_lanes = len;
c943b4948b5848 Chandan Uddaraju 2020-08-27  115  	return 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27  116  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  117  

:::::: The code at line 110 was first introduced by commit
:::::: c943b4948b5848fc0e07f875edbd35a973879e22 drm/msm/dp: add displayPort driver support

:::::: TO: Chandan Uddaraju <chandanu@codeaurora.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
