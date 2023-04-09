Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB381FA5;
	Sun,  9 Apr 2023 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681036110; x=1712572110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhUdK/JCLi5O0q5+rXzywZethSVgIl1MPo2BWSWnKpg=;
  b=K50pXK9TesfobuFsjNHsYg+bieheVrZt8tr19p6R45375ZDPldNw6oK+
   gCe7e3IQk1NYnZHf1ap/D7aYFuiwN+T9m0bpZbhkEL5QFjT69Jsn67jF/
   4ZYGZIAGZ6Mp2BtNAU7O1Cx4ceEDRhKZ2XxOsJceSrfgUG3Q0jUVX4qRS
   1NlAO5f/xzUCCyjeLnaselLbR3+BJuW97B1el9kcF0OjzKHykc3t1KC+1
   Z8RJeOoG+t95Kgu14GAk+n+yGMugAxgjd6xrx8ABvA68Oe8sHfXmQf6qR
   X+sWhOcQDYrlbL1aTErjWXDPmifWItP4rHkIGNnL9XVW4U5qHIOWrA+mi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="343215823"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="343215823"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 03:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="718304032"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="718304032"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Apr 2023 03:28:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plSHb-000UT7-2h;
	Sun, 09 Apr 2023 10:28:27 +0000
Date: Sun, 9 Apr 2023 18:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch via B4 Relay <devnull+michael.riesch.wolfvision.net@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] media: v4l2-ctrls: add lens group status
 controls for zoom and focus
Message-ID: <202304091844.U8qwkT3d-lkp@intel.com>
References: <20230406-feature-controls-lens-v1-1-543189a680de@wolfvision.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406-feature-controls-lens-v1-1-543189a680de@wolfvision.net>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/media-v4l2-ctrls-add-lens-group-status-controls-for-zoom-and-focus/20230406-223922
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230406-feature-controls-lens-v1-1-543189a680de%40wolfvision.net
patch subject: [PATCH RFC 1/4] media: v4l2-ctrls: add lens group status controls for zoom and focus
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230409/202304091844.U8qwkT3d-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c1630c0aaed9c37193a2b0f4ada0f4e5da4c641e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Riesch-via-B4-Relay/media-v4l2-ctrls-add-lens-group-status-controls-for-zoom-and-focus/20230406-223922
        git checkout c1630c0aaed9c37193a2b0f4ada0f4e5da4c641e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/media/atomisp/ kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304091844.U8qwkT3d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/media/atomisp/pci/atomisp_cmd.c:37:
   In file included from drivers/staging/media/atomisp//pci/atomisp_cmd.h:24:
>> drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp.h:1072:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   include/uapi/linux/v4l2-controls.h:1006:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE + 37)
           ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:28:
   In file included from drivers/staging/media/atomisp//pci/atomisp_compat.h:22:
   In file included from drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:24:
   In file included from drivers/staging/media/atomisp//pci/ia_css.h:30:
   In file included from drivers/staging/media/atomisp//pci/ia_css_dvs.h:26:
   In file included from drivers/staging/media/atomisp//pci/ia_css_stream_public.h:26:
   In file included from drivers/staging/media/atomisp//pci/ia_css_metadata.h:25:
   In file included from drivers/staging/media/atomisp//pci/ia_css_stream_format.h:24:
   In file included from drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp_platform.h:26:
>> drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp.h:1072:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   include/uapi/linux/v4l2-controls.h:1006:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE + 37)
           ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/pci/sh_css_version.c:17:
   In file included from drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp_platform.h:25:
   In file included from include/media/v4l2-subdev.h:12:
   In file included from include/uapi/linux/v4l2-subdev.h:18:
   In file included from include/uapi/linux/v4l2-mediabus.h:13:
   In file included from include/linux/videodev2.h:61:
   In file included from include/uapi/linux/videodev2.h:67:
>> include/uapi/linux/v4l2-controls.h:1006:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE + 37)
           ^
   drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp.h:1072:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c:33:
   In file included from drivers/staging/media/atomisp/i2c/../include/linux/atomisp_gmin_platform.h:19:
   In file included from drivers/staging/media/atomisp/i2c/../include/linux/atomisp_platform.h:26:
>> drivers/staging/media/atomisp/i2c/../include/linux/atomisp.h:1072:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   include/uapi/linux/v4l2-controls.h:1006:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE + 37)
           ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c:35:
   In file included from drivers/staging/media/atomisp/i2c/ov5693/../../include/linux/atomisp_gmin_platform.h:19:
   In file included from drivers/staging/media/atomisp/i2c/ov5693/../../include/linux/atomisp_platform.h:26:
>> drivers/staging/media/atomisp/i2c/ov5693/../../include/linux/atomisp.h:1072:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   include/uapi/linux/v4l2-controls.h:1006:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE + 37)
           ^
   1 warning generated.


vim +/V4L2_CID_FOCUS_STATUS +1072 drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp.h

ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  1070  
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  1071  /* Query Focus Status */
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19 @1072  #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  1073  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
