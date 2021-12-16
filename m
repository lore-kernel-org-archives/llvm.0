Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349FF2CA4
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639678956; x=1671214956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bWpZ4y9aJXzVUaCFf9SWhCRFb9c6jHouDwtiP8EaPgY=;
  b=CsERQ9j5AH6UohORH8rFF4sSHmU44BYjl/vo6JdGthnSGjjPJ+9Q/Lti
   Ea4w7nxbVU1FgxHli2aLqN8ewku5S9TcE2YS1BpZqeG3a7hl1/Ys6xOLS
   NUGBflAqFv+5mo8fwu/r5fDSVq8GZiP/c9oTMdQIONF30cbAbfmBShp86
   UUiAlF1pR/YK5WFMtXzFN0hNR7+0FU08H3XNgGgICg1mBciruC1T3MABd
   EaUPrEqaL0D5RSGWA5q+zpKaFS1ChorTlgDfW2FOEe5eXRuku7+SluRIS
   C285sQaUsdh2aDt70AqwEciVHPFdZ2kT7SI07cAz7/+XIHzbcG2/U1MMu
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="325848544"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="325848544"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 10:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="754225259"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2021 10:22:17 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxvOT-0003e5-5x; Thu, 16 Dec 2021 18:22:17 +0000
Date: Fri, 17 Dec 2021 02:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v6 20/28] spi: spi-mem: Fill the spi-mem controller
 capabilities of all the drivers
Message-ID: <202112170259.JPoGT6na-lkp@intel.com>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Miquel,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on mtd/nand/next mtd/mtd/next mtd/mtd/fixes v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: hexagon-randconfig-r045-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170259.JPoGT6na-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
        git checkout bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at gigadevice.c
   >>> mtd/nand/spi/gigadevice.o:(.rodata+0x35C) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at macronix.c
   >>> mtd/nand/spi/macronix.o:(.rodata+0x83C) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at sysfs.c
   >>> mtd/spi-nor/sysfs.o:(.rodata+0x14) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at atmel.c
   >>> mtd/spi-nor/atmel.o:(.rodata+0x370) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at catalyst.c
   >>> mtd/spi-nor/catalyst.o:(.rodata+0x178) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at eon.c
   >>> mtd/spi-nor/eon.o:(.rodata+0x370) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at esmt.c
   >>> mtd/spi-nor/esmt.o:(.rodata+0xE8) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at everspin.c
   >>> mtd/spi-nor/everspin.o:(.rodata+0x130) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at fujitsu.c
   >>> mtd/spi-nor/fujitsu.o:(.rodata+0x58) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at gigadevice.c
   >>> mtd/spi-nor/gigadevice.o:(.rodata+0x250) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at intel.c
   >>> mtd/spi-nor/intel.o:(.rodata+0xE8) in archive drivers/built-in.a
..

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
