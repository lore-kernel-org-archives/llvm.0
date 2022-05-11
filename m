Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D1E320D
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652298794; x=1683834794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ygwFKm2hYAkHxpXKCsLdxfsomBVbN67A7xdvGAqeEH4=;
  b=CUpXpJa8BUP7mr+YIZUfCLTbAn/BJVlkdADFfRuOEZdAEMom9nSIQEC+
   Wioc18TglCjWJ39hGHGofIQeqpZY70w6/JJdCUWUrzd3VofFQPckj3MUF
   zrqsCU/djM2OGaC/IGHO3GbU5FKzItvcU/ba/DdLQFVqKcOUjueqHYPZ3
   /DfRsvUdIPNIABC9qANWw2g8x//gogAA/RMbqcOMe5KF0F3Sik9SiUTnx
   9QU4iw9m7/SF4SDOF9RRKwn6ulyUA5/ZEhg32mxEhlsg5MFkTobYyjQ0t
   0h+ntpAfNWarcngLLWWCK8n5/849/tu9c+5oaj81zVpNigNh8R49cZMRD
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="250327179"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="250327179"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 12:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="566335101"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2022 12:53:12 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nosOV-000JVv-GH;
	Wed, 11 May 2022 19:53:11 +0000
Date: Thu, 12 May 2022 03:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 9518/11094] ERROR: modpost:
 "rockchip_pmu_unblock" [drivers/devfreq/rk3399_dmc.ko] undefined!
Message-ID: <202205120335.LzAksOZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6107040c99d5dfc920721c198d45ed2d639b113a
commit: 2e691421a2c9e0462175fe98171afa632861b199 [9518/11094] PM / devfreq: rk3399_dmc: Block PMU during transitions
config: arm-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120335.LzAksOZI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e691421a2c9e0462175fe98171afa632861b199
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2e691421a2c9e0462175fe98171afa632861b199
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 6107040c99d5dfc920721c198d45ed2d639b113a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rockchip_pmu_unblock" [drivers/devfreq/rk3399_dmc.ko] undefined!
>> ERROR: modpost: "rockchip_pmu_block" [drivers/devfreq/rk3399_dmc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
