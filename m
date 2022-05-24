Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596703D8E
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653426073; x=1684962073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25ss+2bsycbOE0VY+2i5BdlirvoEV34kTUZ5Sy5s7vM=;
  b=HTVTywVIZWP1PmbusAg3uyeNPMAytqoY9FgNsCv4RZ5EaOZC5oINiBSF
   zvgvXImo7m3Qb6JBze/UsUjtfL/f9WPBMrn5kp56wi7jOUkXel4iyIO8O
   PcyzE4QGj5Nfm6h333mvcUVEwVSDDGPxKweuXfnL4aSgCmOpHPRiPCDqr
   0mY/98AE4fRYXZaY66EPKvMplGidzxrWuPxG6Ewqwj/ZVU/7qYzVpq+Px
   Jxf3GbWKcGDz0ofGYudOqa5p6PLxmUhrei6TMW6+Hmj+M28hKQbuhnEKv
   Er3bSMEzR0XnV4BSTS1AQeq4C2QFVzcuSGrmi96hXmPgTCpIHFtHN33no
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="271225361"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="271225361"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 14:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="559288430"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 May 2022 14:01:10 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntbeQ-0002RB-5C;
	Tue, 24 May 2022 21:01:10 +0000
Date: Wed, 25 May 2022 05:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [martyn:imx8mp 8/9] drivers/gpu/drm/panel/panel-simple.c:2143:38:
 warning: unused variable 'innolux_g121x1_l03_mode'
Message-ID: <202205250438.KP96c0zm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.collabora.com/martyn/linux imx8mp
head:   9a43f7e1df323f21d01d689adc7966d695aeb7f3
commit: fa301efda2e4746d122dcde65453454851fef2dd [8/9] Convert innolux g121x1 to timing
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220525/202205250438.KP96c0zm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add martyn https://gitlab.collabora.com/martyn/linux
        git fetch --no-tags martyn imx8mp
        git checkout fa301efda2e4746d122dcde65453454851fef2dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-simple.c:2143:38: warning: unused variable 'innolux_g121x1_l03_mode' [-Wunused-const-variable]
   static const struct drm_display_mode innolux_g121x1_l03_mode = {
                                        ^
   1 warning generated.


vim +/innolux_g121x1_l03_mode +2143 drivers/gpu/drm/panel/panel-simple.c

d731f661b5d2dd5 Lucas Stach 2014-11-06  2142  
f8fa17ba812b7df Akshay Bhat 2015-11-18 @2143  static const struct drm_display_mode innolux_g121x1_l03_mode = {
f8fa17ba812b7df Akshay Bhat 2015-11-18  2144  	.clock = 65000,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2145  	.hdisplay = 1024,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2146  	.hsync_start = 1024 + 0,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2147  	.hsync_end = 1024 + 1,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2148  	.htotal = 1024 + 0 + 1 + 320,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2149  	.vdisplay = 768,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2150  	.vsync_start = 768 + 38,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2151  	.vsync_end = 768 + 38 + 1,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2152  	.vtotal = 768 + 38 + 1 + 0,
2e8c5eb9ef938a0 Akshay Bhat 2016-03-01  2153  	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
f8fa17ba812b7df Akshay Bhat 2015-11-18  2154  };
f8fa17ba812b7df Akshay Bhat 2015-11-18  2155  

:::::: The code at line 2143 was first introduced by commit
:::::: f8fa17ba812b7df1535f6bb75d7264670f5997a6 drm/panel: simple: Add support for Innolux G121X1-L03

:::::: TO: Akshay Bhat <akshay.bhat@timesys.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
