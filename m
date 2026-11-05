Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850291;
	b=SENe+2aNwOXUtOZI+CyLeRFiXyoessv93Ic/QgXx0kXHcyIZ2Au9VmNhuRtRYVLhb2rg
	 U0/uQftM+gn2TntkGGwh3GyiCLR5i880SLuyTbYo/KQjrt/hi/5SSZkfsBV+TzeVAaau0
	 b93+4gOppFJt+cJ7rvWlq95ojgJ1oQrY32qmGxF+9iMzAufKsycrTDXfgdUVX9JUnIVMW
	 NcyLo17XFwDlPn9/XluZe923v5La0qLu7BoZ+le7F4vohd0FpawN8YgwfUaNMyaee9Val
	 x7gdREQZXLLxn6D//GgL0vul2aLhY2hM0eP0sL2n2j3AyrcqBvTol+h7l5efOntQD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NtBPXQzyXSwprcmm0MVbEM1wJo3HjgUml/0870WFfiI=;
	b=SNQGu5X/QA0h7TtSPIHvg/lbBoPblaFrLVzI/RTVVuZg2AymuXrcDR+u8JlsnflkRHJO
	 gwojIQj5NL0gkkQaARPuRx+UTVqLaoq523XH816gennRc1I9lCJGLar4yYnD0kzaC1C9d
	 WZlUlABEEuvADVgrnTwUvoJsn4618tSNP92HDi6bO/Xv3TuuBjF2e/qy/RZ5uOncC51ci
	 fM9zDC054whVR8klvjMQgUuguyCbq7uK5k3Ya1eHjUNkfdK+udE+lRm8ZviFtdJdKLyEO
	 cGKEaLBk/r4XGzyv1zqTHiUvHOJuam9rTu8d4IsUN41/PcTZkgg5XZn42Vlx0l9S3ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BzHf5Bfl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B1606A329;
	Thu,  5 Nov 2026 03:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BzHf5Bfl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793850290; x=1825386290;
  h=date:from:to:cc:subject:message-id;
  bh=eSbGIHODvruJdjFkuYMY7XymtZzSTPMqGzu0hZe2okE=;
  b=BzHf5BflsmRWd/SQMaZvFJzRJ16D6Yj7NO9OsBes9B/ptmqNIaS/f1ru
   0rRCo8isR4/LkKuWRE7GWUGLyTIgxGQB9ipsj6gzEFxbZIDEGG5h6NVO6
   KEcaeDJm/RhFuTrtseLj5PRfftIVDy9+1OVil/DZuX/K95h4PMuz0DuKH
   we4dF95qwD3AlVy5bpW4c+KrnIrsyNz83DD2GYLX8tr5kw2yu6Gu3fvNo
   UAylYDkDz664VS2TZfs/eADvxAIl+RsRi9RaZiG0T2MeRmC3mf3StXzAw
   Pm6xdaR8izNGmHsMCIB/UQxW+6okukVzR6+kgkm96+lw5blMOVl+nzWvG
   g==;
X-CSE-ConnectionGUID: degmDCrXQAyCXMzkt/Y+KA==
X-CSE-MsgGUID: MILQnmApTDmccdmnPzsTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2500861"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2500861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:44:49 -0800
X-CSE-ConnectionGUID: D6vf+7gORCCJ1aT7cGYEig==
X-CSE-MsgGUID: Q+rqmSawQ/iMpDlu2GwVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7230755"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2026 19:44:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOoP6-00000000lb9-3Q3g;
	Thu, 05 Nov 2026 03:44:44 +0000
Date: Thu, 05 Nov 2026 11:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 442/445]
 include/linux/radix-tree.h:242:2: warning: unknown attribute
 'try_acquire_capability_range' ignored; did you mean
 'try_acquire_capability'?
