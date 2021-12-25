Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3EE2C82
	for <llvm@lists.linux.dev>; Sat, 25 Dec 2021 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640475448; x=1672011448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUdSUE0hhrB5yOykddcawPLKHy7YhwYpFORVcpSAisw=;
  b=ifaHabRqCxEcpL6Hjo5fQeUMWDecy03h/Ms59NGxK9Jo9dXaWNSwoxfm
   qXsfHxzThZDMx1KKPLb0wrLrnqi4HM5Ncq/KwdMPv8HGsEhrJBsq8+W+M
   B4HPsye8M/Q1zLrghNY9JCKwcJeFBkUSj/XmG336vjKqFaZWZn2gvR8gG
   9k+3U+VSGsN2oQ3FzXEDt09jNSZtpjFOeeRNsat+6qeogxFP2nBY62LIk
   iJEqP2TGkR509OcTADRgTUn1tJUMPDiNWcqtZejU9Tl12mayfVEjF7j2j
   cX0V3USZdv3MMPmno0J49gkEkBAIsldZoDmpg84nIMWf4F5NWTi9L5qP1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="239857691"
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="239857691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2021 15:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="467520897"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Dec 2021 15:37:25 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1GbM-0004qo-Bz; Sat, 25 Dec 2021 23:37:24 +0000
Date: Sun, 26 Dec 2021 07:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 838/9897] ERROR: modpost:
 "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko]
 undefined!
Message-ID: <202112260753.8orwHSlb-lkp@intel.com>
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
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 5814f32fef137e34577c4f053272c53e7ca33cd9 [838/9897] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
config: i386-randconfig-a012-20211226 (https://download.01.org/0day-ci/archive/20211226/202112260753.8orwHSlb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5814f32fef137e34577c4f053272c53e7ca33cd9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5814f32fef137e34577c4f053272c53e7ca33cd9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD ea586a076e8aa606c59b66d86660590f18354b11 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_handler_free" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_new_std_menu_items" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_new_std" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_handler_init_class" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
   Selected by
   - VIDEO_MAX96712 && STAGING && STAGING_MEDIA && MEDIA_SUPPORT && I2C && OF_GPIO

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
