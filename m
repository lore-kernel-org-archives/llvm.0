Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A421C194;
	Fri, 19 Sep 2025 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758313828; cv=none; b=NGV4fS+0tvu/3wV/rIkCbz5skRSbLnvb/60gOtoTsi36Cyi7H/sNMvlK7JmMMh49Abf3jhorbQg+NxB7BfA9ky8gAwPMSEI6EMiFd3++ZKgheztT0C4C9zWv6kdW6Tg5HM3q2pD63e5Pn261zllnXSApf5U9havNuiWOa06iK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758313828; c=relaxed/simple;
	bh=eP4OUc6u7s1NbZHlayL8AWEQQtfcOg/uR06Es53CQa0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBMFOfBGpwwEircD8RaGk2mVonxEu0ceJJIG0Mgm3CPdDA2XUbg1HLfyU08Hv2DYQD93JP79ONQt5vdEYqv3B0aJTTWVgv+KPm4CenRjmDu94R+ChKHbTbfOEbtCYDGoMavUFOLsTF6J1J1m9MDfh2hhbODDfHWrwDltOtqKYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRe1T4wa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRe1T4wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758313827; x=1789849827;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eP4OUc6u7s1NbZHlayL8AWEQQtfcOg/uR06Es53CQa0=;
  b=gRe1T4wa2NdCPo0FRJKKril38b82hgC96G4tyDTjdMTUacodkEY7EdTM
   7jCGSYDUX2RAFkeSBZl6d0VYkMJuiv8z9EzZAz/YqcvXQBFvkdTXEjaZ4
   dcQ4CrfNmChVsnRpHtqOAF1OHYFj+G5mB7aeNqoJzrAVtTrwQLbqlphXP
   JJmeh/6JNs1XLzR2c1pYb7+bfc9mrm4ydx+AMhjb6dIImM7uzQjqYEo5r
   zgBvL/Wz7k7D0TOUWCg3Oq4Gcv8uGpH2ibaEPJiKEg6mYW9PKPbVemWl+
   I6CTAYuYdVSCSC95OUzy/p2AKFsnVYtEuqOrcX6QS/XZ403ZemaRM/ctw
   w==;
X-CSE-ConnectionGUID: 4JKSRg7FTt+wSJtJs7EOHg==
X-CSE-MsgGUID: F9RQCVfeSg+kyxIePwrYRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60721375"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60721375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 13:30:26 -0700
X-CSE-ConnectionGUID: aCr5Vm5BR2eOR5bGWEGFng==
X-CSE-MsgGUID: Erdw8j+oQVujnlagKP7eEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175729001"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Sep 2025 13:30:24 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzhkM-0004mV-1x;
	Fri, 19 Sep 2025 20:30:22 +0000
