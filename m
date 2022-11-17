Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F29B290A;
	Thu, 17 Nov 2022 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668717619; x=1700253619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNpj5SzJEfCmLosEOctx6HsqfwRBAOswzeKLyT+QXgw=;
  b=eB1bhwJ/lhzausoYLJN1xVEGGX4TY3+DZHbt4jAdQbsi2B65KyZHsEOp
   Lm77bnhRWciRikheQ5vW5xlnQQVG8buTlUMi/6yXyGrU24AhJXURj1CMS
   /Y2dBt7QG6EW+n2adUByZtYEbTb+5npfQyOzu1dB84KQoPoZvXHouHnEr
   VdjB0rsRPT4RsCH/o7E+vKdeM/aDMvTeHdAZs/U5T2Jm/tZXgnKEExAw8
   d+RNdLGf8vmv5UuTe62ik8lDlg+sxJKfACfH8kCoxvsjaIYjfKq3XNjuP
   rdc38aHJyDDsNyR7RGb7C+kMtPHOKpezSBppObvt5xkrkvqc6S9T7IDVM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314784952"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="314784952"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 12:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="814658874"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="814658874"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2022 12:40:12 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovlgB-0000cJ-1H;
	Thu, 17 Nov 2022 20:40:11 +0000
Date: Fri, 18 Nov 2022 04:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-tiny-v1r1 5/8] mm/slub.c:1656:61: warning: omitting the
 parameter name in a function definition is a C2x extension
Message-ID: <202211180453.CjV3IEFN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Is8vFBF1ovXf/jDd"
Content-Disposition: inline


--Is8vFBF1ovXf/jDd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-tiny-v1r1
head:   efe34cfc09185a1fe864b1fac237b7689ec7a980
commit: cb64c543de6e006f6c75f00f725f5d765c9f5ace [5/8] mm, slub: remove percpu slabs with CONFIG_SLUB_TINY
config: hexagon-randconfig-r016-20221117
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project bbe6bd724a6335e497c7edaed191d37a828d0390)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/commit/?id=cb64c543de6e006f6c75f00f725f5d765c9f5ace
        git remote add vbabka https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git
        git fetch --no-tags vbabka slub-tiny-v1r1
        git checkout cb64c543de6e006f6c75f00f725f5d765c9f5ace
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> mm/slub.c:1656:61: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline bool free_debug_processing(struct kmem_cache *, struct slab *,
                                                               ^
   mm/slub.c:1656:76: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline bool free_debug_processing(struct kmem_cache *, struct slab *,
                                                                              ^
   mm/slub.c:1657:8: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
           void *, void *, int *, unsigned long, depot_stack_handle_t) { return 1; }
                 ^
   mm/slub.c:1657:16: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
           void *, void *, int *, unsigned long, depot_stack_handle_t) { return 1; }
                         ^
   mm/slub.c:1657:23: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
           void *, void *, int *, unsigned long, depot_stack_handle_t) { return 1; }
                                ^
   mm/slub.c:1657:38: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
           void *, void *, int *, unsigned long, depot_stack_handle_t) { return 1; }
                                               ^
   mm/slub.c:1657:60: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
           void *, void *, int *, unsigned long, depot_stack_handle_t) { return 1; }
                                                                     ^
   mm/slub.c:2209:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
           unsigned int partial_slabs = 0;
                        ^
   mm/slub.c:210:20: warning: unused function 'slub_debug_orig_size' [-Wunused-function]
   static inline bool slub_debug_orig_size(struct kmem_cache *s)
                      ^
   mm/slub.c:1680:29: warning: unused function 'node_nr_slabs' [-Wunused-function]
   static inline unsigned long node_nr_slabs(struct kmem_cache_node *n)
                               ^
   16 warnings generated.


vim +1656 mm/slub.c

  1652	
  1653	static inline int alloc_debug_processing(struct kmem_cache *s,
  1654		struct slab *slab, void *object, int orig_size) { return 1; }
  1655	
> 1656	static inline bool free_debug_processing(struct kmem_cache *, struct slab *,
  1657		void *, void *, int *, unsigned long, depot_stack_handle_t) { return 1; }
  1658	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--Is8vFBF1ovXf/jDd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/hexagon 6.1.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project bbe6bd724a6335e497c7edaed191d37a828d0390)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=160000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=160000
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=160000
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_AUDIT=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
# CONFIG_FORCE_TASKS_RCU is not set
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
CONFIG_IKHEADERS=m

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
# CONFIG_CGROUPS is not set
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
# CONFIG_SYSFS_DEPRECATED_V2 is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
CONFIG_BUG=y
CONFIG_ELF_CORE=y
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
CONFIG_SIGNALFD=y
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

#
# Linux Kernel Configuration for Hexagon
#
CONFIG_HEXAGON=y
CONFIG_HEXAGON_PHYS_OFFSET=y
CONFIG_FRAME_POINTER=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_EARLY_PRINTK=y
CONFIG_MMU=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_GENERIC_BUG=y

#
# Machine selection
#
CONFIG_HEXAGON_COMET=y
CONFIG_HEXAGON_ARCH_VERSION=2
CONFIG_CMDLINE=""
CONFIG_SMP=y
CONFIG_NR_CPUS=6
# CONFIG_PAGE_SIZE_4KB is not set
CONFIG_PAGE_SIZE_16KB=y
# CONFIG_PAGE_SIZE_64KB is not set
# CONFIG_PAGE_SIZE_256KB is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
# end of Machine selection

#
# General architecture-dependent options
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_LTO_NONE=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_ARCH_NO_PREEMPT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
CONFIG_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS_NONE is not set
# CONFIG_MODULE_COMPRESS_GZIP is not set
CONFIG_MODULE_COMPRESS_XZ=y
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_DECOMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
CONFIG_AIX_PARTITION=y
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
# CONFIG_LDM_DEBUG is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
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
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="842"
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC=y
CONFIG_ZSWAP_ZPOOL_DEFAULT="zsmalloc"
# CONFIG_ZBUD is not set
CONFIG_Z3FOLD=y
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
# CONFIG_SLUB_CPU_PARTIAL is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_FLATMEM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
# CONFIG_USERFAULTFD is not set
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
# CONFIG_LRU_GEN_STATS is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_UNIX is not set
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=y
# CONFIG_INET is not set
CONFIG_NETWORK_SECMARK=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_ATM is not set
CONFIG_STP=m
CONFIG_BRIDGE=m
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
CONFIG_VLAN_8021Q=m
# CONFIG_VLAN_8021Q_GVRP is not set
# CONFIG_VLAN_8021Q_MVRP is not set
CONFIG_LLC=y
CONFIG_LLC2=m
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=y
CONFIG_IPDDP=y
# CONFIG_IPDDP_ENCAP is not set
CONFIG_X25=y
# CONFIG_LAPB is not set
CONFIG_PHONET=m
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
# CONFIG_IEEE802154_SOCKET is not set
# CONFIG_MAC802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=y
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=y
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=y
CONFIG_NET_SCH_SFQ=m
# CONFIG_NET_SCH_TEQL is not set
CONFIG_NET_SCH_TBF=m
CONFIG_NET_SCH_CBS=m
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_TAPRIO=m
# CONFIG_NET_SCH_GRED is not set
CONFIG_NET_SCH_DSMARK=y
CONFIG_NET_SCH_NETEM=y
# CONFIG_NET_SCH_DRR is not set
CONFIG_NET_SCH_MQPRIO=m
CONFIG_NET_SCH_SKBPRIO=y
# CONFIG_NET_SCH_CHOKE is not set
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=m
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=y
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=y
CONFIG_NET_SCH_FQ_PIE=m
CONFIG_NET_SCH_PLUG=m
CONFIG_NET_SCH_ETS=y
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_FW=y
# CONFIG_NET_CLS_U32 is not set
CONFIG_NET_CLS_RSVP=m
# CONFIG_NET_CLS_RSVP6 is not set
# CONFIG_NET_CLS_FLOW is not set
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
# CONFIG_NET_CLS_MATCHALL is not set
# CONFIG_NET_EMATCH is not set
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_DEBUG=y
CONFIG_BATMAN_ADV_TRACING=y
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
# CONFIG_NET_MPLS_GSO is not set
# CONFIG_NET_NSH is not set
CONFIG_HSR=y
# CONFIG_QRTR is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
# CONFIG_CAN_BCM is not set
# CONFIG_CAN_GW is not set
CONFIG_CAN_J1939=y
CONFIG_CAN_ISOTP=y
# CONFIG_BT is not set
CONFIG_MCTP=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
CONFIG_NL80211_TESTMODE=y
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
CONFIG_MAC80211_MESSAGE_TRACING=y
CONFIG_MAC80211_DEBUG_MENU=y
# CONFIG_MAC80211_NOINLINE is not set
# CONFIG_MAC80211_VERBOSE_DEBUG is not set
CONFIG_MAC80211_MLME_DEBUG=y
# CONFIG_MAC80211_STA_DEBUG is not set
# CONFIG_MAC80211_HT_DEBUG is not set
# CONFIG_MAC80211_OCB_DEBUG is not set
CONFIG_MAC80211_IBSS_DEBUG=y
# CONFIG_MAC80211_PS_DEBUG is not set
CONFIG_MAC80211_TDLS_DEBUG=y
CONFIG_MAC80211_DEBUG_COUNTERS=y
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_NFC is not set
CONFIG_PSAMPLE=y
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
# CONFIG_FAILOVER is not set
# CONFIG_ETHTOOL_NETLINK is not set

#
# Device Drivers
#
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#

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
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_AC97=m
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
CONFIG_BT1_APB=y
CONFIG_BT1_AXI=y
# CONFIG_INTEL_IXP4XX_EB is not set
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=m
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=m
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_MSG=y
# CONFIG_ARM_SCMI_TRANSPORT_MAILBOX is not set
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_VERSION1_COMPLIANCE is not set
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=m
CONFIG_ARM_SCMI_POWER_CONTROL=m
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_ARM_SCPI_POWER_DOMAIN=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_MTK_ADSP_IPC is not set
CONFIG_QCOM_SCM=m
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
CONFIG_BCM47XX_NVRAM=y
# CONFIG_BCM47XX_SPROM is not set
CONFIG_TEE_BNXT_FW=y
CONFIG_CS_DSP=m
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_IMX_DSP is not set
# CONFIG_IMX_SCU is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
# CONFIG_GNSS_USB is not set
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
# CONFIG_MTD_BCM63XX_PARTS is not set
CONFIG_MTD_BRCM_U_BOOT=m
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD_PARSER_IMAGETAG=y
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_QCOMSMEM_PARTS=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=y
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
CONFIG_SSFDC=m
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=m
CONFIG_MTD_SWAP=y
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=y
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_OTP=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
CONFIG_MTD_TS5500=m
# CONFIG_MTD_PCMCIA is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_DATAFLASH=m
# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
# CONFIG_MTD_DATAFLASH_OTP is not set
# CONFIG_MTD_MCHP23K256 is not set
CONFIG_MTD_MCHP48L640=m
CONFIG_MTD_SPEAR_SMI=m
CONFIG_MTD_SST25L=y
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_PHRAM=m
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=m

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=m
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
# CONFIG_MTD_ONENAND_GENERIC is not set
CONFIG_MTD_ONENAND_SAMSUNG=m
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_AMS_DELTA=m
CONFIG_MTD_NAND_SHARPSL=m
CONFIG_MTD_NAND_ATMEL=m
CONFIG_MTD_NAND_MARVELL=m
# CONFIG_MTD_NAND_SLC_LPC32XX is not set
CONFIG_MTD_NAND_MLC_LPC32XX=m
# CONFIG_MTD_NAND_BRCMNAND is not set
CONFIG_MTD_NAND_OXNAS=m
CONFIG_MTD_NAND_FSL_IFC=m
CONFIG_MTD_NAND_VF610_NFC=m
CONFIG_MTD_NAND_SH_FLCTL=m
# CONFIG_MTD_NAND_DAVINCI is not set
# CONFIG_MTD_NAND_TXX9NDFMC is not set
CONFIG_MTD_NAND_SUNXI=m
CONFIG_MTD_NAND_HISI504=m
CONFIG_MTD_NAND_QCOM=m
CONFIG_MTD_NAND_MTK=m
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_TEGRA=m
CONFIG_MTD_NAND_STM32_FMC2=m
# CONFIG_MTD_NAND_MESON is not set
CONFIG_MTD_NAND_GPIO=m
# CONFIG_MTD_NAND_PLATFORM is not set
CONFIG_MTD_NAND_CADENCE=m
# CONFIG_MTD_NAND_ARASAN is not set
CONFIG_MTD_NAND_INTEL_LGM=m
# CONFIG_MTD_NAND_RENESAS is not set

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_DISKONCHIP is not set
# CONFIG_MTD_SPI_NAND is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
CONFIG_MTD_NAND_ECC_MEDIATEK=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=m
# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
CONFIG_MTD_SPI_NOR_SWP_DISABLE=y
# CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
# CONFIG_SPI_HISI_SFC is not set
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
# CONFIG_MTD_UBI_GLUEBI is not set
CONFIG_MTD_UBI_BLOCK=y
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_PARPORT=y
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_AUTH=y
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=y
CONFIG_NVME_TARGET_FCLOOP=y
CONFIG_NVME_TARGET_AUTH=y
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_AD525X_DPOT_SPI=m
CONFIG_DUMMY_IRQ=m
CONFIG_ICS932S401=m
CONFIG_ATMEL_SSC=m
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_GEHC_ACHC=m
CONFIG_QCOM_COINCELL=y
CONFIG_QCOM_FASTRPC=m
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_LATTICE_ECP3_CONFIG=m
CONFIG_SRAM=y
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_HISI_HIKEY_USB is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
CONFIG_EEPROM_AT25=m
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=m
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_93XX46 is not set
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_SPI is not set
# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_ECHO=y
CONFIG_MISC_RTSX_USB=m
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=m
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=m
CONFIG_SCSI=m
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
# CONFIG_CHR_DEV_ST is not set
CONFIG_CHR_DEV_SG=m
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
# CONFIG_SCSI_FC_ATTRS is not set
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_BOOT_SYSFS=m
CONFIG_SCSI_FDOMAIN=m
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_VIRTIO=m
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
CONFIG_PCMCIA_AHA152X=m
CONFIG_PCMCIA_FDOMAIN=m
CONFIG_PCMCIA_NINJA_SCSI=m
CONFIG_PCMCIA_QLOGIC=m
CONFIG_PCMCIA_SYM53C500=m
# CONFIG_SCSI_DH is not set
# end of SCSI device support

