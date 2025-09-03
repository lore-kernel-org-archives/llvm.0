Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDE035206B;
	Wed,  3 Sep 2025 17:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756922286; cv=none; b=JYUOjrZjQpzktkaUyifwHZk6xefza6HNYheeCp99FCPoEYuL2yll/am49Kj91nA6zTyfD8suAZCTRixKq5stWq/DOsxdundF+ITI901Jwkb45fUpwrK7VvZJ+4OoqRXs1oEj3KNNSFuT67ciot1DH/ipy4Qj/8+syGsZ6SeW1UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756922286; c=relaxed/simple;
	bh=R3Db/ZFIDnhYFFS5mkFyMEBNN9IWbCoyUpisLFxNOZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPtS1xKSNu4VBU/B/7X7yYtzo9DYgjB24AZyqnh+2lpO9osQ8Wm1z7E80flZ+am0JiSJ9muIeYvsYin1dXx7cWfyXZhOBv7ckcHDUqAJoQm/GaiizkytrD/f/oRj9L1WJALysYpDNML5HAW/Yt2aGkQj7GImU7pXiRWfzs/Yd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=El0hoa8X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El0hoa8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756922284; x=1788458284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3Db/ZFIDnhYFFS5mkFyMEBNN9IWbCoyUpisLFxNOZ8=;
  b=El0hoa8Xg6t2dfP7r9K47bCuadmZu7cVCOSnfhDZP7wUCJGWdtxZUWSf
   EjGkVo3DD8pq1o0DiCkhlWOQR3b/MgzTiplzeIYJM5mhQH7rE+ko4qncR
   jGyBSE5y9VVpbNGJaNrk+EdZSbGL1QQcthKVgbNFssogIV51/BDpLJ5Y4
   6Vj5atHdFRdxXdURTkLFHiXQDZvq985vyOjZlUgW+EXdK66JRu7pnP1eW
   hq6IqKoyQQla5MP8CPFpaNf0B8QXIJOVze0EPeZCuk66rhSERbhJooZHC
   MVMrWfP7lUuNXDCjle8xhRYFc9Rky+oGiJs46rQWaVftWrEYtq6KUKtFK
   Q==;
X-CSE-ConnectionGUID: 1062licUTD+22DbO5GvLAg==
X-CSE-MsgGUID: ZRPVqU4nQfelCYQKv9DmKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="63069293"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="63069293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:57:59 -0700
X-CSE-ConnectionGUID: vrAXKNcDSauBbXCy6Y7ugA==
X-CSE-MsgGUID: eyEA47UvRh+7Vaeg4EScUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176021623"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2025 10:57:57 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utrk2-0004Gb-2N;
	Wed, 03 Sep 2025 17:57:54 +0000
