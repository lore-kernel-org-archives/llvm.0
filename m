Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CE566F1
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 22:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661292068; x=1692828068;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+KpCMWzGfyKPK9D4bSvPtB37EM6LUxlpcX427rSatZY=;
  b=SU76PFgPbOXIDyMDqcFWVcQQMmzNbMUisTJJrmDHpXM1mq1o5996aBja
   /OobjDKLAcLw8MjGyQuJz5SHNzrQT7PqwlE7NRF70D8fPSZfQTvGYNE2l
   ClVS1+R2b/WnWwfJtc7Kv6Xkb0GIGfkxZJ494TpcwlMIcDG5RqIy/EZbN
   Uj3jdcc/bKLhX6hA/MfuVR4ITTpbIaGFWxC6PF6pztSo6otbpZcLf1gT6
   4cxEYx2Ik8Up+xwEaoOYi/2FL4jVoLI7bTBYOnOFBWZYD4rD87nuxBmsk
   3zCuk1PvCFlAv1qwfC1bH1eh60WcUrnwGLtfmZDlU0fnQENtkLVme0XVv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="293804066"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="293804066"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 15:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="751835195"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2022 15:01:06 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQbxJ-0000bX-1Q;
	Tue, 23 Aug 2022 22:01:05 +0000
Date: Wed, 24 Aug 2022 06:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:31:34: warning:
 unused variable 'mtk_mdp_comp_dt_ids'
Message-ID: <202208240558.1wT7kygx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mauro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   df0219d11b6f04251d38e345db4f9780cb32e2e2
commit: 2023a99811110aebba9eee4aa09ef7bd21a8a249 media: platform: rename mediatek/mtk-jpeg/ to mediatek/jpeg/
date:   5 months ago
config: hexagon-buildonly-randconfig-r005-20220823 (https://download.01.org/0day-ci/archive/20220824/202208240558.1wT7kygx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project b04d01c009d7f66bcca9138d2ce40999eedf104d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2023a99811110aebba9eee4aa09ef7bd21a8a249
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2023a99811110aebba9eee4aa09ef7bd21a8a249
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/mediatek/mdp/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:31:34: warning: unused variable 'mtk_mdp_comp_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
                                    ^
   1 warning generated.


vim +/mtk_mdp_comp_dt_ids +31 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c

c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  30  
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08 @31  static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  32  	{
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  33  		.compatible = "mediatek,mt8173-mdp-rdma",
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  34  		.data = (void *)MTK_MDP_RDMA
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  35  	}, {
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  36  		.compatible = "mediatek,mt8173-mdp-rsz",
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  37  		.data = (void *)MTK_MDP_RSZ
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  38  	}, {
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  39  		.compatible = "mediatek,mt8173-mdp-wdma",
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  40  		.data = (void *)MTK_MDP_WDMA
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  41  	}, {
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  42  		.compatible = "mediatek,mt8173-mdp-wrot",
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  43  		.data = (void *)MTK_MDP_WROT
55d80506c5f7c3a drivers/media/platform/mtk-mdp/mtk_mdp_core.c Vincent Stehlé 2016-10-27  44  	},
55d80506c5f7c3a drivers/media/platform/mtk-mdp/mtk_mdp_core.c Vincent Stehlé 2016-10-27  45  	{ },
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  46  };
c8eb2d7e8202fd9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai  2016-09-08  47  

:::::: The code at line 31 was first introduced by commit
:::::: c8eb2d7e8202fd9cb912f5d33cc34ede66dcb24a [media] media: Add Mediatek MDP Driver

:::::: TO: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
