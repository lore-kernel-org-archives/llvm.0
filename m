Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB731368
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653500748; x=1685036748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XaAdaYRmEX4q3+5JloUL5heNfATKBvuMIhBlEAf54yk=;
  b=FyFioERwMWUymM4i2hsuVvo9VgWgnwvQAsy77+M489b399sN35LBnKtG
   0iCrOqd3ZyiBbaJK0WWhj/E6QiWgOwLQaQOEfbebKnBQB3jrrn1h9Hwou
   tPgn0xezctbYPTjLUdABN5v15COe06mnxzgSrEzW64Pr9Mi21pl6UOLd0
   /KwGGToqmGs1gfClQj2U45alLDNnc64fSxwsBa0+3KOQv8hf4gRxM7DxE
   +SXXMsS6yicKmxk48HclDJ5JSkJuoKBvIwR9j8nyWRJYwdoHJJwOToa6n
   zXRnjZydch7VDhGo0dz17zd+A5Ts070dTQ2rKxiGdm4VrdJqztcNHZ83P
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="272704118"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="272704118"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 10:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="630449881"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 May 2022 10:33:03 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntusY-0003C0-J7;
	Wed, 25 May 2022 17:33:02 +0000
Date: Thu, 26 May 2022 01:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [tzungbi-chrome-platform:dev 25/25] ERROR: modpost:
 "cros_kunit_ec_xfer_mock_addx"
 [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
Message-ID: <202205260106.UjRGjFFM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   c8065f6d478990cfc385d1d579972a75fc29605b
commit: c8065f6d478990cfc385d1d579972a75fc29605b [25/25] platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_query_all()
config: arm64-randconfig-r006-20220524 (https://download.01.org/0day-ci/archive/20220526/202205260106.UjRGjFFM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git/commit/?id=c8065f6d478990cfc385d1d579972a75fc29605b
        git remote add tzungbi-chrome-platform https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git
        git fetch --no-tags tzungbi-chrome-platform dev
        git checkout c8065f6d478990cfc385d1d579972a75fc29605b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cros_kunit_ec_xfer_mock_addx" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_ec_xfer_mock_next" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_ec_xfer_mock_add" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_reset" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_ec_xfer_mock" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
