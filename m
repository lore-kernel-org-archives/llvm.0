Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD829C327;
	Fri, 11 Apr 2025 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744413550; cv=none; b=hkUnKb4M67UTYhiP6PZWSLm+srVjKRaT/OLAoPyemgUIYQW5QJ7cxry5IuT/V4/X7cS+sseRfKOdVn7uAmSoGg8hR96T7Hozre5dQd30nXCzoo9ZysP0LvqBEz0g1J6YH6YUSNuBkdcPcHXhxEm2V2SiP9LyyqUs7KIwuDMYFMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744413550; c=relaxed/simple;
	bh=264yTgqYFYsTnayIvZxA9PowdaySNc+1/BvGa+X4k3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4Mw5OoLpob74mieYAI6qleBYDTuZH3/Ia8Kh1rskWmESXD7TdVns5OPns38Wl8wqmsp9j3De1UZxuqtIcIqpLWnvhlpYm7MNAyDioEpxeWBonF8Us50edP0EQJbiXdwbbIDxrypCSt/UkozSvRy8HEwOelIY0B4nI0PeAYZBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6ryFknR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6ryFknR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744413549; x=1775949549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=264yTgqYFYsTnayIvZxA9PowdaySNc+1/BvGa+X4k3w=;
  b=j6ryFknRTyQTJRkdP0Tt+eSSuNieE3ypefLnI1s1e3QQxsMSm5cxYp8G
   efY2AiO5cMoot2o66rcOb5hLrx86X+sOWzVybxwn5jdzOtkmdqFttAnKg
   xovdpwpQBZUlKt3VAOOZeS4D+IU5prHUguAySBFsHyc1rw1sPckmPqa3g
   fh415WzPVD39PleUI4XamvbJcBd96ZhvvoDgpBkNEFMQEQ/Yd9foFvRqw
   DETrwJ62RGAoKpQgIjqrVnvwoZpSEtX18/1Gi/rSHiiwwzqyVz/e26w6v
   o7uCzv/xr1ZPrSzExaeg7OskKEunsScAzEfOxXLMd/FxZSOucKvUALn/w
   w==;
X-CSE-ConnectionGUID: 8G9xfyhkTbOgUvmR7Xs7PA==
X-CSE-MsgGUID: 152zOlfXSBuZ0znDiY4v5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56637697"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="56637697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 16:19:06 -0700
X-CSE-ConnectionGUID: GZ8M3ct3Ty6f5W5gdC2YRQ==
X-CSE-MsgGUID: nmGWPGKURMGiMlubngQ82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134408412"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 16:19:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3NeI-000BQq-2h;
	Fri, 11 Apr 2025 23:19:02 +0000
Date: Sat, 12 Apr 2025 07:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] memcg: decouple memcg_hotplug_cpu_dead from stock_lock
Message-ID: <202504120759.hMxys5DQ-lkp@intel.com>
References: <20250410210623.1016767-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410210623.1016767-1-shakeel.butt@linux.dev>

Hi Shakeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to linus/master v6.15-rc1 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shakeel-Butt/memcg-decouple-memcg_hotplug_cpu_dead-from-stock_lock/20250411-050829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250410210623.1016767-1-shakeel.butt%40linux.dev
patch subject: [PATCH] memcg: decouple memcg_hotplug_cpu_dead from stock_lock
config: i386-buildonly-randconfig-002-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120759.hMxys5DQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120759.hMxys5DQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120759.hMxys5DQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:216:22: note: expanded from macro 'local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                                    ^
   include/linux/irqflags.h:172:28: note: expanded from macro 'raw_local_irq_save'
     172 |                 typecheck(unsigned long, flags);        \
         |                                          ^
   include/linux/typecheck.h:11:9: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:216:22: note: expanded from macro 'local_irq_save'
     216 |                 raw_local_irq_save(flags);              \
         |                                    ^
   include/linux/irqflags.h:173:3: note: expanded from macro 'raw_local_irq_save'
     173 |                 flags = arch_local_irq_save();          \
         |                 ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:217:32: note: expanded from macro 'local_irq_save'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:188:28: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                                          ^
   include/linux/typecheck.h:11:9: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:217:32: note: expanded from macro 'local_irq_save'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:189:28: note: expanded from macro 'raw_irqs_disabled_flags'
     189 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:217:32: note: expanded from macro 'local_irq_save'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:188:28: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                                          ^
   include/linux/typecheck.h:11:9: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:217:32: note: expanded from macro 'local_irq_save'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:189:28: note: expanded from macro 'raw_irqs_disabled_flags'
     189 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:217:32: note: expanded from macro 'local_irq_save'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:188:28: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                                          ^
   include/linux/typecheck.h:11:9: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
>> mm/memcontrol.c:1967:17: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1967 |         local_irq_save(flag);
         |                        ^~~~
         |                        flags
   include/linux/irqflags.h:217:32: note: expanded from macro 'local_irq_save'
     217 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:189:28: note: expanded from macro 'raw_irqs_disabled_flags'
     189 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
   mm/memcontrol.c:1970:20: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1970 |         local_irq_restore(flag);
         |                           ^~~~
         |                           flags
   include/linux/irqflags.h:223:32: note: expanded from macro 'local_irq_restore'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:188:28: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                                          ^
   include/linux/typecheck.h:11:9: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
   mm/memcontrol.c:1970:20: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1970 |         local_irq_restore(flag);
         |                           ^~~~
         |                           flags
   include/linux/irqflags.h:223:32: note: expanded from macro 'local_irq_restore'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:189:28: note: expanded from macro 'raw_irqs_disabled_flags'
     189 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
   mm/memcontrol.c:1970:20: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1970 |         local_irq_restore(flag);
         |                           ^~~~
         |                           flags
   include/linux/irqflags.h:223:32: note: expanded from macro 'local_irq_restore'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:188:28: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                                          ^
   include/linux/typecheck.h:11:9: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^
   mm/memcontrol.c:1963:16: note: 'flags' declared here
    1963 |         unsigned long flags;
         |                       ^
   mm/memcontrol.c:1970:20: error: use of undeclared identifier 'flag'; did you mean 'flags'?
    1970 |         local_irq_restore(flag);
         |                           ^~~~
         |                           flags
   include/linux/irqflags.h:223:32: note: expanded from macro 'local_irq_restore'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^
   include/linux/irqflags.h:189:28: note: expanded from macro 'raw_irqs_disabled_flags'
     189 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^


vim +1967 mm/memcontrol.c

  1959	
  1960	static int memcg_hotplug_cpu_dead(unsigned int cpu)
  1961	{
  1962		struct memcg_stock_pcp *stock;
  1963		unsigned long flags;
  1964	
  1965		stock = &per_cpu(memcg_stock, cpu);
  1966	
> 1967		local_irq_save(flag);
  1968		/* stock of a remote dead cpu, no need for stock_lock. */
  1969		__drain_obj_stock(stock);
  1970		local_irq_restore(flag);
  1971	
  1972		drain_stock(stock);
  1973	
  1974		return 0;
  1975	}
  1976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
