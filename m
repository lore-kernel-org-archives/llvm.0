Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF0A49;
	Sat, 10 Jun 2023 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686358568; x=1717894568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhKUcrZR6vc70QQ0FB3sVCzvP4J5pIggs46CEkeLJNA=;
  b=O1R5/ltGRv2g0oiLHMeXHtP/n+sw0oB0+Ai6TRpxWzbHOg7evJI14zUi
   LrqpxuW5fTBCgCp+eGB6ENXXB1ZYwGb6fg1a1XrNNEepi8VGOLC8KebMP
   qOzQ6KR4czAE2QmQRFw1qjnRV7SJq4pPceglUfQLq85dEUYw1g1WiA++J
   wYXmVClGGhMAwCiqkqIJwwDyPiewtRT4sfuIYnEvniXl7uVOhBIt3Lv04
   HGtdvfEkeonE6H3Q90tL5wwOOuCYfj6DXV26CiVVOdcTUbQf1ZFI7aA7O
   DwBsa8x2x3uA/Zz7Iyrnt1gKN/3BixTdzQEoTN7Jhvy7EsxLj8jzLnu+R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338076534"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338076534"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710529174"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="710529174"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Jun 2023 17:56:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mtb-0009Ya-1b;
	Sat, 10 Jun 2023 00:55:59 +0000
Date: Sat, 10 Jun 2023 08:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 18/58] kernel/sched/core.c:8816:3: error:
 unknown type name 'class_double_rq_lock_t'; did you mean
 'class_task_rq_lock_t'?
Message-ID: <202306100854.u6EQ9EQ1-lkp@intel.com>
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
config: mips-randconfig-r021-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100854.u6EQ9EQ1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=a9b97574b196a3f9b2ff063f59a176ae5b2fd052
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout a9b97574b196a3f9b2ff063f59a176ae5b2fd052
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/sched/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100854.u6EQ9EQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:86:
   kernel/sched/sched.h:2797:37: error: expected identifier
   DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
                                       ^
   kernel/sched/sched.h:2797:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
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
   <scratch space>:136:1: note: expanded from here
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
   <scratch space>:45:1: note: expanded from here
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
   <scratch space>:138:1: note: expanded from here
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
   <scratch space>:47:1: note: expanded from here
   class_task_rq_lock_destructor
   ^
>> kernel/sched/core.c:8816:3: error: call to undeclared function 'class_double_rq_lock_constructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   guard(double_rq_lock)(rq, p_rq);
                   ^
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
           ^
   include/linux/cleanup.h:83:3: note: expanded from macro 'CLASS'
                   class_##name##_constructor
                   ^
   <scratch space>:140:1: note: expanded from here
   class_double_rq_lock_constructor
   ^
   kernel/sched/core.c:8816:3: note: did you mean 'class_task_rq_lock_constructor'?
   include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
           CLASS(name, __UNIQUE_ID(guard))
           ^
   include/linux/cleanup.h:83:3: note: expanded from macro 'CLASS'
                   class_##name##_constructor
                   ^
   <scratch space>:140:1: note: expanded from here
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
   <scratch space>:53:1: note: expanded from here
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
   <scratch space>:134:1: note: expanded from here
   __UNIQUE_ID_guard579
   ^
   include/linux/cleanup.h:82:19: note: expanded from macro 'CLASS'
           class_##name##_t var __cleanup(class_##name##_destructor) =     \
                            ^
   8 errors generated.


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
