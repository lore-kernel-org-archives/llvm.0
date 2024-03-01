Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF31481A4;
	Fri,  1 Mar 2024 03:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709264708; cv=none; b=ONwyUDqNbjFe50M2wqntFId2A5LRzpqpq3UwfxOXc2qWxIkGbVoKaDW6Gjt4NLX+wI3yQVD7WLWDAmFTVc/eQ8Pa/KqUbQKsH11/HP/WIskUN6Nzyc1hLYg8gXHiga7OQpnnVCTi8T0kOkggI0r7bBKC/gltyk8UeeSsTTbrSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709264708; c=relaxed/simple;
	bh=BX8MyG1c5zNk/AhlZghBkxnfb+uK7DN+kLhpELpjKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xu7QWya4G/x2xkUgZR5BiESbvOKe/vdbgZuaRi6X3vG60okXjKHEqNDTrAj5i4/2bcC2owpwpoWrDK+GSmMOy5RwQOweOBZEnRAeKsg26Q6qij/JxuAhCitDRCN6q2hKUlnG5Xa1Z0xbRmVMGDCjfipZLPzL7MGsHPXHBHd2Y0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPYMQuJy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPYMQuJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709264706; x=1740800706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BX8MyG1c5zNk/AhlZghBkxnfb+uK7DN+kLhpELpjKjM=;
  b=bPYMQuJybm7DPuzkRuuvRzMgjoJwgrnSs9BnOsG7cQItNb/6J3bpQORN
   5RrXZx0IHGWe5hkIBlfwz7+ZsKzw/x9Gx5G1CczK5BKuP1BpqhRbn95IF
   jW7GlUHjCji0xF/JGdE5Ug0j+3m3jWQJWRxQfSZPGKujjj87gN97WAZ0H
   jC+kWBAyRuTh0t4KEsxe2yhsuzpEVNMVWLhdhGLbcx61NkfOCpT0QcBfx
   wb/w4dL7UzV9n6iej5ht7leqDEgCLpDBJLIT0ji8sorqPuMUDJsp75zGb
   pHyNLeSZe90jYCrZ0ZaaGAze/HK/HEUpWrQHWLwYDwqvfuGHYVh/4dfgk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="26247031"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="26247031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 19:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="38898753"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Feb 2024 19:45:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rftoI-000DVl-1b;
	Fri, 01 Mar 2024 03:44:12 +0000
Date: Fri, 1 Mar 2024 11:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 150/860]
 drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:46:9: error: call to
 undeclared function 'in_be32'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202403011130.LYz4858q-lkp@intel.com>
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
commit: 613e39d370ef73bc8bffb2c5bfc7e07f8b153d24 [150/860] staging: net: xilinx: add Xilinx TSN driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403011130.LYz4858q-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011130.LYz4858q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011130.LYz4858q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:22:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
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
>> drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:46:9: error: call to undeclared function 'in_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      46 |         nsec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_NS);
         |                ^
>> drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:58:2: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_H), 0);
         |         ^
   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:67:15: error: call to undeclared function 'in_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |         ts->tv_sec = in_be32(timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_L);
         |                      ^
   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:88:2: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         out_be32((timer->baseaddr + XTIMER1588_RTC_INCREMENT), incval);
         |         ^
   drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c:223:2: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     223 |         out_be32((timer->baseaddr + XTIMER1588_INTERRUPT),
         |         ^
   5 warnings and 5 errors generated.


vim +/in_be32 +46 drivers/staging/xilinx-tsn/xilinx_tsn_ptp_clock.c

    41	
    42	static void xlnx_tod_read(struct xlnx_ptp_timer *timer, struct timespec64 *ts)
    43	{
    44		u32 sec, nsec;
    45	
  > 46		nsec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_NS);
    47		sec = in_be32(timer->baseaddr + XTIMER1588_CURRENT_RTC_SEC_L);
    48	
    49		ts->tv_sec = sec;
    50		ts->tv_nsec = nsec;
    51	}
    52	
    53	static void xlnx_rtc_offset_write(struct xlnx_ptp_timer *timer,
    54					  const struct timespec64 *ts)
    55	{
    56		pr_debug("%s: sec: %lld nsec: %ld\n", __func__, ts->tv_sec, ts->tv_nsec);
    57	
  > 58		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_H), 0);
    59		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_SEC_L),
    60			 (ts->tv_sec));
    61		out_be32((timer->baseaddr + XTIMER1588_RTC_OFFSET_NS), ts->tv_nsec);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
