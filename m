Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478F80F
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 13:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660396041; x=1691932041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUOuYYmFZ1yXtRQnZTcMgqIg8bxhiNrr+paGz0eVMNk=;
  b=jy2uPOVKQ14fvQRu6i8HnkmWXMCeOg9tzwL1Ja6DYt2XlRfl92JFIF9q
   WI8ey6pIyOINK2yvjUm6O2WVIZPjk+4H5+8hjHXcK4DvXB7Esdedyg/NM
   odeU8+QWoZ86RyDD2e0FnrKOHmlVOU32xAiznHTAaZwXkGh4nECKxZuhJ
   v8bJhLxOUBCNNsak5SLCLgyHhC1exPp9O0aeAu1KwD/2PvOanR4GC/G2a
   BM3CltzHXtoumRlOiHKJB1iB5hCCh3EMl2qQHsVBuNxFJTEVMF7/4P5zf
   jvnPYGyrN2TGrqujxIMJaPucVB/K0GvQxtA4GbiiNB7GSSyep9NdYaBTM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="278706702"
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="278706702"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 06:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="606195688"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Aug 2022 06:07:18 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMqrG-0001gx-0l;
	Sat, 13 Aug 2022 13:07:18 +0000
Date: Sat, 13 Aug 2022 21:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:248:34: warning: unused
 variable 'vop2_dt_match'
Message-ID: <202208132039.pkv1RWWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: 604be85547ce4d61b89292d2f9a78c721b778c16 drm/rockchip: Add VOP2 driver
date:   3 months ago
config: hexagon-randconfig-r034-20220812 (https://download.01.org/0day-ci/archive/20220813/202208132039.pkv1RWWz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=604be85547ce4d61b89292d2f9a78c721b778c16
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 604be85547ce4d61b89292d2f9a78c721b778c16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/rockchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:248:34: warning: unused variable 'vop2_dt_match' [-Wunused-const-variable]
   static const struct of_device_id vop2_dt_match[] = {
                                    ^
   1 warning generated.


vim +/vop2_dt_match +248 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c

   247	
 > 248	static const struct of_device_id vop2_dt_match[] = {
   249		{
   250			.compatible = "rockchip,rk3566-vop",
   251			.data = &rk3566_vop,
   252		}, {
   253			.compatible = "rockchip,rk3568-vop",
   254			.data = &rk3568_vop,
   255		}, {
   256		},
   257	};
   258	MODULE_DEVICE_TABLE(of, vop2_dt_match);
   259	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
