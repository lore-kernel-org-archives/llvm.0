Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212C1103;
	Tue, 27 Aug 2024 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724730470; cv=none; b=m5EX8NCQroiadE6lI0XTgUQzeJ9XZ6aTQiThQpU86PU93CPt/8jjK0tsnY2YfUEaIcyP5CJWIVtD8rrIwyEQZdt+t9pIVXYFlBXVO7tlJwc3OdovAMOf/3qD8X+sypBF+kl8dcBfF1m8m2iVd/+eSBzdzbI6tjvpLuO9xDOEcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724730470; c=relaxed/simple;
	bh=oOpC0IELRvCy2ecE4vg5RWszbr5T1cuFU2u7+u4KdDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJKk9aXDgICsT4LukQu4+cP+S/R4V7djplvH0AYc4MpXTru+tqaNbeig+sRKQmGUy27bNx59qGcCBQfNAOHmFtrkd8qsm1ZVLFL6aRpfbGCt/o3FlIXZxxftzdq00vmqNLJDzbKy12oRX//THtrEnv8bkHkM+XyUyeqFIsMcHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjcisU/d; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjcisU/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724730468; x=1756266468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oOpC0IELRvCy2ecE4vg5RWszbr5T1cuFU2u7+u4KdDg=;
  b=jjcisU/dqOoFh1gHKUm1xNmpReMUkr+p5Zph+gUE2PD9Qk5s5AlNJbuF
   y8YGJY1Rm5zaUZp/gUS/kkw2EuQ6clvrf5m4TNwKhri66Lm4CvDqeHU3X
   JdxqqMvsgCdCnVrNt75lUuEfjJlstlFP1kBUCk/qg/7ZRCTKcsO6vUlDB
   RH6A8R4hWu2hQntrbex2MRb8/bu55E3iQ330gXAUKOZFt/vo+N/3Al8jv
   VQoRYjR2SIgkSRvYf4uMFS4pHn/SwmmuTG2yprZ6kNLMFfJn9vI8M6K3b
   2C2Jlpm2etPlxuEhDpP0nzWALLhdfVtW7fIMDhJdE7SuqycCkV5UWoJNl
   w==;
X-CSE-ConnectionGUID: /vfypk1ZQ2CCKgI8q+LI2Q==
X-CSE-MsgGUID: 6aPUF+9gRYujwg5M4+tpSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34339312"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="34339312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 20:47:47 -0700
X-CSE-ConnectionGUID: pdBmeMi3SL2Z64FI/TiylA==
X-CSE-MsgGUID: swRJxc0cSbeWA+TkDRLrkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="67613201"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2024 20:47:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sinBG-000Hrw-2m;
	Tue, 27 Aug 2024 03:47:42 +0000
Date: Tue, 27 Aug 2024 11:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 127/132]
 kernel/locking/percpu-rwsem.c:185:9: warning: 'per_cpu_sum' macro redefined
Message-ID: <202408271103.TILNl1db-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   fcd6549aad02f9abeb9184201c285e6b67b3f098
commit: 2cfe6ffc66b2a26cd25e4adc66d8751581a6f28d [127/132] percpu: per_cpu_sum()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408271103.TILNl1db-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271103.TILNl1db-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271103.TILNl1db-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/percpu-rwsem.c:12:
   In file included from include/trace/events/lock.h:9:
   In file included from include/linux/tracepoint.h:21:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
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
>> kernel/locking/percpu-rwsem.c:185:9: warning: 'per_cpu_sum' macro redefined [-Wmacro-redefined]
     185 | #define per_cpu_sum(var)                                                \
         |         ^
   include/linux/percpu.h:165:9: note: previous definition is here
     165 | #define per_cpu_sum(_p)                                                 \
         |         ^
   6 warnings generated.
--
>> kernel/locking/percpu-rwsem.c:185:9: warning: 'per_cpu_sum' macro redefined [-Wmacro-redefined]
     185 | #define per_cpu_sum(var)                                                \
         |         ^
   include/linux/percpu.h:165:9: note: previous definition is here
     165 | #define per_cpu_sum(_p)                                                 \
         |         ^
   1 warning generated.


vim +/per_cpu_sum +185 kernel/locking/percpu-rwsem.c

9287f6925ad9d8 kernel/locking/percpu-rwsem.c Oleg Nesterov  2015-07-21  184  
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14 @185  #define per_cpu_sum(var)						\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  186  ({									\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  187  	typeof(var) __sum = 0;						\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  188  	int cpu;							\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  189  	compiletime_assert_atomic_type(__sum);				\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  190  	for_each_possible_cpu(cpu)					\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  191  		__sum += per_cpu(var, cpu);				\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  192  	__sum;								\
80127a39681bd6 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  193  })
a1fd3e24d8a484 lib/percpu-rwsem.c            Oleg Nesterov  2012-12-17  194  

:::::: The code at line 185 was first introduced by commit
:::::: 80127a39681bd68c959f0953f84a830cbd7c3b1c locking/percpu-rwsem: Optimize readers and reduce global impact

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
