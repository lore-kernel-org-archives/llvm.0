Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A091EB48;
	Mon, 18 Nov 2024 04:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731904880; cv=none; b=t5zsX3y+B+oAIUh6oeyBtJdmiIsXCcEWuxK0xgUr007ZLlRR0k8vjq3Dtm1ujmm4YmEahvF2xdj/lROHaxOG/vXlFCy5s0Zzx7vNeYsl28vjPA4oKRS4wUkYYXbjv0zJz2vm1AIm8ZpQT5am0L5uOwSkpVqS82umcmEzJ6kUBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731904880; c=relaxed/simple;
	bh=8cBvq0xht7SRG3b/5AVPYAxbezXr3pyYxYtI3pGmULQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHwCccF2a8fx+v0pI9Q/c+rOnJODroVBXXE7CUAhEktuSD7CvIcUW4PSEhVjveZbXPh5wnC3AnhlgVYf5hmLLwTxGeruYzAML4Fq1CRWogWo7rMsxr1YbPULudo2ltSFT6d0fHm2TzuhJQvQeg0HQ3mzm0QI67VuEFd+m8sFdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HppSeBwi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HppSeBwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731904878; x=1763440878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cBvq0xht7SRG3b/5AVPYAxbezXr3pyYxYtI3pGmULQ=;
  b=HppSeBwi0tQWLoIJ2faXxH1w3TtQ7ERs7dthG51rnlZ3v2T5Cero8ohF
   wtmFRoca7ThYK/YlYxjDhlVwRoQRt1ijWY1uHD68ZOJlPaKer62Ce3ZTJ
   Ic61SKzQncwtPeEVceK+p3vwFoufzjZkfjVTN9Pe4Vzt1F+4DWjmAnUAY
   CJSKp9jym111k61Z4hCQHiQvxAW+BKK+NRipuQjULJbzDiSdCQIoGk6gB
   EQ4BG5+6EYzsHxzraQn6I/iCcCDNAERnx8LAu1oPmdiS6QInLOquxDoJR
   B63eh5sQaEui8sTCoI9l4DjtZjZLOkTJJ9CA1OvkwIJxTgoNr4SQKyqIa
   Q==;
X-CSE-ConnectionGUID: P4vVamdUQkawIf7qF76UMQ==
X-CSE-MsgGUID: G4qWtd3zS+qDox+KwAFFxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31993928"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31993928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 20:41:16 -0800
X-CSE-ConnectionGUID: OsSWKA6MTWy/S6A0qHPppA==
X-CSE-MsgGUID: v4b78mCdSSePfbMLsHBlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="88681436"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2024 20:41:15 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCtZY-0002Gf-1n;
	Mon, 18 Nov 2024 04:41:12 +0000
Date: Mon, 18 Nov 2024 12:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 70/120]
 arch/powerpc/platforms/powernv/opal-core.c:431:37: error: use of undeclared
 identifier 'opal_core_attr'; did you mean 'opalcore_list'?
Message-ID: <202411181242.vpadv6Ru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: a1c827e4a14a8f2484e8d1159351275b5662c2e3 [70/120] opal-core: macro
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411181242.vpadv6Ru-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181242.vpadv6Ru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181242.vpadv6Ru-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/powernv/opal-core.c:11:
   In file included from include/linux/memblock.h:12:
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
>> arch/powerpc/platforms/powernv/opal-core.c:431:37: error: use of undeclared identifier 'opal_core_attr'; did you mean 'opalcore_list'?
     431 |         sysfs_remove_bin_file(mpipl_kobj, &opal_core_attr);
         |                                            ^~~~~~~~~~~~~~
         |                                            opalcore_list
   arch/powerpc/platforms/powernv/opal-core.c:70:18: note: 'opalcore_list' declared here
      70 | static LIST_HEAD(opalcore_list);
         |                  ^
   arch/powerpc/platforms/powernv/opal-core.c:632:2: error: use of undeclared identifier 'opal_core_attr'
     632 |         opal_core_attr.size = oc_conf->opalcore_size;
         |         ^
   4 warnings and 2 errors generated.


vim +431 arch/powerpc/platforms/powernv/opal-core.c

6f713d18144ce8 Hari Bathini 2019-09-11  424  
6f713d18144ce8 Hari Bathini 2019-09-11  425  static void opalcore_cleanup(void)
6f713d18144ce8 Hari Bathini 2019-09-11  426  {
6f713d18144ce8 Hari Bathini 2019-09-11  427  	if (oc_conf == NULL)
6f713d18144ce8 Hari Bathini 2019-09-11  428  		return;
6f713d18144ce8 Hari Bathini 2019-09-11  429  
6f713d18144ce8 Hari Bathini 2019-09-11  430  	/* Remove OPAL core sysfs file */
8852c07a881b0a Sourabh Jain 2019-12-11 @431  	sysfs_remove_bin_file(mpipl_kobj, &opal_core_attr);
6f713d18144ce8 Hari Bathini 2019-09-11  432  	oc_conf->ptload_phdr = NULL;
6f713d18144ce8 Hari Bathini 2019-09-11  433  	oc_conf->ptload_cnt = 0;
6f713d18144ce8 Hari Bathini 2019-09-11  434  
6f713d18144ce8 Hari Bathini 2019-09-11  435  	/* free the buffer used for setting up OPAL core */
6f713d18144ce8 Hari Bathini 2019-09-11  436  	if (oc_conf->opalcorebuf) {
6f713d18144ce8 Hari Bathini 2019-09-11  437  		void *end = (void *)((u64)oc_conf->opalcorebuf +
6f713d18144ce8 Hari Bathini 2019-09-11  438  				     oc_conf->opalcorebuf_sz);
6f713d18144ce8 Hari Bathini 2019-09-11  439  
6f713d18144ce8 Hari Bathini 2019-09-11  440  		free_reserved_area(oc_conf->opalcorebuf, end, -1, NULL);
6f713d18144ce8 Hari Bathini 2019-09-11  441  		oc_conf->opalcorebuf = NULL;
6f713d18144ce8 Hari Bathini 2019-09-11  442  		oc_conf->opalcorebuf_sz = 0;
6f713d18144ce8 Hari Bathini 2019-09-11  443  	}
6f713d18144ce8 Hari Bathini 2019-09-11  444  
6f713d18144ce8 Hari Bathini 2019-09-11  445  	kfree(oc_conf);
6f713d18144ce8 Hari Bathini 2019-09-11  446  	oc_conf = NULL;
6f713d18144ce8 Hari Bathini 2019-09-11  447  }
6f713d18144ce8 Hari Bathini 2019-09-11  448  __exitcall(opalcore_cleanup);
6f713d18144ce8 Hari Bathini 2019-09-11  449  

:::::: The code at line 431 was first introduced by commit
:::::: 8852c07a881b0acfd3d75cf3927adaab815c4ee5 powerpc/powernv: Move core and fadump_release_opalcore under new kobject

:::::: TO: Sourabh Jain <sourabhjain@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
