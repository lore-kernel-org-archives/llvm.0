Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DFF290F;
	Sun, 26 Feb 2023 18:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677436445; x=1708972445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S7UdtNQN5P5FNgJtXVS5WhBqsm8Zk3k8kTMBX3hYic0=;
  b=faaRMLwdfKZeLWjQrPleN8folzqJoUFBzijixzbYAPiQXvZHTKPiM9PP
   wvMgku3BU5+MTNDPGNRsyDVr52M9ffjdd7oJSvSRseq1dc+w2EOdodW8W
   4WVUtk5Fxky1c1Vja/swYW33ALAXHF+ri1MsZaH0t10WO82JUQ1Lby+0y
   9hGv+YsdTd4oEvpT74PHbssbpK1RR+9vh7KNd+uQBXkK9PW+o3dBH0AMW
   qP/zCr6QBoRXJNbOiZQX3VbErD7U4Wsth2sid7P8+kE9Jk+HEU4olaNnz
   SaswFiDdyTYogkFTYMKfBnZ5zhcchEjUvjWGgTbbkGD6PVQzMYwrafIgI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="396281838"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="396281838"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 10:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="666739856"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="666739856"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Feb 2023 10:34:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWLqU-0003qp-20;
	Sun, 26 Feb 2023 18:34:02 +0000
Date: Mon, 27 Feb 2023 02:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 6/7] kernel/locking/rwsem.c:1037:2:
 error: use of undeclared identifier 'LOCKEVENT_rwem_rlock_fail'; did you
 mean 'LOCKEVENT_rwsem_rlock_fail'?
Message-ID: <202302270256.NVYWZOEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   18e0098a30e83352212c5840ae0bc2c144ad0e39
commit: 279f094d8e0d5d9ab6ed75466209ccf972801d73 [6/7] locking/rwsem: Unify wait loop
config: hexagon-randconfig-r041-20230227 (https://download.01.org/0day-ci/archive/20230227/202302270256.NVYWZOEx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=279f094d8e0d5d9ab6ed75466209ccf972801d73
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 279f094d8e0d5d9ab6ed75466209ccf972801d73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270256.NVYWZOEx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1037:2: error: use of undeclared identifier 'LOCKEVENT_rwem_rlock_fail'; did you mean 'LOCKEVENT_rwsem_rlock_fail'?
           lockevent_rw_inc(reader, rwem_rlock_fail, rwsem_wlock_fail);
           ^
   kernel/locking/rwsem.c:999:2: note: expanded from macro 'lockevent_rw_inc'
           lockevent_cond_inc(evr, (rd));          \
           ^
   kernel/locking/lock_events.h:44:51: note: expanded from macro 'lockevent_cond_inc'
   #define lockevent_cond_inc(ev, c) __lockevent_inc(LOCKEVENT_ ##ev, c)
                                                     ^
   <scratch space>:53:1: note: expanded from here
   LOCKEVENT_rwem_rlock_fail
   ^
   kernel/locking/lock_events_list.h:65:1: note: 'LOCKEVENT_rwsem_rlock_fail' declared here
   LOCK_EVENT(rwsem_rlock_fail)    /* # of failed read lock acquisitions   */
   ^
   kernel/locking/lock_events_list.h:17:26: note: expanded from macro 'LOCK_EVENT'
   #define LOCK_EVENT(name)        LOCKEVENT_ ## name,
                                   ^
   <scratch space>:2:1: note: expanded from here
   LOCKEVENT_rwsem_rlock_fail
   ^
   1 error generated.


vim +1037 kernel/locking/rwsem.c

  1002	
  1003	static __always_inline struct rw_semaphore *
  1004	rwsem_waiter_wait(struct rw_semaphore *sem, struct rwsem_waiter *waiter,
  1005			  int state, bool reader)
  1006	{
  1007		trace_contention_begin(sem, reader ? LCB_F_READ : LCB_F_WRITE);
  1008	
  1009		/* wait to be given the lock */
  1010		for (;;) {
  1011			set_current_state(state);
  1012			if (!smp_load_acquire(&waiter->task)) {
  1013				/* Matches rwsem_waiter_wake()'s smp_store_release(). */
  1014				break;
  1015			}
  1016			if (signal_pending_state(state, current)) {
  1017				raw_spin_lock_irq(&sem->wait_lock);
  1018				if (waiter->task)
  1019					goto out_nolock;
  1020				raw_spin_unlock_irq(&sem->wait_lock);
  1021				/* Ordered by sem->wait_lock against rwsem_mark_wake(). */
  1022				break;
  1023			}
  1024			schedule_preempt_disabled();
  1025			lockevent_rw_inc(reader, rwsem_sleep_reader, rwsem_sleep_writer);
  1026		}
  1027	
  1028		__set_current_state(TASK_RUNNING);
  1029	
  1030		lockevent_rw_inc(reader, rwsem_rlock, rwsem_wlock);
  1031		trace_contention_end(sem, 0);
  1032		return sem;
  1033	
  1034	out_nolock:
  1035		rwsem_del_wake_waiter(sem, waiter);
  1036		__set_current_state(TASK_RUNNING);
> 1037		lockevent_rw_inc(reader, rwem_rlock_fail, rwsem_wlock_fail);
  1038		trace_contention_end(sem, -EINTR);
  1039		return ERR_PTR(-EINTR);
  1040	}
  1041	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
