Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278081C00
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655850439; x=1687386439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S9M+nxiGTqy+iOORAChUsI1bobjs+TvgVDkGk0n+jYU=;
  b=RYFWnIXX81t5cBVLKLKOpiP8ZkaAI4y81pcf81Ud/n5LS3UNqbbrQYNp
   ePvI0k9kWOuZpuP/aMv9OmtlKmuHANw31HCTSzhx7I6XbfohTzP8594Xz
   /7LnAeXMuAXYLxU3feSCHxGqWBH09KHQ3Rgn+yrEHPuP5CEw49pqLDR6P
   dkjOX/xxOEdG7SH78Ss7RtA8+9fRxb1scR4Ubnx3WqiSzPur7lP6PyMZr
   ThCS1qKwE5Idxg8t8mT2TOgea+i6O4AXF+GMU4utba6y4xrGPruKBag5x
   Q2gXW723XqA2bN5B6xjpQLkAPacCmuWWVfp7RVp9W8Mw8h2rhmg2ii+pa
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263287732"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="263287732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 15:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="586365078"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2022 15:27:17 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3mL6-0000V7-JX;
	Tue, 21 Jun 2022 22:27:16 +0000
Date: Wed, 22 Jun 2022 06:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld:
 irq-xilinx-intc.c:undefined reference to `iounmap'
Message-ID: <202206220648.Ovoh9xpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca1fdab7fd27eb069df1384b2850dcd0c2bebe8d
commit: b84dc7f0e3646d480b6972c5f25586215c5f33e2 irqchip/xilinx: Remove microblaze+zynq dependency
date:   12 days ago
config: s390-randconfig-r021-20220622 (https://download.01.org/0day-ci/archive/20220622/202206220648.Ovoh9xpK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b84dc7f0e3646d480b6972c5f25586215c5f33e2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b84dc7f0e3646d480b6972c5f25586215c5f33e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0x13a): undefined reference to `memunmap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x1e8): undefined reference to `memremap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: coherent.c:(.text+0x36c): undefined reference to `memunmap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x3a): undefined reference to `of_iomap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: irq-al-fic.c:(.init.text+0x4c0): undefined reference to `iounmap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/irqchip/irq-xilinx-intc.o: in function `xilinx_intc_of_init':
   irq-xilinx-intc.c:(.init.text+0xa6): undefined reference to `of_iomap'
>> /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: irq-xilinx-intc.c:(.init.text+0x1fc): undefined reference to `iounmap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/misc/open-dice.o: in function `open_dice_write':
   open-dice.c:(.text+0x170): undefined reference to `devm_memremap'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: open-dice.c:(.text+0x21e): undefined reference to `devm_memunmap'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
