Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F2C151;
	Sat, 26 Aug 2023 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693045783; x=1724581783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFLWRld2y45GLEwEXqQhbgkN3oUo1/+HiHcD/SZ6tlc=;
  b=Q9ud4vlrNFeve7rR01IM5/7ao7aHrdKtPemggldH7bxnJPxIT2cjDfVD
   5qLfCXPDWFu9vRnpNG98Z0gXwoQnKxUBR+AbCNLMP1YGNwPg8v09YdXP2
   OHv2sUJrInaHGZTyIfXYd1Gzzfh4AUnvqOV6CFjX3MHC1llwDgwNNv6wG
   yP9GHIXBVx1KO3c9pm0fSw0ZeQ6Y5c29aeuGOQzyJ+55+emxZ1u4palIt
   /gGQdeL44ZR1zRPhUwsWV90SbAjEu1zW2rGsdmJyTTSZc17FzM9dj+PMO
   CmbLheLx/Zg5H9zbOtpQ5OYkNdT3kUwM0rEpiKMQ1NZl/6axoDFqFX3mB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359857845"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="359857845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 03:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861320498"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="861320498"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Aug 2023 03:29:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZqXy-0004bz-39;
	Sat, 26 Aug 2023 10:29:38 +0000
Date: Sat, 26 Aug 2023 18:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 9/9]
 include/linux/kthread.h:28:65: warning: declaration of 'struct kernel_param'
 will not be visible outside of this function
Message-ID: <202308261806.y6VTMxtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: e586c67baa1c537a793f135e324cc56df2b6585b [9/9] kthread: Provide a mechanism to control kthread sched_attr
config: i386-randconfig-r022-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261806.y6VTMxtP-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261806.y6VTMxtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261806.y6VTMxtP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/trace/preemptirq_delay_test.c:14:
>> include/linux/kthread.h:28:65: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
                                                                   ^
   include/linux/kthread.h:29:62: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
                                                                ^
   include/linux/kthread.h:32:63: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
                                                                 ^
   include/linux/kthread.h:33:60: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
                                                              ^
   include/linux/kthread.h:36:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:37:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:40:66: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
                                                                    ^
   include/linux/kthread.h:41:63: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
                                                                 ^
   include/linux/kthread.h:44:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:45:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:48:65: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
                                                                   ^
   include/linux/kthread.h:49:62: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
                                                                ^
   include/linux/kthread.h:52:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:53:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:56:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:57:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
                                                                  ^
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
           task =  kthread_run(preemptirq_delay_run, NULL, task_name);
                                                           ^
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
>> kernel/trace/preemptirq_delay_test.c:155:50: error: expected ';' at end of declaration
   16 warnings and 8 errors generated.
--
   In file included from kernel/trace/trace_events.c:17:
>> include/linux/kthread.h:28:65: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
                                                                   ^
   include/linux/kthread.h:29:62: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
                                                                ^
   include/linux/kthread.h:32:63: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
                                                                 ^
   include/linux/kthread.h:33:60: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
                                                              ^
   include/linux/kthread.h:36:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:37:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:40:66: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
                                                                    ^
   include/linux/kthread.h:41:63: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
                                                                 ^
   include/linux/kthread.h:44:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:45:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:48:65: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
                                                                   ^
   include/linux/kthread.h:49:62: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
                                                                ^
   include/linux/kthread.h:52:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:53:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:56:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:57:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
                                                                  ^
   16 warnings generated.
--
   In file included from drivers/gpu/drm/scheduler/sched_main.c:51:
>> include/linux/kthread.h:28:65: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
                                                                   ^
   include/linux/kthread.h:29:62: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
                                                                ^
   include/linux/kthread.h:32:63: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
                                                                 ^
   include/linux/kthread.h:33:60: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
                                                              ^
   include/linux/kthread.h:36:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:37:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:40:66: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
                                                                    ^
   include/linux/kthread.h:41:63: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
                                                                 ^
   include/linux/kthread.h:44:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:45:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:48:65: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
                                                                   ^
   include/linux/kthread.h:49:62: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
                                                                ^
   include/linux/kthread.h:52:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:53:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
                                                                  ^
   include/linux/kthread.h:56:67: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
                                                                     ^
   include/linux/kthread.h:57:64: warning: declaration of 'struct kernel_param' will not be visible outside of this function [-Wvisibility]
   extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
                                                                  ^
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
           sched->thread = kthread_run(drm_sched_main, sched, sched->name);
                                                              ^
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
>> drivers/gpu/drm/scheduler/sched_main.c:1113:53: error: expected ';' at end of declaration
   16 warnings and 8 errors generated.


vim +28 include/linux/kthread.h

     7	
     8	#define ___kthread_param(name, type, attr, perm) do {	\
     9		static type attr;				\
    10		__module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
    11		} while(0)
    12	
    13	#define __kthread_param(name, type, attr)		\
    14		___kthread_param(name, type, attr, 0644)	\
    15	
    16	#define kthread_param(name) do {					\
    17		__kthread_param(name, unsigned long, sched_policy);		\
    18		__kthread_param(name, long, sched_nice);			\
    19		__kthread_param(name, unsigned long, sched_priority);		\
    20		__kthread_param(name, unsigned long long, sched_runtime);	\
    21		__kthread_param(name, unsigned long long, sched_deadline);	\
    22		__kthread_param(name, unsigned long long, sched_period);	\
    23		__kthread_param(name, unsigned long, sched_util_min);		\
    24		__kthread_param(name, unsigned long, sched_util_max);		\
    25		} while (0)
    26	
    27	extern const struct kernel_param_ops param_ops_sched_policy;
  > 28	extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
    29	extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
