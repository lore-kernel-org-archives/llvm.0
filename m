Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B8A5C;
	Tue, 12 Sep 2023 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694542115; x=1726078115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6yNigstiY780CyDhxKzdcwcrOeTsjLeMc/f+b7IhLc=;
  b=OsVLuqvIs0SlFQbpAX/ZwBaY1UymQE9H9PxhjH9nOrj0H/yJGdfwX1qm
   O3DdmIHN/Hk9yB5ULEp77EC/SZXBHxeDjAMq6hXolrb3bxLOnbbIWdAA8
   8uaX++nCGZmrmiFdYonKG9hU8C4owm0L8Fz3g88a8bcT6qZamxqYtM0Ox
   VP9hBeHqAlbE1rSfI6Zyyt0ERbgfVMCvHySdWkN8arTl6ermAcsTsy5Vl
   V4K6sDblRXuFLQsY6MBoeN2YTo9bfCwYJTQ8JMdsXJ/ETM2aZheCuBsZf
   w7QqEAU/QAgTzVdp7GDKbqvZtgUGX3+ww6bn4pqdfq1OpjHza+eZhycB/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377369268"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377369268"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778900246"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778900246"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 11:08:32 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg7oI-00005Y-0q;
	Tue, 12 Sep 2023 18:08:27 +0000
Date: Wed, 13 Sep 2023 02:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 66/74] drivers/tty/serial/sunplus-uart.c:520:77:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202309130221.R243EQjR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git serial
head:   75adfb6dc779d7c86a2e31b3ca6b266b8a8ef854
commit: 058734f3427903c0908ccc406a41babd0d4b2e5d [66/74] serial: sunplus-uart: Use port lock wrappers
config: hexagon-randconfig-r022-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130221.R243EQjR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130221.R243EQjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130221.R243EQjR-lkp@intel.com/

All errors (new ones prefixed by >>):

      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/serial/sunplus-uart.c:29:
   include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                *
   include/linux/spinlock.h:421:49: note: expanded from macro 'spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |                                                        ^~~~~
   include/linux/spinlock.h:298:17: note: expanded from macro 'raw_spin_trylock_irqsave'
     298 |         local_irq_save(flags); \
         |                        ^~~~~
   include/linux/irqflags.h:223:32: note: expanded from macro 'local_irq_save'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^~~~~
   include/linux/irqflags.h:195:28: note: expanded from macro 'raw_irqs_disabled_flags'
     195 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^~~~~
   arch/hexagon/include/asm/irqflags.h:24:59: note: passing argument to parameter 'flags' here
      24 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |                                                           ^
   In file included from drivers/tty/serial/sunplus-uart.c:29:
   include/linux/serial_core.h:639:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:9: note: expanded from macro 'raw_spin_trylock_irqsave'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:229:8: note: expanded from macro 'local_irq_restore'
     229 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:194:3: note: expanded from macro 'raw_irqs_disabled_flags'
     194 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/serial/sunplus-uart.c:29:
   include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                *
   include/linux/spinlock.h:421:49: note: expanded from macro 'spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |                                                        ^~~~~
   include/linux/spinlock.h:300:27: note: expanded from macro 'raw_spin_trylock_irqsave'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                                  ^~~~~
   include/linux/irqflags.h:229:32: note: expanded from macro 'local_irq_restore'
     229 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                                              ^~~~~
   include/linux/irqflags.h:195:28: note: expanded from macro 'raw_irqs_disabled_flags'
     195 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^~~~~
   arch/hexagon/include/asm/irqflags.h:24:59: note: passing argument to parameter 'flags' here
      24 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |                                                           ^
   In file included from drivers/tty/serial/sunplus-uart.c:29:
   include/linux/serial_core.h:639:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:9: note: expanded from macro 'raw_spin_trylock_irqsave'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:231:3: note: expanded from macro 'local_irq_restore'
     231 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:183:3: note: expanded from macro 'raw_local_irq_restore'
     183 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/serial/sunplus-uart.c:29:
   include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                *
   include/linux/spinlock.h:421:49: note: expanded from macro 'spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |                                                        ^~~~~
   include/linux/spinlock.h:300:27: note: expanded from macro 'raw_spin_trylock_irqsave'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                                  ^~~~~
   include/linux/irqflags.h:231:25: note: expanded from macro 'local_irq_restore'
     231 |                 raw_local_irq_restore(flags);           \
         |                                       ^~~~~
   include/linux/irqflags.h:185:26: note: expanded from macro 'raw_local_irq_restore'
     185 |                 arch_local_irq_restore(flags);          \
         |                                        ^~~~~
   arch/hexagon/include/asm/irqflags.h:44:57: note: passing argument to parameter 'flags' here
      44 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                                         ^
>> drivers/tty/serial/sunplus-uart.c:520:77: error: too few arguments to function call, expected 2, have 1
     520 |                 locked = uart_port_trylock_irqsave(&sunplus_console_ports[co->index]->port);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~                                        ^
   include/linux/serial_core.h:637:20: note: 'uart_port_trylock_irqsave' declared here
     637 | static inline bool uart_port_trylock_irqsave(struct uart_port *up, unsigned long *flags)
         |                    ^
   11 warnings and 6 errors generated.


vim +520 drivers/tty/serial/sunplus-uart.c

   507	
   508	static void sunplus_console_write(struct console *co,
   509					  const char *s,
   510					  unsigned int count)
   511	{
   512		unsigned long flags;
   513		int locked = 1;
   514	
   515		local_irq_save(flags);
   516	
   517		if (sunplus_console_ports[co->index]->port.sysrq)
   518			locked = 0;
   519		else if (oops_in_progress)
 > 520			locked = uart_port_trylock_irqsave(&sunplus_console_ports[co->index]->port);
   521		else
   522			uart_port_lock(&sunplus_console_ports[co->index]->port);
   523	
   524		uart_console_write(&sunplus_console_ports[co->index]->port, s, count,
   525				   sunplus_uart_console_putchar);
   526	
   527		if (locked)
   528			uart_port_unlock(&sunplus_console_ports[co->index]->port);
   529	
   530		local_irq_restore(flags);
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
