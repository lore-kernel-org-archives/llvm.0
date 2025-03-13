Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D5800;
	Thu, 13 Mar 2025 04:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741840423; cv=none; b=nwExyIz2ODxsFbkmqwoZLjlRgnZkXre/IECPFD4IAvihMy05DsWCJEPEN1G3pV8MCvkdfpXMiEWYM09nrJD+cEqhsyTbhKCZwvfH12wnlyDm/I5C7cCg15CWR6zAygx/OGl9ssKDcg+hg/shwqJ1d0YVPeZIAzok8SsQLZEkaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741840423; c=relaxed/simple;
	bh=vnDSJUDPdLg8Juvm64DtoPmI+QBsUMIDLzw2hYng+4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI/+F272PQYlNpLgSo06h1lJjbISBPkaOs+W82+5EB7PE9jy5lrx16ehEgI57O4o51VXx77BCgU/db3pITv8drf+nYVG2RCWL3mfHLc/P6xJdv2hBoSNJf5mZFESrzb9poa+ia4nEtqg2fAssxhGOAYBlahSscR5hD/lMh2PTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJfZB/Am; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJfZB/Am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741840421; x=1773376421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vnDSJUDPdLg8Juvm64DtoPmI+QBsUMIDLzw2hYng+4E=;
  b=fJfZB/Am68QCSC2o0MHsN5+iVzpmBC5ZxZEu4VLuwCLLCZIjF9ZDrQi4
   smMM8E4Vs63QPod+E1cibHX8F54bl/UPFzOPQSbxisNea9NekmiNNWnK1
   sz74R4h9K9AiBXdi7LPJue/imeN4g8IfH4AuxzIwlT0nkHWNBtr+K09zd
   Tfu+sUhKQo/HJZuTRLI/KTV1rgAhEmEkujkL49EBVCenqTWJbP2iK0ZZ7
   TUPIyYHSdAaPMBqlcUD5jWorD6sescHyeyKRcVfFsqDd+xyAftJzJPoao
   0wR9MJJinFdWCpNn2gOzS10ZBBglsmdCzEElKdzz3xnnpMi0lnS/BqEoW
   g==;
X-CSE-ConnectionGUID: Wd0pS778Rsus2Zm5ddn/Fw==
X-CSE-MsgGUID: lycPCF7hTOqOP/QpzYd6pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53576986"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="53576986"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 21:33:40 -0700
X-CSE-ConnectionGUID: kSC9oVw+Ssu+BjRlTcoBDA==
X-CSE-MsgGUID: uaSHo5cxSR24kmNBMd1udw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125702871"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Mar 2025 21:33:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsaGG-000988-21;
	Thu, 13 Mar 2025 04:33:36 +0000
Date: Thu, 13 Mar 2025 12:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: kan.liang@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V8 3/6] perf: Supply task information to sched_task()
Message-ID: <202503131232.MgNSxEWU-lkp@intel.com>
References: <20250312182525.4078433-3-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312182525.4078433-3-kan.liang@linux.intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on next-20250312]
[cannot apply to perf-tools-next/perf-tools-next perf-tools/perf-tools linus/master acme/perf/core v6.14-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kan-liang-linux-intel-com/perf-attach-detach-PMU-specific-data/20250313-022851
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/20250312182525.4078433-3-kan.liang%40linux.intel.com
patch subject: [PATCH V8 3/6] perf: Supply task information to sched_task()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250313/202503131232.MgNSxEWU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131232.MgNSxEWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131232.MgNSxEWU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/perf_pai_crypto.c:18:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/s390/include/asm/perf_event.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
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
>> arch/s390/kernel/perf_pai_crypto.c:578:18: error: incompatible function pointer types initializing 'void (*)(struct perf_event_pmu_context *, struct task_struct *, bool)' (aka 'void (*)(struct perf_event_pmu_context *, struct task_struct *, _Bool)') with an expression of type 'void (struct perf_event_pmu_context *, bool)' (aka 'void (struct perf_event_pmu_context *, _Bool)') [-Wincompatible-function-pointer-types]
     578 |         .sched_task   = paicrypt_sched_task,
         |                         ^~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.
--
   In file included from arch/s390/kernel/perf_pai_ext.c:19:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/s390/include/asm/perf_event.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
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
>> arch/s390/kernel/perf_pai_ext.c:604:18: error: incompatible function pointer types initializing 'void (*)(struct perf_event_pmu_context *, struct task_struct *, bool)' (aka 'void (*)(struct perf_event_pmu_context *, struct task_struct *, _Bool)') with an expression of type 'void (struct perf_event_pmu_context *, bool)' (aka 'void (struct perf_event_pmu_context *, _Bool)') [-Wincompatible-function-pointer-types]
     604 |         .sched_task   = paiext_sched_task,
         |                         ^~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +578 arch/s390/kernel/perf_pai_crypto.c

39d62336f5c126a Thomas Richter 2022-05-04  568  
39d62336f5c126a Thomas Richter 2022-05-04  569  /* Performance monitoring unit for mapped counters */
39d62336f5c126a Thomas Richter 2022-05-04  570  static struct pmu paicrypt = {
92ea686840ac5e2 Thomas Richter 2024-02-29  571  	.task_ctx_nr  = perf_hw_context,
39d62336f5c126a Thomas Richter 2022-05-04  572  	.event_init   = paicrypt_event_init,
39d62336f5c126a Thomas Richter 2022-05-04  573  	.add	      = paicrypt_add,
39d62336f5c126a Thomas Richter 2022-05-04  574  	.del	      = paicrypt_del,
39d62336f5c126a Thomas Richter 2022-05-04  575  	.start	      = paicrypt_start,
39d62336f5c126a Thomas Richter 2022-05-04  576  	.stop	      = paicrypt_stop,
39d62336f5c126a Thomas Richter 2022-05-04  577  	.read	      = paicrypt_read,
39d62336f5c126a Thomas Richter 2022-05-04 @578  	.sched_task   = paicrypt_sched_task,
39d62336f5c126a Thomas Richter 2022-05-04  579  	.attr_groups  = paicrypt_attr_groups
39d62336f5c126a Thomas Richter 2022-05-04  580  };
39d62336f5c126a Thomas Richter 2022-05-04  581  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
