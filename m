Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB301078B;
	Thu, 30 May 2024 03:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717039503; cv=none; b=WH1nnops1Y4UT2XUW+PvSdSH/rBkktmKp1CKL+4a3n+OjZcsvxTRWa7hwpGD5tA/5DH8UvJkbNLYlQwiK6FgQ/0hmgZs3s5aQMb1PnO3p3ruJ0ZteOZBosZD+cL73ZbywRszPWdlte6od9P1Ohlp1ADl5r1zpVpb0rAW9jQPdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717039503; c=relaxed/simple;
	bh=BXWpcZrHsVl93wtpU+FqcWX8k9srOBC3ogxZJPcHGIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdBrV7F7+XzVA+E8omrfy1x8aNPC3uzF+mBAEJ4DQ8sQyqhN3NdQh7J5oZZrgbV+kaC/Ryn+iFdWJ32t/FtiROSw/d57rbEVnYRZpU8ziV10Wfm8ptavbX9GrubmbqcH/GII56hh+Srijolc3XXK9f03fJ0axzmXXaL5Fj/joa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnPF+R/T; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnPF+R/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717039502; x=1748575502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXWpcZrHsVl93wtpU+FqcWX8k9srOBC3ogxZJPcHGIw=;
  b=SnPF+R/TL6Yw8EHTinoPLYnkKWr1z2qJoNvnBbPi4n+dXzoxxf1ba3JE
   E8TcM1cqMJUA+zRrmeoruMPRa7137thFIN3Y4W7Xf0KRG6oVJ7nWpR5ea
   oFlqcwqGv0HEgqag5aKcHlPK5EIhmpI11OJD3ME2IT1vFsufvaFEr/EDv
   mmsiUc3PLgc5bGrVqvBqfMw/2iq34ohnY9ICHVHoSvulVgD97tvPP5Whw
   D9ILT5akOGBkUg/25d/+k22brSXbaz8+gsonnC94issBF2n9vajfbeksA
   gA6OyZdTTSyyuq1CNHOC+KrhBqDbo/06j9K62rkhq8B9+mZ5zrtgHmTrE
   g==;
X-CSE-ConnectionGUID: SIQ48oi2SCiOhVPQzcjhsQ==
X-CSE-MsgGUID: /eXvAYzWQEWt6qYNmtFPEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13338917"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13338917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 20:25:01 -0700
X-CSE-ConnectionGUID: E3TYcBt1SHygKGyHqUuqPA==
X-CSE-MsgGUID: 9CaZWdDpRIe9C12TU1rHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40124650"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2024 20:24:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCWPP-000EWn-1j;
	Thu, 30 May 2024 03:24:55 +0000
Date: Thu, 30 May 2024 11:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 27/27] drivers/base/node.c:37:27: error:
 invalid operands to binary expression ('const struct bus_type *' and 'const
 struct bus_type')
Message-ID: <202405301106.nsgBBh4d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   6a39e6660e65ae3609a0114b7a5f458cbc5b3602
commit: 6a39e6660e65ae3609a0114b7a5f458cbc5b3602 [27/27] memory-node-dbg
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240530/202405301106.nsgBBh4d-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301106.nsgBBh4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301106.nsgBBh4d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/node.c:6:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
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
>> drivers/base/node.c:37:27: error: invalid operands to binary expression ('const struct bus_type *' and 'const struct bus_type')
      37 |         WARN_ON_ONCE(device->bus != node_subsys);
         |                      ~~~~~~~~~~~ ^  ~~~~~~~~~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   5 warnings and 1 error generated.


vim +37 drivers/base/node.c

    34	
    35	struct node *to_node(struct device *device)
    36	{
  > 37		WARN_ON_ONCE(device->bus != node_subsys);
    38	
    39		return container_of(device, struct node, dev);
    40	}
    41	EXPORT_SYMBOL_GPL(to_node);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
