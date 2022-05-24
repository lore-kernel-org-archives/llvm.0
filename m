Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169AB7F4
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653387510; x=1684923510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSgj51pG5C3QFfOReMyZoIvSUtU6wGmpwG+rrptWICI=;
  b=mfTrS5AnfxuC2YzHgF0jbgNPNqnv0mphYMUuXT29m5vPmucSN7SLOYs4
   qQN6FexvCUCQPJ8/Xlnosj78NPdTKNZTYP7dW6awyTJlxdCyJissZOJWB
   t30+4PNoWavoiT2RBX4GaEQeFivzt0SnJFyQIXFuNByhAqfcAQ6zvfwwo
   dXbRQTq2zfSJyuSJIxE5jNobtaWGHDaveZ59QyWqeyvzc0J8t8oGXKkB+
   sfD058dEFwMMKgV2fmGPBFBOZDztB+SPTi01tCWfAQtTn26m7n4E0p11y
   EC7ZT7q4yhLNkHLAp9va1RIGTJ80ZVsLSt70qeFluZ+bmcNg+f0VKxuvi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="334136460"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="334136460"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 03:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="820230569"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 May 2022 03:18:27 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntRcQ-0001xi-EV;
	Tue, 24 May 2022 10:18:26 +0000
Date: Tue, 24 May 2022 18:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [drm-misc:drm-misc-next 1106/1116]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:2: error:
 call to undeclared function 'crtc_debugfs_init'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202205241843.8EWKesIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   1a3b1ea111c44d9dce9f70ba032531a223395a15
commit: 4cd79f614b501e496ee8e4181d528c0cc1cb4e18 [1106/1116] drm/amd/display: Move connector debugfs to drm
config: arm64-randconfig-r001-20220524 (https://download.01.org/0day-ci/archive/20220524/202205241843.8EWKesIA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 4cd79f614b501e496ee8e4181d528c0cc1cb4e18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:2: error: call to undeclared function 'crtc_debugfs_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           crtc_debugfs_init(crtc);
           ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9165:20: warning: variable 'abo' set but not used [-Wunused-but-set-variable]
           struct amdgpu_bo *abo;
                             ^
   1 warning and 1 error generated.


vim +/crtc_debugfs_init +6622 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland 2017-08-10  6619  
e69231c4451ae0 Wayne Lin      2021-03-08  6620  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
86bc221918925a Wayne Lin      2021-03-02  6621  {
86bc221918925a Wayne Lin      2021-03-02 @6622  	crtc_debugfs_init(crtc);
86bc221918925a Wayne Lin      2021-03-02  6623  
86bc221918925a Wayne Lin      2021-03-02  6624  	return 0;
86bc221918925a Wayne Lin      2021-03-02  6625  }
86bc221918925a Wayne Lin      2021-03-02  6626  

:::::: The code at line 6622 was first introduced by commit
:::::: 86bc221918925a0bbb49043e3936e898e009b43b drm/amd/display: Support crc on specific region

:::::: TO: Wayne Lin <Wayne.Lin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
