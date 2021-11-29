Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897272
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 17:00:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="222895400"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="222895400"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 09:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="458503806"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Nov 2021 09:00:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mrk0j-000C8p-8B; Mon, 29 Nov 2021 17:00:13 +0000
Date: Tue, 30 Nov 2021 00:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] sched/tracing: Don't re-read p->state when
 emitting sched_switch event
Message-ID: <202111300028.pBo6qRlf-lkp@intel.com>
References: <20211129123601.2101873-2-valentin.schneider@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129123601.2101873-2-valentin.schneider@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Valentin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on rostedt-trace/for-next]
[also build test ERROR on tip/sched/core tip/master linux/master linus/master v5.16-rc3 next-20211129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Valentin-Schneider/sched-tracing-sched_switch-prev_state-reported-as-TASK_RUNNING-when-it-s-not/20211129-203943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-buildonly-randconfig-r004-20211128 (https://download.01.org/0day-ci/archive/20211130/202111300028.pBo6qRlf-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9d9dc2f12e741a72aeb54b49ed491ea17d0863a9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Valentin-Schneider/sched-tracing-sched_switch-prev_state-reported-as-TASK_RUNNING-when-it-s-not/20211129-203943
        git checkout 9d9dc2f12e741a72aeb54b49ed491ea17d0863a9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/trace/trace_sched_wakeup.c:617:36: error: incompatible function pointer types passing 'void (void *, bool, struct task_struct *, struct task_struct *)' (aka 'void (void *, _Bool, struct task_struct *, struct task_struct *)') to parameter of type 'void (*)(void *, bool, unsigned int, struct task_struct *, struct task_struct *)' (aka 'void (*)(void *, _Bool, unsigned int, struct task_struct *, struct task_struct *)') [-Werror,-Wincompatible-function-pointer-types]
           ret = register_trace_sched_switch(probe_wakeup_sched_switch, NULL);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:222:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(sched_switch,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:260:31: note: expanded from macro '__DECLARE_TRACE'
           register_trace_##name(void (*probe)(data_proto), void *data)    \
                                        ^
   kernel/trace/trace_sched_wakeup.c:647:32: error: incompatible function pointer types passing 'void (void *, bool, struct task_struct *, struct task_struct *)' (aka 'void (void *, _Bool, struct task_struct *, struct task_struct *)') to parameter of type 'void (*)(void *, bool, unsigned int, struct task_struct *, struct task_struct *)' (aka 'void (*)(void *, _Bool, unsigned int, struct task_struct *, struct task_struct *)') [-Werror,-Wincompatible-function-pointer-types]
           unregister_trace_sched_switch(probe_wakeup_sched_switch, NULL);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:222:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(sched_switch,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:273:33: note: expanded from macro '__DECLARE_TRACE'
           unregister_trace_##name(void (*probe)(data_proto), void *data)  \
                                          ^
   kernel/trace/trace_sched_wakeup.c:658:32: error: incompatible function pointer types passing 'void (void *, bool, struct task_struct *, struct task_struct *)' (aka 'void (void *, _Bool, struct task_struct *, struct task_struct *)') to parameter of type 'void (*)(void *, bool, unsigned int, struct task_struct *, struct task_struct *)' (aka 'void (*)(void *, _Bool, unsigned int, struct task_struct *, struct task_struct *)') [-Werror,-Wincompatible-function-pointer-types]
           unregister_trace_sched_switch(probe_wakeup_sched_switch, NULL);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:222:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(sched_switch,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:273:33: note: expanded from macro '__DECLARE_TRACE'
           unregister_trace_##name(void (*probe)(data_proto), void *data)  \
                                          ^
   3 errors generated.
--
>> kernel/trace/trace_osnoise.c:1193:36: error: incompatible function pointer types passing 'void (void *, bool, struct task_struct *, struct task_struct *)' (aka 'void (void *, _Bool, struct task_struct *, struct task_struct *)') to parameter of type 'void (*)(void *, bool, unsigned int, struct task_struct *, struct task_struct *)' (aka 'void (*)(void *, _Bool, unsigned int, struct task_struct *, struct task_struct *)') [-Werror,-Wincompatible-function-pointer-types]
           ret = register_trace_sched_switch(trace_sched_switch_callback, NULL);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:222:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(sched_switch,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:260:31: note: expanded from macro '__DECLARE_TRACE'
           register_trace_##name(void (*probe)(data_proto), void *data)    \
                                        ^
   kernel/trace/trace_osnoise.c:1208:32: error: incompatible function pointer types passing 'void (void *, bool, struct task_struct *, struct task_struct *)' (aka 'void (void *, _Bool, struct task_struct *, struct task_struct *)') to parameter of type 'void (*)(void *, bool, unsigned int, struct task_struct *, struct task_struct *)' (aka 'void (*)(void *, _Bool, unsigned int, struct task_struct *, struct task_struct *)') [-Werror,-Wincompatible-function-pointer-types]
           unregister_trace_sched_switch(trace_sched_switch_callback, NULL);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:222:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(sched_switch,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:273:33: note: expanded from macro '__DECLARE_TRACE'
           unregister_trace_##name(void (*probe)(data_proto), void *data)  \
                                          ^
   2 errors generated.


vim +617 kernel/trace/trace_sched_wakeup.c

352ad25aa4a189 Steven Rostedt           2008-05-12  598  
e309b41dd65aa9 Ingo Molnar              2008-05-12  599  static void start_wakeup_tracer(struct trace_array *tr)
352ad25aa4a189 Steven Rostedt           2008-05-12  600  {
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  601  	int ret;
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  602  
38516ab59fbc5b Steven Rostedt           2010-04-20  603  	ret = register_trace_sched_wakeup(probe_wakeup, NULL);
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  604  	if (ret) {
b07c3f193a8074 Mathieu Desnoyers        2008-07-18  605  		pr_info("wakeup trace: Couldn't activate tracepoint"
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  606  			" probe to kernel_sched_wakeup\n");
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  607  		return;
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  608  	}
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  609  
38516ab59fbc5b Steven Rostedt           2010-04-20  610  	ret = register_trace_sched_wakeup_new(probe_wakeup, NULL);
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  611  	if (ret) {
b07c3f193a8074 Mathieu Desnoyers        2008-07-18  612  		pr_info("wakeup trace: Couldn't activate tracepoint"
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  613  			" probe to kernel_sched_wakeup_new\n");
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  614  		goto fail_deprobe;
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  615  	}
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  616  
38516ab59fbc5b Steven Rostedt           2010-04-20 @617  	ret = register_trace_sched_switch(probe_wakeup_sched_switch, NULL);
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  618  	if (ret) {
b07c3f193a8074 Mathieu Desnoyers        2008-07-18  619  		pr_info("sched trace: Couldn't activate tracepoint"
73d8b8bc4f24a9 Wenji Huang              2009-02-17  620  			" probe to kernel_sched_switch\n");
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  621  		goto fail_deprobe_wake_new;
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  622  	}
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  623  
38516ab59fbc5b Steven Rostedt           2010-04-20  624  	ret = register_trace_sched_migrate_task(probe_wakeup_migrate_task, NULL);
478142c39c8c2f Steven Rostedt           2009-09-09  625  	if (ret) {
478142c39c8c2f Steven Rostedt           2009-09-09  626  		pr_info("wakeup trace: Couldn't activate tracepoint"
478142c39c8c2f Steven Rostedt           2009-09-09  627  			" probe to kernel_sched_migrate_task\n");
50f9ad607ea891 Kaitao Cheng             2019-12-31  628  		goto fail_deprobe_sched_switch;
478142c39c8c2f Steven Rostedt           2009-09-09  629  	}
478142c39c8c2f Steven Rostedt           2009-09-09  630  
352ad25aa4a189 Steven Rostedt           2008-05-12  631  	wakeup_reset(tr);
352ad25aa4a189 Steven Rostedt           2008-05-12  632  
352ad25aa4a189 Steven Rostedt           2008-05-12  633  	/*
352ad25aa4a189 Steven Rostedt           2008-05-12  634  	 * Don't let the tracer_enabled = 1 show up before
352ad25aa4a189 Steven Rostedt           2008-05-12  635  	 * the wakeup_task is reset. This may be overkill since
352ad25aa4a189 Steven Rostedt           2008-05-12  636  	 * wakeup_reset does a spin_unlock after setting the
352ad25aa4a189 Steven Rostedt           2008-05-12  637  	 * wakeup_task to NULL, but I want to be safe.
352ad25aa4a189 Steven Rostedt           2008-05-12  638  	 * This is a slow path anyway.
352ad25aa4a189 Steven Rostedt           2008-05-12  639  	 */
352ad25aa4a189 Steven Rostedt           2008-05-12  640  	smp_wmb();
352ad25aa4a189 Steven Rostedt           2008-05-12  641  
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  642) 	if (start_func_tracer(tr, is_graph(tr)))
7495a5beaa22f1 Jiri Olsa                2010-09-23  643  		printk(KERN_ERR "failed to start wakeup tracer\n");
ad591240ceadca Steven Rostedt           2008-07-10  644  
352ad25aa4a189 Steven Rostedt           2008-05-12  645  	return;
50f9ad607ea891 Kaitao Cheng             2019-12-31  646  fail_deprobe_sched_switch:
50f9ad607ea891 Kaitao Cheng             2019-12-31  647  	unregister_trace_sched_switch(probe_wakeup_sched_switch, NULL);
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  648  fail_deprobe_wake_new:
38516ab59fbc5b Steven Rostedt           2010-04-20  649  	unregister_trace_sched_wakeup_new(probe_wakeup, NULL);
5b82a1b08a00b2 Mathieu Desnoyers        2008-05-12  650  fail_deprobe:
38516ab59fbc5b Steven Rostedt           2010-04-20  651  	unregister_trace_sched_wakeup(probe_wakeup, NULL);
352ad25aa4a189 Steven Rostedt           2008-05-12  652  }
352ad25aa4a189 Steven Rostedt           2008-05-12  653  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
