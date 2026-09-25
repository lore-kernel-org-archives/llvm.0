Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F03E00B4;
	Fri, 25 Sep 2026 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370522; cv=none; b=kzjwOU3Lru8NGrg1IY5CCIPt8eIqxbjKUTr7V31JdG0IyeH4HwGWs5/303MjPjl+D9APQA+Sc/a3cu9rBQWpBytxrHWHJ2zsuJNPXkrp1fRXpx/p/qtXuSWodRrm9skVr9qnWe1ArIlhfxNBuk1Z26Pjr7QujQg1/iKD1MhoP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370522; c=relaxed/simple;
	bh=MaD5BhqVNzYRlyiUIJfijkXPHi35ATx90c22sedFe1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jCMlSTKZwpesoGCWqW5PsIfwWJYGikIaw8UnRuFZwVw3kRVD72+vlaaHd++iR7s58ZoNyc2KtvFwE7lQm17YnmJb12FyEvCjDwGrjpANWkmnK/vgF9T8fWb/gPfuHJRoWRp1uP1tuvRpq+oONkTnw7x8FT1MrUFkAATewIGAZxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijVV+AtY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijVV+AtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790370519; x=1821906519;
  h=date:from:to:cc:subject:message-id;
  bh=MaD5BhqVNzYRlyiUIJfijkXPHi35ATx90c22sedFe1U=;
  b=ijVV+AtYst6xFM4FJzwQWDPfbz0bMDgHYlSrgNaHkOi9AJHuwLynv+pz
   bFTV8oehgFMqK3RX6pq2CURYdb+P4Tqh2QjvM/zteHknRbRUXrxkCWO5v
   IppzfDHq46v/8ctdj6QvCrzrEs0dokbwTbS1SahCyIjQ1EC+R17aEuO7M
   7lsXquFIVM4frWXqmouHWEQDvjuaJX6KbXMMW/vcBTi4fdpAc4W880dgw
   RtodX8ZBHnL2eBg4b2HVATHpzzWX/f52OWDNQ8D+teSNlPtuaIrUMm5vf
   JKXI5mZpvpxsWLC2LpJkmMslrbPgZp1yXstM1tMZfWxFKo4kXJzB6+ott
   w==;
X-CSE-ConnectionGUID: EUlCnem5RVG9C+4lGmL2Aw==
X-CSE-MsgGUID: abKu4jTySoWxxoGxqvGiMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116693074"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="116693074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:08:38 -0700
X-CSE-ConnectionGUID: XPu1ifYlRiaVJ3xDnTxkOw==
X-CSE-MsgGUID: QzsVVD+mR2KOy02wyM2Vug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="279162069"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2026 14:08:36 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAD9l-000000000tC-167Q;
	Fri, 25 Sep 2026 21:08:33 +0000
Date: Fri, 25 Sep 2026 23:07:37 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 628/673]
 include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary
 expression
Message-ID: <202609252035.roEHB44F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 5f609cf4ad6407b1967d07a8d6383a7edb182d45 [628/673] fixup clang __diag
config: s390-randconfig-2001-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252035.roEHB44F-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 57e112ccb2a509c0e1d36963b187fccdd59566de)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252035.roEHB44F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252035.roEHB44F-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcov.c:925:7: error: assigning to 'unsigned int' from incompatible type 'void'
     925 |         mode = context_unsafe(kcov->mode);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcov.c:925:30: warning: expression result unused [-Wunused-value]
     925 |         mode = context_unsafe(kcov->mode);
         |                               ~~~~  ^~~~
   1 warning and 2 errors generated.
