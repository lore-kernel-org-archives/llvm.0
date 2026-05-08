Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E0E390CBF;
	Fri,  8 May 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239257; cv=none; b=ctHUDl/MwU5KZV2Ws6rYIXQdFB1Dpsade1iH1hqu6Ucc4IHtqtlvZu62/zh9wKsxkrmhTg7w0HgXuKZyN/VOqtvQUtOCs7MTvEXpTuXu+ZU1fsS3umnOn7+qU51Y8sA5JqqUhjqwZiaqx0pPaz4qbf9kAiyUyi9JJjwo3id66mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239257; c=relaxed/simple;
	bh=q3lseOh7RROWI0wbK/JxyWJUaU2nL382idCd8cNrKDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X2HXOkOE7i+d/qPbbhHBuw0fbrx9sGkYW1ApOMY0a5ipGlbP7V0kH9taCTIQ2mAecpJDlbvHCMiofqG8qhuPuLiklha8IFWvoZyjtASyBdzoFnX26RqQfQQFtCzd5qjVHPa35qmzoF0xQy+RQWxaZ9f+k2ki4T5axC/bBFg97B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajKvYQeb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajKvYQeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778239256; x=1809775256;
  h=date:from:to:cc:subject:message-id;
  bh=q3lseOh7RROWI0wbK/JxyWJUaU2nL382idCd8cNrKDs=;
  b=ajKvYQebikpsgJH1JmVx8Nwp4D4DGiyLPeLvdfUSl8L+e0e8egkL0mLB
   l2aLpOmStBDylMlXGl/guUMjOU3eZXDTJ/mxPZowsPJcvOLLO+v5sD094
   6nowe4AjstP1+fjr+sXWyxTZMdzwdw6ZJeRhtv1fVMGWab0B0aE0ADYDl
   ANUmwZGaEG7Tt2wgTG5KTWWwtpvvaz2KvRVgY0v4KEwqCUCdUv03XxTu/
   ItvfI+Z6c+2U3VyyMo5xVtHTXocYVRcYhh6nKZZY2pHrPsUnFqx0fiP8K
   uqF5ggCaKpv1vwr1f4aYjnU/wt22W6k51mlVZdZjyQDSty3776gFyV5Yl
   w==;
X-CSE-ConnectionGUID: DPjVJGKqS3ecH4uOH+O9Lg==
X-CSE-MsgGUID: akLCy+xUTTuPQYrn45xYVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="101878431"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="101878431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:20:55 -0700
X-CSE-ConnectionGUID: xzqZvJOyQo6MFNqvKwXHug==
X-CSE-MsgGUID: y3X4EddzRzSWFyOGEMG1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="274858545"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2026 04:20:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLJGF-0000000079R-3ujd;
	Fri, 08 May 2026 11:20:51 +0000
Date: Fri, 08 May 2026 13:20:28 +0200
From: kernel test robot <lkp@intel.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: include/linux/miscdevice.h:89:25: error: field has
 incomplete type 'struct file_operations'
Message-ID: <202605081340.xtpKPpuY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/char-misc-Simplify-locking-with-guard/20260427-231042
head:   a108f6242a528b7f829f7e2aefd51355c06848bb
commit: ccfedb0a2f5cbe99e74cc676d316f35195e82f90 char: misc: Introduce misc_sync_register()
date:   11 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260508/202605081340.xtpKPpuY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081340.xtpKPpuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081340.xtpKPpuY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/watch_queue.c:16:
>> include/linux/miscdevice.h:89:25: error: field has incomplete type 'struct file_operations'
      89 |         struct file_operations fops;
         |                                ^
   include/linux/printk.h:758:21: note: forward declaration of 'struct file_operations'
     758 | extern const struct file_operations kmsg_fops;
         |                     ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/watch_queue.c:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:


vim +89 include/linux/miscdevice.h

    83	
    84	struct miscdevice_sync_ctx {
    85		int minor;
    86		struct kref kref;
    87		const struct file_operations *orig_fops;
    88		struct list_head list;
  > 89		struct file_operations fops;
    90	};
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
