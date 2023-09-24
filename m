Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F0D29E;
	Sun, 24 Sep 2023 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695582444; x=1727118444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4QSvOP+U6bvZSrcIHxrcB0EEtqIotVmdjxuDPLs4MY=;
  b=SRM1rQRgyrWcn62AihoNtSJId31B2mPzEVkVzcu4acVE0FCOIPrjspcC
   Ocwmlz/DTX0Xxi33r1z0fZgYoSMfP7gfafnF0ZsKtt6rC6vplPYYYqC7M
   wHk9F92XArLdApwnerbYBQbkLUtnYiIjOf14iVTv/OY/nUCmjU3VBx85G
   sZ5YXg9GjmRKhomodQhtdw3JI+tqejjfUOZg6W8vUhqd/l6n+EnaQ/LeP
   CBbirkZLp/o6BNQaJDNrgM43mudmr6Oe8xmmJqX3ZloTTPd6Nd8ViLvJc
   KbOAZAPWmIiAsvK44ahDtx8fXzP9HCivcXKwiyzoHMYMguOMYPHnYS44J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445224272"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="445224272"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 12:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748129238"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="748129238"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Sep 2023 12:07:21 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkURo-0000Kx-0G;
	Sun, 24 Sep 2023 19:07:16 +0000
Date: Mon, 25 Sep 2023 03:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 935/1123] drivers/spi/spi-sh-msiof.c:590:22:
 error: passing 'const struct spi_device *' to parameter of type 'struct
 spi_device *' discards qualifiers
Message-ID: <202309250335.HbQxldm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: ae655c59997b0da487fa28ef79046f3a129a61cf [935/1123] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
config: x86_64-buildonly-randconfig-003-20230905 (https://download.01.org/0day-ci/archive/20230925/202309250335.HbQxldm5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250335.HbQxldm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250335.HbQxldm5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-sh-msiof.c:590:22: error: passing 'const struct spi_device *' to parameter of type 'struct spi_device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           if (spi_get_csgpiod(spi, 0)) {
                               ^~~
   include/linux/spi/spi.h:276:68: note: passing argument to parameter 'spi' here
   static inline struct gpio_desc *spi_get_csgpiod(struct spi_device *spi, u8 idx)
                                                                      ^
   drivers/spi/spi-sh-msiof.c:594:27: error: passing 'const struct spi_device *' to parameter of type 'struct spi_device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   ss = spi_get_chipselect(spi, 0);
                                           ^~~
   include/linux/spi/spi.h:266:56: note: passing argument to parameter 'spi' here
   static inline u8 spi_get_chipselect(struct spi_device *spi, u8 idx)
                                                          ^
   2 errors generated.


vim +590 drivers/spi/spi-sh-msiof.c

   581	
   582	static int sh_msiof_prepare_message(struct spi_controller *ctlr,
   583					    struct spi_message *msg)
   584	{
   585		struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
   586		const struct spi_device *spi = msg->spi;
   587		u32 ss, cs_high;
   588	
   589		/* Configure pins before asserting CS */
 > 590		if (spi_get_csgpiod(spi, 0)) {
   591			ss = ctlr->unused_native_cs;
   592			cs_high = p->native_cs_high;
   593		} else {
   594			ss = spi_get_chipselect(spi, 0);
   595			cs_high = !!(spi->mode & SPI_CS_HIGH);
   596		}
   597		sh_msiof_spi_set_pin_regs(p, ss, !!(spi->mode & SPI_CPOL),
   598					  !!(spi->mode & SPI_CPHA),
   599					  !!(spi->mode & SPI_3WIRE),
   600					  !!(spi->mode & SPI_LSB_FIRST), cs_high);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
