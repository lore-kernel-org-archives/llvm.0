Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC654430;
	Sun, 27 Aug 2023 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693130803; x=1724666803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4To0BMq1nUUO1Qml1nnwtlY+kEjbsZeCP7EQYcP0WJs=;
  b=L9EcLOXOmCLossSyQZEUdP7elUQ6omhu3ruV1p8gB4eBdQ0xWcU549Rt
   Wy29YiLiIJI8P9sCegMvrcSYYA7aFiRHuvBvHuY1x99tlx6R5JmDcEe9m
   X6RCQC17sVSMksUVSENi+WKxmqUOytt+NxyJoN8OLcSZNda5Dk8Yoq2t6
   Djgyh+6Dy7YPh+DmSu8Ma44UihtLn1P77G+WMJy1D6A78SawSzh7wWMmz
   eKUe7Q/GqOHWhgw8CFEM046T8z9RRVr5ooL4mDXWxTmZk6GWXf+79Ub4G
   KexptOlIOpgC2sBbm74PeKfeK7TQqtT3MHB69BhRiYygHLAj2UyvrqM9t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="378715519"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="378715519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 03:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="803396499"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="803396499"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Aug 2023 03:06:40 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaCfH-0005ep-3B;
	Sun, 27 Aug 2023 10:06:39 +0000
Date: Sun, 27 Aug 2023 18:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/12]
 drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared
 function '__module_param_call'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202308271711.CaOUqEZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   2fb1bbc283d33b7edd57b0279c54d0250d91e9f3
commit: 51d86e5ab04ef58e95586730ea4dfa1c7aedb354 [11/12] kthread: Provide a mechanism to control kthread sched_attr
config: x86_64-randconfig-016-20230827 (https://download.01.org/0day-ci/archive/20230827/202308271711.CaOUqEZz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271711.CaOUqEZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271711.CaOUqEZz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   threads[i] = kthread_run(__find_race, &data, "dmabuf/%d", i);
                                ^
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:17:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_policy);             \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:18:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, long, sched_nice);                        \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:19:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_priority);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:20:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_runtime);       \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:21:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_deadline);      \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:22:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_period);        \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:23:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_util_min);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence-chain.c:463:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:24:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_util_max);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   drivers/dma-buf/st-dma-fence-chain.c:583:8: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
                 ^
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:17:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_policy);             \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   drivers/dma-buf/st-dma-fence-chain.c:583:8: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:18:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, long, sched_nice);                        \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   drivers/dma-buf/st-dma-fence-chain.c:583:8: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:19:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_priority);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   drivers/dma-buf/st-dma-fence-chain.c:583:8: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:20:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_runtime);       \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   drivers/dma-buf/st-dma-fence-chain.c:583:8: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:21:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_deadline);      \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   drivers/dma-buf/st-dma-fence-chain.c:583:8: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
--
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           t[i].task = kthread_run(thread_signal_callback, &t[i],
                                       ^
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:17:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_policy);             \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:18:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, long, sched_nice);                        \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:19:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_priority);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:20:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_runtime);       \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:21:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_deadline);      \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:22:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long long, sched_period);        \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:23:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_util_min);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
>> drivers/dma-buf/st-dma-fence.c:541:16: error: call to undeclared function '__module_param_call'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/kthread.h:109:5: note: expanded from macro 'kthread_run'
                   = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
                     ^
   include/linux/kthread.h:80:2: note: expanded from macro 'kthread_create'
           kthread_param(namefmt);                                                 \
           ^
   include/linux/kthread.h:24:2: note: expanded from macro 'kthread_param'
           __kthread_param(name, unsigned long, sched_util_max);           \
           ^
   include/linux/kthread.h:14:2: note: expanded from macro '__kthread_param'
           ___kthread_param(name, type, attr, 0644)        \
           ^
   include/linux/kthread.h:10:2: note: expanded from macro '___kthread_param'
           __module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
           ^
   8 errors generated.


vim +/__module_param_call +463 drivers/dma-buf/st-dma-fence-chain.c

