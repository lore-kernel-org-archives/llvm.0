Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E61094E;
	Wed,  6 Sep 2023 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694022905; x=1725558905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1h9zZPwVqKLJZyN5pX1WMd4v/YvzjQVLqpdiSYUz+c=;
  b=DiL+Wi1B4phX1j8svKr2sO46cPg5BKqRnUE5PRrW/lIrnAJv9A1xaOBV
   DLn/CwKhvegbJZQ0N67bJwYpQG/Q1yGHRIJy+yTHzdsrC25FwAn61G1gt
   Afe1DYp7I7sIJiN8iJEXMK5+dvTNvoQm9h8rgbHu4k2hcbZk88c9PWijK
   fwnWx82KvyjbKQTsaIWdlgUusUNo1GoVYNQzuINGnlIw0Zjo8Vsu9kpC6
   bz88J54I3evid0NvIbBLOGTqOYitrFM4okyRjz1qvmEmRcn2w4UyId5mp
   x38DwDMVtvOIv07M9cQQ8zsjkF2AUkElD5sDS1cU4ucOAqMKJAuCDQcmn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367360945"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="367360945"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915383861"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="915383861"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Sep 2023 10:54:44 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdwji-0000T4-06;
	Wed, 06 Sep 2023 17:54:42 +0000
Date: Thu, 7 Sep 2023 01:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.5 10/13] fs/waitfd.c:94:1: error: conflicting
 types for 'sys_waitfd'
Message-ID: <202309070116.O5gD8FA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 [10/13] waitfd: new syscall implementing waitpid() over fds
config: powerpc-randconfig-r026-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070116.O5gD8FA9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070116.O5gD8FA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070116.O5gD8FA9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/waitfd.c:94:1: error: conflicting types for 'sys_waitfd'
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         | ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:230:2: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   arch/powerpc/include/asm/syscall_wrapper.h:19:7: note: expanded from macro '__SYSCALL_DEFINEx'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^
   <scratch space>:173:1: note: expanded from here
     173 | sys_waitfd
         | ^
   include/linux/syscalls.h:1282:17: note: previous declaration is here
    1282 | asmlinkage long sys_waitfd(int which, pid_t upid, int options, int flags);
         |                 ^
   fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:36: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:57: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:36: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:57: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
>> fs/waitfd.c:94:1: error: conflicting types for 'sys_waitfd'
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         | ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:230:2: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   arch/powerpc/include/asm/syscall_wrapper.h:23:7: note: expanded from macro '__SYSCALL_DEFINEx'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^
   <scratch space>:179:1: note: expanded from here
     179 | sys_waitfd
         | ^
   include/linux/syscalls.h:1282:17: note: previous declaration is here
    1282 | asmlinkage long sys_waitfd(int which, pid_t upid, int options, int flags);
         |                 ^
   fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:36: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:94:29: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:57: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:36: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                    ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'
     122 | #define __TYPE_AS(t, v) __same_type((__force t)0, v)
         |                                              ^
   include/linux/compiler_types.h:338:63: note: expanded from macro '__same_type'
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   fs/waitfd.c:95:7: warning: '__unused__' attribute ignored when parsing type [-Wignored-attributes]
      95 |                 int __maybe_unused, flags)
         |                     ^~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^~~~~~~~~~
   include/linux/syscalls.h:222:64: note: expanded from macro 'SYSCALL_DEFINE4'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                                                ^~~~~~~~~~~
   include/linux/syscalls.h:230:30: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |                                     ^~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/syscalls.h:125:57: note: expanded from macro '__TYPE_IS_LL'
     125 | #define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
         |                                                         ^
   include/linux/syscalls.h:122:46: note: expanded from macro '__TYPE_AS'


vim +/sys_waitfd +94 fs/waitfd.c

    93	
  > 94	SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
