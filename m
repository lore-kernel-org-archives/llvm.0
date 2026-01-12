Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451322F5A23;
	Mon, 12 Jan 2026 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185072; cv=none; b=fLzFYGHUm47/2qxW/72JM9MOWUAhJmS1pTd8hCvRWIpYBqgIH8J5XRr+2GGXFqKaFAh4WdcphE4N/HUHa+TcZSLF/ZCPT1yXYRET+J/E7i8X93X1LKNc9VVOf2BaDvcLefXJJ3ZZEYd+gBlWS9//ijyMvCM78gEpBV9b7/1oefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185072; c=relaxed/simple;
	bh=hhZVXNdiDm27B6GL7CLn6BHevsMxpMVhs9ifBa3TKkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fGoQeu5/YkY/YMleJK6J4aPs01Q4W+75XhPt6eQL0k1J906eziSy3RMPsd2J4mrkwaAkUl8p51j3+XaVcjk3Q971+bQgBB502wZJPplrW4JguhLnrBqPHw5vMjBVz4pKBvLdnRn/OkrNL6G7Tqy0Gm/2cx+rT5kFskQaTEv92+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRC54ISO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRC54ISO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768185071; x=1799721071;
  h=date:from:to:cc:subject:message-id;
  bh=hhZVXNdiDm27B6GL7CLn6BHevsMxpMVhs9ifBa3TKkg=;
  b=HRC54ISOl6de4QndD0jwKB4/ISZwpKbIZbmal6BfTwKNXMoTAfQGs8P0
   nYNoPM7NOV4+ftTnebLNIP/DXpnafdYLhsSZ+6LX3dAOeCuLXk832x49e
   LxH9fs3oZKrkgKMsA7E6tQTJN7z07Gn9GkBQxW9Kjt2zmx1RDFGKLI+zo
   GbK2uYXu5P7k3eznSE+XGR7oM5DZjDSBwbvQCQmz+ydzgkbuiZ2VoPxI2
   xbDMNKvdzwMATcT30zDPKudFvW/kAmFe5zhzL13Vj79NJC0kFNG2vCweE
   6hvy3B2cYiC4e/Q6khsOCxFj0PNlzYlemLc4aZ1rtD+cbVoY8DYdpQG5b
   w==;
X-CSE-ConnectionGUID: wE5ObWBgRmanlNYs6L1A+g==
X-CSE-MsgGUID: 8K0oSjwOQ+m7UKcKW9zaEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="79751899"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="79751899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 18:31:10 -0800
X-CSE-ConnectionGUID: JUzlh+HjRN+X8GHN/ke1iQ==
X-CSE-MsgGUID: 3xy1FAL6TG6JmA54R1he4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204678201"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 18:30:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf7ha-00000000Csq-09QZ;
	Mon, 12 Jan 2026 02:30:42 +0000
Date: Mon, 12 Jan 2026 10:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 13/15]
 kernel/sched/cputime.c:481:65: error: call to undeclared function
 'vtime_enabled_this_cpu'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601121033.Q9ivcFQ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   dbfc29e2be8d36d0159dc4337c7362bf51c8da9f
commit: 68fe31b4f141a343ee788815606d24da6609cb86 [13/15] sched/cputime: Handle idle irqtime gracefully
config: riscv-randconfig-002-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121033.Q9ivcFQ9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121033.Q9ivcFQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121033.Q9ivcFQ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insb'
     108 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:57:
>> kernel/sched/cputime.c:481:65: error: call to undeclared function 'vtime_enabled_this_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     481 |         if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
         |                                                                        ^
   kernel/sched/cputime.c:489:65: error: call to undeclared function 'vtime_enabled_this_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     489 |         if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
         |                                                                        ^
   7 warnings and 2 errors generated.


vim +/vtime_enabled_this_cpu +481 kernel/sched/cputime.c

   476	
   477	void kcpustat_irq_enter(ktime_t now)
   478	{
   479		struct kernel_cpustat *kc = kcpustat_this_cpu;
   480	
 > 481		if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
   482			kcpustat_idle_stop(kc, now);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