# CONFIG_ATA is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
# CONFIG_MD_RAID1 is not set
# CONFIG_MD_RAID10 is not set
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
# CONFIG_MD_FAULTY is not set
CONFIG_BCACHE=m
# CONFIG_BCACHE_DEBUG is not set
CONFIG_BCACHE_CLOSURES_DEBUG=y
CONFIG_BCACHE_ASYNC_REGISTRATION=y
# CONFIG_BLK_DEV_DM is not set
# CONFIG_DM_AUDIT is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
# CONFIG_TCM_PSCSI is not set
CONFIG_LOOPBACK_TARGET=m

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_NETDEVICES is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
# CONFIG_INPUT_FF_MEMLESS is not set
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=m
# CONFIG_KEYBOARD_QT1050 is not set
CONFIG_KEYBOARD_QT1070=y
# CONFIG_KEYBOARD_QT2160 is not set
CONFIG_KEYBOARD_CLPS711X=m
CONFIG_KEYBOARD_DLINK_DIR685=m
CONFIG_KEYBOARD_LKKBD=m
# CONFIG_KEYBOARD_EP93XX is not set
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=m
CONFIG_KEYBOARD_TCA6416=y
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=m
CONFIG_KEYBOARD_LM8323=y
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=m
# CONFIG_KEYBOARD_IMX is not set
CONFIG_KEYBOARD_NEWTON=y
CONFIG_KEYBOARD_OPENCORES=m
# CONFIG_KEYBOARD_PINEPHONE is not set
CONFIG_KEYBOARD_PMIC8XXX=y
CONFIG_KEYBOARD_SAMSUNG=m
CONFIG_KEYBOARD_GOLDFISH_EVENTS=m
CONFIG_KEYBOARD_STOWAWAY=y
CONFIG_KEYBOARD_ST_KEYSCAN=y
# CONFIG_KEYBOARD_SUNKBD is not set
CONFIG_KEYBOARD_SH_KEYSC=m
# CONFIG_KEYBOARD_IQS62X is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=m
CONFIG_KEYBOARD_XTKBD=y
CONFIG_KEYBOARD_MT6779=m
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_KEYBOARD_CYPRESS_SF=m
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_APPLETOUCH=m
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
CONFIG_MOUSE_VSXXXAA=y
CONFIG_MOUSE_GPIO=m
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
CONFIG_MOUSE_SYNAPTICS_USB=y
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADC=m
# CONFIG_JOYSTICK_ADI is not set
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=m
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
CONFIG_JOYSTICK_IFORCE_232=m
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=m
CONFIG_JOYSTICK_TWIDJOY=m
CONFIG_JOYSTICK_ZHENHUA=m
CONFIG_JOYSTICK_DB9=y
# CONFIG_JOYSTICK_GAMECON is not set
# CONFIG_JOYSTICK_TURBOGRAFX is not set
# CONFIG_JOYSTICK_AS5011 is not set
# CONFIG_JOYSTICK_JOYDUMP is not set
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
CONFIG_JOYSTICK_XPAD_LEDS=y
# CONFIG_JOYSTICK_WALKERA0701 is not set
CONFIG_JOYSTICK_PSXPAD_SPI=m
# CONFIG_JOYSTICK_PSXPAD_SPI_FF is not set
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=m
CONFIG_JOYSTICK_FSIA6B=y
# CONFIG_JOYSTICK_SENSEHAT is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=y
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_LIBPS2=m
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=m
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_OLPC_APSP=m
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
# CONFIG_VT_CONSOLE is not set
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
# CONFIG_UNIX98_PTYS is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=m
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=m
CONFIG_SERIAL_8250_EM=m
# CONFIG_SERIAL_8250_IOC3 is not set
CONFIG_SERIAL_8250_RT288X=y
# CONFIG_SERIAL_8250_OMAP is not set
CONFIG_SERIAL_8250_MT6577=m
CONFIG_SERIAL_8250_UNIPHIER=m
CONFIG_SERIAL_8250_PXA=m
CONFIG_SERIAL_8250_TEGRA=m
CONFIG_SERIAL_8250_BCM7271=m

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=m
# CONFIG_SERIAL_ATMEL is not set
CONFIG_SERIAL_MESON=y
# CONFIG_SERIAL_MESON_CONSOLE is not set
CONFIG_SERIAL_CLPS711X=y
# CONFIG_SERIAL_CLPS711X_CONSOLE is not set
CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
# CONFIG_SERIAL_TEGRA is not set
CONFIG_SERIAL_TEGRA_TCU=y
CONFIG_SERIAL_TEGRA_TCU_CONSOLE=y
CONFIG_SERIAL_MAX3100=m
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_IMX=m
CONFIG_SERIAL_IMX_CONSOLE=m
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_MSM=m
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
CONFIG_SERIAL_LANTIQ=y
# CONFIG_SERIAL_LANTIQ_CONSOLE is not set
CONFIG_SERIAL_SCCNXP=m
CONFIG_SERIAL_SC16IS7XX=m
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
# CONFIG_SERIAL_SC16IS7XX_SPI is not set
# CONFIG_SERIAL_TIMBERDALE is not set
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_MXS_AUART=y
# CONFIG_SERIAL_MXS_AUART_CONSOLE is not set
# CONFIG_SERIAL_MPS2_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_ST_ASC=y
# CONFIG_SERIAL_ST_ASC_CONSOLE is not set
CONFIG_SERIAL_SPRD=m
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
CONFIG_SERIAL_MVEBU_UART=y
CONFIG_SERIAL_MVEBU_CONSOLE=y
CONFIG_SERIAL_OWL=y
# CONFIG_SERIAL_OWL_CONSOLE is not set
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_LITEUART is not set
CONFIG_SERIAL_SUNPLUS=y
# CONFIG_SERIAL_SUNPLUS_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=m
CONFIG_N_GSM=y
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
CONFIG_RPMSG_TTY=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
CONFIG_LP_CONSOLE=y
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=m
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
CONFIG_IPMI_KCS_BMC_SERIO=m
CONFIG_ASPEED_BT_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=m
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_BA431 is not set
# CONFIG_HW_RANDOM_BCM2835 is not set
# CONFIG_HW_RANDOM_IPROC_RNG200 is not set
CONFIG_HW_RANDOM_IXP4XX=m
CONFIG_HW_RANDOM_OMAP=m
CONFIG_HW_RANDOM_OMAP3_ROM=m
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_IMX_RNGC=m
# CONFIG_HW_RANDOM_NOMADIK is not set
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=m
CONFIG_HW_RANDOM_MTK=m
CONFIG_HW_RANDOM_EXYNOS=m
# CONFIG_HW_RANDOM_NPCM is not set
# CONFIG_HW_RANDOM_XIPHERA is not set

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# end of PCMCIA character devices