--
>> lib/test_context-analysis.c:24:33: error: invalid operands to binary expression ('void' and 'int')
      24 |         BUILD_BUG_ON(context_unsafe(3) != 3); /* plain expression */
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/build_bug.h:51:19: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:705:22: note: expanded from macro 'compiletime_assert'
     705 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:693:23: note: expanded from macro '_compiletime_assert'
     693 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:685:9: note: expanded from macro '__compiletime_assert'
     685 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   lib/test_context-analysis.c:25:42: error: invalid operands to binary expression ('void' and 'int')
      25 |         BUILD_BUG_ON(context_unsafe((void)2; 3) != 3); /* does not swallow semi-colon */
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/build_bug.h:51:19: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:705:22: note: expanded from macro 'compiletime_assert'
     705 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:693:23: note: expanded from macro '_compiletime_assert'
     693 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:685:9: note: expanded from macro '__compiletime_assert'
     685 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   lib/test_context-analysis.c:26:42: error: invalid operands to binary expression ('void' and 'int')
      26 |         BUILD_BUG_ON(context_unsafe((void)2, 3) != 3); /* does not swallow commas */
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/build_bug.h:51:19: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:705:22: note: expanded from macro 'compiletime_assert'
     705 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:693:23: note: expanded from macro '_compiletime_assert'
     693 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:685:9: note: expanded from macro '__compiletime_assert'
     685 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> lib/test_context-analysis.c:24:30: warning: expression result unused [-Wunused-value]
      24 |         BUILD_BUG_ON(context_unsafe(3) != 3); /* plain expression */
         |                                     ^
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro 'context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   include/linux/build_bug.h:51:19: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:705:22: note: expanded from macro 'compiletime_assert'
     705 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:693:23: note: expanded from macro '_compiletime_assert'
     693 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:685:9: note: expanded from macro '__compiletime_assert'
     685 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   lib/test_context-analysis.c:25:39: warning: expression result unused [-Wunused-value]
      25 |         BUILD_BUG_ON(context_unsafe((void)2; 3) != 3); /* does not swallow semi-colon */
         |                                              ^
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro 'context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   include/linux/build_bug.h:51:19: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:705:22: note: expanded from macro 'compiletime_assert'
     705 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:693:23: note: expanded from macro '_compiletime_assert'
     693 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:685:9: note: expanded from macro '__compiletime_assert'
     685 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   lib/test_context-analysis.c:26:39: warning: expression result unused [-Wunused-value]
      26 |         BUILD_BUG_ON(context_unsafe((void)2, 3) != 3); /* does not swallow commas */
         |                                              ^
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro 'context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   include/linux/build_bug.h:51:19: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^~~~~~~~~
   include/linux/build_bug.h:40:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:705:22: note: expanded from macro 'compiletime_assert'
     705 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:693:23: note: expanded from macro '_compiletime_assert'
     693 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:685:9: note: expanded from macro '__compiletime_assert'
     685 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   lib/test_context-analysis.c:416:8: warning: expression result unused [-Wunused-value]
     416 |         (void)unrcu_pointer(d->data);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:500:26: note: expanded from macro 'unrcu_pointer'
     500 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:491:3: note: expanded from macro '__unrcu_pointer'
     487 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     488 | context_unsafe(                                                         \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |         ((typeof(*p) __force __kernel *)(local))                        \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro '\
   context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   4 warnings and 3 errors generated.
--
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/stackdepot.c:512:7: error: assigning to 'void *' from incompatible type 'void'
     512 |         pool = context_unsafe(stack_pools[pool_index]);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/stackdepot.c:512:46: warning: expression result unused [-Wunused-value]
     512 |         pool = context_unsafe(stack_pools[pool_index]);
         |                               ~~~~~~~~~~~ ~~~~~~~~~~^
   1 warning and 2 errors generated.
--
   In file included from lib/rhashtable.c:17:
   In file included from include/linux/irq_work.h:6:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/rhashtable.c:26:
>> include/linux/rhashtable.h:781:6: error: invalid argument type 'void' to unary expression
     781 |         if (unlikely(rcu_access_pointer(tbl->future_tbl))) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                           ^~~~
>> lib/rhashtable.c:521:6: error: invalid argument type 'void' to unary expression
     521 |         if (likely(rcu_access_pointer(tbl->future_tbl)))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:38: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                           ^~~~
>> lib/rhashtable.c:643:3: error: statement requires expression of scalar type ('void' invalid)
     643 |                 if (rcu_access_pointer(tbl->future_tbl))
         |                 ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
   In file included from crypto/authencesn.c:12:
   In file included from include/crypto/internal/hash.h:12:
   In file included from include/crypto/hash.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from crypto/scompress.c:10:
   In file included from include/crypto/internal/scompress.h:12:
   In file included from include/crypto/internal/acompress.h:12:
   In file included from include/crypto/acompress.h:18:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> crypto/scompress.c:101:3: error: statement requires expression of scalar type ('void' invalid)
     101 |                 if (context_unsafe(scratch->src))
         |                 ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> crypto/scompress.c:101:31: warning: expression result unused [-Wunused-value]
     101 |                 if (context_unsafe(scratch->src))
         |                                    ~~~~~~~~~^~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro 'context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from block/fops.c:8:
   In file included from include/linux/mm.h:36:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from block/fops.c:12:
   In file included from include/linux/buffer_head.h:15:
>> include/linux/pagemap.h:179:7: error: assigning to 'void *' from incompatible type 'void'
     179 |         head = rcu_access_pointer(mapping->i_pages.xa_head);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from drivers/nvme/host/fc.c:6:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/nvme/host/fc.c:13:
   In file included from drivers/nvme/host/nvme.h:21:
   In file included from include/trace/events/block.h:10:
   In file included from include/linux/buffer_head.h:15:
>> include/linux/pagemap.h:179:7: error: assigning to 'void *' from incompatible type 'void'
     179 |         head = rcu_access_pointer(mapping->i_pages.xa_head);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/nvme/host/fc.c:18:
   In file included from include/scsi/scsi_transport_fc.h:18:
>> include/scsi/scsi_host.h:793:9: error: returning 'void' from a function with incompatible result type 'enum scsi_host_state'
     793 |         return context_unsafe(READ_ONCE(shost->shost_state));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:215:30: note: expanded from macro 'context_unsafe'
     215 | #define context_unsafe(...)             \
         |                                         ^
     216 | ({                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     217 |         disable_context_analysis();     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     218 |         __VA_ARGS__;                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     219 |         enable_context_analysis()       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     220 | })
         | ~~
   3 errors generated.
--
   In file included from drivers/nvme/host/multipath.c:6:
   In file included from include/linux/backing-dev.h:13:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/nvme/host/multipath.c:9:
   In file included from include/trace/events/block.h:10:
   In file included from include/linux/buffer_head.h:15:
>> include/linux/pagemap.h:179:7: error: assigning to 'void *' from incompatible type 'void'
     179 |         head = rcu_access_pointer(mapping->i_pages.xa_head);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/multipath.c:249:10: error: invalid operands to binary expression ('struct nvme_ns *' and 'void')
     249 |                 if (ns == rcu_access_pointer(head->current_path[node])) {
         |                     ~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/async.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
>> include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/nvme/host/core.c:27:
   In file included from drivers/nvme/host/nvme.h:21:
   In file included from include/trace/events/block.h:10:
   In file included from include/linux/buffer_head.h:15:
>> include/linux/pagemap.h:179:7: error: assigning to 'void *' from incompatible type 'void'
     179 |         head = rcu_access_pointer(mapping->i_pages.xa_head);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3944:34: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
    3944 |         ret = dev_set_name(cdev_device, name);
         |                                         ^~~~
   drivers/nvme/host/core.c:3944:34: note: treat the string as an argument to avoid this
    3944 |         ret = dev_set_name(cdev_device, name);
         |                                         ^
         |                                         "%s", 
   1 warning and 2 errors generated.


vim +/void +23 include/linux/rcuwait.h

8f95c90ceb541a Davidlohr Bueso 2017-01-11  16  
191a43be61d679 Davidlohr Bueso 2020-04-23  17  /*
191a43be61d679 Davidlohr Bueso 2020-04-23  18   * Note: this provides no serialization and, just as with waitqueues,
191a43be61d679 Davidlohr Bueso 2020-04-23  19   * requires care to estimate as to whether or not the wait is active.
191a43be61d679 Davidlohr Bueso 2020-04-23  20   */
191a43be61d679 Davidlohr Bueso 2020-04-23  21  static inline int rcuwait_active(struct rcuwait *w)
191a43be61d679 Davidlohr Bueso 2020-04-23  22  {
febd668d375caf Paolo Bonzini   2020-05-18 @23  	return !!rcu_access_pointer(w->task);
191a43be61d679 Davidlohr Bueso 2020-04-23  24  }
191a43be61d679 Davidlohr Bueso 2020-04-23  25  

:::::: The code at line 23 was first introduced by commit
:::::: febd668d375caf13a7fcd93b3498366854de854a rcuwait: avoid lockdep splats from rcuwait_active()

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
