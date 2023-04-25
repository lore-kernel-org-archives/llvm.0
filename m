Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686601FBF;
	Tue, 25 Apr 2023 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682462825; x=1713998825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSpLcxcikTKfnCnMDjhtR63XahqoW5WLeNZf3ys8a5M=;
  b=An+7amUVBbdZwX3QVdyIpO8+TLKJ4d5l5TIY+i48EezRatzJl/3SKF4w
   nbFR0BvL/COzeGIzXhAdrfrfJx1hkxBwah8BDYm0gsaD0RgMopq3prbbH
   tJ/YoDC/5mEB42d6B6FxKPv/LJneuUlfn/ob6fv6R/uTOiXgDjo/qvofr
   LYD6h3ByCfYGZNCqIZd+OzhJPCSLsKup9r97E79la2bX4WwkXLm4hDjtf
   MLrT8Rg5XGutT90ur6xCKQoJgR1JqR2AJSz1BNQ/gDY7kAJolCAKp2h+w
   b2PlgQRHR4xU2TarvknA8waGpz92Klz6phBu5Vnr5m8l7J8TYCwNJGZRN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412219010"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="412219010"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 15:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="783034793"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="783034793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2023 15:47:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prRR8-000jpW-2W;
	Tue, 25 Apr 2023 22:47:02 +0000
Date: Wed, 26 Apr 2023 06:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-component-2023-04-25-v2 15/28] ERROR: modpost:
 "snd_soc_dlc_use_cpu_as_platform"
 [sound/soc/generic/snd-soc-simple-card-utils.ko] undefined!
Message-ID: <202304260645.B4o8UoN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-component-2023-04-25-v2
head:   edc0bca1729bdd9ce5fc87a8076a5ef08e771aee
commit: d98b3fa5d38f436ae0cf9d515a2f9402bd3e0abe [15/28] ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
config: x86_64-randconfig-a003-20230424 (https://download.01.org/0day-ci/archive/20230426/202304260645.B4o8UoN9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/morimoto/linux/commit/d98b3fa5d38f436ae0cf9d515a2f9402bd3e0abe
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-component-2023-04-25-v2
        git checkout d98b3fa5d38f436ae0cf9d515a2f9402bd3e0abe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260645.B4o8UoN9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "snd_soc_dlc_use_cpu_as_platform" [sound/soc/generic/snd-soc-simple-card-utils.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
