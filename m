Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9382C9D
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 01:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641779163; x=1673315163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62hqdhIy8qQOvrcjtDBP8QjBwHRX6b+nfnFsSp2QZPw=;
  b=FQ4CVF4pJbbYLpPGzFGTeLQe2YaA7M+W1SX/V9E9ZQnfO+vFIOImlW2r
   J9+6nw8pqg4gmbfpYwAlxBAYPw5EwSojeOb9MEZBB/09Zyt8KICvMgNZF
   721hjUB6V/rZDf3F45gTCAZ4DciEygJpziZAfeTKSOirXpZiLaOrB0MO/
   85zfMySFwcOf1z0QySc6fNek4lymvN5OcssQ1FMgGz8Mk1XB7st1Z5S1b
   OMavtv3xltqUbnUG/R1xeHd0m4IAqhzVhC28LKJWubAdmZeSqAm3OCvvO
   iGutbpNP+NNgZAfUXY0o0OVJIuBQiOrnwb2P0Z8Zum3cB7E4lyNt2+sHH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="306491548"
X-IronPort-AV: E=Sophos;i="5.88,275,1635231600"; 
   d="scan'208";a="306491548"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 17:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,275,1635231600"; 
   d="scan'208";a="473961807"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Jan 2022 17:46:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6jl3-000238-B7; Mon, 10 Jan 2022 01:46:01 +0000
