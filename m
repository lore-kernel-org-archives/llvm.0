Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642918EAB;
	Mon, 30 Sep 2024 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727718150; cv=none; b=bLCdjarxJZYrLb0I15nqLPUe0f3bO+6sV/CplV5AWya7FzAW4F+wndcy4YZSA1OM25NGHnK7Aqo0/WRmb57mn7pMByCOEQ5KgNXVsdfdHArXm9JROdYCHH9rOo2ogEZo1PHlQsLmJbRuEc/GPcuiXbYXS3U4F9cr3fDB4+UvV1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727718150; c=relaxed/simple;
	bh=8i39mrJs+42G1ttcqvEEIyRNszEvZG+PqqjsuLdM+eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAbNlt+N1IIv0wEkPLfAu0GSyQOl1MPgTu35jk1GH/uCpVInftLxaICZsN/N0wA6GPnMmvzpGQZXGwLsn3a/7o730+KvL1ue/7kuCnYGbd/iV2IMpOtqd5sl4/93o6IKCnf/B5JvcNQFa7WrM1IqoEsOzNDkA3yxCgTBKrTgano=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3758vJY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3758vJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727718149; x=1759254149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8i39mrJs+42G1ttcqvEEIyRNszEvZG+PqqjsuLdM+eM=;
  b=E3758vJYMY1t8jejpihUIdhF1HrkMPx8eXqELfas5r+kTtL4bWemWKtk
   V6c/0xMw0+sz8VdkUyRm2OVr5sjKH1UJujmguQDDPTHAojmH2+S1tRb6N
   FkA73UaUxf+i47xBmImaosvo3DRQrihXARfuvN7tLz6vuryFJk1/zlB2H
   EI9PQx44JUI+jXEefAkzxWz+wZ7screjcg6N4j1DXVj+SHmnrYrqUHUHm
   TkJD5da7/2sWiqIVtkCJgLm3wU7rm+iW4GnDb86k9gmVzXNP1/eB3M/Fn
   a5klQFqB2l1eXixd+UN3fg6gI74YSL6jpB1U7u1eLjqaLQtExyeXQNCos
   g==;
X-CSE-ConnectionGUID: wxATyhtTQI2V1X0HsH4gYA==
X-CSE-MsgGUID: O+ooE6QDTeSf1SjyCZ9kPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="29707781"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="29707781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 10:42:28 -0700
X-CSE-ConnectionGUID: jqaijE5ESQOrFOmuwAoDsA==
X-CSE-MsgGUID: aRDUDz2dSlSS6BhbFP1P3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="110873038"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 10:42:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svKPf-000Pjl-1L;
	Mon, 30 Sep 2024 17:42:23 +0000
Date: Tue, 1 Oct 2024 01:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mounik Katikala <mounik.katikala@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1076/1093]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:1435:18: error: call to
 '__compiletime_assert_702' declared with 'error' attribute: FIELD_GET: mask
 is not constant
Message-ID: <202410010102.Hw44Eaan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3c31f9d5fb29a99c43f59d424f7f717ee2177e14
commit: 4bb3a1e83a07aa7e02851f53298c1102fa37a28e [1076/1093] v4l: xilinx: isppipeline: Add support for Gain Control
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410010102.Hw44Eaan-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010102.Hw44Eaan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010102.Hw44Eaan-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/xilinx/xilinx-isppipeline.c:19:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:37:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2170:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/xilinx/xilinx-isppipeline.c:1435:18: error: call to '__compiletime_assert_702' declared with 'error' attribute: FIELD_GET: mask is not constant
    1435 |         bool en_index = XGET_BIT(index, xisp->module_en);
         |                         ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:153:36: note: expanded from macro 'XGET_BIT'
     153 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^
   include/linux/bitfield.h:154:3: note: expanded from macro 'FIELD_GET'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHECK'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:431:2: note: expanded from macro '_compiletime_assert'
     431 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:424:4: note: expanded from macro '__compiletime_assert'
     424 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:4:1: note: expanded from here
       4 | __compiletime_assert_702
         | ^
   5 warnings and 1 error generated.


vim +1435 drivers/media/platform/xilinx/xilinx-isppipeline.c

