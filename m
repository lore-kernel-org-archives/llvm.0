Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AF2FAF
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 07:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647415155; x=1678951155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDQEP6e/Y5YWlyDWaBIQAbpc44/FvC8SizlEDT5kG40=;
  b=nONH165foPtejf6kZGZ2KgGYO2wajtst1Tyrkgq+GlQwKbJqfI1vYr6/
   /ufjKZlCUJl4n3fyXY2xfZeA8WBW8yb1IYerd66KXopMAEYaeWFXz1uQZ
   szlTvrztA+tsmbrTSbU2BJDsucqzfK0Xz1dF+3CwQ8ZmMeeiNWKOJ26Sp
   3gZI1OucldemBrn6UkkJfQ1wJSYRX8YaKScXP4tIiTTibiIJjAZ+5hXqf
   84g6mn38rPzbCEkrvN/GGrNB9SN2DSmtNr9jCX5RzC/iEnjYiCHyZV+1q
   eRYHyN5o7cMQMDWa1JhzTfHyB/mz5EFaQ4yscnNNkaUOdon7CL7JaZjfC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243965178"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="243965178"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 00:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="714486242"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2022 00:19:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUNw7-000C6y-Ga; Wed, 16 Mar 2022 07:19:11 +0000
Date: Wed, 16 Mar 2022 15:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 12105/12845] ld.lld: error: undefined symbol:
 v4l2_subdev_init
Message-ID: <202203161553.JYzuCtdr-lkp@intel.com>
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
head:   a32cd981a6da2373c093d471ee4405a915e217d5
commit: 4a598f62a03bd0e48f0be36cf32829291392cca8 [12105/12845] media: platform/*/Kconfig: make manufacturer menus more uniform
config: arm-randconfig-r032-20220316 (https://download.01.org/0day-ci/archive/20220316/202203161553.JYzuCtdr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4a598f62a03bd0e48f0be36cf32829291392cca8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4a598f62a03bd0e48f0be36cf32829291392cca8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_subdev_init
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_get_link_freq
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_s_stream) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_subdev_call_wrappers
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_s_stream) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l_bound_align_image
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_set_fmt) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_create_fwnode_links_to_pad
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_notify_bound) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_subdev_get_fwnode_pad_1_to_1
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_entity_ops) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_subdev_link_validate
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_entity_ops) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_async_nf_init
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_fwnode_endpoint_parse
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: __v4l2_async_nf_add_fwnode_remote
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_async_nf_unregister
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_probe) in archive drivers/built-in.a
   >>> referenced by imx-mipi-csis.c
   >>> media/platform/nxp/imx-mipi-csis.o:(mipi_csis_remove) in archive drivers/built-in.a
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
   Selected by
   - VIDEO_IMX_MIPI_CSIS && MEDIA_SUPPORT && MEDIA_PLATFORM_SUPPORT && MEDIA_PLATFORM_DRIVERS

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