Date: Mon, 10 Jan 2022 09:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25q512jvm
Message-ID: <202201100902.4EN1M0wM-lkp@intel.com>
References: <20220109044418.4657-1-dphadke@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109044418.4657-1-dphadke@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dhananjay,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on mtd/spi-nor/next]
[also build test ERROR on next-20220107]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dhananjay-Phadke/mtd-spi-nor-Add-support-for-w25q512jvm/20220109-124549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20220110/202201100902.4EN1M0wM-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/6fdf5ef11f8f2e8bbfba403dcdfc299d119c51ee
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dhananjay-Phadke/mtd-spi-nor-Add-support-for-w25q512jvm/20220109-124549
        git checkout 6fdf5ef11f8f2e8bbfba403dcdfc299d119c51ee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/winbond.c:121:52: error: expected expression
           { "w25q512jvm", INFO(0xef7020, 0, 64 * 1024, 1024),
                                                             ^
>> drivers/mtd/spi-nor/winbond.c:193:12: error: invalid application of 'sizeof' to an incomplete type 'const struct flash_info[]'
           .nparts = ARRAY_SIZE(winbond_parts),
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:46:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   2 errors generated.


vim +121 drivers/mtd/spi-nor/winbond.c

    34	
    35	static const struct flash_info winbond_parts[] = {
    36		/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
    37		{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1)
    38			NO_SFDP_FLAGS(SECT_4K) },
    39		{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2)
    40			NO_SFDP_FLAGS(SECT_4K) },
    41		{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4)
    42			NO_SFDP_FLAGS(SECT_4K) },
    43		{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8)
    44			NO_SFDP_FLAGS(SECT_4K) },
    45		{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16)
    46			NO_SFDP_FLAGS(SECT_4K) },
    47		{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32)
    48			NO_SFDP_FLAGS(SECT_4K) },
    49		{ "w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32)
    50			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    51			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    52				      SPI_NOR_QUAD_READ) },
    53		{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64)
    54			NO_SFDP_FLAGS(SECT_4K) },
    55		{ "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32)
    56			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    57			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    58				      SPI_NOR_QUAD_READ) },
    59		{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4)
    60			NO_SFDP_FLAGS(SECT_4K) },
    61		{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4)
    62			NO_SFDP_FLAGS(SECT_4K) },
    63		{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4)
    64			NO_SFDP_FLAGS(SECT_4K) },
    65		{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64)
    66			NO_SFDP_FLAGS(SECT_4K) },
    67		{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64)
    68			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    69			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
    70			OTP_INFO(256, 3, 0x1000, 0x1000) },
    71		{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64)
    72			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    73			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    74				      SPI_NOR_QUAD_READ) },
    75		{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64)
    76			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    77			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
    78			OTP_INFO(256, 3, 0x1000, 0x1000) },
    79		{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128)
    80			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    81			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    82				      SPI_NOR_QUAD_READ) },
    83		{ "w25q128jwm", INFO(0xef8018, 0, 64 * 1024, 256)
    84			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    85			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    86				      SPI_NOR_QUAD_READ) },
    87		{ "w25q256jwm", INFO(0xef8019, 0, 64 * 1024, 512)
    88			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    89			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    90				      SPI_NOR_QUAD_READ) },
    91		{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128)
    92			NO_SFDP_FLAGS(SECT_4K) },
    93		{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128)
    94			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    95				      SPI_NOR_QUAD_READ) },
    96		{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128)
    97			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
    98			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
    99				      SPI_NOR_QUAD_READ) },
   100		{ "w25q64jvm", INFO(0xef7017, 0, 64 * 1024, 128)
   101			NO_SFDP_FLAGS(SECT_4K) },
   102		{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256)
   103			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
   104			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
   105				      SPI_NOR_QUAD_READ) },
   106		{ "w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256)
   107			FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
   108			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
   109				      SPI_NOR_QUAD_READ) },
   110		{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16)
   111			NO_SFDP_FLAGS(SECT_4K) },
   112		{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
   113			NO_SFDP_FLAGS(SECT_4K) },
   114		{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
   115			NO_SFDP_FLAGS(SECT_4K) },
   116		{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
   117			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
   118			.fixups = &w25q256_fixups },
   119		{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
   120			PARSE_SFDP },
 > 121		{ "w25q512jvm", INFO(0xef7020, 0, 64 * 1024, 1024),
   122			PARSE_SFDP },
   123		{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
   124			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
   125				      SPI_NOR_QUAD_READ) },
   126		{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
   127			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
   128				      SPI_NOR_DUAL_READ) },
   129		{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
   130			NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
   131				      SPI_NOR_QUAD_READ) },
   132	};
   133	
   134	/**
   135	 * winbond_set_4byte_addr_mode() - Set 4-byte address mode for Winbond flashes.
   136	 * @nor:	pointer to 'struct spi_nor'.
   137	 * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
   138	 *		address mode.
   139	 *
   140	 * Return: 0 on success, -errno otherwise.
   141	 */
   142	static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
   143	{
   144		int ret;
   145	
   146		ret = spi_nor_set_4byte_addr_mode(nor, enable);
   147		if (ret || enable)
   148			return ret;
   149	
   150		/*
   151		 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
   152		 * Register to be set to 1, so all 3-byte-address reads come from the
   153		 * second 16M. We must clear the register to enable normal behavior.
   154		 */
   155		ret = spi_nor_write_enable(nor);
   156		if (ret)
   157			return ret;
   158	
   159		ret = spi_nor_write_ear(nor, 0);
   160		if (ret)
   161			return ret;
   162	
   163		return spi_nor_write_disable(nor);
   164	}
   165	
   166	static const struct spi_nor_otp_ops winbond_otp_ops = {
   167		.read = spi_nor_otp_read_secr,
   168		.write = spi_nor_otp_write_secr,
   169		.erase = spi_nor_otp_erase_secr,
   170		.lock = spi_nor_otp_lock_sr2,
   171		.is_locked = spi_nor_otp_is_locked_sr2,
   172	};
   173	
   174	static void winbond_default_init(struct spi_nor *nor)
   175	{
   176		nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
   177	}
   178	
   179	static void winbond_late_init(struct spi_nor *nor)
   180	{
   181		if (nor->params->otp.org->n_regions)
   182			nor->params->otp.ops = &winbond_otp_ops;
   183	}
   184	
   185	static const struct spi_nor_fixups winbond_fixups = {
   186		.default_init = winbond_default_init,
   187		.late_init = winbond_late_init,
   188	};
   189	
   190	const struct spi_nor_manufacturer spi_nor_winbond = {
   191		.name = "winbond",
   192		.parts = winbond_parts,
 > 193		.nparts = ARRAY_SIZE(winbond_parts),

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
