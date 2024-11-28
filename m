Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689113B58E;
	Thu, 28 Nov 2024 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732769871; cv=none; b=WsjmrS1wBl8Tm55XYurDwNQaFJy3uXkm+wAftVPBlWSWP21P9UBL49/mE8ch21q2w/iEPtDekpygWoikmN62MQ2DeBUtdGZrQJG6+7Gf4b6vW9jqrwDmxEUmlqyA2CCGG0oMbr+3PdrVdOHqG6KAjka/zgYaglxFG9MmdMC3eI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732769871; c=relaxed/simple;
	bh=t7NLmYTyIPnPaIba4c61aM0Yec5uq/Jtku8sjEvVfio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nhdg6CikQj6GwNwRLbRCNYQYETuxYrXjKr4/gVrgYJp05ntgrO76FZZuVrZXms/Tlr7M5ApVh4IGq4LImBbwX7tNYh9Zk0PDuXKsbl69+w9xmfjWc2hhrZa0B4AYNOxbgi1j3QoE0n9cQ82qooL/nqjKV0UZkm0JWIXbKUUXOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltkhQs9Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltkhQs9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732769868; x=1764305868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7NLmYTyIPnPaIba4c61aM0Yec5uq/Jtku8sjEvVfio=;
  b=ltkhQs9Qxo3wHQWkBgbbMjefEJIG5fmwUovm5cMq2LelAiOzrVss5TRu
   TDxgeen19V6xrPDlrOKSkrVSpA3KTPL7q6vLGPpVig/XjPDZsydLVSZy8
   h4kkt5TzNlobpkaD7YX7GJG7rncURw1Legcv98zwiUE2lSc3Hm+WG05vW
   RRTgPvUc/97HntwhSkWOdNJXvxwUSNBBrUu51Vw0KvcwQ4aLqK+maubFr
   If+QUNIfsHwAWGyX2I9yLGp2cgEXZ/khtB8nId7Ra70Wa+CV9SL2J/ttI
   lsz+zec6b5GR4/yBjbANGBYpXpWfCGJxqQHtEZcp6FcqTzWPPrmqdqt9y
   A==;
X-CSE-ConnectionGUID: PoTlVdHpQWq5HjMUTvzevQ==
X-CSE-MsgGUID: q7jlIYK7Tqa7KgeTD3j/1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20584121"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="20584121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 20:57:47 -0800
X-CSE-ConnectionGUID: luNkXLzZRha1uuskgahEqA==
X-CSE-MsgGUID: 8Qb4i5PPSXOx15lVQ8iDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="92527422"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 20:57:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGWb1-00095N-0i;
	Thu, 28 Nov 2024 04:57:43 +0000
Date: Thu, 28 Nov 2024 12:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_9 5/12]
 include/linux/uprobes.h:176:16: error: field has incomplete type 'struct
 mutex'
