Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0437B
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648710763; x=1680246763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSX6WP3ryDZkacSQ4hDJs7KwPzVXv8tSNKT29XXyOtE=;
  b=f6HW2N6LYOEcmoYmyGtZU3h87SKlafZzDbIzmX/aHP2V/FXTg9dHaE2o
   AscrleoDVIpgukPjwLEeX4f81ivCgOWpCx2z/hjcI8kfJJrIa/Me80Via
   GegKSbVaFoUFGZCO73QvNS/0F2aB/Scf7wPbz8qf838eLiWBuRf7+uA2u
   B32REN/KtzQEDLGxO8n+70eJ4p9o1uIP6XGbO62KIeTNcCCLqXth/ZQRN
   aBKPKjB+On8+7yOzsF1I9tEnL10Hd37pkeiwtgfGfoQQSerlmQrJNV8h9
   5PVuS2KJwKWby/uE/CoLISJk7E68ayrwYFZrzfKJ/Ot1GsbPAZLoHmgr7
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="239668068"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; 
   d="scan'208";a="239668068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 00:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; 
   d="scan'208";a="605924208"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2022 00:12:40 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZoz2-00002q-7Z;
	Thu, 31 Mar 2022 07:12:40 +0000
Date: Thu, 31 Mar 2022 15:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: ERROR: modpost: "v4l2_async_register_subdev"
 [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
Message-ID: <202203311500.FKE7GeWz-lkp@intel.com>
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
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: 63fe3d27b226fe01746bace4d1f1f2164406140d media: platform/*/Kconfig: make manufacturer menus more uniform
date:   13 days ago
config: hexagon-randconfig-r031-20220331 (https://download.01.org/0day-ci/archive/20220331/202203311500.FKE7GeWz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=63fe3d27b226fe01746bace4d1f1f2164406140d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 63fe3d27b226fe01746bace4d1f1f2164406140d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "v4l2_subdev_link_validate" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_subdev_get_fwnode_pad_1_to_1" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_create_fwnode_links_to_pad" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l_bound_align_image" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_get_link_freq" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_subdev_call_wrappers" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_async_nf_cleanup" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
ERROR: modpost: "v4l2_async_nf_unregister" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_async_register_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
   Selected by
   - VIDEO_IMX_MIPI_CSIS && MEDIA_SUPPORT && MEDIA_PLATFORM_SUPPORT && MEDIA_PLATFORM_DRIVERS

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
