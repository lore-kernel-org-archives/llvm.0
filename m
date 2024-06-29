Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD951DA53;
	Sat, 29 Jun 2024 04:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719636220; cv=none; b=OzoQBJD114pNUDLzB5LDqg5CmFjbWw9gaiHlIFnPglNLTx2dTNI2+X84NR0G7FWEo6mZqwT/RAlv12/F/jOhef/7PJAMBwp1EJE6t+rPEjnZ1TAYTuQvhSaeJpSfiXXADj/RvgVZOf+DPpxmX6Cgb/HRbcz46d9tP2hRd2HOUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719636220; c=relaxed/simple;
	bh=/Rl8pdH1FL9R5VJZWkTY1H1g8Y7kkNBlLPBrJWPUHD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKMNe9sYLlvdiIVCRfdeGdF9aW719VfIvLUVHk4ttJ1AbiUFx75lnBquaiMGxC+7bqvVCF0LvcCWJHKyeSR/i0NOzGwFREyTaVbwgis77gG/JcvH9Pl+ODEcJBb2LB2db5BHuWV50T0Zub4WPij3k/4pc4yzADqjjqCHGAcjefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kM8p91c9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kM8p91c9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719636213; x=1751172213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Rl8pdH1FL9R5VJZWkTY1H1g8Y7kkNBlLPBrJWPUHD8=;
  b=kM8p91c9HDQ/E/4zajhUdZv7XNm5l5Lm0WTqhJZpHicNjfal69SMb6cu
   uR1GDmCYGpeI/EvvLjfeWxq1VpTSxHdMQlJM7E46W6QM04PTQWgJyzcTy
   AIRDMCuu4eYftaRfOD80g9P3zJMjqqlNsbzn+mwk0O+zbTYBdFc8B9JsJ
   99791auevzBy13Fj3MVi0y1Us+qJgrJnAQy0YyJPjvUlnch4WnfisoPsT
   OMSUoITiyZVeDJbP+wvIQDY0a0Ztu2QpqZhzdfdKaFpW3H1mzMcGaLEgP
   +Zel3+kpEZq2yihYRPitrt0F1Zn0GT+vpQzAaOCfXGoV6AdWjz62QkgC6
   g==;
X-CSE-ConnectionGUID: 2IwlgpcwQ4WV8kV7eeehqA==
X-CSE-MsgGUID: aurLFGoxSSy4EpRk1xBAuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16780352"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16780352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 21:43:32 -0700
X-CSE-ConnectionGUID: A5TWjhwGTPibwpMMWKH/pw==
X-CSE-MsgGUID: rkzpSfc2R+C2gCvbVwbgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44968526"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 21:43:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNPvq-000Ixq-3A;
	Sat, 29 Jun 2024 04:43:26 +0000
Date: Sat, 29 Jun 2024 12:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9137/9689] mm/gup.c:476:11: error: call to
 undeclared function 'try_grab_folio_fast'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202406291219.fqTR9WPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="H37BPdoKH48m6v5L"
Content-Disposition: inline


--H37BPdoKH48m6v5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1eb586a9782cde8e5091b9de74603e0a8386b09e
commit: ee3fe497bdf0c7cb6fbec346f36aa1f9b1dfe6dd [9137/9689] mm: gup: do not call try_grab_folio() in slow path
config: powerpc64-randconfig-003-20240629
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build):

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406291219.fqTR9WPY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/gup.c:7:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/gup.c:19:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/gup.c:476:11: error: call to undeclared function 'try_grab_folio_fast'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     476 |                 folio = try_grab_folio_fast(page, refs, flags);
         |                         ^
   mm/gup.c:476:11: note: did you mean 'try_grab_folio'?
   mm/gup.c:139:18: note: 'try_grab_folio' declared here
     139 | int __must_check try_grab_folio(struct folio *folio, int refs, unsigned int flags)
         |                  ^
