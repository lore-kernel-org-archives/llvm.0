Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995922210F9;
	Fri, 20 Dec 2024 19:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734723011; cv=none; b=a+RkSRDs9xpxhK3Qsh5U/9lJd84RgPNUTa47zKamr5vVP5R7UYn/O3hM0YXXbPTpmlpGyEwIPKWblHeDiT8//gUH8/RP5dDLqxaegX+2CbqTj2RHgxYQbHeypkxLSvVvNRFPDg/7kPjXsJ75LpDj4BgKP9+itwRRTFLA7DELlwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734723011; c=relaxed/simple;
	bh=O0Evpx+bECfAw/5AgxWoTE5sAqIrbLNiGYGk2ulkohk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YkFy6MTEf7gIBwkjXYqNswV5ZfTBKNeJgD81LcUUBRt8Bgg0uEpCIvWXT5enpNQTMaxN1HRnyXyorMcIRKBCY+HukJU2WGQIfQ3Vc0K/xfb2KRPShSkv94AsGI2A3eddmrtCmlh73T3VT+3IGgF38Jj0QER+RTV3ocR73O0OCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+gpParF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+gpParF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734723010; x=1766259010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0Evpx+bECfAw/5AgxWoTE5sAqIrbLNiGYGk2ulkohk=;
  b=i+gpParF5CRNDnzkM68VjoMxeejPLmw/Bg24T4SxzqKR7YOmEkxj7+Tn
   bVDdZqxNtpovSYLng2grJ5NBEZzQM4FMJ7nNausRB4y3u6NgzWVkQYWkt
   kcEeTScaIKqv6jqUdEClmt3xq0P5d10c2ncTi5/3BZrQn3z4pmx7WF2XI
   wHTwIKRAeLoPjFK5puk4Ou6JMPTCxlrt1ihrbg/IF36HZ8aPoFQesDnLJ
   QDEGtv87Jv9y9nU9/7TKrcE4l226/j8EMDW9ZrD5yWJBF7dKEgLExKT8y
   eMw+n35dDMEwfhYsNVQwpKOo/ek6YAwD7uChnmxR+YS120YH8oFajCYxs
   Q==;
X-CSE-ConnectionGUID: rW1NHrK7R2Cci/ftZZV71w==
X-CSE-MsgGUID: EfNQts8rRNekCAnzMWDssg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34600946"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34600946"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:30:09 -0800
X-CSE-ConnectionGUID: 2dySvJ64Q7aWNF/zFm0wyg==
X-CSE-MsgGUID: yj1a0h+RRlqONBxiiHjNAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="99114335"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 11:30:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOihJ-0001dH-1Z;
	Fri, 20 Dec 2024 19:30:05 +0000
Date: Sat, 21 Dec 2024 03:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:dev 25/30] kernel/time/hrtimer.c:1229:28: error: use of
 undeclared identifier 'migration_base'; did you mean 'is_migration_base'?
Message-ID: <202412210349.2Bm3zuje-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   54c05449fb97c1414c85c6e2e58a7d0c53827acd
commit: fe2e53971593e84616d31630458d80398e18fbcf [25/30] EXP hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMERS_DYING
config: i386-buildonly-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210349.2Bm3zuje-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210349.2Bm3zuje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210349.2Bm3zuje-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/hrtimer.c:30:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/time/hrtimer.c:124:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:27: note: previous initialization is here
     122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/hrtimer.c:1229:28: error: use of undeclared identifier 'migration_base'; did you mean 'is_migration_base'?
    1229 |                 WRITE_ONCE(timer->base, &migration_base);
         |                                          ^~~~~~~~~~~~~~
         |                                          is_migration_base
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                         ^
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^
   kernel/time/hrtimer.c:281:20: note: 'is_migration_base' declared here
     281 | static inline bool is_migration_base(struct hrtimer_clock_base *base)
         |                    ^
>> kernel/time/hrtimer.c:1229:3: error: incompatible pointer types assigning to 'volatile typeof (timer->base)' (aka 'struct hrtimer_clock_base *volatile') from 'bool (*)(struct hrtimer_clock_base *)' (aka '_Bool (*)(struct hrtimer_clock_base *)') [-Werror,-Wincompatible-pointer-types]
    1229 |                 WRITE_ONCE(timer->base, &migration_base);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                     ^ ~~~~~
   5 warnings and 2 errors generated.


vim +1229 kernel/time/hrtimer.c

  1206	
  1207	/*
  1208	 * If the current CPU is offline and timers have been already
  1209	 * migrated away, make sure not to enqueue locally and perform
  1210	 * a remote retrigger as a last resort.
  1211	 */
  1212	static void enqueue_hrtimer_offline(struct hrtimer *timer,
  1213					    struct hrtimer_clock_base *base,
  1214					    const enum hrtimer_mode mode)
  1215	{
  1216		struct hrtimer_cpu_base *new_cpu_base, *old_cpu_base, *this_cpu_base;
  1217		struct hrtimer_clock_base *new_base;
  1218		int cpu;
  1219	
  1220		old_cpu_base = base->cpu_base;
  1221		this_cpu_base = this_cpu_ptr(&hrtimer_bases);
  1222	
  1223		if (old_cpu_base == this_cpu_base || !old_cpu_base->online) {
  1224			WARN_ON_ONCE(hrtimer_callback_running(timer));
  1225			cpu = cpumask_any_and(cpu_online_mask,
  1226					      housekeeping_cpumask(HK_TYPE_TIMER));
  1227			new_cpu_base = &per_cpu(hrtimer_bases, cpu);
  1228			new_base = &new_cpu_base->clock_base[base->index];
> 1229			WRITE_ONCE(timer->base, &migration_base);
  1230			raw_spin_unlock(&old_cpu_base->lock);
  1231			raw_spin_lock(&new_cpu_base->lock);
  1232			WRITE_ONCE(timer->base, new_base);
  1233		} else {
  1234			new_base = base;
  1235			new_cpu_base = new_base->cpu_base;
  1236			cpu = new_cpu_base->cpu;
  1237		}
  1238	
  1239		if (enqueue_hrtimer(timer, new_base, mode))
  1240			smp_call_function_single_async(cpu, &new_cpu_base->csd);
  1241	}
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