Date: Thu, 4 Sep 2025 01:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [brauner-github:vfs.all 74/95] include/rv/ltl_monitor.h:75:44:
 error: incompatible function pointer types passing 'void (void *, struct
 task_struct *, unsigned long)' to parameter of type 'void (*)(void *, struct
 task_struct *, u64)' (aka 'void (*)(void *, struct task_struct *, unsigne...
Message-ID: <202509040134.bQVbm7ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/ed/edd3cb05c00a040dc72bed20b14b5ba865188bce-first_error_kconfig --flag create-dir

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/brauner/linux.git vfs.all
head:   d02ae3528998236f054c6f56002ab858cc77eb9a
commit: edd3cb05c00a040dc72bed20b14b5ba865188bce [74/95] copy_process: pass clone_flags as u64 across calltree
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250904/202509040134.bQVbm7ja-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040134.bQVbm7ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040134.bQVbm7ja-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/sleep/sleep.c:23:
>> include/rv/ltl_monitor.h:75:44: error: incompatible function pointer types passing 'void (void *, struct task_struct *, unsigned long)' to parameter of type 'void (*)(void *, struct task_struct *, u64)' (aka 'void (*)(void *, struct task_struct *, unsigned long long)') [-Wincompatible-function-pointer-types]
      75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
         |                                                   ^~~~~~~~~~~~~~~~~~~
   include/rv/instrumentation.h:18:34: note: expanded from macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                                                ^~~~~~~~~~
   include/trace/events/task.h:9:1: note: passing argument to parameter 'cb' here
       9 | TRACE_EVENT(task_newtask,
         | ^
   include/linux/tracepoint.h:619:2: note: expanded from macro 'TRACE_EVENT'
     619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:2: note: expanded from macro '__DECLARE_TRACE'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:260:42: note: expanded from macro '__DECLARE_TRACE_COMMON'
     260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                 ^
   In file included from kernel/trace/rv/monitors/sleep/sleep.c:23:
>> include/rv/ltl_monitor.h:75:44: error: incompatible function pointer types passing 'void (void *, struct task_struct *, unsigned long)' to parameter of type 'void (*)(void *, struct task_struct *, u64)' (aka 'void (*)(void *, struct task_struct *, unsigned long long)') [-Wincompatible-function-pointer-types]
      75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
         |                                                   ^~~~~~~~~~~~~~~~~~~
   include/rv/instrumentation.h:19:33: note: expanded from macro 'rv_attach_trace_probe'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                                               ^~~~~~~~~~
   include/asm-generic/bug.h:152:18: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                         ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/trace/events/task.h:9:1: note: passing argument to parameter 'probe' here
       9 | TRACE_EVENT(task_newtask,
         | ^
   include/linux/tracepoint.h:619:2: note: expanded from macro 'TRACE_EVENT'
     619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:2: note: expanded from macro '__DECLARE_TRACE'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:241:31: note: expanded from macro '__DECLARE_TRACE_COMMON'
     241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                      ^
   In file included from kernel/trace/rv/monitors/sleep/sleep.c:23:
   include/rv/ltl_monitor.h:92:44: error: incompatible function pointer types passing 'void (void *, struct task_struct *, unsigned long)' to parameter of type 'void (*)(void *, struct task_struct *, u64)' (aka 'void (*)(void *, struct task_struct *, unsigned long long)') [-Wincompatible-function-pointer-types]
      92 |         rv_detach_trace_probe(name, task_newtask, handle_task_newtask);
         |                                                   ^~~~~~~~~~~~~~~~~~~
   include/rv/instrumentation.h:28:25: note: expanded from macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                                       ^~~~~~~~~~
   include/trace/events/task.h:9:1: note: passing argument to parameter 'probe' here
       9 | TRACE_EVENT(task_newtask,
         | ^
   include/linux/tracepoint.h:619:2: note: expanded from macro 'TRACE_EVENT'
     619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:481:2: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:2: note: expanded from macro '__DECLARE_TRACE'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:254:33: note: expanded from macro '__DECLARE_TRACE_COMMON'
     254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                        ^
   3 errors generated.


vim +75 include/rv/ltl_monitor.h

a9769a5b987838 Nam Cao 2025-07-09  63  
a9769a5b987838 Nam Cao 2025-07-09  64  static int ltl_monitor_init(void)
a9769a5b987838 Nam Cao 2025-07-09  65  {
a9769a5b987838 Nam Cao 2025-07-09  66  	struct task_struct *g, *p;
a9769a5b987838 Nam Cao 2025-07-09  67  	int ret, cpu;
a9769a5b987838 Nam Cao 2025-07-09  68  
a9769a5b987838 Nam Cao 2025-07-09  69  	ret = rv_get_task_monitor_slot();
a9769a5b987838 Nam Cao 2025-07-09  70  	if (ret < 0)
a9769a5b987838 Nam Cao 2025-07-09  71  		return ret;
a9769a5b987838 Nam Cao 2025-07-09  72  
a9769a5b987838 Nam Cao 2025-07-09  73  	ltl_monitor_slot = ret;
a9769a5b987838 Nam Cao 2025-07-09  74  
a9769a5b987838 Nam Cao 2025-07-09 @75  	rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
a9769a5b987838 Nam Cao 2025-07-09  76  
a9769a5b987838 Nam Cao 2025-07-09  77  	read_lock(&tasklist_lock);
a9769a5b987838 Nam Cao 2025-07-09  78  
a9769a5b987838 Nam Cao 2025-07-09  79  	for_each_process_thread(g, p)
a9769a5b987838 Nam Cao 2025-07-09  80  		ltl_task_init(p, false);
a9769a5b987838 Nam Cao 2025-07-09  81  
a9769a5b987838 Nam Cao 2025-07-09  82  	for_each_present_cpu(cpu)
a9769a5b987838 Nam Cao 2025-07-09  83  		ltl_task_init(idle_task(cpu), false);
a9769a5b987838 Nam Cao 2025-07-09  84  
a9769a5b987838 Nam Cao 2025-07-09  85  	read_unlock(&tasklist_lock);
a9769a5b987838 Nam Cao 2025-07-09  86  
a9769a5b987838 Nam Cao 2025-07-09  87  	return 0;
a9769a5b987838 Nam Cao 2025-07-09  88  }
a9769a5b987838 Nam Cao 2025-07-09  89  

:::::: The code at line 75 was first introduced by commit
:::::: a9769a5b987838f03f3dd57b097794cd4c691098 rv: Add support for LTL monitors

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
