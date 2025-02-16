Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE51A3140;
	Sun, 16 Feb 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739747530; cv=none; b=M4pYABzk11m6j+7MkCSrvVj1XS8TOGgmS+f4fXvILGWZ3NgLQqSuYT0L20ny+P/ZHpQdA7bzst0iGg3A4D/+CP07W01Raq1gu5IX/LTQlycyn79tMGy0mQ/9ZIPQYgcQSmoCHhRLamikWZli8atzEh7tVA21GMfWFivHsTE/C/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739747530; c=relaxed/simple;
	bh=+QVne+TK1t6nx+RR2yWQzh945FHeway6Ld1w4mFEZLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lg1eaAsNJQy6gA3/LJPR/2VRRWAlMiq/eKfiSZQ4EaaBWnnD9KLdDMEjV0XtHTc8CFWShiogh0bu5hE1LfjA7ZpSsOVhlDzN88qT8RV0BlQDtPf9yrkYz43FpThpdb5H3UN063pw0/rz6Rm8bnRJxqRR0JYbJpxLgyugxudkCmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+NU9ZMq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+NU9ZMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739747529; x=1771283529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+QVne+TK1t6nx+RR2yWQzh945FHeway6Ld1w4mFEZLY=;
  b=c+NU9ZMqLpa1yRxOcFssCcwg5wKKDW6V/lv9eCjY/jVCZaG+RcwqUEzb
   n7ZpPmpFszTb3k/47wLd12bU0cZ0L8zpunWHs6LmuaIw14ysLmBjYaLfe
   pDxbCyGyfqBN1UC2yRdaWaXgEYwfvnW4sasGZniW/UTp5sexZzkk0IiG5
   ud6FzcVWIfI/lj1uDK13NHMKgANgDzn6OO//UIdySEyDknZVQ7qNmqCz9
   8Ha4A/bG6whXHDRz6iSA1kURubbBitXclHYhPy5i6ZpgpjtUTr8sf5Fh1
   35sZ4VyPZ208GtH6s6fAVkxOjCT4GjvYgLBGfUBEiQ3nBKAjNbucHqGi7
   g==;
X-CSE-ConnectionGUID: NBSthkejReSX9AmKtCDBaw==
X-CSE-MsgGUID: j+34M0I2T5+6xnybjaxFvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="62893540"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="62893540"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 15:12:08 -0800
X-CSE-ConnectionGUID: MA+AfvqvT0yrOJQ2MD9oQA==
X-CSE-MsgGUID: O34E/vwJSF6uHeBlmr/8fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="114474097"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2025 15:12:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjnnv-001CMU-2m;
	Sun, 16 Feb 2025 23:12:03 +0000
Date: Mon, 17 Feb 2025 07:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Craviee <dcraviee@internships.antmicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gabriel Somlo <gsomlo@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 10/15]
 drivers/mtd/spi-nor/litex-spiflash.c:305:15: error: incompatible function
 pointer types initializing 'int (*)(struct spi_nor *, u8, const u8 *,
 size_t)' (aka 'int (*)(struct spi_nor *, unsigned char, const unsigned char
 *, unsigned long)') with an express...
Message-ID: <202502170711.tNK4CFp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   bfdc7246bec114e599ddb68ba442ce88172537ed
commit: 7cbcc8cd508400e5b564e23a122126a13096c2f7 [10/15] LiteX: driver for SPI Flash (mtd) device
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250217/202502170711.tNK4CFp1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170711.tNK4CFp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170711.tNK4CFp1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/litex-spiflash.c:23:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/litex-spiflash.c:305:15: error: incompatible function pointer types initializing 'int (*)(struct spi_nor *, u8, const u8 *, size_t)' (aka 'int (*)(struct spi_nor *, unsigned char, const unsigned char *, unsigned long)') with an expression of type 'ssize_t (struct spi_nor *, u8, const u8 *, size_t)' (aka 'long (struct spi_nor *, unsigned char, const unsigned char *, unsigned long)') [-Wincompatible-function-pointer-types]
     305 |         .write_reg = spi_flash_nor_write_reg,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +305 drivers/mtd/spi-nor/litex-spiflash.c

   300	
   301	static const struct spi_nor_controller_ops litex_spi_controller_ops = {
   302		.read = spi_flash_nor_read,
   303		.write = spi_flash_nor_write,
   304		.read_reg = spi_flash_nor_read_reg,
 > 305		.write_reg = spi_flash_nor_write_reg,
   306		.erase = spi_flash_nor_erase,
   307	};
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
