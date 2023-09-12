Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666B8F68;
	Tue, 12 Sep 2023 19:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694547799; x=1726083799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0q2btaYCHAKDpyCQnckruVLTYh2CkRB95pt+KEYfPM=;
  b=bXb//uPRGx8h2c4sl/R/w9FazLbhjIiMJVT1Wzpc9OZfIMu5lbmOlqHt
   vH8Q7c1U4mtlAECyKNJbMcJHSV2l1vxvy3jorDkssF0kXuat88tabQ1C9
   vFsaQY/F3PaQ5OQBjmyLur7Z7cPTSP6n/6NZDjYS7ejtFPKHdcO8CTWXf
   hIC3t+dsZRBkuXCxpVM+nzz0CkFEhRTQ6YDJbFXn0JXpPDe6BgXIoZHuW
   BIWCX32ahD++7nM7cPDnkILpY2xPSKZYniqCRlRGvCrvyehLhom3Bo9It
   UX+8oQ34nVXXM2NBwJLcRqZOKIKtonNPmideaJZcV7VQg4nswoONTrCDk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381175879"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="381175879"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 12:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720533227"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="720533227"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2023 12:43:16 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg9I2-0000CF-2V;
	Tue, 12 Sep 2023 19:43:14 +0000
Date: Wed, 13 Sep 2023 03:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 33/74] drivers/tty/serial/lpc32xx_hs.c:143:47:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202309130357.GnZhHaHC-lkp@intel.com>
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
commit: 27376ad58c12a093ceb233c7bfbd432845972140 [33/74] serial: lpc32xx_hs: Use port lock wrappers
config: x86_64-buildonly-randconfig-002-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130357.GnZhHaHC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130357.GnZhHaHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130357.GnZhHaHC-lkp@intel.com/

All errors (new ones prefixed by >>):

           (void)(&__dummy == &__dummy2); \
                  ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/serial/lpc32xx_hs.c:19:
   include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
           return spin_trylock_irqsave(&up->lock, flags);
                                                  ^~~~~
                                                  *
   include/linux/spinlock.h:421:49: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
                                                          ^~~~~
   include/linux/spinlock.h:298:17: note: expanded from macro 'raw_spin_trylock_irqsave'
           local_irq_save(flags); \
                          ^~~~~
   include/linux/irqflags.h:223:32: note: expanded from macro 'local_irq_save'
                   if (!raw_irqs_disabled_flags(flags))    \
                                                ^~~~~
   include/linux/irqflags.h:195:28: note: expanded from macro 'raw_irqs_disabled_flags'
                   arch_irqs_disabled_flags(flags);        \
                                            ^~~~~
   arch/x86/include/asm/irqflags.h:120:67: note: passing argument to parameter 'flags' here
   static __always_inline int arch_irqs_disabled_flags(unsigned long flags)
                                                                     ^
   In file included from drivers/tty/serial/lpc32xx_hs.c:19:
   include/linux/serial_core.h:639:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
           return spin_trylock_irqsave(&up->lock, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:9: note: expanded from macro 'raw_spin_trylock_irqsave'
           1 : ({ local_irq_restore(flags); 0; }); \
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:229:8: note: expanded from macro 'local_irq_restore'
                   if (!raw_irqs_disabled_flags(flags))    \
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:194:3: note: expanded from macro 'raw_irqs_disabled_flags'
                   typecheck(unsigned long, flags);        \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
           (void)(&__dummy == &__dummy2); \
                  ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/serial/lpc32xx_hs.c:19:
   include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
           return spin_trylock_irqsave(&up->lock, flags);
                                                  ^~~~~
                                                  *
   include/linux/spinlock.h:421:49: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
                                                          ^~~~~
   include/linux/spinlock.h:300:27: note: expanded from macro 'raw_spin_trylock_irqsave'
           1 : ({ local_irq_restore(flags); 0; }); \
                                    ^~~~~
   include/linux/irqflags.h:229:32: note: expanded from macro 'local_irq_restore'
                   if (!raw_irqs_disabled_flags(flags))    \
                                                ^~~~~
   include/linux/irqflags.h:195:28: note: expanded from macro 'raw_irqs_disabled_flags'
                   arch_irqs_disabled_flags(flags);        \
                                            ^~~~~
   arch/x86/include/asm/irqflags.h:120:67: note: passing argument to parameter 'flags' here
   static __always_inline int arch_irqs_disabled_flags(unsigned long flags)
                                                                     ^
   In file included from drivers/tty/serial/lpc32xx_hs.c:19:
   include/linux/serial_core.h:639:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
           return spin_trylock_irqsave(&up->lock, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:9: note: expanded from macro 'raw_spin_trylock_irqsave'
           1 : ({ local_irq_restore(flags); 0; }); \
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:231:3: note: expanded from macro 'local_irq_restore'
                   raw_local_irq_restore(flags);           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:183:3: note: expanded from macro 'raw_local_irq_restore'
                   typecheck(unsigned long, flags);        \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
           (void)(&__dummy == &__dummy2); \
                  ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/serial/lpc32xx_hs.c:19:
   include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
           return spin_trylock_irqsave(&up->lock, flags);
                                                  ^~~~~
                                                  *
   include/linux/spinlock.h:421:49: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
                                                          ^~~~~
   include/linux/spinlock.h:300:27: note: expanded from macro 'raw_spin_trylock_irqsave'
           1 : ({ local_irq_restore(flags); 0; }); \
                                    ^~~~~
   include/linux/irqflags.h:231:25: note: expanded from macro 'local_irq_restore'
                   raw_local_irq_restore(flags);           \
                                         ^~~~~
   include/linux/irqflags.h:185:26: note: expanded from macro 'raw_local_irq_restore'
                   arch_local_irq_restore(flags);          \
                                          ^~~~~
   arch/x86/include/asm/irqflags.h:132:66: note: passing argument to parameter 'flags' here
   static __always_inline void arch_local_irq_restore(unsigned long flags)
                                                                    ^
>> drivers/tty/serial/lpc32xx_hs.c:143:47: error: too few arguments to function call, expected 2, have 1
                   locked = uart_port_trylock_irqsave(&up->port);
                            ~~~~~~~~~~~~~~~~~~~~~~~~~          ^
   include/linux/serial_core.h:637:20: note: 'uart_port_trylock_irqsave' declared here
   static inline bool uart_port_trylock_irqsave(struct uart_port *up, unsigned long *flags)
                      ^
   5 warnings and 6 errors generated.


vim +143 drivers/tty/serial/lpc32xx_hs.c

   130	
   131	static void lpc32xx_hsuart_console_write(struct console *co, const char *s,
   132						 unsigned int count)
   133	{
   134		struct lpc32xx_hsuart_port *up = &lpc32xx_hs_ports[co->index];
   135		unsigned long flags;
   136		int locked = 1;
   137	
   138		touch_nmi_watchdog();
   139		local_irq_save(flags);
   140		if (up->port.sysrq)
   141			locked = 0;
   142		else if (oops_in_progress)
 > 143			locked = uart_port_trylock_irqsave(&up->port);
   144		else
   145			uart_port_lock(&up->port);
   146	
   147		uart_console_write(&up->port, s, count, lpc32xx_hsuart_console_putchar);
   148		wait_for_xmit_empty(&up->port);
   149	
   150		if (locked)
   151			uart_port_unlock(&up->port);
   152		local_irq_restore(flags);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
