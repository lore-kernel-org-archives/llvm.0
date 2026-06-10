Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F643537CC;
	Wed, 10 Jun 2026 05:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069490; cv=none; b=IMKDpehQaDY4/wZ4PefnIMaWg4gnNMojznHx8u0eEOSNXMRCEF0eOZD57V75TQFAQ4AonQn+MI5CefkJv4ZZ7Ev/S5epzgtIFL8SPg86lOZgvj86/52zj7bcY3dV37gRb26oVGHyJyBl1vuhfthtol/fScbvpGfMSJPFT93ln4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069490; c=relaxed/simple;
	bh=2ZBD64nCSNX4qrXq23kTbH7PHKcJBaGVzNQsKLasKQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KRoPaNibfX/UEVSyCFVsEyJBSWVdKi0Wgrxk9nKlmSAAIOZe+BGuiAchqGnxI39mytolX1JdSKKzWYz9DEyxV47YqDTXKowuNSo8j1nsDA1enTBRkr34kGAbi/bAcM+2/LU0jw31KUe6oLhQuXgjWn79N/IoZ6A7eu8vuL35LjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giu63dJD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giu63dJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781069487; x=1812605487;
  h=date:from:to:cc:subject:message-id;
  bh=2ZBD64nCSNX4qrXq23kTbH7PHKcJBaGVzNQsKLasKQI=;
  b=giu63dJDLSp39pxidlxZu2VmN43ARsge4lbmHvZtzPd7/O0tL+srhUwF
   wnaFFIu8mvKo3eBeuSh5EOxFrecEMKqnppE9vgGFYhQiGvA5UU/g9dQJG
   BrWZVzrKScFYVRVud5c06bNLUSzbrWwhwb/B4Ll7lpNEV445iW6QfuDPl
   ldpSlcSvFEotM43RQn33Bwbev6VEQinn8DgO5xwy0ba0NtwsO73BM05bm
   /yaownayQIYz0UI++ZBRlFDLjKoRPQhb8AbeldMg2AkeZtpnCiTv2ecqi
   RGMnSBo2Q51V+m+bnx6Ki7PjyJvBfv6s3rtoevHKeXQe6sFihF/27YBz+
   A==;
X-CSE-ConnectionGUID: nBkAsdDVSuC4H0hBZQgvVQ==
X-CSE-MsgGUID: Ic0xup6HTD+t+s+a5p1PaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93239899"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93239899"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 22:31:22 -0700
X-CSE-ConnectionGUID: QnA1Uq1DSz6bqZ1IwDqIog==
X-CSE-MsgGUID: DAG/K+MvS+2UoFmOLcQzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="247929073"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2026 22:31:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXBX4-00000000Kwc-1IXf;
	Wed, 10 Jun 2026 05:31:18 +0000
Date: Wed, 10 Jun 2026 13:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 42/42]
 include/linux/mmzone.h:839:25: error: use of undeclared identifier
 'PAGE_ALLOC_COSTLY_ORDER'
Message-ID: <202606101308.Lw17R25F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   6a13a5d67caca4ca57eb8e916f762a491d8c3120
commit: 6a13a5d67caca4ca57eb8e916f762a491d8c3120 [42/42] mm,block: Make PAGE_ALLOC_COSTLY_ORDER configurable
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260610/202606101308.Lw17R25F-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101308.Lw17R25F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101308.Lw17R25F-lkp@intel.com/

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
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
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
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:


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
