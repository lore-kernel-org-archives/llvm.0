Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF27B3FC7;
	Sat, 23 Nov 2024 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732334645; cv=none; b=IM0cus5Dm5kdSs2CONcpgIpl1QpTtC+wkQ0Wk/DNor+U/gW+IC6HSfLkb48Iz0Nt3WUerq/NAJQAVb6ZcLz8fhv5UqfJeHPqs4VknLrSanrxfM+D74XbJZpXqOfPWEg0ausi0IBynpaqmgizGPRIxdwaTxxYQvqBsl6Tb2htXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732334645; c=relaxed/simple;
	bh=ffDkqdw5KB4eDgFD4Qp4N+qP82icDtdZkbtpSa8R5sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNZKNcvC6CyNw4sJYw61WQVaoSXY+aHBK3ytRLDy50vx9eRTP6oDTs7upzJs8ML4/Vr8pDXrJrwq8PQuUh+cUCRDw5hCsrjvUz7yu/YT4D5aRpcZL6sTfjn3SaNM4XmNYMpkwmEUaq4R7Qg0LLfALF07MkWNekd01q1U2X5XMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddeEOLBD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddeEOLBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732334644; x=1763870644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ffDkqdw5KB4eDgFD4Qp4N+qP82icDtdZkbtpSa8R5sU=;
  b=ddeEOLBDRAzZmF6jF2HlAg3g+uDlxKqmWVV1sf6DB91zB3d1K6OyLP8D
   A3hs79Er8FdrcNYCz0+hiuYQ+Zf6nibkL6YvO3iyeLzzw+hPpblte//SS
   nXeZJrPbxM9DFrlirh4QgjdIL7yAUVsnEBO90ZILPaPfh6prxgzIST7E3
   VeThOZaz8g022KFoDCrJfF2r1M9M/n4pUrCzOE+sYpr4qgv8q9/cb3eD0
   WNcrLohk9AYHiHqnNkzSnQH9u3Oxr+gPYm3L7cCqO1JsVvlQjozNrrsTl
   5cgq11wbojs6z3xBXYre1hd5f6be2m/ygEluEUiieYTsvd2fm+CxScSSv
   Q==;
X-CSE-ConnectionGUID: RTQc7RvLS8uKxqGwDZF4FQ==
X-CSE-MsgGUID: VHUSPptpT2SeHOqAcZmSFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35355690"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="35355690"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:04:03 -0800
X-CSE-ConnectionGUID: Hep0sRk7Q/iP9/CznQMcrA==
X-CSE-MsgGUID: vBfjifV4ThaQLHVeFYITeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90669196"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 20:04:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhNH-0004PX-37;
	Sat, 23 Nov 2024 04:03:59 +0000
Date: Sat, 23 Nov 2024 12:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 29/161]
 drivers/mtd/spi-nor/sysfs.c:107:15: error: initializing 'struct
 bin_attribute **' with an expression of type 'const struct bin_attribute
 *const[2]' discards qualifiers in nested pointer types
Message-ID: <202411231209.VpQMD7DH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   4c594559fc90f22903c98c95389c0c3d4c8151b4
commit: bf68ea73c14091cb782938f595dcb401b879e3c8 [29/161] mtd
config: x86_64-randconfig-004-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231209.VpQMD7DH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231209.VpQMD7DH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231209.VpQMD7DH-lkp@intel.com/

Note: the thomas-weissschuh/b4/b4-sysfs-const-bin_attr-cb HEAD 4c594559fc90f22903c98c95389c0c3d4c8151b4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/sysfs.c:3:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/sysfs.c:107:15: error: initializing 'struct bin_attribute **' with an expression of type 'const struct bin_attribute *const[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     107 |         .bin_attrs      = spi_nor_sysfs_bin_entries,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +107 drivers/mtd/spi-nor/sysfs.c

36ac0228626585 Michael Walle 2021-05-03  101  
36ac0228626585 Michael Walle 2021-05-03  102  static const struct attribute_group spi_nor_sysfs_group = {
36ac0228626585 Michael Walle 2021-05-03  103  	.name		= "spi-nor",
7d388551b6888f Michael Walle 2022-08-11  104  	.is_visible	= spi_nor_sysfs_is_visible,
36ac0228626585 Michael Walle 2021-05-03  105  	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
36ac0228626585 Michael Walle 2021-05-03  106  	.attrs		= spi_nor_sysfs_entries,
36ac0228626585 Michael Walle 2021-05-03 @107  	.bin_attrs	= spi_nor_sysfs_bin_entries,
36ac0228626585 Michael Walle 2021-05-03  108  };
36ac0228626585 Michael Walle 2021-05-03  109  

:::::: The code at line 107 was first introduced by commit
:::::: 36ac0228626585ba718186b9db2e5986a198152c mtd: spi-nor: add initial sysfs support

:::::: TO: Michael Walle <michael@walle.cc>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
