Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61E1E32D3;
	Fri, 28 Nov 2025 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302217; cv=none; b=rFPbYhRZQhk7WcQ+6RpKKRijHv8IoHsDWBeHnkqdfVpvUVJQ25BvWc14Fpb0NO1vTE5W/dC7/4S77UsCwFzL7ZE+bdIomL4cJY6saNNYiP1+MLZtsY+uyaEBzLuP0RkaLwO83fcapO5C1q5vjR3VdKEZxXzhasiLwl3jx+dai1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302217; c=relaxed/simple;
	bh=a69IarYZYDBaFI6J3RO1SwCtDgOIQrHpKXj1wj1h/eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arQpCLpHPpPiJodTkvEqDvjIUH77RkwSCmeESua2KU4KmQKwAA76ve4woDrVrZbpqTUOp14cy5QNd9g3XFXRfukWQhJMxhULj4cGpyA0M22FRD+0IsmSEO/qEd7rZSMJULbDx+tOJo+hCs6Tq5lCcTUaRk/XAkS8n9YmZnV7UXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j94+nmyA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j94+nmyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764302215; x=1795838215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a69IarYZYDBaFI6J3RO1SwCtDgOIQrHpKXj1wj1h/eo=;
  b=j94+nmyAOK0iGprj8sGRg/DnpJBMPu+R3d35Ez4Tpt592lgdee2CAFc8
   aYF5Hs3Qph808aodBfi8AjD7q28xEQNXex9IQzbOk/2HfYDYhr/km7hZK
   300B2w3AZT8qOZmRyxQ8nFbSuQAsZUUXt9HRBm5mdm7mw+5AfVqF3l7Nv
   58fjPgDvMqvomzSP77OsJvs6yUJBKXgch0IgR8PdAJP4a4fE2fwTdDHSK
   2Kr7kbN/B2ePuAkJomBuiDyTN8Qeu34z0+mxqvxQMmQHlBjIriqnz47KU
   9Mqx4WQG3Joq8zhZltaw64ZJOFcmA+Z2uyAxG+zoXB8rgXnuzWTTFlDO2
   w==;
X-CSE-ConnectionGUID: PPRcyLS2TEOKVS8Xq75oKg==
X-CSE-MsgGUID: OEAHBB0qQIOlko5BmwLr7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77442865"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77442865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:56:55 -0800
X-CSE-ConnectionGUID: 9mMOgblGQyOgEZnEYVBK5g==
X-CSE-MsgGUID: D75DVddqQF6hEhcqOFUcRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193589657"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2025 19:56:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpbH-0000000060D-1y6O;
	Fri, 28 Nov 2025 03:56:51 +0000
Date: Fri, 28 Nov 2025 11:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] mm: Avoid percpu MM counters on single-threaded
 tasks
Message-ID: <202511281118.Q9mK711R-lkp@intel.com>
References: <20251127233635.4170047-4-krisman@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127233635.4170047-4-krisman@suse.de>

Hi Gabriel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc7 next-20251127]
[cannot apply to akpm-mm/mm-everything dennis-percpu/for-next kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/lib-percpu_counter-Split-out-a-helper-to-insert-into-hotplug-list/20251128-073934
base:   linus/master
patch link:    https://lore.kernel.org/r/20251127233635.4170047-4-krisman%40suse.de
patch subject: [RFC PATCH 3/4] mm: Avoid percpu MM counters on single-threaded tasks
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251128/202511281118.Q9mK711R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281118.Q9mK711R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281118.Q9mK711R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:21:
>> include/linux/lazy_percpu_counter.h:48:36: error: no member named 'remote' in 'struct percpu_counter'
      48 |         return !(atomic_long_read(&lpc->c.remote) & LAZY_INIT_BIAS);
         |                                    ~~~~~~ ^
   include/linux/lazy_percpu_counter.h:56:29: error: no member named 'remote' in 'struct percpu_counter'
      56 |                 atomic_long_set(&lpc[i].c.remote, LAZY_INIT_BIAS);
         |                                  ~~~~~~~~ ^
>> include/linux/lazy_percpu_counter.h:57:32: error: no member named 'lock' in 'struct percpu_counter'
      57 |                 raw_spin_lock_init(&lpc[i].c.lock);
         |                                     ~~~~~~~~ ^
   include/linux/spinlock.h:113:9: note: expanded from macro 'raw_spin_lock_init'
     113 |         do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
         |                ^~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:21:
   include/linux/lazy_percpu_counter.h:67:38: error: no member named 'remote' in 'struct percpu_counter'
      67 |                 counter = atomic_long_read(&lpc->c.remote);
         |                                             ~~~~~~ ^
   include/linux/lazy_percpu_counter.h:72:47: error: no member named 'remote' in 'struct percpu_counter'
      72 |         } while (atomic_long_cmpxchg_relaxed(&lpc->c.remote, counter, (counter+x)) != counter);
         |                                               ~~~~~~ ^
   include/linux/lazy_percpu_counter.h:94:46: error: no member named 'remote' in 'struct percpu_counter'
      94 |         return remove_bias(atomic_long_read(&lpc->c.remote));
         |                                              ~~~~~~ ^
   include/linux/lazy_percpu_counter.h:101:46: error: no member named 'remote' in 'struct percpu_counter'
     101 |         return remove_bias(atomic_long_read(&lpc->c.remote)) + lpc->c.count;
         |                                              ~~~~~~ ^
   include/linux/lazy_percpu_counter.h:115:46: error: no member named 'remote' in 'struct percpu_counter'
     115 |         return remove_bias(atomic_long_read(&lpc->c.remote)) + lpc->c.count;
         |                                              ~~~~~~ ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];


vim +48 include/linux/lazy_percpu_counter.h

64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  45  
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  46  static inline bool lazy_percpu_counter_initialized(struct lazy_percpu_counter *lpc)
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  47  {
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27 @48  	return !(atomic_long_read(&lpc->c.remote) & LAZY_INIT_BIAS);
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  49  }
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  50  
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  51  static inline void lazy_percpu_counter_init_many(struct lazy_percpu_counter *lpc, int amount,
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  52  					       int nr_counters)
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  53  {
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  54  	for (int i = 0; i < nr_counters; i++) {
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  55  		lpc[i].c.count = amount;
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  56  		atomic_long_set(&lpc[i].c.remote, LAZY_INIT_BIAS);
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27 @57  		raw_spin_lock_init(&lpc[i].c.lock);
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  58  	}
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  59  }
64259dc8f53734d Gabriel Krisman Bertazi 2025-11-27  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
