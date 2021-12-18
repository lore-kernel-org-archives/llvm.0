Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E4168
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 03:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639796432; x=1671332432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9Ij+5T6TMtiflwn0orWEsCPqR+HTLSkaUHstDOvCd8=;
  b=ZzuUdTU33sgfVv1wbbngl7QFWOGgNcCl7CNaYurvyHSbPDfOrPboS00N
   R0dw1WdhXRoMK9yiHoW7/4ZK3cqHcTtXiOHjc9MI5ZW0v9eT0vxNPh6fZ
   sELc41pKw5JVe2dZvsrh6DfofR/YTnFjx8VIQ7C0HJUYOP7U/Kh2Bl0Sl
   N4ZV8bhn1Ffv6fH+VnGiK/fKtFTso1mhT+ILVdpkkbn4ah5StMqPucS0F
   hS6ULi9C3xyqHx0PsZaMN5oFA6GML08Fn3zuYle1HUAGEBVLnJq2hoOph
   tyAsLSKBO1zTXCsfq08nAwj2OjGu+dTcbJSJqXY2XFM8pJWngYPZTzc1y
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="326169714"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="326169714"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 19:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="683598516"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Dec 2021 19:00:29 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myPxU-0005UC-IX; Sat, 18 Dec 2021 03:00:28 +0000
Date: Sat, 18 Dec 2021 10:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.4 942/1768]
 drivers/mtd/spi-nor/spi-nor.c:5196:14: error: implicit declaration of
 function 'of_get_next_parent'
Message-ID: <202112181002.zy1XXyLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   abafefebd1f1e040eef74e4ab571ea08bf745641
commit: 24bcc7359bdd609cedf0a715d77dc39e4ad782db [942/1768] mtd: spi-nor: Added axi-qspi support in spi-nor framework
config: x86_64-randconfig-r013-20211214 (https://download.01.org/0day-ci/archive/20211218/202112181002.zy1XXyLw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/24bcc7359bdd609cedf0a715d77dc39e4ad782db
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.4
        git checkout 24bcc7359bdd609cedf0a715d77dc39e4ad782db
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/spi-nor.c:691:5: warning: variable 'code' set but not used [-Wunused-but-set-variable]
           u8 code;
              ^
   drivers/mtd/spi-nor/spi-nor.c:2741:9: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
           loff_t addr = 0;
                  ^
>> drivers/mtd/spi-nor/spi-nor.c:5196:14: error: implicit declaration of function 'of_get_next_parent' [-Werror,-Wimplicit-function-declaration]
                                   np_spi = of_get_next_parent(np);
                                            ^
>> drivers/mtd/spi-nor/spi-nor.c:5196:12: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
                                   np_spi = of_get_next_parent(np);
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/spi-nor.c:5266:11: error: returning 'const struct flash_info *' from a function with result type 'struct flash_info *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           return jinfo;
                                  ^~~~~
   drivers/mtd/spi-nor/spi-nor.c:5281:9: error: returning 'const struct flash_info *' from a function with result type 'struct flash_info *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return info;
                  ^~~~
   drivers/mtd/spi-nor/spi-nor.c:5295:6: warning: unused variable 'is_dual' [-Wunused-variable]
           u32 is_dual;
               ^
   drivers/mtd/spi-nor/spi-nor.c:5294:22: warning: unused variable 'np_spi' [-Wunused-variable]
           struct device_node *np_spi;
                               ^
   5 warnings and 3 errors generated.


vim +/of_get_next_parent +5196 drivers/mtd/spi-nor/spi-nor.c

  5162	
  5163	static int spi_nor_set_addr_width(struct spi_nor *nor)
  5164	{
  5165		struct device_node *np = spi_nor_get_flash_node(nor);
  5166		struct device_node *np_spi;
  5167		if (nor->addr_width) {
  5168			/* already configured from SFDP */
  5169		} else if (nor->info->addr_width) {
  5170			nor->addr_width = nor->info->addr_width;
  5171		} else if (nor->mtd.size > 0x1000000) {
  5172	#ifdef CONFIG_OF
  5173			np_spi = of_get_next_parent(np);
  5174			if (of_property_match_string(np_spi, "compatible",
  5175						     "xlnx,zynq-qspi-1.0") >= 0) {
  5176				int status;
  5177	
  5178				nor->addr_width = 3;
  5179				nor->params.set_4byte(nor, false);
  5180				status = read_ear(nor, (struct flash_info *)nor->info);
  5181				if (status < 0)
  5182					dev_warn(nor->dev, "failed to read ear reg\n");
  5183				else
  5184					nor->curbank = status & EAR_SEGMENT_MASK;
  5185			} else {
  5186	#endif
  5187				/*
  5188				 * enable 4-byte addressing if the
  5189				 * device exceeds 16MiB
  5190				 */
  5191				nor->addr_width = 4;
  5192				if (JEDEC_MFR(nor->info) == SNOR_MFR_SPANSION ||
  5193				    nor->info->flags & SPI_NOR_4B_OPCODES) {
  5194					spi_nor_set_4byte_opcodes(nor);
  5195				} else {
> 5196					np_spi = of_get_next_parent(np);
  5197					if (of_property_match_string(np_spi,
  5198								     "compatible",
  5199								     "xlnx,xps-spi-2.00.a") >= 0) {
  5200						nor->addr_width = 3;
  5201						nor->params.set_4byte(nor, false);
  5202					} else {
  5203						nor->params.set_4byte(nor, true);
  5204						if (nor->isstacked) {
  5205							nor->spi->master->flags |=
  5206								SPI_MASTER_U_PAGE;
  5207							nor->params.set_4byte(nor, true);
  5208							nor->spi->master->flags &=
  5209								~SPI_MASTER_U_PAGE;
  5210						}
  5211					}
  5212				}
  5213	#ifdef CONFIG_OF
  5214			}
  5215	#endif
  5216		} else {
  5217			nor->addr_width = 3;
  5218		}
  5219	
  5220		if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
  5221			dev_err(nor->dev, "address width is too large: %u\n",
  5222				nor->addr_width);
  5223			return -EINVAL;
  5224		}
  5225	
  5226		/* Set 4byte opcodes when possible. */
  5227		if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
  5228		    !(nor->flags & SNOR_F_HAS_4BAIT))
  5229			spi_nor_set_4byte_opcodes(nor);
  5230	
  5231		return 0;
  5232	}
  5233	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
