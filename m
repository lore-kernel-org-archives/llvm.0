Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F232E151;
	Mon, 22 Dec 2025 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418442; cv=none; b=FJXy+GEK1Cf8Tb8Pux4DncYS79G/yOslJWvQIk/xWh2YOSpqgVyJedmlpTivVU8Aw/wnB0lNHRXrOfbXyo/c8Jo4RiXLRoEX4X9rQw73VuTiY6F6qEbtI+IprJHrr+KE2uRaNUUJXCJYSBSXfzkzW8QfqDm8E7Q5knHJAIifs2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418442; c=relaxed/simple;
	bh=e+I2vJHyKS0fEmtt04mExk4nT+xxne/XRavJU2tXZwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRoHW7vsZYdH44yjo/sTorc6FHuf81Fik3sv6ianql8UnlgPtdH3wFo4TknbfuRpXmqn9m4pI2TKqGna/wJultVXU7lRHVLatnvyofEJHLxj3Y4qMusNqdSozfiAqgoDHHYkfTWnN7PjQyyYoQCo7bJL+CsOXNcw+51LRbnQKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKQddoRA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKQddoRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766418441; x=1797954441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e+I2vJHyKS0fEmtt04mExk4nT+xxne/XRavJU2tXZwY=;
  b=nKQddoRAIi5Hfxd8D6j/HTva+/Fn7cIJ7clmkVcwwVY0AIuzMoyBAhvK
   bY+10Z7qHLEh+1Hde2H12Cph5ls7k4W/Gco6nQxesTaSTJwM1y8tHHJRw
   qU/ff/apP8tWLEO6asOObPnYbxLefwRpS5cf9jImvzhggtzHzhtNsXqR4
   IsygEs0nEZj5RoRLR7uZIGq69i1TBdE/srpB62GkBrYtD+kELhomPUeNi
   FWWzd0gcLLlZtaS4mzcMJRDsDfASYYc+jRrIt0exSgJ9koFKsYmdbl5S7
   6ymDlJv7Wce/HVBOP0OlbHu12OaAODJIBSgG4A/DXvqlqbGx75FN4qL0O
   Q==;
X-CSE-ConnectionGUID: puHQAwVLR1i2C/SroVkdWA==
X-CSE-MsgGUID: R5W9QLz9RK62VMCJqQvUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68213025"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68213025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:47:19 -0800
X-CSE-ConnectionGUID: Qa6vDoVVQyOwZbFfDZhWAg==
X-CSE-MsgGUID: jjnRdVC8SeK+v35Q1XfTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204604988"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 07:47:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXi7v-000000000lj-0q03;
	Mon, 22 Dec 2025 15:47:15 +0000
Date: Mon, 22 Dec 2025 23:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 09/14] mm/hugetlb: Remove fake head pages
Message-ID: <202512222355.TY2gC0FL-lkp@intel.com>
References: <20251218150949.721480-10-kas@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218150949.721480-10-kas@kernel.org>

Hi Kiryl,

kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/for-next]
[cannot apply to akpm-mm/mm-everything rppt-memblock/fixes linus/master vbabka-slab/for-next v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiryl-Shutsemau/mm-sparse-Check-memmap-alignment/20251219-001021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20251218150949.721480-10-kas%40kernel.org
patch subject: [PATCHv2 09/14] mm/hugetlb: Remove fake head pages
config: x86_64-randconfig-015-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222355.TY2gC0FL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222355.TY2gC0FL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222355.TY2gC0FL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1570:30: error: use of undeclared identifier 'PUD_ORDER'
    1570 |         unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
         |                                     ^
   include/linux/mmzone.h:1419:27: note: expanded from macro 'NR_VMEMMAP_TAILS'
    1419 | #define NR_VMEMMAP_TAILS (MAX_FOLIO_ORDER - VMEMMAP_TAIL_MIN_ORDER + 1)
         |                           ^
   include/linux/mmzone.h:94:26: note: expanded from macro 'MAX_FOLIO_ORDER'
      94 | #define MAX_FOLIO_ORDER         PUD_ORDER
         |                                 ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:


vim +/PUD_ORDER +1570 include/linux/mmzone.h

  1557	
  1558		CACHELINE_PADDING(_pad2_);
  1559	
  1560		/* Per-node vmstats */
  1561		struct per_cpu_nodestat __percpu *per_cpu_nodestats;
  1562		atomic_long_t		vm_stat[NR_VM_NODE_STAT_ITEMS];
  1563	#ifdef CONFIG_NUMA
  1564		struct memory_tier __rcu *memtier;
  1565	#endif
  1566	#ifdef CONFIG_MEMORY_FAILURE
  1567		struct memory_failure_stats mf_stats;
  1568	#endif
  1569	#ifdef CONFIG_SPARSEMEM_VMEMMAP
> 1570		unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
  1571	#endif
  1572	} pg_data_t;
  1573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
