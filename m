Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDF79DD;
	Mon,  1 Apr 2024 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711948205; cv=none; b=oGyrP8YskTVayGsQADYNb0T5U7LZUwWbhbyNj0kbSiSxEAAN+wew0lrA/6kg2oFVx6YSI9by3i6eQed20oiVk/heXKXETRPAav+zacJZvULAPIGZ1KnfJs88Jh6K8UILfD5JvTkydqTMooAPNgMfHr3KDPK7YSVsRd+c1mdhbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711948205; c=relaxed/simple;
	bh=IshQTZ+tx1Lce/2Zh8rLSzzN5qImmLm1VEDUVNA4zS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+Jj8Ak1jHRRYxtr32xoaPv954/GgGxIGKt3Ey8pz5rFAuisu+sLNV8NgfG4G0pSsds0uGvcJmG7HptOWoJHxnnCBPK0GOV13/MtTCrgcrmzyO+keA2EVc8DpGi/b6UwuslRChCGa7NzlrE8lKOMbJ7SUjC5JCuLoRnz95ZBerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtBE5iQC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtBE5iQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711948203; x=1743484203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IshQTZ+tx1Lce/2Zh8rLSzzN5qImmLm1VEDUVNA4zS0=;
  b=HtBE5iQCuljqb2bG5AVpsZQPJveheOQ1WHE0xYiTlWmx5VtghBEYV4t5
   mBJJFXAj4tpiG/kf0YEaGVbtntimQqkJQUPvUTD5ejCwojF+kKMaU4CxZ
   Mns5mE6mjQqcJc2vHGxwOdgxzd4uhpjCyYpREIRhvHWcX3CU5hFoK5QFw
   MQfrl8u9pFTnn1+ezMNEvYURId8jhf35PTapnWDiGTNfIcPkyyLKTMXkw
   YtyCmJhqi6pDbTmAK4hTq1V+txuZ+IvrATcDyFIQSs5oQiGzGZRGVlSiU
   DwsginhnILiuZHiU+yvgKU3tXAGTsFtaOdVjS8lrArywfG5m26gWJEoNZ
   Q==;
X-CSE-ConnectionGUID: M+fUpuGZSMSSFKSamQ/XLA==
X-CSE-MsgGUID: XHZinUVmRzGiOknvNOzJ+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7210216"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="7210216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 22:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17999656"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2024 22:10:00 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr9vi-000040-0r;
	Mon, 01 Apr 2024 05:09:58 +0000
Date: Mon, 1 Apr 2024 13:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master 23/30]
 drivers/scsi/aic94xx/aic94xx_init.c:940:38: warning: tentative array
 definition assumed to have one element
Message-ID: <202404011328.V44XQ9JX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   5e36d764b5dfcddd54895d9b6dc392eaaba17d6a
commit: 61d4f86ef0002b12ed52d2dc7a08c23b53798766 [23/30] Revert "scsi: libsas: Define NCQ Priority sysfs attributes for SATA devices"
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240401/202404011328.V44XQ9JX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404011328.V44XQ9JX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011328.V44XQ9JX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_init.c:12:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
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
   drivers/scsi/aic94xx/aic94xx_init.c:941:3: error: use of undeclared identifier 'sas_ata_sdev_attr_group'
     941 |         &sas_ata_sdev_attr_group,
         |          ^
>> drivers/scsi/aic94xx/aic94xx_init.c:940:38: warning: tentative array definition assumed to have one element
     940 | static const struct attribute_group *asd_sdev_groups[] = {
         |                                      ^
   6 warnings and 1 error generated.
--
   In file included from drivers/scsi/mvsas/mv_init.c:11:
   In file included from drivers/scsi/mvsas/mv_sas.h:19:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
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
   drivers/scsi/mvsas/mv_init.c:768:3: error: use of undeclared identifier 'sas_ata_sdev_attr_group'
     768 |         &sas_ata_sdev_attr_group,
         |          ^
>> drivers/scsi/mvsas/mv_init.c:767:38: warning: tentative array definition assumed to have one element
     767 | static const struct attribute_group *mvst_sdev_groups[] = {
         |                                      ^
   6 warnings and 1 error generated.


vim +940 drivers/scsi/aic94xx/aic94xx_init.c

2908d778ab3e24 James Bottomley 2006-08-29  939  
14cc341229fc11 Igor Pylypiv    2024-03-07 @940  static const struct attribute_group *asd_sdev_groups[] = {
14cc341229fc11 Igor Pylypiv    2024-03-07 @941  	&sas_ata_sdev_attr_group,
14cc341229fc11 Igor Pylypiv    2024-03-07  942  	NULL
14cc341229fc11 Igor Pylypiv    2024-03-07  943  };
14cc341229fc11 Igor Pylypiv    2024-03-07  944  

:::::: The code at line 940 was first introduced by commit
:::::: 14cc341229fc11657115481e5b5c214856c38724 scsi: aic94xx: Add libsas SATA sysfs attributes group

:::::: TO: Igor Pylypiv <ipylypiv@google.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
