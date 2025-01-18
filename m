Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C61898E8;
	Sat, 18 Jan 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737205217; cv=none; b=raupAQG+L97y+v+E6dsclO9MRzjtbWntS6VLinMkAgVtsDVBD1zgIPVOmgGOVlXgNMnb3N8Bv2fbe5yo1j+k/KbfhiEklfH5uIt/SyIwd4GPIxKxuMq0hVddIPBTkBZKx94CUVpoXmXatxUCgIKCrYHTTCbxw1FQIzYxiBS/4nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737205217; c=relaxed/simple;
	bh=rkonJlHwsLX3fegh93qglL5yqGvK5EnkIGs6k2a8JAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elarN/o+7g1r+MmKVlB8Qq0zGWZ76TBYmgOjsPc63veEcTTuNkXroOpJ4KxHcTj3ez0GKat6UEzV7vzTKg6PGMyc8VIB3bXXTZyaqMAzWmLVmMVs1W8XaDeffJ9fSYacedIx0bzhrUL+qjIjPkWBbvZ9fa+hB1AkzukQ9a+EDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9SndFTF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9SndFTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737205215; x=1768741215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rkonJlHwsLX3fegh93qglL5yqGvK5EnkIGs6k2a8JAo=;
  b=T9SndFTF7qJwrWX8DV4HvqgCiQUfgWi08546tN/KuCRJ0IT6V5WbjluJ
   CG++0+Vy9SAtcajWlMFUCND1bWs8nWz/YW5YNagYsqJBtdMcoE61vc5Aa
   QKuZS5+UHOFZabD36a6FsBh+7IgIWX+hM8ftOqgcdRo54I5hxu+6AI+SA
   F7WSYAkk+ooGR/ktT5nfA4ImjWPiv8d/WJ2MpXw/+9LHBIhCPSPC8TsSO
   5xE2fMdhfUsDuUKnESCsixY6QVVM3yJQBDTD+QTO+ha4Sw1e7C3MABmpn
   LtSnk7CwbzfzWeMuhewqafgdX8PUEbEgNT3ZYDZrvmpFKCIGdpDmCwvWp
   Q==;
X-CSE-ConnectionGUID: +c0ba6ZlTOGyEqZIopUGRg==
X-CSE-MsgGUID: FGrLxBVzQUOmg4D2L3ACDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48299929"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="48299929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:00:11 -0800
X-CSE-ConnectionGUID: syriZOLsTeygsm9DpLo09g==
X-CSE-MsgGUID: jo0Y7Xt+QuaKre9mE+P51w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143335984"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2025 05:00:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8Qp-000URj-2b;
	Sat, 18 Jan 2025 13:00:07 +0000
Date: Sat, 18 Jan 2025 21:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/11] fs/resctrl: Add arch hook to set up the
 default CLOSID
Message-ID: <202501182055.O6qTNY3J-lkp@intel.com>
References: <20250117151033.1517882-5-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117151033.1517882-5-Dave.Martin@arm.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4d17b37b670795954fd7a70c8ec83fb705a5e2ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Martin/arm_mpam-Fix-read-back-of-cloned-resource-controls-under-CDP-emulation/20250118-031759
base:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
patch link:    https://lore.kernel.org/r/20250117151033.1517882-5-Dave.Martin%40arm.com
patch subject: [RFC PATCH v2 04/11] fs/resctrl: Add arch hook to set up the default CLOSID
config: i386-buildonly-randconfig-002-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182055.O6qTNY3J-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182055.O6qTNY3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182055.O6qTNY3J-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/resctrl/rdtgroup.c:18:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/resctrl/rdtgroup.c:21:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:60:52: warning: declaration of 'struct rdt_resource' will not be visible outside of this function [-Wvisibility]
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                    ^
   In file included from fs/resctrl/rdtgroup.c:21:
>> include/linux/resctrl.h:375:5: error: conflicting types for 'resctrl_arch_init_domains'
     375 | int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
         |     ^
   arch/x86/include/asm/resctrl.h:60:19: note: previous definition is here
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                   ^
>> fs/resctrl/rdtgroup.c:3260:36: error: incompatible pointer types passing 'struct rdt_resource *' to parameter of type 'struct rdt_resource *' [-Werror,-Wincompatible-pointer-types]
    3260 |                         ret = resctrl_arch_init_domains(r, rdtgrp->closid);
         |                                                         ^
   arch/x86/include/asm/resctrl.h:60:66: note: passing argument to parameter 'r' here
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                                  ^
   2 warnings and 2 errors generated.
--
   In file included from fs/resctrl/ctrlmondata.c:24:
   In file included from fs/resctrl/internal.h:5:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:60:52: warning: declaration of 'struct rdt_resource' will not be visible outside of this function [-Wvisibility]
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                    ^
   In file included from fs/resctrl/ctrlmondata.c:24:
   In file included from fs/resctrl/internal.h:5:
>> include/linux/resctrl.h:375:5: error: conflicting types for 'resctrl_arch_init_domains'
     375 | int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
         |     ^
   arch/x86/include/asm/resctrl.h:60:19: note: previous definition is here
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                   ^
   In file included from fs/resctrl/ctrlmondata.c:24:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings and 1 error generated.
--
   In file included from fs/resctrl/monitor.c:22:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:60:52: warning: declaration of 'struct rdt_resource' will not be visible outside of this function [-Wvisibility]
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                    ^
   In file included from fs/resctrl/monitor.c:22:
>> include/linux/resctrl.h:375:5: error: conflicting types for 'resctrl_arch_init_domains'
     375 | int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
         |     ^
   arch/x86/include/asm/resctrl.h:60:19: note: previous definition is here
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                   ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/resctrl/monitor.c:26:
   In file included from fs/resctrl/internal.h:8:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/resctrl/pseudo_lock.c:14:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/resctrl/pseudo_lock.c:23:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:60:52: warning: declaration of 'struct rdt_resource' will not be visible outside of this function [-Wvisibility]
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                    ^
   In file included from fs/resctrl/pseudo_lock.c:23:
>> include/linux/resctrl.h:375:5: error: conflicting types for 'resctrl_arch_init_domains'
     375 | int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
         |     ^
   arch/x86/include/asm/resctrl.h:60:19: note: previous definition is here
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                   ^
   2 warnings and 1 error generated.
--
   In file included from arch/x86/kernel/process_32.c:19:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/x86/kernel/process_32.c:54:
>> arch/x86/include/asm/resctrl.h:60:52: warning: declaration of 'struct rdt_resource' will not be visible outside of this function [-Wvisibility]
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                    ^
   2 warnings generated.


vim +/resctrl_arch_init_domains +375 include/linux/resctrl.h

   371	
   372	struct rdt_domain_hdr *resctrl_arch_find_domain(struct list_head *domain_list,
   373							int id);
   374	bool resctrl_arch_default_closid_needs_init(void);
 > 375	int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
   376	int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
