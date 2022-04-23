Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862D7C
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 21:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650748559; x=1682284559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghR7zmzRRlZ8AQDiWjZSUUuq015qDScyozYGR7A57rE=;
  b=IsfxPBocjBBlcOjQ/sEISpYoiZBMeiCLvJijFNIl762ond6jAnVXsdPt
   CTff3tf1p+hSa43GViO8dcft4OKOw8mKUvKe38EME3RW8pCpI2Fl2XA2H
   LblfDpMqtqe2BDpeVBQXoLF9uZZv4nl+KAiTEbD6/67OSTX0uz+9CFXNr
   R+FjDVZw7TIcP+Epy3day+ttyFPSgPT6WQdWRJhoraGuEBTyX26dhIdQF
   RPMmFouvW9j10Ir+Ifz51w39dYsFEbGRLwCw3xWAo4OTT0YJG31gQn/bm
   0ZmLCkrRYH1+OvxzoBTzg+WBiJ+g5gIm4OToJugkR+bCVYQgMGV9PkLKA
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="290089026"
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; 
   d="scan'208";a="290089026"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 14:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; 
   d="scan'208";a="649124969"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2022 14:15:57 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niN6i-0000U5-S0;
	Sat, 23 Apr 2022 21:15:56 +0000
Date: Sun, 24 Apr 2022 05:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: ld.lld: error: undefined symbol: cpu_sa110_suspend_size
Message-ID: <202204240554.gz9y0hb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45ab9400e73f34103e73c18a73280c9aa1650e98
commit: faae6c9f2e68e62687636a7d6e0517b3bf594add cpuidle: tegra: Enable compile testing
date:   7 months ago
config: arm-buildonly-randconfig-r006-20220423 (https://download.01.org/0day-ci/archive/20220424/202204240554.gz9y0hb8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=faae6c9f2e68e62687636a7d6e0517b3bf594add
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout faae6c9f2e68e62687636a7d6e0517b3bf594add
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: cpu_sa110_suspend_size
   >>> referenced by kernel/sleep.o:(.text+0x68) in archive arch/arm/built-in.a
--
>> ld.lld: error: undefined symbol: cpu_sa110_do_suspend
   >>> referenced by suspend.c
   >>> kernel/suspend.o:(__cpu_suspend_save) in archive arch/arm/built-in.a
--
>> ld.lld: error: undefined symbol: cpu_sa110_do_resume
   >>> referenced by suspend.c
   >>> kernel/suspend.o:(__cpu_suspend_save) in archive arch/arm/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND
   Depends on ARCH_SUSPEND_POSSIBLE
   Selected by
   - ARM_TEGRA_CPUIDLE && CPU_IDLE && (ARM || ARM64) && (ARCH_TEGRA || COMPILE_TEST && !ARM64 && MMU

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
