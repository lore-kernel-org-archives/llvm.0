Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C5AFE6;
	Tue, 18 Apr 2023 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681845189; x=1713381189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MOhprBHpr43tz8sYRr2cXoGAuUvU7HU/0ZiTdde8Ipg=;
  b=dN99pVeFU1w9FvlwzuZ+XSOIx+ZG6NkNqc9Uy/RY60/tNknqV6YKH+qo
   /6x24HClpBlQijX28jB25SL/M0NGYLLj/JAl4OSrHo7uXRus7i2uSeP3d
   daEFxbUxm1HP3W97J/maoIg19IFBY3kAQoJuqf4FbrF4ktNNm+w6L6BhV
   DpNemqUB64pf03gxb/Hvq07Hp4I/2THbGJYT6Nh+fytTmxHEN5hhpwGYw
   n2py3QMgrqNbAu3ypRhffeFn1cLg0OgIlulSYte9E+gDkmGsce5ZG31ki
   7pwFKFrWB72XjiDb9sf+e8IPD1eMsBN3dQmjgiRh8k7iYzkrn1Ad3+uNe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325599445"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="325599445"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 12:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="641481108"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="641481108"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2023 12:13:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poqlD-000dwF-1b;
	Tue, 18 Apr 2023 19:13:03 +0000
Date: Wed, 19 Apr 2023 03:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Yang <mmyangfl@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: Add simple clock controller
Message-ID: <202304190206.OjctYqwT-lkp@intel.com>
References: <20230416194624.1258860-3-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416194624.1258860-3-mmyangfl@gmail.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7a934f4bd7d6f9da84c8812da3ba42ee10f5778e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Yang/dt-bindings-clock-Add-simple-clock-controller/20230417-034857
base:   7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
patch link:    https://lore.kernel.org/r/20230416194624.1258860-3-mmyangfl%40gmail.com
patch subject: [PATCH v3 2/4] clk: Add simple clock controller
config: s390-randconfig-r036-20230416 (https://download.01.org/0day-ci/archive/20230419/202304190206.OjctYqwT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/242d6bab7339a967b40f9731b989913e8b2ea63c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Yang/dt-bindings-clock-Add-simple-clock-controller/20230417-034857
        git checkout 242d6bab7339a967b40f9731b989913e8b2ea63c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190206.OjctYqwT-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: DWARF error: could not find abbrev number 115
   kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0xc8): undefined reference to `memunmap'
   s390x-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x14a): undefined reference to `memremap'
   s390x-linux-ld: coherent.c:(.text+0x254): undefined reference to `memunmap'
   s390x-linux-ld: kernel/dma/coherent.o: in function `dma_release_coherent_memory':
   coherent.c:(.text+0x2c0): undefined reference to `memunmap'
   s390x-linux-ld: DWARF error: could not find abbrev number 53
   drivers/clk/clk-of.o: in function `of_clk_get_reg':
>> clk-of.c:(.text+0x6a): undefined reference to `of_iomap'
   s390x-linux-ld: drivers/clk/clk-of.o: in function `of_crg_ctrl_setup':
   clk-of.c:(.text+0x322): undefined reference to `of_iomap'
   s390x-linux-ld: DWARF error: could not find abbrev number 8446
   drivers/clk/clk-fixed-mmio.o: in function `fixed_mmio_clk_setup':
   clk-fixed-mmio.c:(.text+0x48): undefined reference to `of_iomap'
   s390x-linux-ld: clk-fixed-mmio.c:(.text+0x68): undefined reference to `iounmap'
   s390x-linux-ld: DWARF error: could not find abbrev number 15506
   drivers/char/xillybus/xillybus_of.o: in function `xilly_drv_probe':
   xillybus_of.c:(.text+0x64): undefined reference to `devm_platform_ioremap_resource'
   s390x-linux-ld: DWARF error: could not find abbrev number 93
   drivers/misc/open-dice.o: in function `open_dice_write':
   open-dice.c:(.text+0xe6): undefined reference to `devm_memremap'
   s390x-linux-ld: open-dice.c:(.text+0x176): undefined reference to `devm_memunmap'
   s390x-linux-ld: DWARF error: could not find abbrev number 67
   drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0xe8): undefined reference to `iounmap'
   s390x-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
   cistpl.c:(.text+0x4a6): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x520): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x572): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x59c): undefined reference to `ioremap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
