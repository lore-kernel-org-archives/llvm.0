Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882B2F24
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644496568; x=1676032568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dg3mYH/kxWETIHR59Cu6igjsfuGx8EecWXhf54VEyNg=;
  b=WUk+sP6JDS7//weu4Ecns3xwKW5a/3XBBVo5xgZ/1qMnDNoUyK0BHKtI
   rkXMK4G6EzOI/VIGNHNJqQL6wWl+ZzjjP93RbgOs67zu0M00rIPqZrpTZ
   RpkUdlmUxfuUKZ8VkD2tbHnt5fRKa0aLGhWXDcoFaIyYNTG/TgummbLQh
   czvlXern4BsC1SfCyvklmqr3jnE9K7Tg3a8uGUiaJlWds/wmZFHCuPXqM
   1ZTmOL1yswMzqpLU23fkHzIgJlzhH99JSCz7qucyHl44xwqrMwJ+h0a33
   rQYzIlU34GGvpZFMA97yPuX40xyI8dFP5ld8SMPxBwx61Zyi0Zh5ICiNd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="229447897"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="229447897"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 04:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="482750305"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2022 04:35:45 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI8fl-0003Cl-Tz; Thu, 10 Feb 2022 12:35:41 +0000
Date: Thu, 10 Feb 2022 20:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: ld.lld: error: undefined symbol: cpu_arm925_suspend_size
Message-ID: <202202102039.wkitu2Mo-lkp@intel.com>
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
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: faae6c9f2e68e62687636a7d6e0517b3bf594add cpuidle: tegra: Enable compile testing
date:   4 months ago
config: arm-buildonly-randconfig-r004-20220210 (https://download.01.org/0day-ci/archive/20220210/202202102039.wkitu2Mo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=faae6c9f2e68e62687636a7d6e0517b3bf594add
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout faae6c9f2e68e62687636a7d6e0517b3bf594add
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: cpu_arm925_suspend_size
   >>> referenced by kernel/sleep.o:(.text+0x68) in archive arch/arm/built-in.a
--
>> ld.lld: error: undefined symbol: cpu_arm925_do_suspend
   >>> referenced by suspend.c
   >>> kernel/suspend.o:(__cpu_suspend_save) in archive arch/arm/built-in.a
--
>> ld.lld: error: undefined symbol: cpu_arm925_do_resume
   >>> referenced by suspend.c
   >>> kernel/suspend.o:(__cpu_suspend_save) in archive arch/arm/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND
   Depends on ARCH_SUSPEND_POSSIBLE
   Selected by
   - ARM_TEGRA_CPUIDLE && CPU_IDLE && (ARM || ARM64) && (ARCH_TEGRA || COMPILE_TEST && !ARM64 && MMU

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
