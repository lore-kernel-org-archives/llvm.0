Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7179D7F;
	Sat,  4 Feb 2023 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675506583; x=1707042583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xmuMJtnHaj+RrRrfbUPcpDf/Ht5U+PSFr3iikPbCXPI=;
  b=io27IX9wBpeV6a4uf0vtZmdKJRVjNB+kXU75mbjz09lLhfQDi36RmhJy
   ZMTwY5H+CYsLcVf1avq48bBOwnAJP+T7nHdEhMMjKo09xg7wH0+AreyPa
   ZF5QKdISB5l9P0IZ/rXofewaceEOxF3pYLyZUp3a02+yGYGIkht+YB7Kq
   q9SlqUtRrMQjXr16iydcAuXGKacbO2e7FwDovtCxtLCkCHyd9qwk04frX
   pteECFwTFhLr6ojKy+iXS6eBrIKoSaQozqKRFfjtrYe8Cbm6bj7atr93K
   p7XaFkD5d12xNDJIC6J8yNH6vxWlSWJSCciK/ZrYnWXlzOQfkaLjl1JYb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="326628611"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="326628611"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 02:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754743155"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754743155"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 02:29:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOFnf-0001EO-2y;
	Sat, 04 Feb 2023 10:29:39 +0000
Date: Sat, 4 Feb 2023 18:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Wick <sebastian.wick@redhat.com>,
	amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
	Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com,
	Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH 1/3] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Message-ID: <202302041801.feSkJReM-lkp@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203020744.30745-1-joshua@froggi.es>

Hi Joshua,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Ashton/drm-connector-Add-enum-documentation-to-drm_colorspace/20230203-100927
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230203020744.30745-1-joshua%40froggi.es
patch subject: [PATCH 1/3] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230204/202302041801.feSkJReM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/146e4b57c07c6b478f24bb7cf2603ab123dcb6f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joshua-Ashton/drm-connector-Add-enum-documentation-to-drm_colorspace/20230203-100927
        git checkout 146e4b57c07c6b478f24bb7cf2603ab123dcb6f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdmi_helper.c:108:3: error: use of undeclared identifier 'DRM_MODE_COLORIMETRY_NO_DATA'; did you mean 'DRM_MODE_COLORIMETRY_OPRGB'?
           [DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
            DRM_MODE_COLORIMETRY_OPRGB
   include/drm/drm_connector.h:441:2: note: 'DRM_MODE_COLORIMETRY_OPRGB' declared here
           DRM_MODE_COLORIMETRY_OPRGB,
           ^
   drivers/gpu/drm/display/drm_hdmi_helper.c:115:33: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
                                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_hdmi_helper.c:100:34: note: expanded from macro 'HDMI_COLORIMETRY_OPRGB'
   #define HDMI_COLORIMETRY_OPRGB                  (C(3) | EC(4) | ACE(0))
                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_hdmi_helper.c:108:35: note: previous initialization is here
           [DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_hdmi_helper.c:93:35: note: expanded from macro 'HDMI_COLORIMETRY_NO_DATA'
   #define HDMI_COLORIMETRY_NO_DATA                0x0
                                                   ^~~
   1 warning and 1 error generated.


vim +108 drivers/gpu/drm/display/drm_hdmi_helper.c

4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  106  
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  107  static const u32 hdmi_colorimetry_val[] = {
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21 @108  	[DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  109  	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = HDMI_COLORIMETRY_SMPTE_170M_YCC,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  110  	[DRM_MODE_COLORIMETRY_BT709_YCC] = HDMI_COLORIMETRY_BT709_YCC,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  111  	[DRM_MODE_COLORIMETRY_XVYCC_601] = HDMI_COLORIMETRY_XVYCC_601,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  112  	[DRM_MODE_COLORIMETRY_XVYCC_709] = HDMI_COLORIMETRY_XVYCC_709,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  113  	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  114  	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  115  	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  116  	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  117  	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  118  	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  119  };
4fc8cb47fcfdc93 Thomas Zimmermann 2022-04-21  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