CONFIG_DEVMEM=y
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYUSB=y
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=m
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=m

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ASPEED=y
CONFIG_I2C_AT91=y
# CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL is not set
CONFIG_I2C_AXXIA=m
CONFIG_I2C_BCM2835=m
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=y
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DAVINCI=m
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DIGICOLOR=y
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_HIGHLANDER=m
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_IOP3XX=y
CONFIG_I2C_JZ4780=m
CONFIG_I2C_MESON=y
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=m
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
CONFIG_I2C_NPCM=y
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
CONFIG_I2C_APPLE=y
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_PNX=m
CONFIG_I2C_PXA=m
CONFIG_I2C_PXA_SLAVE=y
CONFIG_I2C_QCOM_CCI=y
# CONFIG_I2C_QUP is not set
CONFIG_I2C_RIIC=y
CONFIG_I2C_RZV2M=m
# CONFIG_I2C_S3C2410 is not set
CONFIG_I2C_SH_MOBILE=m
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_SPRD is not set
# CONFIG_I2C_ST is not set
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=m
CONFIG_I2C_SUN6I_P2WI=y
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_WMT=m
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=y
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
CONFIG_I2C_DLN2=y
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=m
# CONFIG_DW_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=m
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
CONFIG_SPI_AR934X=m
CONFIG_SPI_ATH79=y
CONFIG_SPI_ARMADA_3700=y
# CONFIG_SPI_AT91_USART is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BCM2835 is not set
CONFIG_SPI_BCM2835AUX=m
CONFIG_SPI_BCM63XX=y
CONFIG_SPI_BCM63XX_HSSPI=y
CONFIG_SPI_BCM_QSPI=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=m
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_CADENCE_XSPI is not set
CONFIG_SPI_CLPS711X=m
# CONFIG_SPI_DESIGNWARE is not set
CONFIG_SPI_DLN2=y
CONFIG_SPI_EP93XX=y
CONFIG_SPI_FSL_LPSPI=y
# CONFIG_SPI_FSL_QUADSPI is not set
# CONFIG_SPI_GXP is not set
CONFIG_SPI_HISI_KUNPENG=y
CONFIG_SPI_HISI_SFC_V3XX=y
CONFIG_SPI_NXP_FLEXSPI=y
CONFIG_SPI_GPIO=y
CONFIG_SPI_IMG_SPFI=y
CONFIG_SPI_IMX=m
CONFIG_SPI_INGENIC=m
CONFIG_SPI_INTEL=m
CONFIG_SPI_INTEL_PLATFORM=m
CONFIG_SPI_LM70_LLP=y
CONFIG_SPI_LP8841_RTC=y
CONFIG_SPI_FSL_DSPI=m
CONFIG_SPI_MESON_SPICC=y
# CONFIG_SPI_MESON_SPIFC is not set
CONFIG_SPI_MICROCHIP_CORE=m
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
CONFIG_SPI_MT65XX=m
CONFIG_SPI_MT7621=y
# CONFIG_SPI_MTK_NOR is not set
# CONFIG_SPI_MTK_SNFI is not set
# CONFIG_SPI_NPCM_PSPI is not set
CONFIG_SPI_LANTIQ_SSC=m
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_OMAP24XX=m
# CONFIG_SPI_TI_QSPI is not set
# CONFIG_SPI_OMAP_100K is not set
CONFIG_SPI_ORION=m
CONFIG_SPI_PIC32=y
CONFIG_SPI_PIC32_SQI=y
CONFIG_SPI_PXA2XX=y
CONFIG_SPI_ROCKCHIP=m
CONFIG_SPI_ROCKCHIP_SFC=m
# CONFIG_SPI_RSPI is not set
CONFIG_SPI_QUP=y
# CONFIG_SPI_S3C64XX is not set
# CONFIG_SPI_SC18IS602 is not set
CONFIG_SPI_SH_MSIOF=y
CONFIG_SPI_SH=y
CONFIG_SPI_SH_HSPI=y
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SLAVE_MT27XX=y
# CONFIG_SPI_SPRD is not set
CONFIG_SPI_SPRD_ADI=m
CONFIG_SPI_STM32=y
CONFIG_SPI_ST_SSC4=y
CONFIG_SPI_SUN4I=m
CONFIG_SPI_SUN6I=m
# CONFIG_SPI_SUNPLUS_SP7021 is not set
CONFIG_SPI_SYNQUACER=m
CONFIG_SPI_MXIC=m
CONFIG_SPI_TEGRA210_QUAD=y
# CONFIG_SPI_TEGRA114 is not set
CONFIG_SPI_TEGRA20_SFLASH=y
CONFIG_SPI_TEGRA20_SLINK=m
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=y
CONFIG_SPI_XLP=y
CONFIG_SPI_XTENSA_XTFPGA=m
CONFIG_SPI_ZYNQ_QSPI=m
CONFIG_SPI_ZYNQMP_GQSPI=m
CONFIG_SPI_AMD=y

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=m

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_LOOPBACK_TEST=m
CONFIG_SPI_TLE62X0=m
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_ATH79=m
CONFIG_GPIO_CLPS711X=m
# CONFIG_GPIO_DWAPB is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_HISI=y
CONFIG_GPIO_IOP=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_MXC=y
CONFIG_GPIO_MXS=y
# CONFIG_GPIO_PXA is not set
CONFIG_GPIO_RCAR=m
CONFIG_GPIO_ROCKCHIP=m
CONFIG_GPIO_XGENE_SB=m
CONFIG_GPIO_XLP=y
CONFIG_GPIO_AMD_FCH=y
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=y
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_BD9571MWV=y
CONFIG_GPIO_DA9052=y
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
# CONFIG_GPIO_MAX77620 is not set
CONFIG_GPIO_MAX77650=y
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_SL28CPLD=y
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_TQMX86=m
CONFIG_GPIO_TWL6040=y
CONFIG_GPIO_UCB1400=m
CONFIG_GPIO_WM8350=m
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=m
CONFIG_GPIO_MAX7301=y
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=y
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=m

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=m
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_MXC=m
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=y
# CONFIG_POWER_RESET_BRCMKONA is not set
CONFIG_POWER_RESET_BRCMSTB=y
CONFIG_POWER_RESET_OCELOT_RESET=y
# CONFIG_POWER_RESET_MT6323 is not set
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_RESET_KEYSTONE=y
CONFIG_POWER_RESET_RMOBILE=m
CONFIG_POWER_RESET_SC27XX=m
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
CONFIG_GENERIC_ADC_BATTERY=m
# CONFIG_IP5XXX_POWER is not set
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
# CONFIG_BATTERY_ACT8945A is not set
# CONFIG_BATTERY_CPCAP is not set
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_INGENIC=m
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=m
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_DA9150 is not set
CONFIG_CHARGER_AXP20X=m
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=y
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
# CONFIG_CHARGER_CPCAP is not set
CONFIG_CHARGER_ISP1704=m
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77650=y
CONFIG_CHARGER_MAX77693=m
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_MAX8998=y
CONFIG_CHARGER_MT6360=m
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
# CONFIG_CHARGER_SMB347 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_FUEL_GAUGE_SC27XX is not set
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7314=y
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=m
# CONFIG_SENSORS_ADT7310 is not set
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ARM_SCMI is not set
CONFIG_SENSORS_ARM_SCPI=m
CONFIG_SENSORS_ASB100=y
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_BT1_PVT is not set
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DA9052_ADC=m
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_IIO_HWMON=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LAN966X=y
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=m
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2947_SPI=m
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=m
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=y
CONFIG_SENSORS_LTC4222=y
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX1111=y
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
CONFIG_SENSORS_MAX6620=y
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
CONFIG_SENSORS_MR75203=y
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM70=y
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=y
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=y
# CONFIG_SENSORS_PECI_CPUTEMP is not set
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
CONFIG_SENSORS_FSP_3Y=m
CONFIG_SENSORS_IBM_CFFPS=m
# CONFIG_SENSORS_DPS920AB is not set
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
# CONFIG_SENSORS_IR38064 is not set
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
CONFIG_SENSORS_LT7182S=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
CONFIG_SENSORS_MAX20730=m
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_MP2888=m
CONFIG_SENSORS_MP2975=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_PIM4328=m
# CONFIG_SENSORS_PLI1209BC is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
CONFIG_SENSORS_Q54SJ108A2=m
CONFIG_SENSORS_STPDDC60=m
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE152=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_PWM_FAN=m
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
CONFIG_SENSORS_SL28CPLD=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=y
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=m
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SMM665=y
CONFIG_SENSORS_ADC128D818=y
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_ADS7871 is not set
# CONFIG_SENSORS_AMC6821 is not set
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=y
CONFIG_SENSORS_TMP513=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM8350 is not set
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=m
# CONFIG_DA9063_WATCHDOG is not set
# CONFIG_DA9062_WATCHDOG is not set
CONFIG_MENF21BMC_WATCHDOG=y
# CONFIG_WM8350_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=m
# CONFIG_ZIIRAVE_WATCHDOG is not set
CONFIG_SL28CPLD_WATCHDOG=y
# CONFIG_ARMADA_37XX_WATCHDOG is not set
CONFIG_AT91RM9200_WATCHDOG=m
CONFIG_AT91SAM9X_WATCHDOG=y
# CONFIG_SAMA5D4_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=m
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_EP93XX_WATCHDOG=m
CONFIG_OMAP_WATCHDOG=y
# CONFIG_PNX4008_WATCHDOG is not set
# CONFIG_DAVINCI_WATCHDOG is not set
CONFIG_K3_RTI_WATCHDOG=m
CONFIG_RN5T618_WATCHDOG=m
# CONFIG_SUNXI_WATCHDOG is not set
# CONFIG_NPCM7XX_WATCHDOG is not set
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
CONFIG_MAX77620_WATCHDOG=y
# CONFIG_IMX2_WDT is not set
CONFIG_IMX7ULP_WDT=y
# CONFIG_MOXART_WDT is not set
# CONFIG_TEGRA_WATCHDOG is not set
CONFIG_QCOM_WDT=m
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
CONFIG_MEDIATEK_WATCHDOG=m
# CONFIG_DIGICOLOR_WATCHDOG is not set
CONFIG_LPC18XX_WATCHDOG=y
CONFIG_RENESAS_WDT=m
CONFIG_RENESAS_RZAWDT=y
# CONFIG_RENESAS_RZN1WDT is not set
CONFIG_RENESAS_RZG2LWDT=m
# CONFIG_ASPEED_WATCHDOG is not set
# CONFIG_REALTEK_OTTO_WDT is not set
# CONFIG_SPRD_WATCHDOG is not set
CONFIG_VISCONTI_WATCHDOG=y
CONFIG_MSC313E_WATCHDOG=m
CONFIG_APPLE_WATCHDOG=m
CONFIG_SUNPLUS_WATCHDOG=y
CONFIG_SC520_WDT=y
CONFIG_BCM47XX_WDT=y
# CONFIG_BCM_KONA_WDT is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
CONFIG_MPC5200_WDT=y
# CONFIG_MEN_A21_WDT is not set
CONFIG_UML_WATCHDOG=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=m
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_HOST_SOC=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_SUN4I_GPADC=m
CONFIG_MFD_AS3711=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_AT91_USART=m
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_MADERA is not set
# CONFIG_MFD_ASIC3 is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=m
CONFIG_MFD_DLN2=y
CONFIG_MFD_ENE_KB3930=m
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=m
CONFIG_MFD_MXS_LRADC=m
CONFIG_MFD_MX25_TSADC=y
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=m
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=m
CONFIG_MFD_MAX77693=m
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=m
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=m
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=m
CONFIG_MFD_OCELOT=y
CONFIG_EZX_PCAP=y
CONFIG_MFD_CPCAP=m
CONFIG_MFD_VIPERBOARD=m
CONFIG_MFD_NTXEC=m
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
CONFIG_UCB1400_CORE=m
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_SY7636A=m
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SEC_CORE=m
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=m
# CONFIG_MFD_SL28CPLD is not set
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SC27XX_PMIC=y
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
CONFIG_MFD_LP3943=m
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=m
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TI_LP873X=m
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS65912_SPI=m
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_ARIZONA_SPI=m
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
CONFIG_MFD_STW481X=m
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_MFD_STMFX=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_KHADAS_MCU=m
# CONFIG_MFD_ACER_A500_EC is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_88PM800=m
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_ARIZONA_LDO1=m
# CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
CONFIG_REGULATOR_AS3711=m
# CONFIG_REGULATOR_ATC260X is not set
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=y
CONFIG_REGULATOR_BD9571MWV=m
# CONFIG_REGULATOR_CPCAP is not set
CONFIG_REGULATOR_DA9052=m
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=m
# CONFIG_REGULATOR_ISL6271A is not set
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=m
CONFIG_REGULATOR_LTC3589=y
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=y
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX77650 is not set
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX20086=m
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=m
CONFIG_REGULATOR_MAX77802=m
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_MT6323=m
# CONFIG_REGULATOR_MT6331 is not set
CONFIG_REGULATOR_MT6332=m
CONFIG_REGULATOR_MT6358=m
CONFIG_REGULATOR_MT6359=m
CONFIG_REGULATOR_MT6360=m
CONFIG_REGULATOR_MT6397=m
CONFIG_REGULATOR_PBIAS=m
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCAP=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=m
# CONFIG_REGULATOR_QCOM_RPMH is not set
CONFIG_REGULATOR_QCOM_SMD_RPM=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=m
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT4801=m
# CONFIG_REGULATOR_RT4831 is not set
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=m
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=m
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=m
# CONFIG_REGULATOR_S5M8767 is not set
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_STM32_BOOSTER=m
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_TI_ABB=m
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SY7636A=m
CONFIG_REGULATOR_SY8106A=m
# CONFIG_REGULATOR_SY8824X is not set
# CONFIG_REGULATOR_SY8827N is not set
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS62360=m
CONFIG_REGULATOR_TPS65023=y
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6524X=m
# CONFIG_REGULATOR_TPS65910 is not set
# CONFIG_REGULATOR_TPS65912 is not set
# CONFIG_REGULATOR_TPS68470 is not set
CONFIG_REGULATOR_WM8350=m
CONFIG_REGULATOR_WM8400=y
CONFIG_REGULATOR_WM8994=m
CONFIG_REGULATOR_QCOM_LABIBB=m
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=y
CONFIG_IR_JVC_DECODER=m
# CONFIG_IR_MCE_KBD_DECODER is not set
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=y
# CONFIG_IR_RCMM_DECODER is not set
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_XMP_DECODER=m
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=y
CONFIG_IR_FINTEK=y
CONFIG_IR_GPIO_CIR=m
# CONFIG_IR_HIX5HD2 is not set
CONFIG_IR_IGORPLUGUSB=m
CONFIG_IR_IGUANA=m
CONFIG_IR_IMON=m
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_ITE_CIR is not set
CONFIG_IR_MCEUSB=y
CONFIG_IR_MESON=m
# CONFIG_IR_MESON_TX is not set
CONFIG_IR_MTK=m
# CONFIG_IR_NUVOTON is not set
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_RX51=y
CONFIG_IR_SERIAL=m
# CONFIG_IR_SERIAL_TRANSMITTER is not set
CONFIG_IR_STREAMZAP=m
CONFIG_IR_SUNXI=y
CONFIG_IR_TOY=m
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=y
CONFIG_RC_ATI_REMOTE=y
CONFIG_RC_LOOPBACK=m
CONFIG_RC_ST=y
CONFIG_RC_XBOX_DVD=y
CONFIG_IR_IMG=m
# CONFIG_IR_IMG_RAW is not set
CONFIG_IR_IMG_HW=y
CONFIG_IR_IMG_NEC=y
# CONFIG_IR_IMG_JVC is not set
CONFIG_IR_IMG_SONY=y
# CONFIG_IR_IMG_SHARP is not set
CONFIG_IR_IMG_SANYO=y
# CONFIG_IR_IMG_RC5 is not set
# CONFIG_IR_IMG_RC6 is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_IMX_IPUV3_CORE=y
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CLPS711X is not set
CONFIG_FB_IMX=m
# CONFIG_FB_ARC is not set
CONFIG_FB_PVR2=m
# CONFIG_FB_OPENCORES is not set
CONFIG_FB_S1D13XXX=m
# CONFIG_FB_PXA168 is not set
CONFIG_FB_W100=m
# CONFIG_FB_SH_MOBILE_LCDC is not set
# CONFIG_FB_TMIO is not set
CONFIG_FB_S3C=m
CONFIG_FB_S3C_DEBUG_REGWRITE=y
CONFIG_FB_SM501=m
CONFIG_FB_SMSCUFX=m
CONFIG_FB_UDL=m
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_DA8XX=m
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=m
CONFIG_FB_BROADSHEET=m
CONFIG_FB_SIMPLE=m
CONFIG_FB_SSD1307=m
CONFIG_MMP_DISP=m
CONFIG_MMP_DISP_CONTROLLER=y
# CONFIG_MMP_DISP_SPI is not set
CONFIG_MMP_PANEL_TPOHVGA=y
CONFIG_MMP_FB=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_L4F00242T03=y
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=m
CONFIG_LCD_ILI9320=y
# CONFIG_LCD_TDO24M is not set
CONFIG_LCD_VGG2432A4=y
# CONFIG_LCD_PLATFORM is not set
# CONFIG_LCD_AMS369FG06 is not set
CONFIG_LCD_LMS501KF03=y
# CONFIG_LCD_HX8357 is not set
CONFIG_LCD_OTM3225A=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=m
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_PWM=y
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=m
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_LM3630A=y
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
CONFIG_BACKLIGHT_AS3711=m
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=m
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# end of Console display driver support

CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=m
CONFIG_SND_PCM_OSS=m
# CONFIG_SND_PCM_OSS_PLUGINS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
# CONFIG_SND_PROC_FS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_CTL_LED=m
CONFIG_SND_SEQUENCER=m
# CONFIG_SND_SEQ_DUMMY is not set
# CONFIG_SND_SEQUENCER_OSS is not set
# CONFIG_SND_SEQ_HRTIMER_DEFAULT is not set
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=m
CONFIG_SND_ALOOP=m
CONFIG_SND_VIRMIDI=m
# CONFIG_SND_MTPAV is not set
# CONFIG_SND_MTS64 is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=m
CONFIG_SND_PORTMAN2X4=m
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_GENERIC_LEDS=y
CONFIG_SND_HDA_HWDEP=y
# CONFIG_SND_HDA_RECONFIG is not set
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=1
# CONFIG_SND_HDA_PATCH_LOADER is not set
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_VIA=m
# CONFIG_SND_HDA_CODEC_HDMI is not set
# CONFIG_SND_HDA_CODEC_CIRRUS is not set
# CONFIG_SND_HDA_CODEC_CS8409 is not set
# CONFIG_SND_HDA_CODEC_CONEXANT is not set
# CONFIG_SND_HDA_CODEC_CA0110 is not set
CONFIG_SND_HDA_CODEC_CA0132=m
# CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
CONFIG_SND_HDA_CODEC_CMEDIA=m
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_SPI=y
CONFIG_SND_AT73C213=m
CONFIG_SND_AT73C213_TARGET_BITRATE=48000
CONFIG_SND_USB=y
# CONFIG_SND_USB_AUDIO is not set
CONFIG_SND_USB_UA101=m
CONFIG_SND_USB_CAIAQ=m
# CONFIG_SND_USB_CAIAQ_INPUT is not set
CONFIG_SND_USB_US122L=m
CONFIG_SND_USB_6FIRE=m
# CONFIG_SND_USB_HIFACE is not set
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
# CONFIG_SND_USB_TONEPORT is not set
CONFIG_SND_USB_VARIAX=m
# CONFIG_SND_PCMCIA is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
# CONFIG_SND_SOC_ADI is not set
# CONFIG_SND_SOC_AMD_ACP is not set
CONFIG_SND_AMD_ACP_CONFIG=m
# CONFIG_SND_SOC_APPLE_MCA is not set
CONFIG_SND_ATMEL_SOC=m
CONFIG_SND_ATMEL_SOC_PDC=y
CONFIG_SND_ATMEL_SOC_DMA=y
CONFIG_SND_ATMEL_SOC_SSC=m
CONFIG_SND_ATMEL_SOC_SSC_PDC=m
# CONFIG_SND_ATMEL_SOC_SSC_DMA is not set
# CONFIG_SND_AT91_SOC_SAM9G20_WM8731 is not set
# CONFIG_SND_ATMEL_SOC_WM8904 is not set
# CONFIG_SND_AT91_SOC_SAM9X5_WM8731 is not set
CONFIG_SND_ATMEL_SOC_CLASSD=m
CONFIG_SND_BCM2835_SOC_I2S=m
CONFIG_SND_SOC_CYGNUS=m
CONFIG_SND_BCM63XX_I2S_WHISTLER=m
# CONFIG_SND_EP93XX_SOC is not set
CONFIG_SND_DESIGNWARE_I2S=m
CONFIG_SND_DESIGNWARE_PCM=y

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=m
CONFIG_SND_SOC_FSL_SAI=m
CONFIG_SND_SOC_FSL_MQS=m
CONFIG_SND_SOC_FSL_AUDMIX=m
CONFIG_SND_SOC_FSL_SSI=m
CONFIG_SND_SOC_FSL_SPDIF=m
CONFIG_SND_SOC_FSL_ESAI=m
# CONFIG_SND_SOC_FSL_MICFIL is not set
CONFIG_SND_SOC_FSL_EASRC=m
CONFIG_SND_SOC_FSL_XCVR=m
CONFIG_SND_SOC_FSL_AUD2HTX=m
CONFIG_SND_SOC_FSL_UTILS=m
CONFIG_SND_SOC_FSL_RPMSG=m
CONFIG_SND_SOC_IMX_PCM_DMA=m
CONFIG_SND_SOC_IMX_AUDIO_RPMSG=m
CONFIG_SND_SOC_IMX_PCM_RPMSG=m
CONFIG_SND_SOC_IMX_AUDMUX=m
CONFIG_SND_IMX_SOC=m

