Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5FB3128D2;
	Mon,  8 Dec 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765202073; cv=none; b=nTu6JP/IXD1j6Ebu0APkSZht6lBfbMvzPAIB/5RpSLO5sqzQAtxkGP8AQoiy+sfDQPA/wLHXQoZ41fXZ6QeUaGDZjl2P24aOfD4u7e4mmuT4OIcFassb1pM0Mk11U3tt94L38RROavLC40FiVk0wLgW9OlIo3TLZOUtTOUc/RXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765202073; c=relaxed/simple;
	bh=gpglD6pwxNu2akfLdmVhQJU7XaTR8DVY8V/sajvWksw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enW2CT3MtuYwJVQ2I/L3CROyHsB6JXrtWqIIEWpbOZStvEVMKhTw9Nu9eaTeeluFMMZPhAjiOcbCU0JMXz/VIBWbbf2NgzQI8O8FnHhUi2r0FXZugbdPYKNkv4tW/M/Xq8TqPMamqlJd65xbbCBaIWpUYmtIkmJp0w0XGC6kTdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYTQq14B; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYTQq14B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765202071; x=1796738071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gpglD6pwxNu2akfLdmVhQJU7XaTR8DVY8V/sajvWksw=;
  b=YYTQq14B+LIaaiu6yJCbflTKuEDxO/yhQXOmkehyD97tyErcPNivhqmW
   D8d+o8KNUAYDNtva5O2MXKyizDcfYwza6PATdgGE9ZWkdy+dWuLvkPt6C
   +WxoTcDZ442nceRPiOit9ed21MIqPK8a8kKvsagK/PtkMgogSZINzYkBJ
   JQljwSvMiMvwM6d6j0h0NSLNjnLP+3UoaD0hFqPshz84ommC5epzj7hdN
   CU9Z53socd/0xkd73DVBXDI+1WNcgpgYTntHynicv6dvRyEH0aVtpGpO7
   yTmXKqDkrr0G8fDGjlZI5js4IBGeTPmc23RYr53mY25SBEQaT+pFAqtXx
   w==;
X-CSE-ConnectionGUID: 4U0Q5xYNQOihao5a/pzm6w==
X-CSE-MsgGUID: lFZt/s7HRpmCCQUi2g2Lbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84548629"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84548629"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 05:54:31 -0800
X-CSE-ConnectionGUID: //x4GBVaTYiWensoVAbQhA==
X-CSE-MsgGUID: NwMv2bIYRbmaWx0JFUuaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200108361"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 05:54:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSbh3-000000000RR-3z8V;
	Mon, 08 Dec 2025 13:54:25 +0000
Date: Mon, 8 Dec 2025 21:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ahmed Naseef <naseefkm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Message-ID: <202512082140.yQUnjGPP-lkp@intel.com>
References: <20251207150923.86328-1-naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207150923.86328-1-naseefkm@gmail.com>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master next-20251208]
[cannot apply to v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Naseef/mtd-spinand-add-support-for-Dosilicon-DS35Q1GA-DS35M1GA/20251207-232019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20251207150923.86328-1-naseefkm%40gmail.com
patch subject: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251208/202512082140.yQUnjGPP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082140.yQUnjGPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082140.yQUnjGPP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/dosilicon.c:8:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/mtd/nand/spi/dosilicon.c:13:3: error: call to undeclared function 'SPINAND_PAGE_READ_FROM_CACHE_X4_OP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:14:3: error: call to undeclared function 'SPINAND_PAGE_READ_FROM_CACHE_X2_OP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:15:3: error: call to undeclared function 'SPINAND_PAGE_READ_FROM_CACHE_OP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: error: initializer element is not a compile-time constant
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: error: initializer element is not a compile-time constant
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:19:3: error: call to undeclared function 'SPINAND_PROG_LOAD_X4'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:20:3: error: call to undeclared function 'SPINAND_PROG_LOAD'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ^
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: error: initializer element is not a compile-time constant
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: error: initializer element is not a compile-time constant
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                 SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      24 |                 SPINAND_PROG_LOAD(false, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                 SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      24 |                 SPINAND_PROG_LOAD(false, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: error: initializer element is not a compile-time constant
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                 SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      24 |                 SPINAND_PROG_LOAD(false, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,


vim +/SPINAND_PAGE_READ_FROM_CACHE_X4_OP +13 drivers/mtd/nand/spi/dosilicon.c

   > 8	#include <linux/mtd/spinand.h>
     9	
    10	#define SPINAND_MFR_DOSILICON        0xE5
    11	
    12	static SPINAND_OP_VARIANTS(read_cache_variants,
  > 13			SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
  > 14			SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
  > 15			SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
    16			SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
    17	
    18	static SPINAND_OP_VARIANTS(write_cache_variants,
  > 19			SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
  > 20			SPINAND_PROG_LOAD(true, 0, NULL, 0));
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