dc2f7e67a28a5c Chris Wilson 2020-04-09  441  
dc2f7e67a28a5c Chris Wilson 2020-04-09  442  static int find_race(void *arg)
dc2f7e67a28a5c Chris Wilson 2020-04-09  443  {
dc2f7e67a28a5c Chris Wilson 2020-04-09  444  	struct find_race data;
dc2f7e67a28a5c Chris Wilson 2020-04-09  445  	int ncpus = num_online_cpus();
dc2f7e67a28a5c Chris Wilson 2020-04-09  446  	struct task_struct **threads;
dc2f7e67a28a5c Chris Wilson 2020-04-09  447  	unsigned long count;
dc2f7e67a28a5c Chris Wilson 2020-04-09  448  	int err;
dc2f7e67a28a5c Chris Wilson 2020-04-09  449  	int i;
dc2f7e67a28a5c Chris Wilson 2020-04-09  450  
dc2f7e67a28a5c Chris Wilson 2020-04-09  451  	err = fence_chains_init(&data.fc, CHAIN_SZ, seqno_inc);
dc2f7e67a28a5c Chris Wilson 2020-04-09  452  	if (err)
dc2f7e67a28a5c Chris Wilson 2020-04-09  453  		return err;
dc2f7e67a28a5c Chris Wilson 2020-04-09  454  
dc2f7e67a28a5c Chris Wilson 2020-04-09  455  	threads = kmalloc_array(ncpus, sizeof(*threads), GFP_KERNEL);
dc2f7e67a28a5c Chris Wilson 2020-04-09  456  	if (!threads) {
dc2f7e67a28a5c Chris Wilson 2020-04-09  457  		err = -ENOMEM;
dc2f7e67a28a5c Chris Wilson 2020-04-09  458  		goto err;
dc2f7e67a28a5c Chris Wilson 2020-04-09  459  	}
dc2f7e67a28a5c Chris Wilson 2020-04-09  460  
dc2f7e67a28a5c Chris Wilson 2020-04-09  461  	atomic_set(&data.children, 0);
dc2f7e67a28a5c Chris Wilson 2020-04-09  462  	for (i = 0; i < ncpus; i++) {
dc2f7e67a28a5c Chris Wilson 2020-04-09 @463  		threads[i] = kthread_run(__find_race, &data, "dmabuf/%d", i);
dc2f7e67a28a5c Chris Wilson 2020-04-09  464  		if (IS_ERR(threads[i])) {
dc2f7e67a28a5c Chris Wilson 2020-04-09  465  			ncpus = i;
dc2f7e67a28a5c Chris Wilson 2020-04-09  466  			break;
dc2f7e67a28a5c Chris Wilson 2020-04-09  467  		}
dc2f7e67a28a5c Chris Wilson 2020-04-09  468  		atomic_inc(&data.children);
dc2f7e67a28a5c Chris Wilson 2020-04-09  469  		get_task_struct(threads[i]);
dc2f7e67a28a5c Chris Wilson 2020-04-09  470  	}
dc2f7e67a28a5c Chris Wilson 2020-04-09  471  
dc2f7e67a28a5c Chris Wilson 2020-04-09  472  	wait_var_event_timeout(&data.children,
dc2f7e67a28a5c Chris Wilson 2020-04-09  473  			       !atomic_read(&data.children),
dc2f7e67a28a5c Chris Wilson 2020-04-09  474  			       5 * HZ);
dc2f7e67a28a5c Chris Wilson 2020-04-09  475  
dc2f7e67a28a5c Chris Wilson 2020-04-09  476  	for (i = 0; i < ncpus; i++) {
dc2f7e67a28a5c Chris Wilson 2020-04-09  477  		int ret;
dc2f7e67a28a5c Chris Wilson 2020-04-09  478  
dc2f7e67a28a5c Chris Wilson 2020-04-09  479  		ret = kthread_stop(threads[i]);
dc2f7e67a28a5c Chris Wilson 2020-04-09  480  		if (ret && !err)
dc2f7e67a28a5c Chris Wilson 2020-04-09  481  			err = ret;
dc2f7e67a28a5c Chris Wilson 2020-04-09  482  		put_task_struct(threads[i]);
dc2f7e67a28a5c Chris Wilson 2020-04-09  483  	}
dc2f7e67a28a5c Chris Wilson 2020-04-09  484  	kfree(threads);
dc2f7e67a28a5c Chris Wilson 2020-04-09  485  
dc2f7e67a28a5c Chris Wilson 2020-04-09  486  	count = 0;
dc2f7e67a28a5c Chris Wilson 2020-04-09  487  	for (i = 0; i < data.fc.chain_length; i++)
dc2f7e67a28a5c Chris Wilson 2020-04-09  488  		if (dma_fence_is_signaled(data.fc.fences[i]))
dc2f7e67a28a5c Chris Wilson 2020-04-09  489  			count++;
dc2f7e67a28a5c Chris Wilson 2020-04-09  490  	pr_info("Completed %lu cycles\n", count);
dc2f7e67a28a5c Chris Wilson 2020-04-09  491  
dc2f7e67a28a5c Chris Wilson 2020-04-09  492  err:
dc2f7e67a28a5c Chris Wilson 2020-04-09  493  	fence_chains_fini(&data.fc);
dc2f7e67a28a5c Chris Wilson 2020-04-09  494  	return err;
dc2f7e67a28a5c Chris Wilson 2020-04-09  495  }
dc2f7e67a28a5c Chris Wilson 2020-04-09  496  

:::::: The code at line 463 was first introduced by commit
:::::: dc2f7e67a28a5cbe4ea905dafaa6903df670014a dma-buf: Exercise dma-fence-chain under selftests

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
