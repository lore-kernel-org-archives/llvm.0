Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFA1D63F5;
	Fri, 21 Feb 2025 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740110104; cv=none; b=YXwIoUxLE0sume8dcrobny+IhiEBkZr+O3MbYiNBYDWeShQyDrRy92yjmrjbi88mxSOpPRqpUrMWOewoiPoy6tCBVbS2rQxolAZZbZA/OH3SvWRLu42F2lml4dxYzc3eE7G9n92a6DFr+TNTFTcuR2oZZSA3ZaqqFh4/QIg10Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740110104; c=relaxed/simple;
	bh=EQaa21FF4GQ2Uk/EyOkgixVDvya7izCgu83IuLazTV0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FJR4xhcD/ABYN3V93d0XT8vUIfA0yJneTXAZae4v4S6tXuqVj7xArt9rLb8tVwsKXesKFDJT1PGgV4IEr5pkheA2YGyoR+K9WGtVZgHPpUqdpwAAJ/t5GawC0jq3+8cX6z5fcTjNDDEp8flfRo/Yp3dWGVJHpJ2DntiuMz6JwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ll4li00R; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ll4li00R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740110101; x=1771646101;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EQaa21FF4GQ2Uk/EyOkgixVDvya7izCgu83IuLazTV0=;
  b=ll4li00RaJEoSfC2qsLuvIO52fFjsN1Dwn9ddas3362NLdj25Uy7/iUY
   GI4Z2iwkeCd8xT87C+HKD3UDa78UjRyamQEu9obXhCLf82bAKWHyGufNq
   Jy5YjJl4AnId5G3knLdShuNzkM93w5eqSq5gxC4XpLZqRDC1X/xvvp9LG
   RFN54GF0Rqmvyr6tIIAk1OJyRPJ7y3Kak12AMxKAOYXHDv4VJPyTJKEq1
   qiNoDNAHNthBVlzzcaM5/WTqTsCjcfI1eSza86E9yVtbU8HsZspvPSKI8
   RtMogTI9LzYC/B3NagrknujvJ5wJBDBDzW9WyMdySdKtDKBQ6rvi2GJ4v
   A==;
X-CSE-ConnectionGUID: YS9SgOfAQOq6T8vYHFufaA==
X-CSE-MsgGUID: 1oACpaEgTryXATowhPa0rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43750229"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="43750229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 19:55:01 -0800
X-CSE-ConnectionGUID: kM+nQg2PQ1ShLEgKHTh7cQ==
X-CSE-MsgGUID: lsXt5r/sScK2vc0aSXOCIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="146118438"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Feb 2025 19:54:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlK7s-000554-2j;
	Fri, 21 Feb 2025 03:54:56 +0000
Date: Fri, 21 Feb 2025 11:54:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/char/applicom.c:131:25: warning: variable 'byte_reset_it'
 set but not used
Message-ID: <202502211149.4F4X173g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   334426094588f8179fe175a09ecc887ff0c75758
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   2 years, 10 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250221/202502211149.4F4X173g-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211149.4F4X173g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211149.4F4X173g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/applicom.c:32:
   In file included from include/linux/pci.h:1522:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1719:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/char/applicom.c:131:25: warning: variable 'byte_reset_it' set but not used [-Wunused-but-set-variable]
     131 |         volatile unsigned char byte_reset_it;
         |                                ^
>> drivers/char/applicom.c:540:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     540 |         int ret = 0;
         |             ^
   drivers/char/applicom.c:703:25: warning: variable 'byte_reset_it' set but not used [-Wunused-but-set-variable]
     703 |         volatile unsigned char byte_reset_it;
         |                                ^
   4 warnings generated.
--
   In file included from drivers/dma/dw-edma/dw-edma-v0-core.c:11:
   In file included from drivers/dma/dw-edma/dw-edma-core.h:13:
   In file included from include/linux/dma/edma.h:13:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1719:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/dma/dw-edma/dw-edma-v0-core.c:13:
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:37:4: warning: field sar within 'struct dw_edma_v0_ch_regs' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:31:2)' and is usually due to 'struct dw_edma_v0_ch_regs' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      37 |         } sar;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:44:4: warning: field dar within 'struct dw_edma_v0_ch_regs' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:38:2)' and is usually due to 'struct dw_edma_v0_ch_regs' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      44 |         } dar;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:51:4: warning: field llp within 'struct dw_edma_v0_ch_regs' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:45:2)' and is usually due to 'struct dw_edma_v0_ch_regs' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      51 |         } llp;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:172:4: warning: field rd_err_status within 'struct dw_edma_v0_regs' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:166:2)' and is usually due to 'struct dw_edma_v0_regs' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     172 |         } rd_err_status;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:182:4: warning: field rd_done_imwr within 'struct dw_edma_v0_regs' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:176:2)' and is usually due to 'struct dw_edma_v0_regs' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     182 |         } rd_done_imwr;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:189:4: warning: field rd_abort_imwr within 'struct dw_edma_v0_regs' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:183:2)' and is usually due to 'struct dw_edma_v0_regs' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     189 |         } rd_abort_imwr;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:71:4: warning: field wr_engine_hshake_cnt within 'struct dw_edma_v0_unroll' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:65:2)' and is usually due to 'struct dw_edma_v0_unroll' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      71 |         } wr_engine_hshake_cnt;
         |           ^
