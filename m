Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A94D8CF;
	Sat,  7 Sep 2024 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725714402; cv=none; b=VuXrWmOzE11EpugFyW1jKfzJP+Vj2nmN4c17ywwbokD8k+zoKfOMfnJDaGpHsGAp14Eio2VG4EEiJ0NQxUAR8weJp4+/4g4cn8F160yXz4a1hwQ7pH9sE7MffX1io2R1XAx4fRD0PH9sM7fbF7WfbMmwmH4tUO16OcG1VWnyvjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725714402; c=relaxed/simple;
	bh=rQlRmp6HbvtF37b57fT+LXWaUiIKXEnAr7GuCBeFPY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvqVnQLSIc/7edwDrbR/Oi0OgRwwgn6PaD2rKr9fcgx5nzNcoVv6Oj6a+tBO9nC4jIYFWg7Il7Uy9g6TSrSUZ198BId33cJ9ikaMPId9NotcCoyWOSEipfirTD7E0r3Kv1Qo9Lq3T/HolaNtKcqEdrUJSM7JV5BKFs4LOQS8SuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFGZb266; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFGZb266"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725714400; x=1757250400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rQlRmp6HbvtF37b57fT+LXWaUiIKXEnAr7GuCBeFPY8=;
  b=FFGZb2661Wz6uFUTwWoKPUBZnzwTwEpFg0ZX3+OzTHx+b99w4NXQgLNZ
   CHHoT0RoMHjX4ZAH2CtfzJMYcjz9x0iHbp6XTmD+C6Q9OpSzMD4g1+o2I
   fJq7iu24RTp4acUE6ZBe40nh3iJ3ggEbnRqIX3o0BggTCJJixN8bqq8XP
   cieClMsLkjwMd+V4RrkYZiwagvhMoT+4D7q31paYX1XOBb7A1++1ddheZ
   i+YYxBHCXWKLrqE07+7wOjl+D9nNMfMGV1dfnbJHp5U8E9+ez9wmn3ZNJ
   YtxEzqHqqzXIRc9fYBV45W9X+ylvQxHVD5+IcjgmbuiFMyLdic0Ta/E19
   Q==;
X-CSE-ConnectionGUID: G7Zcu2YkTUe6LiQVxk9Ggw==
X-CSE-MsgGUID: yrwMrznMR2iddhqVVtkJyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="41972440"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="41972440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 06:06:39 -0700
X-CSE-ConnectionGUID: wDmjefEyQliqK7F50xoSSg==
X-CSE-MsgGUID: XQgoQ2lMTOK5fbSpUtUDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66003156"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 06:06:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smv99-000CZ9-1V;
	Sat, 07 Sep 2024 13:06:35 +0000
Date: Sat, 7 Sep 2024 21:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 3/4] drivers/gpu/drm/xe/xe_pm.c:606:20: error:
 no member named 'runtime_status' in 'struct dev_pm_info'
Message-ID: <202409072129.eDonSRGW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   0c841e47d8d94bd0f5444a25052d86c0b1f2c2e8
commit: cb85e39dc5d1717fab82810984cce0e54712a3c2 [3/4] drm/xe: Suppress missing outer rpm protection warning
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409072129.eDonSRGW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072129.eDonSRGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072129.eDonSRGW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_pm.c:13:
   In file included from drivers/gpu/drm/xe/display/xe_display.h:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_pm.c:13:
   In file included from drivers/gpu/drm/xe/display/xe_display.h:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_pm.c:13:
   In file included from drivers/gpu/drm/xe/display/xe_display.h:9:
   In file included from drivers/gpu/drm/xe/xe_device.h:11:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/xe/xe_pm.c:606:20: error: no member named 'runtime_status' in 'struct dev_pm_info'
     606 |         return dev->power.runtime_status == RPM_SUSPENDING ||
         |                ~~~~~~~~~~ ^
   drivers/gpu/drm/xe/xe_pm.c:607:14: error: no member named 'runtime_status' in 'struct dev_pm_info'
     607 |                 dev->power.runtime_status == RPM_RESUMING;
         |                 ~~~~~~~~~~ ^
   17 warnings and 2 errors generated.


vim +606 drivers/gpu/drm/xe/xe_pm.c

   597	
   598	/*
   599	 * Very unreliable! Should only be used to suppress the false positive case
   600	 * in the missing outer rpm protection warning.
   601	 */
   602	static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
   603	{
   604		struct device *dev = xe->drm.dev;
   605	
 > 606		return dev->power.runtime_status == RPM_SUSPENDING ||
   607			dev->power.runtime_status == RPM_RESUMING;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
