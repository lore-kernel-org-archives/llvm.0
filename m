Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA52C9C;
	Thu, 19 Jan 2023 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674145984; x=1705681984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ypde+LN+g2wDNHqn9/Asfg7XhMoC21zejHshDH5glOw=;
  b=Tt60Og+BP5lR++5za4juACwaeXMoP2lcVPJx9a1fBrwNWvuIEReyn7AW
   3fX/QvmZ9Lb0iGpEHCH/K4hL5qFdVLsSB7Sf40vaq/if0HLmb/Pj1vf2c
   g7RRa9E/SEcOrX67lhDGsUNAxEgLo83hsEH3B3rwqPObh3Uut9b/2NXhA
   dYq0MA8sB7Xig2FufTaEP/ePSk2e4104n4yNwk92NJ7KX6V0pXRiPk99O
   /wvrAqvQTGsALJnvt+MQgtbl4kDqSE+Rm/vgYxiyZUmRhGS+GdvUYuKBL
   tSC/CozJeqS7RfjXWV7k6MWDaQX/CAliLHzUw1VaHh478WQjCEuFVI5nQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325377961"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="325377961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 08:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784119243"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="784119243"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 08:33:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIXqV-0001dC-17;
	Thu, 19 Jan 2023 16:32:59 +0000
Date: Fri, 20 Jan 2023 00:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [drm-misc:drm-misc-next 3/7]
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:249:6: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202301200041.hwrKmLMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   43bde505d66a41c2ad706d603e97b2c8aa2fbe4a
commit: 9402cde9347eca050e14ea9e47270e84a6899162 [3/7] drm/panel: vtdr6130: Use 16-bit brightness function
config: mips-randconfig-r031-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200041.hwrKmLMy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 9402cde9347eca050e14ea9e47270e84a6899162
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:249:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret < 0)
               ^~~
   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:246:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +249 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c

2349183d32d83a7 Neil Armstrong 2023-01-09  241  
2349183d32d83a7 Neil Armstrong 2023-01-09  242  static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
2349183d32d83a7 Neil Armstrong 2023-01-09  243  {
2349183d32d83a7 Neil Armstrong 2023-01-09  244  	struct mipi_dsi_device *dsi = bl_get_data(bl);
2349183d32d83a7 Neil Armstrong 2023-01-09  245  	u16 brightness = backlight_get_brightness(bl);
2349183d32d83a7 Neil Armstrong 2023-01-09  246  	int ret;
2349183d32d83a7 Neil Armstrong 2023-01-09  247  
9402cde9347eca0 Richard Acayan 2023-01-16  248  	mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
2349183d32d83a7 Neil Armstrong 2023-01-09 @249  	if (ret < 0)
2349183d32d83a7 Neil Armstrong 2023-01-09  250  		return ret;
2349183d32d83a7 Neil Armstrong 2023-01-09  251  
2349183d32d83a7 Neil Armstrong 2023-01-09  252  	return 0;
2349183d32d83a7 Neil Armstrong 2023-01-09  253  }
2349183d32d83a7 Neil Armstrong 2023-01-09  254  

:::::: The code at line 249 was first introduced by commit
:::::: 2349183d32d83a7635baa804934813bcad13fd62 drm/panel: add visionox vtdr6130 DSI panel driver

:::::: TO: Neil Armstrong <neil.armstrong@linaro.org>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
