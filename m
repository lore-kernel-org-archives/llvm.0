Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71C1400D;
	Mon, 19 Feb 2024 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708334046; cv=none; b=ZjZMZkt5pmeAKGknjX2lUMfrBj1QR3OG/Mi2QUHDSvW4tku97L0wiuNyBgUtWFAxtRV0PJthccCKp/LBFXYIdBK7WqkjfH1QII6Bc3q/otVmDnXdB+YjPbxYwXAMjRey6Y3TvmpTpN8+YwpYa8ucn0N9RzubUyEW+CMjXRoM4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708334046; c=relaxed/simple;
	bh=paVoYDPWcew6QlZkce/3cG+rwPF1QL/PQGJga6kD7wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cvci6KdhTA1VQEnmL4avOdDuMd8w5TdXt5/2scmPrGsi6ZN0AGPqQOaTjn18LEGmOeKQsbHIcHL7hs2BMKr97eonAOstmeVXL/rKEtQtRbbgDS2g8/x0lC1mV6rFyxmCKwb0tG2yBFUm/N1gg0HlRIDcTVKfrF5zmy9f0DsDmww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coV5CitO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coV5CitO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708334044; x=1739870044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=paVoYDPWcew6QlZkce/3cG+rwPF1QL/PQGJga6kD7wo=;
  b=coV5CitOsy9FTDAvWerzLUvUNKoRaASOwMAVLcPjI2omLHtouqiaqpsj
   kfHFjZU3mSmrUTPVOIgoqmi566m/I410DyBKF7JJDXeh0/6hrbjWMitCO
   IXKKUwLtd50Kqm61v0jfTcgRDBfIhCaX/VxxX/KoivXa0ZcE4ww3Gd7O9
   iVmBHS00JBn7BlHg9tGnpxmE4PGyby/hto0/fq9VRnXStIaJno6E3Mq6u
   GuU8A0DvNn392Y54Ia3JAKnT4Eh1l30UEQf7Jm1khYWG9b/V+MEhrdKk9
   e9blPBiGd03t5f8QetLuKe+F0VVVt1Yrk/LKUGM3FKm+bqe7poBPtV+d8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2549083"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2549083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 01:14:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4816254"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2024 01:14:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbzip-0003fm-2N;
	Mon, 19 Feb 2024 09:13:59 +0000
Date: Mon, 19 Feb 2024 17:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v5 15/15]
 include/linux/page-flags-layout.h:58:35: error: function-like macro
 'pgtable_l5_enabled' is not defined
Message-ID: <202402191750.AbTaoKAO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   898f9ed1b1d5f7b57f90237d9f91263e3a5bdc82
commit: 898f9ed1b1d5f7b57f90237d9f91263e3a5bdc82 [15/15] x86/startup_64: Drop global variables keeping track of LA57 state
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240219/202402191750.AbTaoKAO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191750.AbTaoKAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191750.AbTaoKAO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:21:
   In file included from arch/x86/include/asm/pgtable_types.h:353:
>> include/asm-generic/pgtable-nop4d.h:11:9: warning: 'P4D_SHIFT' macro redefined [-Wmacro-redefined]
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |         ^
   arch/x86/include/asm/pgtable_64_types.h:59:9: note: previous definition is here
      59 | #define P4D_SHIFT               39
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:21:
   In file included from arch/x86/include/asm/pgtable_types.h:353:
>> include/asm-generic/pgtable-nop4d.h:12:9: warning: 'PTRS_PER_P4D' macro redefined [-Wmacro-redefined]
      12 | #define PTRS_PER_P4D            1
         |         ^
   arch/x86/include/asm/pgtable_64_types.h:65:9: note: previous definition is here
      65 | #define PTRS_PER_P4D            (pgtable_l5_enabled() ? 512 : 1)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:21:
   In file included from arch/x86/include/asm/pgtable_types.h:353:
>> include/asm-generic/pgtable-nop4d.h:13:9: warning: 'P4D_SIZE' macro redefined [-Wmacro-redefined]
      13 | #define P4D_SIZE                (1UL << P4D_SHIFT)
         |         ^
   arch/x86/include/asm/pgtable_64_types.h:66:9: note: previous definition is here
      66 | #define P4D_SIZE                (_AC(1, UL) << P4D_SHIFT)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:21:
   In file included from arch/x86/include/asm/pgtable_types.h:353:
>> include/asm-generic/pgtable-nop4d.h:14:9: warning: 'P4D_MASK' macro redefined [-Wmacro-redefined]
      14 | #define P4D_MASK                (~(P4D_SIZE-1))
         |         ^
   arch/x86/include/asm/pgtable_64_types.h:67:9: note: previous definition is here
      67 | #define P4D_MASK                (~(P4D_SIZE - 1))
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
>> include/linux/page-flags-layout.h:58:35: warning: 'pgtable_l5_enabled' is not defined, evaluates to 0 [-Wundef]
      58 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
         |                                   ^
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
>> include/linux/page-flags-layout.h:58:35: error: function-like macro 'pgtable_l5_enabled' is not defined
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:93:35: warning: 'pgtable_l5_enabled' is not defined, evaluates to 0 [-Wundef]
      93 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:93:35: error: function-like macro 'pgtable_l5_enabled' is not defined
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:104:35: warning: 'pgtable_l5_enabled' is not defined, evaluates to 0 [-Wundef]
     104 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:104:35: error: function-like macro 'pgtable_l5_enabled' is not defined
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
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
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~


vim +/pgtable_l5_enabled +58 include/linux/page-flags-layout.h

bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  57  
ec1c86b25f4bdd Yu Zhao        2022-09-18 @58  #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
ec1c86b25f4bdd Yu Zhao        2022-09-18  59  	<= BITS_PER_LONG - NR_PAGEFLAGS
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  60  #define NODES_WIDTH		NODES_SHIFT
1587db62d8c0db Yu Zhao        2021-04-29  61  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  62  #error "Vmemmap: No space for nodes field in page flags"
1587db62d8c0db Yu Zhao        2021-04-29  63  #else
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  64  #define NODES_WIDTH		0
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  65  #endif
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  66  

:::::: The code at line 58 was first introduced by commit
:::::: ec1c86b25f4bdd9dce6436c0539d2a6ae676e1c4 mm: multi-gen LRU: groundwork

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
