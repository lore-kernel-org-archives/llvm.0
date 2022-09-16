Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC84C95
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 11:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663326352; x=1694862352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XeGjpuE0nHgCcfqbIjNal2XWuV/4eDY2VcZnWAB6bOo=;
  b=KePd/wL7l+nJVN89NHAsR5+CbZEKvkybOIPtdFzj0eNQ67zO5pa9on4k
   E0KkhCgwNOejpUegXGw8eY8ybsdu2+8X79UUShh86ncHBML/SPS/e1Nog
   H+Ff64u1uzT3AvJhiKz4QJ6WHsh8yAbF/ko7eJAv5Xn3moa23zH5iGcyt
   wQu5Bukmn58Si52BZ2fcoOAtohhHDl2M41tPLFjvZKVqqc+duMnCSpqDr
   dU1BjiqkzkmVRBSFJSj9TLhcGd3+F/v0Lk+X0Q+WSTFtrx46h6lf9Kpc1
   DJqTlQdvBAhFC+oSu/DahNV/omVkTvnRyEmCXT7UqcIuVR3+WSYrM8if2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="325241807"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="325241807"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 04:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="946338741"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2022 04:05:50 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ9AL-0001is-1D;
	Fri, 16 Sep 2022 11:05:49 +0000
Date: Fri, 16 Sep 2022 19:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [linux-next:master 3205/7639]
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:607:34: warning: unused
 variable 'mdp_comp_dt_ids'
Message-ID: <202209161913.VNdFWG7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: 61890ccaefaff89f5babd2c8412fd222c3f5fe38 [3205/7639] media: platform: mtk-mdp3: add MediaTek MDP3 driver
config: hexagon-randconfig-r033-20220916 (https://download.01.org/0day-ci/archive/20220916/202209161913.VNdFWG7o-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=61890ccaefaff89f5babd2c8412fd222c3f5fe38
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 61890ccaefaff89f5babd2c8412fd222c3f5fe38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/mediatek/mdp3/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:607:34: warning: unused variable 'mdp_comp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id mdp_comp_dt_ids[] = {
                                    ^
>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:627:34: warning: unused variable 'mdp_sub_comp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id mdp_sub_comp_dt_ids[] = {
                                    ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_MEDIATEK_VPU
   Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_DEV [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y])
   Selected by [m]:
   - VIDEO_MEDIATEK_MDP3 [=m] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && (MTK_IOMMU [=m] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_DMA [=y] && REMOTEPROC [=y]


vim +/mdp_comp_dt_ids +607 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c

   606	
 > 607	static const struct of_device_id mdp_comp_dt_ids[] = {
   608		{
   609			.compatible = "mediatek,mt8183-mdp3-rdma",
   610			.data = (void *)MDP_COMP_TYPE_RDMA,
   611		}, {
   612			.compatible = "mediatek,mt8183-mdp3-ccorr",
   613			.data = (void *)MDP_COMP_TYPE_CCORR,
   614		}, {
   615			.compatible = "mediatek,mt8183-mdp3-rsz",
   616			.data = (void *)MDP_COMP_TYPE_RSZ,
   617		}, {
   618			.compatible = "mediatek,mt8183-mdp3-wrot",
   619			.data = (void *)MDP_COMP_TYPE_WROT,
   620		}, {
   621			.compatible = "mediatek,mt8183-mdp3-wdma",
   622			.data = (void *)MDP_COMP_TYPE_WDMA,
   623		},
   624		{}
   625	};
   626	
 > 627	static const struct of_device_id mdp_sub_comp_dt_ids[] = {
   628		{
   629			.compatible = "mediatek,mt8183-mdp3-wdma",
   630			.data = (void *)MDP_COMP_TYPE_PATH,
   631		}, {
   632			.compatible = "mediatek,mt8183-mdp3-wrot",
   633			.data = (void *)MDP_COMP_TYPE_PATH,
   634		},
   635		{}
   636	};
   637	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
