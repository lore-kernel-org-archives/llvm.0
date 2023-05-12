Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B224DF69;
	Fri, 12 May 2023 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683899090; x=1715435090;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Mz+bm1zyiDFApuqYAtgJoZTUthACqafyjST24ljsRgs=;
  b=daVIcWbgLiuMRRf0HwJxZ9QtdEZXSGaZroKXhgTHMh/ur5koCs0wvZfB
   RzNKeKp5WLBEFCXESBH2fonHFEUXkYSAFHjGtEpR/F9spqs9f2xYsnI2x
   6JiUr7UBHONRFbED32PznVL07fxonihdnjKRi5+DH10s2SFC5CfDybK/g
   IN2F7DQq4sZjwZFOsUF5pmH0TGQVh/rAFkmFx4U0UgxU3lhBJtiDE2E8i
   1UF1SANo2jkEjGbAeUf6nBKHfPBfMWO0pGzXw/ZLrdgcFPniZDx3lO1UM
   Nkn3WYiERQ4wkC23NbGVJs1qrNGse7/VYyTjxEWjgkbdPHFrcQ11oy8dA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="330408886"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="330408886"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 06:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694238753"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694238753"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 06:44:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxT4i-0004td-0f;
	Fri, 12 May 2023 13:44:48 +0000
Date: Fri, 12 May 2023 21:44:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 43/55] ld.lld: error:
 vmlinux.a(drivers/regulator/qcom-labibb-regulator.o):(function
 qcom_labibb_regulator_probe: .text+0x38): relocation R_RISCV_HI20 out of
 range: 535176 is not in [-524288, 524287]; references '__stack_chk_guard'
Message-ID: <202305122133.xKcEGC7y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   c1ff19a17b95d49653eed009b10259ad6a70bae4
commit: 534c5e0de96b344fefe9778e5ee63f74649ea624 [43/55] RISC-V: Add defines for SBI debug console extension
config: riscv-buildonly-randconfig-r006-20230509 (https://download.01.org/0day-ci/archive/20230512/202305122133.xKcEGC7y-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/534c5e0de96b344fefe9778e5ee63f74649ea624
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout 534c5e0de96b344fefe9778e5ee63f74649ea624
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122133.xKcEGC7y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/regulator/qcom-labibb-regulator.o):(function qcom_labibb_regulator_probe: .text+0x38): relocation R_RISCV_HI20 out of range: 535176 is not in [-524288, 524287]; references '__stack_chk_guard'
   >>> referenced by qcom-labibb-regulator.c:762 (drivers/regulator/qcom-labibb-regulator.c:762)
   >>> defined in vmlinux.a(arch/riscv/kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
