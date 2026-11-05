Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860150;
	b=ygRtHrdFrkLmF0NgqJUYYrHY5Gg/seTX9eOwxHQR4/GqUklMZwxRrsEWKgnWfLjTfoPV
	 zoF1S8eJGI9forQ7GN2osS8Vl3ejYVqjh8H7KRn+INT9d7kaWRvjS6jZmoFhZtWI8nvke
	 p/f3QsU2Z5fMIro6DcsfRPEdWEM5Aeug/rJIIdmuw0lDEL1QKqzdEox7I2ilFC9wXtpB9
	 pQMRPkzIjhzAm4OlB6fMRYvWnVmpfBrpBo74+0jNnlISLNxmmze66SZ0W5xVOySpceEl0
	 DQfsJN95GcVam7E0YToASD8bY2xEGVUhr73i6MUE/Bdbi8NL8fyaje3/WN7wjgoR3aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860150;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=p8OHPX84+PpjnBVHqR278mIsTE1FJl7wHGftlt7gLk4=;
	b=QyfBV9ib8UAGt2sDoV8Qwmtt1HoD+9+OsKVyi3I28UGfE6+FvLqrC7IQ/3T2EPeaLphp
	 VMr0yeO13R1fgqUGm/aCqpK5S7QW9alW0b5iiCEDyoEBPg2+xij5kfW2YpFBA09K4HN6A
	 Ok1nCKVw9twiAoibsrZIvb2KbqEFx3LTNqdjbCXmgwxqH2GLBsARNWGjkDqGwbcA1NU/Y
	 uxK60aikJf4wNFEeRgkeGLySwOYMqb06jhN7eDJr0S66rxSsZe/kouL9FyFlN8WJBOlR+
	 Zk+APwuITRhEKBFhI2i8l0rZ/ONhRPywjEYK8D1Cy2G2EXwgXq8a8XLVZKp2vj7zebQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XfPu5DWm;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3619606A31B;
	Thu,  5 Nov 2026 06:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3619606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XfPu5DWm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793860149; x=1825396149;
  h=date:from:to:cc:subject:message-id;
  bh=24+JBeDshny+LeBaWjebV7XNHNIVxzo8b2kJN/NWKKA=;
  b=XfPu5DWmwtGTxwvIJKmgla1oS0N991xn3Rid/JdlIE5H2Pizw6CrKnyN
   TX1RGimnqeXywE4Umbe48HDG37XOZcf0kk0DfgI/UL1VbrzbTNIDZk1Q1
   a7AkxkTj8v6t364Vz0iO2zlirn9cNbm4spmPPiJi4CJlR8va5IqX4CwLf
   Urw+9N/rN8wFrZaSbTQ4bCpvL7v7CD0dmPckwuSUq5GLKiwEzi9+isutl
   7yJO4KusKJN/udsZDp4vPwrn5kwN73PyGvP4GFvkOi/ZvY4W3kuTKTfD8
   tI0zAgTafe2g2vdefYlwfvAuZDaKv+NsuFlKUYNuXnJWTNQ9i8CSjIbdn
   A==;
X-CSE-ConnectionGUID: Hus7Wm2ESHKpZN6mWUx5Jg==
X-CSE-MsgGUID: DqtpfHZiSd+qL+XIFP9v3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2629108"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2629108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:29:09 -0800
X-CSE-ConnectionGUID: acDMt3uXR1e17CQcMLMeeg==
X-CSE-MsgGUID: qJ4ZeimQSvaklnHSw5CCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7334275"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2026 22:29:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqy2-00000000lnP-34JD;
	Thu, 05 Nov 2026 06:28:58 +0000
Date: Thu, 05 Nov 2026 14:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 442/445]
 include/linux/mutex.h:188:63: error: use of undeclared identifier 'lock'
Message-ID: <202611051415.ahjEXnyk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   d7fccb0c43af0d515fd23b885eb43ee9c38a6247
commit: 2bcc94cede043acc8b73b2078d0101f8bdf2ae1e [442/445] treewide: Annotate interruptible and killable locks with range acquire
config: s390-randconfig-1001-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051415.ahjEXnyk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051415.ahjEXnyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051415.ahjEXnyk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   In file included from include/linux/seqlock.h:20:
>> include/linux/mutex.h:188:63: error: use of undeclared identifier 'lock'
     188 |                                         unsigned int subclass) __cond_acquires_range(0, INT_MAX, lock);
         |                                                                                                  ^~~~
   include/linux/mutex.h:190:91: error: use of undeclared identifier 'lock'
     190 |                 unsigned int subclass, struct lockdep_map *nest_lock) __cond_acquires_range(0, INT_MAX, lock);
         |                                                                                                         ^~~~
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
>> include/linux/rwsem.h:231:116: error: use of undeclared identifier 'sem'
     231 | extern int __must_check down_read_interruptible(struct rw_semaphore *sem) __cond_acquires_shared_range(0, INT_MAX, sem);
         |                                                                                                                    ^~~
   include/linux/rwsem.h:232:111: error: use of undeclared identifier 'sem'
     232 | extern int __must_check down_read_killable(struct rw_semaphore *sem) __cond_acquires_shared_range(0, INT_MAX, sem);
         |                                                                                                               ^~~
   include/linux/rwsem.h:243:105: error: use of undeclared identifier 'sem'
     243 | extern int __must_check down_write_killable(struct rw_semaphore *sem) __cond_acquires_range(0, INT_MAX, sem);
         |                                                                                                         ^~~
   include/linux/rwsem.h:306:132: error: use of undeclared identifier 'sem'
     306 | extern int __must_check down_read_killable_nested(struct rw_semaphore *sem, int subclass) __cond_acquires_shared_range(0, INT_MAX, sem);
         |                                                                                                                                    ^~~
   include/linux/rwsem.h:308:113: error: use of undeclared identifier 'sem'
     308 | extern int down_write_killable_nested(struct rw_semaphore *sem, int subclass) __cond_acquires_range(0, INT_MAX, sem);
         |                                                                                                                 ^~~
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:24: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:3: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 r->sig[3] = op(a3, b3);                                 \
         |                 ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
