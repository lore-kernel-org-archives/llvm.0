Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08087A49;
	Sat, 10 Jun 2023 00:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686357902; x=1717893902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H71Hp2i3zecWFTRKV30HicfpGL37cceO9EWXxx2OWs0=;
  b=FyEcWuP15C2OY/XM/Fhyk8XcfKzpfQCv8lWNZUZ++/CQ1TNTfC5YpOsJ
   UYQS7ijFJD2fX4Gy0UeMI9X0eH2ylw+DntDiKjGMYv50aHrnsPgx2Mhjs
   LRJd90xbMziBhC4WiZw/CyC4g1mqolQrvxOQt4Ls+cHV/UXpcqegso7Ce
   Q5IeUJe6xMk4QLwkIRp3qdwUlwlEIhu47MUntHg8QvbMz1c9/nxrWLJD+
   OtrFoc4mO6/hk6k6UydBozfz0/d55SJ4NRjy8Pn2Hk0l8ammTxSw37a8o
   Sz5g08GfzF4GzoYLmNHN9RRSjT2vjNo9Fthlt1BiCTn5LWuAhEUyo+WId
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356607367"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="356607367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823245586"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="823245586"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 17:44:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mix-0009YO-0Z;
	Sat, 10 Jun 2023 00:44:59 +0000
Date: Sat, 10 Jun 2023 08:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 18/58] kernel/sched/core.c:8816:3: error:
 unknown type name 'class_double_rq_lock_t'; did you mean
 'class_task_rq_lock_t'?
Message-ID: <202306100822.1jMWfuFt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: a9b97574b196a3f9b2ff063f59a176ae5b2fd052 [18/58] sched: Simplify yield_to()
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230610/202306100822.1jMWfuFt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install um cross compiling tool for clang build
        # apt-get install binutils-um-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=a9b97574b196a3f9b2ff063f59a176ae5b2fd052
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout a9b97574b196a3f9b2ff063f59a176ae5b2fd052
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100822.1jMWfuFt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from kernel/sched/core.c:86:
   kernel/sched/sched.h:2797:37: error: expected identifier
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                                       ^
   kernel/sched/sched.h:2797:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Werror,-Wimplicit-int]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
   ^
   int
   kernel/sched/sched.h:2797:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                      ^
   kernel/sched/sched.h:2799:45: error: expected ';' after top level declarator
                       double_rq_unlock(_T->lock, _T->lock2))
                                                             ^
                                                             ;
>> kernel/sched/core.c:8816:3: error: unknown type name 'class_double_rq_lock_t'; did you mean 'class_task_rq_lock_t'?
                   guard(double_rq_lock)(rq, p_rq);
                   ^
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
           ^
   include/linux/cleanup.h:82:2: note: expanded from macro 'CLASS'
           class_##name##_t var __cleanup(class_##name##_destructor) =     \
           ^
   <scratch space>:195:1: note: expanded from here
   class_double_rq_lock_t
   ^
   kernel/sched/sched.h:1633:1: note: 'class_task_rq_lock_t' declared here
   DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
   ^
   include/linux/cleanup.h:159:63: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
   #define DEFINE_LOCK_GUARD_1(name, type, _lock, _unlock, ...)            \
                                                                           ^
   include/linux/cleanup.h:134:3: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
   } class_##name##_t;                                                     \
     ^
   <scratch space>:113:1: note: expanded from here
   class_task_rq_lock_t
   ^
>> kernel/sched/core.c:8816:3: error: use of undeclared identifier 'class_double_rq_lock_destructor'; did you mean 'class_task_rq_lock_destructor'?
                   guard(double_rq_lock)(rq, p_rq);
                   ^
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
           ^
   include/linux/cleanup.h:82:33: note: expanded from macro 'CLASS'
           class_##name##_t var __cleanup(class_##name##_destructor) =     \
                                          ^
   <scratch space>:197:1: note: expanded from here
   class_double_rq_lock_destructor
   ^
   kernel/sched/sched.h:1633:1: note: 'class_task_rq_lock_destructor' declared here
   DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
   ^
   include/linux/cleanup.h:159:63: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
   #define DEFINE_LOCK_GUARD_1(name, type, _lock, _unlock, ...)            \
                                                                           ^
   include/linux/cleanup.h:136:20: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
   static inline void class_##name##_destructor(class_##name##_t *_T)      \
                      ^
   <scratch space>:115:1: note: expanded from here
   class_task_rq_lock_destructor
   ^
