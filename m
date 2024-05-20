Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972718EB1;
	Mon, 20 May 2024 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716235367; cv=none; b=U1Uum4SOE4wo60rVUoWjZLMdirKwGU6smbBEPji1ktxXqywGHg3ts9WscUIqUFTzfIaQN5dgmjVkv8MI3ldv1mfvQ0bYItH4svBSqf/ToCQCVcyH4o7sVsG+TqvW4edEZNPXs2q+iEuLajvQfZABoGdEKpp4kCOfGTbucj++kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716235367; c=relaxed/simple;
	bh=FsAbo9snhN4vFBiYKTcW83J5wmZ+F82i49ZylVTgF8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FzDESDOTLU5DSt6BaP4vvzKM+WXjDc0G5QSFnzJDd8vWy0flltJVQ5P8uq0ETtZCgPXWy5X2vXOj2dWmwQPCAkRX+WojYSjNM5dqubIdZJZiMbFVc1txhY/B5m/Yk/fnKriOy/7rjHCEkQWdOiU8GzWJPo6tG4qlN7AerEXlJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWzWFeFp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWzWFeFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716235365; x=1747771365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsAbo9snhN4vFBiYKTcW83J5wmZ+F82i49ZylVTgF8Y=;
  b=WWzWFeFp13Jah2HCItnlZUf6KlwN5f8+i6EANYLFVGbInrjv0nMFlC5+
   nXwsabv1ndI/lt2ake9xCluEtdsGGhY4Bfjf7KFRbsyZVLarerJqpccp4
   0I9w+t29vhsp+x3rOGNBHuzF7QgXAtO4Os1Hdh7MXcC+pc1DIaiNeSqDG
   J1XrgWwMPC9yYl8mhHmz0QL1WPjiiOq8WnUmBQhLSwd3nRgbMJdB8B77b
   O3O8UUFWjii0QDXkRs+FKZ2qU6XP1mGKeM3d9oAEk//6Nz8ww/3KHemts
   lE7SMf/R0UfTrDP6oM5UcJXCG1zt9U/u7qKXPXLpu7K7uu2dZxzG0hec/
   A==;
X-CSE-ConnectionGUID: /y4sG4D3Qh240vmKs3mxvw==
X-CSE-MsgGUID: y8VPS4OqT26l61e1FgWgHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15336002"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="15336002"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 13:02:45 -0700
X-CSE-ConnectionGUID: bNsTCpw8QpuEkz8c0aU4rQ==
X-CSE-MsgGUID: 3lcWJKh0SE6JCN2M9H+fkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="37489957"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2024 13:02:43 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s99Cu-000574-0U;
	Mon, 20 May 2024 20:02:35 +0000
Date: Tue, 21 May 2024 04:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 13/13]
 drivers/mtd/nand/spi/macronix.c:71:12: error: call to undeclared function
 'FIELD_GET'; ISO C99 and later do not support implicit function declarations
Message-ID: <202405210358.Lu8w6dPe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git macronix/nand-next/spi-nand-cont-read
head:   f60b2d314a9c7534714521dfbeca9cff37134d56
commit: f60b2d314a9c7534714521dfbeca9cff37134d56 [13/13] mtd: spi-nand: macronix: Continuous read support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240521/202405210358.Lu8w6dPe-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210358.Lu8w6dPe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210358.Lu8w6dPe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/macronix.c:10:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/mtd/nand/spi/macronix.c:10:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mtd/nand/spi/macronix.c:10:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mtd/nand/spi/macronix.c:10:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mtd/nand/spi/macronix.c:71:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |                 *eccsr = MACRONIX_ECCSR_BF_LAST_PAGE(*eccsr);
         |                          ^
   drivers/mtd/nand/spi/macronix.c:13:44: note: expanded from macro 'MACRONIX_ECCSR_BF_LAST_PAGE'
      13 | #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
         |                                            ^
   7 warnings and 1 error generated.


vim +/FIELD_GET +71 drivers/mtd/nand/spi/macronix.c

    53	
    54	static int macronix_get_eccsr(struct spinand_device *spinand, u8 *eccsr)
    55	{
    56		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(0x7c, 1),
    57						  SPI_MEM_OP_NO_ADDR,
    58						  SPI_MEM_OP_DUMMY(1, 1),
    59						  SPI_MEM_OP_DATA_IN(1, eccsr, 1));
    60	
    61		int ret = spi_mem_exec_op(spinand->spimem, &op);
    62		if (ret)
    63			return ret;
    64	
    65		/*
    66		 * ECCSR exposes the number of bitflips for the last read page in bits [3:0].
    67		 * Continuous read compatible chips also expose maximum number of
    68		 * bitflips for the whole read operation in bits [7:4].
    69		 */
    70		if (!spinand->set_cont_read)
  > 71			*eccsr = MACRONIX_ECCSR_BF_LAST_PAGE(*eccsr);
    72		else
    73			*eccsr = MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(*eccsr);
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