#
# SoC Audio support for Freescale i.MX boards:
#
CONFIG_SND_SOC_IMX_SPDIF=m
CONFIG_SND_SOC_IMX_AUDMIX=m
CONFIG_SND_SOC_IMX_HDMI=m
CONFIG_SND_SOC_IMX_RPMSG=m
# end of SoC Audio for Freescale CPUs

# CONFIG_SND_I2S_HI6210_I2S is not set
# CONFIG_SND_JZ4740_SOC_I2S is not set
# CONFIG_SND_KIRKWOOD_SOC is not set
# CONFIG_SND_SOC_IMG is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
CONFIG_SND_SOC_INTEL_KEEMBAY=m
CONFIG_SND_SOC_MEDIATEK=m
CONFIG_SND_SOC_MT8186=m
CONFIG_SND_SOC_MTK_BTCVSD=m
CONFIG_SND_SOC_MT8195=m

#
# ASoC support for Amlogic platforms
#
CONFIG_SND_MESON_AIU=m
CONFIG_SND_MESON_AXG_FIFO=m
CONFIG_SND_MESON_AXG_FRDDR=m
CONFIG_SND_MESON_AXG_TODDR=m
CONFIG_SND_MESON_AXG_TDM_FORMATTER=m
CONFIG_SND_MESON_AXG_TDM_INTERFACE=m
CONFIG_SND_MESON_AXG_TDMIN=m
# CONFIG_SND_MESON_AXG_TDMOUT is not set
CONFIG_SND_MESON_AXG_SOUND_CARD=m
# CONFIG_SND_MESON_AXG_SPDIFOUT is not set
CONFIG_SND_MESON_AXG_SPDIFIN=m
CONFIG_SND_MESON_AXG_PDM=m
CONFIG_SND_MESON_CARD_UTILS=m
CONFIG_SND_MESON_CODEC_GLUE=m
CONFIG_SND_MESON_GX_SOUND_CARD=m
CONFIG_SND_MESON_G12A_TOACODEC=m
# CONFIG_SND_MESON_G12A_TOHDMITX is not set
CONFIG_SND_SOC_MESON_T9015=m
# end of ASoC support for Amlogic platforms

# CONFIG_SND_MXS_SOC is not set
# CONFIG_SND_PXA2XX_SOC is not set
CONFIG_SND_SOC_QCOM=m
CONFIG_SND_SOC_LPASS_CPU=m
CONFIG_SND_SOC_LPASS_PLATFORM=m
CONFIG_SND_SOC_LPASS_IPQ806X=m
CONFIG_SND_SOC_LPASS_APQ8016=m
CONFIG_SND_SOC_STORM=m
CONFIG_SND_SOC_APQ8016_SBC=m
CONFIG_SND_SOC_QCOM_COMMON=m
CONFIG_SND_SOC_QDSP6_COMMON=m
CONFIG_SND_SOC_QDSP6_CORE=m
CONFIG_SND_SOC_QDSP6_AFE=m
CONFIG_SND_SOC_QDSP6_AFE_DAI=m
CONFIG_SND_SOC_QDSP6_AFE_CLOCKS=m
CONFIG_SND_SOC_QDSP6_ADM=m
CONFIG_SND_SOC_QDSP6_ROUTING=m
CONFIG_SND_SOC_QDSP6_ASM=m
CONFIG_SND_SOC_QDSP6_ASM_DAI=m
CONFIG_SND_SOC_QDSP6_APM_DAI=m
CONFIG_SND_SOC_QDSP6_APM_LPASS_DAI=m
CONFIG_SND_SOC_QDSP6_APM=m
CONFIG_SND_SOC_QDSP6_PRM_LPASS_CLOCKS=m
CONFIG_SND_SOC_QDSP6_PRM=m
CONFIG_SND_SOC_QDSP6=m
CONFIG_SND_SOC_MSM8996=m
# CONFIG_SND_SOC_SC7180 is not set
# CONFIG_SND_SOC_ROCKCHIP is not set
CONFIG_SND_SOC_SAMSUNG=m
CONFIG_SND_S3C24XX_I2S=m
CONFIG_SND_SAMSUNG_PCM=m
CONFIG_SND_SAMSUNG_SPDIF=m
CONFIG_SND_SAMSUNG_I2S=m
CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753=m
CONFIG_SND_SOC_SAMSUNG_SMDK_WM8580=m
# CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994 is not set
CONFIG_SND_SOC_SAMSUNG_S3C24XX_UDA134X=m
CONFIG_SND_SOC_SAMSUNG_SIMTEC=m
CONFIG_SND_SOC_SAMSUNG_SIMTEC_TLV320AIC23=m
# CONFIG_SND_SOC_SAMSUNG_SIMTEC_HERMES is not set
# CONFIG_SND_SOC_SAMSUNG_H1940_UDA1380 is not set
CONFIG_SND_SOC_SAMSUNG_RX1950_UDA1380=m
CONFIG_SND_SOC_SMARTQ=m
# CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF is not set
CONFIG_SND_SOC_SMDK_WM8994_PCM=m
# CONFIG_SND_SOC_SPEYSIDE is not set
CONFIG_SND_SOC_TOBERMORY=m
# CONFIG_SND_SOC_LOWLAND is not set
# CONFIG_SND_SOC_LITTLEMILL is not set
# CONFIG_SND_SOC_SNOW is not set
CONFIG_SND_SOC_ODROID=m
CONFIG_SND_SOC_ARNDALE=m
CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994=m
# CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811 is not set

#
# SoC Audio support for Renesas SoCs
#
# CONFIG_SND_SOC_SH4_FSI is not set
CONFIG_SND_SOC_RCAR=m
CONFIG_SND_SOC_RZ=m
# end of SoC Audio support for Renesas SoCs

CONFIG_SND_SOC_SOF_TOPLEVEL=y
# CONFIG_SND_SOC_SOF_ACPI is not set
CONFIG_SND_SOC_SOF_OF=m
CONFIG_SND_SOC_SOF_AMD_TOPLEVEL=m
# CONFIG_SND_SOC_SOF_IMX_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_MTK_TOPLEVEL is not set
CONFIG_SND_SOC_SPRD=m
CONFIG_SND_SOC_SPRD_MCDT=m
# CONFIG_SND_SOC_STI is not set

#
# STMicroelectronics STM32 SOC audio support
#
# CONFIG_SND_SOC_STM32_SAI is not set
# CONFIG_SND_SOC_STM32_I2S is not set
CONFIG_SND_SOC_STM32_SPDIFRX=m
# CONFIG_SND_SOC_STM32_DFSDM is not set
# end of STMicroelectronics STM32 SOC audio support

#
# Allwinner SoC Audio support
#
CONFIG_SND_SUN4I_CODEC=m
# CONFIG_SND_SUN8I_CODEC_ANALOG is not set
CONFIG_SND_SUN50I_CODEC_ANALOG=m
CONFIG_SND_SUN4I_I2S=m
CONFIG_SND_SUN50I_DMIC=m
CONFIG_SND_SUN8I_ADDA_PR_REGMAP=m
# end of Allwinner SoC Audio support

CONFIG_SND_SOC_TEGRA=m
CONFIG_SND_SOC_TEGRA20_AC97=m
CONFIG_SND_SOC_TEGRA20_DAS=m
CONFIG_SND_SOC_TEGRA20_I2S=m
CONFIG_SND_SOC_TEGRA20_SPDIF=m
CONFIG_SND_SOC_TEGRA30_AHUB=m
CONFIG_SND_SOC_TEGRA30_I2S=m
CONFIG_SND_SOC_TEGRA210_AHUB=m
CONFIG_SND_SOC_TEGRA210_DMIC=m
# CONFIG_SND_SOC_TEGRA210_I2S is not set
CONFIG_SND_SOC_TEGRA210_OPE=m
CONFIG_SND_SOC_TEGRA186_ASRC=m
CONFIG_SND_SOC_TEGRA186_DSPK=m
CONFIG_SND_SOC_TEGRA210_ADMAIF=m
CONFIG_SND_SOC_TEGRA210_MVC=m
CONFIG_SND_SOC_TEGRA210_SFC=m
# CONFIG_SND_SOC_TEGRA210_AMX is not set
# CONFIG_SND_SOC_TEGRA210_ADX is not set
CONFIG_SND_SOC_TEGRA210_MIXER=m
CONFIG_SND_SOC_TEGRA_MACHINE_DRV=m
CONFIG_SND_SOC_TEGRA_RT5640=m
CONFIG_SND_SOC_TEGRA_WM8753=m
# CONFIG_SND_SOC_TEGRA_WM8903 is not set
CONFIG_SND_SOC_TEGRA_WM9712=m
CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
CONFIG_SND_SOC_TEGRA_ALC5632=m
CONFIG_SND_SOC_TEGRA_MAX98090=m
CONFIG_SND_SOC_TEGRA_RT5677=m
CONFIG_SND_SOC_TEGRA_SGTL5000=m

#
# Audio support for Texas Instruments SoCs
#
CONFIG_SND_SOC_TI_EDMA_PCM=m
CONFIG_SND_SOC_TI_SDMA_PCM=m
CONFIG_SND_SOC_TI_UDMA_PCM=m

#
# Texas Instruments DAI support for:
#
# CONFIG_SND_SOC_DAVINCI_ASP is not set
CONFIG_SND_SOC_DAVINCI_MCASP=m
# CONFIG_SND_SOC_DAVINCI_VCIF is not set
# CONFIG_SND_SOC_OMAP_DMIC is not set
CONFIG_SND_SOC_OMAP_MCBSP=m
CONFIG_SND_SOC_OMAP_MCPDM=m

#
# Audio support for boards with Texas Instruments SoCs
#
# CONFIG_SND_SOC_OMAP_ABE_TWL6040 is not set
CONFIG_SND_SOC_OMAP_HDMI=m
CONFIG_SND_SOC_J721E_EVM=m
# end of Audio support for Texas Instruments SoCs

