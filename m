Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D8329C54;
	Tue,  9 Jun 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014285; cv=none; b=A7MOp1Y9Yx7hwh8jSX1iKlx834b/MUNXvjd/rNdyAc8elFormHlzm3XQY7uUFQDPELwRdQ1jFi/mYgjigCQ7TIh1E0s8W0ApmeNAtUUZ8CSSDlxiOXQQCL+4t6zkw1X0+5i4d/NTRNNktJK+UgTmLjDqEp6nvcTBHl0ddFX2SpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014285; c=relaxed/simple;
	bh=PTgYkmz3qgg+7i1LNASRF6bOgNEAt5ih4Mz4baD/TKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s9FwB7I7CTlOHkb8JosPrGhb+y9pS1DZs8GUOQW/HuFHGMOylHcTX3jTVBzfvS87uAize2A8jfHdFTDJH+1amWf8noLwjtTAA1nOT4Kq/wrK2o9firj93TDrO3Kz3LDdHZhtFAf33BJJQ1ttxyFp+7Kxnm0tD0N9aOdIT+0t1D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L84SElK0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L84SElK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781014282; x=1812550282;
  h=date:from:to:cc:subject:message-id;
  bh=PTgYkmz3qgg+7i1LNASRF6bOgNEAt5ih4Mz4baD/TKg=;
  b=L84SElK0Xn9NWswkEImQUrvkGrCi3cT7rfEbhh0qbkM/tuNvVUqWh2VO
   3tm8CTZpxK29U17RZd597hZQpZDJt1obNR1cpS+Rmea6ST7m6NLQJYMmg
   NSJ0v5mNqjjQrbTwx0sBnuHKHBgIBRe/ehCqY+MnX6HX/RTVuoR9D12mT
   8as5KSy7aF5Ue37vEcZK2ddYE53euW5HjPEwAB/RCK6iAaiAKtGqujyKP
   vSbc6k2Kg0CI4Ai+8z0ycnGJhLAhx1+iuzDGnDJi6289r16Iymyq+4JoW
   m3Qo4h07yaNjN9OQIYAfkHd3exi5JzbM58zDUSqxPXvuP84GEiY7ky6H1
   Q==;
X-CSE-ConnectionGUID: igkTZXraQxuz4Q/aUBjqNg==
X-CSE-MsgGUID: kmia2nxaSE+gYj8bQSYzbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104439593"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="104439593"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:11:22 -0700
X-CSE-ConnectionGUID: kN1VU6k8QaWQUBBianijsQ==
X-CSE-MsgGUID: bW3ANYe5Qxm5lOuq67cwzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="250947993"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jun 2026 07:11:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWxAj-000000003SL-1ESW;
	Tue, 09 Jun 2026 14:11:17 +0000
Date: Tue, 09 Jun 2026 16:10:58 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 42/42]
 include/linux/mmzone.h:839:25: error: use of undeclared identifier
 'PAGE_ALLOC_COSTLY_ORDER'
Message-ID: <202606091636.ViVl8kG7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   6a13a5d67caca4ca57eb8e916f762a491d8c3120
commit: 6a13a5d67caca4ca57eb8e916f762a491d8c3120 [42/42] mm,block: Make PAGE_ALLOC_COSTLY_ORDER configurable
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260609/202606091636.ViVl8kG7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091636.ViVl8kG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091636.ViVl8kG7-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3334: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3324: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3803: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:3985: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5642: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5871: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6381: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:839:25: error: use of undeclared identifier 'PAGE_ALLOC_COSTLY_ORDER'
     839 |         struct list_head lists[NR_PCP_LISTS];
         |                                ^~~~~~~~~~~~
   include/linux/mmzone.h:807:23: note: expanded from macro 'NR_PCP_LISTS'
     807 | #define NR_PCP_LISTS (NR_LOWORDER_PCP_LISTS + NR_PCP_THP)
         |                       ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:806:52: note: expanded from macro 'NR_LOWORDER_PCP_LISTS'
     806 | #define NR_LOWORDER_PCP_LISTS (MIGRATE_PCPTYPES * (PAGE_ALLOC_COSTLY_ORDER + 1))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:


vim +/PAGE_ALLOC_COSTLY_ORDER +839 include/linux/mmzone.h

ca71fe1ad9221a Ying Huang     2023-10-16  823  
^1da177e4c3f41 Linus Torvalds 2005-04-16  824  struct per_cpu_pages {
4b23a68f953628 Mel Gorman     2022-06-24  825  	spinlock_t lock;	/* Protects lists field */
^1da177e4c3f41 Linus Torvalds 2005-04-16  826  	int count;		/* number of pages in the list */
^1da177e4c3f41 Linus Torvalds 2005-04-16  827  	int high;		/* high watermark, emptying needed */
90b41691b98813 Ying Huang     2023-10-16  828  	int high_min;		/* min high watermark */
90b41691b98813 Ying Huang     2023-10-16  829  	int high_max;		/* max high watermark */
^1da177e4c3f41 Linus Torvalds 2005-04-16  830  	int batch;		/* chunk size for buddy add/remove */
ca71fe1ad9221a Ying Huang     2023-10-16  831  	u8 flags;		/* protected by pcp->lock */
c0a242394cb980 Ying Huang     2023-10-16  832  	u8 alloc_factor;	/* batch scaling factor during allocate */
28f836b6777b6f Mel Gorman     2021-06-28  833  #ifdef CONFIG_NUMA
c0a242394cb980 Ying Huang     2023-10-16  834  	u8 expire;		/* When 0, remote pagesets are drained */
28f836b6777b6f Mel Gorman     2021-06-28  835  #endif
6ccdcb6d3a741c Ying Huang     2023-10-16  836  	short free_count;	/* consecutive free count */
5f8dcc21211a3d Mel Gorman     2009-09-21  837  
5f8dcc21211a3d Mel Gorman     2009-09-21  838  	/* Lists of pages, one per migrate type stored on the pcp-lists */
44042b4498728f Mel Gorman     2021-06-28 @839  	struct list_head lists[NR_PCP_LISTS];
5d0a661d808fc8 Mel Gorman     2022-06-24  840  } ____cacheline_aligned_in_smp;
^1da177e4c3f41 Linus Torvalds 2005-04-16  841  

:::::: The code at line 839 was first introduced by commit
:::::: 44042b4498728f4376e84bae1ac8016d146d850b mm/page_alloc: allow high-order pages to be stored on the per-cpu lists

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