Message-ID: <202411281201.1zAQJN6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_9
head:   b1d916ea335d828e290e0c2bb8bb5bebdf0b633a
commit: 9151504d74ead16a6d8e1d163df0f46df5cfa008 [5/12] uprobes: Add mapping for optimized uprobe trampolines
config: arm-mxs_defconfig (https://download.01.org/0day-ci/archive/20241128/202411281201.1zAQJN6a-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281201.1zAQJN6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281201.1zAQJN6a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/init-mm.c:2:
   In file included from include/linux/mm_types.h:16:
>> include/linux/uprobes.h:176:16: error: field has incomplete type 'struct mutex'
     176 |         struct mutex            tramp_mutex;
         |                                 ^
   include/linux/refcount.h:102:8: note: forward declaration of 'struct mutex'
     102 | struct mutex;
         |        ^
   In file included from mm/init-mm.c:2:
>> include/linux/mm_types.h:1142:27: error: no member named 'mm_mt' in 'struct mm_struct'
    1142 |         mas_init(&vmi->mas, &mm->mm_mt, addr);
         |                              ~~  ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:21:
   In file included from include/linux/sched/mm.h:11:
>> include/linux/sched/coredump.h:25:28: error: no member named 'flags' in 'struct mm_struct'
      25 |         return __get_dumpable(mm->flags);
         |                               ~~  ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:21:
>> include/linux/sched/mm.h:37:18: error: no member named 'mm_count' in 'struct mm_struct'
      37 |         atomic_inc(&mm->mm_count);
         |                     ~~  ^
   include/linux/sched/mm.h:54:40: error: no member named 'mm_count' in 'struct mm_struct'
      54 |         if (unlikely(atomic_dec_and_test(&mm->mm_count)))
         |                                           ~~  ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:21:
>> include/linux/sched/mm.h:133:18: error: no member named 'mm_users' in 'struct mm_struct'
     133 |         atomic_inc(&mm->mm_users);
         |                     ~~  ^
   include/linux/sched/mm.h:138:34: error: no member named 'mm_users' in 'struct mm_struct'
     138 |         return atomic_inc_not_zero(&mm->mm_users);
         |                                     ~~  ^
>> include/linux/sched/mm.h:536:32: error: no member named 'membarrier_state' in 'struct mm_struct'
     536 |         if (likely(!(atomic_read(&mm->membarrier_state) &
         |                                   ~~  ^
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
--
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
     140 |                 r->sig[3] = op(a3, b3);                                 \
         |                 ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:6:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:65:25: error: no member named 'mmap_lock' in 'struct mm_struct'
      65 |         rwsem_assert_held(&mm->mmap_lock);
         |                            ~~  ^
   include/linux/mmap_lock.h:70:31: error: no member named 'mmap_lock' in 'struct mm_struct'
      70 |         rwsem_assert_held_write(&mm->mmap_lock);
         |                                  ~~  ^
   include/linux/mmap_lock.h:100:18: error: no member named 'mmap_lock' in 'struct mm_struct'
     100 |         init_rwsem(&mm->mmap_lock);
         |                     ~~  ^
   include/linux/rwsem.h:121:16: note: expanded from macro 'init_rwsem'
     121 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:6:
   In file included from include/linux/mm.h:16:
   include/linux/mmap_lock.h:106:18: error: no member named 'mmap_lock' in 'struct mm_struct'
     106 |         down_write(&mm->mmap_lock);
         |                     ~~  ^
   include/linux/mmap_lock.h:113:25: error: no member named 'mmap_lock' in 'struct mm_struct'
     113 |         down_write_nested(&mm->mmap_lock, subclass);
         |                            ~~  ^
   include/linux/mmap_lock.h:122:33: error: no member named 'mmap_lock' in 'struct mm_struct'
     122 |         ret = down_write_killable(&mm->mmap_lock);
         |                                    ~~  ^
   include/linux/mmap_lock.h:131:16: error: no member named 'mmap_lock' in 'struct mm_struct'
     131 |         up_write(&mm->mmap_lock);
         |                   ~~  ^
   include/linux/mmap_lock.h:138:23: error: no member named 'mmap_lock' in 'struct mm_struct'
     138 |         downgrade_write(&mm->mmap_lock);
         |                          ~~  ^
   include/linux/mmap_lock.h:144:17: error: no member named 'mmap_lock' in 'struct mm_struct'
     144 |         down_read(&mm->mmap_lock);
         |                    ~~  ^
   include/linux/mmap_lock.h:153:32: error: no member named 'mmap_lock' in 'struct mm_struct'
     153 |         ret = down_read_killable(&mm->mmap_lock);
         |                                   ~~  ^
   include/linux/mmap_lock.h:163:31: error: no member named 'mmap_lock' in 'struct mm_struct'
     163 |         ret = down_read_trylock(&mm->mmap_lock) != 0;
         |                                  ~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   28 warnings and 20 errors generated.
--
   In file included from fs/nfs/nfstrace.c:5:
   In file included from include/linux/nfs_fs.h:22:
   In file included from include/linux/in.h:19:
   In file included from include/uapi/linux/in.h:25:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:16:
>> include/linux/uprobes.h:176:16: error: field has incomplete type 'struct mutex'
     176 |         struct mutex            tramp_mutex;
         |                                 ^
   include/linux/refcount.h:102:8: note: forward declaration of 'struct mutex'
     102 | struct mutex;
         |        ^
   In file included from fs/nfs/nfstrace.c:5:
   In file included from include/linux/nfs_fs.h:22:
   In file included from include/linux/in.h:19:
   In file included from include/uapi/linux/in.h:25:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:1142:27: error: no member named 'mm_mt' in 'struct mm_struct'
    1142 |         mas_init(&vmi->mas, &mm->mm_mt, addr);
         |                              ~~  ^
   In file included from fs/nfs/nfstrace.c:5:
   In file included from include/linux/nfs_fs.h:23:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:65:25: error: no member named 'mmap_lock' in 'struct mm_struct'
      65 |         rwsem_assert_held(&mm->mmap_lock);
         |                            ~~  ^
   include/linux/mmap_lock.h:70:31: error: no member named 'mmap_lock' in 'struct mm_struct'
      70 |         rwsem_assert_held_write(&mm->mmap_lock);
         |                                  ~~  ^
   include/linux/mmap_lock.h:100:18: error: no member named 'mmap_lock' in 'struct mm_struct'
     100 |         init_rwsem(&mm->mmap_lock);
         |                     ~~  ^
   include/linux/rwsem.h:121:16: note: expanded from macro 'init_rwsem'
     121 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   In file included from fs/nfs/nfstrace.c:5:
   In file included from include/linux/nfs_fs.h:23:
   In file included from include/linux/mm.h:16:
   include/linux/mmap_lock.h:106:18: error: no member named 'mmap_lock' in 'struct mm_struct'
     106 |         down_write(&mm->mmap_lock);
         |                     ~~  ^
   include/linux/mmap_lock.h:113:25: error: no member named 'mmap_lock' in 'struct mm_struct'
     113 |         down_write_nested(&mm->mmap_lock, subclass);
         |                            ~~  ^
   include/linux/mmap_lock.h:122:33: error: no member named 'mmap_lock' in 'struct mm_struct'
     122 |         ret = down_write_killable(&mm->mmap_lock);
         |                                    ~~  ^
   include/linux/mmap_lock.h:131:16: error: no member named 'mmap_lock' in 'struct mm_struct'
     131 |         up_write(&mm->mmap_lock);
         |                   ~~  ^
   include/linux/mmap_lock.h:138:23: error: no member named 'mmap_lock' in 'struct mm_struct'
     138 |         downgrade_write(&mm->mmap_lock);
         |                          ~~  ^
   include/linux/mmap_lock.h:144:17: error: no member named 'mmap_lock' in 'struct mm_struct'
     144 |         down_read(&mm->mmap_lock);
         |                    ~~  ^
   include/linux/mmap_lock.h:153:32: error: no member named 'mmap_lock' in 'struct mm_struct'
     153 |         ret = down_read_killable(&mm->mmap_lock);
         |                                   ~~  ^
   include/linux/mmap_lock.h:163:31: error: no member named 'mmap_lock' in 'struct mm_struct'
     163 |         ret = down_read_trylock(&mm->mmap_lock) != 0;
         |                                  ~~  ^
   include/linux/mmap_lock.h:171:15: error: no member named 'mmap_lock' in 'struct mm_struct'
     171 |         up_read(&mm->mmap_lock);
         |                  ~~  ^
   include/linux/mmap_lock.h:177:25: error: no member named 'mmap_lock' in 'struct mm_struct'
     177 |         up_read_non_owner(&mm->mmap_lock);
         |                            ~~  ^
   include/linux/mmap_lock.h:182:33: error: no member named 'mmap_lock' in 'struct mm_struct'
     182 |         return rwsem_is_contended(&mm->mmap_lock);
         |                                    ~~  ^
   In file included from fs/nfs/nfstrace.c:5:
   In file included from include/linux/nfs_fs.h:23:
   In file included from include/linux/mm.h:30:
>> include/linux/pgtable.h:186:42: error: no member named 'pgd' in 'struct mm_struct'
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                                 ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:168:55: note: expanded from macro 'pgd_offset'
     168 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                        ~~~~  ^
   include/linux/pgtable.h:191:42: error: no member named 'pgd' in 'struct mm_struct'
     191 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/pgtable.h:175:32: note: expanded from macro 'pgd_offset_k'
     175 | #define pgd_offset_k(address)           pgd_offset(&init_mm, (address))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:168:55: note: expanded from macro 'pgd_offset'
     168 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                        ~~~~  ^
   In file included from fs/nfs/nfstrace.c:5:
   In file included from include/linux/nfs_fs.h:23:
>> include/linux/mm.h:947:37: error: no member named 'brk' in 'struct mm_struct'
     947 |         return vma->vm_start < vma->vm_mm->brk &&
         |                                ~~~~~~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +176 include/linux/uprobes.h

   172	
   173	struct uprobes_state {
   174		struct xol_area		*xol_area;
   175		struct hlist_head	tramp_head;
 > 176		struct mutex		tramp_mutex;
   177	};
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