CONFIG_SND_SOC_UNIPHIER=m
# CONFIG_SND_SOC_UNIPHIER_AIO is not set
# CONFIG_SND_SOC_UNIPHIER_LD11 is not set
# CONFIG_SND_SOC_UNIPHIER_PXS2 is not set
CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC=m
CONFIG_SND_SOC_XILINX_I2S=m
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
CONFIG_SND_SOC_XTFPGA_I2S=m
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
CONFIG_SND_SOC_ALL_CODECS=m
# CONFIG_SND_SOC_88PM860X is not set
CONFIG_SND_SOC_ARIZONA=m
CONFIG_SND_SOC_WM_HUBS=m
CONFIG_SND_SOC_WM_ADSP=m
# CONFIG_SND_SOC_AB8500_CODEC is not set
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_AD1836=m
CONFIG_SND_SOC_AD193X=m
CONFIG_SND_SOC_AD193X_SPI=m
CONFIG_SND_SOC_AD193X_I2C=m
CONFIG_SND_SOC_AD1980=m
CONFIG_SND_SOC_AD73311=m
CONFIG_SND_SOC_ADAU_UTILS=m
CONFIG_SND_SOC_ADAU1372=m
# CONFIG_SND_SOC_ADAU1372_I2C is not set
CONFIG_SND_SOC_ADAU1372_SPI=m
CONFIG_SND_SOC_ADAU1373=m
# CONFIG_SND_SOC_ADAU1701 is not set
CONFIG_SND_SOC_ADAU17X1=m
CONFIG_SND_SOC_ADAU1761=m
# CONFIG_SND_SOC_ADAU1761_I2C is not set
CONFIG_SND_SOC_ADAU1761_SPI=m
CONFIG_SND_SOC_ADAU1781=m
CONFIG_SND_SOC_ADAU1781_I2C=m
CONFIG_SND_SOC_ADAU1781_SPI=m
CONFIG_SND_SOC_ADAU1977=m
CONFIG_SND_SOC_ADAU1977_SPI=m
CONFIG_SND_SOC_ADAU1977_I2C=m
CONFIG_SND_SOC_ADAU7002=m
CONFIG_SND_SOC_ADAU7118=m
CONFIG_SND_SOC_ADAU7118_HW=m
# CONFIG_SND_SOC_ADAU7118_I2C is not set
CONFIG_SND_SOC_ADAV80X=m
CONFIG_SND_SOC_ADAV801=m
CONFIG_SND_SOC_ADAV803=m
CONFIG_SND_SOC_ADS117X=m
# CONFIG_SND_SOC_AK4104 is not set
CONFIG_SND_SOC_AK4118=m
CONFIG_SND_SOC_AK4375=m
# CONFIG_SND_SOC_AK4458 is not set
CONFIG_SND_SOC_AK4535=m
CONFIG_SND_SOC_AK4554=m
# CONFIG_SND_SOC_AK4613 is not set
CONFIG_SND_SOC_AK4641=m
CONFIG_SND_SOC_AK4642=m
CONFIG_SND_SOC_AK4671=m
CONFIG_SND_SOC_AK5386=m
# CONFIG_SND_SOC_AK5558 is not set
# CONFIG_SND_SOC_ALC5623 is not set
CONFIG_SND_SOC_ALC5632=m
CONFIG_SND_SOC_AW8738=m
CONFIG_SND_SOC_BD28623=m
CONFIG_SND_SOC_BT_SCO=m
CONFIG_SND_SOC_CPCAP=m
CONFIG_SND_SOC_CQ0093VC=m
# CONFIG_SND_SOC_CROS_EC_CODEC is not set
CONFIG_SND_SOC_CS35L32=m
CONFIG_SND_SOC_CS35L33=m
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=m
CONFIG_SND_SOC_CS35L41_LIB=m
CONFIG_SND_SOC_CS35L41=m
# CONFIG_SND_SOC_CS35L41_SPI is not set
CONFIG_SND_SOC_CS35L41_I2C=m
CONFIG_SND_SOC_CS35L45_TABLES=m
CONFIG_SND_SOC_CS35L45=m
# CONFIG_SND_SOC_CS35L45_SPI is not set
CONFIG_SND_SOC_CS35L45_I2C=m
CONFIG_SND_SOC_CS42L42_CORE=m
CONFIG_SND_SOC_CS42L42=m
# CONFIG_SND_SOC_CS42L51_I2C is not set
CONFIG_SND_SOC_CS42L52=m
# CONFIG_SND_SOC_CS42L56 is not set
# CONFIG_SND_SOC_CS42L73 is not set
# CONFIG_SND_SOC_CS42L83 is not set
CONFIG_SND_SOC_CS4234=m
CONFIG_SND_SOC_CS4265=m
CONFIG_SND_SOC_CS4270=m
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS4271_SPI=m
# CONFIG_SND_SOC_CS42XX8_I2C is not set
CONFIG_SND_SOC_CS43130=m
# CONFIG_SND_SOC_CS4341 is not set
# CONFIG_SND_SOC_CS4349 is not set
# CONFIG_SND_SOC_CS47L15 is not set
# CONFIG_SND_SOC_CS47L24 is not set
# CONFIG_SND_SOC_CS47L35 is not set
# CONFIG_SND_SOC_CS47L85 is not set
# CONFIG_SND_SOC_CS47L90 is not set
# CONFIG_SND_SOC_CS47L92 is not set
# CONFIG_SND_SOC_CS53L30 is not set
CONFIG_SND_SOC_CX20442=m
CONFIG_SND_SOC_CX2072X=m
# CONFIG_SND_SOC_JZ4740_CODEC is not set
# CONFIG_SND_SOC_JZ4725B_CODEC is not set
# CONFIG_SND_SOC_JZ4760_CODEC is not set
# CONFIG_SND_SOC_JZ4770_CODEC is not set
CONFIG_SND_SOC_L3=m
CONFIG_SND_SOC_DA7210=m
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DA7218=m
CONFIG_SND_SOC_DA7219=m
CONFIG_SND_SOC_DA732X=m
CONFIG_SND_SOC_DA9055=m
# CONFIG_SND_SOC_DMIC is not set
CONFIG_SND_SOC_HDMI_CODEC=m
CONFIG_SND_SOC_ES7134=m
# CONFIG_SND_SOC_ES7241 is not set
CONFIG_SND_SOC_ES8316=m
CONFIG_SND_SOC_ES8326=m
# CONFIG_SND_SOC_ES8328_I2C is not set
# CONFIG_SND_SOC_ES8328_SPI is not set
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDAC_HDMI=m
CONFIG_SND_SOC_HDAC_HDA=m
CONFIG_SND_SOC_HDA=m
CONFIG_SND_SOC_ICS43432=m
CONFIG_SND_SOC_INNO_RK3036=m
CONFIG_SND_SOC_ISABELLE=m
CONFIG_SND_SOC_LM49453=m
CONFIG_SND_SOC_LOCHNAGAR_SC=m
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98095=m
CONFIG_SND_SOC_MAX98357A=m
CONFIG_SND_SOC_MAX98371=m
CONFIG_SND_SOC_MAX98504=m
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98925=m
CONFIG_SND_SOC_MAX98926=m
CONFIG_SND_SOC_MAX98927=m
# CONFIG_SND_SOC_MAX98520 is not set
CONFIG_SND_SOC_MAX98373=m
CONFIG_SND_SOC_MAX98373_I2C=m
# CONFIG_SND_SOC_MAX98373_SDW is not set
CONFIG_SND_SOC_MAX98390=m
CONFIG_SND_SOC_MAX98396=m
CONFIG_SND_SOC_MAX9850=m
CONFIG_SND_SOC_MAX9860=m
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
# CONFIG_SND_SOC_PCM1681 is not set
CONFIG_SND_SOC_PCM1789=m
CONFIG_SND_SOC_PCM1789_I2C=m
CONFIG_SND_SOC_PCM179X=m
CONFIG_SND_SOC_PCM179X_I2C=m
CONFIG_SND_SOC_PCM179X_SPI=m
CONFIG_SND_SOC_PCM186X=m
CONFIG_SND_SOC_PCM186X_I2C=m
# CONFIG_SND_SOC_PCM186X_SPI is not set
CONFIG_SND_SOC_PCM3008=m
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
# CONFIG_SND_SOC_PCM3060_SPI is not set
CONFIG_SND_SOC_PCM3168A=m
CONFIG_SND_SOC_PCM3168A_I2C=m
CONFIG_SND_SOC_PCM3168A_SPI=m
CONFIG_SND_SOC_PCM5102A=m
CONFIG_SND_SOC_PCM512x=m
CONFIG_SND_SOC_PCM512x_I2C=m
CONFIG_SND_SOC_PCM512x_SPI=m
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RK817=m
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RL6347A=m
CONFIG_SND_SOC_RT274=m
CONFIG_SND_SOC_RT286=m
CONFIG_SND_SOC_RT298=m
CONFIG_SND_SOC_RT1011=m
CONFIG_SND_SOC_RT1015=m
CONFIG_SND_SOC_RT1015P=m
CONFIG_SND_SOC_RT1016=m
CONFIG_SND_SOC_RT1019=m
CONFIG_SND_SOC_RT1305=m
CONFIG_SND_SOC_RT1308=m
# CONFIG_SND_SOC_RT1308_SDW is not set
# CONFIG_SND_SOC_RT1316_SDW is not set
CONFIG_SND_SOC_RT5514=m
# CONFIG_SND_SOC_RT5616 is not set
CONFIG_SND_SOC_RT5631=m
CONFIG_SND_SOC_RT5640=m
CONFIG_SND_SOC_RT5645=m
CONFIG_SND_SOC_RT5651=m
# CONFIG_SND_SOC_RT5659 is not set
CONFIG_SND_SOC_RT5660=m
CONFIG_SND_SOC_RT5663=m
CONFIG_SND_SOC_RT5665=m
CONFIG_SND_SOC_RT5668=m
CONFIG_SND_SOC_RT5670=m
CONFIG_SND_SOC_RT5677=m
CONFIG_SND_SOC_RT5677_SPI=m
CONFIG_SND_SOC_RT5682=m
CONFIG_SND_SOC_RT5682_I2C=m
# CONFIG_SND_SOC_RT5682_SDW is not set
CONFIG_SND_SOC_RT5682S=m
# CONFIG_SND_SOC_RT700_SDW is not set
# CONFIG_SND_SOC_RT711_SDW is not set
# CONFIG_SND_SOC_RT711_SDCA_SDW is not set
# CONFIG_SND_SOC_RT715_SDW is not set
# CONFIG_SND_SOC_RT715_SDCA_SDW is not set
# CONFIG_SND_SOC_RT9120 is not set
# CONFIG_SND_SOC_SDW_MOCKUP is not set
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SI476X=m
CONFIG_SND_SOC_SIGMADSP=m
CONFIG_SND_SOC_SIGMADSP_REGMAP=m
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
# CONFIG_SND_SOC_SIMPLE_MUX is not set
CONFIG_SND_SOC_SPDIF=m
# CONFIG_SND_SOC_SRC4XXX_I2C is not set
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2518=m
CONFIG_SND_SOC_SSM2602=m
CONFIG_SND_SOC_SSM2602_SPI=m
CONFIG_SND_SOC_SSM2602_I2C=m
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
CONFIG_SND_SOC_STA350=m
CONFIG_SND_SOC_STA529=m
CONFIG_SND_SOC_STAC9766=m
# CONFIG_SND_SOC_STI_SAS is not set
CONFIG_SND_SOC_TAS2552=m
CONFIG_SND_SOC_TAS2562=m
# CONFIG_SND_SOC_TAS2764 is not set
CONFIG_SND_SOC_TAS2770=m
CONFIG_SND_SOC_TAS2780=m
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=m
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS5805M is not set
# CONFIG_SND_SOC_TAS6424 is not set
CONFIG_SND_SOC_TDA7419=m
CONFIG_SND_SOC_TFA9879=m
# CONFIG_SND_SOC_TFA989X is not set
# CONFIG_SND_SOC_TLV320ADC3XXX is not set
CONFIG_SND_SOC_TLV320AIC23=m
CONFIG_SND_SOC_TLV320AIC23_I2C=m
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
CONFIG_SND_SOC_TLV320AIC26=m
CONFIG_SND_SOC_TLV320AIC31XX=m
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
CONFIG_SND_SOC_TLV320AIC32X4_SPI=m
CONFIG_SND_SOC_TLV320AIC3X=m
# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
CONFIG_SND_SOC_TLV320AIC3X_SPI=m
CONFIG_SND_SOC_TLV320DAC33=m
CONFIG_SND_SOC_TLV320ADCX140=m
CONFIG_SND_SOC_TS3A227E=m
CONFIG_SND_SOC_TSCS42XX=m
CONFIG_SND_SOC_TSCS454=m
# CONFIG_SND_SOC_TWL4030 is not set
CONFIG_SND_SOC_TWL6040=m
CONFIG_SND_SOC_UDA1334=m
CONFIG_SND_SOC_UDA134X=m
CONFIG_SND_SOC_UDA1380=m
# CONFIG_SND_SOC_WCD9335 is not set
# CONFIG_SND_SOC_WCD934X is not set
# CONFIG_SND_SOC_WCD938X_SDW is not set
CONFIG_SND_SOC_WL1273=m
CONFIG_SND_SOC_WM0010=m
CONFIG_SND_SOC_WM1250_EV1=m
CONFIG_SND_SOC_WM2000=m
CONFIG_SND_SOC_WM2200=m
CONFIG_SND_SOC_WM5100=m
CONFIG_SND_SOC_WM5102=m
# CONFIG_SND_SOC_WM5110 is not set
CONFIG_SND_SOC_WM8350=m
CONFIG_SND_SOC_WM8400=m
# CONFIG_SND_SOC_WM8510 is not set
# CONFIG_SND_SOC_WM8523 is not set
# CONFIG_SND_SOC_WM8524 is not set
CONFIG_SND_SOC_WM8580=m
CONFIG_SND_SOC_WM8711=m
CONFIG_SND_SOC_WM8727=m
CONFIG_SND_SOC_WM8728=m
CONFIG_SND_SOC_WM8731=m
CONFIG_SND_SOC_WM8731_I2C=m
CONFIG_SND_SOC_WM8731_SPI=m
CONFIG_SND_SOC_WM8737=m
# CONFIG_SND_SOC_WM8741 is not set
CONFIG_SND_SOC_WM8750=m
CONFIG_SND_SOC_WM8753=m
CONFIG_SND_SOC_WM8770=m
# CONFIG_SND_SOC_WM8776 is not set
CONFIG_SND_SOC_WM8782=m
CONFIG_SND_SOC_WM8804=m
CONFIG_SND_SOC_WM8804_I2C=m
CONFIG_SND_SOC_WM8804_SPI=m
CONFIG_SND_SOC_WM8900=m
CONFIG_SND_SOC_WM8903=m
CONFIG_SND_SOC_WM8904=m
# CONFIG_SND_SOC_WM8940 is not set
CONFIG_SND_SOC_WM8955=m
CONFIG_SND_SOC_WM8960=m
CONFIG_SND_SOC_WM8961=m
CONFIG_SND_SOC_WM8962=m
CONFIG_SND_SOC_WM8971=m
# CONFIG_SND_SOC_WM8974 is not set
CONFIG_SND_SOC_WM8978=m
CONFIG_SND_SOC_WM8983=m
CONFIG_SND_SOC_WM8985=m
CONFIG_SND_SOC_WM8988=m
CONFIG_SND_SOC_WM8990=m
CONFIG_SND_SOC_WM8991=m
CONFIG_SND_SOC_WM8993=m
CONFIG_SND_SOC_WM8994=m
CONFIG_SND_SOC_WM8995=m
CONFIG_SND_SOC_WM8996=m
CONFIG_SND_SOC_WM8997=m
# CONFIG_SND_SOC_WM8998 is not set
CONFIG_SND_SOC_WM9081=m
CONFIG_SND_SOC_WM9090=m
CONFIG_SND_SOC_WM9705=m
CONFIG_SND_SOC_WM9712=m
CONFIG_SND_SOC_WM9713=m
# CONFIG_SND_SOC_WSA881X is not set
# CONFIG_SND_SOC_WSA883X is not set
CONFIG_SND_SOC_ZL38060=m
CONFIG_SND_SOC_LM4857=m
CONFIG_SND_SOC_MAX9759=m
CONFIG_SND_SOC_MAX9768=m
CONFIG_SND_SOC_MAX9877=m
CONFIG_SND_SOC_MC13783=m
CONFIG_SND_SOC_ML26124=m
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6358=m
# CONFIG_SND_SOC_MT6359 is not set
# CONFIG_SND_SOC_MT6660 is not set
CONFIG_SND_SOC_NAU8315=m
CONFIG_SND_SOC_NAU8540=m
CONFIG_SND_SOC_NAU8810=m
CONFIG_SND_SOC_NAU8821=m
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_NAU8825=m
# CONFIG_SND_SOC_TPA6130A2 is not set
CONFIG_SND_SOC_LPASS_MACRO_COMMON=m
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
CONFIG_SND_SOC_LPASS_RX_MACRO=m
CONFIG_SND_SOC_LPASS_TX_MACRO=m
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m

#
# HID support
#
# CONFIG_HID is not set

#
# USB HID support
#
# CONFIG_USB_HID is not set
# CONFIG_HID_PID is not set

#
# USB HID Boot Protocol drivers
#
# CONFIG_USB_KBD is not set
# CONFIG_USB_MOUSE is not set
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=m
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_FEW_INIT_RETRIES is not set
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG_PRODUCTLIST=y
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=m
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_BRCMSTB=y
# CONFIG_USB_EHCI_HCD is not set
CONFIG_USB_OXU210HP_HCD=m
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=m
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_MAX3421_HCD=y
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_SL811_HCD=m
CONFIG_USB_SL811_HCD_ISO=y
CONFIG_USB_SL811_CS=m
CONFIG_USB_R8A66597_HCD=m
CONFIG_USB_RENESAS_USBHS_HCD=y
CONFIG_USB_HCD_SSB=m
CONFIG_USB_HCD_TEST_MODE=y
CONFIG_USB_RENESAS_USBHS=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=m
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
CONFIG_USB_STORAGE_DEBUG=y
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
# CONFIG_USB_STORAGE_ISD200 is not set
CONFIG_USB_STORAGE_USBAT=m
# CONFIG_USB_STORAGE_SDDR09 is not set
CONFIG_USB_STORAGE_SDDR55=m
CONFIG_USB_STORAGE_JUMPSHOT=m
# CONFIG_USB_STORAGE_ALAUDA is not set
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=m
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=y
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=y
# CONFIG_USBIP_VUDC is not set
# CONFIG_USBIP_DEBUG is not set
# CONFIG_USB_CDNS_SUPPORT is not set
CONFIG_USB_MTU3=m
# CONFIG_USB_MTU3_HOST is not set
CONFIG_USB_MTU3_GADGET=y
# CONFIG_USB_MTU3_DUAL_ROLE is not set
# CONFIG_USB_MTU3_DEBUG is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
CONFIG_USB_MUSB_GADGET=y
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_UX500 is not set
CONFIG_USB_MUSB_MEDIATEK=m
CONFIG_USB_MUSB_POLARFIRE_SOC=m

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=m
CONFIG_USB_DWC3_ULPI=y
CONFIG_USB_DWC3_HOST=y
# CONFIG_USB_DWC3_GADGET is not set
# CONFIG_USB_DWC3_DUAL_ROLE is not set

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_KEYSTONE=m
CONFIG_USB_DWC3_AM62=m
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_UDC is not set
CONFIG_USB_CHIPIDEA_MSM=y
# CONFIG_USB_CHIPIDEA_GENERIC is not set
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=m
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=m
CONFIG_USB_CYPRESS_CY7C63=m
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_QCOM_EUD=y
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_LD=m
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
CONFIG_USB_YUREX=y
# CONFIG_USB_EZUSB_FX2 is not set
CONFIG_USB_HUB_USB251XB=y
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
# CONFIG_USB_CHAOSKEY is not set
CONFIG_BRCM_USB_PINMAP=m
CONFIG_USB_ONBOARD_HUB=m

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=m
CONFIG_NOP_USB_XCEIV=m
CONFIG_AM335X_CONTROL_USB=m
CONFIG_AM335X_PHY_USB=m
CONFIG_USB_GPIO_VBUS=m
CONFIG_USB_ISP1301=m
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
CONFIG_JZ4770_PHY=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
CONFIG_USB_GADGET_VERBOSE=y
CONFIG_USB_GADGET_DEBUG_FILES=y
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
# CONFIG_U_SERIAL_CONSOLE is not set

