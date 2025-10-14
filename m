Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD430ACFB;
	Tue, 14 Oct 2025 04:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760417519; cv=none; b=dFVTaRt5QT5xPmGXHCXj3tJoyXo8rsjFEspsgZSh+93urISSbqMvVCd0OuuO0Ql3Qxo1E1d0sMLAxOkMfNhISGOyApfQimzwxoMP+i+RMPEmEYmmE93j9G71c2UJIO2GeN5cwfKS1lOh8qFYE0T0bGOfjJua5n39pB+FJEhd4UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760417519; c=relaxed/simple;
	bh=8r4JfeR1FFdB+OxMPpdtT24sRcT4JvppZgZJp7p6s10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOCCc7J/4080qDpAIjsEre6f+LZcGuS1B0q4CSqNWdDfzQPOL8XlOXmN3vNz9M5TsWJb62Z6DcO13kS91MUnmaKhBw8ZGqBwBhyHgblp0VD4Z9Mgq27iKdGhCSTeuzqRwM4owXuqxAken5rKqwysS4bDI4mYdHeyndYhf9PvFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBkKjOGR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBkKjOGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760417516; x=1791953516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8r4JfeR1FFdB+OxMPpdtT24sRcT4JvppZgZJp7p6s10=;
  b=PBkKjOGRsnhlRGzUYpHYfo8NfFEwpAtUBqtz2tBy5gmoMw+1Veofhn81
   P5IZi9AWgLH8V25CGIJ1oZrb4tyRib6LTdeZiugoLI1hGaOmtb+0biDDy
   SX++Fkp9MHc9cFAWr18X7YPxDAfGX894VugTj1R26diRT2D2139NmDjgF
   bXMFS9F71qbxCpZmvuEsr4YaowefOKSFF48NX58vRa49QEt7F3u/HsrnC
   8NhV2ZqGrWNyH1fWnrV+ofLOhjQL2pgMthn4eV0sL3H9Z5Y2b8Jxx2KB5
   BLaAL3XltpN1JOQ5lFz5elXacLF3m6yKWw3Ow8zm6eWto5dv4ZA8oGGYa
   g==;
X-CSE-ConnectionGUID: wnLIX9W7TdSzgunRu3j8Eg==
X-CSE-MsgGUID: mcxE6T68Qo21Uci5n8BzCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73672679"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73672679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 21:51:55 -0700
X-CSE-ConnectionGUID: Q8yffyLIR+GiTu5XHkTjew==
X-CSE-MsgGUID: 51ZWJWjAT8KtMQLk1CYyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="182216736"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2025 21:51:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Wye-0002Mp-0f;
	Tue, 14 Oct 2025 04:50:50 +0000
Date: Tue, 14 Oct 2025 12:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <202510141211.osWNR3ei-lkp@intel.com>
References: <20251013155205.2004838-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013155205.2004838-6-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Track-NMI-nesting-to-separate-per-CPU-counter/20251014-005451
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251013155205.2004838-6-lyude%40redhat.com
patch subject: [PATCH v13 05/17] irq & spin_lock: Add counted interrupt disabling/enabling
config: hexagon-randconfig-002-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141211.osWNR3ei-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141211.osWNR3ei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141211.osWNR3ei-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
>> include/linux/irqflags.h:277:3: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |                 raw_cpu_write(local_interrupt_disable_state.flags, flags);
         |                 ^
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^
   include/linux/percpu-defs.h:369:11: note: expanded from macro '__pcpu_size_call'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^
   <scratch space>:91:1: note: expanded from here
      91 | raw_cpu_write_1
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
>> include/linux/irqflags.h:277:3: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^
   include/linux/percpu-defs.h:370:11: note: expanded from macro '__pcpu_size_call'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^
   <scratch space>:92:1: note: expanded from here
      92 | raw_cpu_write_2
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
>> include/linux/irqflags.h:277:3: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^
   include/linux/percpu-defs.h:371:11: note: expanded from macro '__pcpu_size_call'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^
   <scratch space>:93:1: note: expanded from here
      93 | raw_cpu_write_4
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
>> include/linux/irqflags.h:277:3: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/percpu-defs.h:413:34: note: expanded from macro 'raw_cpu_write'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^
   include/linux/percpu-defs.h:372:11: note: expanded from macro '__pcpu_size_call'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^
   <scratch space>:94:1: note: expanded from here
      94 | raw_cpu_write_8
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
   include/linux/irqflags.h:290:11: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |                 flags = raw_cpu_read(local_interrupt_disable_state.flags);
         |                         ^
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^
   include/linux/percpu-defs.h:325:23: note: expanded from macro '__pcpu_size_call_return'
     325 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^
   <scratch space>:95:1: note: expanded from here
      95 | raw_cpu_read_1
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
   include/linux/irqflags.h:290:11: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^
   include/linux/percpu-defs.h:326:23: note: expanded from macro '__pcpu_size_call_return'
     326 |         case 2: pscr_ret__ = stem##2(variable); break;                  \
         |                              ^
   <scratch space>:96:1: note: expanded from here
      96 | raw_cpu_read_2
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:59:
   include/linux/irqflags.h:290:11: error: call to undeclared function 'raw_smp_processor_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^
   include/linux/percpu-defs.h:327:23: note: expanded from macro '__pcpu_size_call_return'
     327 |         case 4: pscr_ret__ = stem##4(variable); break;                  \
         |                              ^
   <scratch space>:97:1: note: expanded from here
      97 | raw_cpu_read_4
         | ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:246:2: note: expanded from macro 'raw_cpu_ptr'
     246 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^
   include/asm-generic/percpu.h:57:53: note: expanded from macro 'arch_raw_cpu_ptr'
      57 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^
   include/asm-generic/percpu.h:44:40: note: expanded from macro '__my_cpu_offset'
      44 | #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/sched/affinity.h:1:
   In file included from include/linux/sched.h:37:


vim +/raw_smp_processor_id +277 include/linux/irqflags.h

   267	
   268	static inline void local_interrupt_disable(void)
   269	{
   270		unsigned long flags;
   271		int new_count;
   272	
   273		new_count = hardirq_disable_enter();
   274	
   275		if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
   276			local_irq_save(flags);
 > 277			raw_cpu_write(local_interrupt_disable_state.flags, flags);
   278		}
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
