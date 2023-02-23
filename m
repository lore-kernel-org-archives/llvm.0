Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A682F2A;
	Thu, 23 Feb 2023 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677172307; x=1708708307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2+N/ijpF87DclH0xHXJiHc+8iwXjkiEjZT81BKl5PM=;
  b=Wz9FEYpEfEBOG4ch+Ytd+jS1JWLn1hhFIMWbnMkaviWLlZ+DPgGfDIq7
   IV4ogZFGBuyvRLFuTDsbDOdWLDHb+99d3voqy0W8No7HcxzxJrRydz0yR
   LYURYIKAjaKmB606rHv/PnVuNeFDAItyccaYHanU6LbmjPCqAWu80njAD
   5Oi9hNXsymOYHS/amu8NlL7mG+9IPXaTmYYS9gpXNNhnAFPetFwul36Q5
   bU8Llhlh9MDlAcGGQnV27WKhw/ZtPiG9xUIV8UIu9I+BhuvzBq/JkMWXw
   oATMgq1hCeoXy7zf8zbizn5UAYDqV2wQXcPzNtcdtxR9yR6cUH5Tv3Rms
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331943891"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="331943891"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 09:10:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001489033"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="1001489033"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2023 09:10:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVF6g-0001XT-0I;
	Thu, 23 Feb 2023 17:10:10 +0000
Date: Fri, 24 Feb 2023 01:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 5/6] kernel/locking/rwsem.c:1027:3:
 error: call to undeclared function 'LOCKEVENT_waiter_type'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202302240131.eS42jjFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   6c17797b554c635c394d7de0ceb49b705d182340
commit: 425d19e8c6d9ec3d3f55b7497526947235cc8d77 [5/6] locking/rwsem: Unify wait loop
config: s390-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240131.eS42jjFi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=425d19e8c6d9ec3d3f55b7497526947235cc8d77
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 425d19e8c6d9ec3d3f55b7497526947235cc8d77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240131.eS42jjFi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1027:3: error: call to undeclared function 'LOCKEVENT_waiter_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   lockevent_inc(waiter_type(waiter, rwsem_sleep_reader, rwsem_sleep_writer));
                   ^
   kernel/locking/lock_events.h:43:45: note: expanded from macro 'lockevent_inc'
   #define lockevent_inc(ev)         __lockevent_inc(LOCKEVENT_ ##ev, true)
                                                     ^
   <scratch space>:59:1: note: expanded from here
   LOCKEVENT_waiter_type
   ^
>> kernel/locking/rwsem.c:1027:37: error: use of undeclared identifier 'rwsem_sleep_reader'
                   lockevent_inc(waiter_type(waiter, rwsem_sleep_reader, rwsem_sleep_writer));
                                                     ^
>> kernel/locking/rwsem.c:1027:57: error: use of undeclared identifier 'rwsem_sleep_writer'
                   lockevent_inc(waiter_type(waiter, rwsem_sleep_reader, rwsem_sleep_writer));
                                                                         ^
   kernel/locking/rwsem.c:1031:2: error: call to undeclared function 'LOCKEVENT_waiter_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           lockevent_inc(waiter_type(waiter, rwsem_rlock, rwsem_wlock));
           ^
   kernel/locking/lock_events.h:43:45: note: expanded from macro 'lockevent_inc'
   #define lockevent_inc(ev)         __lockevent_inc(LOCKEVENT_ ##ev, true)
                                                     ^
   <scratch space>:63:1: note: expanded from here
   LOCKEVENT_waiter_type
   ^
>> kernel/locking/rwsem.c:1031:36: error: use of undeclared identifier 'rwsem_rlock'
           lockevent_inc(waiter_type(waiter, rwsem_rlock, rwsem_wlock));
                                             ^
>> kernel/locking/rwsem.c:1031:49: error: use of undeclared identifier 'rwsem_wlock'
           lockevent_inc(waiter_type(waiter, rwsem_rlock, rwsem_wlock));
                                                          ^
>> kernel/locking/rwsem.c:1038:36: error: use of undeclared identifier 'rwsem_rlock_fail'
           lockevent_inc(waiter_type(waiter, rwsem_rlock_fail, rwsem_wlock_fail));
                                             ^
>> kernel/locking/rwsem.c:1038:54: error: use of undeclared identifier 'rwsem_wlock_fail'
           lockevent_inc(waiter_type(waiter, rwsem_rlock_fail, rwsem_wlock_fail));
                                                               ^
   8 errors generated.


vim +/LOCKEVENT_waiter_type +1027 kernel/locking/rwsem.c

  1002	
  1003	#define waiter_type(_waiter, _r, _w)	\
  1004		((_waiter)->type == RWSEM_WAITING_FOR_READ ? (_r) : (_w))
  1005	
  1006	static __always_inline struct rw_semaphore *
  1007	rwsem_waiter_wait(struct rw_semaphore *sem, struct rwsem_waiter *waiter, int state)
  1008	{
  1009		trace_contention_begin(sem, waiter_type(waiter, LCB_F_READ, LCB_F_WRITE));
  1010	
  1011		/* wait to be given the lock */
  1012		for (;;) {
  1013			set_current_state(state);
  1014			if (!smp_load_acquire(&waiter->task)) {
  1015				/* Matches rwsem_waiter_wake()'s smp_store_release(). */
  1016				break;
  1017			}
  1018			if (signal_pending_state(state, current)) {
  1019				raw_spin_lock_irq(&sem->wait_lock);
  1020				if (waiter->task)
  1021					goto out_nolock;
  1022				raw_spin_unlock_irq(&sem->wait_lock);
  1023				/* Ordered by sem->wait_lock against rwsem_mark_wake(). */
  1024				break;
  1025			}
  1026			schedule_preempt_disabled();
> 1027			lockevent_inc(waiter_type(waiter, rwsem_sleep_reader, rwsem_sleep_writer));
  1028		}
  1029	
  1030		__set_current_state(TASK_RUNNING);
> 1031		lockevent_inc(waiter_type(waiter, rwsem_rlock, rwsem_wlock));
  1032		trace_contention_end(sem, 0);
  1033		return sem;
  1034	
  1035	out_nolock:
  1036		rwsem_del_wake_waiter(sem, waiter);
  1037		__set_current_state(TASK_RUNNING);
> 1038		lockevent_inc(waiter_type(waiter, rwsem_rlock_fail, rwsem_wlock_fail));
  1039		trace_contention_end(sem, -EINTR);
  1040		return ERR_PTR(-EINTR);
  1041	}
  1042	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