#
# USB Peripheral Controller
#
CONFIG_USB_LPC32XX=m
# CONFIG_USB_FUSB300 is not set
CONFIG_USB_FOTG210_UDC=m
# CONFIG_USB_GR_UDC is not set
CONFIG_USB_R8A66597=m
CONFIG_USB_RENESAS_USBHS_UDC=m
CONFIG_USB_RENESAS_USB3=y
# CONFIG_USB_PXA27X is not set
CONFIG_USB_MV_UDC=y
CONFIG_USB_MV_U3D=y
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=m
CONFIG_USB_NET2272=m
# CONFIG_USB_NET2272_DMA is not set
CONFIG_USB_GADGET_XILINX=m
CONFIG_USB_MAX3420_UDC=m
CONFIG_USB_ASPEED_UDC=m
CONFIG_USB_ASPEED_VHUB=m
CONFIG_USB_DUMMY_HCD=m
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_U_AUDIO=m
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_NCM=m
CONFIG_USB_F_ECM=y
CONFIG_USB_F_PHONET=m
CONFIG_USB_F_SUBSET=y
CONFIG_USB_F_RNDIS=m
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_FS=y
CONFIG_USB_F_UAC1=m
CONFIG_USB_F_UAC1_LEGACY=m
CONFIG_USB_F_UAC2=m
CONFIG_USB_F_MIDI=m
CONFIG_USB_F_HID=y
CONFIG_USB_F_PRINTER=m
CONFIG_USB_F_TCM=m
CONFIG_USB_CONFIGFS=m
# CONFIG_USB_CONFIGFS_SERIAL is not set
CONFIG_USB_CONFIGFS_ACM=y
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_NCM is not set
# CONFIG_USB_CONFIGFS_ECM is not set
CONFIG_USB_CONFIGFS_ECM_SUBSET=y
CONFIG_USB_CONFIGFS_RNDIS=y
# CONFIG_USB_CONFIGFS_EEM is not set
CONFIG_USB_CONFIGFS_PHONET=y
CONFIG_USB_CONFIGFS_MASS_STORAGE=y
CONFIG_USB_CONFIGFS_F_LB_SS=y
CONFIG_USB_CONFIGFS_F_FS=y
CONFIG_USB_CONFIGFS_F_UAC1=y
CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
CONFIG_USB_CONFIGFS_F_UAC2=y
CONFIG_USB_CONFIGFS_F_MIDI=y
# CONFIG_USB_CONFIGFS_F_HID is not set
# CONFIG_USB_CONFIGFS_F_PRINTER is not set
CONFIG_USB_CONFIGFS_F_TCM=y

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
CONFIG_USB_AUDIO=m
# CONFIG_GADGET_UAC1 is not set
CONFIG_USB_ETH=y
# CONFIG_USB_ETH_RNDIS is not set
# CONFIG_USB_ETH_EEM is not set
CONFIG_USB_G_NCM=m
# CONFIG_USB_GADGETFS is not set
CONFIG_USB_FUNCTIONFS=y
# CONFIG_USB_FUNCTIONFS_ETH is not set
# CONFIG_USB_FUNCTIONFS_RNDIS is not set
CONFIG_USB_FUNCTIONFS_GENERIC=y
CONFIG_USB_MASS_STORAGE=y
CONFIG_USB_GADGET_TARGET=m
CONFIG_USB_G_SERIAL=y
CONFIG_USB_MIDI_GADGET=m
CONFIG_USB_G_PRINTER=m
# CONFIG_USB_CDC_COMPOSITE is not set
CONFIG_USB_G_NOKIA=m
CONFIG_USB_G_ACM_MS=m
# CONFIG_USB_G_MULTI is not set
CONFIG_USB_G_HID=y
CONFIG_USB_G_DBGP=m
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
CONFIG_USB_RAW_GADGET=y
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
# CONFIG_MMC_BLOCK is not set
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set
# CONFIG_MMC_CRYPTO is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
# CONFIG_MMC_SDHCI is not set
CONFIG_MMC_MESON_GX=m
CONFIG_MMC_MOXART=m
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_DAVINCI=y
CONFIG_MMC_SPI=m
CONFIG_MMC_S3C=m
# CONFIG_MMC_S3C_HW_SDIO_IRQ is not set
CONFIG_MMC_S3C_PIO=y
# CONFIG_MMC_S3C_DMA is not set
CONFIG_MMC_TMIO_CORE=m
# CONFIG_MMC_TMIO is not set
CONFIG_MMC_SDHI=m
CONFIG_MMC_SDHI_SYS_DMAC=m
CONFIG_MMC_SDHI_INTERNAL_DMAC=m
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
CONFIG_MMC_DW_BLUEFIELD=m
# CONFIG_MMC_DW_EXYNOS is not set
# CONFIG_MMC_DW_HI3798CV200 is not set
# CONFIG_MMC_DW_K3 is not set
CONFIG_MMC_SH_MMCIF=m
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_USB is not set
CONFIG_MMC_SUNXI=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
CONFIG_MMC_BCM2835=m
# CONFIG_MMC_MTK is not set
CONFIG_MMC_OWL=y
# CONFIG_MMC_LITEX is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_ARIEL is not set
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_MT6323=m
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=y
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_PCA9532=m
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_WM8350=m
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=m
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_NS2=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_MAX77650=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_PM8058=y
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=y
# CONFIG_LEDS_TI_LMU_COMMON is not set
CONFIG_LEDS_IP30=y

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=m
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#
CONFIG_LEDS_PWM_MULTICOLOR=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_NETDEV=m
CONFIG_LEDS_TRIGGER_PATTERN=m
CONFIG_LEDS_TRIGGER_AUDIO=m
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y
CONFIG_A11Y_BRAILLE_CONSOLE=y

#
# Speakup console speech
#
CONFIG_SPEAKUP=m
CONFIG_SPEAKUP_SERIALIO=y
# CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
CONFIG_SPEAKUP_SYNTH_ACNTPC=m
CONFIG_SPEAKUP_SYNTH_APOLLO=m
CONFIG_SPEAKUP_SYNTH_AUDPTR=m
CONFIG_SPEAKUP_SYNTH_BNS=m
# CONFIG_SPEAKUP_SYNTH_DECTLK is not set
CONFIG_SPEAKUP_SYNTH_DECEXT=m
CONFIG_SPEAKUP_SYNTH_DECPC=m
CONFIG_SPEAKUP_SYNTH_DTLK=m
CONFIG_SPEAKUP_SYNTH_KEYPC=m
CONFIG_SPEAKUP_SYNTH_LTLK=m
CONFIG_SPEAKUP_SYNTH_SOFT=m
CONFIG_SPEAKUP_SYNTH_SPKOUT=m
CONFIG_SPEAKUP_SYNTH_TXPRT=m
# CONFIG_SPEAKUP_SYNTH_DUMMY is not set
# end of Speakup console speech

# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_IMG_ASCII_LCD=m
CONFIG_HT16K33=m
# CONFIG_LCD2S is not set
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=y
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=m
CONFIG_COMEDI=m
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCMCIA_DRIVERS is not set
CONFIG_COMEDI_USB_DRIVERS=m
# CONFIG_COMEDI_DT9812 is not set
CONFIG_COMEDI_NI_USB6501=m
CONFIG_COMEDI_USBDUX=m
CONFIG_COMEDI_USBDUXFAST=m
CONFIG_COMEDI_USBDUXSIGMA=m
CONFIG_COMEDI_VMK80XX=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=m
CONFIG_COMEDI_TESTS=m
CONFIG_COMEDI_TESTS_EXAMPLE=m
# CONFIG_COMEDI_TESTS_NI_ROUTES is not set
CONFIG_STAGING=y

#
# IIO staging drivers
#

#
# Accelerometers
#
# CONFIG_ADIS16203 is not set
CONFIG_ADIS16240=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7816=m
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
CONFIG_AD9832=m
# CONFIG_AD9834 is not set
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=y
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
# CONFIG_AD2S1210 is not set
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_USB_EMXX=m
CONFIG_STAGING_MEDIA=y
CONFIG_LTE_GDM724X=m
# CONFIG_FB_TFT is not set
CONFIG_MOST_COMPONENTS=m
CONFIG_MOST_NET=m
CONFIG_MOST_I2C=m
CONFIG_KS7010=m
# CONFIG_GREYBUS_AUDIO is not set
CONFIG_GREYBUS_BOOTROM=m
# CONFIG_GREYBUS_FIRMWARE is not set
CONFIG_GREYBUS_LIGHT=y
CONFIG_GREYBUS_LOG=m
CONFIG_GREYBUS_LOOPBACK=y
# CONFIG_GREYBUS_POWER is not set
CONFIG_GREYBUS_RAW=m
CONFIG_GREYBUS_VIBRATOR=y
CONFIG_GREYBUS_BRIDGED_PHY=y
# CONFIG_GREYBUS_GPIO is not set
# CONFIG_GREYBUS_I2C is not set
CONFIG_GREYBUS_PWM=y
CONFIG_GREYBUS_SDIO=m
CONFIG_GREYBUS_SPI=y
# CONFIG_GREYBUS_UART is not set
# CONFIG_GREYBUS_USB is not set
CONFIG_GREYBUS_ARCHE=m
CONFIG_PI433=y
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
CONFIG_LMK04832=m
CONFIG_COMMON_CLK_APPLE_NCO=m
# CONFIG_COMMON_CLK_MAX77686 is not set
CONFIG_COMMON_CLK_MAX9485=m
CONFIG_COMMON_CLK_HI655X=m
CONFIG_COMMON_CLK_SCMI=m
CONFIG_COMMON_CLK_SCPI=y
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=m
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_BM1880 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_TPS68470=m
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_COMMON_CLK_FSL_FLEXSPI=y
# CONFIG_COMMON_CLK_FSL_SAI is not set
CONFIG_COMMON_CLK_GEMINI=y
CONFIG_COMMON_CLK_ASPEED=y
CONFIG_COMMON_CLK_S2MPS11=y
# CONFIG_CLK_TWL6040 is not set
CONFIG_CLK_LS1028A_PLLDIG=m
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_COMMON_CLK_OXNAS is not set
CONFIG_COMMON_CLK_MMP2_AUDIO=y
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BAIKAL_T1 is not set
CONFIG_CLK_BCM2711_DVP=y
CONFIG_CLK_BCM2835=y
CONFIG_CLK_BCM_63XX=y
CONFIG_CLK_BCM_63XX_GATE=y
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
CONFIG_CLK_BCM_HR2=y
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
CONFIG_CLK_RASPBERRYPI=m
# CONFIG_COMMON_CLK_HI3516CV300 is not set
CONFIG_COMMON_CLK_HI3519=m
CONFIG_COMMON_CLK_HI3559A=y
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
CONFIG_COMMON_CLK_HI3798CV200=m
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
# CONFIG_STUB_CLK_HI6220 is not set
CONFIG_STUB_CLK_HI3660=y
# CONFIG_COMMON_CLK_BOSTON is not set
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=m
CONFIG_CLK_IMX8MN=m
CONFIG_CLK_IMX8MP=m
# CONFIG_CLK_IMX8MQ is not set
CONFIG_CLK_IMX8ULP=m
CONFIG_CLK_IMX93=y

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
CONFIG_INGENIC_CGU_JZ4740=y
CONFIG_INGENIC_CGU_JZ4725B=y
CONFIG_INGENIC_CGU_JZ4760=y
CONFIG_INGENIC_CGU_JZ4770=y
CONFIG_INGENIC_CGU_JZ4780=y
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MT2701=y
# CONFIG_COMMON_CLK_MT2701_MMSYS is not set
CONFIG_COMMON_CLK_MT2701_IMGSYS=y
CONFIG_COMMON_CLK_MT2701_VDECSYS=y
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
# CONFIG_COMMON_CLK_MT2701_ETHSYS is not set
CONFIG_COMMON_CLK_MT2701_BDPSYS=y
# CONFIG_COMMON_CLK_MT2701_AUDSYS is not set
CONFIG_COMMON_CLK_MT2701_G3DSYS=y
CONFIG_COMMON_CLK_MT2712=y
# CONFIG_COMMON_CLK_MT2712_BDPSYS is not set
CONFIG_COMMON_CLK_MT2712_IMGSYS=y
# CONFIG_COMMON_CLK_MT2712_JPGDECSYS is not set
# CONFIG_COMMON_CLK_MT2712_MFGCFG is not set
CONFIG_COMMON_CLK_MT2712_MMSYS=y
CONFIG_COMMON_CLK_MT2712_VDECSYS=y
# CONFIG_COMMON_CLK_MT2712_VENCSYS is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=m
CONFIG_COMMON_CLK_MT6779_MMSYS=m
CONFIG_COMMON_CLK_MT6779_IMGSYS=m
# CONFIG_COMMON_CLK_MT6779_IPESYS is not set
# CONFIG_COMMON_CLK_MT6779_CAMSYS is not set
# CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
CONFIG_COMMON_CLK_MT6779_VENCSYS=m
CONFIG_COMMON_CLK_MT6779_MFGCFG=m
# CONFIG_COMMON_CLK_MT6779_AUDSYS is not set
CONFIG_COMMON_CLK_MT6795=m
# CONFIG_COMMON_CLK_MT6795_MFGCFG is not set
# CONFIG_COMMON_CLK_MT6795_MMSYS is not set
CONFIG_COMMON_CLK_MT6795_VDECSYS=m
CONFIG_COMMON_CLK_MT6795_VENCSYS=m
CONFIG_COMMON_CLK_MT6797=y
CONFIG_COMMON_CLK_MT6797_MMSYS=y
# CONFIG_COMMON_CLK_MT6797_IMGSYS is not set
# CONFIG_COMMON_CLK_MT6797_VDECSYS is not set
# CONFIG_COMMON_CLK_MT6797_VENCSYS is not set
CONFIG_COMMON_CLK_MT7622=y
CONFIG_COMMON_CLK_MT7622_ETHSYS=y
CONFIG_COMMON_CLK_MT7622_HIFSYS=y
# CONFIG_COMMON_CLK_MT7622_AUDSYS is not set
# CONFIG_COMMON_CLK_MT7629 is not set
CONFIG_COMMON_CLK_MT7986=y
CONFIG_COMMON_CLK_MT7986_ETHSYS=y
CONFIG_COMMON_CLK_MT8135=y
# CONFIG_COMMON_CLK_MT8167 is not set
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_MMSYS is not set
# CONFIG_COMMON_CLK_MT8183 is not set
CONFIG_COMMON_CLK_MT8186=y
# CONFIG_COMMON_CLK_MT8192 is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
CONFIG_COMMON_CLK_MT8516=y
CONFIG_COMMON_CLK_MT8516_AUDSYS=y
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# CONFIG_COMMON_CLK_AXG_AUDIO is not set
# end of Clock support for Amlogic platforms

