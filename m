Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315A2C80
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 03:43:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="299767983"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="299767983"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 19:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="500061002"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2021 19:43:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msGWK-000EA3-Oh; Wed, 01 Dec 2021 03:43:00 +0000
Date: Wed, 1 Dec 2021 11:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:for-kernelci 18/28] arch/arm/mach-footbridge/common.c:102:6:
 warning: no previous prototype for function 'dc21285_handle_irq'
Message-ID: <202112011148.XrnWip5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   6999340fcf7f37e2a82eb35452b08c5893a2872d
commit: 9a2235df531e427be5777a894b3fa355ce127894 [18/28] ARM: footbridge: use GENERIC_IRQ_MULTI_HANDLER
config: arm-randconfig-r001-20211130 (https://download.01.org/0day-ci/archive/20211201/202112011148.XrnWip5a-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=9a2235df531e427be5777a894b3fa355ce127894
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 9a2235df531e427be5777a894b3fa355ce127894
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-footbridge/common.c:102:6: warning: no previous prototype for function 'dc21285_handle_irq' [-Wmissing-prototypes]
   void dc21285_handle_irq(struct pt_regs *regs)
        ^
   arch/arm/mach-footbridge/common.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dc21285_handle_irq(struct pt_regs *regs)
   ^
   static 
   1 warning generated.


vim +/dc21285_handle_irq +102 arch/arm/mach-footbridge/common.c

   101	
 > 102	void dc21285_handle_irq(struct pt_regs *regs)
   103	{
   104		int irq;
   105		do {
   106			irq = dc21285_get_irq();
   107			if (!irq)
   108				break;
   109	
   110			generic_handle_irq(irq);
   111		} while (1);
   112	}
   113	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