>> mm/gup.c:476:9: error: incompatible integer to pointer conversion assigning to 'struct folio *' from 'int' [-Wint-conversion]
     476 |                 folio = try_grab_folio_fast(page, refs, flags);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/gup.c:2748:22: error: static declaration of 'try_grab_folio_fast' follows non-static declaration
    2748 | static struct folio *try_grab_folio_fast(struct page *page, int refs,
         |                      ^
   mm/gup.c:476:11: note: previous implicit declaration is here
     476 |                 folio = try_grab_folio_fast(page, refs, flags);
         |                         ^
   7 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/try_grab_folio_fast +476 mm/gup.c

   441	
   442	/*
   443	 * Returns 1 if succeeded, 0 if failed, -EMLINK if unshare needed.
   444	 *
   445	 * NOTE: for the same entry, gup-fast and gup-slow can return different
   446	 * results (0 v.s. -EMLINK) depending on whether vma is available.  This is
   447	 * the expected behavior, where we simply want gup-fast to fallback to
   448	 * gup-slow to take the vma reference first.
   449	 */
   450	static int gup_hugepte(struct vm_area_struct *vma, pte_t *ptep, unsigned long sz,
   451			       unsigned long addr, unsigned long end, unsigned int flags,
   452			       struct page **pages, int *nr, bool fast)
   453	{
   454		unsigned long pte_end;
   455		struct page *page;
   456		struct folio *folio;
   457		pte_t pte;
   458		int refs;
   459	
   460		pte_end = (addr + sz) & ~(sz-1);
   461		if (pte_end < end)
   462			end = pte_end;
   463	
   464		pte = huge_ptep_get(ptep);
   465	
   466		if (!pte_access_permitted(pte, flags & FOLL_WRITE))
   467			return 0;
   468	
   469		/* hugepages are never "special" */
   470		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
   471	
   472		page = pte_page(pte);
   473		refs = record_subpages(page, sz, addr, end, pages + *nr);
   474	
   475		if (fast) {
 > 476			folio = try_grab_folio_fast(page, refs, flags);
   477			if (!folio)
   478				return 0;
   479		} else {
   480			folio = page_folio(page);
   481			if (try_grab_folio(folio, refs, flags))
   482				return 0;
   483		}
   484	
   485		if (unlikely(pte_val(pte) != pte_val(ptep_get(ptep)))) {
   486			gup_put_folio(folio, refs, flags);
   487			return 0;
   488		}
   489	
   490		if (!pte_write(pte) && gup_must_unshare(vma, flags, &folio->page)) {
   491			gup_put_folio(folio, refs, flags);
   492			return -EMLINK;
   493		}
   494	
   495		*nr += refs;
   496		folio_set_referenced(folio);
   497		return 1;
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--H37BPdoKH48m6v5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ee3fe497bdf0c7cb6fbec346f36aa1f9b1dfe6dd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ee3fe497bdf0c7cb6fbec346f36aa1f9b1dfe6dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-19 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-19 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash mm/

--H37BPdoKH48m6v5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/powerpc 6.10.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 19.0.0git (git://gitmirror/llvm_project 326ba38a991250a8587a399a260b0f7af2c9166a)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=190000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=190000
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=190000
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=127
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_XZ is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_IRQ_EDGE_EOI_HANDLER=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_DOMAIN_NOMAP=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_ARCH_HAS_TICK_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_TIME_KUNIT_TEST=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ_FULL is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# CONFIG_BPF_JIT is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not set
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_BSD_PROCESS_ACCT=y
# CONFIG_BSD_PROCESS_ACCT_V3 is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_NEED_SRCU_NMI_SAFE=y
CONFIG_NEED_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_INDEX=y

#
# Scheduler features
#
CONFIG_UCLAMP_TASK=y
CONFIG_UCLAMP_BUCKETS_COUNT=5
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC10_NO_ARRAY_BOUNDS=y
CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_BLK_CGROUP=y
# CONFIG_CGROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_HUGETLB is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_TIME_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_FORCE is not set
# CONFIG_BOOT_CONFIG_EMBED is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
# CONFIG_BASE_SMALL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
# CONFIG_KCMP is not set
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_CACHESTAT_SYSCALL=y
# CONFIG_PC104 is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y

#
# Kexec and crash features
#
CONFIG_VMCORE_INFO=y
CONFIG_KEXEC_CORE=y
CONFIG_KEXEC_ELF=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
# CONFIG_CRASH_DUMP is not set
# end of Kexec and crash features
# end of General setup

CONFIG_PPC64=y

#
# Processor support
#
CONFIG_PPC_BOOK3S_64=y
# CONFIG_PPC_BOOK3E_64 is not set
CONFIG_POWERPC64_CPU=y
# CONFIG_PPC_970_CPU is not set
# CONFIG_POWER6_CPU is not set
# CONFIG_POWER7_CPU is not set
# CONFIG_POWER8_CPU is not set
# CONFIG_POWER9_CPU is not set
# CONFIG_POWER10_CPU is not set
# CONFIG_TOOLCHAIN_DEFAULT_CPU is not set
CONFIG_TARGET_CPU_BOOL=y
CONFIG_TARGET_CPU="power4"
CONFIG_TUNE_CPU="-mtune=power10"
CONFIG_PPC_BOOK3S=y
CONFIG_PPC_FPU_REGS=y
CONFIG_PPC_FPU=y
# CONFIG_ALTIVEC is not set
CONFIG_PPC_64S_HASH_MMU=y
CONFIG_PPC_RADIX_MMU=y
CONFIG_PPC_RADIX_MMU_DEFAULT=y
# CONFIG_PPC_KUEP is not set
CONFIG_PPC_KUAP=y
# CONFIG_PPC_KUAP_DEBUG is not set
CONFIG_PPC_PKEY=y
CONFIG_PPC_HAVE_PMU_SUPPORT=y
# CONFIG_PMU_SYSFS is not set
CONFIG_PPC_PERF_CTRS=y
CONFIG_SMP=y
CONFIG_NR_CPUS=32
# end of Processor support

CONFIG_CPU_BIG_ENDIAN=y
# CONFIG_CPU_LITTLE_ENDIAN is not set
CONFIG_PPC64_ELF_ABI_V2=y
CONFIG_CC_HAS_ELFV2=y
CONFIG_CC_HAS_PREFIXED=y
CONFIG_64BIT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MAX=29
CONFIG_ARCH_MMAP_RND_BITS_MIN=14
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=13
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=7
CONFIG_NR_IRQS=512
CONFIG_NMI_IPI=y
CONFIG_PPC_WATCHDOG=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_PPC=y
CONFIG_PPC_BARRIER_NOSPEC=y
CONFIG_EARLY_PRINTK=y
CONFIG_PANIC_TIMEOUT=180
# CONFIG_COMPAT is not set
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_PPC_UDBG_16550=y
CONFIG_GENERIC_TBSYNC=y
CONFIG_AUDIT_ARCH=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_PPC_DCR_MMIO=y
CONFIG_PPC_DCR=y
CONFIG_PPC_OF_PLATFORM_PCI=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PPC_DAWR=y
CONFIG_PGTABLE_LEVELS=4

#
# Platform support
#
# CONFIG_PPC_POWERNV is not set
CONFIG_SCOM_DEBUGFS=y
# CONFIG_PPC_PSERIES is not set
# CONFIG_PPC_PMAC is not set
CONFIG_PPC_MAPLE=y
# CONFIG_PPC_PASEMI is not set
CONFIG_PPC_PS3=y

#
# PS3 Platform Options
#
CONFIG_PS3_ADVANCED=y
CONFIG_PS3_HTAB_SIZE=20
# CONFIG_PS3_DYNAMIC_DMA is not set
CONFIG_PS3_VUART=y
CONFIG_PS3_PS3AV=y
# CONFIG_PS3_SYS_MANAGER is not set
CONFIG_PS3_VERBOSE_RESULT=y
CONFIG_PS3_REPOSITORY_WRITE=y
CONFIG_PS3_STORAGE=y
CONFIG_PS3_DISK=y
CONFIG_PS3_ROM=y
CONFIG_PS3_FLASH=y
CONFIG_PS3_LPM=y
# end of PS3 Platform Options

CONFIG_PPC_CELL=y
CONFIG_PPC_CELL_COMMON=y
CONFIG_PPC_CELL_NATIVE=y
CONFIG_PPC_IBM_CELL_BLADE=y

#
# Cell Broadband Engine options
#
CONFIG_SPU_FS=y
CONFIG_SPU_BASE=y
# CONFIG_CBE_RAS is not set
# CONFIG_PPC_IBM_CELL_POWERBUTTON is not set
# CONFIG_CBE_CPUFREQ_SPU_GOVERNOR is not set
# end of Cell Broadband Engine options

CONFIG_KVM_GUEST=y
CONFIG_EPAPR_PARAVIRT=y
CONFIG_PPC_HASH_MMU_NATIVE=y
CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
CONFIG_PPC_DT_CPU_FTRS=y
CONFIG_UDBG_RTAS_CONSOLE=y
CONFIG_MPIC=y
CONFIG_MPIC_MSGR=y
CONFIG_U3_DART=y
CONFIG_PPC_RTAS=y
# CONFIG_RTAS_PROC is not set
CONFIG_MMIO_NVRAM=y
CONFIG_MPIC_U3_HT_IRQS=y
CONFIG_PPC_970_NAP=y
CONFIG_PPC_BOOK3S_IDLE=y
CONFIG_PPC_INDIRECT_PIO=y
CONFIG_PPC_INDIRECT_MMIO=y
CONFIG_PPC_IO_WORKAROUNDS=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_CPUFREQ_DT_PLATDEV=y
CONFIG_CPU_FREQ_MAPLE=y
# end of CPU Frequency scaling

#
# CPUIdle driver
#

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPUIdle driver

# CONFIG_GEN_RTC is not set
# end of Platform support

#
# Kernel options
#
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_SCHED_HRTICK=y
# CONFIG_PPC_TRANSACTIONAL_MEM is not set
CONFIG_LD_HEAD_STUB_CATCH=y
CONFIG_HOTPLUG_CPU=y
CONFIG_PPC_QUEUED_SPINLOCKS=y
CONFIG_ARCH_CPU_PROBE_RELEASE=y
# CONFIG_PPC64_SUPPORTS_MEMORY_FAILURE is not set
CONFIG_ARCH_SUPPORTS_KEXEC=y
CONFIG_ARCH_SUPPORTS_KEXEC_FILE=y
CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY=y
CONFIG_ARCH_SELECTS_KEXEC_FILE=y
CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2=y
CONFIG_RELOCATABLE=y
# CONFIG_RELOCATABLE_TEST is not set
CONFIG_ARCH_SUPPORTS_CRASH_DUMP=y
CONFIG_ARCH_SUPPORTS_CRASH_HOTPLUG=y
# CONFIG_IRQ_ALL_CPUS is not set
CONFIG_NUMA=y
CONFIG_NODES_SHIFT=8
CONFIG_HAVE_MEMORYLESS_NODES=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ILLEGAL_POINTER_VALUE=0x5deadbeef0000000
CONFIG_ARCH_MEMORY_PROBE=y
# CONFIG_PPC_4K_PAGES is not set
CONFIG_PPC_64K_PAGES=y
CONFIG_THREAD_SHIFT=14
CONFIG_DATA_SHIFT=16
CONFIG_ARCH_FORCE_MAX_ORDER=8
CONFIG_PPC_SUBPAGE_PROT=y
# CONFIG_PPC_PROT_SAO_LPAR is not set
CONFIG_PPC_COPRO_BASE=y
# CONFIG_SCHED_SMT is not set
# CONFIG_PPC_DENORMALISATION is not set
CONFIG_CMDLINE=""
CONFIG_EXTRA_TARGETS=""
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_HIBERNATION_COMP_LZO=y
CONFIG_HIBERNATION_DEF_COMP="lzo"
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_USERSPACE_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_ENERGY_MODEL=y
# CONFIG_PPC_MEM_KEYS is not set
# end of Kernel options

CONFIG_ISA_DMA_API=y

#
# Bus options
#
CONFIG_GENERIC_ISA_DMA=y
CONFIG_FSL_LBC=y
# end of Bus options

CONFIG_NONSTATIC_KERNEL=y
CONFIG_PAGE_OFFSET=0xc000000000000000
CONFIG_KERNEL_START=0xc000000000000000
CONFIG_PHYSICAL_START=0x00000000
CONFIG_KVM_COMMON=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_VFIO=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
CONFIG_KVM_GENERIC_MMU_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
CONFIG_KVM_BOOK3S_HANDLER=y
CONFIG_KVM_BOOK3S_64_HANDLER=y
CONFIG_KVM_BOOK3S_PR_POSSIBLE=y
CONFIG_KVM_BOOK3S_64=y
# CONFIG_KVM_BOOK3S_64_PR is not set
# CONFIG_KVM_XICS is not set
CONFIG_CPU_MITIGATIONS=y

#
# General architecture-dependent options
#
CONFIG_HOTPLUG_SMT=y
CONFIG_SMT_NUM_THREADS_DYNAMIC=y
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_PAGE_SIZE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM=y
CONFIG_MMU_LAZY_TLB_SHOOTDOWN=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES=y
CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_ARCH_MMAP_RND_BITS=14
CONFIG_HAVE_PAGE_SIZE_64KB=y
CONFIG_PAGE_SIZE_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=16
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_HAVE_ARCH_NVRAM_OPS=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=y
CONFIG_ARCH_HAS_PHYS_TO_DMA=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT=4
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_RQ_ALLOC_TIME=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_WRITE_MOUNTED=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_WBT is not set
CONFIG_BLK_CGROUP_IOLATENCY=y
CONFIG_BLK_CGROUP_IOCOST=y
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
# CONFIG_MAC_PARTITION is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
# CONFIG_MINIX_SUBPARTITION is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
# CONFIG_UNIXWARE_DISKLABEL is not set
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
# CONFIG_KARMA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
# CONFIG_MQ_IOSCHED_DEADLINE is not set
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
CONFIG_BFQ_CGROUP_DEBUG=y
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_MMIOWB=y
CONFIG_MMIOWB=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_ELF_KUNIT_TEST=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
CONFIG_ZSWAP_DEFAULT_ON=y
# CONFIG_ZSWAP_SHRINKER_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC=y
CONFIG_ZSWAP_ZPOOL_DEFAULT="zsmalloc"
CONFIG_ZBUD=y
CONFIG_Z3FOLD=y
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# Slab allocator options
#
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SLUB_STATS=y
# CONFIG_SLUB_CPU_PARTIAL is not set
# CONFIG_RANDOM_KMALLOC_CACHES is not set
# end of Slab allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
# CONFIG_SPARSEMEM_VMEMMAP is not set
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=y
CONFIG_HAVE_GUP_FAST=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_HUGETLB_PAGE_SIZE_VARIABLE=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PCP_BATCH_SCALE_MAX=5
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_PGTABLE_HAS_HUGE_LEAVES=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=20
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_GET_FREE_REGION=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y
CONFIG_DMAPOOL_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_ARCH_HAS_HUGEPD=y
CONFIG_MEMFD_CREATE=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set
CONFIG_LOCK_MM_AND_FIND_VMA=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_KUNIT_TEST=y
CONFIG_DAMON_VADDR=y
# CONFIG_DAMON_PADDR is not set
CONFIG_DAMON_VADDR_KUNIT_TEST=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_SYSFS_KUNIT_TEST=y
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_UNIX is not set
CONFIG_NET_HANDSHAKE_KUNIT_TEST=y
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_ADVANCED is not set
CONFIG_ATM=y
CONFIG_ATM_LANE=y
CONFIG_MRP=y
# CONFIG_BRIDGE is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=y
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=y
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
CONFIG_VSOCKETS_LOOPBACK=y
CONFIG_VIRTIO_VSOCKETS=y
CONFIG_VIRTIO_VSOCKETS_COMMON=y
CONFIG_NETLINK_DIAG=y
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
CONFIG_HSR=y
# CONFIG_QRTR is not set
# CONFIG_PCPU_DEV_REFCNT is not set
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
# CONFIG_AX25 is not set
CONFIG_CAN=y
# CONFIG_CAN_RAW is not set
# CONFIG_CAN_BCM is not set
CONFIG_CAN_GW=y
CONFIG_CAN_J1939=y
# CONFIG_CAN_ISOTP is not set
CONFIG_BT=y
# CONFIG_BT_BREDR is not set
CONFIG_BT_LE=y
# CONFIG_BT_LE_L2CAP_ECRED is not set
CONFIG_BT_LEDS=y
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set
CONFIG_BT_SELFTEST=y
CONFIG_BT_SELFTEST_ECDH=y
# CONFIG_BT_SELFTEST_SMP is not set
# CONFIG_BT_FEATURE_DEBUG is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=y
CONFIG_BT_MTK=y
CONFIG_BT_HCIBTUSB=y
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
CONFIG_BT_HCIBTUSB_POLL_SYNC=y
# CONFIG_BT_HCIBTUSB_BCM is not set
# CONFIG_BT_HCIBTUSB_MTK is not set
# CONFIG_BT_HCIBTUSB_RTL is not set
CONFIG_BT_HCIBTSDIO=y
# CONFIG_BT_HCIUART is not set
CONFIG_BT_HCIBCM203X=y
CONFIG_BT_HCIBCM4377=y
# CONFIG_BT_HCIBPA10X is not set
CONFIG_BT_HCIBFUSB=y
CONFIG_BT_HCIDTL1=y
# CONFIG_BT_HCIBT3C is not set
CONFIG_BT_HCIBLUECARD=y
# CONFIG_BT_HCIVHCI is not set
CONFIG_BT_MRVL=y
CONFIG_BT_MRVL_SDIO=y
CONFIG_BT_ATH3K=y
# CONFIG_BT_MTKSDIO is not set
CONFIG_BT_MTKUART=y
# CONFIG_BT_QCOMSMD is not set
# CONFIG_BT_VIRTIO is not set
CONFIG_BT_NXPUART=y
CONFIG_BT_INTEL_PCIE=y
# end of Bluetooth device drivers

CONFIG_MCTP=y
CONFIG_MCTP_TEST=y
CONFIG_MCTP_FLOWS=y
# CONFIG_WIRELESS is not set
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=y
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
CONFIG_NET_9P_DEBUG=y
CONFIG_CAIF=y
CONFIG_CAIF_DEBUG=y
# CONFIG_CAIF_NETDEV is not set
CONFIG_CAIF_USB=y
CONFIG_NFC=y
# CONFIG_NFC_DIGITAL is not set
# CONFIG_NFC_NCI is not set
CONFIG_NFC_HCI=y
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_PN533=y
CONFIG_NFC_PN533_USB=y
CONFIG_NFC_PN533_I2C=y
CONFIG_NFC_PN532_UART=y
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=y
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
# CONFIG_NET_SELFTESTS is not set
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y
CONFIG_NETDEV_ADDR_LIST_TEST=y
CONFIG_NET_TEST=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_FORCE_PCI=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_SYSCALL=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PTM=y
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_DEBUG=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_DYNAMIC_OF_NODES=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_PCIE_ALTERA=y
CONFIG_PCI_VERSATILE=y
CONFIG_PCI_HOST_THUNDER_PEM=y
CONFIG_PCI_HOST_THUNDER_ECAM=y
# CONFIG_PCI_FTPCI100 is not set
CONFIG_PCI_HOST_COMMON=y
CONFIG_PCI_HOST_GENERIC=y
CONFIG_PCI_LOONGSON=y
CONFIG_PCIE_MT7621=y
# CONFIG_PCIE_RCAR_EP is not set
CONFIG_PCIE_ROCKCHIP=y
CONFIG_PCIE_ROCKCHIP_EP=y
CONFIG_PCI_V3_SEMI=y
CONFIG_PCI_XGENE=y
CONFIG_PCIE_XILINX_CPM=y

#
# Cadence-based PCIe controllers
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCIE_CADENCE_PLAT_EP is not set
CONFIG_PCI_J721E=y
CONFIG_PCI_J721E_HOST=y
# CONFIG_PCI_J721E_EP is not set
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_EP=y
# CONFIG_PCIE_ARTPEC6_EP is not set
# CONFIG_PCI_IMX6_EP is not set
# CONFIG_PCI_LAYERSCAPE_EP is not set
# CONFIG_PCIE_TEGRA194_EP is not set
CONFIG_PCIE_QCOM_EP=y
CONFIG_PCIE_RCAR_GEN4=y
CONFIG_PCIE_RCAR_GEN4_EP=y
# CONFIG_PCIE_UNIPHIER_EP is not set
CONFIG_PCI_DRA7XX=y
CONFIG_PCI_DRA7XX_EP=y
CONFIG_PCI_KEYSTONE=y
CONFIG_PCI_KEYSTONE_EP=y
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
# CONFIG_PCI_EPF_TEST is not set
CONFIG_PCI_EPF_NTB=y
CONFIG_PCI_EPF_VNTB=y
CONFIG_PCI_EPF_MHI=y
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=y
CONFIG_CXL_PCI=y
# CONFIG_CXL_MEM_RAW_COMMANDS is not set
CONFIG_CXL_MEM=y
CONFIG_CXL_PORT=y
CONFIG_CXL_REGION=y
# CONFIG_CXL_REGION_INVALIDATION_TEST is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=y
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_PD6729 is not set
CONFIG_I82092=y
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
CONFIG_RAPIDIO_DMA_ENGINE=y
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=y
CONFIG_RAPIDIO_CHMAN=y
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=y
CONFIG_RAPIDIO_CPS_GEN2=y
# CONFIG_RAPIDIO_RXS_GEN3 is not set
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
# CONFIG_REGMAP_KUNIT is not set
CONFIG_REGMAP_BUILD=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SOUNDWIRE=y
CONFIG_REGMAP_SOUNDWIRE_MBQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BT1_APB is not set
CONFIG_BT1_AXI=y
# CONFIG_HISILICON_LPC is not set
# CONFIG_INTEL_IXP4XX_EB is not set
CONFIG_QCOM_EBI2=y
# CONFIG_STM32_FIREWALL is not set
# CONFIG_FSL_MC_BUS is not set
CONFIG_MHI_BUS=y
CONFIG_MHI_BUS_DEBUG=y
# CONFIG_MHI_BUS_PCI_GENERIC is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

#
# Cache Drivers
#
# end of Cache Drivers

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=y
CONFIG_ARM_SCMI_NEED_DEBUGFS=y
CONFIG_ARM_SCMI_RAW_MODE_SUPPORT=y
CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX=y
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO is not set
# CONFIG_ARM_SCMI_POWER_CONTROL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_TURRIS_MOX_RWTM=y
# CONFIG_BCM47XX_NVRAM is not set
# CONFIG_TEE_BNXT_FW is not set
CONFIG_FW_CS_DSP=y
CONFIG_GOOGLE_FIRMWARE=y
CONFIG_GOOGLE_CBMEM=y
CONFIG_GOOGLE_COREBOOT_TABLE=y
CONFIG_GOOGLE_MEMCONSOLE=y
CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT=y
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=y
# CONFIG_GOOGLE_VPD is not set

#
# Qualcomm firmware drivers
#
CONFIG_QCOM_SCM=y
# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
# CONFIG_QCOM_QSEECOM is not set
# end of Qualcomm firmware drivers

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_KUNIT_TEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_PC_FIFO is not set
CONFIG_PARPORT_PC_SUPERIO=y
# CONFIG_PARPORT_PC_PCMCIA is not set
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_FD=y
CONFIG_BLK_DEV_FD_RAWCMD=y
CONFIG_CDROM=y
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=y
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_ZSTD is not set
# CONFIG_ZRAM_DEF_COMP_LZO is not set
# CONFIG_ZRAM_DEF_COMP_LZ4HC is not set
# CONFIG_ZRAM_DEF_COMP_842 is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
# CONFIG_ZRAM_WRITEBACK is not set
CONFIG_ZRAM_TRACK_ENTRY_ACTIME=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
CONFIG_ZRAM_MULTI_COMP=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8

#
# DRBD disabled because PROC_FS or INET not selected
#
CONFIG_BLK_DEV_NBD=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
# CONFIG_CDROM_PKTCDVD is not set
CONFIG_ATA_OVER_ETH=y
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_UBLK=y
CONFIG_BLKDEV_UBLK_LEGACY_OPCODES=y

#
# NVME Support
#
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
CONFIG_PHANTOM=y
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=y
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_SMPRO_ERRMON is not set
CONFIG_SMPRO_MISC=y
# CONFIG_HI6421V600_IRQ is not set
CONFIG_HP_ILO=y
CONFIG_QCOM_COINCELL=y
CONFIG_QCOM_FASTRPC=y
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
CONFIG_PCH_PHUB=y
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
CONFIG_PCI_ENDPOINT_TEST=y
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
CONFIG_HISI_HIKEY_USB=y
# CONFIG_OPEN_DICE is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_TPS6594_ESM=y
CONFIG_TPS6594_PFSM=y
CONFIG_NSM=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=1
CONFIG_ECHO=y
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
CONFIG_MISC_RTSX_USB=y
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
# CONFIG_SCSI_PROC_FS is not set
CONFIG_SCSI_LIB_KUNIT_TEST=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
CONFIG_BLK_DEV_SR=y
# CONFIG_CHR_DEV_SG is not set
CONFIG_BLK_DEV_BSG=y
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_ENCLOSURE=y
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set
CONFIG_SCSI_PROTO_TEST=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_FC_ATTRS=y
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
# CONFIG_SCSI_SAS_ATA is not set
CONFIG_SCSI_SAS_HOST_SMP=y
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_ATA_NONSTANDARD=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=y
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=y
CONFIG_AHCI_BRCM=y
CONFIG_AHCI_DA850=y
# CONFIG_AHCI_DM816 is not set
CONFIG_AHCI_DWC=y
CONFIG_AHCI_ST=y
CONFIG_AHCI_IMX=y
# CONFIG_AHCI_CEVA is not set
CONFIG_AHCI_MTK=y
CONFIG_AHCI_MVEBU=y
CONFIG_AHCI_SUNXI=y
# CONFIG_AHCI_TEGRA is not set
# CONFIG_AHCI_XGENE is not set
# CONFIG_AHCI_QORIQ is not set
# CONFIG_SATA_FSL is not set
CONFIG_SATA_GEMINI=y
CONFIG_SATA_AHCI_SEATTLE=y
CONFIG_SATA_INIC162X=y
CONFIG_SATA_ACARD_AHCI=y
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=y
# CONFIG_SATA_QSTOR is not set
CONFIG_SATA_SX4=y
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=y
CONFIG_SATA_DWC=y
# CONFIG_SATA_DWC_OLD_DMA is not set
# CONFIG_SATA_HIGHBANK is not set
# CONFIG_SATA_MV is not set
CONFIG_SATA_NV=y
CONFIG_SATA_PROMISE=y
# CONFIG_SATA_RCAR is not set
# CONFIG_SATA_SIL is not set
CONFIG_SATA_SIS=y
CONFIG_SATA_SVW=y
CONFIG_SATA_ULI=y
CONFIG_SATA_VIA=y
CONFIG_SATA_VITESSE=y

#
# PATA SFF controllers with BMDMA
#
CONFIG_PATA_ALI=y
CONFIG_PATA_AMD=y
CONFIG_PATA_ARASAN_CF=y
CONFIG_PATA_ARTOP=y
CONFIG_PATA_ATIIXP=y
CONFIG_PATA_ATP867X=y
# CONFIG_PATA_CMD64X is not set
CONFIG_PATA_CS5520=y
CONFIG_PATA_CS5530=y
# CONFIG_PATA_CS5536 is not set
CONFIG_PATA_CYPRESS=y
CONFIG_PATA_EFAR=y
CONFIG_PATA_FTIDE010=y
CONFIG_PATA_HPT366=y
CONFIG_PATA_HPT37X=y
CONFIG_PATA_HPT3X2N=y
CONFIG_PATA_HPT3X3=y
CONFIG_PATA_HPT3X3_DMA=y
CONFIG_PATA_IMX=y
# CONFIG_PATA_IT8213 is not set
CONFIG_PATA_IT821X=y
# CONFIG_PATA_JMICRON is not set
CONFIG_PATA_MARVELL=y
CONFIG_PATA_NETCELL=y
CONFIG_PATA_NINJA32=y
# CONFIG_PATA_NS87415 is not set
CONFIG_PATA_OLDPIIX=y
CONFIG_PATA_OPTIDMA=y
CONFIG_PATA_PDC2027X=y
CONFIG_PATA_PDC_OLD=y
CONFIG_PATA_RADISYS=y
CONFIG_PATA_RDC=y
CONFIG_PATA_SC1200=y
CONFIG_PATA_SCH=y
CONFIG_PATA_SERVERWORKS=y
CONFIG_PATA_SIL680=y
CONFIG_PATA_SIS=y
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
CONFIG_PATA_PXA=y
CONFIG_PATA_WINBOND=y

#
# PIO-only SFF controllers
#
CONFIG_PATA_CMD640_PCI=y
# CONFIG_PATA_IXP4XX_CF is not set
# CONFIG_PATA_MPIIX is not set
CONFIG_PATA_NS87410=y
# CONFIG_PATA_OPTI is not set
CONFIG_PATA_PCMCIA=y
CONFIG_PATA_PLATFORM=y
CONFIG_PATA_OF_PLATFORM=y
CONFIG_PATA_RZ1000=y
CONFIG_PATA_PARPORT=y

#
# Parallel IDE protocol modules
#
CONFIG_PATA_PARPORT_ATEN=y
# CONFIG_PATA_PARPORT_BPCK is not set
CONFIG_PATA_PARPORT_BPCK6=y
# CONFIG_PATA_PARPORT_COMM is not set
# CONFIG_PATA_PARPORT_DSTR is not set
CONFIG_PATA_PARPORT_FIT2=y
CONFIG_PATA_PARPORT_FIT3=y
# CONFIG_PATA_PARPORT_EPAT is not set
# CONFIG_PATA_PARPORT_EPIA is not set
# CONFIG_PATA_PARPORT_FRIQ is not set
CONFIG_PATA_PARPORT_FRPW=y
CONFIG_PATA_PARPORT_KBIC=y
CONFIG_PATA_PARPORT_KTTI=y
CONFIG_PATA_PARPORT_ON20=y
# CONFIG_PATA_PARPORT_ON26 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_ATA_GENERIC=y
CONFIG_PATA_LEGACY=y
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_BITMAP_FILE=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
# CONFIG_MD_RAID10 is not set
# CONFIG_MD_RAID456 is not set
CONFIG_BCACHE=y
# CONFIG_BCACHE_DEBUG is not set
# CONFIG_BCACHE_ASYNC_REGISTRATION is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=y
CONFIG_DM_SNAPSHOT=y
CONFIG_DM_THIN_PROVISIONING=y
CONFIG_DM_CACHE=y
CONFIG_DM_CACHE_SMQ=y
CONFIG_DM_WRITECACHE=y
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=y
CONFIG_DM_CLONE=y
# CONFIG_DM_MIRROR is not set
# CONFIG_DM_RAID is not set
# CONFIG_DM_ZERO is not set
# CONFIG_DM_MULTIPATH is not set
# CONFIG_DM_DELAY is not set
CONFIG_DM_DUST=y
CONFIG_DM_INIT=y
# CONFIG_DM_UEVENT is not set
CONFIG_DM_FLAKEY=y
CONFIG_DM_VERITY=y
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=y
CONFIG_DM_LOG_WRITES=y
CONFIG_DM_INTEGRITY=y
# CONFIG_DM_ZONED is not set
CONFIG_DM_AUDIT=y
CONFIG_DM_VDO=y
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_KUNIT_UAPI_TEST=y
CONFIG_FIREWIRE_KUNIT_DEVICE_ATTRIBUTE_TEST=y
CONFIG_FIREWIRE_KUNIT_PACKET_SERDES_TEST=y
# CONFIG_FIREWIRE_OHCI is not set
CONFIG_FIREWIRE_SBP2=y
CONFIG_FIREWIRE_NOSY=y
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
CONFIG_WINDFARM=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_DUMMY=y
CONFIG_EQUALIZER=y
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
CONFIG_MACVLAN=y
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=y
# CONFIG_NETCONSOLE_DYNAMIC is not set
CONFIG_NETCONSOLE_EXTENDED_LOG=y
# CONFIG_NETCONSOLE_PREPEND_RELEASE is not set
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_RIONET=y
CONFIG_RIONET_TX_SIZE=128
CONFIG_RIONET_RX_SIZE=128
CONFIG_TUN_VNET_CROSS_LE=y
CONFIG_VETH=y
CONFIG_VIRTIO_NET=y
CONFIG_NLMON=y
CONFIG_MHI_NET=y
CONFIG_SUNGEM_PHY=y
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set
CONFIG_CAIF_DRIVERS=y
# CONFIG_CAIF_TTY is not set
CONFIG_CAIF_VIRTIO=y
CONFIG_ETHERNET=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ACTIONS is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
CONFIG_ALTERA_TSE=y
# CONFIG_NET_VENDOR_AMAZON is not set
CONFIG_NET_VENDOR_AMD=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_PCNET32 is not set
# CONFIG_PCMCIA_NMCLAN is not set
# CONFIG_AMD_XGBE is not set
CONFIG_PDS_CORE=y
CONFIG_NET_XGENE=y
CONFIG_NET_XGENE_V2=y
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_AQTION=y
# CONFIG_NET_VENDOR_ARC is not set
# CONFIG_NET_VENDOR_ASIX is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
CONFIG_CX_ECAT=y
# CONFIG_NET_VENDOR_BROADCOM is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_NET_CALXEDA_XGMAC is not set
# CONFIG_NET_VENDOR_CAVIUM is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CIRRUS is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_GEMINI_ETHERNET is not set
# CONFIG_NET_VENDOR_DAVICOM is not set
CONFIG_DNET=y
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_ENGLEDER is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_FARADAY=y
CONFIG_NET_VENDOR_FREESCALE=y
CONFIG_FEC=y
# CONFIG_FSL_FMAN is not set
CONFIG_FSL_PQ_MDIO=y
CONFIG_FSL_XGMAC_MDIO=y
CONFIG_GIANFAR=y
# CONFIG_FSL_ENETC_IERB is not set
# CONFIG_FSL_ENETC_MDIO is not set
CONFIG_NET_VENDOR_FUJITSU=y
CONFIG_PCMCIA_FMVJ18X=y
# CONFIG_NET_VENDOR_FUNGIBLE is not set
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HISILICON=y
# CONFIG_HIX5HD2_GMAC is not set
CONFIG_HISI_FEMAC=y
CONFIG_HIP04_ETH=y
CONFIG_HI13X1_GMAC=y
CONFIG_HNS_MDIO=y
CONFIG_HNS=y
CONFIG_HNS_DSAF=y
CONFIG_HNS_ENET=y
CONFIG_HNS3=y
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_NET_VENDOR_IBM is not set
# CONFIG_NET_VENDOR_INTEL is not set
# CONFIG_JME is not set
CONFIG_KORINA=y
# CONFIG_NET_VENDOR_LITEX is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MEDIATEK is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_MLXBF_GIGE is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
# CONFIG_NET_VENDOR_MICROSEMI is not set
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NI is not set
CONFIG_NET_VENDOR_NATSEMI=y
CONFIG_NATSEMI=y
CONFIG_NS83820=y
CONFIG_NET_VENDOR_NETERION=y
CONFIG_S2IO=y
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
CONFIG_AX88796=y
CONFIG_AX88796_93CX6=y
# CONFIG_NE2K_PCI is not set
CONFIG_PCMCIA_PCNET=y
CONFIG_NET_VENDOR_NVIDIA=y
CONFIG_FORCEDETH=y
CONFIG_LPC_ENET=y
# CONFIG_NET_VENDOR_OKI is not set
CONFIG_ETHOC=y
# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
# CONFIG_NET_VENDOR_PENSANDO is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
# CONFIG_NET_VENDOR_REALTEK is not set
# CONFIG_NET_VENDOR_RENESAS is not set
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_NET_VENDOR_SAMSUNG is not set
CONFIG_NET_VENDOR_SEEQ=y
# CONFIG_NET_VENDOR_SILAN is not set
CONFIG_NET_VENDOR_SIS=y
CONFIG_SIS900=y
CONFIG_SIS190=y
# CONFIG_NET_VENDOR_SOLARFLARE is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_SOCIONEXT is not set
# CONFIG_NET_VENDOR_STMICRO is not set
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=y
CONFIG_SUNGEM=y
# CONFIG_CASSINI is not set
CONFIG_NIU=y
# CONFIG_NET_VENDOR_SUNPLUS is not set
# CONFIG_NET_VENDOR_SYNOPSYS is not set
CONFIG_NET_VENDOR_TEHUTI=y
CONFIG_TEHUTI=y
CONFIG_NET_VENDOR_TI=y
CONFIG_TI_DAVINCI_EMAC=y
CONFIG_TI_DAVINCI_MDIO=y
CONFIG_TI_CPSW_PHY_SEL=y
# CONFIG_TI_CPSW is not set
# CONFIG_TLAN is not set
# CONFIG_NET_VENDOR_TOSHIBA is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WANGXUN is not set
CONFIG_NET_VENDOR_WIZNET=y
CONFIG_WIZNET_W5100=y
CONFIG_WIZNET_W5300=y
# CONFIG_WIZNET_BUS_DIRECT is not set
# CONFIG_WIZNET_BUS_INDIRECT is not set
CONFIG_WIZNET_BUS_ANY=y
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
CONFIG_XILINX_LL_TEMAC=y
CONFIG_NET_VENDOR_XIRCOM=y
CONFIG_PCMCIA_XIRC2PS=y
# CONFIG_FDDI is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_LED_TRIGGER_PHY=y
CONFIG_PHYLIB_LEDS=y
CONFIG_FIXED_PHY=y
CONFIG_SFP=y

#
# MII PHY device drivers
#
CONFIG_AIR_EN8811H_PHY=y
# CONFIG_AMD_PHY is not set
CONFIG_MESON_GXL_PHY=y
# CONFIG_ADIN_PHY is not set
CONFIG_ADIN1100_PHY=y
CONFIG_AQUANTIA_PHY=y
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
CONFIG_BCM63XX_PHY=y
CONFIG_BCM7XXX_PHY=y
CONFIG_BCM84881_PHY=y
CONFIG_BCM87XX_PHY=y
# CONFIG_BCM_CYGNUS_PHY is not set
CONFIG_BCM_NET_PHYLIB=y
# CONFIG_CICADA_PHY is not set
CONFIG_CORTINA_PHY=y
CONFIG_DAVICOM_PHY=y
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=y
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=y
CONFIG_MARVELL_PHY=y
# CONFIG_MARVELL_10G_PHY is not set
CONFIG_MARVELL_88Q2XXX_PHY=y
# CONFIG_MARVELL_88X2222_PHY is not set
CONFIG_MAXLINEAR_GPHY=y
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MEDIATEK_GE_SOC_PHY=y
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_T1S_PHY is not set
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=y
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
CONFIG_NXP_CBTX_PHY=y
CONFIG_NXP_C45_TJA11XX_PHY=y
CONFIG_NXP_TJA11XX_PHY=y
# CONFIG_NCN26000_PHY is not set
CONFIG_QCOM_NET_PHYLIB=y
# CONFIG_AT803X_PHY is not set
CONFIG_QCA83XX_PHY=y
CONFIG_QCA808X_PHY=y
# CONFIG_QCA807X_PHY is not set
CONFIG_QSEMI_PHY=y
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
CONFIG_ROCKCHIP_PHY=y
CONFIG_SMSC_PHY=y
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
CONFIG_DP83TC811_PHY=y
# CONFIG_DP83848_PHY is not set
CONFIG_DP83867_PHY=y
CONFIG_DP83869_PHY=y
CONFIG_DP83TD510_PHY=y
CONFIG_DP83TG720_PHY=y
CONFIG_VITESSE_PHY=y
CONFIG_XILINX_GMII2RGMII=y
CONFIG_PSE_CONTROLLER=y
# CONFIG_PSE_REGULATOR is not set
# CONFIG_PSE_PD692X0 is not set
# CONFIG_PSE_TPS23881 is not set
# CONFIG_CAN_DEV is not set

#
# MCTP Device Drivers
#
# CONFIG_MCTP_SERIAL is not set
CONFIG_MCTP_TRANSPORT_I2C=y
# end of MCTP Device Drivers

CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_SUN4I=y
CONFIG_MDIO_XGENE=y
CONFIG_MDIO_ASPEED=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_BCM_IPROC=y
CONFIG_MDIO_BCM_UNIMAC=y
CONFIG_MDIO_CAVIUM=y
# CONFIG_MDIO_GPIO is not set
CONFIG_MDIO_HISI_FEMAC=y
CONFIG_MDIO_I2C=y
# CONFIG_MDIO_MVUSB is not set
CONFIG_MDIO_MSCC_MIIM=y
CONFIG_MDIO_MOXART=y
CONFIG_MDIO_OCTEON=y
# CONFIG_MDIO_IPQ8064 is not set
CONFIG_MDIO_REGMAP=y
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=y
# CONFIG_MDIO_BUS_MUX_BCM6368 is not set
# CONFIG_MDIO_BUS_MUX_BCM_IPROC is not set
# CONFIG_MDIO_BUS_MUX_GPIO is not set
# CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set
CONFIG_MDIO_BUS_MUX_MMIOREG=y

#
# PCS device drivers
#
CONFIG_PCS_LYNX=y
# CONFIG_PCS_RZN1_MIIC is not set
# end of PCS device drivers

# CONFIG_PLIP is not set
CONFIG_PPP=y
# CONFIG_PPP_BSDCOMP is not set
CONFIG_PPP_DEFLATE=y
# CONFIG_PPP_FILTER is not set
# CONFIG_PPP_MPPE is not set
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOATM=y
CONFIG_PPPOE=y
# CONFIG_PPPOE_HASH_BITS_1 is not set
# CONFIG_PPPOE_HASH_BITS_2 is not set
CONFIG_PPPOE_HASH_BITS_4=y
# CONFIG_PPPOE_HASH_BITS_8 is not set
CONFIG_PPPOE_HASH_BITS=4
# CONFIG_PPP_ASYNC is not set
# CONFIG_PPP_SYNC_TTY is not set
# CONFIG_SLIP is not set
CONFIG_SLHC=y
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
CONFIG_USB_KAWETH=y
# CONFIG_USB_PEGASUS is not set
CONFIG_USB_RTL8150=y
CONFIG_USB_RTL8152=y
CONFIG_USB_LAN78XX=y
# CONFIG_USB_USBNET is not set
CONFIG_USB_HSO=y
# CONFIG_USB_IPHETH is not set
# CONFIG_WLAN is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=y
# CONFIG_IEEE802154_FAKELB is not set
CONFIG_IEEE802154_ATUSB=y
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
CONFIG_WWAN=y
CONFIG_WWAN_DEBUGFS=y
CONFIG_WWAN_HWSIM=y
CONFIG_MHI_WWAN_CTRL=y
CONFIG_MHI_WWAN_MBIM=y
CONFIG_QCOM_BAM_DMUX=y
CONFIG_RPMSG_WWAN_CTRL=y
CONFIG_IOSM=y
CONFIG_MTK_T7XX=y
# end of Wireless WAN

CONFIG_NET_FAILOVER=y
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_MISDN=y
CONFIG_MISDN_DSP=y
# CONFIG_MISDN_L1OIP is not set

#
# mISDN hardware drivers
#
# CONFIG_MISDN_HFCPCI is not set
CONFIG_MISDN_HFCMULTI=y
CONFIG_MISDN_HFCUSB=y
# CONFIG_MISDN_AVMFRITZ is not set
# CONFIG_MISDN_SPEEDFAX is not set
# CONFIG_MISDN_INFINEON is not set
CONFIG_MISDN_W6692=y
CONFIG_MISDN_NETJET=y
CONFIG_MISDN_HDLC=y
CONFIG_MISDN_IPAC=y

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set
CONFIG_INPUT_KUNIT_TEST=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=y
# CONFIG_KEYBOARD_QT1070 is not set
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_CLPS711X=y
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
CONFIG_KEYBOARD_EP93XX=y
# CONFIG_KEYBOARD_GPIO is not set
CONFIG_KEYBOARD_GPIO_POLLED=y
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=y
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_LPC32XX=y
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_SNVS_PWRKEY=y
# CONFIG_KEYBOARD_IMX is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_NOMADIK is not set
# CONFIG_KEYBOARD_TEGRA is not set
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_PINEPHONE=y
# CONFIG_KEYBOARD_PXA27x is not set
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
# CONFIG_KEYBOARD_STOWAWAY is not set
CONFIG_KEYBOARD_ST_KEYSCAN=y
# CONFIG_KEYBOARD_SUNKBD is not set
CONFIG_KEYBOARD_SH_KEYSC=y
CONFIG_KEYBOARD_IQS62X=y
# CONFIG_KEYBOARD_OMAP4 is not set
CONFIG_KEYBOARD_SPEAR=y
CONFIG_KEYBOARD_TC3589X=y
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_CAP11XX is not set
CONFIG_KEYBOARD_MT6779=y
CONFIG_KEYBOARD_MTK_PMIC=y
CONFIG_KEYBOARD_CYPRESS_SF=y
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
CONFIG_JOYSTICK_A3D=y
# CONFIG_JOYSTICK_ADI is not set
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
CONFIG_JOYSTICK_INTERACT=y
# CONFIG_JOYSTICK_SIDEWINDER is not set
# CONFIG_JOYSTICK_TMDC is not set
# CONFIG_JOYSTICK_IFORCE is not set
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
# CONFIG_JOYSTICK_SPACEORB is not set
# CONFIG_JOYSTICK_SPACEBALL is not set
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_DB9=y
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=y
CONFIG_JOYSTICK_AS5011=y
# CONFIG_JOYSTICK_JOYDUMP is not set
# CONFIG_JOYSTICK_XPAD is not set
# CONFIG_JOYSTICK_WALKERA0701 is not set
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=y
# CONFIG_JOYSTICK_SEESAW is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
CONFIG_TABLET_USB_AIPTEK=y
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=y
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_XILINX_XPS_PS2=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_EMU10K1=y
CONFIG_GAMEPORT_FM801=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LEGACY_TIOCSTI=y
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=y
CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
CONFIG_SERIAL_MESON=y
# CONFIG_SERIAL_MESON_CONSOLE is not set
CONFIG_SERIAL_CLPS711X=y
CONFIG_SERIAL_CLPS711X_CONSOLE=y
CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
# CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
CONFIG_SERIAL_TEGRA=y
# CONFIG_SERIAL_TEGRA_TCU is not set
CONFIG_SERIAL_IMX=y
CONFIG_SERIAL_IMX_CONSOLE=y
# CONFIG_SERIAL_IMX_EARLYCON is not set
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
# CONFIG_SERIAL_HS_LPC32XX is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_ICOM=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_MSM=y
# CONFIG_SERIAL_MSM_CONSOLE is not set
CONFIG_SERIAL_QCOM_GENI=y
# CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
CONFIG_SERIAL_SIFIVE=y
# CONFIG_SERIAL_SIFIVE_CONSOLE is not set
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_PCH_UART=y
CONFIG_SERIAL_PCH_UART_CONSOLE=y
# CONFIG_SERIAL_MXS_AUART is not set
CONFIG_SERIAL_XILINX_PS_UART=y
CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
# CONFIG_SERIAL_MPS2_UART_CONSOLE is not set
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
CONFIG_SERIAL_ST_ASC=y
CONFIG_SERIAL_ST_ASC_CONSOLE=y
# CONFIG_SERIAL_STM32 is not set
CONFIG_SERIAL_OWL=y
# CONFIG_SERIAL_OWL_CONSOLE is not set
CONFIG_SERIAL_RDA=y
CONFIG_SERIAL_RDA_CONSOLE=y
# CONFIG_SERIAL_MILBEAUT_USIO is not set
CONFIG_SERIAL_LITEUART=y
CONFIG_SERIAL_LITEUART_MAX_PORTS=1
CONFIG_SERIAL_LITEUART_CONSOLE=y
CONFIG_SERIAL_SUNPLUS=y
# CONFIG_SERIAL_SUNPLUS_CONSOLE is not set
# CONFIG_SERIAL_NUVOTON_MA35D1 is not set
# CONFIG_SERIAL_ESP32 is not set
CONFIG_SERIAL_ESP32_ACM=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_PPC_EPAPR_HV_BYTECHAN=y
# CONFIG_PPC_EARLY_DEBUG_EHV_BC is not set
CONFIG_IPWIRELESS=y
CONFIG_N_GSM=y
CONFIG_NOZOMI=y
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_HVC_RTAS is not set
CONFIG_HVC_UDBG=y
CONFIG_RPMSG_TTY=y
CONFIG_SERIAL_DEV_BUS=y
CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
# CONFIG_IPMI_KCS_BMC_SERIO is not set
CONFIG_ASPEED_BT_IPMI_BMC=y
# CONFIG_SSIF_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_INTEL=y
CONFIG_HW_RANDOM_AMD=y
CONFIG_HW_RANDOM_ATMEL=y
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_BCM2835=y
# CONFIG_HW_RANDOM_IPROC_RNG200 is not set
# CONFIG_HW_RANDOM_GEODE is not set
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
CONFIG_HW_RANDOM_PASEMI=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_MXC_RNGA=y
CONFIG_HW_RANDOM_IMX_RNGC=y
# CONFIG_HW_RANDOM_INGENIC_RNG is not set
CONFIG_HW_RANDOM_INGENIC_TRNG=y
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_HISI=y
CONFIG_HW_RANDOM_HISTB=y
CONFIG_HW_RANDOM_ST=y
CONFIG_HW_RANDOM_XGENE=y
CONFIG_HW_RANDOM_STM32=y
CONFIG_HW_RANDOM_PIC32=y
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
CONFIG_HW_RANDOM_KEYSTONE=y
CONFIG_HW_RANDOM_CCTRNG=y
CONFIG_HW_RANDOM_XIPHERA=y
# CONFIG_HW_RANDOM_CN10K is not set
CONFIG_HW_RANDOM_JH7110=y
# CONFIG_APPLICOM is not set
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HANGCHECK_TIMER=y
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=y
# CONFIG_XILLYBUS is not set
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_DEMUX_PINCTRL=y
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_ATR=y
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
CONFIG_I2C_HIX5HD2=y
# CONFIG_I2C_I801 is not set
CONFIG_I2C_ISCH=y
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=y
CONFIG_I2C_SIS96X=y
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=y
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=y
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_PCI=y
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EG20T is not set
# CONFIG_I2C_EXYNOS5 is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_GXP=y
CONFIG_I2C_HIGHLANDER=y
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=y
# CONFIG_I2C_IMX_LPI2C is not set
CONFIG_I2C_IOP3XX=y
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=y
# CONFIG_I2C_LPC2K is not set
CONFIG_I2C_LS2X=y
CONFIG_I2C_MICROCHIP_CORE=y
CONFIG_I2C_MPC=y
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=y
# CONFIG_I2C_MV64XXX is not set
CONFIG_I2C_MXS=y
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
CONFIG_I2C_PXA=y
# CONFIG_I2C_PXA_SLAVE is not set
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_QCOM_GENI=y
CONFIG_I2C_QUP=y
CONFIG_I2C_RIIC=y
CONFIG_I2C_RZV2M=y
CONFIG_I2C_S3C2410=y
# CONFIG_I2C_SH_MOBILE is not set
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_ST=y
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
CONFIG_I2C_UNIPHIER_F=y
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_WMT=y
CONFIG_I2C_THUNDERX=y
CONFIG_I2C_XILINX=y
CONFIG_I2C_XLP9XX=y
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=y
CONFIG_I2C_PCI1XXXX=y
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
CONFIG_I2C_TAOS_EVM=y
# CONFIG_I2C_TINY_USB is not set
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
CONFIG_I2C_CROS_EC_TUNNEL=y
CONFIG_I2C_FSI=y
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
CONFIG_SPMI_MSM_PMIC_ARB=y
CONFIG_SPMI_MTK_PMIF=y
# CONFIG_HSI is not set
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
CONFIG_NTP_PPS=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_PARPORT=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
CONFIG_PTP_1588_CLOCK_DTE=y
# CONFIG_PTP_1588_CLOCK_QORIQ is not set

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_PCH=y
CONFIG_PTP_1588_CLOCK_IDT82P33=y
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_FC3W is not set
CONFIG_PTP_1588_CLOCK_MOCK=y
# CONFIG_PTP_DFL_TOD is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
CONFIG_PINCTRL_AMD=y
# CONFIG_PINCTRL_AS3722 is not set
# CONFIG_PINCTRL_AT91PIO4 is not set
CONFIG_PINCTRL_AXP209=y
# CONFIG_PINCTRL_AW9523 is not set
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA850_PUPD=y
# CONFIG_PINCTRL_EQUILIBRIUM is not set
CONFIG_PINCTRL_INGENIC=y
CONFIG_PINCTRL_LOONGSON2=y
CONFIG_PINCTRL_LPC18XX=y
CONFIG_PINCTRL_MAX77620=y
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_MICROCHIP_SGPIO=y
# CONFIG_PINCTRL_OCELOT is not set
CONFIG_PINCTRL_PISTACHIO=y
CONFIG_PINCTRL_RK805=y
CONFIG_PINCTRL_ROCKCHIP=y
# CONFIG_PINCTRL_SCMI is not set
CONFIG_PINCTRL_SINGLE=y
CONFIG_PINCTRL_STMFX=y
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_TPS6594 is not set
CONFIG_PINCTRL_MLXBF3=y
# CONFIG_PINCTRL_OWL is not set
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
CONFIG_PINCTRL_ASPEED_G6=y
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
CONFIG_PINCTRL_BCM4908=y
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
# CONFIG_PINCTRL_BCM6362 is not set
# CONFIG_PINCTRL_BCM6368 is not set
CONFIG_PINCTRL_BCM63268=y
CONFIG_PINCTRL_IPROC_GPIO=y
CONFIG_PINCTRL_CYGNUS_MUX=y
# CONFIG_PINCTRL_NS is not set
CONFIG_PINCTRL_NSP_GPIO=y
# CONFIG_PINCTRL_NS2_MUX is not set
CONFIG_PINCTRL_NSP_MUX=y
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_CS42L43 is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_IMX=y
CONFIG_PINCTRL_IMX8MM=y
CONFIG_PINCTRL_IMX8MN=y
CONFIG_PINCTRL_IMX8MP=y
CONFIG_PINCTRL_IMX8MQ=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
CONFIG_PINCTRL_CHERRYVIEW=y
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=y
CONFIG_PINCTRL_CEDARFORK=y
CONFIG_PINCTRL_DENVERTON=y
# CONFIG_PINCTRL_ELKHARTLAKE is not set
CONFIG_PINCTRL_EMMITSBURG=y
# CONFIG_PINCTRL_GEMINILAKE is not set
CONFIG_PINCTRL_ICELAKE=y
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=y
CONFIG_PINCTRL_METEORLAKE=y
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
CONFIG_PINCTRL_TANGIER=y
CONFIG_PINCTRL_MERRIFIELD=y
# CONFIG_PINCTRL_MOOREFIELD is not set
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
# CONFIG_PINCTRL_MT7629 is not set
CONFIG_PINCTRL_MT8135=y
# CONFIG_PINCTRL_MT8127 is not set
CONFIG_PINCTRL_MT2712=y
CONFIG_PINCTRL_MT6765=y
CONFIG_PINCTRL_MT6779=y
CONFIG_PINCTRL_MT6795=y
CONFIG_PINCTRL_MT6797=y
CONFIG_PINCTRL_MT7622=y
CONFIG_PINCTRL_MT7981=y
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT8167 is not set
CONFIG_PINCTRL_MT8173=y
CONFIG_PINCTRL_MT8183=y
# CONFIG_PINCTRL_MT8186 is not set
CONFIG_PINCTRL_MT8188=y
CONFIG_PINCTRL_MT8192=y
# CONFIG_PINCTRL_MT8195 is not set
# CONFIG_PINCTRL_MT8365 is not set
CONFIG_PINCTRL_MT8516=y
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
CONFIG_PINCTRL_NOMADIK=y
CONFIG_PINCTRL_WPCM450=y
# CONFIG_PINCTRL_NPCM7XX is not set
CONFIG_PINCTRL_NPCM8XX=y
CONFIG_PINCTRL_PXA=y
# CONFIG_PINCTRL_PXA25X is not set
CONFIG_PINCTRL_PXA27X=y
CONFIG_PINCTRL_MSM=y
CONFIG_PINCTRL_APQ8064=y
CONFIG_PINCTRL_APQ8084=y
# CONFIG_PINCTRL_IPQ4019 is not set
CONFIG_PINCTRL_IPQ5018=y
CONFIG_PINCTRL_IPQ8064=y
CONFIG_PINCTRL_IPQ5332=y
CONFIG_PINCTRL_IPQ8074=y
CONFIG_PINCTRL_IPQ6018=y
CONFIG_PINCTRL_IPQ9574=y
# CONFIG_PINCTRL_MSM8226 is not set
# CONFIG_PINCTRL_MSM8660 is not set
CONFIG_PINCTRL_MSM8960=y
CONFIG_PINCTRL_MDM9607=y
CONFIG_PINCTRL_MDM9615=y
# CONFIG_PINCTRL_MSM8X74 is not set
CONFIG_PINCTRL_MSM8909=y
CONFIG_PINCTRL_MSM8916=y
CONFIG_PINCTRL_MSM8953=y
# CONFIG_PINCTRL_MSM8976 is not set
# CONFIG_PINCTRL_MSM8994 is not set
CONFIG_PINCTRL_MSM8996=y
CONFIG_PINCTRL_MSM8998=y
CONFIG_PINCTRL_QCM2290=y
# CONFIG_PINCTRL_QCS404 is not set
CONFIG_PINCTRL_QDU1000=y
CONFIG_PINCTRL_SA8775P=y
CONFIG_PINCTRL_SC7180=y
CONFIG_PINCTRL_SC7280=y
CONFIG_PINCTRL_SC8180X=y
CONFIG_PINCTRL_SC8280XP=y
CONFIG_PINCTRL_SDM660=y
# CONFIG_PINCTRL_SDM670 is not set
# CONFIG_PINCTRL_SDM845 is not set
# CONFIG_PINCTRL_SDX55 is not set
CONFIG_PINCTRL_SDX65=y
CONFIG_PINCTRL_SDX75=y
CONFIG_PINCTRL_SM4450=y
# CONFIG_PINCTRL_SM6115 is not set
# CONFIG_PINCTRL_SM6125 is not set
CONFIG_PINCTRL_SM6350=y
CONFIG_PINCTRL_SM6375=y
CONFIG_PINCTRL_SM7150=y
CONFIG_PINCTRL_SM8150=y
# CONFIG_PINCTRL_SM8250 is not set
CONFIG_PINCTRL_SM8350=y
# CONFIG_PINCTRL_SM8450 is not set
CONFIG_PINCTRL_SM8550=y
CONFIG_PINCTRL_SM8650=y
CONFIG_PINCTRL_X1E80100=y
CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
CONFIG_PINCTRL_LPASS_LPI=y
CONFIG_PINCTRL_SC7280_LPASS_LPI=y
# CONFIG_PINCTRL_SM6115_LPASS_LPI is not set
# CONFIG_PINCTRL_SM8250_LPASS_LPI is not set
# CONFIG_PINCTRL_SM8350_LPASS_LPI is not set
CONFIG_PINCTRL_SM8450_LPASS_LPI=y
# CONFIG_PINCTRL_SC8280XP_LPASS_LPI is not set
CONFIG_PINCTRL_SM8550_LPASS_LPI=y
# CONFIG_PINCTRL_SM8650_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
CONFIG_PINCTRL_PFC_EMEV2=y
CONFIG_PINCTRL_PFC_R8A77995=y
CONFIG_PINCTRL_PFC_R8A7794=y
CONFIG_PINCTRL_PFC_R8A77990=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
CONFIG_PINCTRL_PFC_R8A7790=y
CONFIG_PINCTRL_PFC_R8A77951=y
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7791=y
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77960=y
# CONFIG_PINCTRL_PFC_R8A77961 is not set
CONFIG_PINCTRL_PFC_R8A779F0=y
CONFIG_PINCTRL_PFC_R8A7792=y
CONFIG_PINCTRL_PFC_R8A77980=y
# CONFIG_PINCTRL_PFC_R8A77970 is not set
CONFIG_PINCTRL_PFC_R8A779A0=y
CONFIG_PINCTRL_PFC_R8A779G0=y
# CONFIG_PINCTRL_PFC_R8A779H0 is not set
# CONFIG_PINCTRL_PFC_R8A7740 is not set
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_RZA1=y
# CONFIG_PINCTRL_RZA2 is not set
# CONFIG_PINCTRL_RZG2L is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A774A1=y
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
CONFIG_PINCTRL_RZN1=y
CONFIG_PINCTRL_RZV2M=y
CONFIG_PINCTRL_PFC_SH7203=y
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
CONFIG_PINCTRL_PFC_SH7757=y
CONFIG_PINCTRL_PFC_SH7785=y
CONFIG_PINCTRL_PFC_SH7786=y
# CONFIG_PINCTRL_PFC_SH73A0 is not set
CONFIG_PINCTRL_PFC_SH7723=y
CONFIG_PINCTRL_PFC_SH7724=y
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
# CONFIG_PINCTRL_EXYNOS is not set
CONFIG_PINCTRL_S3C64XX=y
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STARFIVE_JH7100=y
# CONFIG_PINCTRL_STARFIVE_JH7110_SYS is not set
# CONFIG_PINCTRL_STARFIVE_JH7110_AON is not set
CONFIG_PINCTRL_STM32=y
CONFIG_PINCTRL_STM32F429=y
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
CONFIG_PINCTRL_STM32H743=y
CONFIG_PINCTRL_STM32MP135=y
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_STM32MP257 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
CONFIG_PINCTRL_UNIPHIER_PRO4=y
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
CONFIG_PINCTRL_UNIPHIER_PXS2=y
# CONFIG_PINCTRL_UNIPHIER_LD6B is not set
CONFIG_PINCTRL_UNIPHIER_LD11=y
CONFIG_PINCTRL_UNIPHIER_LD20=y
CONFIG_PINCTRL_UNIPHIER_PXS3=y
CONFIG_PINCTRL_UNIPHIER_NX1=y
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_OF_GPIO_MM_GPIOCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
CONFIG_GPIO_ASPEED=y
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
CONFIG_GPIO_BCM_KONA=y
CONFIG_GPIO_BCM_XGS_IPROC=y
# CONFIG_GPIO_BRCMSTB is not set
# CONFIG_GPIO_CADENCE is not set
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
CONFIG_GPIO_GE_FPGA=y
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRANITERAPIDS=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_HLWD=y
# CONFIG_GPIO_LOGICVC is not set
CONFIG_GPIO_LOONGSON_64BIT=y
CONFIG_GPIO_LPC18XX=y
CONFIG_GPIO_LPC32XX=y
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_MT7621=y
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
CONFIG_GPIO_NOMADIK=y
CONFIG_GPIO_NPCM_SGPIO=y
# CONFIG_GPIO_PXA is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
CONFIG_GPIO_ROCKCHIP=y
# CONFIG_GPIO_SAMA5D2_PIOBU is not set
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
CONFIG_GPIO_SPRD=y
CONFIG_GPIO_STP_XWAY=y
# CONFIG_GPIO_SYSCON is not set
CONFIG_GPIO_TANGIER=y
CONFIG_GPIO_TEGRA=y
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
CONFIG_GPIO_VF610=y
# CONFIG_GPIO_VISCONTI is not set
# CONFIG_GPIO_WCD934X is not set
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XILINX is not set
CONFIG_GPIO_XLP=y
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_FXL6408=y
# CONFIG_GPIO_DS4520 is not set
CONFIG_GPIO_GW_PLD=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_BD71815 is not set
CONFIG_GPIO_BD71828=y
# CONFIG_GPIO_BD9571MWV is not set
# CONFIG_GPIO_CROS_EC is not set
CONFIG_GPIO_ELKHARTLAKE=y
# CONFIG_GPIO_JANZ_TTL is not set
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=y
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_MAX77620=y
CONFIG_GPIO_MAX77650=y
CONFIG_GPIO_PMIC_EIC_SPRD=y
CONFIG_GPIO_RC5T583=y
# CONFIG_GPIO_SL28CPLD is not set
# CONFIG_GPIO_TC3589X is not set
# CONFIG_GPIO_TIMBERDALE is not set
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65218 is not set
CONFIG_GPIO_TPS65219=y
CONFIG_GPIO_TPS6586X=y
CONFIG_GPIO_TPS65910=y
CONFIG_GPIO_TPS65912=y
# CONFIG_GPIO_TQMX86 is not set
# CONFIG_GPIO_TWL6040 is not set
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_AMD8111=y
CONFIG_GPIO_BT8XX=y
# CONFIG_GPIO_MLXBF is not set
# CONFIG_GPIO_MLXBF2 is not set
CONFIG_GPIO_MLXBF3=y
CONFIG_GPIO_ML_IOH=y
CONFIG_GPIO_PCH=y
CONFIG_GPIO_PCI_IDIO_16=y
CONFIG_GPIO_PCIE_IDIO_24=y
CONFIG_GPIO_RDC321X=y
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_AMD_AXI=y
CONFIG_W1_MASTER_MATROX=y
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_HDQ_MASTER_OMAP=y
CONFIG_W1_MASTER_SGI=y
CONFIG_W1_MASTER_UART=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_IP5XXX_POWER=y
CONFIG_MAX8925_POWER=y
CONFIG_TEST_POWER=y
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_DA9150=y
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77650 is not set
CONFIG_CHARGER_MAX77693=y
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MAX8997=y
CONFIG_CHARGER_MAX8998=y
CONFIG_CHARGER_QCOM_SMBB=y
CONFIG_BATTERY_PM8916_BMS_VM=y
# CONFIG_CHARGER_PM8916_LBC is not set
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_RK817=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65217=y
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_RT9467=y
CONFIG_CHARGER_RT9471=y
# CONFIG_CHARGER_CROS_USBPD is not set
CONFIG_CHARGER_CROS_PCHG=y
# CONFIG_CHARGER_SC2731 is not set
CONFIG_CHARGER_UCS1002=y
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_ACER_A500=y
CONFIG_BATTERY_UG3105=y
CONFIG_FUEL_GAUGE_MM8013=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
CONFIG_SENSORS_AD7414=y
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=y
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_AHT10=y
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_ARM_SCMI=y
CONFIG_SENSORS_ARM_SCPI=y
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ASPEED_G6=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_BT1_PVT=y
CONFIG_SENSORS_BT1_PVT_ALARMS=y
CONFIG_SENSORS_CHIPCAP2=y
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_I5K_AMB=y
CONFIG_SENSORS_SPARX5=y
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_GSC is not set
# CONFIG_SENSORS_MC13783_ADC is not set
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
# CONFIG_SENSORS_GXP_FAN_CTRL is not set
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_HS3001 is not set
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWERZ=y
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LAN966X=y
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2990=y
CONFIG_SENSORS_LTC2991=y
# CONFIG_SENSORS_LTC2992 is not set
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=y
CONFIG_SENSORS_LTC4222=y
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=y
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_LTC4282=y
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
CONFIG_MAX31827=y
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_TPS23861=y
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_LM63=y
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775_I2C=y
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_NSA320 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=y
CONFIG_SENSORS_PECI_CPUTEMP=y
CONFIG_SENSORS_PECI_DIMMTEMP=y
CONFIG_SENSORS_PECI=y
CONFIG_PMBUS=y
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ACBEL_FSG032 is not set
CONFIG_SENSORS_ADM1266=y
CONFIG_SENSORS_ADM1275=y
# CONFIG_SENSORS_ADP1050 is not set
CONFIG_SENSORS_BEL_PFE=y
CONFIG_SENSORS_BPA_RS600=y
CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
CONFIG_SENSORS_FSP_3Y=y
CONFIG_SENSORS_IBM_CFFPS=y
CONFIG_SENSORS_DPS920AB=y
CONFIG_SENSORS_INSPUR_IPSPS=y
CONFIG_SENSORS_IR35221=y
CONFIG_SENSORS_IR36021=y
CONFIG_SENSORS_IR38064=y
# CONFIG_SENSORS_IR38064_REGULATOR is not set
CONFIG_SENSORS_IRPS5401=y
CONFIG_SENSORS_ISL68137=y
# CONFIG_SENSORS_LM25066 is not set
# CONFIG_SENSORS_LT7182S is not set
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_LTC4286=y
CONFIG_SENSORS_MAX15301=y
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX16601=y
CONFIG_SENSORS_MAX20730=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX31785=y
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
CONFIG_SENSORS_MP2856=y
CONFIG_SENSORS_MP2888=y
# CONFIG_SENSORS_MP2975 is not set
CONFIG_SENSORS_MP5023=y
CONFIG_SENSORS_MP5990=y
CONFIG_SENSORS_MPQ7932_REGULATOR=y
CONFIG_SENSORS_MPQ7932=y
# CONFIG_SENSORS_MPQ8785 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
CONFIG_SENSORS_PM6764TR=y
CONFIG_SENSORS_PXE1610=y
CONFIG_SENSORS_Q54SJ108A2=y
# CONFIG_SENSORS_STPDDC60 is not set
CONFIG_SENSORS_TDA38640=y
# CONFIG_SENSORS_TDA38640_REGULATOR is not set
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=y
CONFIG_SENSORS_TPS546D24=y
CONFIG_SENSORS_UCD9000=y
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_XDP710=y
# CONFIG_SENSORS_XDPE152 is not set
CONFIG_SENSORS_XDPE122=y
CONFIG_SENSORS_XDPE122_REGULATOR=y
CONFIG_SENSORS_ZL6100=y
# CONFIG_SENSORS_PT5161L is not set
CONFIG_SENSORS_PWM_FAN=y
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
CONFIG_SENSORS_SL28CPLD=y
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SBRMI=y
CONFIG_SENSORS_SHT15=y
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHT4x=y
CONFIG_SENSORS_SHTC1=y
CONFIG_SENSORS_SIS5595=y
CONFIG_SENSORS_SY7636A=y
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC2305=y
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SFCTEMP=y
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VIA686A=y
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=y
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=y
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_INTEL_M10_BMC_HWMON is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_DEBUGFS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_OF=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CPU_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=y
# CONFIG_HISI_THERMAL is not set
CONFIG_IMX_THERMAL=y
CONFIG_IMX8MM_THERMAL=y
# CONFIG_K3_THERMAL is not set
# CONFIG_MAX77620_THERMAL is not set
# CONFIG_QORIQ_THERMAL is not set
# CONFIG_SPEAR_THERMAL is not set
CONFIG_SUN8I_THERMAL=y
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_RCAR_THERMAL=y
# CONFIG_RCAR_GEN3_THERMAL is not set
CONFIG_RZG2L_THERMAL=y
CONFIG_KIRKWOOD_THERMAL=y
CONFIG_DOVE_THERMAL=y
CONFIG_ARMADA_THERMAL=y
CONFIG_DA9062_THERMAL=y

#
# Mediatek thermal drivers
#
CONFIG_MTK_THERMAL=y
CONFIG_MTK_SOC_THERMAL=y
# CONFIG_MTK_LVTS_THERMAL is not set
# end of Mediatek thermal drivers

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BCM2711_THERMAL=y
CONFIG_BCM2835_THERMAL=y
# CONFIG_BRCMSTB_THERMAL is not set
CONFIG_BCM_NS_THERMAL=y
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
# CONFIG_OMAP3_THERMAL is not set
CONFIG_OMAP4_THERMAL=y
CONFIG_OMAP5_THERMAL=y
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# CONFIG_EXYNOS_THERMAL is not set
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=y
# CONFIG_TEGRA_BPMP_THERMAL is not set
CONFIG_TEGRA30_TSENSOR=y
# end of NVIDIA Tegra thermal drivers

#
# Qualcomm thermal drivers
#
# end of Qualcomm thermal drivers

CONFIG_UNIPHIER_THERMAL=y
CONFIG_SPRD_THERMAL=y
CONFIG_KHADAS_MCU_FAN_THERMAL=y
CONFIG_LOONGSON2_THERMAL=y
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_ATMEL_SMC=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC_DEV=y
CONFIG_MFD_CS42L43=y
CONFIG_MFD_CS42L43_I2C=y
CONFIG_MFD_CS42L43_SDW=y
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_MAX5970=y
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
# CONFIG_MFD_CS47L92 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
# CONFIG_MFD_DLN2 is not set
CONFIG_MFD_ENE_KB3930=y
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
CONFIG_MFD_HI6421_SPMI=y
CONFIG_MFD_HI655X_PMIC=y
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
CONFIG_MFD_IQS62X=y
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77541 is not set
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77714=y
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_PM8XXX is not set
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_SY7636A=y
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RT5120=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_RK8XX=y
CONFIG_MFD_RK8XX_I2C=y
# CONFIG_MFD_RN5T618 is not set
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SL28CPLD=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=y
# CONFIG_RZ_MTU3 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS65219=y
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS6594=y
CONFIG_MFD_TPS6594_I2C=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=y
CONFIG_MFD_TIMBERDALE=y
CONFIG_MFD_TC3589X=y
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD71828=y
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_MFD_KHADAS_MCU=y
CONFIG_MFD_ACER_A500_EC=y
CONFIG_MFD_QCOM_PM8008=y
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_INTEL_M10_BMC_CORE=y
CONFIG_MFD_INTEL_M10_BMC_PMCI=y
CONFIG_MFD_RSMU_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_NETLINK_EVENTS is not set
CONFIG_REGULATOR_88PG86X=y
# CONFIG_REGULATOR_88PM800 is not set
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_ARIZONA_LDO1=y
CONFIG_REGULATOR_ARIZONA_MICSUPP=y
CONFIG_REGULATOR_ARM_SCMI=y
# CONFIG_REGULATOR_AS3722 is not set
CONFIG_REGULATOR_AW37503=y
# CONFIG_REGULATOR_AXP20X is not set
CONFIG_REGULATOR_BD71815=y
CONFIG_REGULATOR_BD71828=y
CONFIG_REGULATOR_BD718XX=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_CROS_EC=y
CONFIG_REGULATOR_DA9121=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_FAN53880=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_HI6421=y
CONFIG_REGULATOR_HI6421V530=y
CONFIG_REGULATOR_HI655X=y
# CONFIG_REGULATOR_HI6421V600 is not set
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX5970=y
CONFIG_REGULATOR_MAX77503=y
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX77857=y
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8973=y
CONFIG_REGULATOR_MAX8997=y
CONFIG_REGULATOR_MAX8998=y
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX20411=y
CONFIG_REGULATOR_MAX77686=y
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MCP16502=y
CONFIG_REGULATOR_MP5416=y
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MPQ7920=y
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6331=y
CONFIG_REGULATOR_MT6332=y
CONFIG_REGULATOR_MT6357=y
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
# CONFIG_REGULATOR_MT6370 is not set
# CONFIG_REGULATOR_MT6380 is not set
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PBIAS=y
# CONFIG_REGULATOR_PCA9450 is not set
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
# CONFIG_REGULATOR_PWM is not set
CONFIG_REGULATOR_QCOM_REFGEN=y
CONFIG_REGULATOR_QCOM_RPMH=y
CONFIG_REGULATOR_QCOM_SMD_RPM=y
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
CONFIG_REGULATOR_RC5T583=y
# CONFIG_REGULATOR_RK808 is not set
CONFIG_REGULATOR_ROHM=y
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT4803 is not set
# CONFIG_REGULATOR_RT5120 is not set
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5739 is not set
CONFIG_REGULATOR_RT5759=y
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6190 is not set
# CONFIG_REGULATOR_RT6245 is not set
CONFIG_REGULATOR_RTQ2134=y
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_RTQ2208 is not set
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
CONFIG_REGULATOR_S5M8767=y
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SKY81452=y
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STPMIC1=y
CONFIG_REGULATOR_TI_ABB=y
CONFIG_REGULATOR_STW481X_VMMC=y
# CONFIG_REGULATOR_SUN20I is not set
CONFIG_REGULATOR_SY7636A=y
CONFIG_REGULATOR_SY8106A=y
# CONFIG_REGULATOR_SY8824X is not set
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS6286X=y
CONFIG_REGULATOR_TPS6287X=y
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65218=y
CONFIG_REGULATOR_TPS65219=y
CONFIG_REGULATOR_TPS6594=y
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65910=y
# CONFIG_REGULATOR_TPS65912 is not set
CONFIG_REGULATOR_TPS68470=y
# CONFIG_REGULATOR_UNIPHIER is not set
CONFIG_REGULATOR_VCTRL=y
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
CONFIG_LIRC=y
CONFIG_RC_MAP=y
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
CONFIG_MEDIA_CONTROLLER=y
# CONFIG_DVB_CORE is not set
# end of Media core support

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_DRIVERS is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
# CONFIG_MEDIA_TUNER_FC0011 is not set
CONFIG_MEDIA_TUNER_FC0012=y
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_IT913X=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_MC44S803=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
# CONFIG_MEDIA_TUNER_MT2063 is not set
# CONFIG_MEDIA_TUNER_MT20XX is not set
CONFIG_MEDIA_TUNER_MT2131=y
# CONFIG_MEDIA_TUNER_MT2266 is not set
CONFIG_MEDIA_TUNER_MXL301RF=y
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_QM1D1B0004=y
CONFIG_MEDIA_TUNER_QM1D1C0042=y
# CONFIG_MEDIA_TUNER_QT1010 is not set
CONFIG_MEDIA_TUNER_R820T=y
# CONFIG_MEDIA_TUNER_SI2157 is not set
CONFIG_MEDIA_TUNER_SIMPLE=y
# CONFIG_MEDIA_TUNER_TDA18212 is not set
CONFIG_MEDIA_TUNER_TDA18218=y
# CONFIG_MEDIA_TUNER_TDA18250 is not set
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
# CONFIG_MEDIA_TUNER_XC2028 is not set
CONFIG_MEDIA_TUNER_XC4000=y
# CONFIG_MEDIA_TUNER_XC5000 is not set
# end of Customize TV tuners

#
# Customise DVB Frontends
#
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO=y
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_LCD2S=y
# CONFIG_PARPORT_PANEL is not set
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_KS0108=y
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_LINEDISP=y
CONFIG_IMG_ASCII_LCD=y
# CONFIG_HT16K33 is not set
CONFIG_MAX6959=y
CONFIG_SEG_LED_GPIO=y
# CONFIG_PANEL is not set
CONFIG_AGP=y
# CONFIG_TEGRA_HOST1X is not set
CONFIG_IMX_IPUV3_CORE=y
# CONFIG_DRM is not set

#
# Frame buffer Devices
#
CONFIG_FB=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_MACMODES=y
CONFIG_FB_CIRRUS=y
# CONFIG_FB_PM2 is not set
CONFIG_FB_CLPS711X=y
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
CONFIG_FB_OF=y
CONFIG_FB_CONTROL=y
# CONFIG_FB_ASILIANT is not set
CONFIG_FB_IMSTT=y
# CONFIG_FB_UVESA is not set
# CONFIG_FB_GBE is not set
# CONFIG_FB_PVR2 is not set
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_NVIDIA=y
# CONFIG_FB_NVIDIA_I2C is not set
CONFIG_FB_NVIDIA_DEBUG=y
CONFIG_FB_NVIDIA_BACKLIGHT=y
CONFIG_FB_RIVA=y
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=y
CONFIG_FB_MATROX=y
# CONFIG_FB_MATROX_MILLENIUM is not set
# CONFIG_FB_MATROX_MYSTIQUE is not set
CONFIG_FB_MATROX_G=y
CONFIG_FB_MATROX_I2C=y
# CONFIG_FB_MATROX_MAVEN is not set
CONFIG_FB_RADEON=y
CONFIG_FB_RADEON_I2C=y
# CONFIG_FB_RADEON_BACKLIGHT is not set
# CONFIG_FB_RADEON_DEBUG is not set
# CONFIG_FB_ATY128 is not set
CONFIG_FB_ATY=y
# CONFIG_FB_ATY_CT is not set
# CONFIG_FB_ATY_GX is not set
CONFIG_FB_ATY_BACKLIGHT=y
CONFIG_FB_S3=y
CONFIG_FB_S3_DDC=y
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
CONFIG_FB_VIA=y
CONFIG_FB_VIA_DIRECT_PROCFS=y
CONFIG_FB_VIA_X_COMPATIBILITY=y
# CONFIG_FB_NEOMAGIC is not set
CONFIG_FB_KYRO=y
# CONFIG_FB_3DFX is not set
CONFIG_FB_VT8623=y
CONFIG_FB_TRIDENT=y
CONFIG_FB_ARK=y
# CONFIG_FB_PM3 is not set
CONFIG_FB_CARMINE=y
CONFIG_FB_CARMINE_DRAM_EVAL=y
# CONFIG_CARMINE_DRAM_CUSTOM is not set
# CONFIG_FB_WM8505 is not set
CONFIG_FB_SM501=y
CONFIG_FB_SMSCUFX=y
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_PS3=y
CONFIG_FB_PS3_DEFAULT_SIZE_M=9
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
CONFIG_FB_MB862XX=y
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_LIME is not set
CONFIG_FB_MB862XX_I2C=y
# CONFIG_FB_BROADSHEET is not set
CONFIG_FB_SIMPLE=y
CONFIG_FB_SSD1307=y
# CONFIG_FB_SM712 is not set
# CONFIG_MMP_DISP is not set
CONFIG_FB_CORE=y
CONFIG_FB_NOTIFY=y
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_FB_DEVICE is not set
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYSMEM_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_IOMEM_FOPS=y
CONFIG_FB_IOMEM_HELPERS=y
CONFIG_FB_SYSMEM_HELPERS=y
CONFIG_FB_SYSMEM_HELPERS_DEFERRED=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_KTD2801=y
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_OMAP1=y
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_MAX8925=y
CONFIG_BACKLIGHT_MT6370=y
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_PCF50633=y
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
# CONFIG_BACKLIGHT_MP3309C is not set
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_TPS65217=y
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=y
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# CONFIG_FRAMEBUFFER_CONSOLE is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_UMP=y
# CONFIG_SND_UMP_LEGACY_RAWMIDI is not set
# CONFIG_SND_CORE_TEST is not set
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_CTL_LED=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_MIDI_EMUL=y
CONFIG_SND_SEQ_UMP=y
CONFIG_SND_SEQ_UMP_CLIENT=y
CONFIG_SND_MPU401_UART=y
CONFIG_SND_OPL3_LIB=y
CONFIG_SND_OPL3_LIB_SEQ=y
CONFIG_SND_AC97_CODEC=y
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=y
# CONFIG_SND_ALOOP is not set
CONFIG_SND_PCMTEST=y
# CONFIG_SND_VIRMIDI is not set
CONFIG_SND_MTPAV=y
CONFIG_SND_MTS64=y
CONFIG_SND_SERIAL_U16550=y
# CONFIG_SND_SERIAL_GENERIC is not set
# CONFIG_SND_MPU401 is not set
CONFIG_SND_PORTMAN2X4=y
# CONFIG_SND_AC97_POWER_SAVE is not set
CONFIG_SND_SB_COMMON=y
# CONFIG_SND_ISA is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
CONFIG_SND_ALS4000=y
# CONFIG_SND_ATIIXP is not set
CONFIG_SND_ATIIXP_MODEM=y
# CONFIG_SND_AU8810 is not set
CONFIG_SND_AU8820=y
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
CONFIG_SND_BT87X=y
CONFIG_SND_BT87X_OVERCLOCK=y
CONFIG_SND_CA0106=y
# CONFIG_SND_CMIPCI is not set
CONFIG_SND_OXYGEN_LIB=y
CONFIG_SND_OXYGEN=y
CONFIG_SND_CS4281=y
CONFIG_SND_CS46XX=y
# CONFIG_SND_CS46XX_NEW_DSP is not set
# CONFIG_SND_CS5530 is not set
CONFIG_SND_CS5535AUDIO=y
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
CONFIG_SND_GINA20=y
CONFIG_SND_LAYLA20=y
CONFIG_SND_DARLA24=y
CONFIG_SND_GINA24=y
# CONFIG_SND_LAYLA24 is not set
CONFIG_SND_MONA=y
CONFIG_SND_MIA=y
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
CONFIG_SND_INDIGOIO=y
CONFIG_SND_INDIGODJ=y
# CONFIG_SND_INDIGOIOX is not set
CONFIG_SND_INDIGODJX=y
CONFIG_SND_ENS1370=y
CONFIG_SND_ENS1371=y
CONFIG_SND_FM801=y
CONFIG_SND_HDSP=y

#
# Don't forget to add built-in firmwares for HDSP driver
#
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1724 is not set
CONFIG_SND_INTEL8X0=y
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
CONFIG_SND_LOLA=y
CONFIG_SND_LX6464ES=y
# CONFIG_SND_MIXART is not set
CONFIG_SND_NM256=y
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
CONFIG_SND_RME32=y
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
CONFIG_SND_VIA82XX=y
CONFIG_SND_VIA82XX_MODEM=y
CONFIG_SND_VIRTUOSO=y
# CONFIG_SND_VX222 is not set
CONFIG_SND_YMFPCI=y

#
# HD-Audio
#
CONFIG_SND_HDA=y
CONFIG_SND_HDA_GENERIC_LEDS=y
CONFIG_SND_HDA_INTEL=y
# CONFIG_SND_HDA_HWDEP is not set
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CIRRUS_SCODEC=y
CONFIG_SND_HDA_CIRRUS_SCODEC_KUNIT_TEST=y
CONFIG_SND_HDA_CS_DSP_CONTROLS=y
CONFIG_SND_HDA_SCODEC_CS35L56=y
CONFIG_SND_HDA_SCODEC_CS35L56_I2C=y
# CONFIG_SND_HDA_CODEC_REALTEK is not set
# CONFIG_SND_HDA_CODEC_ANALOG is not set
CONFIG_SND_HDA_CODEC_SIGMATEL=y
CONFIG_SND_HDA_CODEC_VIA=y
# CONFIG_SND_HDA_CODEC_HDMI is not set
# CONFIG_SND_HDA_CODEC_CIRRUS is not set
CONFIG_SND_HDA_CODEC_CS8409=y
CONFIG_SND_HDA_CODEC_CONEXANT=y
CONFIG_SND_HDA_CODEC_CA0110=y
CONFIG_SND_HDA_CODEC_CA0132=y
# CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
CONFIG_SND_HDA_CODEC_CMEDIA=y
CONFIG_SND_HDA_CODEC_SI3054=y
CONFIG_SND_HDA_GENERIC=y
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM is not set
# CONFIG_SND_HDA_CTL_DEV_ID is not set
# end of HD-Audio

CONFIG_SND_HDA_CORE=y
CONFIG_SND_HDA_EXT_CORE=y
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_INTEL_DSP_CONFIG=y
# CONFIG_SND_PPC is not set
CONFIG_SND_PXA2XX_LIB=y
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=y
CONFIG_SND_USB_AUDIO_MIDI_V2=y
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
# CONFIG_SND_USB_UA101 is not set
# CONFIG_SND_USB_USX2Y is not set
CONFIG_SND_USB_CAIAQ=y
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_SND_USB_US122L=y
CONFIG_SND_USB_6FIRE=y
# CONFIG_SND_USB_HIFACE is not set
CONFIG_SND_BCD2000=y
CONFIG_SND_USB_LINE6=y
CONFIG_SND_USB_POD=y
# CONFIG_SND_USB_PODHD is not set
CONFIG_SND_USB_TONEPORT=y
CONFIG_SND_USB_VARIAX=y
# CONFIG_SND_FIREWIRE is not set
# CONFIG_SND_PCMCIA is not set
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
# CONFIG_SND_SOC_TOPOLOGY_BUILD is not set
# CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST is not set
# CONFIG_SND_SOC_CARD_KUNIT_TEST is not set
CONFIG_SND_SOC_UTILS_KUNIT_TEST=y
CONFIG_SND_SOC_ADI=y
# CONFIG_SND_SOC_ADI_AXI_I2S is not set
CONFIG_SND_SOC_ADI_AXI_SPDIF=y
CONFIG_SND_SOC_AMD_ACP=y
CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=y
CONFIG_SND_AMD_ACP_CONFIG=y
# CONFIG_SND_SOC_AMD_ACP63_TOPLEVEL is not set
CONFIG_SND_SOC_APPLE_MCA=y
# CONFIG_SND_ATMEL_SOC is not set
CONFIG_SND_BCM2835_SOC_I2S=y
CONFIG_SND_SOC_CYGNUS=y
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
CONFIG_SND_EP93XX_SOC=y
CONFIG_SND_EP93XX_SOC_I2S=y
CONFIG_SND_EP93XX_SOC_I2S_WATCHDOG=y

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=y
# CONFIG_SND_SOC_FSL_MQS is not set
CONFIG_SND_SOC_FSL_AUDMIX=y
CONFIG_SND_SOC_FSL_SSI=y
# CONFIG_SND_SOC_FSL_SPDIF is not set
CONFIG_SND_SOC_FSL_ESAI=y
CONFIG_SND_SOC_FSL_MICFIL=y
# CONFIG_SND_SOC_FSL_XCVR is not set
CONFIG_SND_SOC_FSL_AUD2HTX=y
CONFIG_SND_SOC_FSL_UTILS=y
CONFIG_SND_SOC_IMX_PCM_DMA=y
CONFIG_SND_SOC_IMX_AUDIO_RPMSG=y
CONFIG_SND_SOC_IMX_PCM_RPMSG=y
CONFIG_SND_SOC_IMX_AUDMUX=y
CONFIG_SND_IMX_SOC=y

#
# SoC Audio support for Freescale i.MX boards:
#
CONFIG_SND_SOC_IMX_ES8328=y
# CONFIG_SND_SOC_IMX_SGTL5000 is not set
# CONFIG_SND_SOC_IMX_SPDIF is not set
CONFIG_SND_SOC_FSL_ASOC_CARD=y
# CONFIG_SND_SOC_IMX_AUDMIX is not set
CONFIG_SND_SOC_IMX_HDMI=y
CONFIG_SND_SOC_IMX_RPMSG=y
CONFIG_SND_SOC_IMX_CARD=y
# end of SoC Audio for Freescale CPUs

CONFIG_SND_SOC_CHV3_I2S=y
CONFIG_SND_I2S_HI6210_I2S=y
CONFIG_SND_JZ4740_SOC_I2S=y
CONFIG_SND_KIRKWOOD_SOC=y
CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB=y

#
# SoC Audio for Loongson CPUs
#
CONFIG_SND_SOC_LOONGSON_I2S_PCI=y
# CONFIG_SND_SOC_LOONGSON_CARD is not set
# end of SoC Audio for Loongson CPUs

CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=y
CONFIG_SND_SOC_IMG_I2S_OUT=y
# CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
CONFIG_SND_SOC_IMG_SPDIF_IN=y
CONFIG_SND_SOC_IMG_SPDIF_OUT=y
# CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
CONFIG_SND_SOC_ACPI_INTEL_MATCH=y
CONFIG_SND_SOC_INTEL_MACH=y
CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES=y
# CONFIG_SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH is not set
CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH=y
# CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
CONFIG_SND_PXA2XX_SOC=y
# CONFIG_SND_SOC_QCOM is not set
CONFIG_SND_SOC_ROCKCHIP=y

#
# SoC Audio support for Renesas SoCs
#
CONFIG_SND_SOC_RZ=y
# end of SoC Audio support for Renesas SoCs

CONFIG_SND_SOC_SOF_TOPLEVEL=y
CONFIG_SND_SOC_SOF_PCI_DEV=y
CONFIG_SND_SOC_SOF_PCI=y
CONFIG_SND_SOC_SOF_ACPI=y
CONFIG_SND_SOC_SOF_ACPI_DEV=y
CONFIG_SND_SOC_SOF_OF=y
CONFIG_SND_SOC_SOF_DEBUG_PROBES=y
CONFIG_SND_SOC_SOF_CLIENT=y
# CONFIG_SND_SOC_SOF_DEVELOPER_SUPPORT is not set
CONFIG_SND_SOC_SOF=y
CONFIG_SND_SOC_SOF_IPC3=y
CONFIG_SND_SOC_SOF_IPC4=y
CONFIG_SND_SOC_SOF_AMD_TOPLEVEL=y
CONFIG_SND_SOC_SOF_AMD_COMMON=y
CONFIG_SND_SOC_SOF_AMD_RENOIR=y
# CONFIG_SND_SOC_SOF_AMD_VANGOGH is not set
# CONFIG_SND_SOC_SOF_AMD_REMBRANDT is not set
CONFIG_SND_SOC_SOF_ACP_PROBES=y
# CONFIG_SND_SOC_SOF_AMD_ACP63 is not set
# CONFIG_SND_SOC_SOF_IMX_TOPLEVEL is not set
CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=y
CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC=y
CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP=y
CONFIG_SND_SOC_SOF_INTEL_COMMON=y
CONFIG_SND_SOC_SOF_BAYTRAIL=y
# CONFIG_SND_SOC_SOF_BROADWELL is not set
# CONFIG_SND_SOC_SOF_MERRIFIELD is not set
CONFIG_SND_SOC_SOF_INTEL_SKL=y
CONFIG_SND_SOC_SOF_SKYLAKE=y
# CONFIG_SND_SOC_SOF_KABYLAKE is not set
CONFIG_SND_SOC_SOF_INTEL_APL=y
CONFIG_SND_SOC_SOF_APOLLOLAKE=y
CONFIG_SND_SOC_SOF_GEMINILAKE=y
CONFIG_SND_SOC_SOF_INTEL_CNL=y
CONFIG_SND_SOC_SOF_CANNONLAKE=y
# CONFIG_SND_SOC_SOF_COFFEELAKE is not set
CONFIG_SND_SOC_SOF_COMETLAKE=y
CONFIG_SND_SOC_SOF_INTEL_ICL=y
CONFIG_SND_SOC_SOF_ICELAKE=y
# CONFIG_SND_SOC_SOF_JASPERLAKE is not set
CONFIG_SND_SOC_SOF_INTEL_TGL=y
CONFIG_SND_SOC_SOF_TIGERLAKE=y
CONFIG_SND_SOC_SOF_ELKHARTLAKE=y
CONFIG_SND_SOC_SOF_ALDERLAKE=y
CONFIG_SND_SOC_SOF_INTEL_MTL=y
CONFIG_SND_SOC_SOF_METEORLAKE=y
CONFIG_SND_SOC_SOF_INTEL_LNL=y
CONFIG_SND_SOC_SOF_LUNARLAKE=y
CONFIG_SND_SOC_SOF_HDA_COMMON=y
CONFIG_SND_SOC_SOF_HDA_GENERIC=y
# CONFIG_SND_SOC_SOF_HDA_LINK is not set
CONFIG_SND_SOC_SOF_HDA_LINK_BASELINE=y
CONFIG_SND_SOC_SOF_HDA_PROBES=y
CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y
# CONFIG_SND_SOC_SOF_MTK_TOPLEVEL is not set
CONFIG_SND_SOC_SOF_XTENSA=y
CONFIG_SND_SOC_SPRD=y
CONFIG_SND_SOC_SPRD_MCDT=y
CONFIG_SND_SOC_STARFIVE=y
# CONFIG_SND_SOC_STI is not set

#
# STMicroelectronics STM32 SOC audio support
#
CONFIG_SND_SOC_STM32_SPDIFRX=y
# end of STMicroelectronics STM32 SOC audio support

#
# Allwinner SoC Audio support
#
CONFIG_SND_SUN4I_CODEC=y
CONFIG_SND_SUN8I_CODEC_ANALOG=y
# CONFIG_SND_SUN50I_CODEC_ANALOG is not set
CONFIG_SND_SUN4I_I2S=y
# CONFIG_SND_SUN4I_SPDIF is not set
CONFIG_SND_SUN50I_DMIC=y
CONFIG_SND_SUN8I_ADDA_PR_REGMAP=y
# end of Allwinner SoC Audio support

#
# Audio support for Texas Instruments SoCs
#
CONFIG_SND_SOC_TI_EDMA_PCM=y
CONFIG_SND_SOC_TI_SDMA_PCM=y

#
# Texas Instruments DAI support for:
#
CONFIG_SND_SOC_DAVINCI_ASP=y
CONFIG_SND_SOC_OMAP_MCPDM=y

#
# Audio support for boards with Texas Instruments SoCs
#
CONFIG_SND_SOC_OMAP_AMS_DELTA=y
CONFIG_SND_SOC_OMAP_HDMI=y
# end of Audio support for Texas Instruments SoCs

# CONFIG_SND_SOC_UNIPHIER is not set
# CONFIG_SND_SOC_XILINX_I2S is not set
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
CONFIG_SND_SOC_XILINX_SPDIF=y
CONFIG_SND_SOC_XTFPGA_I2S=y
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
# CONFIG_SND_SOC_ALL_CODECS is not set
CONFIG_SND_SOC_WM_HUBS=y
CONFIG_SND_SOC_WM_ADSP=y
CONFIG_SND_SOC_AC97_CODEC=y
# CONFIG_SND_SOC_ADAU1372_I2C is not set
CONFIG_SND_SOC_ADAU1701=y
# CONFIG_SND_SOC_ADAU1761_I2C is not set
CONFIG_SND_SOC_ADAU7002=y
# CONFIG_SND_SOC_ADAU7118_HW is not set
# CONFIG_SND_SOC_ADAU7118_I2C is not set
CONFIG_SND_SOC_AK4118=y
# CONFIG_SND_SOC_AK4375 is not set
CONFIG_SND_SOC_AK4458=y
CONFIG_SND_SOC_AK4554=y
CONFIG_SND_SOC_AK4613=y
# CONFIG_SND_SOC_AK4642 is not set
# CONFIG_SND_SOC_AK5386 is not set
CONFIG_SND_SOC_AK5558=y
CONFIG_SND_SOC_ALC5623=y
# CONFIG_SND_SOC_AW8738 is not set
CONFIG_SND_SOC_AW88395_LIB=y
CONFIG_SND_SOC_AW88395=y
# CONFIG_SND_SOC_AW88261 is not set
# CONFIG_SND_SOC_AW87390 is not set
# CONFIG_SND_SOC_AW88399 is not set
CONFIG_SND_SOC_BD28623=y
CONFIG_SND_SOC_BT_SCO=y
CONFIG_SND_SOC_CHV3_CODEC=y
CONFIG_SND_SOC_CPCAP=y
CONFIG_SND_SOC_CROS_EC_CODEC=y
CONFIG_SND_SOC_CS_AMP_LIB=y
# CONFIG_SND_SOC_CS_AMP_LIB_TEST is not set
CONFIG_SND_SOC_CS35L32=y
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=y
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
CONFIG_SND_SOC_CS35L41_I2C=y
CONFIG_SND_SOC_CS35L45=y
CONFIG_SND_SOC_CS35L45_I2C=y
CONFIG_SND_SOC_CS35L56=y
CONFIG_SND_SOC_CS35L56_SHARED=y
CONFIG_SND_SOC_CS35L56_I2C=y
CONFIG_SND_SOC_CS35L56_SDW=y
CONFIG_SND_SOC_CS42L42_CORE=y
# CONFIG_SND_SOC_CS42L42 is not set
CONFIG_SND_SOC_CS42L42_SDW=y
# CONFIG_SND_SOC_CS42L43 is not set
CONFIG_SND_SOC_CS42L51=y
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
CONFIG_SND_SOC_CS42L56=y
CONFIG_SND_SOC_CS42L73=y
CONFIG_SND_SOC_CS42L83=y
# CONFIG_SND_SOC_CS4234 is not set
CONFIG_SND_SOC_CS4265=y
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=y
CONFIG_SND_SOC_CS4271_I2C=y
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=y
CONFIG_SND_SOC_CS53L30=y
CONFIG_SND_SOC_CX20442=y
# CONFIG_SND_SOC_CX2072X is not set
CONFIG_SND_SOC_JZ4740_CODEC=y
# CONFIG_SND_SOC_JZ4725B_CODEC is not set
# CONFIG_SND_SOC_JZ4760_CODEC is not set
CONFIG_SND_SOC_JZ4770_CODEC=y
CONFIG_SND_SOC_DA7213=y
# CONFIG_SND_SOC_DMIC is not set
CONFIG_SND_SOC_HDMI_CODEC=y
CONFIG_SND_SOC_ES7134=y
CONFIG_SND_SOC_ES7241=y
CONFIG_SND_SOC_ES8316=y
CONFIG_SND_SOC_ES8326=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
CONFIG_SND_SOC_GTM601=y
CONFIG_SND_SOC_HDA=y
# CONFIG_SND_SOC_ICS43432 is not set
CONFIG_SND_SOC_INNO_RK3036=y
# CONFIG_SND_SOC_LOCHNAGAR_SC is not set
# CONFIG_SND_SOC_MAX98088 is not set
# CONFIG_SND_SOC_MAX98090 is not set
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98504=y
CONFIG_SND_SOC_MAX9867=y
CONFIG_SND_SOC_MAX98927=y
# CONFIG_SND_SOC_MAX98520 is not set
CONFIG_SND_SOC_MAX98363=y
# CONFIG_SND_SOC_MAX98373_I2C is not set
# CONFIG_SND_SOC_MAX98373_SDW is not set
# CONFIG_SND_SOC_MAX98388 is not set
CONFIG_SND_SOC_MAX98390=y
CONFIG_SND_SOC_MAX98396=y
# CONFIG_SND_SOC_MAX9860 is not set
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=y
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
# CONFIG_SND_SOC_PCM1681 is not set
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
CONFIG_SND_SOC_PCM179X=y
CONFIG_SND_SOC_PCM179X_I2C=y
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
# CONFIG_SND_SOC_PCM6240 is not set
CONFIG_SND_SOC_RK3308=y
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RK817=y
CONFIG_SND_SOC_RL6231=y
CONFIG_SND_SOC_RT1017_SDCA_SDW=y
# CONFIG_SND_SOC_RT1308_SDW is not set
CONFIG_SND_SOC_RT1316_SDW=y
# CONFIG_SND_SOC_RT1318_SDW is not set
CONFIG_SND_SOC_RT5616=y
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=y
CONFIG_SND_SOC_RT5645=y
CONFIG_SND_SOC_RT5659=y
CONFIG_SND_SOC_RT5682=y
CONFIG_SND_SOC_RT5682_SDW=y
# CONFIG_SND_SOC_RT700_SDW is not set
CONFIG_SND_SOC_RT711=y
CONFIG_SND_SOC_RT711_SDW=y
CONFIG_SND_SOC_RT711_SDCA_SDW=y
CONFIG_SND_SOC_RT712_SDCA_SDW=y
CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW=y
# CONFIG_SND_SOC_RT722_SDCA_SDW is not set
# CONFIG_SND_SOC_RT715_SDW is not set
CONFIG_SND_SOC_RT715_SDCA_SDW=y
CONFIG_SND_SOC_RT9120=y
CONFIG_SND_SOC_RTQ9128=y
# CONFIG_SND_SOC_SDW_MOCKUP is not set
# CONFIG_SND_SOC_SGTL5000 is not set
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
CONFIG_SND_SOC_SIMPLE_MUX=y
CONFIG_SND_SOC_SMA1303=y
CONFIG_SND_SOC_SPDIF=y
CONFIG_SND_SOC_SRC4XXX_I2C=y
CONFIG_SND_SOC_SRC4XXX=y
CONFIG_SND_SOC_SSM2305=y
CONFIG_SND_SOC_SSM2518=y
CONFIG_SND_SOC_SSM2602=y
CONFIG_SND_SOC_SSM2602_I2C=y
CONFIG_SND_SOC_SSM3515=y
CONFIG_SND_SOC_SSM4567=y
CONFIG_SND_SOC_STA32X=y
# CONFIG_SND_SOC_STA350 is not set
CONFIG_SND_SOC_STI_SAS=y
CONFIG_SND_SOC_TAS2552=y
CONFIG_SND_SOC_TAS2562=y
CONFIG_SND_SOC_TAS2764=y
CONFIG_SND_SOC_TAS2770=y
CONFIG_SND_SOC_TAS2780=y
CONFIG_SND_SOC_TAS2781_COMLIB=y
CONFIG_SND_SOC_TAS2781_FMWLIB=y
CONFIG_SND_SOC_TAS2781_I2C=y
CONFIG_SND_SOC_TAS5086=y
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS5805M is not set
# CONFIG_SND_SOC_TAS6424 is not set
# CONFIG_SND_SOC_TDA7419 is not set
CONFIG_SND_SOC_TFA9879=y
CONFIG_SND_SOC_TFA989X=y
# CONFIG_SND_SOC_TLV320ADC3XXX is not set
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
CONFIG_SND_SOC_TLV320AIC31XX=y
# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
CONFIG_SND_SOC_TLV320ADCX140=y
# CONFIG_SND_SOC_TS3A227E is not set
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
CONFIG_SND_SOC_UDA1334=y
CONFIG_SND_SOC_WCD_CLASSH=y
CONFIG_SND_SOC_WCD9335=y
CONFIG_SND_SOC_WCD_MBHC=y
CONFIG_SND_SOC_WCD938X=y
CONFIG_SND_SOC_WCD938X_SDW=y
# CONFIG_SND_SOC_WCD939X_SDW is not set
# CONFIG_SND_SOC_WM8510 is not set
CONFIG_SND_SOC_WM8523=y
CONFIG_SND_SOC_WM8524=y
CONFIG_SND_SOC_WM8580=y
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8728=y
# CONFIG_SND_SOC_WM8731_I2C is not set
CONFIG_SND_SOC_WM8737=y
# CONFIG_SND_SOC_WM8741 is not set
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
# CONFIG_SND_SOC_WM8776 is not set
# CONFIG_SND_SOC_WM8782 is not set
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
CONFIG_SND_SOC_WM8903=y
CONFIG_SND_SOC_WM8904=y
CONFIG_SND_SOC_WM8940=y
# CONFIG_SND_SOC_WM8960 is not set
# CONFIG_SND_SOC_WM8961 is not set
CONFIG_SND_SOC_WM8962=y
CONFIG_SND_SOC_WM8974=y
CONFIG_SND_SOC_WM8978=y
CONFIG_SND_SOC_WM8985=y
CONFIG_SND_SOC_WM8994=y
CONFIG_SND_SOC_WSA881X=y
# CONFIG_SND_SOC_WSA883X is not set
CONFIG_SND_SOC_WSA884X=y
CONFIG_SND_SOC_MAX9759=y
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6358=y
# CONFIG_SND_SOC_MT6359 is not set
# CONFIG_SND_SOC_MT6359_ACCDET is not set
CONFIG_SND_SOC_MT6660=y
CONFIG_SND_SOC_NAU8315=y
# CONFIG_SND_SOC_NAU8540 is not set
CONFIG_SND_SOC_NAU8810=y
CONFIG_SND_SOC_NAU8821=y
CONFIG_SND_SOC_NAU8822=y
# CONFIG_SND_SOC_NAU8824 is not set
CONFIG_SND_SOC_TPA6130A2=y
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
# CONFIG_SND_AUDIO_GRAPH_CARD is not set
# CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
CONFIG_SND_TEST_COMPONENT=y
# CONFIG_SND_VIRTIO is not set
CONFIG_AC97_BUS=y
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_BIG_ENDIAN_DESC=y
CONFIG_USB_OHCI_BIG_ENDIAN_MMIO=y
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_EHCI_BIG_ENDIAN_MMIO=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
CONFIG_USB_OTG_FSM=y
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=1
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
# CONFIG_USB_XHCI_PCI_RENESAS is not set
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_XHCI_HISTB=y
# CONFIG_USB_XHCI_MTK is not set
CONFIG_USB_XHCI_MVEBU=y
# CONFIG_USB_XHCI_RCAR is not set
CONFIG_USB_EHCI_BRCMSTB=y
CONFIG_USB_BRCMSTB=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
CONFIG_USB_EHCI_FSL=y
CONFIG_USB_EHCI_HCD_NPCM7XX=y
CONFIG_USB_EHCI_HCD_ORION=y
CONFIG_USB_EHCI_HCD_SPEAR=y
CONFIG_USB_EHCI_HCD_STI=y
# CONFIG_USB_EHCI_HCD_AT91 is not set
CONFIG_USB_EHCI_HCD_PPC_OF=y
CONFIG_USB_EHCI_SH=y
CONFIG_USB_EHCI_EXYNOS=y
CONFIG_USB_EHCI_MV=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_SPEAR=y
CONFIG_USB_OHCI_HCD_STI=y
# CONFIG_USB_OHCI_HCD_S3C2410 is not set
CONFIG_USB_OHCI_HCD_LPC32XX=y
CONFIG_USB_OHCI_HCD_AT91=y
CONFIG_USB_OHCI_HCD_OMAP3=y
# CONFIG_USB_OHCI_HCD_DAVINCI is not set
CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
CONFIG_USB_OHCI_HCD_PPC_OF_LE=y
CONFIG_USB_OHCI_HCD_PPC_OF=y
# CONFIG_USB_OHCI_HCD_SSB is not set
# CONFIG_USB_OHCI_EXYNOS is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
CONFIG_USB_SL811_CS=y
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set
# CONFIG_USB_RENESAS_USBHS is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=y
CONFIG_REALTEK_AUTOPM=y
# CONFIG_USB_STORAGE_DATAFAB is not set
CONFIG_USB_STORAGE_FREECOM=y
CONFIG_USB_STORAGE_ISD200=y
CONFIG_USB_STORAGE_USBAT=y
CONFIG_USB_STORAGE_SDDR09=y
CONFIG_USB_STORAGE_SDDR55=y
CONFIG_USB_STORAGE_JUMPSHOT=y
# CONFIG_USB_STORAGE_ALAUDA is not set
CONFIG_USB_STORAGE_ONETOUCH=y
CONFIG_USB_STORAGE_KARMA=y
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
CONFIG_USB_STORAGE_ENE_UB6250=y
CONFIG_USB_UAS=y

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS_HOST=y
CONFIG_USB_CDNS3=y
CONFIG_USB_CDNS3_GADGET=y
CONFIG_USB_CDNS3_HOST=y
# CONFIG_USB_CDNS3_TI is not set
CONFIG_USB_CDNS3_IMX=y
CONFIG_USB_CDNS3_STARFIVE=y
CONFIG_USB_FOTG210=y
CONFIG_USB_FOTG210_HCD=y
# CONFIG_USB_FOTG210_UDC is not set
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
# CONFIG_USB_MUSB_GADGET is not set
CONFIG_USB_MUSB_DUAL_ROLE=y

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_TUSB6010=y
# CONFIG_USB_MUSB_DSPS is not set
# CONFIG_USB_MUSB_UX500 is not set

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
CONFIG_USB_DWC2_DUAL_ROLE=y
# CONFIG_USB_DWC2_DEBUG is not set
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_UDC=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_NPCM=y
CONFIG_USB_CHIPIDEA_IMX=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_CHIPIDEA_TEGRA=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
CONFIG_USB_ISP1760_DUAL_ROLE=y

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_USS720=y
# CONFIG_USB_EMI62 is not set
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_USB_QCOM_EUD is not set
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
# CONFIG_USB_CHAOSKEY is not set
CONFIG_BRCM_USB_PINMAP=y
CONFIG_USB_ONBOARD_DEV=y
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_USB_GPIO_VBUS=y
# CONFIG_TAHVO_USB is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
CONFIG_USB_LPC32XX=y
CONFIG_USB_GR_UDC=y
CONFIG_USB_R8A66597=y
CONFIG_USB_RZV2M_USB3DRD=y
CONFIG_USB_RENESAS_USB3=y
CONFIG_USB_RENESAS_USBF=y
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
CONFIG_USB_MV_U3D=y
CONFIG_USB_SNP_CORE=y
CONFIG_USB_SNP_UDC_PLAT=y
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=y
CONFIG_USB_NET2272=y
CONFIG_USB_NET2272_DMA=y
CONFIG_USB_GADGET_XILINX=y
CONFIG_USB_ASPEED_UDC=y
# CONFIG_USB_ASPEED_VHUB is not set
CONFIG_USB_DUMMY_HCD=y
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_U_AUDIO=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_NCM=y
CONFIG_USB_F_ECM=y
CONFIG_USB_F_PHONET=y
CONFIG_USB_F_EEM=y
CONFIG_USB_F_SUBSET=y
CONFIG_USB_F_RNDIS=y
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_UAC2=y
CONFIG_USB_F_MIDI=y
CONFIG_USB_CONFIGFS=y
CONFIG_USB_CONFIGFS_SERIAL=y
# CONFIG_USB_CONFIGFS_ACM is not set
CONFIG_USB_CONFIGFS_OBEX=y
# CONFIG_USB_CONFIGFS_NCM is not set
CONFIG_USB_CONFIGFS_ECM=y
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
CONFIG_USB_CONFIGFS_RNDIS=y
# CONFIG_USB_CONFIGFS_EEM is not set
CONFIG_USB_CONFIGFS_PHONET=y
CONFIG_USB_CONFIGFS_MASS_STORAGE=y
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
# CONFIG_USB_CONFIGFS_F_FS is not set
# CONFIG_USB_CONFIGFS_F_UAC1 is not set
# CONFIG_USB_CONFIGFS_F_UAC1_LEGACY is not set
# CONFIG_USB_CONFIGFS_F_UAC2 is not set
CONFIG_USB_CONFIGFS_F_MIDI=y
# CONFIG_USB_CONFIGFS_F_MIDI2 is not set
# CONFIG_USB_CONFIGFS_F_HID is not set
# CONFIG_USB_CONFIGFS_F_PRINTER is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
# CONFIG_USB_ZERO_HNPTEST is not set
CONFIG_USB_AUDIO=y
# CONFIG_GADGET_UAC1 is not set
CONFIG_USB_ETH=y
# CONFIG_USB_ETH_RNDIS is not set
CONFIG_USB_ETH_EEM=y
CONFIG_USB_G_NCM=y
CONFIG_USB_GADGETFS=y
# CONFIG_USB_FUNCTIONFS is not set
CONFIG_USB_MASS_STORAGE=y
CONFIG_USB_G_SERIAL=y
CONFIG_USB_MIDI_GADGET=y
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
# CONFIG_USB_G_NOKIA is not set
CONFIG_USB_G_ACM_MS=y
CONFIG_USB_G_MULTI=y
# CONFIG_USB_G_MULTI_RNDIS is not set
CONFIG_USB_G_MULTI_CDC=y
# CONFIG_USB_G_HID is not set
# CONFIG_USB_G_DBGP is not set
CONFIG_USB_RAW_GADGET=y
# end of USB Gadget precomposed configurations

CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=y
CONFIG_TYPEC_RT1711H=y
# CONFIG_TYPEC_TCPCI_MT6370 is not set
# CONFIG_TYPEC_TCPCI_MAXIM is not set
CONFIG_TYPEC_FUSB302=y
CONFIG_TYPEC_QCOM_PMIC=y
CONFIG_TYPEC_TPS6598X=y
CONFIG_TYPEC_ANX7411=y
CONFIG_TYPEC_RT1719=y
CONFIG_TYPEC_HD3SS3220=y
# CONFIG_TYPEC_STUSB160X is not set
CONFIG_TYPEC_WUSB3801=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=y
CONFIG_TYPEC_MUX_GPIO_SBU=y
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# CONFIG_TYPEC_MUX_IT5205 is not set
CONFIG_TYPEC_MUX_NB7VPQ904M=y
CONFIG_TYPEC_MUX_PTN36502=y
# CONFIG_TYPEC_MUX_WCD939X_USBSS is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SD8787=y
# CONFIG_PWRSEQ_SIMPLE is not set
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SUNPLUS=y
# CONFIG_MMC_SDHCI is not set
CONFIG_MMC_MOXART=y
CONFIG_MMC_OMAP_HS=y
CONFIG_MMC_WBSD=y
# CONFIG_MMC_ALCOR is not set
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_DAVINCI=y
CONFIG_MMC_SDRICOH_CS=y
CONFIG_MMC_TMIO_CORE=y
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_UNIPHIER=y
# CONFIG_MMC_CB710 is not set
CONFIG_MMC_VIA_SDMMC=y
# CONFIG_MMC_DW is not set
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_REALTEK_USB=y
# CONFIG_MMC_CQHCI is not set
CONFIG_MMC_HSQ=y
CONFIG_MMC_TOSHIBA_PCI=y
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_OWL=y
CONFIG_MMC_LITEX=y
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
# CONFIG_MSPRO_BLOCK is not set
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=y
# CONFIG_MEMSTICK_JMICRON_38X is not set
CONFIG_MEMSTICK_R592=y
CONFIG_MEMSTICK_REALTEK_PCI=y
CONFIG_MEMSTICK_REALTEK_USB=y
CONFIG_LEDS_EXPRESSWIRE=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_AN30259A is not set
CONFIG_LEDS_ARIEL=y
CONFIG_LEDS_AW200XX=y
CONFIG_LEDS_AW2013=y
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
# CONFIG_LEDS_MT6323 is not set
CONFIG_LEDS_COBALT_QUBE=y
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_PCA995X=y
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_MAX5970=y
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX77650=y
CONFIG_LEDS_MAX8997=y
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_OT200=y
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
CONFIG_LEDS_TI_LMU_COMMON=y
# CONFIG_LEDS_LM3697 is not set
# CONFIG_LEDS_LM36274 is not set
CONFIG_LEDS_TPS6105X=y
CONFIG_LEDS_IP30=y
CONFIG_LEDS_ACER_A500=y
CONFIG_LEDS_BCM63138=y
CONFIG_LEDS_LGM=y

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=y
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_OF=y
CONFIG_ALTERA_MSGDMA=y
# CONFIG_APPLE_ADMAC is not set
CONFIG_AXI_DMAC=y
CONFIG_BCM_SBA_RAID=y
CONFIG_DMA_JZ4780=y
# CONFIG_DMA_SA11X0 is not set
CONFIG_DMA_SUN6I=y
CONFIG_DW_AXI_DMAC=y
# CONFIG_EP93XX_DMA is not set
# CONFIG_FSL_EDMA is not set
# CONFIG_IMG_MDC_DMA is not set
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_K3_DMA is not set
CONFIG_LS2X_APB_DMA=y
# CONFIG_MCF_EDMA is not set
# CONFIG_MILBEAUT_HDMAC is not set
CONFIG_MILBEAUT_XDMAC=y
CONFIG_MMP_PDMA=y
# CONFIG_MMP_TDMA is not set
# CONFIG_MV_XOR is not set
# CONFIG_MXS_DMA is not set
# CONFIG_NBPFAXI_DMA is not set
CONFIG_PCH_DMA=y
CONFIG_PLX_DMA=y
CONFIG_STM32_DMA=y
CONFIG_STM32_DMAMUX=y
# CONFIG_STM32_MDMA is not set
CONFIG_SPRD_DMA=y
CONFIG_TEGRA20_APB_DMA=y
CONFIG_TEGRA210_ADMA=y
CONFIG_TIMB_DMA=y
CONFIG_UNIPHIER_MDMAC=y
# CONFIG_UNIPHIER_XDMAC is not set
CONFIG_XGENE_DMA=y
CONFIG_XILINX_DMA=y
CONFIG_XILINX_XDMA=y
CONFIG_XILINX_ZYNQMP_DMA=y
CONFIG_XILINX_ZYNQMP_DPDMA=y
CONFIG_MTK_HSDMA=y
CONFIG_MTK_CQDMA=y
CONFIG_QCOM_HIDMA_MGMT=y
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
# CONFIG_DW_DMAC is not set
CONFIG_DW_DMAC_PCI=y
CONFIG_SF_PDMA=y
CONFIG_RENESAS_DMA=y
CONFIG_SH_DMAE_BASE=y
CONFIG_SH_DMAE=y
# CONFIG_RCAR_DMAC is not set
CONFIG_RENESAS_USB_DMAC=y
CONFIG_RZ_DMAC=y
CONFIG_TI_EDMA=y
CONFIG_DMA_OMAP=y
CONFIG_TI_DMA_CROSSBAR=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=y
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_UIO=y
CONFIG_UIO_CIF=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=y
CONFIG_UIO_PCI_GENERIC=y
# CONFIG_UIO_NETX is not set
CONFIG_UIO_FSL_ELBC_GPCM=y
CONFIG_UIO_FSL_ELBC_GPCM_NETX5152=y
CONFIG_UIO_MF624=y
# CONFIG_UIO_DFL is not set
# CONFIG_VFIO is not set
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VDPA=y
CONFIG_VDPA_SIM=y
CONFIG_VDPA_SIM_NET=y
# CONFIG_VDPA_SIM_BLOCK is not set
CONFIG_VDPA_USER=y
CONFIG_MLX5_VDPA=y
CONFIG_MLX5_VDPA_STEERING_DEBUG=y
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=y
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
# CONFIG_GREYBUS_BEAGLEPLAY is not set
CONFIG_GREYBUS_ES2=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=y
# CONFIG_COMEDI_CB_DAS16_CS is not set
CONFIG_COMEDI_DAS08_CS=y
# CONFIG_COMEDI_NI_DAQ_700_CS is not set
CONFIG_COMEDI_NI_DAQ_DIO24_CS=y
CONFIG_COMEDI_NI_LABPC_CS=y
# CONFIG_COMEDI_NI_MIO_CS is not set
# CONFIG_COMEDI_QUATECH_DAQP_CS is not set
CONFIG_COMEDI_USB_DRIVERS=y
# CONFIG_COMEDI_DT9812 is not set
# CONFIG_COMEDI_NI_USB6501 is not set
CONFIG_COMEDI_USBDUX=y
# CONFIG_COMEDI_USBDUXFAST is not set
CONFIG_COMEDI_USBDUXSIGMA=y
# CONFIG_COMEDI_VMK80XX is not set
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_NI_LABPC=y
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y
CONFIG_RTS5208=y
CONFIG_OCTEON_ETHERNET=y
# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set
CONFIG_MOST_COMPONENTS=y
CONFIG_MOST_NET=y
CONFIG_MOST_DIM2=y
# CONFIG_MOST_I2C is not set
CONFIG_GREYBUS_AUDIO=y
CONFIG_GREYBUS_AUDIO_APB_CODEC=y
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_LOG=y
# CONFIG_GREYBUS_LOOPBACK is not set
# CONFIG_GREYBUS_POWER is not set
# CONFIG_GREYBUS_RAW is not set
# CONFIG_GREYBUS_VIBRATOR is not set
CONFIG_GREYBUS_BRIDGED_PHY=y
# CONFIG_GREYBUS_GPIO is not set
CONFIG_GREYBUS_I2C=y
CONFIG_GREYBUS_PWM=y
# CONFIG_GREYBUS_SDIO is not set
# CONFIG_GREYBUS_UART is not set
# CONFIG_GREYBUS_USB is not set
# CONFIG_GREYBUS_ARCHE is not set
CONFIG_BCM_VIDEOCORE=y
CONFIG_BCM2835_VCHIQ=y
# CONFIG_VCHIQ_CDEV is not set
CONFIG_SND_BCM2835=y
# CONFIG_BCM2835_VCHIQ_MMAL is not set
# CONFIG_XIL_AXIS_FIFO is not set
CONFIG_FIELDBUS_DEV=y
CONFIG_HMS_ANYBUSS_BUS=y
CONFIG_ARCX_ANYBUS_CONTROLLER=y
CONFIG_HMS_PROFINET=y
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
CONFIG_VME_TSI148=y
CONFIG_VME_FAKE=y

#
# VME Device Drivers
#
CONFIG_VME_USER=y
# CONFIG_GOLDFISH is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
# CONFIG_CROS_EC_I2C is not set
# CONFIG_CROS_EC_RPMSG is not set
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KBD_LED_BACKLIGHT=y
CONFIG_CROS_EC_CHARDEV=y
# CONFIG_CROS_EC_LIGHTBAR is not set
CONFIG_CROS_EC_VBC=y
CONFIG_CROS_EC_DEBUGFS=y
# CONFIG_CROS_EC_SENSORHUB is not set
CONFIG_CROS_EC_SYSFS=y
# CONFIG_CROS_EC_TYPEC is not set
CONFIG_CROS_USBPD_NOTIFY=y
CONFIG_CROS_KUNIT_EC_PROTO_TEST=y
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_ARM64_PLATFORM_DEVICES=y
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
CONFIG_BCM_KONA_TIMER=y
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
CONFIG_OMAP_DM_TIMER=y
CONFIG_DW_APB_TIMER=y
# CONFIG_FTTMR010_TIMER is not set
CONFIG_IXP4XX_TIMER=y
CONFIG_MESON6_TIMER=y
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
CONFIG_TEGRA_TIMER=y
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
CONFIG_NSPIRE_TIMER=y
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_STM32_LP is not set
CONFIG_ARMV7M_SYSTICK=y
# CONFIG_ATMEL_PIT is not set
CONFIG_ATMEL_ST=y
CONFIG_CLKSRC_SAMSUNG_PWM=y
CONFIG_FSL_FTM_TIMER=y
# CONFIG_MTK_TIMER is not set
# CONFIG_MTK_CPUX_TIMER is not set
# CONFIG_SPRD_TIMER is not set
CONFIG_CLKSRC_JCORE_PIT=y
# CONFIG_SH_TIMER_CMT is not set
CONFIG_SH_TIMER_MTU2=y
CONFIG_RENESAS_OSTM=y
CONFIG_SH_TIMER_TMU=y
CONFIG_EM_TIMER_STI=y
# CONFIG_CLKSRC_PXA is not set
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_LOONGSON1_PWM is not set
# CONFIG_CLKSRC_ST_LPC is not set
CONFIG_GXP_TIMER=y
CONFIG_MSC313E_TIMER=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_ARM_MHU_V3=y
# CONFIG_IMX_MBOX is not set
CONFIG_PLATFORM_MHU=y
CONFIG_ARMADA_37XX_RWTM_MBOX=y
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_HI3660_MBOX is not set
# CONFIG_HI6220_MBOX is not set
CONFIG_MAILBOX_TEST=y
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_BCM_PDC_MBOX=y
CONFIG_STM32_IPCC=y
# CONFIG_MTK_ADSP_MBOX is not set
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_SUN6I_MSGBOX=y
CONFIG_SPRD_MBOX=y
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_IOVA=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=y
# CONFIG_RPMSG_CTRL is not set
# CONFIG_RPMSG_NS is not set
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#
# CONFIG_SOUNDWIRE_QCOM is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_MAILBOX=y
CONFIG_APPLE_RTKIT=y
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_UART_ROUTING=y
CONFIG_ASPEED_P2A_CTRL=y
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
# CONFIG_DPAA2_CONSOLE is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# Hisilicon SoC drivers
#
# end of Hisilicon SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
# CONFIG_SOC_IMX9 is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

CONFIG_LOONGSON2_GUTS=y

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
CONFIG_MTK_REGULATOR_COUPLER=y
CONFIG_MTK_MMSYS=y
CONFIG_MTK_SVS=y
CONFIG_MTK_SOCINFO=y
# end of MediaTek SoC drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_COMMAND_DB=y
CONFIG_QCOM_GENI_SE=y
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_PDR_HELPERS=y
CONFIG_QCOM_PMIC_PDCHARGER_ULOG=y
CONFIG_QCOM_QMI_HELPERS=y
# CONFIG_QCOM_RAMP_CTRL is not set
# CONFIG_QCOM_RPM_MASTER_STATS is not set
# CONFIG_QCOM_RPMH is not set
CONFIG_QCOM_SMD_RPM=y
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
CONFIG_QCOM_APR=y
# CONFIG_QCOM_ICC_BWMON is not set
CONFIG_QCOM_PBS=y
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
CONFIG_ROCKCHIP_IODOMAIN=y
# CONFIG_SOC_SAMSUNG is not set
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
# CONFIG_SOC_TI is not set
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic PM Domains
#
CONFIG_MESON_GX_PM_DOMAINS=y
# CONFIG_MESON_EE_PM_DOMAINS is not set
# end of Amlogic PM Domains

# CONFIG_APPLE_PMGR_PWRSTATE is not set
CONFIG_ARM_SCMI_PERF_DOMAIN=y
CONFIG_ARM_SCMI_POWER_DOMAIN=y
CONFIG_ARM_SCPI_POWER_DOMAIN=y

#
# Broadcom PM Domains
#
# CONFIG_BCM2835_POWER is not set
CONFIG_BCM_PMB=y
# CONFIG_BCM63XX_POWER is not set
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
# CONFIG_IMX_GPCV2_PM_DOMAINS is not set
# end of i.MX PM Domains

#
# MediaTek PM Domains
#
CONFIG_MTK_SCPSYS=y
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
# end of MediaTek PM Domains

#
# Qualcomm PM Domains
#
CONFIG_QCOM_RPMPD=y
# end of Qualcomm PM Domains

CONFIG_ROCKCHIP_PM_DOMAINS=y
CONFIG_UX500_PM_DOMAIN=y
CONFIG_JH71XX_PMU=y
# CONFIG_SUN20I_PPU is not set
# end of PM Domains

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_ARM_IMX_BUS_DEVFREQ=y
CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=y
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PTN5150=y
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_EXTCON_USBC_CROS_EC is not set
CONFIG_EXTCON_USBC_TUSB320=y
CONFIG_EXTCON_RTK_TYPE_C=y
CONFIG_MEMORY=y
CONFIG_DDR=y
CONFIG_ATMEL_EBI=y
CONFIG_BRCMSTB_DPFE=y
CONFIG_BRCMSTB_MEMC=y
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_AEMIF is not set
CONFIG_TI_EMIF=y
CONFIG_OMAP_GPMC=y
CONFIG_OMAP_GPMC_DEBUG=y
CONFIG_FPGA_DFL_EMIF=y
# CONFIG_MVEBU_DEVBUS is not set
# CONFIG_FSL_CORENET_CF is not set
# CONFIG_FSL_IFC is not set
# CONFIG_JZ4780_NEMC is not set
# CONFIG_MTK_SMI is not set
# CONFIG_DA8XX_DDRCTL is not set
# CONFIG_RENESAS_RPCIF is not set
CONFIG_STM32_FMC2_EBI=y
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS5422_DMC=y
# CONFIG_EXYNOS_SROM is not set
# CONFIG_IIO is not set
CONFIG_NTB=y
CONFIG_NTB_IDT=y
CONFIG_NTB_SWITCHTEC=y
CONFIG_NTB_PINGPONG=y
CONFIG_NTB_TOOL=y
CONFIG_NTB_PERF=y
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_DEBUG=y
# CONFIG_PWM_APPLE is not set
CONFIG_PWM_ATMEL=y
CONFIG_PWM_ATMEL_TCB=y
CONFIG_PWM_BCM2835=y
# CONFIG_PWM_BERLIN is not set
CONFIG_PWM_BRCMSTB=y
CONFIG_PWM_CLK=y
CONFIG_PWM_CLPS711X=y
CONFIG_PWM_CROS_EC=y
CONFIG_PWM_DWC_CORE=y
CONFIG_PWM_DWC=y
# CONFIG_PWM_EP93XX is not set
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMX1 is not set
CONFIG_PWM_IMX27=y
# CONFIG_PWM_INTEL_LGM is not set
CONFIG_PWM_IQS620A=y
CONFIG_PWM_LP3943=y
# CONFIG_PWM_LPC18XX_SCT is not set
CONFIG_PWM_LPC32XX=y
CONFIG_PWM_LPSS=y
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_MTK_DISP=y
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_MICROCHIP_CORE=y
CONFIG_PWM_MXS=y
CONFIG_PWM_NTXEC=y
CONFIG_PWM_OMAP_DMTIMER=y
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_PXA is not set
CONFIG_PWM_RASPBERRYPI_POE=y
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
CONFIG_PWM_STI=y
CONFIG_PWM_STM32=y
CONFIG_PWM_STM32_LP=y
# CONFIG_PWM_SUNPLUS is not set
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=y
CONFIG_PWM_TIEHRPWM=y
CONFIG_PWM_VISCONTI=y
# CONFIG_PWM_VT8500 is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
CONFIG_JCORE_AIC=y
CONFIG_RENESAS_INTC_IRQPIN=y
CONFIG_RENESAS_IRQC=y
CONFIG_RENESAS_RZA1_IRQC=y
# CONFIG_RENESAS_RZG2L_IRQC is not set
CONFIG_SL28CPLD_INTC=y
CONFIG_TS4800_IRQ=y
# CONFIG_XILINX_INTC is not set
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
CONFIG_IMX_MU_MSI=y
CONFIG_STARFIVE_JH8100_INTC=y
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
CONFIG_MCHP_EIC=y
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=y
# CONFIG_RESET_ATH79 is not set
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
CONFIG_RESET_BRCMSTB=y
CONFIG_RESET_BRCMSTB_RESCAL=y
# CONFIG_RESET_GPIO is not set
CONFIG_RESET_HSDK=y
CONFIG_RESET_IMX7=y
# CONFIG_RESET_INTEL_GW is not set
CONFIG_RESET_K210=y
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUDIO_ARB=y
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_NUVOTON_MA35D1 is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=y
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_RASPBERRYPI=y
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_SUNPLUS=y
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SCI=y
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_TI_TPS380X is not set
# CONFIG_RESET_TN48M_CPLD is not set
CONFIG_RESET_UNIPHIER=y
CONFIG_RESET_UNIPHIER_GLUE=y
# CONFIG_RESET_ZYNQ is not set
CONFIG_RESET_STARFIVE_JH71X0=y
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_COMMON_RESET_HI3660=y
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_LPC18XX_USB_OTG=y
CONFIG_PHY_PISTACHIO_USB=y
# CONFIG_PHY_XGENE is not set
CONFIG_USB_LGM_PHY=y
CONFIG_PHY_CAN_TRANSCEIVER=y
# CONFIG_PHY_SUN4I_USB is not set
CONFIG_PHY_SUN9I_USB=y
CONFIG_PHY_SUN50I_USB3=y
CONFIG_PHY_MESON8_HDMI_TX=y
CONFIG_PHY_MESON8B_USB2=y
CONFIG_PHY_MESON_GXL_USB2=y
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=y
# CONFIG_PHY_MESON_G12A_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=y
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
CONFIG_PHY_CYGNUS_PCIE=y
# CONFIG_PHY_BCM_SR_USB is not set
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_BCM_NS_USB2=y
CONFIG_PHY_BCM_NS_USB3=y
# CONFIG_PHY_NS2_PCIE is not set
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=y
CONFIG_PHY_BCM_SR_PCIE=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_DPHY_RX=y
CONFIG_PHY_CADENCE_SALVO=y
CONFIG_PHY_FSL_IMX8MQ_USB=y
# CONFIG_PHY_MIXEL_LVDS_PHY is not set
CONFIG_PHY_MIXEL_MIPI_DPHY=y
CONFIG_PHY_FSL_IMX8M_PCIE=y
# CONFIG_PHY_FSL_LYNX_28G is not set
CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HI3660_USB=y
CONFIG_PHY_HI3670_USB=y
CONFIG_PHY_HI3670_PCIE=y
CONFIG_PHY_HISTB_COMBPHY=y
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_INGENIC_USB=y
CONFIG_PHY_LANTIQ_VRX200_PCIE=y
CONFIG_PHY_LANTIQ_RCU_USB2=y
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
CONFIG_PHY_BERLIN_SATA=y
CONFIG_PHY_BERLIN_USB=y
CONFIG_PHY_MVEBU_A3700_UTMI=y
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
CONFIG_PHY_MVEBU_CP110_UTMI=y
CONFIG_PHY_PXA_28NM_HSIC=y
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_PXA_USB=y
# CONFIG_PHY_MMP3_USB is not set
CONFIG_PHY_MMP3_HSIC=y
CONFIG_PHY_MTK_PCIE=y
CONFIG_PHY_MTK_XFI_TPHY=y
CONFIG_PHY_MTK_TPHY=y
# CONFIG_PHY_MTK_UFS is not set
CONFIG_PHY_MTK_XSPHY=y
CONFIG_PHY_MTK_MIPI_CSI_0_5=y
# CONFIG_PHY_MTK_DP is not set
# CONFIG_PHY_SPARX5_SERDES is not set
# CONFIG_PHY_LAN966X_SERDES is not set
CONFIG_PHY_MAPPHONE_MDM6600=y
# CONFIG_PHY_OCELOT_SERDES is not set
# CONFIG_PHY_ATH79_USB is not set
CONFIG_PHY_QCOM_IPQ4019_USB=y
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_QCOM_SNPS_EUSB2 is not set
CONFIG_PHY_QCOM_EUSB2_REPEATER=y
CONFIG_PHY_QCOM_M31_USB=y
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_QCOM_USB_HS_28NM=y
CONFIG_PHY_QCOM_USB_SS=y
CONFIG_PHY_QCOM_IPQ806X_USB=y
# CONFIG_PHY_QCOM_SGMII_ETH is not set
CONFIG_PHY_MT7621_PCI=y
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_RTK_RTD_USB2PHY=y
# CONFIG_PHY_RTK_RTD_USB3PHY is not set
# CONFIG_PHY_R8A779F0_ETHERNET_SERDES is not set
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=y
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
CONFIG_PHY_ROCKCHIP_PCIE=y
CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
CONFIG_PHY_EXYNOS_DP_VIDEO=y
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_EXYNOS_PCIE=y
CONFIG_PHY_SAMSUNG_UFS=y
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_UNIPHIER_USB2=y
CONFIG_PHY_UNIPHIER_USB3=y
CONFIG_PHY_UNIPHIER_PCIE=y
# CONFIG_PHY_UNIPHIER_AHCI is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=y
# CONFIG_PHY_STARFIVE_JH7110_PCIE is not set
# CONFIG_PHY_STARFIVE_JH7110_USB is not set
# CONFIG_PHY_SUNPLUS_USB is not set
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_DM816X_USB=y
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=y
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_ARM_SCMI_POWERCAP=y
# CONFIG_DTPM is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
CONFIG_ARM_CCN=y
CONFIG_ARM_CMN=y
# CONFIG_STARFIVE_STARLINK_PMU is not set
CONFIG_ARM_SMMU_V3_PMU=y
CONFIG_FSL_IMX8_DDR_PMU=y
CONFIG_XGENE_PMU=y
CONFIG_ARM_DMC620_PMU=y
# CONFIG_MARVELL_CN10K_TAD_PMU is not set
CONFIG_ALIBABA_UNCORE_DRW_PMU=y
CONFIG_HNS3_PMU=y
CONFIG_MARVELL_CN10K_DDR_PMU=y
# CONFIG_DWC_PCIE_PMU is not set
CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=y
# CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU is not set
CONFIG_AMPERE_CORESIGHT_PMU_ARCH_SYSTEM_PMU=y
CONFIG_MESON_DDR_PMU=y
CONFIG_CXL_PMU=y
# end of Performance monitor support

# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_LAYOUTS=y

#
# Layout Types
#
CONFIG_NVMEM_LAYOUT_SL28_VPD=y
CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
# end of Layout Types

CONFIG_NVMEM_APPLE_EFUSES=y
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_BRCM_NVRAM=y
# CONFIG_NVMEM_IMX_IIM is not set
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_IMX_OCOTP_ELE=y
CONFIG_NVMEM_JZ4780_EFUSE=y
CONFIG_NVMEM_LAN9662_OTPC=y
CONFIG_NVMEM_LAYERSCAPE_SFP=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MESON_MX_EFUSE=y
CONFIG_NVMEM_MICROCHIP_OTPC=y
CONFIG_NVMEM_MTK_EFUSE=y
CONFIG_NVMEM_MXS_OCOTP=y
CONFIG_NVMEM_NINTENDO_OTP=y
# CONFIG_NVMEM_QCOM_QFPROM is not set
CONFIG_NVMEM_QCOM_SEC_QFPROM=y
CONFIG_NVMEM_RAVE_SP_EEPROM=y
# CONFIG_NVMEM_RMEM is not set
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
CONFIG_NVMEM_ROCKCHIP_OTP=y
CONFIG_NVMEM_SC27XX_EFUSE=y
CONFIG_NVMEM_SNVS_LPGPR=y
CONFIG_NVMEM_SPMI_SDAM=y
CONFIG_NVMEM_SPRD_EFUSE=y
# CONFIG_NVMEM_STM32_ROMEM is not set
CONFIG_NVMEM_SUNPLUS_OCOTP=y
CONFIG_NVMEM_UNIPHIER_EFUSE=y
CONFIG_NVMEM_VF610_OCOTP=y
# CONFIG_NVMEM_QORIQ_EFUSE is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=y
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=y
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
CONFIG_HISI_PTT=y
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=y
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
# CONFIG_ALTERA_PR_IP_CORE is not set
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_ZYNQ_FPGA=y
CONFIG_FPGA_MGR_XILINX_CORE=y
CONFIG_FPGA_MGR_XILINX_SELECTMAP=y
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=y
# CONFIG_OF_FPGA_REGION is not set
CONFIG_FPGA_DFL=y
CONFIG_FPGA_DFL_FME=y
CONFIG_FPGA_DFL_FME_MGR=y
CONFIG_FPGA_DFL_FME_BRIDGE=y
CONFIG_FPGA_DFL_FME_REGION=y
# CONFIG_FPGA_DFL_AFU is not set
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=y
# CONFIG_FPGA_DFL_PCI is not set
CONFIG_FPGA_MGR_ZYNQMP_FPGA=y
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
CONFIG_FPGA_M10_BMC_SEC_UPDATE=y
CONFIG_FPGA_KUNIT_TESTS=y
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
# CONFIG_FSI_MASTER_GPIO is not set
CONFIG_FSI_MASTER_HUB=y
# CONFIG_FSI_MASTER_AST_CF is not set
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_MASTER_I2CR=y
CONFIG_FSI_SCOM=y
CONFIG_FSI_SBEFIFO=y
# CONFIG_FSI_OCC is not set
# CONFIG_I2CR_SCOM is not set
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_GPIO=y
# CONFIG_MUX_MMIO is not set
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
CONFIG_SLIM_QCOM_NGD_CTRL=y
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_104_QUAD_8=y
# CONFIG_FTM_QUADDEC is not set
CONFIG_INTERRUPT_CNT=y
# CONFIG_MICROCHIP_TCB_CAPTURE is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_STM32_TIMER_CNT is not set
CONFIG_TI_ECAP_CAPTURE=y
# CONFIG_TI_EQEP is not set
CONFIG_MOST=y
CONFIG_MOST_USB_HDM=y
CONFIG_MOST_CDEV=y
CONFIG_MOST_SND=y
CONFIG_PECI=y
CONFIG_PECI_CPU=y
# CONFIG_PECI_NPCM is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_FS_STACK=y
CONFIG_BUFFER_HEAD=y
CONFIG_LEGACY_DIRECT_IO=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_USE_FOR_EXT2 is not set
# CONFIG_EXT4_FS_POSIX_ACL is not set
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_EXT4_KUNIT_TESTS=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
# CONFIG_REISERFS_FS_POSIX_ACL is not set
# CONFIG_REISERFS_FS_SECURITY is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
# CONFIG_XFS_SUPPORT_ASCII_CI is not set
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=y
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_FS_REF_VERIFY=y
CONFIG_NILFS2_FS=y
# CONFIG_F2FS_FS is not set
# CONFIG_BCACHEFS_FS is not set
CONFIG_ZONEFS_FS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
# CONFIG_FUSE_PASSTHROUGH is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_XINO_AUTO=y
CONFIG_OVERLAY_FS_METACOPY=y
CONFIG_OVERLAY_FS_DEBUG=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
# CONFIG_NETFS_STATS is not set
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=y
CONFIG_CACHEFILES_DEBUG=y
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
CONFIG_CACHEFILES_ONDEMAND=y
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_FAT_KUNIT_TEST=y
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS3_FS=y
# CONFIG_NTFS3_64BIT_CLUSTER is not set
CONFIG_NTFS3_LZX_XPRESS=y
CONFIG_NTFS3_FS_POSIX_ACL=y
CONFIG_NTFS_FS=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
CONFIG_HFS_FS=y
CONFIG_HFSPLUS_FS=y
# CONFIG_BEFS_FS is not set
CONFIG_BFS_FS=y
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
CONFIG_SQUASHFS_DECOMP_MULTI=y
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT=y
CONFIG_SQUASHFS_MOUNT_DECOMP_THREADS=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
CONFIG_SQUASHFS_LZ4=y
# CONFIG_SQUASHFS_LZO is not set
# CONFIG_SQUASHFS_XZ is not set
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=y
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=y
CONFIG_QNX6FS_FS=y
CONFIG_QNX6FS_DEBUG=y
CONFIG_ROMFS_FS=y
CONFIG_ROMFS_BACKED_BY_BLOCK=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
# CONFIG_PSTORE_COMPRESS is not set
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=y
CONFIG_PSTORE_ZONE=y
CONFIG_PSTORE_BLK=y
CONFIG_PSTORE_BLK_BLKDEV=""
CONFIG_PSTORE_BLK_KMSG_SIZE=64
CONFIG_PSTORE_BLK_MAX_REASON=2
CONFIG_PSTORE_BLK_CONSOLE_SIZE=64
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=y
# CONFIG_UFS_FS_WRITE is not set
CONFIG_UFS_DEBUG=y
CONFIG_EROFS_FS=y
CONFIG_EROFS_FS_DEBUG=y
CONFIG_EROFS_FS_XATTR=y
# CONFIG_EROFS_FS_POSIX_ACL is not set
CONFIG_EROFS_FS_SECURITY=y
# CONFIG_EROFS_FS_ZIP is not set
CONFIG_EROFS_FS_ONDEMAND=y
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_NLS_UCS2_UTILS=y
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
# CONFIG_TRUSTED_KEYS_TEE is not set

#
# No trust source selected!
#
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
CONFIG_HARDENED_USERCOPY=y
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
# CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING is not set
CONFIG_SECURITY_APPARMOR=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY is not set
# CONFIG_SECURITY_APPARMOR_PARANOID_LOAD is not set
CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_LOADPIN_VERITY=y
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_SECURITY_LANDLOCK_KUNIT_TEST=y
# CONFIG_INTEGRITY is not set
CONFIG_DEFAULT_SECURITY_TOMOYO=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,tomoyo,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

#
# Hardening of kernel data structures
#
CONFIG_LIST_HARDENED=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Hardening of kernel data structures

CONFIG_CC_HAS_RANDSTRUCT=y
# CONFIG_RANDSTRUCT_NONE is not set
CONFIG_RANDSTRUCT_FULL=y
CONFIG_RANDSTRUCT=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=y
CONFIG_ASYNC_XOR=y
CONFIG_ASYNC_TX_DISABLE_PQ_VAL_DMA=y
CONFIG_ASYNC_TX_DISABLE_XOR_VAL_DMA=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_FIPS_NAME="Linux Kernel Cryptographic API"
# CONFIG_CRYPTO_FIPS_CUSTOM_VERSION is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_GENIV=y
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_2=y
# CONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_128 is not set
# CONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_1024 is not set
# CONFIG_CRYPTO_JITTERENTROPY_MEMSIZE_8192 is not set
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=64
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE=32
CONFIG_CRYPTO_JITTERENTROPY_OSR=1
# CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE is not set
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
# CONFIG_CRYPTO_USER_API_AEAD is not set
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# end of Userspace interface

#
# Accelerated Cryptographic Algorithms for CPU (powerpc)
#
CONFIG_CRYPTO_MD5_PPC=y
CONFIG_CRYPTO_SHA1_PPC=y
# end of Accelerated Cryptographic Algorithms for CPU (powerpc)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_ALLWINNER=y
# CONFIG_CRYPTO_DEV_SUN8I_CE is not set
# CONFIG_CRYPTO_DEV_SUN8I_SS is not set
# CONFIG_CRYPTO_DEV_SL3516 is not set
CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
CONFIG_CRYPTO_DEV_S5P=y
CONFIG_CRYPTO_DEV_NX=y
CONFIG_CRYPTO_DEV_NX_COMPRESS=y
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=y
CONFIG_CRYPTO_DEV_ATMEL_TDES=y
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4=y
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_ECB is not set
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_CTS=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU_HMAC_SHA224=y
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=y
CONFIG_CRYPTO_DEV_QAT_4XXX=y
CONFIG_CRYPTO_DEV_QAT_420XX=y
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=y
CONFIG_CRYPTO_DEV_QAT_C62XVF=y
# CONFIG_CRYPTO_DEV_QAT_ERROR_INJECTION is not set
CONFIG_CRYPTO_DEV_CAVIUM_ZIP=y
CONFIG_CRYPTO_DEV_QCE=y
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
CONFIG_CRYPTO_DEV_QCE_SHA=y
CONFIG_CRYPTO_DEV_QCE_AEAD=y
CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
CONFIG_CRYPTO_DEV_QCOM_RNG=y
CONFIG_CRYPTO_DEV_IMGTEC_HASH=y
CONFIG_CRYPTO_DEV_ZYNQMP_AES=y
CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=y
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
CONFIG_CRYPTO_DEV_CCREE=y
CONFIG_CRYPTO_DEV_HISI_SEC=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
CONFIG_CRYPTO_DEV_SA2UL=y
CONFIG_CRYPTO_DEV_ASPEED=y
CONFIG_CRYPTO_DEV_ASPEED_DEBUG=y
CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH=y
CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO=y
CONFIG_CRYPTO_DEV_ASPEED_ACRY=y
CONFIG_CRYPTO_DEV_JH7110=y
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
# CONFIG_XZ_DEC is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_CLOSURES=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_DMA_OPS_BYPASS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_DMA_DEFAULT_COHERENT=y
CONFIG_DMA_NEED_SYNC=y
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_API_DEBUG_SG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_MEMREMAP_COMPAT_ALIGN=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_STACKDEPOT_MAX_FRAMES=64
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
CONFIG_OBJAGG=y
# CONFIG_LWQ_TEST is not set
# end of Library routines

CONFIG_GENERIC_IOREMAP=y
CONFIG_POLYNOMIAL=y
CONFIG_FIRMWARE_TABLE=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_ULEB128=y
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=0
CONFIG_STRIP_ASM_SYMS=y
CONFIG_HEADERS_INSTALL=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
# CONFIG_VMLINUX_MAP is not set
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
# CONFIG_KGDB_SERIAL_CONSOLE is not set
# CONFIG_KGDB_TESTS is not set
CONFIG_KGDB_KDB=y
CONFIG_KDB_DEFAULT_ENABLE=0x1
# CONFIG_KDB_KEYBOARD is not set
CONFIG_KDB_CONTINUE_CATASTROPHIC=0
CONFIG_ARCH_HAS_UBSAN=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_UNREACHABLE is not set
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ENUM is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
CONFIG_KCSAN=y
CONFIG_CC_HAS_TSAN_COMPOUND_READ_BEFORE_WRITE=y
CONFIG_KCSAN_VERBOSE=y
CONFIG_KCSAN_SELFTEST=y
CONFIG_KCSAN_KUNIT_TEST=y
# CONFIG_KCSAN_EARLY_ENABLE is not set
CONFIG_KCSAN_NUM_WATCHPOINTS=64
CONFIG_KCSAN_UDELAY_TASK=80
CONFIG_KCSAN_UDELAY_INTERRUPT=20
# CONFIG_KCSAN_DELAY_RANDOMIZE is not set
CONFIG_KCSAN_SKIP_WATCH=4000
# CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE is not set
CONFIG_KCSAN_INTERRUPT_WATCHER=y
CONFIG_KCSAN_REPORT_ONCE_IN_MS=3000
# CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN is not set
# CONFIG_KCSAN_STRICT is not set
CONFIG_KCSAN_REPORT_VALUE_CHANGE_ONLY=y
# CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC is not set
CONFIG_KCSAN_IGNORE_ATOMICS=y
CONFIG_KCSAN_PERMISSIVE=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
CONFIG_NET_DEV_REFCNT_TRACKER=y
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_DEBUG_ON=y
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
CONFIG_DEBUG_OBJECTS_WORK=y
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_SHOOT_LAZIES=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
# CONFIG_DEBUG_VM_RB is not set
# CONFIG_DEBUG_VM_PGFLAGS is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_ARCH_DISABLE_KASAN_INLINE=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_KMSAN_COMPILER=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_LOCKUP_DETECTOR=y
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_HARDLOCKUP_DETECTOR_PERF is not set
# CONFIG_HARDLOCKUP_DETECTOR_BUDDY is not set
CONFIG_HARDLOCKUP_DETECTOR_ARCH=y
# CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_WQ_CPU_INTENSIVE_REPORT=y
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
CONFIG_PROVE_RAW_LOCK_NESTING=y
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
CONFIG_SCF_TORTURE_TEST=y
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CLOSURES=y
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_CPU_STALL_CPUTIME=y
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
# CONFIG_HWLAT_TRACER is not set
CONFIG_OSNOISE_TRACER=y
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
# CONFIG_UPROBE_EVENTS is not set
CONFIG_DYNAMIC_EVENTS=y
CONFIG_SYNTH_EVENTS=y
CONFIG_USER_EVENTS=y
# CONFIG_HIST_TRIGGERS is not set
CONFIG_TRACE_EVENT_INJECT=y
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=y
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_GCOV_PROFILE_FTRACE=y
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
CONFIG_EVENT_TRACE_STARTUP_TEST=y
# CONFIG_EVENT_TRACE_TEST_SYSCALLS is not set
CONFIG_RING_BUFFER_STARTUP_TEST=y
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_RV is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# powerpc Debugging
#
CONFIG_PPC_DISABLE_WERROR=y
CONFIG_PRINT_STACK_DEPTH=64
CONFIG_PPC_EMULATED_STATS=y
# CONFIG_CODE_PATCHING_SELFTEST is not set
# CONFIG_JUMP_LABEL_FEATURE_CHECKS is not set
# CONFIG_FTR_FIXUP_SELFTEST is not set
CONFIG_MSI_BITMAP_SELFTEST=y
CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y
CONFIG_PPC_RFI_SRR_DEBUG=y
CONFIG_XMON=y
CONFIG_XMON_DEFAULT=y
# CONFIG_XMON_DISASSEMBLY is not set
# CONFIG_XMON_DEFAULT_RO_MODE is not set
CONFIG_DEBUGGER=y
# CONFIG_BOOTX_TEXT is not set
CONFIG_PPC_EARLY_DEBUG=y
CONFIG_PPC_EARLY_DEBUG_RTAS_PANEL=y
# CONFIG_PPC_EARLY_DEBUG_RTAS_CONSOLE is not set
# CONFIG_PPC_EARLY_DEBUG_MAPLE is not set
# CONFIG_PPC_EARLY_DEBUG_PS3GELIC is not set
# CONFIG_PPC_EARLY_DEBUG_MEMCONS is not set
# CONFIG_PPC_EARLY_DEBUG_16550 is not set
# CONFIG_PPC_FAST_ENDIAN_SWITCH is not set
# end of powerpc Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
# CONFIG_KUNIT_FAULT_TEST is not set
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
# CONFIG_KUNIT_DEFAULT_ENABLED is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_PM_NOTIFIER_ERROR_INJECT=y
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_TEST_DHRY=y
CONFIG_LKDTM=y
CONFIG_CPUMASK_KUNIT_TEST=y
CONFIG_TEST_LIST_SORT=y
# CONFIG_TEST_MIN_HEAP is not set
CONFIG_TEST_SORT=y
# CONFIG_TEST_DIV64 is not set
CONFIG_TEST_IOV_ITER=y
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_TEST_REF_TRACKER=y
CONFIG_RBTREE_TEST=y
CONFIG_REED_SOLOMON_TEST=y
CONFIG_INTERVAL_TREE_TEST=y
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_TEST_HEXDUMP is not set
CONFIG_STRING_KUNIT_TEST=y
CONFIG_STRING_HELPERS_KUNIT_TEST=y
CONFIG_TEST_KSTRTOX=y
CONFIG_TEST_PRINTF=y
# CONFIG_TEST_SCANF is not set
CONFIG_TEST_BITMAP=y
CONFIG_TEST_UUID=y
CONFIG_TEST_XARRAY=y
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_PARMAN=y
CONFIG_TEST_BITOPS=y
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
# CONFIG_TEST_SYSCTL is not set
CONFIG_BITFIELD_KUNIT=y
CONFIG_CHECKSUM_KUNIT=y
CONFIG_HASH_KUNIT_TEST=y
CONFIG_RESOURCE_KUNIT_TEST=y
CONFIG_SYSCTL_KUNIT_TEST=y
CONFIG_LIST_KUNIT_TEST=y
CONFIG_HASHTABLE_KUNIT_TEST=y
CONFIG_LINEAR_RANGES_TEST=y
CONFIG_CMDLINE_KUNIT_TEST=y
CONFIG_BITS_TEST=y
CONFIG_SLUB_KUNIT_TEST=y
CONFIG_RATIONAL_KUNIT_TEST=y
CONFIG_MEMCPY_KUNIT_TEST=y
CONFIG_IS_SIGNED_TYPE_KUNIT_TEST=y
CONFIG_OVERFLOW_KUNIT_TEST=y
CONFIG_STACKINIT_KUNIT_TEST=y
CONFIG_FORTIFY_KUNIT_TEST=y
CONFIG_HW_BREAKPOINT_KUNIT_TEST=y
CONFIG_SIPHASH_KUNIT_TEST=y
CONFIG_TEST_UDELAY=y
# CONFIG_TEST_DEBUG_VIRTUAL is not set
CONFIG_TEST_MEMCAT_P=y
CONFIG_TEST_OBJAGG=y
CONFIG_TEST_MEMINIT=y
# CONFIG_TEST_FREE_PAGES is not set
CONFIG_TEST_FPU=y
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

#
# Documentation
#
CONFIG_WARN_MISSING_DOCUMENTS=y
# CONFIG_WARN_ABI_ERRORS is not set
# end of Documentation

--H37BPdoKH48m6v5L--