CONFIG_MSTAR_MSC313_MPLL=y
CONFIG_MCHP_CLK_MPFS=y
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_CLK_MT7621 is not set
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
# CONFIG_S3C64XX_COMMON_CLK is not set
CONFIG_S5PV210_COMMON_CLK=y
CONFIG_EXYNOS_3250_COMMON_CLK=y
CONFIG_EXYNOS_4_COMMON_CLK=y
# CONFIG_EXYNOS_5250_COMMON_CLK is not set
CONFIG_EXYNOS_5260_COMMON_CLK=y
CONFIG_EXYNOS_5410_COMMON_CLK=y
CONFIG_EXYNOS_5420_COMMON_CLK=y
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
# CONFIG_EXYNOS_AUDSS_CLK_CON is not set
# CONFIG_EXYNOS_CLKOUT is not set
CONFIG_S3C2410_COMMON_CLK=y
CONFIG_S3C2412_COMMON_CLK=y
CONFIG_S3C2443_COMMON_CLK=y
CONFIG_TESLA_FSD_COMMON_CLK=y
CONFIG_CLK_SIFIVE=y
# CONFIG_CLK_SIFIVE_PRCI is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
CONFIG_SPRD_COMMON_CLK=y
CONFIG_SPRD_SC9860_CLK=y
CONFIG_SPRD_SC9863A_CLK=y
# CONFIG_SPRD_UMS512_CLK is not set
CONFIG_CLK_STARFIVE_JH7100=y
CONFIG_CLK_STARFIVE_JH7100_AUDIO=y
# CONFIG_CLK_SUNXI is not set
CONFIG_SUNXI_CCU=m
CONFIG_SUNIV_F1C100S_CCU=m
# CONFIG_SUN20I_D1_CCU is not set
# CONFIG_SUN20I_D1_R_CCU is not set
# CONFIG_SUN50I_A64_CCU is not set
CONFIG_SUN50I_A100_CCU=m
CONFIG_SUN50I_A100_R_CCU=m
CONFIG_SUN50I_H6_CCU=m
# CONFIG_SUN50I_H616_CCU is not set
CONFIG_SUN50I_H6_R_CCU=m
CONFIG_SUN4I_A10_CCU=m
# CONFIG_SUN6I_A31_CCU is not set
# CONFIG_SUN6I_RTC_CCU is not set
CONFIG_SUN8I_A23_CCU=m
CONFIG_SUN8I_A33_CCU=m
CONFIG_SUN8I_A83T_CCU=m
CONFIG_SUN8I_H3_CCU=m
CONFIG_SUN8I_V3S_CCU=m
# CONFIG_SUN8I_DE2_CCU is not set
# CONFIG_SUN8I_R40_CCU is not set
# CONFIG_SUN9I_A80_CCU is not set
CONFIG_SUN8I_R_CCU=m
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_HWSPINLOCK=y
# CONFIG_HWSPINLOCK_OMAP is not set
# CONFIG_HWSPINLOCK_QCOM is not set
# CONFIG_HWSPINLOCK_SPRD is not set
# CONFIG_HWSPINLOCK_STM32 is not set
CONFIG_HWSPINLOCK_SUN6I=y
# CONFIG_HSEM_U8500 is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
CONFIG_DAVINCI_TIMER=y
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
CONFIG_IXP4XX_TIMER=y
# CONFIG_MESON6_TIMER is not set
CONFIG_OWL_TIMER=y
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
CONFIG_SUN5I_HSTIMER=y
CONFIG_TEGRA_TIMER=y
# CONFIG_TEGRA186_TIMER is not set
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
# CONFIG_ASM9260_TIMER is not set
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_STM32_LP=y
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
CONFIG_ATMEL_ST=y
CONFIG_CLKSRC_SAMSUNG_PWM=y
CONFIG_FSL_FTM_TIMER=y
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
CONFIG_SPRD_TIMER=y
CONFIG_SH_TIMER_CMT=y
CONFIG_SH_TIMER_MTU2=y
CONFIG_RENESAS_OSTM=y
# CONFIG_SH_TIMER_TMU is not set
CONFIG_EM_TIMER_STI=y
CONFIG_CLKSRC_PXA=y
# CONFIG_TIMER_IMX_SYS_CTR is not set
CONFIG_CLKSRC_ST_LPC=y
CONFIG_GXP_TIMER=y
CONFIG_MSC313E_TIMER=y
CONFIG_INGENIC_TIMER=y
# CONFIG_INGENIC_SYSOST is not set
CONFIG_INGENIC_OST=y
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
CONFIG_QCOM_APCS_IPC=m
CONFIG_BCM_PDC_MBOX=m
CONFIG_STM32_IPCC=m
CONFIG_MTK_ADSP_MBOX=y
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_SUN6I_MSGBOX=m
CONFIG_SPRD_MBOX=y
CONFIG_QCOM_IPCC=y
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
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_QCOM_GLINK_SMEM=y
CONFIG_RPMSG_QCOM_SMD=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=m
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_RTKIT=y
CONFIG_APPLE_SART=m
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
CONFIG_AT91_SOC_SFR=m

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BCM63XX is not set
CONFIG_SOC_BRCMSTB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
CONFIG_SOC_IMX9=m
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
# CONFIG_MTK_DEVAPC is not set
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=m
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_PDR_HELPERS=y
CONFIG_QCOM_QMI_HELPERS=y
CONFIG_QCOM_RPMH=m
CONFIG_QCOM_SMEM=y
CONFIG_QCOM_SMD_RPM=y
CONFIG_QCOM_SMEM_STATE=y
CONFIG_QCOM_SMP2P=m
CONFIG_QCOM_SMSM=y
# CONFIG_QCOM_SOCINFO is not set
CONFIG_QCOM_SPM=m
CONFIG_QCOM_STATS=m
CONFIG_QCOM_WCNSS_CTRL=m
CONFIG_QCOM_APR=y
CONFIG_QCOM_ICC_BWMON=y
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
CONFIG_SYSC_R8A77995=y
CONFIG_SYSC_R8A7794=y
CONFIG_SYSC_R8A77990=y
# CONFIG_SYSC_R8A7779 is not set
# CONFIG_SYSC_R8A7790 is not set
# CONFIG_SYSC_R8A7795 is not set
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A77965=y
CONFIG_SYSC_R8A77960=y
# CONFIG_SYSC_R8A77961 is not set
# CONFIG_SYSC_R8A779F0 is not set
CONFIG_SYSC_R8A7792=y
# CONFIG_SYSC_R8A77980 is not set
# CONFIG_SYSC_R8A77970 is not set
# CONFIG_SYSC_R8A779A0 is not set
CONFIG_SYSC_R8A779G0=y
CONFIG_SYSC_RMOBILE=y
CONFIG_SYSC_R8A77470=y
# CONFIG_SYSC_R8A7745 is not set
# CONFIG_SYSC_R8A7742 is not set
CONFIG_SYSC_R8A7743=y
# CONFIG_SYSC_R8A774C0 is not set
# CONFIG_SYSC_R8A774E1 is not set
CONFIG_SYSC_R8A774A1=y
# CONFIG_SYSC_R8A774B1 is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=m
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
# CONFIG_EXTCON_RT8973A is not set
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=m
CONFIG_MEMORY=y
# CONFIG_BRCMSTB_DPFE is not set
# CONFIG_BRCMSTB_MEMC is not set
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_EMIF is not set
# CONFIG_FSL_CORENET_CF is not set
CONFIG_FSL_IFC=y
CONFIG_MTK_SMI=m
# CONFIG_DA8XX_DDRCTL is not set
# CONFIG_RENESAS_RPCIF is not set
# CONFIG_STM32_FMC2_EBI is not set
# CONFIG_SAMSUNG_MC is not set
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
# CONFIG_IIO_BUFFER_DMAENGINE is not set
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
# CONFIG_ADIS16209 is not set
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL313_SPI=m
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=m
CONFIG_ADXL345_SPI=y
# CONFIG_ADXL355_I2C is not set
# CONFIG_ADXL355_SPI is not set
CONFIG_ADXL367=y
CONFIG_ADXL367_SPI=y
CONFIG_ADXL367_I2C=y
CONFIG_ADXL372=y
# CONFIG_ADXL372_SPI is not set
CONFIG_ADXL372_I2C=y
CONFIG_BMA180=y
# CONFIG_BMA220 is not set
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMA400_SPI=y
# CONFIG_BMC150_ACCEL is not set
CONFIG_BMI088_ACCEL=m
CONFIG_BMI088_ACCEL_SPI=m
CONFIG_DA280=y
CONFIG_DA311=y
CONFIG_DMARD06=y
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_FXLS8962AF_SPI=y
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
CONFIG_KXSD9=y
CONFIG_KXSD9_SPI=m
# CONFIG_KXSD9_I2C is not set
# CONFIG_KXCJK1013 is not set
CONFIG_MC3230=m
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
# CONFIG_MMA7455_SPI is not set
CONFIG_MMA7660=y
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
CONFIG_MSA311=y
CONFIG_MXC4005=m
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
CONFIG_SCA3300=m
CONFIG_STK8312=y
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
CONFIG_AD7091R5=m
CONFIG_AD7124=y
# CONFIG_AD7192 is not set
# CONFIG_AD7266 is not set
# CONFIG_AD7280 is not set
# CONFIG_AD7291 is not set
CONFIG_AD7292=y
CONFIG_AD7298=m
# CONFIG_AD7476 is not set
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
CONFIG_AD7606_IFACE_SPI=m
CONFIG_AD7766=y
# CONFIG_AD7768_1 is not set
CONFIG_AD7780=m
CONFIG_AD7791=y
# CONFIG_AD7793 is not set
# CONFIG_AD7887 is not set
CONFIG_AD7923=m
CONFIG_AD7949=y
CONFIG_AD799X=y
# CONFIG_ASPEED_ADC is not set
CONFIG_AT91_SAMA5D2_ADC=y
CONFIG_AXP20X_ADC=y
CONFIG_AXP288_ADC=m
CONFIG_BCM_IPROC_ADC=m
CONFIG_BERLIN2_ADC=y
CONFIG_CC10001_ADC=m
CONFIG_CPCAP_ADC=m
# CONFIG_DA9150_GPADC is not set
CONFIG_DLN2_ADC=m
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_MXS_LRADC_ADC=m
CONFIG_FSL_MX25_ADC=y
CONFIG_HI8435=y
# CONFIG_HX711 is not set
CONFIG_INGENIC_ADC=m
CONFIG_IMX7D_ADC=y
CONFIG_IMX8QXP_ADC=m
CONFIG_LPC18XX_ADC=m
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=m
CONFIG_LTC2485=m
CONFIG_LTC2496=m
# CONFIG_LTC2497 is not set
CONFIG_MAX1027=y
CONFIG_MAX11100=y
# CONFIG_MAX1118 is not set
# CONFIG_MAX11205 is not set
# CONFIG_MAX1241 is not set
# CONFIG_MAX1363 is not set
CONFIG_MAX9611=m
# CONFIG_MCP320X is not set
CONFIG_MCP3422=m
# CONFIG_MCP3911 is not set
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEDIATEK_MT6577_AUXADC=y
# CONFIG_MP2629_ADC is not set
# CONFIG_NAU7802 is not set
# CONFIG_NPCM_ADC is not set
# CONFIG_QCOM_PM8XXX_XOADC is not set
CONFIG_RCAR_GYRO_ADC=m
CONFIG_ROCKCHIP_SARADC=m
CONFIG_RICHTEK_RTQ6056=y
CONFIG_RZG2L_ADC=y
CONFIG_SC27XX_ADC=y
CONFIG_SPEAR_ADC=m
CONFIG_SD_ADC_MODULATOR=y
CONFIG_STM32_DFSDM_CORE=m
CONFIG_STM32_DFSDM_ADC=m
# CONFIG_SUN4I_GPADC is not set
CONFIG_TI_ADC081C=m
CONFIG_TI_ADC0832=y
CONFIG_TI_ADC084S021=y
CONFIG_TI_ADC12138=m
# CONFIG_TI_ADC108S102 is not set
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=m
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_ADS7950 is not set
CONFIG_TI_ADS8344=y
CONFIG_TI_ADS8688=m
# CONFIG_TI_ADS124S08 is not set
CONFIG_TI_ADS131E08=y
CONFIG_TI_AM335X_ADC=m
CONFIG_TI_TLC4541=y
# CONFIG_TI_TSC2046 is not set
CONFIG_VF610_ADC=m
# CONFIG_VIPERBOARD_ADC is not set
CONFIG_XILINX_XADC=m
CONFIG_XILINX_AMS=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74413R=y
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=y
# CONFIG_ADA4250 is not set
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
CONFIG_AD7746=y
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_BME680_SPI=m
CONFIG_CCS811=y
CONFIG_IAQCORE=m
CONFIG_SCD30_CORE=y
CONFIG_SCD30_I2C=m
CONFIG_SCD4X=y
CONFIG_SENSIRION_SGP30=m
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# CONFIG_IIO_SCMI is not set
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORS_COMMONS is not set
CONFIG_IIO_SSP_SENSORHUB=y
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R=m
CONFIG_AD5064=y
# CONFIG_AD5360 is not set
CONFIG_AD5380=y
CONFIG_AD5421=m
# CONFIG_AD5446 is not set
# CONFIG_AD5449 is not set
CONFIG_AD5592R_BASE=m
# CONFIG_AD5592R is not set
CONFIG_AD5593R=m
CONFIG_AD5504=m
# CONFIG_AD5624R_SPI is not set
CONFIG_LTC2688=m
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
CONFIG_AD5696_I2C=m
CONFIG_AD5755=m
# CONFIG_AD5758 is not set
CONFIG_AD5761=y
CONFIG_AD5764=y
CONFIG_AD5766=y
CONFIG_AD5770R=m
CONFIG_AD5791=y
# CONFIG_AD7293 is not set
CONFIG_AD7303=m
# CONFIG_AD8801 is not set
# CONFIG_DPOT_DAC is not set
CONFIG_DS4424=m
# CONFIG_LPC18XX_DAC is not set
CONFIG_LTC1660=y
CONFIG_LTC2632=y
# CONFIG_M62332 is not set
CONFIG_MAX517=m
CONFIG_MAX5821=y
CONFIG_MCP4725=y
CONFIG_MCP4922=y
CONFIG_STM32_DAC=y
CONFIG_STM32_DAC_CORE=y
# CONFIG_TI_DAC082S085 is not set
CONFIG_TI_DAC5571=m
CONFIG_TI_DAC7311=y
# CONFIG_TI_DAC7612 is not set
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=m
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
CONFIG_ADF4371=m
# CONFIG_ADMV1013 is not set
CONFIG_ADMV4420=y
CONFIG_ADRF6780=m
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
CONFIG_ADIS16130=m
# CONFIG_ADIS16136 is not set
CONFIG_ADIS16260=m
CONFIG_ADXRS290=y
# CONFIG_ADXRS450 is not set
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_FXAS21002C_SPI=m
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=m
# CONFIG_AFE4404 is not set
CONFIG_MAX30100=m
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=m
CONFIG_HDC100X=y
# CONFIG_HDC2010 is not set
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTS221_SPI=m
CONFIG_HTU21=m
CONFIG_SI7005=y
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
# CONFIG_ADIS16460 is not set
CONFIG_ADIS16475=m
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=y
# CONFIG_BMI160_I2C is not set
CONFIG_BMI160_SPI=y
CONFIG_BOSCH_BNO055=y
CONFIG_BOSCH_BNO055_I2C=y
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_FXOS8700_SPI=m
CONFIG_KMX61=y
# CONFIG_INV_ICM42600_I2C is not set
# CONFIG_INV_ICM42600_SPI is not set
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=m
CONFIG_INV_MPU6050_SPI=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_SPI=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
CONFIG_IIO_ST_LSM9DS0=y
CONFIG_IIO_ST_LSM9DS0_I2C=m
# CONFIG_IIO_ST_LSM9DS0_SPI is not set
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
# CONFIG_ADJD_S311 is not set
CONFIG_ADUX1020=m
# CONFIG_AL3010 is not set
# CONFIG_AL3320A is not set
CONFIG_APDS9300=y
# CONFIG_APDS9960 is not set
CONFIG_AS73211=m
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
CONFIG_CM3323=y
# CONFIG_CM3605 is not set
CONFIG_CM36651=y
CONFIG_GP2AP002=y
# CONFIG_GP2AP020A00F is not set
CONFIG_IQS621_ALS=y
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=m
CONFIG_ISL29125=m
CONFIG_JSA1212=y
CONFIG_RPR0521=y
CONFIG_LTR501=m
CONFIG_LTRF216A=m
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=y
CONFIG_MAX44009=y
# CONFIG_NOA1305 is not set
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
CONFIG_STK3310=m
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_ST_UVIS25_SPI=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=y
CONFIG_TSL4531=m
CONFIG_US5182D=y
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
CONFIG_VEML6030=y
CONFIG_VEML6070=m
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=m
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_BMC150_MAGN_SPI=y
CONFIG_MAG3110=m
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_HMC5843_SPI=y
CONFIG_SENSORS_RM3100=y
# CONFIG_SENSORS_RM3100_I2C is not set
CONFIG_SENSORS_RM3100_SPI=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
# CONFIG_AD5272 is not set
CONFIG_DS1803=m
CONFIG_MAX5432=y
CONFIG_MAX5481=m
CONFIG_MAX5487=m
CONFIG_MCP4018=y
CONFIG_MCP4131=m
CONFIG_MCP4531=y
CONFIG_MCP41010=m
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=m
# CONFIG_DLHL60D is not set
CONFIG_DPS310=y
CONFIG_HP03=y
CONFIG_ICP10100=y
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL115_SPI=m
CONFIG_MPL3115=y
CONFIG_MS5611=m
# CONFIG_MS5611_I2C is not set
CONFIG_MS5611_SPI=m
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_IIO_ST_PRESS_SPI=m
# CONFIG_T5403 is not set
CONFIG_HP206C=m
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=m
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
CONFIG_RFD77402=y
CONFIG_SRF04=m
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
CONFIG_SX9324=m
# CONFIG_SX9360 is not set
CONFIG_SX9500=m
# CONFIG_SRF08 is not set
CONFIG_VCNL3020=m
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=y
CONFIG_AD2S1200=m
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
# CONFIG_LTC2983 is not set
CONFIG_MAXIM_THERMOCOUPLE=m
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=y
# CONFIG_TMP006 is not set
CONFIG_TMP007=y
CONFIG_TMP117=m
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
CONFIG_MAX31856=m
CONFIG_MAX31865=m
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_BCM_IPROC=m
# CONFIG_PWM_BCM_KONA is not set
CONFIG_PWM_BCM2835=m
CONFIG_PWM_BERLIN=y
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLK is not set
CONFIG_PWM_CLPS711X=y
CONFIG_PWM_EP93XX=m
# CONFIG_PWM_HIBVT is not set
CONFIG_PWM_IMG=m
CONFIG_PWM_IMX1=y
# CONFIG_PWM_IMX27 is not set
CONFIG_PWM_IMX_TPM=m
# CONFIG_PWM_INTEL_LGM is not set
CONFIG_PWM_IQS620A=y
CONFIG_PWM_JZ4740=m
CONFIG_PWM_KEEMBAY=y
CONFIG_PWM_LP3943=m
# CONFIG_PWM_LPC18XX_SCT is not set
CONFIG_PWM_LPC32XX=y
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_MESON=y
CONFIG_PWM_MTK_DISP=y
CONFIG_PWM_MEDIATEK=m
CONFIG_PWM_NTXEC=m
CONFIG_PWM_PCA9685=m
CONFIG_PWM_PXA=y
# CONFIG_PWM_RASPBERRYPI_POE is not set
CONFIG_PWM_RCAR=y
CONFIG_PWM_RENESAS_TPU=m
CONFIG_PWM_ROCKCHIP=m
CONFIG_PWM_SAMSUNG=y
CONFIG_PWM_SL28CPLD=m
# CONFIG_PWM_SPRD is not set
CONFIG_PWM_STM32=m
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_SUN4I is not set
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=m
CONFIG_PWM_TIEHRPWM=m
# CONFIG_PWM_VISCONTI is not set
CONFIG_PWM_VT8500=y

