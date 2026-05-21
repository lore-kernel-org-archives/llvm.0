Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76E384235;
	Thu, 21 May 2026 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387559; cv=none; b=NdguWi2Vp5aBsMMODpq6r4ALnpymOwrnRayX1oBHCNNq978S5zVai01cDJuF2tBq9UlW6I7OgoBF2HLkvEiGnQZipy4tPimstCTfS+jpHOQ5RiWLRBRvJtNz/1FkUDO4G9PvmOGw7lbiEmp6YDKUextd8kKYuKUtxrZ7N5NWEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387559; c=relaxed/simple;
	bh=v4tDeBnkfAJ1lOfGR6SPqL5lXOGOD9HkoZChjFoNKic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y7i0I3qZH63waypzVA2K1v7oxImL8qM30HwV4sAPk8iidiLLcd1/IYgbPEX0pDYEPgKJjxy2EFfRuT6q3cku8hqQQrsug8whCGwkrfSBPWH37DBPoLscD2dsVR4L2d2ZhuO7CZCeWIh5SRJApAyBy6hhuK5YAzL0UpCEFP0DDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjxTygp+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjxTygp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779387555; x=1810923555;
  h=date:from:to:cc:subject:message-id;
  bh=v4tDeBnkfAJ1lOfGR6SPqL5lXOGOD9HkoZChjFoNKic=;
  b=KjxTygp+FIMhT9/23CvazJzuQt8MknMjyayUvqiJFK1K0VYhySKaJ1oN
   khI2HqOI9c7zkydRo3BLsEYZfq8AnMSFQALLNjmepgjchQF6TwGH+sp9d
   GpPtWvGcTD/dmxXstH5SLUk7MMVa/Ij0kds7UqRfP6pjI2Naqbr8aucrt
   H7Wj6lg8yyqMbkTzgtEg+Qr0z00cBFSUvhXLPoA8mHQuVBnXlipyrBvCx
   c+2afYiH22rYd/512+DfLCmH77y0WQbIWAectxY/YJJPD0qUulFU1KgT2
   JlcmECI7OLhLJahs6DgBALVqYGb1QI3W8x+/ZyWjDPeyzU7jRr5o6EIFC
   w==;
X-CSE-ConnectionGUID: GW7srOEoTxOp+PzmAaCr8A==
X-CSE-MsgGUID: 4PvcMwAGQY2SBPNF1ppveQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90609220"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="90609220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 11:19:14 -0700
X-CSE-ConnectionGUID: o6ioXj9vTG2s/cqhuJoM6g==
X-CSE-MsgGUID: XF9YGVBeRDqYHUMu0BZmtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="244871713"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 11:19:13 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ7zC-000000000xx-2phE;
	Thu, 21 May 2026 18:19:10 +0000
Date: Fri, 22 May 2026 02:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5302/7547] fs/open.c:152:1: error:
 unknown warning group '-Wattribute-alias', ignored
Message-ID: <202605220247.dQAHslyv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   550604d6c9b9efc8d068aff94dc301694a7afdee
commit: bc5ffe737f56ee2734597069ed71f48830549483 [5302/7547] Disable -Wattribute-alias for clang-23 and newer
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260522/202605220247.dQAHslyv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220247.dQAHslyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220247.dQAHslyv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/open.c:152:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     152 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:223:27: note: expanded from here
     223 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/open.c:209:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     209 | SYSCALL_DEFINE2(ftruncate, unsigned int, fd, off_t, length)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:35:27: note: expanded from here
      35 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/open.c:223:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     223 | SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:68:27: note: expanded from here
      68 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/open.c:228:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     228 | SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:101:27: note: expanded from here
     101 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/open.c:365:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     365 | SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFINE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
--
>> fs/read_write.c:412:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     412 | SYSCALL_DEFINE3(lseek, unsigned int, fd, off_t, offset, unsigned int, whence)
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFINE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:46:27: note: expanded from here
      46 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/read_write.c:426:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     426 | SYSCALL_DEFINE5(llseek, unsigned int, fd, unsigned long, offset_high,
         | ^
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFINE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:80:27: note: expanded from here
      80 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/read_write.c:724:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     724 | SYSCALL_DEFINE3(read, unsigned int, fd, char __user *, buf, size_t, count)
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFINE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:32:27: note: expanded from here
      32 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/read_write.c:748:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     748 | SYSCALL_DEFINE3(write, unsigned int, fd, const char __user *, buf,
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFINE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:72:27: note: expanded from here
      72 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/read_write.c:770:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     770 | SYSCALL_DEFINE4(pread64, unsigned int, fd, char __user *, buf,
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFINE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
--
>> fs/stat.c:505:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     505 | SYSCALL_DEFINE2(newstat, const char __user *, filename,
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:119:27: note: expanded from here
     119 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/stat.c:518:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     518 | SYSCALL_DEFINE2(newlstat, const char __user *, filename,
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:18:27: note: expanded from here
      18 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/stat.c:546:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     546 | SYSCALL_DEFINE2(newfstat, unsigned int, fd, struct stat __user *, statbuf)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFINE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:51:27: note: expanded from here
      51 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/stat.c:596:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     596 | SYSCALL_DEFINE4(readlinkat, int, dfd, const char __user *, pathname,
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFINE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:135:28: note: expanded from macro '__diag_clang_23'
     135 | #define __diag_clang_23(s)      __diag(s)
         |                                 ^
   include/linux/compiler-clang.h:132:20: note: expanded from macro '__diag'
     132 | #define __diag(s)               _Pragma(__diag_str(clang diagnostic s))
         |                                 ^
   <scratch space>:92:27: note: expanded from here
      92 |  clang diagnostic ignored "-Wattribute-alias"
         |                           ^
   fs/stat.c:602:1: error: unknown warning group '-Wattribute-alias', ignored [-Werror,-Wunknown-warning-option]
     602 | SYSCALL_DEFINE3(readlink, const char __user *, path, char __user *, buf,
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFINE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:250:2: note: expanded from macro '__SYSCALL_DEFINEx'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
..


vim +152 fs/open.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  151  
4fd8da8d62416d0 Heiko Carstens    2009-09-23 @152  SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
^1da177e4c3f415 Linus Torvalds    2005-04-16  153  {
e8767a3134ca69a Christoph Hellwig 2026-03-23  154  	return ksys_truncate(path, length);
^1da177e4c3f415 Linus Torvalds    2005-04-16  155  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  156  

:::::: The code at line 152 was first introduced by commit
:::::: 4fd8da8d62416d0dae05603ab5990a498d9aeb12 fs: change sys_truncate length parameter type

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