Message-ID: <202611051146.cRUZsyyx-lkp@intel.com>
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
config: s390-randconfig-1001-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051146.cRUZsyyx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051146.cRUZsyyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051146.cRUZsyyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:186:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:176:10: note: expanded from macro '_SIG_SET_OP'
     176 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:197:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     197 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
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
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
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
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
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
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/s390/include/asm/uaccess.h:16:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:20:
>> include/linux/radix-tree.h:242:2: warning: unknown attribute 'try_acquire_capability_range' ignored; did you mean 'try_acquire_capability'? [-Wunknown-attributes]
     242 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:347:2: note: expanded from macro '__cond_acquires_range'
     347 |         __try_acquires_ctx_lock_range(first, last, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:22:17: note: expanded from macro '__try_acquires_ctx_lock_range'
      22 |         __attribute__((try_acquire_capability_range(first, last, __VA_ARGS__)))
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
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
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:10:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:10:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/s390/include/asm/uaccess.h:16:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:22:
   include/linux/mmap_lock.h:548:37: error: use of undeclared identifier 'mm'
     548 |         __cond_acquires_range(0, INT_MAX, &mm->mmap_lock)
         |                                            ^~
   include/linux/mmap_lock.h:612:44: error: use of undeclared identifier 'mm'
     612 |         __cond_acquires_shared_range(0, INT_MAX, &mm->mmap_lock)
         |                                                   ^~
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:175:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:1968:
   In file included from include/linux/huge_mm.h:7:
   include/linux/fs.h:1037:37: error: use of undeclared identifier 'inode'
    1037 |         __cond_acquires_range(0, INT_MAX, &inode->i_rwsem)
         |                                            ^~~~~
   include/linux/fs.h:1055:44: error: use of undeclared identifier 'inode'
    1055 |         __cond_acquires_shared_range(0, INT_MAX, &inode->i_rwsem)
         |                                                   ^~~~~
   In file included from arch/s390/kernel/idle.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   include/linux/device.h:1114:37: error: use of undeclared identifier 'dev'
    1114 |         __cond_acquires_range(0, INT_MAX, &dev->mutex)
         |                                            ^~~
   39 warnings and 12 errors generated.
--
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   In file included from include/linux/seqlock.h:20:
   include/linux/mutex.h:188:63: error: use of undeclared identifier 'lock'
     188 |                                         unsigned int subclass) __cond_acquires_range(0, INT_MAX, lock);
         |                                                                                                  ^~~~
   include/linux/mutex.h:190:91: error: use of undeclared identifier 'lock'
     190 |                 unsigned int subclass, struct lockdep_map *nest_lock) __cond_acquires_range(0, INT_MAX, lock);
         |                                                                                                         ^~~~
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
   include/linux/rwsem.h:231:116: error: use of undeclared identifier 'sem'
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:18:
   include/linux/mmap_lock.h:548:37: error: use of undeclared identifier 'mm'
     548 |         __cond_acquires_range(0, INT_MAX, &mm->mmap_lock)
         |                                            ^~
   include/linux/mmap_lock.h:612:44: error: use of undeclared identifier 'mm'
     612 |         __cond_acquires_shared_range(0, INT_MAX, &mm->mmap_lock)
         |                                                   ^~
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:20:
>> include/linux/radix-tree.h:242:2: warning: unknown attribute 'try_acquire_capability_range' ignored; did you mean 'try_acquire_capability'? [-Wunknown-attributes]
     242 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:347:2: note: expanded from macro '__cond_acquires_range'
     347 |         __try_acquires_ctx_lock_range(first, last, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:22:17: note: expanded from macro '__try_acquires_ctx_lock_range'
      22 |         __attribute__((try_acquire_capability_range(first, last, __VA_ARGS__)))
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:31:
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:36:
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:36:
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:36:
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:36:
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:36:
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
   In file included from arch/s390/kernel/syscall.c:19:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
     140 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/syscall.c:19:
..


vim +242 include/linux/radix-tree.h

   220	
   221	int radix_tree_insert(struct radix_tree_root *, unsigned long index,
   222				void *);
   223	void *__radix_tree_lookup(const struct radix_tree_root *, unsigned long index,
   224				  struct radix_tree_node **nodep, void __rcu ***slotp);
   225	void *radix_tree_lookup(const struct radix_tree_root *, unsigned long);
   226	void __rcu **radix_tree_lookup_slot(const struct radix_tree_root *,
   227						unsigned long index);
   228	void __radix_tree_replace(struct radix_tree_root *, struct radix_tree_node *,
   229				  void __rcu **slot, void *entry);
   230	void radix_tree_iter_replace(struct radix_tree_root *,
   231			const struct radix_tree_iter *, void __rcu **slot, void *entry);
   232	void radix_tree_replace_slot(struct radix_tree_root *,
   233				     void __rcu **slot, void *entry);
   234	void radix_tree_iter_delete(struct radix_tree_root *,
   235				struct radix_tree_iter *iter, void __rcu **slot);
   236	void *radix_tree_delete_item(struct radix_tree_root *, unsigned long, void *);
   237	void *radix_tree_delete(struct radix_tree_root *, unsigned long);
   238	unsigned int radix_tree_gang_lookup(const struct radix_tree_root *,
   239				void **results, unsigned long first_index,
   240				unsigned int max_items);
   241	int radix_tree_preload(gfp_t gfp_mask)
 > 242		__cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
   243	int radix_tree_maybe_preload(gfp_t gfp_mask)
   244		__cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
   245	void radix_tree_init(void);
   246	void *radix_tree_tag_set(struct radix_tree_root *,
   247				unsigned long index, unsigned int tag);
   248	void *radix_tree_tag_clear(struct radix_tree_root *,
   249				unsigned long index, unsigned int tag);
   250	int radix_tree_tag_get(const struct radix_tree_root *,
   251				unsigned long index, unsigned int tag);
   252	void radix_tree_iter_tag_clear(struct radix_tree_root *,
   253			const struct radix_tree_iter *iter, unsigned int tag);
   254	unsigned int radix_tree_gang_lookup_tag(const struct radix_tree_root *,
   255			void **results, unsigned long first_index,
   256			unsigned int max_items, unsigned int tag);
   257	unsigned int radix_tree_gang_lookup_tag_slot(const struct radix_tree_root *,
   258			void __rcu ***results, unsigned long first_index,
   259			unsigned int max_items, unsigned int tag);
   260	int radix_tree_tagged(const struct radix_tree_root *, unsigned int tag);
   261	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
