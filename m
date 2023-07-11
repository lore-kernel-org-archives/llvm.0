Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DA1EA7B;
	Tue, 11 Jul 2023 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689110185; x=1720646185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkqPYZDXj+CG1SEzHQqOovvBVIME631DUyZQNJKb23M=;
  b=JGKcTAfq7NW3Xw2L1JE/jc9Bnmcb8JUs95TjBMktNT9Q3nF7ICcVtF+k
   KeA8+dH4sO2vPBHvNaqlCYztl+u7Ay+HcumWDiGF/2sIcE70ZqImLUhih
   hW8Y8oyFs130t6qTLPDLRGPGceqitx2zfPPEGltnjY+WwnFGVe0h1qIeE
   npqxBEr86A5BS7NovVoGXoBKNUbcLrhrZzyCtF7bGyU1BXwoJQqNgQ+gr
   ZdV25hlWPvZEP39GT6udiSkjFt9h8IvHXz9EudJet9MrQ24tLd60Fk3+8
   8JZ05e8lfoDuDzitc8NUC1X+AboON+Vg1gI2q9EWKqa/QQtYJrJH7F95V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362205511"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="362205511"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 14:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="865860969"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="865860969"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2023 14:16:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJKia-000581-3D;
	Tue, 11 Jul 2023 21:16:21 +0000
Date: Wed, 12 Jul 2023 05:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.4 10/13] fs/waitfd.c:94:29: warning:
 '__unused__' attribute ignored when parsing type
Message-ID: <202307120541.cDjZWmwX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
config: hexagon-randconfig-r045-20230711 (https://download.01.org/0day-ci/archive/20230712/202307120541.cDjZWmwX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120541.cDjZWmwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120541.cDjZWmwX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/waitfd.c:20:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/waitfd.c:20:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/waitfd.c:20:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:36: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:57: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:36: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:57: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:36: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:57: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:36: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:123:57: note: expanded from macro '__TYPE_IS_LL'
     123 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:117:31: note: expanded from macro '__MAP'
     117 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                               ^~~~~~~~~~~
   include/linux/syscalls.h:114:29: note: expanded from macro '__MAP4'
     114 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                             ^
   include/linux/syscalls.h:125:34: note: expanded from macro '__SC_CAST'
     125 | #define __SC_CAST(t, a) (__force t) a
         |                                  ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:112:44: note: expanded from macro '__MAP2'
     112 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/syscalls.h:111:29: note: expanded from macro '__MAP1'
     111 | #define __MAP1(m,t,a,...) m(t,a)
         |                             ^
   include/linux/syscalls.h:125:34: note: expanded from macro '__SC_CAST'
     125 | #define __SC_CAST(t, a) (__force t) a
         |                                  ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
>> fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:114:29: note: expanded from macro '__MAP4'
     114 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                             ^
   include/linux/syscalls.h:127:76: note: expanded from macro '__SC_TEST'
     127 | #define __SC_TEST(t, a) (void)BUILD_BUG_ON_ZERO(!__TYPE_IS_LL(t) && sizeof(t) > sizeof(long))
         |                                                                            ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 8 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 8 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:120:46: note: expanded from macro '__TYPE_AS'
     120 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:56: note: expanded from macro '__maybe_unused'
     313 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:220:64: note: expanded from macro 'SYSCALL_DEFINE4'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:228:30: note: expanded from macro 'SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:111:29: note: expanded from macro '__MAP1'
     111 | #define __MAP1(m,t,a,...) m(t,a)
         |                             ^
   include/linux/syscalls.h:127:76: note: expanded from macro '__SC_TEST'
     127 | #define __SC_TEST(t, a) (void)BUILD_BUG_ON_ZERO(!__TYPE_IS_LL(t) && sizeof(t) > sizeof(long))
         |                                                                            ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   22 warnings generated.


vim +/__unused__ +94 fs/waitfd.c

    93	
  > 94	SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