>> drivers/dma/dw-edma/dw-edma-v0-regs.h:79:4: warning: field rd_engine_hshake_cnt within 'struct dw_edma_v0_unroll' is less aligned than 'union (unnamed union at drivers/dma/dw-edma/dw-edma-v0-regs.h:73:2)' and is usually due to 'struct dw_edma_v0_unroll' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      79 |         } rd_engine_hshake_cnt;
         |           ^
   9 warnings generated.
--
   In file included from drivers/gpu/drm/radeon/radeon_drv.c:36:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1719:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:3:60: note: expanded from macro 'radeon_PCI_IDS'
       3 |         {0x1002, 0x1304, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:4:60: note: expanded from macro 'radeon_PCI_IDS'
       4 |         {0x1002, 0x1305, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:5:60: note: expanded from macro 'radeon_PCI_IDS'
       5 |         {0x1002, 0x1306, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:6:60: note: expanded from macro 'radeon_PCI_IDS'
       6 |         {0x1002, 0x1307, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:7:60: note: expanded from macro 'radeon_PCI_IDS'
       7 |         {0x1002, 0x1309, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:8:60: note: expanded from macro 'radeon_PCI_IDS'
       8 |         {0x1002, 0x130A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:9:60: note: expanded from macro 'radeon_PCI_IDS'
       9 |         {0x1002, 0x130B, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:10:60: note: expanded from macro 'radeon_PCI_IDS'
      10 |         {0x1002, 0x130C, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:11:60: note: expanded from macro 'radeon_PCI_IDS'
      11 |         {0x1002, 0x130D, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:12:60: note: expanded from macro 'radeon_PCI_IDS'
      12 |         {0x1002, 0x130E, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:13:60: note: expanded from macro 'radeon_PCI_IDS'
      13 |         {0x1002, 0x130F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:14:60: note: expanded from macro 'radeon_PCI_IDS'
      14 |         {0x1002, 0x1310, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:15:60: note: expanded from macro 'radeon_PCI_IDS'
      15 |         {0x1002, 0x1311, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:16:60: note: expanded from macro 'radeon_PCI_IDS'
      16 |         {0x1002, 0x1312, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:17:60: note: expanded from macro 'radeon_PCI_IDS'
      17 |         {0x1002, 0x1313, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:18:60: note: expanded from macro 'radeon_PCI_IDS'
      18 |         {0x1002, 0x1315, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:19:60: note: expanded from macro 'radeon_PCI_IDS'
      19 |         {0x1002, 0x1316, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:20:60: note: expanded from macro 'radeon_PCI_IDS'
      20 |         {0x1002, 0x1317, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:21:60: note: expanded from macro 'radeon_PCI_IDS'
      21 |         {0x1002, 0x1318, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:22:60: note: expanded from macro 'radeon_PCI_IDS'
      22 |         {0x1002, 0x131B, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:23:60: note: expanded from macro 'radeon_PCI_IDS'
      23 |         {0x1002, 0x131C, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:24:60: note: expanded from macro 'radeon_PCI_IDS'
      24 |         {0x1002, 0x131D, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:25:59: note: expanded from macro 'radeon_PCI_IDS'
      25 |         {0x1002, 0x3150, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_IS_MOBILITY}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:26:59: note: expanded from macro 'radeon_PCI_IDS'
      26 |         {0x1002, 0x3151, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:27:59: note: expanded from macro 'radeon_PCI_IDS'
      27 |         {0x1002, 0x3152, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:28:59: note: expanded from macro 'radeon_PCI_IDS'
      28 |         {0x1002, 0x3154, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:29:59: note: expanded from macro 'radeon_PCI_IDS'
      29 |         {0x1002, 0x3155, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:30:59: note: expanded from macro 'radeon_PCI_IDS'
      30 |         {0x1002, 0x3E50, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_NEW_MEMMAP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:31:59: note: expanded from macro 'radeon_PCI_IDS'
      31 |         {0x1002, 0x3E54, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RV380|RADEON_NEW_MEMMAP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:32:59: note: expanded from macro 'radeon_PCI_IDS'
      32 |         {0x1002, 0x4136, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RS100|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:33:59: note: expanded from macro 'radeon_PCI_IDS'
      33 |         {0x1002, 0x4137, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RS200|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:49:59: note: expanded from macro 'radeon_PCI_IDS'
      49 |         {0x1002, 0x4237, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RS200|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:51:59: note: expanded from macro 'radeon_PCI_IDS'
      51 |         {0x1002, 0x4336, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RS100|RADEON_IS_IGP|RADEON_IS_MOBILITY}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:52:59: note: expanded from macro 'radeon_PCI_IDS'
      52 |         {0x1002, 0x4337, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RS200|RADEON_IS_IGP|RADEON_IS_MOBILITY}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:53:59: note: expanded from macro 'radeon_PCI_IDS'
      53 |         {0x1002, 0x4437, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_RS200|RADEON_IS_IGP|RADEON_IS_MOBILITY}, \
         |                                                        ~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:284:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     284 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:56:58: note: expanded from macro 'radeon_PCI_IDS'
      56 |         {0x1002, 0x4A48, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_R420|RADEON_NEW_MEMMAP}, \
--
>> drivers/ntb/msi.c:33: warning: Function parameter or struct member 'desc_changed' not described in 'ntb_msi_init'
--
   In file included from drivers/rapidio/rio_cm.c:12:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1719:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/rapidio/rio_cm.c:673:7: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     673 |                 int rc;
         |                     ^
   2 warnings generated.
--
>> drivers/remoteproc/da8xx_remoteproc.c:77: warning: Function parameter or struct member 'dsp_reset' not described in 'da8xx_rproc'
>> drivers/remoteproc/da8xx_remoteproc.c:86: warning: Function parameter or struct member 'irq' not described in 'handle_event'
>> drivers/remoteproc/da8xx_remoteproc.c:86: warning: Function parameter or struct member 'p' not described in 'handle_event'
>> drivers/remoteproc/da8xx_remoteproc.c:106: warning: Function parameter or struct member 'irq' not described in 'da8xx_rproc_callback'
>> drivers/remoteproc/da8xx_remoteproc.c:106: warning: Function parameter or struct member 'p' not described in 'da8xx_rproc_callback'
..


vim +/byte_reset_it +131 drivers/char/applicom.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  127  
^1da177e4c3f41 Linus Torvalds  2005-04-16  128  static int ac_register_board(unsigned long physloc, void __iomem *loc, 
^1da177e4c3f41 Linus Torvalds  2005-04-16  129  		      unsigned char boardno)
^1da177e4c3f41 Linus Torvalds  2005-04-16  130  {
^1da177e4c3f41 Linus Torvalds  2005-04-16 @131  	volatile unsigned char byte_reset_it;
^1da177e4c3f41 Linus Torvalds  2005-04-16  132  
^1da177e4c3f41 Linus Torvalds  2005-04-16  133  	if((readb(loc + CONF_END_TEST)     != 0x00) ||
^1da177e4c3f41 Linus Torvalds  2005-04-16  134  	   (readb(loc + CONF_END_TEST + 1) != 0x55) ||
^1da177e4c3f41 Linus Torvalds  2005-04-16  135  	   (readb(loc + CONF_END_TEST + 2) != 0xAA) ||
^1da177e4c3f41 Linus Torvalds  2005-04-16  136  	   (readb(loc + CONF_END_TEST + 3) != 0xFF))
^1da177e4c3f41 Linus Torvalds  2005-04-16  137  		return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  138  
^1da177e4c3f41 Linus Torvalds  2005-04-16  139  	if (!boardno)
^1da177e4c3f41 Linus Torvalds  2005-04-16  140  		boardno = readb(loc + NUMCARD_OWNER_TO_PC);
^1da177e4c3f41 Linus Torvalds  2005-04-16  141  
e60b6e2f747e94 Eric Sesterhenn 2006-04-10  142  	if (!boardno || boardno > MAX_BOARD) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  143  		printk(KERN_WARNING "Board #%d (at 0x%lx) is out of range (1 <= x <= %d).\n",
^1da177e4c3f41 Linus Torvalds  2005-04-16  144  		       boardno, physloc, MAX_BOARD);
^1da177e4c3f41 Linus Torvalds  2005-04-16  145  		return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  146  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  147  
^1da177e4c3f41 Linus Torvalds  2005-04-16  148  	if (apbs[boardno - 1].RamIO) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  149  		printk(KERN_WARNING "Board #%d (at 0x%lx) conflicts with previous board #%d (at 0x%lx)\n", 
^1da177e4c3f41 Linus Torvalds  2005-04-16  150  		       boardno, physloc, boardno, apbs[boardno-1].PhysIO);
^1da177e4c3f41 Linus Torvalds  2005-04-16  151  		return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  152  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  153  
^1da177e4c3f41 Linus Torvalds  2005-04-16  154  	boardno--;
^1da177e4c3f41 Linus Torvalds  2005-04-16  155  
^1da177e4c3f41 Linus Torvalds  2005-04-16  156  	apbs[boardno].PhysIO = physloc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  157  	apbs[boardno].RamIO = loc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  158  	init_waitqueue_head(&apbs[boardno].FlagSleepSend);
^1da177e4c3f41 Linus Torvalds  2005-04-16  159  	spin_lock_init(&apbs[boardno].mutex);
^1da177e4c3f41 Linus Torvalds  2005-04-16  160  	byte_reset_it = readb(loc + RAM_IT_TO_PC);
^1da177e4c3f41 Linus Torvalds  2005-04-16  161  
^1da177e4c3f41 Linus Torvalds  2005-04-16  162  	numboards++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  163  	return boardno + 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  164  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  165  

:::::: The code at line 131 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
