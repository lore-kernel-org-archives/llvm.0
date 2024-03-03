Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA187A707;
	Sun,  3 Mar 2024 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709500208; cv=none; b=KZwwTeJO5cCZDCCH/TnWZ6O+lNAy6GpuU86gWDL69c0Hbt8Vco+wSt0XPiPp72ou+uda+fBnk3iFkYcO6EKPlpbZb3PU/y5vA5p4UOxaY/XBmt754DlS6HkP893t3QhD3wL3n3exOG2ZeR5rRlVf/89PZnU+Xx367nHEMZbLXE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709500208; c=relaxed/simple;
	bh=l/5+AB+S6wvnL8daajqMoYUA/25TXtqAPAnXPbObwkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juNlxrHfVgLaugLA0TSzT1qL/QV9MOITQe+RjF5MwGPEra/J88+RDZ8Xi+eSs4ioOw7uQri0gB65LzWXe1elOYAIoxWD/WY39KVTYBLNEwFl6UvBVfUuzBPUHMUMxeOeJDcCTGQP1104OS6o4MVFbeMG0EJXwzFRGcKOVTucsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9cmZvQO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9cmZvQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709500206; x=1741036206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/5+AB+S6wvnL8daajqMoYUA/25TXtqAPAnXPbObwkI=;
  b=Y9cmZvQONSbRH5iDVrZFQFWf3qwCg+VO8b88UHG1xxuzp4HwG4SFWF39
   sqgQBAteilgDe/jRNldNTucukzT+Xuwzba4Owx8AZRJBX6v+yQLl6QfXW
   YfmUrZZaSgVR8m63rv/1TaHnIxCcNpEXgPJjPxsa+zWryjO7BEeINdOzK
   zYxoXkCsQVR9xetnLsXvSCFsQb4u0qYaXpcs6ajrmw9yfSS2R1nmXujx3
   8j80WkgrCuPXs7nm37Cfxe84FJY+LSMsaZ1SYiZIjMyA70BsR/CfIjty5
   VrnLCpwUsq9yPcB3N8xjrkiKD/O8IIPuh5LBVUQo7B32uN3AvvKQWMC0e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15388784"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="15388784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 13:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13345952"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 13:10:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgt5r-00026w-0q;
	Sun, 03 Mar 2024 21:09:59 +0000
Date: Mon, 4 Mar 2024 05:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 130/860] drivers/misc/xlnx_dpu.h:21:9:
 warning: 'in_range' macro redefined
Message-ID: <202403040526.fOfrSvgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 2d9cdbf45fbb41f9314bcf7bcae8a3c19de020c9 [130/860] misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040526.fOfrSvgW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040526.fOfrSvgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040526.fOfrSvgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/xlnx_dpu.c:22:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
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
   In file included from drivers/misc/xlnx_dpu.c:29:
>> drivers/misc/xlnx_dpu.h:21:9: warning: 'in_range' macro redefined [-Wmacro-redefined]
      21 | #define in_range(b, start, len) (               \
         |         ^
   include/linux/minmax.h:248:9: note: previous definition is here
     248 | #define in_range(val, start, len)                                       \
         |         ^
   6 warnings generated.


vim +/in_range +21 drivers/misc/xlnx_dpu.h

    20	
  > 21	#define in_range(b, start, len) (		\
    22	{						\
    23	typeof(b) b_ = (b);				\
    24	typeof(start) start_ = (start);			\
    25	((b_) >= (start_) && (b_) < (start_) + (len));	\
    26	}						\
    27	)
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
