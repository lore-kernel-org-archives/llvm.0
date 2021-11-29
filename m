Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6772
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 16:39:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322242479"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="322242479"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 08:39:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="540046784"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Nov 2021 08:39:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mrjgP-000C82-0e; Mon, 29 Nov 2021 16:39:13 +0000
Date: Tue, 30 Nov 2021 00:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] sched/tracing: Don't re-read p->state when
 emitting sched_switch event
Message-ID: <202111300012.4hj0hPuG-lkp@intel.com>
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
config: hexagon-randconfig-r045-20211129 (https://download.01.org/0day-ci/archive/20211130/202111300012.4hj0hPuG-lkp@intel.com/config)
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


vim +1193 kernel/trace/trace_osnoise.c

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1182  
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1183  /*
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1184   * hook_thread_events - Hook the insturmentation for thread noise
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1185   *
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1186   * Hook the osnoise tracer callbacks to handle the noise from other
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1187   * threads on the necessary kernel events.
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1188   */
f7d9f6370e0064 Daniel Bristot de Oliveira 2021-06-28  1189  static int hook_thread_events(void)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1190  {
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1191  	int ret;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1192  
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22 @1193  	ret = register_trace_sched_switch(trace_sched_switch_callback, NULL);
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1194  	if (ret)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1195  		return -EINVAL;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1196  
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1197  	return 0;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1198  }
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  1199  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
