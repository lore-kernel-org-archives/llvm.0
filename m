Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2F4432
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663246872; x=1694782872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uL2gBKd29t2XU9a/qhUBN4xNsydVhG0XYgJYOwM/2IA=;
  b=P8VUHGjpMxr+wV1lNL7XFmlS5JWgFM6Cocm3paECo1KzyH41zd2YmPNu
   DZtfJGIqYWkkoVpOyFJA1ZMynJJtP6lQFdtaFi9jNYAeIcAVLKM5QvVIK
   gcQuto+Yzqg1PUwR5S9PpouL2JfCvyHFtcnKLVdzbijwKXwdwpCOV8cio
   pBLiZ+djgpiAwSqzUJJP2goczP8pnxytAFOZcqxJRc4ZPBYWOF6S9ULez
   /OGE1yaIkV+6dJ8QzQsugadPFuGcULGJm2qDbFV20c7IjwA8iYFCt5lSp
   jfHcB6DjDFJoOnLn2HDtJ12iInOFJuFYoEtzixQhoJjMLmxlOJWIXy2lY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="279089709"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="279089709"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 06:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="945939490"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2022 06:01:10 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYoUP-0000a9-1D;
	Thu, 15 Sep 2022 13:01:09 +0000
Date: Thu, 15 Sep 2022 21:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:248:34: warning: unused
 variable 'vop2_dt_match'
Message-ID: <202209152038.HNZxMRUG-lkp@intel.com>
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
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: 604be85547ce4d61b89292d2f9a78c721b778c16 drm/rockchip: Add VOP2 driver
date:   4 months ago
config: hexagon-randconfig-r001-20220915 (https://download.01.org/0day-ci/archive/20220915/202209152038.HNZxMRUG-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 72e7575ffe60bc396f207c0b278b8b1a017e87bb)
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
