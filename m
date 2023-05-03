Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713F7C;
	Wed,  3 May 2023 00:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683073727; x=1714609727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NteggfZ0C35U4iS6sqLkDse8ZFWQgrGqJ5OWBICW/Ls=;
  b=gUxUTJonit6S1jAaq6SXHvqBZ+ZUKWubmiab5MtHRcX+VjCnZ9qYhVZ3
   D1Rv7RXY5YI8DiTk2kOfUOu5zcljSOytR3pAwarUmL4699lMX82i2vLQx
   QjytQewOHCPiHL7e8Qk0VF5PKhRovUDKzZncdTtL0vK0aUm3fscWb19Bv
   s8vTfLQf2rie+mJGGXt+FKv/Jd5aRwoZWTQiJM1FepWATf0LV1v7Pak88
   oWHL4Rn+wd7KUaAhbUUsc2kmKXZ0f4Khed8koQ9GwUVzJNh/MszsLwsqm
   kt9NYKhof89UnVVMg4Qnn/xg0m6Ba05odHA6aNaQffIQoPLKK4NeaLjO8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350609387"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="350609387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 17:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="840504385"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="840504385"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 May 2023 17:28:44 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu0MN-0001O0-27;
	Wed, 03 May 2023 00:28:43 +0000
Date: Wed, 3 May 2023 08:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/6] media: v4l2-ctrls: add lens group status
 controls for zoom and focus
Message-ID: <202305030826.23u9PdL8-lkp@intel.com>
References: <20230406-feature-controls-lens-v2-3-faa8ad2bc404@wolfvision.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406-feature-controls-lens-v2-3-faa8ad2bc404@wolfvision.net>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch/media-v4l2-ctrls-fix-documentation-of-V4L2_CID_FOCUS_ABSOLUTE-unit/20230425-174804
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230406-feature-controls-lens-v2-3-faa8ad2bc404%40wolfvision.net
patch subject: [PATCH RFC v2 3/6] media: v4l2-ctrls: add lens group status controls for zoom and focus
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230503/202305030826.23u9PdL8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/df3c5bac781192bb474f416ae9b5497b5bf87eb3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Riesch/media-v4l2-ctrls-fix-documentation-of-V4L2_CID_FOCUS_ABSOLUTE-unit/20230425-174804
        git checkout df3c5bac781192bb474f416ae9b5497b5bf87eb3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/ drivers/hwmon/ drivers/staging/media/atomisp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030826.23u9PdL8-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   include/uapi/linux/v4l2-controls.h:1001:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE+38)
           ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/pci/atomisp_csi2.c:21:
   In file included from drivers/staging/media/atomisp//pci/atomisp_cmd.h:24:
>> drivers/staging/media/atomisp//include/hmm/../../include/linux/atomisp.h:1072:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   include/uapi/linux/v4l2-controls.h:1001:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE+38)
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
>> include/uapi/linux/v4l2-controls.h:1001:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE+38)
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
   include/uapi/linux/v4l2-controls.h:1001:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE+38)
           ^
   1 warning generated.
--
   In file included from drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c:35:
   In file included from drivers/staging/media/atomisp/i2c/ov5693/../../include/linux/atomisp_gmin_platform.h:19:
   In file included from drivers/staging/media/atomisp/i2c/ov5693/../../include/linux/atomisp_platform.h:26:
>> drivers/staging/media/atomisp/i2c/ov5693/../../include/linux/atomisp.h:1072:9: warning: 'V4L2_CID_FOCUS_STATUS' macro redefined [-Wmacro-redefined]
   #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
           ^
   include/uapi/linux/v4l2-controls.h:1001:9: note: previous definition is here
   #define V4L2_CID_FOCUS_STATUS                   (V4L2_CID_CAMERA_CLASS_BASE+38)
           ^
   1 warning generated.


vim +/V4L2_CID_FOCUS_STATUS +1072 drivers/staging/media/atomisp//pci/hive_isp_css_common/host/../../../include/linux/atomisp.h

ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  1070  
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  1071  /* Query Focus Status */
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19 @1072  #define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
ad85094b293e40 Mauro Carvalho Chehab 2020-04-19  1073  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
