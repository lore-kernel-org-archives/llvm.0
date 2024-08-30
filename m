Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B91B2ED5;
	Fri, 30 Aug 2024 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725030318; cv=none; b=fvWJ0mRSRBNuX0HMuadFhfw0x4V2DLLf1o1QNg2UIlDG4vIPKNKG059QnxmhBrbPmVsw/+uW8aIYevK8q/t1I/RwbkrO0aOjGDbtf+ky9zTilim7kpG3CsrpfF+nuMdFLW+3O1ljAKpqFRvNJbOwnbmQNwow0Sklg41Ci5HhjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725030318; c=relaxed/simple;
	bh=0Gyi4D+lWnphsxV9XXUBi+COU1tFEXCrojJYq70NhSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI2unN5ZAb5MP7RFhTZ6JbMsSgRHTBZ+QwUeGe3cinDra1cdgJgGCoycnutJnwTbtXUq5qW5IKm4iQzDW9I7IZEyEs3sIz6i/cV8eiGyixgW+LhFyRJwKbRGEIonqT22/cf9S04d7ply2dFdFCgr3NdM0/eAGJ+YIdEqv6Gt/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uv8WCB5M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uv8WCB5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725030317; x=1756566317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Gyi4D+lWnphsxV9XXUBi+COU1tFEXCrojJYq70NhSw=;
  b=Uv8WCB5MqkA4yzY+H0GIZSz51ZHz2JVQ8oxipRU9955M6SF+9p9FLjIc
   OEvRfbnrMfeNzZOjKHF9Ausu0DW4eAOJQUCbXaqKbQs4ycCg5WNVxAyNj
   g48LVEM6NBwZTtJXpBCzLQMLJCzOXsEJHuqK8ZR9Bz9z8NAb9X2zPvMT4
   oXwm8s6GfFO5Hz+y0tfrtBeURo3lWrLLUhpVQFLlXt5EeVcko2hYm7Qgh
   c0l74uafeSwyjzMFCVdH6V9P8Y36rFcy7+iKXS8P/OXnUbKJvUzUSLgVM
   rbfTMhA+/yfFxAbZQpLeQ3zG83FF1QvRqcC4aaZ6z5iBKnQrBZMOigOjq
   Q==;
X-CSE-ConnectionGUID: NPBCUXJOQdOfHL5H+8jJNA==
X-CSE-MsgGUID: gG479IbnQPeHxT0ogwsc8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13298934"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="13298934"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:05:16 -0700
X-CSE-ConnectionGUID: mLThyzsQS++RO9dIbUxPIg==
X-CSE-MsgGUID: 3wZbENVWSHa11k/pO2WtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63937010"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Aug 2024 08:05:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk3BY-0001Yc-0u;
	Fri, 30 Aug 2024 15:05:12 +0000
Date: Fri, 30 Aug 2024 23:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixiong Yu <yukaixiong@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -next 08/15] mm: nommu: move sysctl to its own file
Message-ID: <202408302219.we70LHBV-lkp@intel.com>
References: <20240826120449.1666461-9-yukaixiong@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826120449.1666461-9-yukaixiong@huawei.com>

Hi Kaixiong,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240826]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaixiong-Yu/mm-vmstat-move-sysctls-to-its-own-files/20240826-200753
base:   next-20240826
patch link:    https://lore.kernel.org/r/20240826120449.1666461-9-yukaixiong%40huawei.com
patch subject: [PATCH -next 08/15] mm: nommu: move sysctl to its own file
config: arm-randconfig-003-20240830 (https://download.01.org/0day-ci/archive/20240830/202408302219.we70LHBV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302219.we70LHBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302219.we70LHBV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/nommu.c:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/nommu.c:43:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/nommu.c:43:
   In file included from mm/internal.h:22:
   mm/vma.h:184:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
     184 |         vms->unmap_end = USER_PGTABLES_CEILING;
         |                          ^
>> mm/nommu.c:405:2: error: expected ';' after top level declarator
     405 | }
         |  ^
         |  ;
>> mm/nommu.c:417:2: error: call to undeclared function 'register_syscall_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         register_syscall_init("vm", nommu_table);
         |         ^
   mm/nommu.c:417:2: note: did you mean '__register_sysctl_init'?
   include/linux/sysctl.h:232:13: note: '__register_sysctl_init' declared here
     232 | extern void __register_sysctl_init(const char *path, struct ctl_table *table,
         |             ^
   3 warnings and 3 errors generated.


vim +405 mm/nommu.c

   395	
   396	static struct ctl_table nommu_table[] = {
   397		{
   398			.procname	= "nr_trim_pages",
   399			.data		= &sysctl_nr_trim_pages,
   400			.maxlen		= sizeof(sysctl_nr_trim_pages),
   401			.mode		= 0644,
   402			.proc_handler	= proc_dointvec_minmax,
   403			.extra1		= SYSCTL_ZERO,
   404		},
 > 405	}
   406	
   407	/*
   408	 * initialise the percpu counter for VM and region record slabs
   409	 */
   410	void __init mmap_init(void)
   411	{
   412		int ret;
   413	
   414		ret = percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
   415		VM_BUG_ON(ret);
   416		vm_region_jar = KMEM_CACHE(vm_region, SLAB_PANIC|SLAB_ACCOUNT);
 > 417		register_syscall_init("vm", nommu_table);
   418	}
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
