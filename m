Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC0AD49;
	Tue, 12 Sep 2023 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694533514; x=1726069514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAfWgFdVAfYhSmCX1cTWCZbhzdmxdfEVFf0WxAoFADg=;
  b=IGc1pnHoxqkTlgMk2rxYxBoAEV4b/FdmFP03QFATrVK4h1lU8sTRQTZj
   yMBHBGuRzqYgZL1GzKiaA64M5CgVqr3Bks/RM2RGwEmc5/2IoacTFOmqW
   kUooQ5ffRX6fk++ntx/gxEvBx3ewXTbMTNf06w2hbZe64SW1si0VPnU4S
   syyrsci14be/caO8AcD/5b3DrLFMZHmfKzm4r+BDw67a3mQwVZovx7G1g
   XNdyKUC10jgPBxwCZXFI9kk5NYSLGs8NNQZvh2O1NIh1NTLUpUDjwRXi+
   CANf1BW4zQKpEvGtTcanLTsAupj/DDkRuzs8A4Z/V1f07OsnK9/dhHDwT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357845811"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="357845811"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 08:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743762946"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="743762946"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 08:45:11 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg5XQ-00007w-39;
	Tue, 12 Sep 2023 15:43:44 +0000
Date: Tue, 12 Sep 2023 23:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 1/74] include/linux/serial_core.h:616:2: error:
 incompatible integer to pointer conversion assigning to 'unsigned long *'
 from 'unsigned long'
Message-ID: <202309122312.lRVq9AHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git serial
head:   75adfb6dc779d7c86a2e31b3ca6b266b8a8ef854
commit: 7887baec9d85468ea43d70b614fc3f51f7206793 [1/74] serial: core: Provide port lock wrappers
config: um-randconfig-r011-20230912 (https://download.01.org/0day-ci/archive/20230912/202309122312.lRVq9AHw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122312.lRVq9AHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122312.lRVq9AHw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/tty/hvc/hvc_console.c:15:
   In file included from include/linux/kbd_kern.h:5:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/tty/hvc/hvc_console.c:15:
   In file included from include/linux/kbd_kern.h:5:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/tty/hvc/hvc_console.c:15:
   In file included from include/linux/kbd_kern.h:5:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from drivers/tty/hvc/hvc_console.c:29:
>> include/linux/serial_core.h:616:2: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
           spin_lock_irqsave(&up->lock, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:381:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:243:3: note: expanded from macro 'raw_spin_lock_irqsave'
                   typecheck(unsigned long, flags);        \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
           (void)(&__dummy == &__dummy2); \
                  ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/hvc/hvc_console.c:29:
>> include/linux/serial_core.h:616:2: error: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'unsigned long' [-Wint-conversion]
           spin_lock_irqsave(&up->lock, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:381:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:244:9: note: expanded from macro 'raw_spin_lock_irqsave'
                   flags = _raw_spin_lock_irqsave(lock);   \
                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/tty/hvc/hvc_console.c:29:
   include/linux/serial_core.h:639:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
           return spin_trylock_irqsave(&up->lock, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:2: note: expanded from macro 'raw_spin_trylock_irqsave'
           local_irq_save(flags); \
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:222:3: note: expanded from macro 'local_irq_save'
                   raw_local_irq_save(flags);              \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:178:3: note: expanded from macro 'raw_local_irq_save'
                   typecheck(unsigned long, flags);        \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
           (void)(&__dummy == &__dummy2); \
                  ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/hvc/hvc_console.c:29:
   include/linux/serial_core.h:639:9: error: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'unsigned long' [-Wint-conversion]
           return spin_trylock_irqsave(&up->lock, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:2: note: expanded from macro 'raw_spin_trylock_irqsave'
           local_irq_save(flags); \
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:222:3: note: expanded from macro 'local_irq_save'
                   raw_local_irq_save(flags);              \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:179:9: note: expanded from macro 'raw_local_irq_save'
                   flags = arch_local_irq_save();          \
                         ^ ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/tty/hvc/hvc_console.c:29:
   include/linux/serial_core.h:639:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (flags) *' (aka 'unsigned long **')) [-Wcompare-distinct-pointer-types]
           return spin_trylock_irqsave(&up->lock, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:2: note: expanded from macro 'spin_trylock_irqsave'
           raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:2: note: expanded from macro 'raw_spin_trylock_irqsave'
           local_irq_save(flags); \
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:223:8: note: expanded from macro 'local_irq_save'
                   if (!raw_irqs_disabled_flags(flags))    \
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:194:3: note: expanded from macro 'raw_irqs_disabled_flags'
                   typecheck(unsigned long, flags);        \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
           (void)(&__dummy == &__dummy2); \
                  ~~~~~~~~ ^  ~~~~~~~~~
   In file included from drivers/tty/hvc/hvc_console.c:29:
>> include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
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
   include/asm-generic/irqflags.h:37:58: note: passing argument to parameter 'flags' here
   static inline int arch_irqs_disabled_flags(unsigned long flags)
                                                            ^
   In file included from drivers/tty/hvc/hvc_console.c:29:
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
   In file included from drivers/tty/hvc/hvc_console.c:29:
>> include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
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
   include/asm-generic/irqflags.h:37:58: note: passing argument to parameter 'flags' here
   static inline int arch_irqs_disabled_flags(unsigned long flags)
                                                            ^
   In file included from drivers/tty/hvc/hvc_console.c:29:
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
   In file included from drivers/tty/hvc/hvc_console.c:29:
>> include/linux/serial_core.h:639:41: error: incompatible pointer to integer conversion passing 'unsigned long *' to parameter of type 'unsigned long'; dereference with * [-Wint-conversion]
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
   arch/um/include/asm/irqflags.h:17:57: note: passing argument to parameter 'flags' here
   static inline void arch_local_irq_restore(unsigned long flags)
                                                           ^
   17 warnings and 5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV7670
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_CAFE_CCIC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && PCI [=y] && I2C [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]


vim +616 include/linux/serial_core.h

   608	
   609	/**
   610	 * uart_port_lock_irqsave - Lock the UART port, save and disable interrupts
   611	 * @up:		Pointer to UART port structure
   612	 * @flags:	Pointer to interrupt flags storage
   613	 */
   614	static inline void uart_port_lock_irqsave(struct uart_port *up, unsigned long *flags)
   615	{
 > 616		spin_lock_irqsave(&up->lock, flags);
   617	}
   618	
   619	/**
   620	 * uart_port_trylock - Try to lock the UART port
   621	 * @up:		Pointer to UART port structure
   622	 *
   623	 * Returns: True if lock was acquired, false otherwise
   624	 */
   625	static inline bool uart_port_trylock(struct uart_port *up)
   626	{
   627		return spin_trylock(&up->lock);
   628	}
   629	
   630	/**
   631	 * uart_port_trylock_irqsave - Try to lock the UART port, save and disable interrupts
   632	 * @up:		Pointer to UART port structure
   633	 * @flags:	Pointer to interrupt flags storage
   634	 *
   635	 * Returns: True if lock was acquired, false otherwise
   636	 */
   637	static inline bool uart_port_trylock_irqsave(struct uart_port *up, unsigned long *flags)
   638	{
 > 639		return spin_trylock_irqsave(&up->lock, flags);
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
