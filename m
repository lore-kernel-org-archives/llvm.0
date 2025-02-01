Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B725761;
	Sat,  1 Feb 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738404410; cv=none; b=O1bCnsn4ynuSIY6Fr7H7roTDmX8BQKzrClkenEJ/UThWtaAeFAJ+ioenZSJ2hAWLPqQ9AfwpG3Tdqys8XQQ2dgCIDLtG2dqnxZiabFMESFzzJNDgBW+QigBMQe2mfUGR6ERwtQmezin0fJGV2nr5LwRsYpZBvTgo97k4R6Ygnr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738404410; c=relaxed/simple;
	bh=YLDQeiwHjg5emqBmHRYATHZzZNx0PCX9CNimZfe9Mqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KN3tsXwERrJQAkvw3kQfpy/ybBAWc5sdk5rdcIx9Ltk9/RuIRbfCv+WC56G29ng+DTDQsIii+LaXIRfi/OG17F4xmq7T14X1lkhXCrYuV5DH8uCIf7+iU0ue7mcGKfqF57XZMrBV1DEN+KBmBUL0ijjKf0Q0JjfFfZJp7Zt8QH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeWrE7WW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeWrE7WW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738404408; x=1769940408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLDQeiwHjg5emqBmHRYATHZzZNx0PCX9CNimZfe9Mqg=;
  b=aeWrE7WWmCenKhbVtICq/Znev8IVpood6UrXu7llpwhYOQcn3d1b1LTG
   jpv1nqQLUQyh9s52tfdxzJxkApT0e0OFbmJdn0ErCG783f/q++OzmxD9V
   8lIBBhUBt8uqtQnOFnWNIHHicJO8QKy8AIJxquJMrd4HS3XEhxoKBxfpD
   EpB6oqktA0UFkqokKCihiGPwGY6PdGSvi0s7WXfwijSqS7jdSenCaeNwH
   eI7JiM5kVZqxBP7ZBYUOQfFsSB1YrHsZgIRSJfeAUeSgMpQUiWB1sI8St
   E+g0AaavMp4D/exMJnCz1jUah4xrq+SGTXRmbBtWTMDceF2STx1RsZdTA
   g==;
X-CSE-ConnectionGUID: XZ8zJZ2hS3yeHxz9BYGJCw==
X-CSE-MsgGUID: wqYRJWnrR2iDY3V6L/Ah7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50350363"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="50350363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 02:06:47 -0800
X-CSE-ConnectionGUID: gA+7H1rAR7anT+liz1WYsw==
X-CSE-MsgGUID: HjtTacp2Sg2q8/HG+byk4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="110415766"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 02:06:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teAOh-000nzY-1f;
	Sat, 01 Feb 2025 10:06:43 +0000
Date: Sat, 1 Feb 2025 18:06:16 +0800
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
Message-ID: <202502011735.bkOUcCe6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   d063b9bfd84d4ae32eaa664cd7b8906d1e5a4265
commit: 3d002d5d735d84642819be0fbf1ae715f4b1aac4 [10/15] LiteX: driver for SPI Flash (mtd) device
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250201/202502011735.bkOUcCe6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011735.bkOUcCe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011735.bkOUcCe6-lkp@intel.com/

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
