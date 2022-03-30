Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC52C80
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648674017; x=1680210017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8FC2FPhKtM0mTtO05j8fjDdgfsYLuSdSZPWEuv5HJBk=;
  b=cl6tVKfyz/Nq/n9BohMtbzTKCYG7JZls1ZrH/Htcov0U0074/yKqyqpK
   P9/Q3CgBvtELKKdVaZiUBMwfa/s0BWbl19ZS7LAb7w+EqxdDuEvv/dQz/
   urj+tfPxQ9vwbGXjay7Xh9WOo1ynXisYUlCk/rGq1VgWmUXFs3ndbXlb6
   +XLSNvSWE809mSXVRfkTf9z5TSdXj16orzmVoFWjWvA3+bn+5idxlc5gV
   lx8LrCSwr9O0HKSD2e6zgGqc6SN7P8h8Z4XT5lv2TK57E45bf4NlWlnid
   /Pa0wCuABy0bg6YEtflmnJdt7/g1EVH0IlBQaraEeW/C4yYoH9BBP1v4J
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322827436"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="322827436"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 14:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="503460985"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2022 14:00:15 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZfQN-0000V2-4A;
	Wed, 30 Mar 2022 21:00:15 +0000
Date: Thu, 31 Mar 2022 04:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:6:
 warning: no previous prototype for function
 'fimc_isp_video_device_unregister'
Message-ID: <202203310447.czIadBgz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d888c83fcec75194a8a48ccd283953bdba7b2550
commit: 238c84f71120f41c45301359902a912a19370f3d media: platform: rename exynos4-is/ to samsung/exynos4-is/
date:   13 days ago
config: riscv-randconfig-r003-20220330 (https://download.01.org/0day-ci/archive/20220331/202203310447.czIadBgz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=238c84f71120f41c45301359902a912a19370f3d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 238c84f71120f41c45301359902a912a19370f3d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/samsung/exynos4-is/fimc-isp.c:25:
>> drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:6: warning: no previous prototype for function 'fimc_isp_video_device_unregister' [-Wmissing-prototypes]
   void fimc_isp_video_device_unregister(struct fimc_isp *isp,
        ^
   drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fimc_isp_video_device_unregister(struct fimc_isp *isp,
   ^
   static 
   1 warning generated.


vim +/fimc_isp_video_device_unregister +35 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h

34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  34  
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20 @35  void fimc_isp_video_device_unregister(struct fimc_isp *isp,
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  36  				enum v4l2_buf_type type)
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  37  {
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  38  }
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  39  #endif /* !CONFIG_VIDEO_EXYNOS4_ISP_DMA_CAPTURE */
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  40  

:::::: The code at line 35 was first introduced by commit
:::::: 34947b8aebe3f2d4eceb65fceafa92bf8dc97d96 [media] exynos4-is: Add the FIMC-IS ISP capture DMA driver

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
