Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D17B7C
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 11:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653392992; x=1684928992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDtdUAzD4FniCrn3h9L2X32oiCwSfjnFJW5Et7tIN0Q=;
  b=Vs60UvFNIGo+6cMPLYN9JyLcx7PQdHFikR76gDclODinQnf8owfJhdhx
   STGYjwa7jih44RnsQjCN5vttXw+LEXyc3hkaBUHHR2b/Om9sIYAiPpDzM
   teDi7rI5+ztkwM9/dw4xs0NoP7LCX1NqMm+1yG395uRf7iPHMz9NO9tYj
   hUmiuWPd4Mjoteo5kUe6dtubIFF6txFedamL+XH40wvffM6RHossAGT7m
   3K1jbWOdWmEWZHbMBtXSZR5+VwlJcRQT/7skWwiMLVCFQ1WZyjRX7t19s
   8po2D5Tmig0jBzqS6/1BUMQuNjWomO3zczC2CE0Pw3kToLhKA59qJvpat
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="272325812"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="272325812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 04:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="526373481"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 May 2022 04:49:31 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntT2Y-00020c-5I;
	Tue, 24 May 2022 11:49:30 +0000
Date: Tue, 24 May 2022 19:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 9269/14079] ld.lld: error: undefined symbol:
 rockchip_pmu_block
Message-ID: <202205241931.GbIyyVs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09ce5091ff971cdbfd67ad84dc561ea27f10d67a
commit: 2e691421a2c9e0462175fe98171afa632861b199 [9269/14079] PM / devfreq: rk3399_dmc: Block PMU during transitions
config: arm64-randconfig-r006-20220524 (https://download.01.org/0day-ci/archive/20220524/202205241931.GbIyyVs2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e691421a2c9e0462175fe98171afa632861b199
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2e691421a2c9e0462175fe98171afa632861b199
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 09ce5091ff971cdbfd67ad84dc561ea27f10d67a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rockchip_pmu_block
   >>> referenced by rk3399_dmc.c:101 (drivers/devfreq/rk3399_dmc.c:101)
   >>> devfreq/rk3399_dmc.o:(rk3399_dmcfreq_target) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: rockchip_pmu_unblock
   >>> referenced by rk3399_dmc.c:212 (drivers/devfreq/rk3399_dmc.c:212)
   >>> devfreq/rk3399_dmc.o:(rk3399_dmcfreq_target) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
