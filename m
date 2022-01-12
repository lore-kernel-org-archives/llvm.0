Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD2B2C80
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642005607; x=1673541607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFuQ9rl68nDHoKclc3mNDYDnzkhTuQ/f6kT8eTySU2Q=;
  b=UPIQBc9CRLb7Nd93uRBrxADTN6OLPrcT+1QggptE62WHLjZB9u98cICn
   Y2QxX3pzihSwTc2xg64yqeBnRhTfI/++lDoNzni391bBKMGRn1CSBDE+w
   ZAowR04OD/E5sBsUD0IYUz2yNKIS77yEfOyzC8Nq+xSpe/hGJpWF1j8Mg
   LSQsH66d0EDEkZuue1ztpqxTzV1sWbhVETfi+LAIDVxn1ALZoH1na5FAV
   AYOwPgcN069apJLdfkqoYEhvMcyPGGW6PFquvVQSNfEe/zE7x4LWTnPZP
   4B+Re4y1k32xq2dyleKJ3J4HOm9nm8atMEdhxbIFlp9Y9twxYTY1kzD1f
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243733539"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="243733539"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 08:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="474963336"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 08:40:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7gfK-00067t-Vf; Wed, 12 Jan 2022 16:40:02 +0000
Date: Thu, 13 Jan 2022 00:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 1/1] psi: Fix uaf issue when psi trigger is destroyed
 while being polled
Message-ID: <202201130006.50syZ3rt-lkp@intel.com>
References: <20220111232309.1786347-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111232309.1786347-1-surenb@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Suren,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on tj-cgroup/for-next linus/master v5.16 next-20220112]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Suren-Baghdasaryan/psi-Fix-uaf-issue-when-psi-trigger-is-destroyed-while-being-polled/20220112-072341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fe8152b38d3a994c4c6fdbc0cd6551d569a5715a
config: s390-randconfig-r011-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130006.50syZ3rt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/81c75158e8d3b743a8bdc51cec94b938c027286d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Suren-Baghdasaryan/psi-Fix-uaf-issue-when-psi-trigger-is-destroyed-while-being-polled/20220112-072341
        git checkout 81c75158e8d3b743a8bdc51cec94b938c027286d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/psi.c:146:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/sched/psi.c:146:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/sched/psi.c:146:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   kernel/sched/psi.c:1112:21: warning: no previous prototype for function 'psi_trigger_create' [-Wmissing-prototypes]
   struct psi_trigger *psi_trigger_create(struct psi_group *group,
                       ^
   kernel/sched/psi.c:1112:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct psi_trigger *psi_trigger_create(struct psi_group *group,
   ^
   static 
>> kernel/sched/psi.c:1182:6: warning: no previous prototype for function 'psi_trigger_destroy' [-Wmissing-prototypes]
   void psi_trigger_destroy(struct psi_trigger *t)
        ^
   kernel/sched/psi.c:1182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void psi_trigger_destroy(struct psi_trigger *t)
   ^
   static 
   kernel/sched/psi.c:1249:10: warning: no previous prototype for function 'psi_trigger_poll' [-Wmissing-prototypes]
   __poll_t psi_trigger_poll(void **trigger_ptr,
            ^
   kernel/sched/psi.c:1249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __poll_t psi_trigger_poll(void **trigger_ptr,
   ^
   static 
   15 warnings generated.


vim +/psi_trigger_destroy +1182 kernel/sched/psi.c

  1181	
> 1182	void psi_trigger_destroy(struct psi_trigger *t)
  1183	{
  1184		struct psi_group *group;
  1185		struct task_struct *task_to_destroy = NULL;
  1186	
  1187		/*
  1188		 * We do not check psi_disabled since it might have been disabled after
  1189		 * the trigger got created.
  1190		 */
  1191		if (!t)
  1192			return;
  1193	
  1194		group = t->group;
  1195		/*
  1196		 * Wakeup waiters to stop polling. Can happen if cgroup is deleted
  1197		 * from under a polling process.
  1198		 */
  1199		wake_up_interruptible(&t->event_wait);
  1200	
  1201		mutex_lock(&group->trigger_lock);
  1202	
  1203		if (!list_empty(&t->node)) {
  1204			struct psi_trigger *tmp;
  1205			u64 period = ULLONG_MAX;
  1206	
  1207			list_del(&t->node);
  1208			group->nr_triggers[t->state]--;
  1209			if (!group->nr_triggers[t->state])
  1210				group->poll_states &= ~(1 << t->state);
  1211			/* reset min update period for the remaining triggers */
  1212			list_for_each_entry(tmp, &group->triggers, node)
  1213				period = min(period, div_u64(tmp->win.size,
  1214						UPDATES_PER_WINDOW));
  1215			group->poll_min_period = period;
  1216			/* Destroy poll_task when the last trigger is destroyed */
  1217			if (group->poll_states == 0) {
  1218				group->polling_until = 0;
  1219				task_to_destroy = rcu_dereference_protected(
  1220						group->poll_task,
  1221						lockdep_is_held(&group->trigger_lock));
  1222				rcu_assign_pointer(group->poll_task, NULL);
  1223				del_timer(&group->poll_timer);
  1224			}
  1225		}
  1226	
  1227		mutex_unlock(&group->trigger_lock);
  1228	
  1229		/*
  1230		 * Wait for psi_schedule_poll_work RCU to complete its read-side
  1231		 * critical section before destroying the trigger and optionally the
  1232		 * poll_task.
  1233		 */
  1234		synchronize_rcu();
  1235		/*
  1236		 * Stop kthread 'psimon' after releasing trigger_lock to prevent a
  1237		 * deadlock while waiting for psi_poll_work to acquire trigger_lock
  1238		 */
  1239		if (task_to_destroy) {
  1240			/*
  1241			 * After the RCU grace period has expired, the worker
  1242			 * can no longer be found through group->poll_task.
  1243			 */
  1244			kthread_stop(task_to_destroy);
  1245		}
  1246		kfree(t);
  1247	}
  1248	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
