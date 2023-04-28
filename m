Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D1883B;
	Fri, 28 Apr 2023 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682721768; x=1714257768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taQshYmNhLnYqDZFrMy/qTjKt4VOJdfqmTD4bziuiG8=;
  b=ATMknPTbPXYv1wHROVXd0UhL1+eVGQGy///FHsYzfG0mV6n0QuXa2QUQ
   EHU/cDMlBkwScao5AoPhpQSh+3cAxbwmlAjkgIw3wumONc5D7anrtT8Cc
   jRD0v4v+bzgHd2LP/PdY0vMepGCILMlEVzlNAT9yd5m9Uef2755iphK9J
   Gw7wFTvrHSuvIkGzT/mxEbqV0n9AyLJP3d4oifxFlCQGrHJcPwKRzBGtA
   wFcR/HwKK6GOqfnZaguEyXXEkDqFpBZXJmvPWSwPFZnoMMf2qBfjfyHVX
   3hyg5cPCjgl3v2PyrQUCYhfqu5rTDDC9VAbWb8egoNxsQPiNiHFo898W6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410985756"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="410985756"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 15:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="689000877"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="689000877"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Apr 2023 15:42:46 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psWnd-0000iz-2o;
	Fri, 28 Apr 2023 22:42:45 +0000
Date: Sat, 29 Apr 2023 06:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 52/73]
 drivers/irqchip/irq-riscv-imsic.c:107:36: warning: variable 'config' set but
 not used
Message-ID: <202304290647.TmTb7sk8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anup,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   00757ea0bfa14ae06d3f42144633ba253d6d5f5e
commit: a3617561d0ab814429c04120522bed7aed228f0c [52/73] RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-r001-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290647.TmTb7sk8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/a3617561d0ab814429c04120522bed7aed228f0c
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout a3617561d0ab814429c04120522bed7aed228f0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290647.TmTb7sk8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-imsic.c:107:36: warning: variable 'config' set but not used [-Wunused-but-set-variable]
           const struct imsic_global_config *config = NULL;
                                             ^
   1 warning generated.


vim +/config +107 drivers/irqchip/irq-riscv-imsic.c

667be2105a0f1c Anup Patel 2022-01-18  103  
667be2105a0f1c Anup Patel 2022-01-18  104  const struct imsic_global_config *imsic_get_global_config(void)
667be2105a0f1c Anup Patel 2022-01-18  105  {
667be2105a0f1c Anup Patel 2022-01-18  106  	struct imsic_handler *handler = get_cpu_ptr(&imsic_handlers);
667be2105a0f1c Anup Patel 2022-01-18 @107  	const struct imsic_global_config *config = NULL;
667be2105a0f1c Anup Patel 2022-01-18  108  
667be2105a0f1c Anup Patel 2022-01-18  109  	if (handler->priv)
667be2105a0f1c Anup Patel 2022-01-18  110  		config = &handler->priv->global;
667be2105a0f1c Anup Patel 2022-01-18  111  
667be2105a0f1c Anup Patel 2022-01-18  112  	put_cpu_ptr(&imsic_handlers);
667be2105a0f1c Anup Patel 2022-01-18  113  	return &handler->priv->global;
667be2105a0f1c Anup Patel 2022-01-18  114  }
667be2105a0f1c Anup Patel 2022-01-18  115  EXPORT_SYMBOL_GPL(imsic_get_global_config);
667be2105a0f1c Anup Patel 2022-01-18  116  

:::::: The code at line 107 was first introduced by commit
:::::: 667be2105a0f1cfa30e379c15b3a942cb6dff019 irqchip: Add RISC-V incoming MSI controller driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
