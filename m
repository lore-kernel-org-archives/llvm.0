Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5730DEA7;
	Wed, 31 Dec 2025 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767213895; cv=none; b=gGtLGkmNsy2UI3q2DPB8NfI2iDRDLpQOsrhpDXGP4jM2LynoqgIGnVINJQPfGn8DbNwRCIIS6vju5YsDcQiHwFIsZLtLu/wHh4zYmU6TmiOjwKHri7EiTpZ5rC+pebl9vYoMzmvi+BfyrI9zQNDfbJUEqlOUxckqnUrLIW/6HAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767213895; c=relaxed/simple;
	bh=akwvPUH7wREJTQUI95u/fmYG6/w6U6MxWi4o2xhhwH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NEK6lYnXHWNsDXk/AORa51yGJ2hRrhjjRFj0eTvHHIsaLH3FRcflSahB5rOzQWEYutPE4fipw9fvhEsJIIA4MCyeWuWAJVJc8jBk8rqY3wRcCqTq76yTL/DAr8xNC8E8SFEQnOk55yQ9w8CBDSXyOYbiFxD7gZqlxBQmkISbVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxraQNnw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxraQNnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767213893; x=1798749893;
  h=date:from:to:cc:subject:message-id;
  bh=akwvPUH7wREJTQUI95u/fmYG6/w6U6MxWi4o2xhhwH8=;
  b=gxraQNnwmy7QubDVpYzayTQE3uKM2rPWX5wBVYysZ7nsSNgBed5uw/A6
   /q1iXOF3DC9lVXZzVWlDOa3YN4e144a7jxwkLMQKkcqGZr5DYKgiSxRqF
   j+aM2yl9tzbZOs36j7lkuxb+W2C2gJu7PVNtm+iWEKTRDWqWwcCcfLkti
   LhlQiQcbese1HjuOf/SbSvjUbIUK4DnpWILX4d40hkjNIW0Y7l0M5HnLb
   +i1cVZtWzgSgOqRhasmXN0ALZYmXEHC6wZCeY0bmzzqJhDKyLFCTkyVvn
   SYE3nVoBKohxPwLsBNqJz95kBlTIpuqflIgcIYNM3bLfyq6bR7/hDvang
   Q==;
X-CSE-ConnectionGUID: gnoEjmKhTuqY4DY11FRSbw==
X-CSE-MsgGUID: OXwz/HApQ8+p7hN5P6EmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="86356341"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="86356341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 12:44:53 -0800
X-CSE-ConnectionGUID: //GzPuQvR1eYHvrsKgnoZA==
X-CSE-MsgGUID: rp6K8x2uTrC3XrZ71ZsYpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201969511"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 Dec 2025 12:44:51 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb33o-0000000006f-3xmW;
	Wed, 31 Dec 2025 20:44:48 +0000
Date: Wed, 31 Dec 2025 21:43:50 +0100
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 8/10]
 include/linux/kernel_stat.h:164:2: error: call to undeclared function
 'kcpustat_fetch_default'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512312120.8230jUR6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   e2e8796db56999913bd1cf839e933af6e5d5b23e
commit: fddf01afd946b39d896ba8c2f53ee285379bd606 [8/10] tick/sched: Consolidate fetching idle time
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251231/202512312120.8230jUR6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512312120.8230jUR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512312120.8230jUR6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
>> include/linux/kernel_stat.h:164:2: error: call to undeclared function 'kcpustat_fetch_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         kcpustat_fetch_default(dst, cpu);
         |         ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kcpustat_fetch_default +164 include/linux/kernel_stat.h

   161	
   162	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   163	{
 > 164		kcpustat_fetch_default(dst, cpu);
   165	}
   166	#endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
