Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9911366
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657968309; x=1689504309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXoIdsI06ApUFAXOZr8yxTpQ7ca8CjvUBMrdyW0LJ1A=;
  b=d6TydlVARn2ZusMOCNz34eQdVSGtqDyrxD9HnwU/HMBKIENZ12AD5mDq
   kuMUEkPwYIfp1dABbNh3pa576KeHOyJK+lWJrfjEW+QVyoHHKTWKdJAB2
   rX+xN1gGgMKJGynReCiAZAIiOx1lpXoUmZl8MUmAR3n10Hgqo468haRwb
   VLWQCjcgmap0oRXtgRZZ+5smZsyfWvXhaWGpyiZdmQYXmzC8CG5qPVrKp
   UwLkRHik3Uz602JdgQ2uqzAo5JzOkvP7ZGsqQFrSpRoP5ud2w9GCTLr4R
   It9bqXEFh9JSzkm+Cdp6OEIhRO6OijBMDv2zrxc2iMIrKiZ4jMFskeV5a
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="347653754"
X-IronPort-AV: E=Sophos;i="5.92,276,1650956400"; 
   d="scan'208";a="347653754"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 03:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,276,1650956400"; 
   d="scan'208";a="664483674"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jul 2022 03:45:06 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCfII-0001No-6L;
	Sat, 16 Jul 2022 10:45:06 +0000
Date: Sat, 16 Jul 2022 18:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: ERROR: modpost: "clk_get_io" [drivers/watchdog/lantiq_wdt.ko]
 undefined!
Message-ID: <202207161803.gts1T5UA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b59ec8d50a1f28747ceff9a4f39af5deba9540e
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   1 year, 10 months ago
config: mips-buildonly-randconfig-r006-20220715 (https://download.01.org/0day-ci/archive/20220716/202207161803.gts1T5UA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_get_io" [drivers/watchdog/lantiq_wdt.ko] undefined!
ERROR: modpost: "vhost_iotlb_itree_next" [drivers/vdpa/mlx5/mlx5_vdpa.ko] undefined!
ERROR: modpost: "vhost_iotlb_itree_first" [drivers/vdpa/mlx5/mlx5_vdpa.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