Date: Sat, 20 Sep 2025 04:29:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 10394/11136] arch/riscv/Kconfig:67: syntax error
Message-ID: <202509200414.Q0j4r2Pc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: df4c83704cac9531e91cd161dd8a2b0857b8bb2d [10394/11136] Merge 6.17-rc6 into kbuild-next
config: riscv-randconfig-002-20250920 (attached as .config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200414.Q0j4r2Pc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200414.Q0j4r2Pc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/Kconfig:67: syntax error
   arch/riscv/Kconfig:67: invalid statement
   arch/riscv/Kconfig:68: invalid statement
   arch/riscv/Kconfig:69: invalid statement
   arch/riscv/Kconfig:70: invalid statement
   arch/riscv/Kconfig:71: invalid statement
   arch/riscv/Kconfig:72: invalid statement
   arch/riscv/Kconfig:73: invalid statement
   arch/riscv/Kconfig:74: invalid statement
   arch/riscv/Kconfig:75: invalid statement
   arch/riscv/Kconfig:76: invalid statement
   arch/riscv/Kconfig:77: invalid statement
   arch/riscv/Kconfig:78: invalid statement
   arch/riscv/Kconfig:79: invalid statement
   arch/riscv/Kconfig:80: invalid statement
   arch/riscv/Kconfig:81: invalid statement
   arch/riscv/Kconfig:82: invalid statement
   arch/riscv/Kconfig:83: invalid statement
   arch/riscv/Kconfig:84: invalid statement
   arch/riscv/Kconfig:85: invalid statement
   arch/riscv/Kconfig:86: invalid statement
   arch/riscv/Kconfig:87: invalid statement
   arch/riscv/Kconfig:88: invalid statement
   arch/riscv/Kconfig:89: invalid statement
   arch/riscv/Kconfig:90: invalid statement
   arch/riscv/Kconfig:91: invalid statement
   arch/riscv/Kconfig:92: invalid statement
   arch/riscv/Kconfig:93: invalid statement
   arch/riscv/Kconfig:94: invalid statement
   arch/riscv/Kconfig:95: invalid statement
   arch/riscv/Kconfig:96: invalid statement
   arch/riscv/Kconfig:97: invalid statement
   arch/riscv/Kconfig:98: invalid statement
   arch/riscv/Kconfig:99: invalid statement
   arch/riscv/Kconfig:100: invalid statement
   arch/riscv/Kconfig:101: invalid statement
   arch/riscv/Kconfig:102: invalid statement
   arch/riscv/Kconfig:103: invalid statement
   arch/riscv/Kconfig:104: invalid statement
   arch/riscv/Kconfig:105: invalid statement
   arch/riscv/Kconfig:106: invalid statement
   arch/riscv/Kconfig:107: invalid statement
   arch/riscv/Kconfig:108: invalid statement
   arch/riscv/Kconfig:109: invalid statement
   arch/riscv/Kconfig:110: invalid statement
   arch/riscv/Kconfig:111: invalid statement
   arch/riscv/Kconfig:112: invalid statement
   arch/riscv/Kconfig:113: invalid statement
   arch/riscv/Kconfig:114: invalid statement
   arch/riscv/Kconfig:115: invalid statement
   arch/riscv/Kconfig:116: invalid statement
   arch/riscv/Kconfig:117: invalid statement
   arch/riscv/Kconfig:118: invalid statement
   arch/riscv/Kconfig:119: invalid statement
   arch/riscv/Kconfig:120: invalid statement
   arch/riscv/Kconfig:121: invalid statement
   arch/riscv/Kconfig:122: invalid statement
   arch/riscv/Kconfig:123: invalid statement
   arch/riscv/Kconfig:124: invalid statement
   arch/riscv/Kconfig:125: invalid statement
   arch/riscv/Kconfig:126: invalid statement
   arch/riscv/Kconfig:127: invalid statement
   arch/riscv/Kconfig:128: invalid statement
   arch/riscv/Kconfig:129: invalid statement
   arch/riscv/Kconfig:130: invalid statement
   arch/riscv/Kconfig:131: invalid statement
   arch/riscv/Kconfig:132: invalid statement
   arch/riscv/Kconfig:133: invalid statement
   arch/riscv/Kconfig:134: invalid statement
   arch/riscv/Kconfig:135: invalid statement
   arch/riscv/Kconfig:136: invalid statement
   arch/riscv/Kconfig:137: invalid statement
   arch/riscv/Kconfig:138: invalid statement
   arch/riscv/Kconfig:139: invalid statement
   arch/riscv/Kconfig:140: invalid statement
   arch/riscv/Kconfig:141: invalid statement
   arch/riscv/Kconfig:142: invalid statement
   arch/riscv/Kconfig:143: invalid statement
   arch/riscv/Kconfig:144: invalid statement
   arch/riscv/Kconfig:145: invalid statement
   arch/riscv/Kconfig:146: invalid statement
   arch/riscv/Kconfig:147: invalid statement
   arch/riscv/Kconfig:148: invalid statement
   arch/riscv/Kconfig:149: invalid statement
   arch/riscv/Kconfig:150: invalid statement
   arch/riscv/Kconfig:151: invalid statement
   arch/riscv/Kconfig:152: invalid statement
   arch/riscv/Kconfig:153: invalid statement
   arch/riscv/Kconfig:154: invalid statement
   arch/riscv/Kconfig:155: invalid statement
   arch/riscv/Kconfig:156: invalid statement
   arch/riscv/Kconfig:157: invalid statement
   arch/riscv/Kconfig:158: invalid statement
   arch/riscv/Kconfig:159: invalid statement
   arch/riscv/Kconfig:160: invalid statement
   arch/riscv/Kconfig:161: invalid statement
   arch/riscv/Kconfig:162: invalid statement
   arch/riscv/Kconfig:163: invalid statement
   arch/riscv/Kconfig:164: invalid statement
   arch/riscv/Kconfig:165: invalid statement
   arch/riscv/Kconfig:166: invalid statement
--
>> arch/riscv/Kconfig:67: syntax error
   arch/riscv/Kconfig:67: invalid statement
   arch/riscv/Kconfig:68: invalid statement
   arch/riscv/Kconfig:69: invalid statement
   arch/riscv/Kconfig:70: invalid statement
   arch/riscv/Kconfig:71: invalid statement
   arch/riscv/Kconfig:72: invalid statement
   arch/riscv/Kconfig:73: invalid statement
   arch/riscv/Kconfig:74: invalid statement
   arch/riscv/Kconfig:75: invalid statement
   arch/riscv/Kconfig:76: invalid statement
   arch/riscv/Kconfig:77: invalid statement
   arch/riscv/Kconfig:78: invalid statement
   arch/riscv/Kconfig:79: invalid statement
   arch/riscv/Kconfig:80: invalid statement
   arch/riscv/Kconfig:81: invalid statement
   arch/riscv/Kconfig:82: invalid statement
   arch/riscv/Kconfig:83: invalid statement
   arch/riscv/Kconfig:84: invalid statement
   arch/riscv/Kconfig:85: invalid statement
   arch/riscv/Kconfig:86: invalid statement
   arch/riscv/Kconfig:87: invalid statement
   arch/riscv/Kconfig:88: invalid statement
   arch/riscv/Kconfig:89: invalid statement
   arch/riscv/Kconfig:90: invalid statement
   arch/riscv/Kconfig:91: invalid statement
   arch/riscv/Kconfig:92: invalid statement
   arch/riscv/Kconfig:93: invalid statement
   arch/riscv/Kconfig:94: invalid statement
   arch/riscv/Kconfig:95: invalid statement
   arch/riscv/Kconfig:96: invalid statement
   arch/riscv/Kconfig:97: invalid statement
   arch/riscv/Kconfig:98: invalid statement
   arch/riscv/Kconfig:99: invalid statement
   arch/riscv/Kconfig:100: invalid statement
   arch/riscv/Kconfig:101: invalid statement
   arch/riscv/Kconfig:102: invalid statement
   arch/riscv/Kconfig:103: invalid statement
   arch/riscv/Kconfig:104: invalid statement
   arch/riscv/Kconfig:105: invalid statement
   arch/riscv/Kconfig:106: invalid statement
   arch/riscv/Kconfig:107: invalid statement
   arch/riscv/Kconfig:108: invalid statement
   arch/riscv/Kconfig:109: invalid statement
   arch/riscv/Kconfig:110: invalid statement
   arch/riscv/Kconfig:111: invalid statement
   arch/riscv/Kconfig:112: invalid statement
   arch/riscv/Kconfig:113: invalid statement
   arch/riscv/Kconfig:114: invalid statement
   arch/riscv/Kconfig:115: invalid statement
   arch/riscv/Kconfig:116: invalid statement
   arch/riscv/Kconfig:117: invalid statement
   arch/riscv/Kconfig:118: invalid statement
   arch/riscv/Kconfig:119: invalid statement
   arch/riscv/Kconfig:120: invalid statement
   arch/riscv/Kconfig:121: invalid statement
   arch/riscv/Kconfig:122: invalid statement
   arch/riscv/Kconfig:123: invalid statement
   arch/riscv/Kconfig:124: invalid statement
   arch/riscv/Kconfig:125: invalid statement
   arch/riscv/Kconfig:126: invalid statement
   arch/riscv/Kconfig:127: invalid statement
   arch/riscv/Kconfig:128: invalid statement
   arch/riscv/Kconfig:129: invalid statement
   arch/riscv/Kconfig:130: invalid statement
   arch/riscv/Kconfig:131: invalid statement
   arch/riscv/Kconfig:132: invalid statement
   arch/riscv/Kconfig:133: invalid statement
   arch/riscv/Kconfig:134: invalid statement
   arch/riscv/Kconfig:135: invalid statement
   arch/riscv/Kconfig:136: invalid statement
   arch/riscv/Kconfig:137: invalid statement
   arch/riscv/Kconfig:138: invalid statement
   arch/riscv/Kconfig:139: invalid statement
   arch/riscv/Kconfig:140: invalid statement
   arch/riscv/Kconfig:141: invalid statement
   arch/riscv/Kconfig:142: invalid statement
   arch/riscv/Kconfig:143: invalid statement
   arch/riscv/Kconfig:144: invalid statement
   arch/riscv/Kconfig:145: invalid statement
   arch/riscv/Kconfig:146: invalid statement
   arch/riscv/Kconfig:147: invalid statement
   arch/riscv/Kconfig:148: invalid statement
   arch/riscv/Kconfig:149: invalid statement
   arch/riscv/Kconfig:150: invalid statement
   arch/riscv/Kconfig:151: invalid statement
   arch/riscv/Kconfig:152: invalid statement
   arch/riscv/Kconfig:153: invalid statement
   arch/riscv/Kconfig:154: invalid statement
   arch/riscv/Kconfig:155: invalid statement
   arch/riscv/Kconfig:156: invalid statement
   arch/riscv/Kconfig:157: invalid statement
   arch/riscv/Kconfig:158: invalid statement
   arch/riscv/Kconfig:159: invalid statement
   arch/riscv/Kconfig:160: invalid statement
   arch/riscv/Kconfig:161: invalid statement
   arch/riscv/Kconfig:162: invalid statement
   arch/riscv/Kconfig:163: invalid statement
   arch/riscv/Kconfig:164: invalid statement
   arch/riscv/Kconfig:165: invalid statement
   arch/riscv/Kconfig:166: invalid statement


vim +67 arch/riscv/Kconfig

     6	
     7	config 64BIT
     8		bool
     9	
    10	config 32BIT
    11		bool
    12	
    13	config RISCV
    14		def_bool y
    15		select ACPI_GENERIC_GSI if ACPI
    16		select ACPI_MCFG if (ACPI && PCI)
    17		select ACPI_PPTT if ACPI
    18		select ACPI_REDUCED_HARDWARE_ONLY if ACPI
    19		select ACPI_SPCR_TABLE if ACPI
    20		select ARCH_DMA_DEFAULT_COHERENT
    21		select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
    22		select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
    23		select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
    24		select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
    25		select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
    26		select ARCH_HAS_BINFMT_FLAT
    27		select ARCH_HAS_CURRENT_STACK_POINTER
    28		select ARCH_HAS_DEBUG_VIRTUAL if MMU
    29		select ARCH_HAS_DEBUG_VM_PGTABLE
    30		select ARCH_HAS_DEBUG_WX
    31		select ARCH_HAS_FAST_MULTIPLIER
    32		select ARCH_HAS_FORTIFY_SOURCE
    33		select ARCH_HAS_GCOV_PROFILE_ALL
    34		select ARCH_HAS_GIGANTIC_PAGE
    35		select ARCH_HAS_HW_PTE_YOUNG
    36		select ARCH_HAS_KCOV
    37		select ARCH_HAS_KERNEL_FPU_SUPPORT if 64BIT && FPU
    38		select ARCH_HAS_MEMBARRIER_CALLBACKS
    39		select ARCH_HAS_MEMBARRIER_SYNC_CORE
    40		select ARCH_HAS_MMIOWB
    41		select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
    42		select ARCH_HAS_PMEM_API
    43		select ARCH_HAS_PREEMPT_LAZY
    44		select ARCH_HAS_PREPARE_SYNC_CORE_CMD
    45		select ARCH_HAS_PTDUMP if MMU
    46		select ARCH_HAS_PTE_SPECIAL
    47		select ARCH_HAS_SET_DIRECT_MAP if MMU
    48		select ARCH_HAS_SET_MEMORY if MMU
    49		select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
    50		select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
    51		select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
    52		select ARCH_HAS_SYSCALL_WRAPPER
    53		select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
    54		select ARCH_HAS_UBSAN
    55		select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
    56		select ARCH_KEEP_MEMBLOCK if ACPI
    57		select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
    58		select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
    59		select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
    60		select ARCH_STACKWALK
    61		select ARCH_SUPPORTS_ATOMIC_RMW
    62		# clang >= 17: https://github.com/llvm/llvm-project/commit/62fa708ceb027713b386c7e0efda994f8bdc27e2
    63		select ARCH_SUPPORTS_CFI_CLANG if CLANG_VERSION >= 170000
    64		select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
    65		select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
    66		select ARCH_SUPPORTS_HUGETLBFS if MMU
  > 67		select ARCH_SUPPORTS_LTO_CLANG && CMODEL_MEDANY
    68		select ARCH_SUPPORTS_LTO_CLANG_THIN
    69		select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
    70		select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
    71		select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
    72		select ARCH_SUPPORTS_RT
    73		select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
    74		select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
    75		select ARCH_USE_MEMTEST
    76		select ARCH_USE_QUEUED_RWLOCKS
    77		select ARCH_USE_SYM_ANNOTATIONS
    78		select ARCH_USES_CFI_TRAPS if CFI_CLANG
    79		select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if MMU
    80		select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
    81		select ARCH_WANT_FRAME_POINTERS
    82		select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
    83		select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
    84		select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
    85		select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
    86		select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
    87		select ARCH_WANTS_NO_INSTR
    88		select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
    89		select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
    90		select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
    91		select BUILDTIME_TABLE_SORT if MMU
    92		select CLINT_TIMER if RISCV_M_MODE
    93		select CLONE_BACKWARDS
    94		select COMMON_CLK
    95		select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
    96		select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
    97		select DYNAMIC_FTRACE if FUNCTION_TRACER
    98		select EDAC_SUPPORT
    99		select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
   100		select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
   101		select FUNCTION_ALIGNMENT_8B if DYNAMIC_FTRACE_WITH_CALL_OPS
   102		select GENERIC_ARCH_TOPOLOGY
   103		select GENERIC_ATOMIC64 if !64BIT
   104		select GENERIC_CLOCKEVENTS_BROADCAST if SMP
   105		select GENERIC_CPU_DEVICES
   106		select GENERIC_CPU_VULNERABILITIES
   107		select GENERIC_EARLY_IOREMAP
   108		select GENERIC_ENTRY
   109		select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
   110		select GENERIC_IDLE_POLL_SETUP
   111		select GENERIC_IOREMAP if MMU
   112		select GENERIC_IRQ_IPI if SMP
   113		select GENERIC_IRQ_IPI_MUX if SMP
   114		select GENERIC_IRQ_MULTI_HANDLER
   115		select GENERIC_IRQ_SHOW
   116		select GENERIC_IRQ_SHOW_LEVEL
   117		select GENERIC_LIB_DEVMEM_IS_ALLOWED
   118		select GENERIC_PENDING_IRQ if SMP
   119		select GENERIC_PCI_IOMAP
   120		select GENERIC_SCHED_CLOCK
   121		select GENERIC_SMP_IDLE_THREAD
   122		select GENERIC_TIME_VSYSCALL if MMU && 64BIT
   123		select GENERIC_VDSO_DATA_STORE if MMU
   124		select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
   125		select HARDIRQS_SW_RESEND
   126		select HAS_IOPORT if MMU
   127		select HAVE_ALIGNED_STRUCT_PAGE
   128		select HAVE_ARCH_AUDITSYSCALL
   129		select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
   130		select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
   131		select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
   132		select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
   133		select HAVE_ARCH_KASAN if MMU && 64BIT
   134		select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
   135		select HAVE_ARCH_KFENCE if MMU && 64BIT
   136		select HAVE_ARCH_KSTACK_ERASE
   137		select HAVE_ARCH_KGDB if !XIP_KERNEL
   138		select HAVE_ARCH_KGDB_QXFER_PKT
   139		select HAVE_ARCH_MMAP_RND_BITS if MMU
   140		select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
   141		select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
   142		select HAVE_ARCH_SECCOMP_FILTER
   143		select HAVE_ARCH_THREAD_STRUCT_WHITELIST
   144		select HAVE_ARCH_TRACEHOOK
   145		select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
   146		select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if 64BIT && MMU
   147		select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
   148		select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
   149		select HAVE_ASM_MODVERSIONS
   150		select HAVE_CONTEXT_TRACKING_USER
   151		select HAVE_DEBUG_KMEMLEAK
   152		select HAVE_DMA_CONTIGUOUS if MMU
   153		select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
   154		select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
   155		select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
   156		select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG)
   157		select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE
   158		select HAVE_FTRACE_GRAPH_FUNC
   159		select HAVE_FUNCTION_GRAPH_TRACER if HAVE_DYNAMIC_FTRACE_WITH_ARGS
   160		select HAVE_FUNCTION_GRAPH_FREGS
   161		select HAVE_FUNCTION_TRACER if !XIP_KERNEL && HAVE_DYNAMIC_FTRACE
   162		select HAVE_EBPF_JIT if MMU
   163		select HAVE_GUP_FAST if MMU
   164		select HAVE_FUNCTION_ARG_ACCESS_API
   165		select HAVE_FUNCTION_ERROR_INJECTION
   166		select HAVE_GCC_PLUGINS
   167		select HAVE_GENERIC_VDSO if MMU && 64BIT
   168		select HAVE_IRQ_TIME_ACCOUNTING
   169		select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
   170		select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
   171		select HAVE_KERNEL_LZ4 if !XIP_KERNEL && !EFI_ZBOOT
   172		select HAVE_KERNEL_LZMA if !XIP_KERNEL && !EFI_ZBOOT
   173		select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
   174		select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
   175		select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
   176		select HAVE_KERNEL_XZ if !XIP_KERNEL && !EFI_ZBOOT
   177		select HAVE_KPROBES if !XIP_KERNEL
   178		select HAVE_KRETPROBES if !XIP_KERNEL
   179		# https://github.com/ClangBuiltLinux/linux/issues/1881
   180		select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
   181		select HAVE_MOVE_PMD
   182		select HAVE_MOVE_PUD
   183		select HAVE_PAGE_SIZE_4KB
   184		select HAVE_PCI
   185		select HAVE_PERF_EVENTS
   186		select HAVE_PERF_REGS
   187		select HAVE_PERF_USER_STACK_DUMP
   188		select HAVE_POSIX_CPU_TIMERS_TASK_WORK
   189		select HAVE_PREEMPT_DYNAMIC_KEY if !XIP_KERNEL
   190		select HAVE_REGS_AND_STACK_ACCESS_API
   191		select HAVE_RETHOOK if !XIP_KERNEL
   192		select HAVE_RSEQ
   193		select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
   194		select HAVE_SAMPLE_FTRACE_DIRECT
   195		select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
   196		select HAVE_STACKPROTECTOR
   197		select HAVE_SYSCALL_TRACEPOINTS
   198		select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
   199		select IRQ_DOMAIN
   200		select IRQ_FORCED_THREADING
   201		select KASAN_VMALLOC if KASAN
   202		select LOCK_MM_AND_FIND_VMA
   203		select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
   204		select MODULES_USE_ELF_RELA if MODULES
   205		select OF
   206		select OF_EARLY_FLATTREE
   207		select OF_IRQ
   208		select PCI_DOMAINS_GENERIC if PCI
   209		select PCI_ECAM if (ACPI && PCI)
   210		select PCI_MSI if PCI
   211		select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
   212		select RISCV_ALTERNATIVE if !XIP_KERNEL
   213		select RISCV_APLIC
   214		select RISCV_IMSIC
   215		select RISCV_INTC
   216		select RISCV_TIMER if RISCV_SBI
   217		select SIFIVE_PLIC
   218		select SPARSE_IRQ
   219		select SYSCTL_EXCEPTION_TRACE
   220		select THREAD_INFO_IN_TASK
   221		select TRACE_IRQFLAGS_SUPPORT
   222		select UACCESS_MEMCPY if !MMU
   223		select VDSO_GETRANDOM if HAVE_GENERIC_VDSO
   224		select USER_STACKTRACE_SUPPORT
   225		select ZONE_DMA32 if 64BIT
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
