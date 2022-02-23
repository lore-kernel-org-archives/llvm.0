Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213396AAF
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645645009; x=1677181009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mk3aN3pcpAB7oiE45QTenKkiA2nwTqBeLt06UaOynF4=;
  b=jb9ytYSi4pJMwqMIXliwKCSiotGpMh4+HwdRSp1ycDmLNpV6kzz+WVdc
   u6UknZMZnH16KLjnLZii2/2SdYUWu0dPCi0Dyk63LP64ewuScROkoe0Db
   aYQD2qUYaZ9D7a/cwaO6sCVA0SGQ3m9cYwLewM43txVZHV0MVLvUMui6Y
   bfmU6M7VL6UWdwZxXtlxZlOBC8Ne5srThfmlr4EsMz9uN9YOHvQBnCeD1
   syzzXXURIU7WfnYFBv4hPUIVqxYo+z53xaxRiUXVbN0ulpFUtHIYLZR9o
   J0AvoIkHH/mW19nW0QcBYNk2Y5y/9e8BbQySWOOXkfpdsVY4nnmVkq38k
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="250892992"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="250892992"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 11:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="776797599"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2022 11:36:45 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMxRM-0001kK-S2; Wed, 23 Feb 2022 19:36:44 +0000
Date: Thu, 24 Feb 2022 03:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 571/2340]
 arch/s390/include/asm/preempt.h:110:42: error: implicit declaration of
 function 'task_thread_info'
Message-ID: <202202240337.1ug9UnXJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   97c5eeb4de3ad324ed2a4656b46465299cfd010a
commit: 32c0f4ef20d93c78fce830a2fe6cc83db8bb29d0 [571/2340] headers/deps: Move task->thread_info to per_task()
config: s390-randconfig-r044-20220223 (https://download.01.org/0day-ci/archive/20220224/202202240337.1ug9UnXJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=32c0f4ef20d93c78fce830a2fe6cc83db8bb29d0
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 32c0f4ef20d93c78fce830a2fe6cc83db8bb29d0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:78:
>> arch/s390/include/asm/preempt.h:110:42: error: implicit declaration of function 'task_thread_info' [-Werror,-Wimplicit-function-declaration]
           return !--S390_lowcore.preempt_count && tif_need_resched();
                                                   ^
   include/linux/sched/thread_info_api_lowlevel.h:103:28: note: expanded from macro 'tif_need_resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^
   include/linux/sched/thread_info_api_lowlevel.h:64:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:26:32: note: expanded from macro 'current_thread_info'
   # define current_thread_info() task_thread_info(current)
                                  ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:78:
>> arch/s390/include/asm/preempt.h:110:42: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct thread_info *' [-Wint-conversion]
           return !--S390_lowcore.preempt_count && tif_need_resched();
                                                   ^~~~~~~~~~~~~~~~~~
   include/linux/sched/thread_info_api_lowlevel.h:103:28: note: expanded from macro 'tif_need_resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/thread_info_api_lowlevel.h:64:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:26:32: note: expanded from macro 'current_thread_info'
   # define current_thread_info() task_thread_info(current)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/thread_info_api_lowlevel.h:39:59: note: passing argument to parameter 'ti' here
   static inline int test_ti_thread_flag(struct thread_info *ti, int flag)
                                                             ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:78:
   arch/s390/include/asm/preempt.h:116:4: error: implicit declaration of function 'task_thread_info' [-Werror,-Wimplicit-function-declaration]
                           tif_need_resched());
                           ^
   include/linux/sched/thread_info_api_lowlevel.h:103:28: note: expanded from macro 'tif_need_resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^
   include/linux/sched/thread_info_api_lowlevel.h:64:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:26:32: note: expanded from macro 'current_thread_info'
   # define current_thread_info() task_thread_info(current)
                                  ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:78:
   arch/s390/include/asm/preempt.h:116:4: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct thread_info *' [-Wint-conversion]
                           tif_need_resched());
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/sched/thread_info_api_lowlevel.h:103:28: note: expanded from macro 'tif_need_resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^
   include/linux/sched/thread_info_api_lowlevel.h:64:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:26:32: note: expanded from macro 'current_thread_info'
   # define current_thread_info() task_thread_info(current)
                                  ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   include/linux/sched/thread_info_api_lowlevel.h:39:59: note: passing argument to parameter 'ti' here
   static inline int test_ti_thread_flag(struct thread_info *ti, int flag)
                                                             ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:78:
   arch/s390/include/asm/preempt.h:116:4: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct thread_info *' [-Wint-conversion]
                           tif_need_resched());
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/sched/thread_info_api_lowlevel.h:103:28: note: expanded from macro 'tif_need_resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^
   include/linux/sched/thread_info_api_lowlevel.h:64:22: note: expanded from macro 'test_thread_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:26:32: note: expanded from macro 'current_thread_info'
   # define current_thread_info() task_thread_info(current)
                                  ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/sched/thread_info_api_lowlevel.h:39:59: note: passing argument to parameter 'ti' here
   static inline int test_ti_thread_flag(struct thread_info *ti, int flag)
                                                             ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:9:
   In file included from include/linux/sched.h:12:
   include/linux/sched/per_task.h:48:11: fatal error: 'generated/asm-offsets.h' file not found
   # include <generated/asm-offsets.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 3 errors generated.
   make[2]: *** [scripts/Makefile.build:121: arch/s390/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2


vim +/task_thread_info +110 arch/s390/include/asm/preempt.h

c360192bf4a8dc Martin Schwidefsky 2016-10-25  107  
c360192bf4a8dc Martin Schwidefsky 2016-10-25  108  static inline bool __preempt_count_dec_and_test(void)
c360192bf4a8dc Martin Schwidefsky 2016-10-25  109  {
c360192bf4a8dc Martin Schwidefsky 2016-10-25 @110  	return !--S390_lowcore.preempt_count && tif_need_resched();
c360192bf4a8dc Martin Schwidefsky 2016-10-25  111  }
c360192bf4a8dc Martin Schwidefsky 2016-10-25  112  

:::::: The code at line 110 was first introduced by commit
:::::: c360192bf4a8dc72f102dd6a4e1bf8bd0b404cfa s390/preempt: move preempt_count to the lowcore

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
