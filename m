Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51763C80
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 20:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644869660; x=1676405660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JhLFQZ1xSmND0qYB4DFzgdj31fYg9yEINLTYfCrIegA=;
  b=GPME+H7OMDP+izmSWbBJlRx94RThd75JIYUCcBXw1hrjwOTs80C8MtzT
   rToR3oPnSMZPfLhMRBvY41zgaU5dMzmjprDTOmG4ErJbSii9ja/0u+ALz
   4Cf+Vw0hF5uu3kFlPyxPR/cEaX3BcRz6mseHAtCZTnkAZ86QlHOE1ZYBS
   eXiYGmB96fxpOUzvEvql4xlS0WgUIl+b2VNL1uwxljVd4BIzX/thFUHgO
   ddK9Veeku/ZrQf3B99X3k6DLCwoCJETtEcWqHOL4kd4bi2ARNjfWI0Kfa
   J6Vm0CEguyEA64mW2em8ZW0Cv8LCGHA2zdGwbk83utjrJcKN+0XQV7AEF
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="247770787"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="247770787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 12:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="570438556"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2022 12:14:18 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJhjl-0008te-J8; Mon, 14 Feb 2022 20:14:17 +0000
Date: Tue, 15 Feb 2022 04:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V2 09/21] rv/monitor: wip instrumentation and
 Makefile/Kconfig entries
Message-ID: <202202150429.Rn1Sp6Xo-lkp@intel.com>
References: <87e86ddb840f7c69a5a9348974936de918ca3036.1644830251.git.bristot@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e86ddb840f7c69a5a9348974936de918ca3036.1644830251.git.bristot@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on lwn/docs-next linus/master v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220214-193144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220215/202202150429.Rn1Sp6Xo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d19976adc824ba2162ba4c5690e0a2f2aba219a6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220214-193144
        git checkout d19976adc824ba2162ba4c5690e0a2f2aba219a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/rv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/monitor_wip/wip.c:23:1: warning: no previous prototype for function 'model_get_state_name_wip' [-Wmissing-prototypes]
   DECLARE_DA_MON_PER_CPU(wip, char);
   ^
   include/rv/da_monitor.h:374:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/automata.h:18:7: note: expanded from macro '\
   DECLARE_AUTOMATA_HELPERS'
   char *model_get_state_name_##name(enum states_##name state)                     \
         ^
   <scratch space>:86:1: note: expanded from here
   model_get_state_name_wip
   ^
   kernel/trace/rv/monitor_wip/wip.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/rv/da_monitor.h:374:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/automata.h:17:11: note: expanded from macro '\
   DECLARE_AUTOMATA_HELPERS'
                                                                                   \
                                                                                   ^
>> kernel/trace/rv/monitor_wip/wip.c:23:1: warning: no previous prototype for function 'model_get_event_name_wip' [-Wmissing-prototypes]
   DECLARE_DA_MON_PER_CPU(wip, char);
   ^
   include/rv/da_monitor.h:374:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/automata.h:23:7: note: expanded from macro '\
   DECLARE_AUTOMATA_HELPERS'
   char *model_get_event_name_##name(enum events_##name event)                     \
         ^
   <scratch space>:89:1: note: expanded from here
   model_get_event_name_wip
   ^
   kernel/trace/rv/monitor_wip/wip.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/rv/da_monitor.h:374:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/automata.h:22:11: note: expanded from macro '\
   DECLARE_AUTOMATA_HELPERS'
                                                                                   \
                                                                                   ^
>> kernel/trace/rv/monitor_wip/wip.c:23:1: warning: no previous prototype for function 'da_get_monitor_wip' [-Wmissing-prototypes]
   DECLARE_DA_MON_PER_CPU(wip, char);
   ^
   include/rv/da_monitor.h:380:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/da_monitor.h:172:20: note: expanded from macro '\
   DECLARE_DA_MON_INIT_PER_CPU'
   struct da_monitor *da_get_monitor_##name(void)                                  \
                      ^
   <scratch space>:126:1: note: expanded from here
   da_get_monitor_wip
   ^
   kernel/trace/rv/monitor_wip/wip.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/rv/da_monitor.h:380:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/da_monitor.h:171:11: note: expanded from macro '\
   DECLARE_DA_MON_INIT_PER_CPU'
                                                                                   \
                                                                                   ^
>> kernel/trace/rv/monitor_wip/wip.c:23:1: warning: no previous prototype for function 'da_monitor_reset_all_wip' [-Wmissing-prototypes]
   DECLARE_DA_MON_PER_CPU(wip, char);
   ^
   include/rv/da_monitor.h:380:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/da_monitor.h:177:6: note: expanded from macro '\
   DECLARE_DA_MON_INIT_PER_CPU'
   void da_monitor_reset_all_##name(void)                                          \
        ^
   <scratch space>:128:1: note: expanded from here
   da_monitor_reset_all_wip
   ^
   kernel/trace/rv/monitor_wip/wip.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/rv/da_monitor.h:380:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/da_monitor.h:176:11: note: expanded from macro '\
   DECLARE_DA_MON_INIT_PER_CPU'
                                                                                   \
                                                                                   ^
>> kernel/trace/rv/monitor_wip/wip.c:36:6: warning: no previous prototype for function 'handle_preempt_disable' [-Wmissing-prototypes]
   void handle_preempt_disable(void *data, unsigned long ip, unsigned long parent_ip)
        ^
   kernel/trace/rv/monitor_wip/wip.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void handle_preempt_disable(void *data, unsigned long ip, unsigned long parent_ip)
   ^
   static 
