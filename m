Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896317C;
	Thu, 13 Jul 2023 02:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689216417; x=1720752417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlZMlYIEpV5CkWSc2dUuxoY6EWdDbJZl8Uzzqm1eoJA=;
  b=E9aAgTF7tVuDgN75mkILomS21i8+LmRTBiYwFGtt/fpunzfwj9FDkl6U
   lWX9cS4K/OrPEDUmRKyHbIn38TsDRO7BQO7kyXbFJ4tKUwwh6lY1GIxk9
   5rBe+Aaa5TU+xgC+OQsw+vki2mNeSo/O0EDwKV4An4FTNhw7N2momBuRA
   OKMwyBaZpEKrYypALOIyipSkq8UW6P64gbmRifV3h2dou0cAEETSPX00q
   UvVJDlkJfQkzBMXtMnThylFGt59H3s06tUCS32GL4aObecmf3zAEpYNRd
   Ci1ns5QLv31GKhMkZL9suw2yzlbt2UwUBSMCit4PNX7IPFzGc+wYhYDEO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431215836"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="431215836"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 19:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725124537"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="725124537"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 19:46:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJmLf-00069V-05;
	Thu, 13 Jul 2023 02:46:31 +0000
Date: Thu, 13 Jul 2023 10:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/defer-free 1/2] include/linux/poll.h:140:27: warning:
 division by zero is undefined
Message-ID: <202307131054.q7toWpSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux net/defer-free
head:   bc14c0e28995a8d2a7c5c481a90973553861cbe2
commit: c3205b3c22a6b7d0147dd98c1c0a4888436efe73 [1/2] net/core: lockless defer free
config: mips-ath25_defconfig (https://download.01.org/0day-ci/archive/20230713/202307131054.q7toWpSY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131054.q7toWpSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131054.q7toWpSY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:19:
   include/linux/netdevice.h:3196:2: error: unknown type name 'u128'
    3196 |         u128    full;
         |         ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:22:
   In file included from include/net/sock.h:60:
>> include/linux/poll.h:140:27: warning: division by zero is undefined [-Wdivision-by-zero]
     140 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
     138 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
     124 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:140:39: warning: division by zero is undefined [-Wdivision-by-zero]
     140 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
     138 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
     124 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from net/core/skbuff.c:45:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:3196:2: error: unknown type name 'u128'
    3196 |         u128    full;
         |         ^
   In file included from net/core/skbuff.c:45:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:60:
>> include/linux/poll.h:140:27: warning: division by zero is undefined [-Wdivision-by-zero]
     140 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
     138 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
     124 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:140:39: warning: division by zero is undefined [-Wdivision-by-zero]
     140 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
     138 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
     124 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   net/core/skbuff.c:6752:12: error: expected ';' at end of declaration
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:325:41: note: expanded from macro 'raw_try_cmpxchg128'
     325 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                                ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:2: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |         ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'; did you mean '___pa'?
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:327:15: note: expanded from macro 'raw_try_cmpxchg128'
     327 |         if (unlikely(___r != ___o)) \
         |                      ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___o'; did you mean '___pa'?
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:327:23: note: expanded from macro 'raw_try_cmpxchg128'
     327 |         if (unlikely(___r != ___o)) \
         |                              ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'; did you mean '___pa'?
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:328:12: note: expanded from macro 'raw_try_cmpxchg128'
     328 |                 *___op = ___r; \
         |                          ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___r'; did you mean '___pa'?
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:329:9: note: expanded from macro 'raw_try_cmpxchg128'
     329 |         likely(___r == ___o); \
         |                ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/skbuff.c:6752:12: error: use of undeclared identifier '___o'; did you mean '___pa'?
    6752 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:329:17: note: expanded from macro 'raw_try_cmpxchg128'
     329 |         likely(___r == ___o); \
         |                        ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   2 warnings and 8 errors generated.
--
   In file included from net/core/dev.c:90:
   include/linux/netdevice.h:3196:2: error: unknown type name 'u128'
    3196 |         u128    full;
         |         ^
   In file included from net/core/dev.c:98:
   In file included from include/net/sock.h:60:
>> include/linux/poll.h:140:27: warning: division by zero is undefined [-Wdivision-by-zero]
     140 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
     138 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
     124 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:140:39: warning: division by zero is undefined [-Wdivision-by-zero]
     140 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:138:32: note: expanded from macro 'M'
     138 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:124:51: note: expanded from macro '__MAP'
     124 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   net/core/dev.c:6570:6: error: invalid argument type 'void' to unary expression
    6570 |         if (!READ_ONCE(sd->defer.list))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6574:10: error: expected ';' at end of declaration
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:325:41: note: expanded from macro 'raw_try_cmpxchg128'
     325 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                                ^
   net/core/dev.c:6574:10: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:2: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |         ^
   net/core/dev.c:6574:10: error: use of undeclared identifier '___r'; did you mean '___pa'?
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:327:15: note: expanded from macro 'raw_try_cmpxchg128'
     327 |         if (unlikely(___r != ___o)) \
         |                      ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/dev.c:6574:10: error: use of undeclared identifier '___o'; did you mean '___pa'?
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:327:23: note: expanded from macro 'raw_try_cmpxchg128'
     327 |         if (unlikely(___r != ___o)) \
         |                              ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/dev.c:6574:10: error: use of undeclared identifier '___r'; did you mean '___pa'?
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:328:12: note: expanded from macro 'raw_try_cmpxchg128'
     328 |                 *___op = ___r; \
         |                          ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/dev.c:6574:10: error: use of undeclared identifier '___r'; did you mean '___pa'?
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:329:9: note: expanded from macro 'raw_try_cmpxchg128'
     329 |         likely(___r == ___o); \
         |                ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   net/core/dev.c:6574:10: error: use of undeclared identifier '___o'; did you mean '___pa'?
    6574 |         while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full)) {}
         |                 ^
   include/linux/atomic/atomic-instrumented.h:4914:2: note: expanded from macro 'try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:329:17: note: expanded from macro 'raw_try_cmpxchg128'
     329 |         likely(___r == ___o); \
         |                        ^
   arch/mips/include/asm/page.h:171:29: note: '___pa' declared here
     171 | static inline unsigned long ___pa(unsigned long x)
         |                             ^
   2 warnings and 9 errors generated.


vim +140 include/linux/poll.h

7a163b2195cda0 Al Viro 2018-02-01  135  
7a163b2195cda0 Al Viro 2018-02-01  136  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0 Al Viro 2018-02-01  137  {
7a163b2195cda0 Al Viro 2018-02-01  138  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0 Al Viro 2018-02-01  139  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0 Al Viro 2018-02-01 @140  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0 Al Viro 2018-02-01  141  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0 Al Viro 2018-02-01  142  #undef M
7a163b2195cda0 Al Viro 2018-02-01  143  }
7a163b2195cda0 Al Viro 2018-02-01  144  #undef __MAP
7a163b2195cda0 Al Viro 2018-02-01  145  
7a163b2195cda0 Al Viro 2018-02-01  146  

:::::: The code at line 140 was first introduced by commit
:::::: 7a163b2195cda0cddf47b5caf14a7229d4e2bea3 unify {de,}mangle_poll(), get rid of kernel-side POLL...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
