Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B231B73
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647270945; x=1678806945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EAZLpteSVdAgFymsLWi6aEs+rPuAd1xAx06FYCb1418=;
  b=nko8fxaP2ZmyC6nbAs3hwEToq2DAqGC8c5mMKcKmRVHT6MRBPRVKXZeG
   Ao2W3fQ+9iZdp9EYLnSwPmuNh9S9vml3Ir5w7Jt12g0kAti6duU1GXiCp
   AURmJ8uAB/N1Dpt0mt3cIw3ZPspoZl/kmtFSp1Su7n+poxC6Mj+wWZi2O
   G1lJ4hceNmJ2irW8bEW+1vH46Fc384UkdNjT8TlinpHvshR9UBVgAE78m
   AKVhBhPi682n31s6wB2KApTa5DSPGUS7VwrXmoODK9an8qv2wGwn1VwP9
   WYg2aRxGAqVO0yKdED0lBM2rKlPSDYiAD+tXeneKe4iHFNaoxfzohQMZH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342480539"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="342480539"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 08:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="497647813"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 08:15:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTmQA-0009xZ-NK; Mon, 14 Mar 2022 15:15:42 +0000
Date: Mon, 14 Mar 2022 23:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 50/64] media: platform: rename exynos4-is/ to
 samsung/exynos4-is/
Message-ID: <202203142353.sWQlIAes-lkp@intel.com>
References: <ddc78c2e90b9ae2ae23e2eb98f38a0b707318c21.1647242579.git.mchehab@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddc78c2e90b9ae2ae23e2eb98f38a0b707318c21.1647242579.git.mchehab@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220310]
[cannot apply to media-tree/master sunxi/sunxi/for-next shawnguo/for-next rockchip/for-next linus/master v5.17-rc8 v5.17-rc7 v5.17-rc6 v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/media-Kconfig-Makefile-reorg/20220314-155919
base:    71941773e143369a73c9c4a3b62fbb60736a1182
config: mips-randconfig-r026-20220313 (https://download.01.org/0day-ci/archive/20220314/202203142353.sWQlIAes-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/fa6ebae6655d5f8551a875661f9acc3dc88a6b02
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/media-Kconfig-Makefile-reorg/20220314-155919
        git checkout fa6ebae6655d5f8551a875661f9acc3dc88a6b02
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/

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

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