6ad036c40ec4b9 Kaushal Kumar   2023-01-18  1414  
116fbf86655bcc Mounik Katikala 2024-07-23  1415  /**
116fbf86655bcc Mounik Katikala 2024-07-23  1416   * xisp_create_controls - Creates V4L2 controls for the given xisp device
116fbf86655bcc Mounik Katikala 2024-07-23  1417   * @xisp: Pointer to the xisp_dev structure representing the device
116fbf86655bcc Mounik Katikala 2024-07-23  1418   * @index: Index of the module enable bit in xisp->module_en and xisp->module_bypass_en
116fbf86655bcc Mounik Katikala 2024-07-23  1419   * @ctrl_arr: Array of v4l2_ctrl_config structures representing the control configurations
116fbf86655bcc Mounik Katikala 2024-07-23  1420   * @size: Number of control configurations in the ctrl_arr array
116fbf86655bcc Mounik Katikala 2024-07-23  1421   *
116fbf86655bcc Mounik Katikala 2024-07-23  1422   * This function creates custom V4L2 controls for the specified xisp device.
116fbf86655bcc Mounik Katikala 2024-07-23  1423   * It checks whether the module is enabled and whether the module bypass is
116fbf86655bcc Mounik Katikala 2024-07-23  1424   * enabled before creating controls.
116fbf86655bcc Mounik Katikala 2024-07-23  1425   *
116fbf86655bcc Mounik Katikala 2024-07-23  1426   * The controls are created based on the configurations provided in the ctrl_arr array.
116fbf86655bcc Mounik Katikala 2024-07-23  1427   * If the module enable bit is set and the module bypass enable bit is set,
116fbf86655bcc Mounik Katikala 2024-07-23  1428   * it creates the first control from the array. If there are more controls
116fbf86655bcc Mounik Katikala 2024-07-23  1429   * (size > 1), it iterates through the remaining controls and creates them.
116fbf86655bcc Mounik Katikala 2024-07-23  1430   */
116fbf86655bcc Mounik Katikala 2024-07-23  1431  static void xisp_create_controls(struct xisp_dev *xisp, u32 index,
116fbf86655bcc Mounik Katikala 2024-07-23  1432  				 struct v4l2_ctrl_config *ctrl_arr, u32 size)
116fbf86655bcc Mounik Katikala 2024-07-23  1433  {
116fbf86655bcc Mounik Katikala 2024-07-23  1434  	int itr;
116fbf86655bcc Mounik Katikala 2024-07-23 @1435  	bool en_index = XGET_BIT(index, xisp->module_en);
116fbf86655bcc Mounik Katikala 2024-07-23  1436  	bool bypass_en_index = XGET_BIT(index, xisp->module_bypass_en);
116fbf86655bcc Mounik Katikala 2024-07-23  1437  
116fbf86655bcc Mounik Katikala 2024-07-23  1438  	if (!en_index)
116fbf86655bcc Mounik Katikala 2024-07-23  1439  		return;
116fbf86655bcc Mounik Katikala 2024-07-23  1440  
116fbf86655bcc Mounik Katikala 2024-07-23  1441  	if (bypass_en_index)
116fbf86655bcc Mounik Katikala 2024-07-23  1442  		v4l2_ctrl_new_custom(&xisp->ctrl_handler, &ctrl_arr[0], NULL);
116fbf86655bcc Mounik Katikala 2024-07-23  1443  
116fbf86655bcc Mounik Katikala 2024-07-23  1444  	if (size < 2)
116fbf86655bcc Mounik Katikala 2024-07-23  1445  		return;
116fbf86655bcc Mounik Katikala 2024-07-23  1446  
116fbf86655bcc Mounik Katikala 2024-07-23  1447  	for (itr = 1; itr < size; itr++)
116fbf86655bcc Mounik Katikala 2024-07-23  1448  		v4l2_ctrl_new_custom(&xisp->ctrl_handler, &ctrl_arr[itr], NULL);
116fbf86655bcc Mounik Katikala 2024-07-23  1449  }
116fbf86655bcc Mounik Katikala 2024-07-23  1450  

:::::: The code at line 1435 was first introduced by commit
:::::: 116fbf86655bcc669b416defceabf085291f4500 v4l: xilinx: isppipeline: Add support for AEC

:::::: TO: Mounik Katikala <mounik.katikala@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
