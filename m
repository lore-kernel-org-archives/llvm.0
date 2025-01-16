Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EDA29A1;
	Thu, 16 Jan 2025 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737006073; cv=none; b=sIuNWf1BMrJakJVpSQ+1xb9Bc8MggaXKYnoxrimwp0oxoQcfM1wpjj6LgdTGxV7eqeW3XAGo7S61doPR6ETvPw/t6sQ5tFc7RWrWRRV3v/nOK69OCYuN4YJlqCYGCO0xdBk5CHBi8tjTLWhe69zmRNUH4fXqT9hDYyLH2it7LIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737006073; c=relaxed/simple;
	bh=0tltM7l3W/yoZHGxcsIW4HFWcAIKLKtrc/uxVF0LPzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INi3kx2IJSHW7d5aTZ2EsnPPAFDKcPDit31rh8hPeyHjjIQ65eWe52cp2iWG5HpIQ9Lj1ecCK6h7PL0NRO9qvSyoFw8JaMFR1tlE/AAXG9URj7y3AA7IU5CkRyduklKPimcJaM0/R9l4kfc0E20dMnAVoV3NdmTe2ymwUVosAbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muuU8GgG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muuU8GgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737006071; x=1768542071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0tltM7l3W/yoZHGxcsIW4HFWcAIKLKtrc/uxVF0LPzw=;
  b=muuU8GgGvtx6fUlxF8y+l1aepEemKcuOK5ZEKb2mpUSUmqjyb3OgBQOC
   BmyHp9+v3w/NTQVQgmsCfqUwqAyMRltpipNPvxrgcUVuBCvG+baI/C/du
   S0ZcdICml5JzA3LXdcm6jaNuFwIn8e062e1zRF758jIsF1eYeHLdfvZBR
   /2O0NRZH5xnTCnYjSUmwUMXQ+RIoroSUwTnMzsiaAO3GN0gQH7PDqFYdf
   nFCBB2FUvpmO/Nna11XNurWALpkUu2M18/48Mt3shyjM1EdJ8cZrhiurJ
   WGbVhiDgkkedIGxrUzoGVPI0MZgrqlN2uc4XDD6cs2qiFIFPypa6kCek5
   Q==;
X-CSE-ConnectionGUID: ij/6ZJxkQdW5FG7Wj6+vAQ==
X-CSE-MsgGUID: E7Af6d6JTZ+n0rulHPc/mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37606642"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="37606642"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 21:41:11 -0800
X-CSE-ConnectionGUID: K/31n4ZmTsyTO6xIMhdUgg==
X-CSE-MsgGUID: O9NoRILiQ3quu948OMVPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="105413547"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Jan 2025 21:41:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYIct-000RRL-0N;
	Thu, 16 Jan 2025 05:41:07 +0000
Date: Thu, 16 Jan 2025 13:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mtd:nand/next 4/9] drivers/mtd/nand/spi/skyhigh.c:24:47: error:
 incompatible pointer to integer conversion initializing 'unsigned int' with
 an expression of type 'void *'
Message-ID: <202501161302.bQqBGjJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   be7a05db4252edbffb43484b14755048fb8db710
commit: 7ce0d16d5802bfde4209e52ee8ad644ca1eab423 [4/9] mtd: spinand: Add an optional frequency to read from cache macros
config: i386-buildonly-randconfig-002-20250116 (https://download.01.org/0day-ci/archive/20250116/202501161302.bQqBGjJ5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501161302.bQqBGjJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501161302.bQqBGjJ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/nand/spi/skyhigh.c:24:47: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'void *' [-Wint-conversion]
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/mtd/spinand.h:69:25: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                       ^~~
   include/linux/spi/spi-mem.h:67:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      67 |                 .nbytes = __nbytes,                             \
         |                           ^~~~~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:307:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/skyhigh.c:24:44: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                          ^
   include/linux/mtd/spinand.h:69:30: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                            ^~~
   include/linux/spi/spi-mem.h:68:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      68 |                 .buf.in = __buf,                                \
         |                           ^~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:307:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:48: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'void *' [-Wint-conversion]
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                              ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/mtd/spinand.h:69:25: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                       ^~~
   include/linux/spi/spi-mem.h:67:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      67 |                 .nbytes = __nbytes,                             \
         |                           ^~~~~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:307:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:45: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                           ^
   include/linux/mtd/spinand.h:69:30: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                            ^~~
   include/linux/spi/spi-mem.h:68:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      68 |                 .buf.in = __buf,                                \
         |                           ^~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:307:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/skyhigh.c:24:47: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'void *' [-Wint-conversion]
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/mtd/spinand.h:69:25: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                       ^~~
   include/linux/spi/spi-mem.h:67:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      67 |                 .nbytes = __nbytes,                             \
         |                           ^~~~~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:308:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/skyhigh.c:24:44: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                          ^
   include/linux/mtd/spinand.h:69:30: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                            ^~~
   include/linux/spi/spi-mem.h:68:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      68 |                 .buf.in = __buf,                                \
         |                           ^~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:308:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:48: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'void *' [-Wint-conversion]
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                              ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/mtd/spinand.h:69:25: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                       ^~~
   include/linux/spi/spi-mem.h:67:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      67 |                 .nbytes = __nbytes,                             \
         |                           ^~~~~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:308:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:45: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                           ^
   include/linux/mtd/spinand.h:69:30: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                            ^~~
   include/linux/spi/spi-mem.h:68:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      68 |                 .buf.in = __buf,                                \
         |                           ^~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:308:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   8 errors generated.


vim +24 drivers/mtd/nand/spi/skyhigh.c

1a50e3612de918 Takahiro Kuwano 2024-12-03  18  
1a50e3612de918 Takahiro Kuwano 2024-12-03  19  static SPINAND_OP_VARIANTS(read_cache_variants,
1a50e3612de918 Takahiro Kuwano 2024-12-03  20  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
1a50e3612de918 Takahiro Kuwano 2024-12-03  21  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
1a50e3612de918 Takahiro Kuwano 2024-12-03  22  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
1a50e3612de918 Takahiro Kuwano 2024-12-03  23  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
1a50e3612de918 Takahiro Kuwano 2024-12-03 @24  		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
1a50e3612de918 Takahiro Kuwano 2024-12-03  25  		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
1a50e3612de918 Takahiro Kuwano 2024-12-03  26  

:::::: The code at line 24 was first introduced by commit
:::::: 1a50e3612de9187857f55ee14a573f7f8e7d4ebc mtd: spinand: Add support for SkyHigh S35ML-3 family

:::::: TO: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
