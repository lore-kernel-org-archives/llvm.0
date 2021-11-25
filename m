Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9E72
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 11:04:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="321730277"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="321730277"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 03:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="598124425"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2021 03:04:33 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqCYL-0006Fw-8I; Thu, 25 Nov 2021 11:04:33 +0000
Date: Thu, 25 Nov 2021 19:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Divjak <vladimir.divjak@bmw.de>, viro@zeniv.linux.org.uk,
	mcgrof@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	will@kernel.org, yuzhao@google.com, hannes@cmpxchg.org,
	fenghua.yu@intel.com, guro@fb.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] coredump-ptrace: Delayed delivery of SIGSTOP
Message-ID: <202111251807.2qLJT4ab-lkp@intel.com>
References: <20211115091540.3806073-1-vladimir.divjak@bmw.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115091540.3806073-1-vladimir.divjak@bmw.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Vladimir,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.15]
[cannot apply to linus/master v5.16-rc1 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vladimir-Divjak/coredump-ptrace-Delayed-delivery-of-SIGSTOP/20211115-172727
base:    8bb7eca972ad531c9b149c0a51ab43a417385813
config: hexagon-randconfig-r045-20211115 (https://download.01.org/0day-ci/archive/20211125/202111251807.2qLJT4ab-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/919266a4390cf04729bf15eaf8324b627b4b347c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vladimir-Divjak/coredump-ptrace-Delayed-delivery-of-SIGSTOP/20211115-172727
        git checkout 919266a4390cf04729bf15eaf8324b627b4b347c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/signal.c:1093:7: error: no member named 'state' in 'struct task_struct'
                           t->state = TASK_TRACED;
                           ~  ^
   1 error generated.


vim +1093 kernel/signal.c

  1013	
  1014	static void complete_signal(int sig, struct task_struct *p, enum pid_type type)
  1015	{
  1016		struct signal_struct *signal = p->signal;
  1017		struct task_struct *t;
  1018	
  1019		/*
  1020		 * Now find a thread we can wake up to take the signal off the queue.
  1021		 *
  1022		 * If the main thread wants the signal, it gets first crack.
  1023		 * Probably the least surprising to the average bear.
  1024		 */
  1025		if (wants_signal(sig, p))
  1026			t = p;
  1027		else if ((type == PIDTYPE_PID) || thread_group_empty(p))
  1028			/*
  1029			 * There is just one thread and it does not need to be woken.
  1030			 * It will dequeue unblocked signals before it runs again.
  1031			 */
  1032			return;
  1033		else {
  1034			/*
  1035			 * Otherwise try to find a suitable thread.
  1036			 */
  1037			t = signal->curr_target;
  1038			while (!wants_signal(sig, t)) {
  1039				t = next_thread(t);
  1040				if (t == signal->curr_target)
  1041					/*
  1042					 * No thread needs to be woken.
  1043					 * Any eligible threads will see
  1044					 * the signal in the queue soon.
  1045					 */
  1046					return;
  1047			}
  1048			signal->curr_target = t;
  1049		}
  1050	
  1051		/*
  1052		 * Found a killable thread.  If the signal will be fatal,
  1053		 * then start taking the whole group down immediately.
  1054		 */
  1055		if (sig_fatal(p, sig) &&
  1056		    !(signal->flags & SIGNAL_GROUP_EXIT) &&
  1057		    !sigismember(&t->real_blocked, sig) &&
  1058		    (sig == SIGKILL || !p->ptrace)) {
  1059			/*
  1060			 * This signal will be fatal to the whole group.
  1061			 */
  1062			if (!sig_kernel_coredump(sig)) {
  1063				/*
  1064				 * Start a group exit and wake everybody up.
  1065				 * This way we don't have other threads
  1066				 * running and doing things after a slower
  1067				 * thread has the fatal signal pending.
  1068				 */
  1069				signal->flags = SIGNAL_GROUP_EXIT;
  1070				signal->group_exit_code = sig;
  1071				signal->group_stop_count = 0;
  1072				t = p;
  1073				do {
  1074					task_clear_jobctl_pending(t, JOBCTL_PENDING_MASK);
  1075					sigaddset(&t->pending.signal, SIGKILL);
  1076					signal_wake_up(t, 1);
  1077				} while_each_thread(p, t);
  1078				return;
  1079			}
  1080		}
  1081	
  1082		/*
  1083		 * If the signal is completed for a process being core-dumped,
  1084		 * and the signal is SIGSTOP, there is no point in waking up its tasks,
  1085		 * as they are either dumping the core, or in uninterruptible state,
  1086		 * so skip the wake up if core-dump is not yet completed.
  1087		 * Instead, if the core-dump has been completed, see coredump_finish()
  1088		 * set the task state directly to TASK_TRACED,
  1089		 * allowing the coredump umh process to ptrace the dying process.
  1090		 */
  1091		if (unlikely(t->mm && t->mm->core_state) && sig == SIGSTOP) {
  1092			if (t->mm->core_state->core_dumped)
> 1093				t->state = TASK_TRACED;
  1094	
  1095			return;
  1096		}
  1097	
  1098		/*
  1099		 * The signal is already in the shared-pending queue.
  1100		 * Tell the chosen thread to wake up and dequeue it.
  1101		 */
  1102		signal_wake_up(t, sig == SIGKILL);
  1103		return;
  1104	}
  1105	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