>> kernel/sched/core.c:8816:3: error: call to undeclared function 'class_double_rq_lock_constructor'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   guard(double_rq_lock)(rq, p_rq);
                   ^
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
           ^
   include/linux/cleanup.h:83:3: note: expanded from macro 'CLASS'
                   class_##name##_constructor
                   ^
   <scratch space>:199:1: note: expanded from here
   class_double_rq_lock_constructor
   ^
   kernel/sched/core.c:8816:3: note: did you mean 'class_task_rq_lock_constructor'?
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
           ^
   include/linux/cleanup.h:83:3: note: expanded from macro 'CLASS'
                   class_##name##_constructor
                   ^
   <scratch space>:199:1: note: expanded from here
   class_double_rq_lock_constructor
   ^
   kernel/sched/sched.h:1633:1: note: 'class_task_rq_lock_constructor' declared here
   DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
   ^
   include/linux/cleanup.h:160:58: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
   __DEFINE_UNLOCK_GUARD(name, type, _unlock, __VA_ARGS__)         \
                                                                   ^
   include/linux/cleanup.h:143:32: note: expanded from macro '\
   __DEFINE_LOCK_GUARD_1'
   static inline class_##name##_t class_##name##_constructor(type *l)      \
                                  ^
   <scratch space>:121:1: note: expanded from here
   class_task_rq_lock_constructor
   ^
>> kernel/sched/core.c:8816:3: error: initializing 'class_task_rq_lock_t' with an expression of incompatible type 'int'
                   guard(double_rq_lock)(rq, p_rq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:105:14: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
                       ^
   include/linux/compiler-clang.h:20:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:193:1: note: expanded from here
   __UNIQUE_ID_guard385
   ^
   include/linux/cleanup.h:82:19: note: expanded from macro 'CLASS'
           class_##name##_t var __cleanup(class_##name##_destructor) =     \
                            ^
   12 warnings and 8 errors generated.


vim +8816 kernel/sched/core.c

  8782	
  8783	/**
  8784	 * yield_to - yield the current processor to another thread in
  8785	 * your thread group, or accelerate that thread toward the
  8786	 * processor it's on.
  8787	 * @p: target task
  8788	 * @preempt: whether task preemption is allowed or not
  8789	 *
  8790	 * It's the caller's job to ensure that the target task struct
  8791	 * can't go away on us before we can do any checks.
  8792	 *
  8793	 * Return:
  8794	 *	true (>0) if we indeed boosted the target task.
  8795	 *	false (0) if we failed to boost the target.
  8796	 *	-ESRCH if there's no task to yield to.
  8797	 */
  8798	int __sched yield_to(struct task_struct *p, bool preempt)
  8799	{
  8800		struct task_struct *curr = current;
  8801		struct rq *rq, *p_rq;
  8802		int yielded = 0;
  8803	
  8804		scoped_guard (irqsave) {
  8805			rq = this_rq();
  8806	
  8807	again:
  8808			p_rq = task_rq(p);
  8809			/*
  8810			 * If we're the only runnable task on the rq and target rq also
  8811			 * has only one task, there's absolutely no point in yielding.
  8812			 */
  8813			if (rq->nr_running == 1 && p_rq->nr_running == 1)
  8814				return -ESRCH;
  8815	
> 8816			guard(double_rq_lock)(rq, p_rq);
  8817			if (task_rq(p) != p_rq)
  8818				goto again;
  8819	
  8820			if (!curr->sched_class->yield_to_task)
  8821				return 0;
  8822	
  8823			if (curr->sched_class != p->sched_class)
  8824				return 0;
  8825	
  8826			if (task_on_cpu(p_rq, p) || !task_is_running(p))
  8827				return 0;
  8828	
  8829			yielded = curr->sched_class->yield_to_task(rq, p);
  8830			if (yielded) {
  8831				schedstat_inc(rq->yld_count);
  8832				/*
  8833				 * Make p's CPU reschedule; pick_next_entity
  8834				 * takes care of fairness.
  8835				 */
  8836				if (preempt && rq != p_rq)
  8837					resched_curr(p_rq);
  8838			}
  8839		}
  8840	
  8841		if (yielded)
  8842			schedule();
  8843	
  8844		return yielded;
  8845	}
  8846	EXPORT_SYMBOL_GPL(yield_to);
  8847	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