--
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:197:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     197 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:210:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     210 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:241:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     241 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:254:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     254 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/s390/include/asm/uaccess.h:16:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:20:
   include/linux/radix-tree.h:242:2: warning: unknown attribute 'try_acquire_capability_range' ignored; did you mean 'try_acquire_capability'? [-Wunknown-attributes]
     242 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:347:2: note: expanded from macro '__cond_acquires_range'
     347 |         __try_acquires_ctx_lock_range(first, last, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:22:17: note: expanded from macro '__try_acquires_ctx_lock_range'
      22 |         __attribute__((try_acquire_capability_range(first, last, __VA_ARGS__)))
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/s390/include/asm/uaccess.h:16:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:20:
   include/linux/radix-tree.h:244:2: warning: unknown attribute 'try_acquire_capability_range' ignored; did you mean 'try_acquire_capability'? [-Wunknown-attributes]
     244 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:347:2: note: expanded from macro '__cond_acquires_range'
     347 |         __try_acquires_ctx_lock_range(first, last, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:22:17: note: expanded from macro '__try_acquires_ctx_lock_range'
      22 |         __attribute__((try_acquire_capability_range(first, last, __VA_ARGS__)))
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kcov.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/s390/include/asm/uaccess.h:16:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:22:
>> include/linux/mmap_lock.h:548:37: error: use of undeclared identifier 'mm'
     548 |         __cond_acquires_range(0, INT_MAX, &mm->mmap_lock)
         |                                            ^~
   include/linux/mmap_lock.h:612:44: error: use of undeclared identifier 'mm'
     612 |         __cond_acquires_shared_range(0, INT_MAX, &mm->mmap_lock)
         |                                                   ^~
   In file included from kernel/kcov.c:11:
>> include/linux/fs.h:1037:37: error: use of undeclared identifier 'inode'
    1037 |         __cond_acquires_range(0, INT_MAX, &inode->i_rwsem)
         |                                            ^~~~~
   include/linux/fs.h:1055:44: error: use of undeclared identifier 'inode'
    1055 |         __cond_acquires_shared_range(0, INT_MAX, &inode->i_rwsem)
         |                                                   ^~~~~
   39 warnings and 11 errors generated.
--
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   In file included from include/linux/seqlock.h:20:
>> include/linux/mutex.h:188:63: error: use of undeclared identifier 'lock'
     188 |                                         unsigned int subclass) __cond_acquires_range(0, INT_MAX, lock);
         |                                                                                                  ^~~~
   include/linux/mutex.h:190:91: error: use of undeclared identifier 'lock'
     190 |                 unsigned int subclass, struct lockdep_map *nest_lock) __cond_acquires_range(0, INT_MAX, lock);
         |                                                                                                         ^~~~
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
>> include/linux/rwsem.h:231:116: error: use of undeclared identifier 'sem'
     231 | extern int __must_check down_read_interruptible(struct rw_semaphore *sem) __cond_acquires_shared_range(0, INT_MAX, sem);
         |                                                                                                                    ^~~
   include/linux/rwsem.h:232:111: error: use of undeclared identifier 'sem'
     232 | extern int __must_check down_read_killable(struct rw_semaphore *sem) __cond_acquires_shared_range(0, INT_MAX, sem);
         |                                                                                                               ^~~
   include/linux/rwsem.h:243:105: error: use of undeclared identifier 'sem'
     243 | extern int __must_check down_write_killable(struct rw_semaphore *sem) __cond_acquires_range(0, INT_MAX, sem);
         |                                                                                                         ^~~
   include/linux/rwsem.h:306:132: error: use of undeclared identifier 'sem'
     306 | extern int __must_check down_read_killable_nested(struct rw_semaphore *sem, int subclass) __cond_acquires_shared_range(0, INT_MAX, sem);
         |                                                                                                                                    ^~~
   include/linux/rwsem.h:308:113: error: use of undeclared identifier 'sem'
     308 | extern int down_write_killable_nested(struct rw_semaphore *sem, int subclass) __cond_acquires_range(0, INT_MAX, sem);
         |                                                                                                                 ^~~
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:24: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                                      ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:3: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 r->sig[3] = op(a3, b3);                                 \
         |                 ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/crypto/prng.c:11:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
..


vim +/lock +188 include/linux/mutex.h

   176	
   177	#define devm_mutex_init(dev, mutex) \
   178		__devm_mutex_init(dev, __mutex_init_ret(mutex))
   179	
   180	/*
   181	 * See kernel/locking/mutex.c for detailed documentation of these APIs.
   182	 * Also see Documentation/locking/mutex-design.rst.
   183	 */
   184	#ifdef CONFIG_DEBUG_LOCK_ALLOC
   185	extern void mutex_lock_nested(struct mutex *lock, unsigned int subclass) __acquires(lock);
   186	extern void _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest_lock) __acquires(lock);
   187	extern int __must_check mutex_lock_interruptible_nested(struct mutex *lock,
 > 188						unsigned int subclass) __cond_acquires_range(0, INT_MAX, lock);
   189	extern int __must_check _mutex_lock_killable(struct mutex *lock,
   190			unsigned int subclass, struct lockdep_map *nest_lock) __cond_acquires_range(0, INT_MAX, lock);
   191	extern void mutex_lock_io_nested(struct mutex *lock, unsigned int subclass) __acquires(lock);
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
