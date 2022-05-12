Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205AE33CF
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652369917; x=1683905917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+C+zcQ9OMsRKzfxB09v5LYFDyAjdAYn83xmW14cew7Y=;
  b=Ue5eXM71CZHckR+Oegdu5oPZkOwnCsyYnlx/tY+6LivML/Op7B6L8Y2i
   F7Jps+stseAw+24iz6YcwSuXUrfiVKx0C+g7Bh4/2vlolQRz94w5UUfeS
   ug7uXVUc5hOdtk68pBHHIlS3W8Zis9ZNxsOptkt09U5N/zvzb8HV5fRCg
   2ut86MoMCOEdQMK19GawCL/4w86mpvd8sQVInYn+MerPhFe0JAJCLsZ7x
   Z3RlBquHtHZN7+zpdd4Pv1SNcGm4RXjRTm9UsJCAtEcgwnAkFiWIp2cS6
   06VJcgs35SSVTgWvPNFI5Jo0Tx8AzoCrS/+iyE5ZUYjCFCUS5FllayS8u
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250558742"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="250558742"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 08:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="553814387"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2022 08:38:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npAtc-000Kd0-SB;
	Thu, 12 May 2022 15:38:32 +0000
Date: Thu, 12 May 2022 23:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Wei Fu <wefu@redhat.com>, Liu Shaohua <liush@allwinnertech.com>,
	Guo Ren <guoren@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [ammarfaizi2-block:palmer/linux/riscv-d1 9/12]
 arch/riscv/kernel/cpufeature.c:292:6: warning: variable 'cpu_apply_feature'
 set but not used
Message-ID: <202205122310.HMWyrLx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-d1
head:   a35707c3d850dda0ceefb75b1b3bd191921d5765
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 [9/12] riscv: add RISC-V Svpbmt extension support
config: riscv-randconfig-r033-20220512 (https://download.01.org/0day-ci/archive/20220512/202205122310.HMWyrLx7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-d1
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:292:6: warning: variable 'cpu_apply_feature' set but not used [-Wunused-but-set-variable]
           u32 cpu_apply_feature = 0;
               ^
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/cpu_apply_feature +292 arch/riscv/kernel/cpufeature.c

   286	
   287	void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
   288							  struct alt_entry *end,
   289							  unsigned int stage)
   290	{
   291		u32 cpu_req_feature = cpufeature_probe(stage);
 > 292		u32 cpu_apply_feature = 0;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