#
# IRQ chip support
#
CONFIG_AL_FIC=y
CONFIG_RENESAS_INTC_IRQPIN=y
# CONFIG_RENESAS_IRQC is not set
CONFIG_RENESAS_RZA1_IRQC=y
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
CONFIG_TS4800_IRQ=y
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_MESON_IRQ_GPIO=m
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
CONFIG_MST_IRQ=y
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
CONFIG_RESET_ATH79=y
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
CONFIG_RESET_BERLIN=y
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUDIO_ARB=y
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_POLARFIRE_SOC is not set
CONFIG_RESET_QCOM_AOSS=y
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_SOCFPGA=y
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_SUNPLUS=y
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SCI=y
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=y
CONFIG_RESET_TN48M_CPLD=y
CONFIG_RESET_ZYNQ=y
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_PISTACHIO_USB is not set
CONFIG_USB_LGM_PHY=y
CONFIG_PHY_CAN_TRANSCEIVER=m
CONFIG_PHY_SUN4I_USB=y
CONFIG_PHY_SUN6I_MIPI_DPHY=m
# CONFIG_PHY_SUN9I_USB is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=m
CONFIG_BCM_KONA_USB2_PHY=m
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_HI6220_USB=m
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
CONFIG_PHY_HISTB_COMBPHY=m
CONFIG_PHY_HISI_INNO_USB2=m
CONFIG_PHY_INGENIC_USB=m
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_PXA_USB is not set
CONFIG_PHY_MMP3_USB=y
CONFIG_PHY_MMP3_HSIC=m
CONFIG_PHY_CPCAP_USB=y
CONFIG_PHY_QCOM_USB_HS=m
# CONFIG_PHY_QCOM_USB_HSIC is not set
CONFIG_PHY_MT7621_PCI=m
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
CONFIG_PHY_ROCKCHIP_PCIE=y
CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=m
CONFIG_PHY_EXYNOS_MIPI_VIDEO=m
CONFIG_PHY_SAMSUNG_USB2=m
CONFIG_PHY_S5PV210_USB2=y
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=y
# CONFIG_PHY_STM32_USBPHYC is not set
CONFIG_PHY_TEGRA194_P2U=m
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_DM816X_USB=y
CONFIG_PHY_AM654_SERDES=m
CONFIG_OMAP_CONTROL_PHY=y
# CONFIG_TI_PIPE3 is not set
CONFIG_PHY_TUSB1210=y
CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
CONFIG_PHY_XILINX_ZYNQMP=m
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set
# CONFIG_RAS is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_APPLE_EFUSES=y
CONFIG_NVMEM_BCM_OCOTP=m
CONFIG_NVMEM_BRCM_NVRAM=y
CONFIG_NVMEM_IMX_IIM=m
# CONFIG_NVMEM_IMX_OCOTP is not set
CONFIG_NVMEM_LAN9662_OTPC=m
CONFIG_NVMEM_LAYERSCAPE_SFP=m
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_MTK_EFUSE is not set
CONFIG_NVMEM_MXS_OCOTP=y
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_NVMEM_QCOM_QFPROM is not set
# CONFIG_NVMEM_RMEM is not set
CONFIG_NVMEM_ROCKCHIP_EFUSE=m
CONFIG_NVMEM_ROCKCHIP_OTP=m
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
CONFIG_NVMEM_SUNPLUS_OCOTP=m
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=m

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
# CONFIG_MUX_ADGS1408 is not set
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
CONFIG_INTERCONNECT_IMX=y
# CONFIG_INTERCONNECT_IMX8MM is not set
CONFIG_INTERCONNECT_IMX8MN=y
CONFIG_INTERCONNECT_IMX8MQ=y
CONFIG_INTERCONNECT_IMX8MP=m
CONFIG_INTERCONNECT_QCOM_OSM_L3=m
# CONFIG_INTERCONNECT_SAMSUNG is not set
# CONFIG_COUNTER is not set
CONFIG_MOST=m
CONFIG_MOST_USB_HDM=m
CONFIG_MOST_CDEV=m
CONFIG_MOST_SND=m
CONFIG_PECI=m
CONFIG_PECI_CPU=m
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
CONFIG_EXT3_FS=m
CONFIG_EXT3_FS_POSIX_ACL=y
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=m
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=m
# CONFIG_REISERFS_FS is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
CONFIG_BTRFS_FS_RUN_SANITY_TESTS=y
CONFIG_BTRFS_DEBUG=y
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
# CONFIG_F2FS_FS_XATTR is not set
CONFIG_F2FS_CHECK_FS=y
CONFIG_F2FS_FAULT_INJECTION=y
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
CONFIG_ZONEFS_FS=m
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
CONFIG_NTFS_FS=y
CONFIG_NTFS_DEBUG=y
# CONFIG_NTFS_RW is not set
CONFIG_NTFS3_FS=m
CONFIG_NTFS3_LZX_XPRESS=y
CONFIG_NTFS3_FS_POSIX_ACL=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
# CONFIG_PROC_SYSCTL is not set
# CONFIG_PROC_PAGE_MONITOR is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=m
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_KEY_NOTIFICATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

CONFIG_CC_HAS_RANDSTRUCT=y
CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
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
CONFIG_CRYPTO_USER=m
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=m
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_ECDSA=m
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=m
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=m
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_NHPOLY1305=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
# CONFIG_CRYPTO_SEQIV is not set
# CONFIG_CRYPTO_ECHAINIV is not set
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_VMAC is not set
CONFIG_CRYPTO_WP512=y
# CONFIG_CRYPTO_XCBC is not set
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
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=m
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_USER_API_RNG=m
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
CONFIG_CRYPTO_USER_API_AEAD=m
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=y
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=m
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=m
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
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
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
# CONFIG_XZ_DEC_ARM is not set
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_DMA_GLOBAL_POOL=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=m
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=m
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
# CONFIG_FONT_8x16 is not set
CONFIG_FONT_6x11=y
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
CONFIG_FONT_ACORN_8x8=y
CONFIG_FONT_MINI_4x6=y
# CONFIG_FONT_6x10 is not set
CONFIG_FONT_10x18=y
CONFIG_FONT_SUN8x16=y
CONFIG_FONT_SUN12x22=y
CONFIG_FONT_TER16x32=y
CONFIG_FONT_6x8=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=m
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_POLYNOMIAL=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_SHIFT is not set
CONFIG_UBSAN_UNREACHABLE=y
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ENUM is not set
# CONFIG_TEST_UBSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_SLUB_DEBUG is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

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
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_LATENCYTOP=y
CONFIG_NOP_TRACER=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# hexagon Debugging
#
# end of hexagon Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
CONFIG_FAIL_FUTEX=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FAIL_MMC_REQUEST=y
# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--Is8vFBF1ovXf/jDd--