>> kernel/trace/rv/monitor_wip/wip.c:41:6: warning: no previous prototype for function 'handle_preempt_enable' [-Wmissing-prototypes]
   void handle_preempt_enable(void *data, unsigned long ip, unsigned long parent_ip)
        ^
   kernel/trace/rv/monitor_wip/wip.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void handle_preempt_enable(void *data, unsigned long ip, unsigned long parent_ip)
   ^
   static 
>> kernel/trace/rv/monitor_wip/wip.c:46:6: warning: no previous prototype for function 'handle_sched_waking' [-Wmissing-prototypes]
   void handle_sched_waking(void *data, struct task_struct *task)
        ^
   kernel/trace/rv/monitor_wip/wip.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void handle_sched_waking(void *data, struct task_struct *task)
   ^
   static 
>> kernel/trace/rv/monitor_wip/wip.c:105:5: warning: no previous prototype for function 'register_wip' [-Wmissing-prototypes]
   int register_wip(void)
       ^
   kernel/trace/rv/monitor_wip/wip.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int register_wip(void)
   ^
   static 
>> kernel/trace/rv/monitor_wip/wip.c:111:6: warning: no previous prototype for function 'unregister_wip' [-Wmissing-prototypes]
   void unregister_wip(void)
        ^
   kernel/trace/rv/monitor_wip/wip.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_wip(void)
   ^
   static 
   kernel/trace/rv/monitor_wip/wip.c:23:1: warning: unused function 'da_handle_init_run_event_wip' [-Wunused-function]
   DECLARE_DA_MON_PER_CPU(wip, char);
   ^
   include/rv/da_monitor.h:382:11: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
                                                                                   \
                                                                                   ^
   include/rv/da_monitor.h:285:20: note: expanded from macro '\
   DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT'
   static inline bool da_handle_init_run_event_##name(enum events_##name event)    \
                      ^
   <scratch space>:152:1: note: expanded from here
   da_handle_init_run_event_wip
   ^
   10 warnings generated.


vim +/model_get_state_name_wip +23 kernel/trace/rv/monitor_wip/wip.c

66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   16  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   17  /*
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   18   * Declare the deterministic automata monitor.
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   19   *
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   20   * The rv monitor reference is needed for the monitor declaration.
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   21   */
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   22  struct rv_monitor rv_wip;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  @23  DECLARE_DA_MON_PER_CPU(wip, char);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   24  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   25  #define CREATE_TRACE_POINTS
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   26  #include "wip.h"
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   27  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   28  /*
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   29   * This is the instrumentation part of the monitor.
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   30   *
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   31   * This is the section where manual work is required. Here the kernel events
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   32   * are translated into model's event.
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   33   *
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   34   */
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   35  
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14  @36  void handle_preempt_disable(void *data, unsigned long ip, unsigned long parent_ip)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   37  {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   38  	da_handle_event_wip(preempt_disable);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   39  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   40  
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14  @41  void handle_preempt_enable(void *data, unsigned long ip, unsigned long parent_ip)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   42  {
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14   43  	da_handle_init_event_wip(preempt_enable);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   44  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   45  
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14  @46  void handle_sched_waking(void *data, struct task_struct *task)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   47  {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   48  	da_handle_event_wip(sched_waking);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   49  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   50  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   51  #define NR_TP	3
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   52  static struct tracepoint_hook_helper tracepoints_to_hook[NR_TP] = {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   53  	{
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   54  		.probe = handle_preempt_disable,
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14   55  		.name = "preempt_disable",
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   56  		.registered = 0
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   57  	},
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   58  	{
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   59  		.probe = handle_preempt_enable,
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14   60  		.name = "preempt_enable",
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   61  		.registered = 0
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   62  	},
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   63  	{
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   64  		.probe = handle_sched_waking,
d19976adc824ba Daniel Bristot de Oliveira 2022-02-14   65  		.name = "sched_wakeup",
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   66  		.registered = 0
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   67  	},
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   68  };
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   69  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   70  static int start_wip(void)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   71  {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   72  	int retval;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   73  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   74  	da_monitor_init_wip();
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   75  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   76  	retval = thh_hook_probes(tracepoints_to_hook, NR_TP);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   77  	if (retval)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   78  		goto out_err;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   79  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   80  	return 0;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   81  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   82  out_err:
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   83  	return -EINVAL;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   84  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   85  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   86  static void stop_wip(void)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   87  {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   88  	rv_wip.enabled = 0;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   89  	thh_unhook_probes(tracepoints_to_hook, NR_TP);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   90  	return;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   91  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   92  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   93  /*
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   94   * This is the monitor register section.
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   95   */
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   96  struct rv_monitor rv_wip = {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   97  	.name = "wip",
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   98  	.description = "auto-generated wip",
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14   99  	.start = start_wip,
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  100  	.stop = stop_wip,
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  101  	.reset = da_monitor_reset_all_wip,
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  102  	.enabled = 0,
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  103  };
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  104  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14 @105  int register_wip(void)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  106  {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  107  	rv_register_monitor(&rv_wip);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  108  	return 0;
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  109  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  110  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14 @111  void unregister_wip(void)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  112  {
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  113  	if (rv_wip.enabled)
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  114  		stop_wip();
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  115  
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  116  	rv_unregister_monitor(&rv_wip);
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  117  }
66e3ae1a584a3c Daniel Bristot de Oliveira 2022-02-14  118  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
