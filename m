Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC3133D4
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 21:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653256238; x=1684792238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tuGNTQKb7tov2NqHToiPCQKs9Nz+OzX5pq7XJ3d4Hus=;
  b=meal594sXibcAabYcxCritaVMkXN1eeqkkae+l7hwXkD6jGakKA6Za2d
   vJx0UgCJppJ62vyJ1+KcpRB7q9UqVdyxNmZdU9b/vzgEKqiwLu6ITfpSL
   790eYrFcdZrZQzEvDQK0QkFwkNpgPYEk1BhdgeQXc4IXa2fAy/I7mZISm
   s0l1MV/HEUKgteUe2bNgbgVW/tjOoqpaTUp9CmRC4+9guVTwTK8+3/EFK
   Mi5EgztIuPVmZ4EBEy8LU+5L8ZR/vqYxu+s1lVabhFeVLDMVsDMU5RXKz
   uIWCg63ClZhvApw3nXNkteVwhJgdJU9CC4KE0afwkOj260tJpwc3+KmqE
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="336104807"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; 
   d="scan'208";a="336104807"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 14:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; 
   d="scan'208";a="702682155"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 May 2022 14:50:35 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nstT9-0000df-7m;
	Sun, 22 May 2022 21:50:35 +0000
Date: Mon, 23 May 2022 05:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [madvenka786:orc_v2 17/20] arch/arm64/include/asm/module.h:19:8:
 error: redefinition of 'mod_arch_specific'
Message-ID: <202205230540.ycgHZVXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v2
head:   ed9a1d5c036130a53c639eb712485e3d13ab4372
commit: 9da8b45b52cb2268200c44977bc7482d3bea70dc [17/20] arm64: Build the kernel with ORC information
config: arm64-randconfig-r011-20220523 (https://download.01.org/0day-ci/archive/20220523/202205230540.ycgHZVXI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443dbaba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/madvenka786/linux/commit/9da8b45b52cb2268200c44977bc7482d3bea70dc
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v2
        git checkout 9da8b45b52cb2268200c44977bc7482d3bea70dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:33:
>> arch/arm64/include/asm/module.h:19:8: error: redefinition of 'mod_arch_specific'
   struct mod_arch_specific {
          ^
   include/asm-generic/module.h:10:8: note: previous definition is here
   struct mod_arch_specific
          ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:120: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/mod_arch_specific +19 arch/arm64/include/asm/module.h

24af6c4e4e0f6e Ard Biesheuvel           2017-02-21  18  
24af6c4e4e0f6e Ard Biesheuvel           2017-02-21 @19  struct mod_arch_specific {
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  20  #ifdef CONFIG_ARM64_MODULE_PLTS
24af6c4e4e0f6e Ard Biesheuvel           2017-02-21  21  	struct mod_plt_sec	core;
24af6c4e4e0f6e Ard Biesheuvel           2017-02-21  22  	struct mod_plt_sec	init;
e71a4e1bebaf7f Ard Biesheuvel           2017-06-06  23  
e71a4e1bebaf7f Ard Biesheuvel           2017-06-06  24  	/* for CONFIG_DYNAMIC_FTRACE */
3b23e4991fb66f Torsten Duwe             2019-02-08  25  	struct plt_entry	*ftrace_trampolines;
fd045f6cd98ec4 Ard Biesheuvel           2015-11-24  26  #endif
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  27  #ifdef CONFIG_UNWINDER_ORC
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  28  	unsigned int num_orcs;
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  29  	int *orc_unwind_ip;
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  30  	struct orc_entry *orc_unwind;
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  31  #endif
9da8b45b52cb22 Madhavan T. Venkataraman 2022-05-22  32  };
fd045f6cd98ec4 Ard Biesheuvel           2015-11-24  33  

:::::: The code at line 19 was first introduced by commit
:::::: 24af6c4e4e0f6e9803bec8dca0f7748afbb2bbf0 arm64: module: split core and init PLT sections

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
