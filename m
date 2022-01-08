Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992A52C9C
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 01:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641604355; x=1673140355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+jX2DCoMk6gJalQwZUt56c66+McYocHwaTFaFqh4iU=;
  b=k+2s8Rw0JRJetBrJG+pD8jWkYzvzbQfHroCvEAqs2NhodQFs+WlJMAvj
   kCFAo5WHT69CkiKF0H/tpWPgStEE+LiDoUwycc9gqsCNUlWJ0tatECOzU
   NEZmXJno3/756pRDS2sGTAN83lWMcLc3dpy/GedIs5S6PG6N2dnq0Xka0
   +fjCdYIHfZwNmlOXWKnmKTVDlL4oGkM8Pq5iS96SfyCh4dygsi6oIbDDU
   lN+c8MpNVStJL8lgisSoGPw8b1I2A9bVrvsa+xESJnVfor5qSFQ2ATAlc
   txtUCs2D1Y6yE2UxIt5DQgPPA9JX6RBHuBncyKHMMrqT6/jF5AV/dxm9e
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="241786195"
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; 
   d="scan'208";a="241786195"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 17:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; 
   d="scan'208";a="689976907"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jan 2022 17:12:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n60HU-00008N-B3; Sat, 08 Jan 2022 01:12:28 +0000
Date: Sat, 8 Jan 2022 09:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [linux-next:master 3376/11475] ld.lld: error: undefined symbol:
 drm_gem_cma_prime_import_sg_table
Message-ID: <202201080957.fgSPwyhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b8170452cd5121b11a5726e3ea8dbdfc2d74e771
commit: 09717af7d13d63df141ae6e71686289989d17efd [3376/11475] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
config: arm-randconfig-r025-20220106 (https://download.01.org/0day-ci/archive/20220108/202201080957.fgSPwyhj-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=09717af7d13d63df141ae6e71686289989d17efd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 09717af7d13d63df141ae6e71686289989d17efd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_gem_cma_prime_import_sg_table
   >>> referenced by hdlcd_drv.c
   >>> gpu/drm/arm/hdlcd_drv.o:(hdlcd_driver) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_gem_cma_dumb_create
   >>> referenced by hdlcd_drv.c
   >>> gpu/drm/arm/hdlcd_drv.o:(hdlcd_driver) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_fb_cma_get_gem_addr
   >>> referenced by hdlcd_crtc.c
   >>> gpu/drm/arm/hdlcd_crtc.o:(hdlcd_plane_atomic_update) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
