Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B265F;
	Wed,  2 Nov 2022 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667379053; x=1698915053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8gF7kpBD15tRAFnOgk5R7Oam3VeOEgeOQjEGdhAGBs=;
  b=hcSglt0E+i7h1eIQDSEKzmVITsp0zHDtyI6ArjtFN3hmLvYV16aZk69U
   GSIboX2OgruEiYEO4L91SeIU0JblGmWDAjTpnMYoHENdXnR0wfQ7EhwMR
   nfriA0HCAX9yKUdJqbCMzx2I0F37ZOBKrz2dKn5pkjhmaxLC46QBh3l1S
   zTO6t0lLiSnyNztCfD12bApPDBOXGsk3pjrROe2tgSDLpJrejdMxSRpId
   Ha9spVJlaaR3kZYRqy4J/Wl81EnN+b4Nb5kHAeOzpl4a/Rwhdu0/eiybo
   il31mvxCDJ8B6GiCHtl3dTFO5QtTMTUd9nXw5N+yuMG2Cqi8tV9gmhqz3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310455411"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="310455411"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 01:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="703188535"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="703188535"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2022 01:50:50 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oq9ST-000Ecj-1q;
	Wed, 02 Nov 2022 08:50:49 +0000
Date: Wed, 2 Nov 2022 16:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 9/9] mm/hugetlb: convert move_hugetlb_state() to folios
Message-ID: <202211021609.6WDmSeHT-lkp@intel.com>
References: <20221101223059.460937-10-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="JIHnVD6SUagaZh/P"
Content-Disposition: inline
In-Reply-To: <20221101223059.460937-10-sidhartha.kumar@oracle.com>


--JIHnVD6SUagaZh/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sidhartha,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.1-rc3]
[cannot apply to next-20221102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidhartha-Kumar/convert-hugetlb_cgroup-helper-functions-to-folios/20221102-063530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20221101223059.460937-10-sidhartha.kumar%40oracle.com
patch subject: [PATCH v2 9/9] mm/hugetlb: convert move_hugetlb_state() to folios
config: hexagon-buildonly-randconfig-r002-20221101
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c67285acf1dfc36caae1be31cc1d6d9524fa5547
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sidhartha-Kumar/convert-hugetlb_cgroup-helper-functions-to-folios/20221102-063530
        git checkout c67285acf1dfc36caae1be31cc1d6d9524fa5547
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from mm/migrate.c:16:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
   In file included from mm/migrate.c:16:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
   In file included from mm/migrate.c:16:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
>> mm/migrate.c:1301:6: error: call to undeclared function 'hugetlb_folio_subpool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hugetlb_folio_subpool(src) && !folio_mapping(src)) {
               ^
   mm/migrate.c:1301:6: note: did you mean 'hugetlb_page_subpool'?
   include/linux/hugetlb.h:994:40: note: 'hugetlb_page_subpool' declared here
   static inline struct hugepage_subpool *hugetlb_page_subpool(struct page *hpage)
                                          ^
   6 warnings and 1 error generated.


vim +/hugetlb_folio_subpool +1301 mm/migrate.c

  1230	
  1231	/*
  1232	 * Counterpart of unmap_and_move_page() for hugepage migration.
  1233	 *
  1234	 * This function doesn't wait the completion of hugepage I/O
  1235	 * because there is no race between I/O and migration for hugepage.
  1236	 * Note that currently hugepage I/O occurs only in direct I/O
  1237	 * where no lock is held and PG_writeback is irrelevant,
  1238	 * and writeback status of all subpages are counted in the reference
  1239	 * count of the head page (i.e. if all subpages of a 2MB hugepage are
  1240	 * under direct I/O, the reference of the head page is 512 and a bit more.)
  1241	 * This means that when we try to migrate hugepage whose subpages are
  1242	 * doing direct I/O, some references remain after try_to_unmap() and
  1243	 * hugepage migration fails without data corruption.
  1244	 *
  1245	 * There is also no race when direct I/O is issued on the page under migration,
  1246	 * because then pte is replaced with migration swap entry and direct I/O code
  1247	 * will wait in the page fault for migration to complete.
  1248	 */
  1249	static int unmap_and_move_huge_page(new_page_t get_new_page,
  1250					free_page_t put_new_page, unsigned long private,
  1251					struct page *hpage, int force,
  1252					enum migrate_mode mode, int reason,
  1253					struct list_head *ret)
  1254	{
  1255		struct folio *dst, *src = page_folio(hpage);
  1256		int rc = -EAGAIN;
  1257		int page_was_mapped = 0;
  1258		struct page *new_hpage;
  1259		struct anon_vma *anon_vma = NULL;
  1260		struct address_space *mapping = NULL;
  1261	
  1262		/*
  1263		 * Migratability of hugepages depends on architectures and their size.
  1264		 * This check is necessary because some callers of hugepage migration
  1265		 * like soft offline and memory hotremove don't walk through page
  1266		 * tables or check whether the hugepage is pmd-based or not before
  1267		 * kicking migration.
  1268		 */
  1269		if (!hugepage_migration_supported(page_hstate(hpage)))
  1270			return -ENOSYS;
  1271	
  1272		if (folio_ref_count(src) == 1) {
  1273			/* page was freed from under us. So we are done. */
  1274			putback_active_hugepage(hpage);
  1275			return MIGRATEPAGE_SUCCESS;
  1276		}
  1277	
  1278		new_hpage = get_new_page(hpage, private);
  1279		if (!new_hpage)
  1280			return -ENOMEM;
  1281		dst = page_folio(new_hpage);
  1282	
  1283		if (!folio_trylock(src)) {
  1284			if (!force)
  1285				goto out;
  1286			switch (mode) {
  1287			case MIGRATE_SYNC:
  1288			case MIGRATE_SYNC_NO_COPY:
  1289				break;
  1290			default:
  1291				goto out;
  1292			}
  1293			folio_lock(src);
  1294		}
  1295	
  1296		/*
  1297		 * Check for pages which are in the process of being freed.  Without
  1298		 * folio_mapping() set, hugetlbfs specific move page routine will not
  1299		 * be called and we could leak usage counts for subpools.
  1300		 */
> 1301		if (hugetlb_folio_subpool(src) && !folio_mapping(src)) {
  1302			rc = -EBUSY;
  1303			goto out_unlock;
  1304		}
  1305	
  1306		if (folio_test_anon(src))
  1307			anon_vma = folio_get_anon_vma(src);
  1308	
  1309		if (unlikely(!folio_trylock(dst)))
  1310			goto put_anon;
  1311	
  1312		if (folio_mapped(src)) {
  1313			enum ttu_flags ttu = 0;
  1314	
  1315			if (!folio_test_anon(src)) {
  1316				/*
  1317				 * In shared mappings, try_to_unmap could potentially
  1318				 * call huge_pmd_unshare.  Because of this, take
  1319				 * semaphore in write mode here and set TTU_RMAP_LOCKED
  1320				 * to let lower levels know we have taken the lock.
  1321				 */
  1322				mapping = hugetlb_page_mapping_lock_write(hpage);
  1323				if (unlikely(!mapping))
  1324					goto unlock_put_anon;
  1325	
  1326				ttu = TTU_RMAP_LOCKED;
  1327			}
  1328	
  1329			try_to_migrate(src, ttu);
  1330			page_was_mapped = 1;
  1331	
  1332			if (ttu & TTU_RMAP_LOCKED)
  1333				i_mmap_unlock_write(mapping);
  1334		}
  1335	
  1336		if (!folio_mapped(src))
  1337			rc = move_to_new_folio(dst, src, mode);
  1338	
  1339		if (page_was_mapped)
  1340			remove_migration_ptes(src,
  1341				rc == MIGRATEPAGE_SUCCESS ? dst : src, false);
  1342	
  1343	unlock_put_anon:
  1344		folio_unlock(dst);
  1345	
  1346	put_anon:
  1347		if (anon_vma)
  1348			put_anon_vma(anon_vma);
  1349	
  1350		if (rc == MIGRATEPAGE_SUCCESS) {
  1351			move_hugetlb_state(src, dst, reason);
  1352			put_new_page = NULL;
  1353		}
  1354	
  1355	out_unlock:
  1356		folio_unlock(src);
  1357	out:
  1358		if (rc == MIGRATEPAGE_SUCCESS)
  1359			putback_active_hugepage(hpage);
  1360		else if (rc != -EAGAIN)
  1361			list_move_tail(&src->lru, ret);
  1362	
  1363		/*
  1364		 * If migration was not successful and there's a freeing callback, use
  1365		 * it.  Otherwise, put_page() will drop the reference grabbed during
  1366		 * isolation.
  1367		 */
  1368		if (put_new_page)
  1369			put_new_page(new_hpage, private);
  1370		else
  1371			putback_active_hugepage(new_hpage);
  1372	
  1373		return rc;
  1374	}
  1375	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--JIHnVD6SUagaZh/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/hexagon 6.1.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)"
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
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set

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
CONFIG_TIME_KUNIT_TEST=m

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
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
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_PRINTK_INDEX=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
# CONFIG_MEMCG is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_ELF_CORE is not set
# CONFIG_BASE_FULL is not set
# CONFIG_FUTEX is not set
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
CONFIG_IO_URING=y
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
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
# CONFIG_SMP is not set
CONFIG_NR_CPUS=1
# CONFIG_PAGE_SIZE_4KB is not set
# CONFIG_PAGE_SIZE_16KB is not set
# CONFIG_PAGE_SIZE_64KB is not set
CONFIG_PAGE_SIZE_256KB=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
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
CONFIG_ISA_BUS_API=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_ARCH_NO_PREEMPT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS_NONE is not set
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
CONFIG_MODULE_COMPRESS_ZSTD=y
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=m
CONFIG_UNINLINE_SPIN_UNLOCK=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_FLATMEM=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
# CONFIG_IDLE_PAGE_TRACKING is not set
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y
CONFIG_USERFAULTFD=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=m
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_AC97=m
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BT1_APB is not set
CONFIG_BT1_AXI=y
CONFIG_INTEL_IXP4XX_EB=y
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=m
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_HAVE_MSG=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_VERSION1_COMPLIANCE=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=m
CONFIG_ARM_SCMI_POWER_CONTROL=m
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_ARM_SCPI_POWER_DOMAIN=m
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_MTK_ADSP_IPC=m
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
# CONFIG_BCM47XX_NVRAM is not set
CONFIG_TEE_BNXT_FW=m
CONFIG_CS_DSP=m
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_IMX_DSP=m
# CONFIG_IMX_SCU is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_BCM63XX_PARTS=y
CONFIG_MTD_BRCM_U_BOOT=y
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_PARSER_IMAGETAG=y
CONFIG_MTD_PARSER_TRX=y
CONFIG_MTD_SHARPSL_PARTS=m
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_OTP is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=m
# CONFIG_MTD_PHYSMAP_COMPAT is not set
# CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
CONFIG_MTD_TS5500=y
CONFIG_MTD_PCMCIA=m
CONFIG_MTD_PCMCIA_ANONYMOUS=y
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_SPEAR_SMI=y
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
# CONFIG_MTD_ONENAND_GENERIC is not set
# CONFIG_MTD_ONENAND_SAMSUNG is not set
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_AMS_DELTA=m
CONFIG_MTD_NAND_SHARPSL=y
CONFIG_MTD_NAND_ATMEL=y
# CONFIG_MTD_NAND_MARVELL is not set
# CONFIG_MTD_NAND_SLC_LPC32XX is not set
CONFIG_MTD_NAND_MLC_LPC32XX=m
# CONFIG_MTD_NAND_BRCMNAND is not set
# CONFIG_MTD_NAND_OXNAS is not set
CONFIG_MTD_NAND_GPMI_NAND=y
CONFIG_MTD_NAND_FSL_IFC=y
CONFIG_MTD_NAND_VF610_NFC=y
CONFIG_MTD_NAND_SH_FLCTL=m
CONFIG_MTD_NAND_DAVINCI=m
CONFIG_MTD_NAND_TXX9NDFMC=m
CONFIG_MTD_NAND_SUNXI=y
# CONFIG_MTD_NAND_HISI504 is not set
CONFIG_MTD_NAND_QCOM=m
CONFIG_MTD_NAND_MXIC=m
# CONFIG_MTD_NAND_TEGRA is not set
# CONFIG_MTD_NAND_STM32_FMC2 is not set
CONFIG_MTD_NAND_MESON=m
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
# CONFIG_MTD_NAND_CADENCE is not set
CONFIG_MTD_NAND_ARASAN=m
CONFIG_MTD_NAND_INTEL_LGM=y
# CONFIG_MTD_NAND_RENESAS is not set

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
CONFIG_MTD_NAND_DISKONCHIP=m
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
CONFIG_MTD_NAND_ECC_MXIC=y
# CONFIG_MTD_NAND_ECC_MEDIATEK is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_PARPORT=m
CONFIG_PARPORT_AX88796=m
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
CONFIG_DUMMY_IRQ=m
CONFIG_ICS932S401=m
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_QCOM_COINCELL is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=y
CONFIG_DS1682=m
CONFIG_SRAM=y
CONFIG_XILINX_SDFEC=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=m
CONFIG_ECHO=m
CONFIG_UACCE=m
CONFIG_PVPANIC=y
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=m
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
CONFIG_KEYBOARD_ADP5520=y
CONFIG_KEYBOARD_ADP5588=m
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_ATKBD is not set
CONFIG_KEYBOARD_QT1050=y
CONFIG_KEYBOARD_QT1070=m
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_CLPS711X=y
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_EP93XX=m
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=m
CONFIG_KEYBOARD_TCA6416=y
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=y
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_IMX=m
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
CONFIG_KEYBOARD_PMIC8XXX=m
# CONFIG_KEYBOARD_SAMSUNG is not set
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
# CONFIG_KEYBOARD_STOWAWAY is not set
CONFIG_KEYBOARD_ST_KEYSCAN=y
CONFIG_KEYBOARD_SUNKBD=m
# CONFIG_KEYBOARD_SH_KEYSC is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=m
CONFIG_KEYBOARD_XTKBD=m
CONFIG_KEYBOARD_CROS_EC=m
CONFIG_KEYBOARD_MT6779=y
CONFIG_KEYBOARD_MTK_PMIC=y
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADC=y
CONFIG_JOYSTICK_ADI=y
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=m
CONFIG_JOYSTICK_GUILLEMOT=y
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_232 is not set
# CONFIG_JOYSTICK_WARRIOR is not set
# CONFIG_JOYSTICK_MAGELLAN is not set
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
# CONFIG_JOYSTICK_STINGER is not set
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_DB9=m
CONFIG_JOYSTICK_GAMECON=m
CONFIG_JOYSTICK_TURBOGRAFX=m
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=m
# CONFIG_JOYSTICK_WALKERA0701 is not set
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=m
CONFIG_JOYSTICK_SENSEHAT=y
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_88PM860X=y
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=m
CONFIG_TOUCHSCREEN_ADC=y
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
CONFIG_TOUCHSCREEN_AUO_PIXCIR=m
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CY8CTMA140 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=m
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=m
CONFIG_TOUCHSCREEN_DA9052=m
CONFIG_TOUCHSCREEN_DYNAPRO=y
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
CONFIG_TOUCHSCREEN_EETI=m
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=y
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_HIDEEP=m
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_ILI210X=m
CONFIG_TOUCHSCREEN_ILITEK=m
CONFIG_TOUCHSCREEN_IPROC=m
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
CONFIG_TOUCHSCREEN_EKTF2127=y
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=y
CONFIG_TOUCHSCREEN_WACOM_W8001=y
CONFIG_TOUCHSCREEN_WACOM_I2C=y
CONFIG_TOUCHSCREEN_MAX11801=m
# CONFIG_TOUCHSCREEN_MCS5000 is not set
CONFIG_TOUCHSCREEN_MMS114=y
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
CONFIG_TOUCHSCREEN_INEXIO=m
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=m
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
CONFIG_TOUCHSCREEN_RASPBERRYPI_FW=m
CONFIG_TOUCHSCREEN_MIGOR=m
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
CONFIG_TOUCHSCREEN_TOUCHWIN=m
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
CONFIG_TOUCHSCREEN_UCB1400=m
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM97XX is not set
CONFIG_TOUCHSCREEN_MXS_LRADC=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
# CONFIG_TOUCHSCREEN_TSC2004 is not set
CONFIG_TOUCHSCREEN_TSC2007=m
# CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
CONFIG_TOUCHSCREEN_SILEAD=y
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=m
CONFIG_TOUCHSCREEN_STMFTS=m
CONFIG_TOUCHSCREEN_SUN4I=m
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=m
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=m
CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
CONFIG_TOUCHSCREEN_IQS5XX=m
# CONFIG_TOUCHSCREEN_ZINITIX is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM860X_ONKEY is not set
CONFIG_INPUT_88PM80X_ONKEY=m
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
CONFIG_INPUT_ARIZONA_HAPTICS=m
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
CONFIG_INPUT_BMA150=m
CONFIG_INPUT_E3X0_BUTTON=m
CONFIG_INPUT_PM8XXX_VIBRATOR=m
CONFIG_INPUT_PMIC8XXX_PWRKEY=m
CONFIG_INPUT_MAX77650_ONKEY=m
CONFIG_INPUT_MAX8925_ONKEY=m
CONFIG_INPUT_MMA8450=y
CONFIG_INPUT_GPIO_BEEPER=m
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_GPIO_VIBRA=m
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=m
CONFIG_INPUT_RETU_PWRBUTTON=y
CONFIG_INPUT_AXP20X_PEK=m
# CONFIG_INPUT_TWL6040_VIBRA is not set
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PCF8574=m
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA7280_HAPTICS=y
CONFIG_INPUT_DA9052_ONKEY=y
# CONFIG_INPUT_DA9055_ONKEY is not set
CONFIG_INPUT_DA9063_ONKEY=y
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IBM_PANEL=y
CONFIG_INPUT_IQS269A=y
CONFIG_INPUT_IQS626A=m
CONFIG_INPUT_IQS7222=y
CONFIG_INPUT_CMA3000=m
# CONFIG_INPUT_CMA3000_I2C is not set
CONFIG_INPUT_DRV260X_HAPTICS=m
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_INPUT_HISI_POWERKEY=y
# CONFIG_INPUT_SC27XX_VIBRA is not set
# CONFIG_INPUT_RT5120_PWRKEY is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=m
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_OLPC_APSP=y
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=m
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
# CONFIG_CONSOLE_TRANSLATIONS is not set
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
# CONFIG_UNIX98_PTYS is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=m
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
# CONFIG_SERIAL_8250_DMA is not set
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250_DETECT_IRQ=y
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_BCM2835AUX=m
CONFIG_SERIAL_8250_DW=m
# CONFIG_SERIAL_8250_EM is not set
CONFIG_SERIAL_8250_IOC3=m
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_OMAP is not set
# CONFIG_SERIAL_8250_MT6577 is not set
CONFIG_SERIAL_8250_UNIPHIER=m
# CONFIG_SERIAL_8250_PXA is not set
# CONFIG_SERIAL_8250_TEGRA is not set
# CONFIG_SERIAL_8250_BCM7271 is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=m
# CONFIG_SERIAL_ATMEL is not set
CONFIG_SERIAL_MESON=m
# CONFIG_SERIAL_MESON_CONSOLE is not set
CONFIG_SERIAL_CLPS711X=m
CONFIG_SERIAL_SAMSUNG=m
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_TEGRA=y
# CONFIG_SERIAL_TEGRA_TCU is not set
CONFIG_SERIAL_IMX=m
CONFIG_SERIAL_IMX_CONSOLE=m
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_SH_SCI_CONSOLE=y
CONFIG_SERIAL_SH_SCI_EARLYCON=y
# CONFIG_SERIAL_SH_SCI_DMA is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_MSM=m
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=m
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=m
CONFIG_SERIAL_BCM63XX=m
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
CONFIG_SERIAL_MXS_AUART=m
# CONFIG_SERIAL_MPS2_UART is not set
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_SPRD=y
CONFIG_SERIAL_SPRD_CONSOLE=y
CONFIG_SERIAL_STM32=y
CONFIG_SERIAL_STM32_CONSOLE=y
CONFIG_SERIAL_MVEBU_UART=y
# CONFIG_SERIAL_MVEBU_CONSOLE is not set
CONFIG_SERIAL_OWL=m
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_LITEUART is not set
# CONFIG_SERIAL_SUNPLUS is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=y
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=m
CONFIG_TTY_PRINTK_LEVEL=6
CONFIG_PRINTER=m
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=y
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=y
CONFIG_IPMI_KCS_BMC=m
CONFIG_ASPEED_KCS_IPMI_BMC=m
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=m
# CONFIG_IPMI_KCS_BMC_SERIO is not set
CONFIG_ASPEED_BT_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_BCM2835=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
CONFIG_HW_RANDOM_VIRTIO=m
# CONFIG_HW_RANDOM_IMX_RNGC is not set
# CONFIG_HW_RANDOM_NOMADIK is not set
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=y
# CONFIG_HW_RANDOM_MTK is not set
# CONFIG_HW_RANDOM_EXYNOS is not set
# CONFIG_HW_RANDOM_NPCM is not set
CONFIG_HW_RANDOM_XIPHERA=y

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
# CONFIG_CARDMAN_4000 is not set
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=m
# CONFIG_HW_RANDOM_TPM is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_SYNQUACER is not set
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
CONFIG_I2C_AXXIA=y
# CONFIG_I2C_BCM2835 is not set
CONFIG_I2C_BCM_IPROC=m
CONFIG_I2C_BCM_KONA=m
CONFIG_I2C_BRCMSTB=m
CONFIG_I2C_CADENCE=m
CONFIG_I2C_CBUS_GPIO=m
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DIGICOLOR is not set
CONFIG_I2C_EMEV2=m
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_HIGHLANDER=m
CONFIG_I2C_HISI=m
CONFIG_I2C_IMG=m
CONFIG_I2C_IMX=y
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_IOP3XX=y
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_MESON=m
CONFIG_I2C_MT65XX=y
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
CONFIG_I2C_NPCM=y
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_OMAP=m
CONFIG_I2C_OWL=m
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
# CONFIG_I2C_QUP is not set
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RZV2M is not set
CONFIG_I2C_S3C2410=m
CONFIG_I2C_SH_MOBILE=y
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_SPRD is not set
# CONFIG_I2C_ST is not set
CONFIG_I2C_STM32F4=m
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=m
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=m
CONFIG_I2C_UNIPHIER_F=y
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_WMT=m
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=m
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
# CONFIG_I2C_CROS_EC_TUNNEL is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=m
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=m
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=m
# CONFIG_SPMI_MSM_PMIC_ARB is not set
CONFIG_SPMI_MTK_PMIF=m
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_CY8C95X0=m
CONFIG_PINCTRL_DA9062=m
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08=m
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L90=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
CONFIG_PINCTRL_PFC_R8A77995=y
CONFIG_PINCTRL_PFC_R8A7794=y
# CONFIG_PINCTRL_PFC_R8A77990 is not set
CONFIG_PINCTRL_PFC_R8A7779=y
# CONFIG_PINCTRL_PFC_R8A7790 is not set
CONFIG_PINCTRL_PFC_R8A77950=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
CONFIG_PINCTRL_PFC_R8A7793=y
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
CONFIG_PINCTRL_PFC_R8A77960=y
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A779F0=y
CONFIG_PINCTRL_PFC_R8A7792=y
CONFIG_PINCTRL_PFC_R8A77980=y
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
# CONFIG_PINCTRL_PFC_R8A7740 is not set
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_PFC_R8A77470=y
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
# CONFIG_PINCTRL_PFC_R8A7743 is not set
CONFIG_PINCTRL_PFC_R8A7744=y
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
CONFIG_PINCTRL_PFC_SH7203=y
CONFIG_PINCTRL_PFC_SH7264=y
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
CONFIG_PINCTRL_PFC_SH7757=y
CONFIG_PINCTRL_PFC_SH7785=y
CONFIG_PINCTRL_PFC_SH7786=y
CONFIG_PINCTRL_PFC_SH73A0=y
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=m
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_ATH79 is not set
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_HISI=y
CONFIG_GPIO_IOP=y
CONFIG_GPIO_MB86S7X=m
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_MXC=m
CONFIG_GPIO_MXS=y
CONFIG_GPIO_PXA=y
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_ROCKCHIP is not set
CONFIG_GPIO_SIOX=y
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XLP is not set
# CONFIG_GPIO_AMD_FCH is not set
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=m
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=m
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5520 is not set
# CONFIG_GPIO_ARIZONA is not set
# CONFIG_GPIO_BD9571MWV is not set
# CONFIG_GPIO_CRYSTAL_COVE is not set
# CONFIG_GPIO_DA9052 is not set
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_MADERA=m
# CONFIG_GPIO_MAX77620 is not set
CONFIG_GPIO_MAX77650=y
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_SL28CPLD=m
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS6586X=y
CONFIG_GPIO_TPS65910=y
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_TQMX86 is not set
CONFIG_GPIO_TWL6040=m
CONFIG_GPIO_UCB1400=m
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=m
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=m
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_MXC=y
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
# CONFIG_W1_SLAVE_DS2438 is not set
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
# CONFIG_W1_SLAVE_DS28E04 is not set
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_PDA_POWER=m
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_IP5XXX_POWER=y
CONFIG_MAX8925_POWER=m
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_88PM860X is not set
CONFIG_CHARGER_ADP5061=m
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SAMSUNG_SDI=y
# CONFIG_BATTERY_INGENIC is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_DA9150=y
CONFIG_AXP20X_POWER=m
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_LP8788=y
CONFIG_CHARGER_GPIO=m
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_MAX77650=m
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MAX8998=m
CONFIG_CHARGER_MP2629=m
# CONFIG_CHARGER_MT6360 is not set
# CONFIG_CHARGER_MT6370 is not set
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=m
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=y
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_CROS_USBPD=m
CONFIG_CHARGER_CROS_PCHG=m
CONFIG_CHARGER_SC2731=m
CONFIG_FUEL_GAUGE_SC27XX=y
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_ACER_A500=m
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
CONFIG_SENSORS_ADM1021=y
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=m
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_AHT10=m
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_ARM_SCMI=m
CONFIG_SENSORS_ARM_SCPI=y
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ASPEED=m
# CONFIG_SENSORS_ATXP1 is not set
CONFIG_SENSORS_BT1_PVT=y
CONFIG_SENSORS_BT1_PVT_ALARMS=y
CONFIG_SENSORS_CORSAIR_CPRO=m
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_DA9055=y
CONFIG_SENSORS_SPARX5=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=y
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_IIO_HWMON=m
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LAN966X=y
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC2992=y
CONFIG_SENSORS_LTC4151=m
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=y
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_MAX127 is not set
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
CONFIG_SENSORS_MENF21BMC_HWMON=m
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=m
CONFIG_SENSORS_NPCM7XX=m
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1266=m
# CONFIG_SENSORS_ADM1275 is not set
# CONFIG_SENSORS_BEL_PFE is not set
CONFIG_SENSORS_BPA_RS600=m
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
CONFIG_SENSORS_FSP_3Y=m
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_DPS920AB=m
# CONFIG_SENSORS_INSPUR_IPSPS is not set
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
# CONFIG_SENSORS_IR38064_REGULATOR is not set
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LM25066_REGULATOR=y
CONFIG_SENSORS_LT7182S=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_MP2888=m
CONFIG_SENSORS_MP2975=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_PIM4328=m
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
CONFIG_SENSORS_Q54SJ108A2=m
CONFIG_SENSORS_STPDDC60=m
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
# CONFIG_SENSORS_UCD9000 is not set
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_XDPE152=m
CONFIG_SENSORS_XDPE122=m
# CONFIG_SENSORS_XDPE122_REGULATOR is not set
# CONFIG_SENSORS_ZL6100 is not set
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
CONFIG_SENSORS_SL28CPLD=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=y
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
CONFIG_SENSORS_STTS751=m
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=y
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA238=y
CONFIG_SENSORS_INA3221=m
CONFIG_SENSORS_TC74=y
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=m
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=y
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=y
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=m
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
CONFIG_DA9052_WATCHDOG=y
# CONFIG_DA9055_WATCHDOG is not set
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
CONFIG_MENF21BMC_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_SL28CPLD_WATCHDOG=y
# CONFIG_ARMADA_37XX_WATCHDOG is not set
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=m
CONFIG_SAMA5D4_WATCHDOG=m
CONFIG_CADENCE_WATCHDOG=m
# CONFIG_FTWDT010_WATCHDOG is not set
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
CONFIG_EP93XX_WATCHDOG=m
CONFIG_OMAP_WATCHDOG=m
CONFIG_PNX4008_WATCHDOG=y
# CONFIG_DAVINCI_WATCHDOG is not set
CONFIG_K3_RTI_WATCHDOG=y
# CONFIG_RN5T618_WATCHDOG is not set
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=y
CONFIG_TS72XX_WATCHDOG=m
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_MAX77620_WATCHDOG is not set
CONFIG_IMX2_WDT=y
# CONFIG_IMX7ULP_WDT is not set
CONFIG_RETU_WATCHDOG=m
CONFIG_MOXART_WDT=y
CONFIG_TEGRA_WATCHDOG=m
CONFIG_QCOM_WDT=m
CONFIG_MESON_GXBB_WATCHDOG=y
# CONFIG_MESON_WATCHDOG is not set
# CONFIG_MEDIATEK_WATCHDOG is not set
CONFIG_DIGICOLOR_WATCHDOG=y
# CONFIG_LPC18XX_WATCHDOG is not set
CONFIG_RENESAS_WDT=y
CONFIG_RENESAS_RZAWDT=m
CONFIG_RENESAS_RZN1WDT=y
CONFIG_RENESAS_RZG2LWDT=m
CONFIG_ASPEED_WATCHDOG=y
CONFIG_REALTEK_OTTO_WDT=m
# CONFIG_SPRD_WATCHDOG is not set
# CONFIG_VISCONTI_WATCHDOG is not set
CONFIG_MSC313E_WATCHDOG=y
# CONFIG_APPLE_WATCHDOG is not set
# CONFIG_SUNPLUS_WATCHDOG is not set
CONFIG_SC520_WDT=y
# CONFIG_KEMPLD_WDT is not set
# CONFIG_BCM47XX_WDT is not set
CONFIG_BCM_KONA_WDT=m
CONFIG_BCM_KONA_WDT_DEBUG=y
CONFIG_BCM7038_WDT=m
CONFIG_IMGPDC_WDT=m
# CONFIG_MPC5200_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_UML_WATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_SUN4I_GPADC=m
# CONFIG_MFD_AS3711 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=m
CONFIG_MFD_ATMEL_SMC=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_CROS_EC_DEV=m
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
CONFIG_MFD_ENE_KB3930=m
CONFIG_MFD_EXYNOS_LPASS=m
# CONFIG_MFD_MC13XXX_I2C is not set
CONFIG_MFD_MP2629=y
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_HTC_PASIC3=m
CONFIG_HTC_I2CPLD=y
CONFIG_INTEL_SOC_PMIC=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=m
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=y
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_NTXEC=m
CONFIG_MFD_RETU=y
# CONFIG_MFD_PCF50633 is not set
CONFIG_UCB1400_CORE=m
CONFIG_MFD_PM8XXX=m
CONFIG_MFD_SY7636A=m
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SEC_CORE=m
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_ABX500_CORE=y
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=m
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_TQMX86=y
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=m
CONFIG_MFD_STM32_LPTIMER=m
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STMFX is not set
CONFIG_MFD_WCD934X=m
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_MFD_KHADAS_MCU=m
CONFIG_MFD_ACER_A500_EC=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
# CONFIG_REGULATOR_88PM800 is not set
# CONFIG_REGULATOR_88PM8607 is not set
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
# CONFIG_REGULATOR_AAT2870 is not set
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
CONFIG_REGULATOR_ARIZONA_MICSUPP=m
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BD9571MWV=m
CONFIG_REGULATOR_DA9052=m
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9062 is not set
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_FAN53880=m
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=m
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP8788=m
CONFIG_REGULATOR_LTC3589=y
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX8649=m
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8893=m
# CONFIG_REGULATOR_MAX8907 is not set
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX8998=m
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX77686=m
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77802 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MP8859=m
CONFIG_REGULATOR_MP886X=y
# CONFIG_REGULATOR_MT6311 is not set
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6360=y
# CONFIG_REGULATOR_MT6370 is not set
CONFIG_REGULATOR_PBIAS=m
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=m
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=m
CONFIG_REGULATOR_RT6245=y
CONFIG_REGULATOR_RTQ2134=y
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=m
CONFIG_REGULATOR_S2MPA01=m
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=m
CONFIG_REGULATOR_SC2731=m
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_STM32_BOOSTER=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STM32_PWR=y
# CONFIG_REGULATOR_TI_ABB is not set
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SY7636A=m
CONFIG_REGULATOR_SY8106A=m
# CONFIG_REGULATOR_SY8824X is not set
CONFIG_REGULATOR_SY8827N=y
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=m
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS65910=y
CONFIG_REGULATOR_TPS65912=m
CONFIG_REGULATOR_TPS68470=m
CONFIG_REGULATOR_WM8400=m
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_REGULATOR_QCOM_LABIBB=m
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
# CONFIG_IR_IMON_DECODER is not set
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_RCMM_DECODER=m
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=m
# CONFIG_IR_SONY_DECODER is not set
CONFIG_IR_XMP_DECODER=m
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
CONFIG_IR_FINTEK=m
CONFIG_IR_GPIO_CIR=m
# CONFIG_IR_GPIO_TX is not set
# CONFIG_IR_HIX5HD2 is not set
# CONFIG_IR_ITE_CIR is not set
CONFIG_IR_MESON=m
# CONFIG_IR_MESON_TX is not set
CONFIG_IR_MTK=m
CONFIG_IR_NUVOTON=m
CONFIG_IR_RX51=m
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_SUNXI=m
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_LOOPBACK is not set
CONFIG_RC_ST=m
CONFIG_IR_IMG=m
# CONFIG_IR_IMG_RAW is not set
CONFIG_IR_IMG_HW=y
CONFIG_IR_IMG_NEC=y
# CONFIG_IR_IMG_JVC is not set
# CONFIG_IR_IMG_SONY is not set
# CONFIG_IR_IMG_SHARP is not set
CONFIG_IR_IMG_SANYO=y
# CONFIG_IR_IMG_RC5 is not set
CONFIG_IR_IMG_RC6=y
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_RC=y
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_KUNIT_TEST=m
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_BUDDY=m
CONFIG_DRM_GEM_DMA_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_KMB_DISPLAY=m
CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_SUN4I is not set
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
# end of Display Interface Bridges

CONFIG_DRM_V3D=m
CONFIG_DRM_ETNAVIV=m
# CONFIG_DRM_ETNAVIV_THERMAL is not set
# CONFIG_DRM_LOGICVC is not set
CONFIG_DRM_SIMPLEDRM=m
# CONFIG_DRM_PL111 is not set
# CONFIG_DRM_SSD130X is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_EXPORT_FOR_TESTS=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_MACMODES=y
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_IMX is not set
CONFIG_FB_ARC=y
CONFIG_FB_CONTROL=y
# CONFIG_FB_GBE is not set
CONFIG_FB_PVR2=y
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_WM8505 is not set
# CONFIG_FB_PXA168 is not set
# CONFIG_FB_W100 is not set
CONFIG_FB_SH_MOBILE_LCDC=m
CONFIG_FB_TMIO=y
CONFIG_FB_TMIO_ACCELL=y
CONFIG_FB_S3C=m
CONFIG_FB_S3C_DEBUG_REGWRITE=y
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_DA8XX is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
CONFIG_FB_BROADSHEET=m
CONFIG_FB_SIMPLE=m
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_OMAP_LCD_H3 is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=m
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_DA9052=y
CONFIG_BACKLIGHT_MAX8925=y
# CONFIG_BACKLIGHT_MT6370 is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=y
# CONFIG_BACKLIGHT_ADP5520 is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_88PM860X is not set
CONFIG_BACKLIGHT_AAT2870=m
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=y
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# CONFIG_FRAMEBUFFER_CONSOLE is not set
# end of Console display driver support

CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
# CONFIG_SND_PCM_TIMER is not set
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_CTL_FAST_LOOKUP is not set
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
CONFIG_SND_CTL_INPUT_VALIDATION=y
CONFIG_SND_CTL_DEBUG=y
CONFIG_SND_JACK_INJECTION_DEBUG=y
CONFIG_SND_VMASTER=y
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
# CONFIG_SND_DRIVERS is not set

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_PXA2XX_LIB=m
# CONFIG_SND_FIREWIRE is not set
CONFIG_SND_PCMCIA=y
CONFIG_SND_VXPOCKET=m
CONFIG_SND_PDAUDIOCF=m
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
# CONFIG_SND_SOC_UTILS_KUNIT_TEST is not set
# CONFIG_SND_SOC_ADI is not set
# CONFIG_SND_SOC_AMD_ACP is not set
CONFIG_SND_AMD_ACP_CONFIG=m
CONFIG_SND_SOC_APPLE_MCA=m
CONFIG_SND_ATMEL_SOC=m
CONFIG_SND_ATMEL_SOC_CLASSD=m
# CONFIG_SND_BCM2835_SOC_I2S is not set
# CONFIG_SND_SOC_CYGNUS is not set
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
CONFIG_SND_EP93XX_SOC=m
CONFIG_SND_DESIGNWARE_I2S=m
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=m
# CONFIG_SND_SOC_FSL_MQS is not set
CONFIG_SND_SOC_FSL_AUDMIX=m
# CONFIG_SND_SOC_FSL_SSI is not set
CONFIG_SND_SOC_FSL_SPDIF=m
CONFIG_SND_SOC_FSL_ESAI=m
CONFIG_SND_SOC_FSL_MICFIL=m
# CONFIG_SND_SOC_FSL_XCVR is not set
CONFIG_SND_SOC_FSL_AUD2HTX=m
CONFIG_SND_SOC_FSL_UTILS=m
CONFIG_SND_SOC_IMX_PCM_DMA=m
CONFIG_SND_SOC_IMX_AUDMUX=m
CONFIG_SND_IMX_SOC=m

#
# SoC Audio support for Freescale i.MX boards:
#
CONFIG_SND_SOC_IMX_SPDIF=m
# CONFIG_SND_SOC_IMX_AUDMIX is not set
CONFIG_SND_SOC_IMX_HDMI=m
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=m
CONFIG_SND_JZ4740_SOC_I2S=m
# CONFIG_SND_KIRKWOOD_SOC is not set
CONFIG_SND_SOC_IMG=y
# CONFIG_SND_SOC_IMG_I2S_IN is not set
CONFIG_SND_SOC_IMG_I2S_OUT=m
CONFIG_SND_SOC_IMG_PARALLEL_OUT=m
# CONFIG_SND_SOC_IMG_SPDIF_IN is not set
CONFIG_SND_SOC_IMG_SPDIF_OUT=m
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=m
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SOC_INTEL_KEEMBAY=m
CONFIG_SND_SOC_INTEL_MACH=y
# CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
CONFIG_SND_SOC_MEDIATEK=m
# CONFIG_SND_SOC_MT8186 is not set
CONFIG_SND_SOC_MTK_BTCVSD=m
CONFIG_SND_SOC_MT8195=m

#
# ASoC support for Amlogic platforms
#
CONFIG_SND_MESON_AIU=m
CONFIG_SND_MESON_AXG_FIFO=m
CONFIG_SND_MESON_AXG_FRDDR=m
# CONFIG_SND_MESON_AXG_TODDR is not set
CONFIG_SND_MESON_AXG_TDM_FORMATTER=m
CONFIG_SND_MESON_AXG_TDM_INTERFACE=m
# CONFIG_SND_MESON_AXG_TDMIN is not set
CONFIG_SND_MESON_AXG_TDMOUT=m
CONFIG_SND_MESON_AXG_SOUND_CARD=m
# CONFIG_SND_MESON_AXG_SPDIFOUT is not set
CONFIG_SND_MESON_AXG_SPDIFIN=m
# CONFIG_SND_MESON_AXG_PDM is not set
CONFIG_SND_MESON_CARD_UTILS=m
CONFIG_SND_MESON_CODEC_GLUE=m
CONFIG_SND_MESON_GX_SOUND_CARD=m
# CONFIG_SND_MESON_G12A_TOACODEC is not set
# CONFIG_SND_MESON_G12A_TOHDMITX is not set
CONFIG_SND_SOC_MESON_T9015=m
# end of ASoC support for Amlogic platforms

CONFIG_SND_MXS_SOC=m
# CONFIG_SND_SOC_MXS_SGTL5000 is not set
CONFIG_SND_PXA2XX_SOC=m
CONFIG_SND_SOC_QCOM=m
CONFIG_SND_SOC_LPASS_CPU=m
CONFIG_SND_SOC_LPASS_HDMI=m
CONFIG_SND_SOC_LPASS_PLATFORM=m
CONFIG_SND_SOC_LPASS_IPQ806X=m
CONFIG_SND_SOC_LPASS_APQ8016=m
CONFIG_SND_SOC_LPASS_SC7180=m
CONFIG_SND_SOC_STORM=m
CONFIG_SND_SOC_APQ8016_SBC=m
CONFIG_SND_SOC_QCOM_COMMON=m
CONFIG_SND_SOC_SC7180=m
CONFIG_SND_SOC_ROCKCHIP=m
CONFIG_SND_SOC_ROCKCHIP_I2S=m
CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
# CONFIG_SND_SOC_ROCKCHIP_PDM is not set
CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
CONFIG_SND_SOC_ROCKCHIP_MAX98090=m
# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
CONFIG_SND_SOC_RK3288_HDMI_ANALOG=m
CONFIG_SND_SOC_SAMSUNG=m
CONFIG_SND_S3C24XX_I2S=m
CONFIG_SND_SAMSUNG_PCM=m
CONFIG_SND_SAMSUNG_SPDIF=m
CONFIG_SND_SAMSUNG_I2S=m
# CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753 is not set
# CONFIG_SND_SOC_SAMSUNG_SMDK_WM8580 is not set
CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994=m
CONFIG_SND_SOC_SAMSUNG_S3C24XX_UDA134X=m
CONFIG_SND_SOC_SAMSUNG_SIMTEC=m
CONFIG_SND_SOC_SAMSUNG_SIMTEC_TLV320AIC23=m
CONFIG_SND_SOC_SAMSUNG_SIMTEC_HERMES=m
CONFIG_SND_SOC_SAMSUNG_H1940_UDA1380=m
CONFIG_SND_SOC_SAMSUNG_RX1950_UDA1380=m
# CONFIG_SND_SOC_SMARTQ is not set
CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF=m
# CONFIG_SND_SOC_SMDK_WM8994_PCM is not set
CONFIG_SND_SOC_TOBERMORY=m
CONFIG_SND_SOC_LOWLAND=m
# CONFIG_SND_SOC_LITTLEMILL is not set
CONFIG_SND_SOC_SNOW=m
# CONFIG_SND_SOC_ODROID is not set
CONFIG_SND_SOC_ARNDALE=m
CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994=m
CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811=m

#
# SoC Audio support for Renesas SoCs
#
CONFIG_SND_SOC_SH4_FSI=m
CONFIG_SND_SOC_RCAR=m
CONFIG_SND_SOC_RZ=m
# end of SoC Audio support for Renesas SoCs

# CONFIG_SND_SOC_SOF_TOPLEVEL is not set
CONFIG_SND_SOC_SPRD=m
# CONFIG_SND_SOC_SPRD_MCDT is not set
CONFIG_SND_SOC_STI=m

#
# STMicroelectronics STM32 SOC audio support
#
CONFIG_SND_SOC_STM32_SAI=m
# CONFIG_SND_SOC_STM32_I2S is not set
CONFIG_SND_SOC_STM32_SPDIFRX=m
CONFIG_SND_SOC_STM32_DFSDM=m
# end of STMicroelectronics STM32 SOC audio support

#
# Allwinner SoC Audio support
#
# CONFIG_SND_SUN4I_CODEC is not set
# CONFIG_SND_SUN8I_CODEC_ANALOG is not set
# CONFIG_SND_SUN50I_CODEC_ANALOG is not set
CONFIG_SND_SUN4I_I2S=m
CONFIG_SND_SUN50I_DMIC=m
# end of Allwinner SoC Audio support

CONFIG_SND_SOC_TEGRA=m
CONFIG_SND_SOC_TEGRA20_AC97=m
CONFIG_SND_SOC_TEGRA20_DAS=m
# CONFIG_SND_SOC_TEGRA20_I2S is not set
CONFIG_SND_SOC_TEGRA20_SPDIF=m
CONFIG_SND_SOC_TEGRA30_AHUB=m
# CONFIG_SND_SOC_TEGRA30_I2S is not set
# CONFIG_SND_SOC_TEGRA210_AHUB is not set
# CONFIG_SND_SOC_TEGRA210_DMIC is not set
CONFIG_SND_SOC_TEGRA210_I2S=m
# CONFIG_SND_SOC_TEGRA210_OPE is not set
CONFIG_SND_SOC_TEGRA186_ASRC=m
CONFIG_SND_SOC_TEGRA186_DSPK=m
# CONFIG_SND_SOC_TEGRA210_ADMAIF is not set
CONFIG_SND_SOC_TEGRA210_MVC=m
# CONFIG_SND_SOC_TEGRA210_SFC is not set
CONFIG_SND_SOC_TEGRA210_AMX=m
# CONFIG_SND_SOC_TEGRA210_ADX is not set
CONFIG_SND_SOC_TEGRA210_MIXER=m
CONFIG_SND_SOC_TEGRA_MACHINE_DRV=m
CONFIG_SND_SOC_TEGRA_RT5640=m
CONFIG_SND_SOC_TEGRA_WM8753=m
# CONFIG_SND_SOC_TEGRA_WM8903 is not set
CONFIG_SND_SOC_TEGRA_WM9712=m
CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
CONFIG_SND_SOC_TEGRA_ALC5632=m
# CONFIG_SND_SOC_TEGRA_MAX98090 is not set
CONFIG_SND_SOC_TEGRA_RT5677=m
# CONFIG_SND_SOC_TEGRA_SGTL5000 is not set

#
# Audio support for Texas Instruments SoCs
#
CONFIG_SND_SOC_TI_EDMA_PCM=m
CONFIG_SND_SOC_TI_SDMA_PCM=m
CONFIG_SND_SOC_TI_UDMA_PCM=m

#
# Texas Instruments DAI support for:
#
CONFIG_SND_SOC_DAVINCI_ASP=m
CONFIG_SND_SOC_DAVINCI_MCASP=m
# CONFIG_SND_SOC_DAVINCI_VCIF is not set
CONFIG_SND_SOC_OMAP_DMIC=m
# CONFIG_SND_SOC_OMAP_MCBSP is not set
CONFIG_SND_SOC_OMAP_MCPDM=m

#
# Audio support for boards with Texas Instruments SoCs
#
CONFIG_SND_SOC_OMAP_ABE_TWL6040=m
CONFIG_SND_SOC_OMAP_HDMI=m
CONFIG_SND_SOC_J721E_EVM=m
# end of Audio support for Texas Instruments SoCs

CONFIG_SND_SOC_UNIPHIER=m
CONFIG_SND_SOC_UNIPHIER_AIO=m
CONFIG_SND_SOC_UNIPHIER_LD11=m
# CONFIG_SND_SOC_UNIPHIER_PXS2 is not set
# CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC is not set
CONFIG_SND_SOC_XILINX_I2S=m
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
CONFIG_SND_SOC_XTFPGA_I2S=m
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
# CONFIG_SND_SOC_ALL_CODECS is not set
CONFIG_SND_SOC_WM_HUBS=m
CONFIG_SND_SOC_WM_ADSP=m
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_ADAU_UTILS=m
CONFIG_SND_SOC_ADAU1372=m
CONFIG_SND_SOC_ADAU1372_I2C=m
# CONFIG_SND_SOC_ADAU1701 is not set
# CONFIG_SND_SOC_ADAU1761_I2C is not set
CONFIG_SND_SOC_ADAU7002=m
CONFIG_SND_SOC_ADAU7118=m
# CONFIG_SND_SOC_ADAU7118_HW is not set
CONFIG_SND_SOC_ADAU7118_I2C=m
# CONFIG_SND_SOC_AK4118 is not set
CONFIG_SND_SOC_AK4375=m
CONFIG_SND_SOC_AK4458=m
# CONFIG_SND_SOC_AK4554 is not set
CONFIG_SND_SOC_AK4613=m
CONFIG_SND_SOC_AK4642=m
CONFIG_SND_SOC_AK5386=m
CONFIG_SND_SOC_AK5558=m
# CONFIG_SND_SOC_ALC5623 is not set
CONFIG_SND_SOC_ALC5632=m
CONFIG_SND_SOC_AW8738=m
CONFIG_SND_SOC_BD28623=m
CONFIG_SND_SOC_BT_SCO=m
CONFIG_SND_SOC_CPCAP=m
CONFIG_SND_SOC_CROS_EC_CODEC=m
# CONFIG_SND_SOC_CS35L32 is not set
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=m
CONFIG_SND_SOC_CS35L41_LIB=m
CONFIG_SND_SOC_CS35L41=m
CONFIG_SND_SOC_CS35L41_I2C=m
CONFIG_SND_SOC_CS35L45_TABLES=m
CONFIG_SND_SOC_CS35L45=m
CONFIG_SND_SOC_CS35L45_I2C=m
CONFIG_SND_SOC_CS42L42_CORE=m
CONFIG_SND_SOC_CS42L42=m
CONFIG_SND_SOC_CS42L51=m
CONFIG_SND_SOC_CS42L51_I2C=m
CONFIG_SND_SOC_CS42L52=m
CONFIG_SND_SOC_CS42L56=m
CONFIG_SND_SOC_CS42L73=m
CONFIG_SND_SOC_CS42L83=m
CONFIG_SND_SOC_CS4234=m
CONFIG_SND_SOC_CS4265=m
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
CONFIG_SND_SOC_CS43130=m
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=m
CONFIG_SND_SOC_CS53L30=m
CONFIG_SND_SOC_CX2072X=m
CONFIG_SND_SOC_L3=m
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DMIC=m
CONFIG_SND_SOC_HDMI_CODEC=m
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=m
# CONFIG_SND_SOC_ES8316 is not set
CONFIG_SND_SOC_ES8326=m
CONFIG_SND_SOC_ES8328=m
CONFIG_SND_SOC_ES8328_I2C=m
CONFIG_SND_SOC_GTM601=m
# CONFIG_SND_SOC_HDA is not set
CONFIG_SND_SOC_ICS43432=m
CONFIG_SND_SOC_INNO_RK3036=m
CONFIG_SND_SOC_LOCHNAGAR_SC=m
CONFIG_SND_SOC_MAX98088=m
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98095=m
CONFIG_SND_SOC_MAX98357A=m
CONFIG_SND_SOC_MAX98504=m
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=m
# CONFIG_SND_SOC_MAX98520 is not set
CONFIG_SND_SOC_MAX98373=m
CONFIG_SND_SOC_MAX98373_I2C=m
# CONFIG_SND_SOC_MAX98390 is not set
CONFIG_SND_SOC_MAX98396=m
CONFIG_SND_SOC_MAX9860=m
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
CONFIG_SND_SOC_PCM1681=m
CONFIG_SND_SOC_PCM1789=m
CONFIG_SND_SOC_PCM1789_I2C=m
# CONFIG_SND_SOC_PCM179X_I2C is not set
CONFIG_SND_SOC_PCM186X=m
CONFIG_SND_SOC_PCM186X_I2C=m
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
CONFIG_SND_SOC_PCM3168A=m
CONFIG_SND_SOC_PCM3168A_I2C=m
CONFIG_SND_SOC_PCM5102A=m
# CONFIG_SND_SOC_PCM512x_I2C is not set
CONFIG_SND_SOC_RK3328=m
# CONFIG_SND_SOC_RK817 is not set
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT5616=m
CONFIG_SND_SOC_RT5631=m
CONFIG_SND_SOC_RT5640=m
CONFIG_SND_SOC_RT5659=m
CONFIG_SND_SOC_RT5677=m
CONFIG_SND_SOC_RT5682=m
CONFIG_SND_SOC_RT5682_I2C=m
CONFIG_SND_SOC_RT5682S=m
CONFIG_SND_SOC_RT9120=m
# CONFIG_SND_SOC_SGTL5000 is not set
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
CONFIG_SND_SOC_SIMPLE_MUX=m
CONFIG_SND_SOC_SPDIF=m
CONFIG_SND_SOC_SRC4XXX_I2C=m
CONFIG_SND_SOC_SRC4XXX=m
CONFIG_SND_SOC_SSM2305=m
# CONFIG_SND_SOC_SSM2518 is not set
CONFIG_SND_SOC_SSM2602=m
CONFIG_SND_SOC_SSM2602_I2C=m
CONFIG_SND_SOC_SSM4567=m
CONFIG_SND_SOC_STA32X=m
# CONFIG_SND_SOC_STA350 is not set
CONFIG_SND_SOC_STI_SAS=m
CONFIG_SND_SOC_TAS2552=m
CONFIG_SND_SOC_TAS2562=m
CONFIG_SND_SOC_TAS2764=m
# CONFIG_SND_SOC_TAS2770 is not set
CONFIG_SND_SOC_TAS2780=m
# CONFIG_SND_SOC_TAS5086 is not set
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
CONFIG_SND_SOC_TAS5805M=m
# CONFIG_SND_SOC_TAS6424 is not set
CONFIG_SND_SOC_TDA7419=m
CONFIG_SND_SOC_TFA9879=m
# CONFIG_SND_SOC_TFA989X is not set
CONFIG_SND_SOC_TLV320ADC3XXX=m
CONFIG_SND_SOC_TLV320AIC23=m
CONFIG_SND_SOC_TLV320AIC23_I2C=m
CONFIG_SND_SOC_TLV320AIC31XX=m
# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
CONFIG_SND_SOC_TLV320AIC3X=m
# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
CONFIG_SND_SOC_TLV320ADCX140=m
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
# CONFIG_SND_SOC_TSCS454 is not set
CONFIG_SND_SOC_TWL6040=m
CONFIG_SND_SOC_UDA1334=m
CONFIG_SND_SOC_UDA134X=m
CONFIG_SND_SOC_UDA1380=m
CONFIG_SND_SOC_WCD9335=m
CONFIG_SND_SOC_WCD_MBHC=m
CONFIG_SND_SOC_WCD934X=m
CONFIG_SND_SOC_WM5100=m
CONFIG_SND_SOC_WM8510=m
CONFIG_SND_SOC_WM8523=m
CONFIG_SND_SOC_WM8524=m
CONFIG_SND_SOC_WM8580=m
CONFIG_SND_SOC_WM8711=m
CONFIG_SND_SOC_WM8728=m
CONFIG_SND_SOC_WM8731=m
CONFIG_SND_SOC_WM8731_I2C=m
# CONFIG_SND_SOC_WM8737 is not set
CONFIG_SND_SOC_WM8741=m
# CONFIG_SND_SOC_WM8750 is not set
CONFIG_SND_SOC_WM8753=m
# CONFIG_SND_SOC_WM8776 is not set
# CONFIG_SND_SOC_WM8782 is not set
CONFIG_SND_SOC_WM8804=m
CONFIG_SND_SOC_WM8804_I2C=m
# CONFIG_SND_SOC_WM8903 is not set
CONFIG_SND_SOC_WM8904=m
CONFIG_SND_SOC_WM8940=m
CONFIG_SND_SOC_WM8960=m
CONFIG_SND_SOC_WM8962=m
CONFIG_SND_SOC_WM8974=m
CONFIG_SND_SOC_WM8978=m
CONFIG_SND_SOC_WM8985=m
CONFIG_SND_SOC_WM8994=m
CONFIG_SND_SOC_WM9081=m
CONFIG_SND_SOC_WM9712=m
CONFIG_SND_SOC_MAX9759=m
CONFIG_SND_SOC_MT6351=m
# CONFIG_SND_SOC_MT6358 is not set
CONFIG_SND_SOC_MT6660=m
# CONFIG_SND_SOC_NAU8315 is not set
CONFIG_SND_SOC_NAU8540=m
CONFIG_SND_SOC_NAU8810=m
CONFIG_SND_SOC_NAU8821=m
CONFIG_SND_SOC_NAU8822=m
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_TPA6130A2=m
CONFIG_SND_SOC_LPASS_MACRO_COMMON=m
CONFIG_SND_SOC_LPASS_WSA_MACRO=m
# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
CONFIG_SND_SOC_LPASS_RX_MACRO=m
# CONFIG_SND_SOC_LPASS_TX_MACRO is not set
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=m
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=m
CONFIG_HID_ACRUX_FF=y
CONFIG_HID_APPLE=m
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=m
CONFIG_HID_CHERRY=m
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
CONFIG_HID_CYPRESS=m
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELECOM=m
CONFIG_HID_EZKEY=m
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
CONFIG_HID_GLORIOUS=m
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_WALTOP is not set
CONFIG_HID_VIEWSONIC=m
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=m
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NINTENDO=m
# CONFIG_NINTENDO_FF is not set
CONFIG_HID_NTI=m
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=m
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=m
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_PXRC=m
CONFIG_HID_RAZER=m
CONFIG_HID_PRIMAX=m
CONFIG_HID_SAITEK=m
CONFIG_HID_SEMITEK=m
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=m
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# I2C HID support
#
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
CONFIG_MMC=m
CONFIG_SDIO_UART=m
CONFIG_MMC_TEST=m

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_OF_ESDHC=m
CONFIG_MMC_SDHCI_OF_SPARX5=m
CONFIG_MMC_SDHCI_CNS3XXX=m
CONFIG_MMC_SDHCI_DOVE=m
# CONFIG_MMC_SDHCI_TEGRA is not set
# CONFIG_MMC_SDHCI_S3C is not set
CONFIG_MMC_SDHCI_PXAV3=m
CONFIG_MMC_SDHCI_PXAV2=m
# CONFIG_MMC_SDHCI_BCM_KONA is not set
CONFIG_MMC_MESON_GX=m
CONFIG_MMC_MOXART=m
# CONFIG_MMC_SDHCI_ST is not set
CONFIG_MMC_OMAP_HS=m
CONFIG_MMC_SDHCI_MSM=m
# CONFIG_MMC_DAVINCI is not set
CONFIG_MMC_S3C=m
CONFIG_MMC_S3C_HW_SDIO_IRQ=y
# CONFIG_MMC_S3C_PIO is not set
CONFIG_MMC_S3C_DMA=y
CONFIG_MMC_SDHCI_SPRD=m
CONFIG_MMC_TMIO_CORE=m
CONFIG_MMC_TMIO=m
# CONFIG_MMC_SDHI is not set
# CONFIG_MMC_DW is not set
# CONFIG_MMC_SH_MMCIF is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_MTK=m
CONFIG_MMC_SDHCI_XENON=m
CONFIG_MMC_OWL=m
CONFIG_MMC_LITEX=m
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=m
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_88PM860X is not set
CONFIG_LEDS_ARIEL=m
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=m
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
# CONFIG_LEDS_GPIO is not set
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_LP8788 is not set
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=m
# CONFIG_LEDS_DA9052 is not set
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=m
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=m
# CONFIG_LEDS_NS2 is not set
CONFIG_LEDS_TCA6507=m
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX77650=m
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_OT200=m
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_PM8058=m
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
CONFIG_LEDS_TI_LMU_COMMON=m
CONFIG_LEDS_LM36274=m
CONFIG_LEDS_IP30=m
# CONFIG_LEDS_ACER_A500 is not set

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
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_MTD is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y
# CONFIG_A11Y_BRAILLE_CONSOLE is not set

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# end of Speakup console speech

# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_ALTERA_MSGDMA=m
# CONFIG_APPLE_ADMAC is not set
CONFIG_AXI_DMAC=y
# CONFIG_DMA_JZ4780 is not set
CONFIG_DMA_SA11X0=y
CONFIG_DMA_SUN6I=m
# CONFIG_EP93XX_DMA is not set
CONFIG_IMG_MDC_DMA=y
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_INTEL_IOP_ADMA is not set
# CONFIG_K3_DMA is not set
CONFIG_MCF_EDMA=m
CONFIG_MMP_PDMA=m
# CONFIG_MMP_TDMA is not set
# CONFIG_MV_XOR is not set
CONFIG_MXS_DMA=y
# CONFIG_NBPFAXI_DMA is not set
CONFIG_STM32_DMA=y
# CONFIG_STM32_DMAMUX is not set
CONFIG_SPRD_DMA=y
# CONFIG_S3C24XX_DMAC is not set
# CONFIG_TEGRA20_APB_DMA is not set
# CONFIG_TEGRA210_ADMA is not set
CONFIG_TIMB_DMA=y
CONFIG_XGENE_DMA=y
CONFIG_XILINX_ZYNQMP_DMA=y
# CONFIG_MTK_HSDMA is not set
# CONFIG_MTK_CQDMA is not set
CONFIG_QCOM_ADM=m
# CONFIG_QCOM_HIDMA_MGMT is not set
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=m
CONFIG_DW_DMAC=m
CONFIG_RZN1_DMAMUX=m
# CONFIG_SF_PDMA is not set
CONFIG_RENESAS_DMA=y
CONFIG_SH_DMAE_BASE=y
# CONFIG_SH_DMAE is not set
CONFIG_RCAR_DMAC=m
# CONFIG_RENESAS_USB_DMAC is not set
CONFIG_RZ_DMAC=y
# CONFIG_TI_EDMA is not set
CONFIG_DMA_OMAP=m
CONFIG_TI_DMA_CROSSBAR=y
CONFIG_INTEL_LDMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=y
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=m
# CONFIG_LCD2S is not set
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
CONFIG_UIO=m
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_DFL=m
CONFIG_VFIO=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PLATFORM=y
# CONFIG_VFIO_AMBA is not set
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=m
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=y
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=m
CONFIG_VFIO_MDEV=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=m
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=m
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_VHOST_MENU=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=m
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KBD_LED_BACKLIGHT=m
# CONFIG_CROS_EC_CHARDEV is not set
CONFIG_CROS_EC_LIGHTBAR=m
CONFIG_CROS_EC_DEBUGFS=m
# CONFIG_CROS_EC_SENSORHUB is not set
CONFIG_CROS_EC_SYSFS=m
# CONFIG_CROS_USBPD_LOGGER is not set
CONFIG_CROS_USBPD_NOTIFY=m
CONFIG_CROS_KUNIT=m
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
CONFIG_CLK_SP810=y
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_APPLE_NCO is not set
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_HI655X is not set
CONFIG_COMMON_CLK_SCMI=y
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_BM1880=y
CONFIG_COMMON_CLK_CDCE706=m
CONFIG_COMMON_CLK_TPS68470=y
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_COMMON_CLK_FSL_FLEXSPI=m
CONFIG_COMMON_CLK_FSL_SAI=y
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_ASPEED is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
CONFIG_CLK_TWL6040=m
CONFIG_CLK_LS1028A_PLLDIG=y
CONFIG_COMMON_CLK_XGENE=y
# CONFIG_COMMON_CLK_OXNAS is not set
CONFIG_COMMON_CLK_MMP2_AUDIO=y
CONFIG_CLK_ACTIONS=y
# CONFIG_CLK_OWL_S500 is not set
# CONFIG_CLK_OWL_S700 is not set
CONFIG_CLK_OWL_S900=y
CONFIG_CLK_BAIKAL_T1=y
# CONFIG_CLK_BT1_CCU_PLL is not set
# CONFIG_CLK_BT1_CCU_DIV is not set
# CONFIG_CLK_BT1_CCU_RST is not set
CONFIG_CLK_BCM2711_DVP=m
CONFIG_CLK_BCM2835=y
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_63XX_GATE=y
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
CONFIG_CLK_BCM_NS2=y
CONFIG_CLK_BCM_SR=y
CONFIG_CLK_RASPBERRYPI=y
CONFIG_COMMON_CLK_HI3516CV300=m
CONFIG_COMMON_CLK_HI3519=m
# CONFIG_COMMON_CLK_HI3559A is not set
CONFIG_COMMON_CLK_HI3660=y
CONFIG_COMMON_CLK_HI3670=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
# CONFIG_STUB_CLK_HI6220 is not set
# CONFIG_STUB_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_BOSTON is not set
CONFIG_MXC_CLK=y
# CONFIG_CLK_IMX8MM is not set
CONFIG_CLK_IMX8MN=y
# CONFIG_CLK_IMX8MP is not set
CONFIG_CLK_IMX8MQ=y
CONFIG_CLK_IMX8ULP=m
CONFIG_CLK_IMX93=m

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
CONFIG_INGENIC_CGU_JZ4760=y
CONFIG_INGENIC_CGU_JZ4770=y
CONFIG_INGENIC_CGU_JZ4780=y
CONFIG_INGENIC_CGU_X1000=y
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=y
CONFIG_COMMON_CLK_MT6779_MMSYS=y
CONFIG_COMMON_CLK_MT6779_IMGSYS=m
CONFIG_COMMON_CLK_MT6779_IPESYS=m
CONFIG_COMMON_CLK_MT6779_CAMSYS=m
# CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
# CONFIG_COMMON_CLK_MT6779_VENCSYS is not set
CONFIG_COMMON_CLK_MT6779_MFGCFG=m
CONFIG_COMMON_CLK_MT6779_AUDSYS=m
CONFIG_COMMON_CLK_MT6795=m
CONFIG_COMMON_CLK_MT6795_MFGCFG=m
# CONFIG_COMMON_CLK_MT6795_MMSYS is not set
# CONFIG_COMMON_CLK_MT6795_VDECSYS is not set
CONFIG_COMMON_CLK_MT6795_VENCSYS=m
# CONFIG_COMMON_CLK_MT6797 is not set
CONFIG_COMMON_CLK_MT7622=y
# CONFIG_COMMON_CLK_MT7622_ETHSYS is not set
# CONFIG_COMMON_CLK_MT7622_HIFSYS is not set
# CONFIG_COMMON_CLK_MT7622_AUDSYS is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT7986 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_MMSYS is not set
# CONFIG_COMMON_CLK_MT8183 is not set
CONFIG_COMMON_CLK_MT8186=y
CONFIG_COMMON_CLK_MT8192=y
# CONFIG_COMMON_CLK_MT8192_AUDSYS is not set
CONFIG_COMMON_CLK_MT8192_CAMSYS=y
# CONFIG_COMMON_CLK_MT8192_IMGSYS is not set
# CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP is not set
# CONFIG_COMMON_CLK_MT8192_IPESYS is not set
CONFIG_COMMON_CLK_MT8192_MDPSYS=y
# CONFIG_COMMON_CLK_MT8192_MFGCFG is not set
# CONFIG_COMMON_CLK_MT8192_MMSYS is not set
CONFIG_COMMON_CLK_MT8192_MSDC=y
# CONFIG_COMMON_CLK_MT8192_SCP_ADSP is not set
# CONFIG_COMMON_CLK_MT8192_VDECSYS is not set
# CONFIG_COMMON_CLK_MT8192_VENCSYS is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
CONFIG_COMMON_CLK_MT8516=y
# CONFIG_COMMON_CLK_MT8516_AUDSYS is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# CONFIG_COMMON_CLK_AXG_AUDIO is not set
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
CONFIG_MCHP_CLK_MPFS=y
CONFIG_COMMON_CLK_PISTACHIO=y
CONFIG_CLK_MT7621=y
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
# CONFIG_S3C64XX_COMMON_CLK is not set
# CONFIG_S5PV210_COMMON_CLK is not set
CONFIG_EXYNOS_3250_COMMON_CLK=y
CONFIG_EXYNOS_4_COMMON_CLK=y
# CONFIG_EXYNOS_5250_COMMON_CLK is not set
# CONFIG_EXYNOS_5260_COMMON_CLK is not set
CONFIG_EXYNOS_5410_COMMON_CLK=y
# CONFIG_EXYNOS_5420_COMMON_CLK is not set
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
# CONFIG_EXYNOS_AUDSS_CLK_CON is not set
CONFIG_EXYNOS_CLKOUT=y
CONFIG_S3C2410_COMMON_CLK=y
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
CONFIG_TESLA_FSD_COMMON_CLK=y
# CONFIG_CLK_SIFIVE is not set
CONFIG_CLK_INTEL_SOCFPGA=y
CONFIG_CLK_INTEL_SOCFPGA32=y
CONFIG_CLK_INTEL_SOCFPGA64=y
# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
# CONFIG_CLK_SUNXI is not set
# CONFIG_SUNXI_CCU is not set
CONFIG_COMMON_CLK_TI_ADPLL=m
# CONFIG_COMMON_CLK_VISCONTI is not set
CONFIG_XILINX_VCU=m
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_CLK_KUNIT_TEST=m
CONFIG_CLK_GATE_KUNIT_TEST=m
# CONFIG_HWSPINLOCK is not set

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
CONFIG_DW_APB_TIMER=y
CONFIG_FTTMR010_TIMER=y
CONFIG_IXP4XX_TIMER=y
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
CONFIG_TEGRA_TIMER=y
# CONFIG_TEGRA186_TIMER is not set
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
CONFIG_NSPIRE_TIMER=y
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_STM32_LP is not set
CONFIG_ARMV7M_SYSTICK=y
# CONFIG_ATMEL_PIT is not set
CONFIG_ATMEL_ST=y
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
CONFIG_FSL_FTM_TIMER=y
# CONFIG_OXNAS_RPS_TIMER is not set
CONFIG_MTK_TIMER=y
CONFIG_SPRD_TIMER=y
CONFIG_SH_TIMER_CMT=y
CONFIG_SH_TIMER_MTU2=y
CONFIG_RENESAS_OSTM=y
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_PXA is not set
CONFIG_TIMER_IMX_SYS_CTR=y
CONFIG_CLKSRC_ST_LPC=y
# CONFIG_GXP_TIMER is not set
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
CONFIG_INGENIC_SYSOST=y
CONFIG_INGENIC_OST=y
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=m
CONFIG_ROCKCHIP_MBOX=y
# CONFIG_ALTERA_MBOX is not set
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
# CONFIG_QCOM_APCS_IPC is not set
# CONFIG_BCM_PDC_MBOX is not set
CONFIG_STM32_IPCC=m
CONFIG_MTK_ADSP_MBOX=m
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_SUN6I_MSGBOX is not set
CONFIG_SPRD_MBOX=m
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
CONFIG_MESON_CLK_MEASURE=m
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_RTKIT=y
CONFIG_APPLE_SART=y
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=m
CONFIG_ASPEED_UART_ROUTING=m
# CONFIG_ASPEED_P2A_CTRL is not set
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
CONFIG_SOC_BCM63XX=y
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_FSL_GUTS=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
CONFIG_SOC_IMX9=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
CONFIG_IXP4XX_NPE=m
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=m
CONFIG_MTK_DEVAPC=m
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_MMSYS=y
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=m
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_RPMH=m
CONFIG_QCOM_SPM=y
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
# CONFIG_SOC_TI is not set
CONFIG_UX500_SOC_ID=y

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
CONFIG_EXTCON_MAX3355=m
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_QCOM_SPMI_MISC=m
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=m
CONFIG_EXTCON_USBC_CROS_EC=y
CONFIG_MEMORY=y
# CONFIG_BRCMSTB_DPFE is not set
# CONFIG_BRCMSTB_MEMC is not set
CONFIG_BT1_L2_CTL=y
# CONFIG_TI_EMIF is not set
CONFIG_FPGA_DFL_EMIF=m
# CONFIG_FSL_CORENET_CF is not set
CONFIG_FSL_IFC=y
# CONFIG_MTK_SMI is not set
# CONFIG_DA8XX_DDRCTL is not set
CONFIG_RENESAS_RPCIF=m
CONFIG_STM32_FMC2_EBI=y
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS_SROM=y
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=m
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
# CONFIG_ADXL313_I2C is not set
# CONFIG_ADXL345_I2C is not set
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
CONFIG_ADXL367=m
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=m
CONFIG_ADXL372_I2C=m
# CONFIG_BMA400 is not set
# CONFIG_BMC150_ACCEL is not set
CONFIG_DA280=y
CONFIG_DA311=m
CONFIG_DMARD06=y
CONFIG_DMARD09=y
CONFIG_DMARD10=y
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_KXSD9=m
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=m
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
# CONFIG_MMA7660 is not set
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=y
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=y
CONFIG_MSA311=m
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=y
# CONFIG_AD7291 is not set
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
CONFIG_AD799X=y
CONFIG_ASPEED_ADC=m
# CONFIG_AT91_SAMA5D2_ADC is not set
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=m
CONFIG_BCM_IPROC_ADC=m
CONFIG_BERLIN2_ADC=m
# CONFIG_CC10001_ADC is not set
# CONFIG_DA9150_GPADC is not set
# CONFIG_ENVELOPE_DETECTOR is not set
CONFIG_MXS_LRADC_ADC=y
# CONFIG_HX711 is not set
CONFIG_INGENIC_ADC=y
# CONFIG_IMX7D_ADC is not set
CONFIG_IMX8QXP_ADC=m
CONFIG_LP8788_ADC=y
CONFIG_LPC18XX_ADC=y
# CONFIG_LPC32XX_ADC is not set
CONFIG_LTC2471=y
CONFIG_LTC2485=y
CONFIG_LTC2497=y
CONFIG_MAX1363=m
CONFIG_MAX9611=y
CONFIG_MCP3422=y
CONFIG_MEDIATEK_MT6360_ADC=y
CONFIG_MEDIATEK_MT6577_AUXADC=m
CONFIG_MP2629_ADC=m
CONFIG_NAU7802=y
CONFIG_NPCM_ADC=m
CONFIG_QCOM_VADC_COMMON=y
# CONFIG_QCOM_PM8XXX_XOADC is not set
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=y
CONFIG_RCAR_GYRO_ADC=m
CONFIG_ROCKCHIP_SARADC=m
CONFIG_RICHTEK_RTQ6056=m
CONFIG_RZG2L_ADC=m
CONFIG_SC27XX_ADC=y
CONFIG_SPEAR_ADC=y
# CONFIG_SD_ADC_MODULATOR is not set
CONFIG_STM32_DFSDM_CORE=m
CONFIG_STM32_DFSDM_ADC=m
CONFIG_SUN4I_GPADC=m
CONFIG_TI_ADC081C=m
# CONFIG_TI_ADS1015 is not set
CONFIG_TI_AM335X_ADC=m
CONFIG_VF610_ADC=y
CONFIG_XILINX_XADC=m
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
CONFIG_AD7746=y
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_CCS811=m
CONFIG_IAQCORE=m
# CONFIG_SCD30_CORE is not set
# CONFIG_SCD4X is not set
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=m
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD5064=y
CONFIG_AD5380=y
# CONFIG_AD5446 is not set
CONFIG_AD5592R_BASE=m
CONFIG_AD5593R=m
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
CONFIG_DPOT_DAC=m
CONFIG_DS4424=y
CONFIG_LPC18XX_DAC=m
CONFIG_M62332=y
CONFIG_MAX517=y
CONFIG_MAX5821=y
CONFIG_MCP4725=m
# CONFIG_STM32_DAC is not set
CONFIG_TI_DAC5571=m
CONFIG_VF610_DAC=y
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
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_HID_SENSOR_GYRO_3D=m
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=m
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=y
# CONFIG_HDC100X is not set
CONFIG_HDC2010=y
CONFIG_HID_SENSOR_HUMIDITY=m
# CONFIG_HTS221 is not set
CONFIG_HTU21=y
CONFIG_SI7005=m
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
CONFIG_KMX61=y
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
# CONFIG_INV_MPU6050_I2C is not set
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=y
# CONFIG_ADUX1020 is not set
# CONFIG_AL3010 is not set
CONFIG_AL3320A=m
CONFIG_APDS9300=m
# CONFIG_APDS9960 is not set
# CONFIG_AS73211 is not set
CONFIG_BH1750=m
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
CONFIG_CM3232=m
# CONFIG_CM3323 is not set
CONFIG_CM3605=y
CONFIG_CM36651=y
CONFIG_GP2AP002=y
# CONFIG_GP2AP020A00F is not set
# CONFIG_IQS621_ALS is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=m
# CONFIG_ISL29125 is not set
# CONFIG_HID_SENSOR_ALS is not set
# CONFIG_HID_SENSOR_PROX is not set
CONFIG_JSA1212=y
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=m
CONFIG_LTR501=y
CONFIG_LTRF216A=y
CONFIG_LV0104CS=y
# CONFIG_MAX44000 is not set
CONFIG_MAX44009=y
CONFIG_NOA1305=m
CONFIG_OPT3001=y
# CONFIG_PA12203001 is not set
CONFIG_SI1133=y
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_TCS3414=y
CONFIG_TCS3472=y
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=m
CONFIG_TSL2591=y
# CONFIG_TSL2772 is not set
CONFIG_TSL4531=y
CONFIG_US5182D=m
CONFIG_VCNL4000=y
CONFIG_VCNL4035=y
CONFIG_VEML6030=m
CONFIG_VEML6070=m
CONFIG_VL6180=y
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=m
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
# CONFIG_MAG3110 is not set
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

CONFIG_IIO_FORMAT_KUNIT_TEST=m

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
CONFIG_IIO_INTERRUPT_TRIGGER=m
CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=m
CONFIG_DS1803=y
CONFIG_MAX5432=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=m
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
# CONFIG_DLHL60D is not set
CONFIG_DPS310=y
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
CONFIG_ICP10100=y
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL3115=m
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_T5403=m
CONFIG_HP206C=m
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=m
CONFIG_ISL29501=m
CONFIG_LIDAR_LITE_V2=m
CONFIG_MB1232=m
# CONFIG_PING is not set
CONFIG_RFD77402=y
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
CONFIG_SX9310=m
CONFIG_SX9324=y
# CONFIG_SX9360 is not set
# CONFIG_SX9500 is not set
CONFIG_SRF08=m
CONFIG_VCNL3020=y
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
CONFIG_HID_SENSOR_TEMP=m
CONFIG_MLX90614=m
CONFIG_MLX90632=m
# CONFIG_TMP006 is not set
CONFIG_TMP007=y
# CONFIG_TMP117 is not set
CONFIG_TSYS01=y
CONFIG_TSYS02D=y
# end of Temperature sensors

# CONFIG_PWM is not set

#
# IRQ chip support
#
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
CONFIG_RENESAS_INTC_IRQPIN=y
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
CONFIG_TS4800_IRQ=y
CONFIG_INGENIC_TCU_IRQ=y
CONFIG_IRQ_UNIPHIER_AIDET=y
CONFIG_MESON_IRQ_GPIO=m
CONFIG_IMX_IRQSTEER=y
CONFIG_IMX_INTMUX=y
CONFIG_EXYNOS_IRQ_COMBINER=y
# CONFIG_MST_IRQ is not set
CONFIG_MCHP_EIC=y
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=m
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
CONFIG_RESET_HSDK=y
CONFIG_RESET_IMX7=m
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUDIO_ARB=m
# CONFIG_RESET_NPCM is not set
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_POLARFIRE_SOC is not set
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_QCOM_PDC=m
# CONFIG_RESET_RASPBERRYPI is not set
CONFIG_RESET_RZG2L_USBPHY_CTRL=y
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_SUNPLUS=y
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=m
CONFIG_RESET_TN48M_CPLD=m
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set
CONFIG_PHY_SUN6I_MIPI_DPHY=y

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HI3660_USB=m
# CONFIG_PHY_HI3670_USB is not set
CONFIG_PHY_HI3670_PCIE=m
CONFIG_PHY_HISTB_COMBPHY=m
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_PXA_USB=m
CONFIG_PHY_MMP3_USB=m
CONFIG_PHY_MMP3_HSIC=y
CONFIG_PHY_MT7621_PCI=y
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_RCAR_GEN3_USB3=y
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
CONFIG_PHY_EXYNOS_MIPI_VIDEO=m
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
CONFIG_PHY_ST_SPEAR1340_MIPHY=m
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_STM32_USBPHYC is not set
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_AM654_SERDES is not set
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=m
CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
CONFIG_PHY_INTEL_KEEMBAY_USB=y
# CONFIG_PHY_INTEL_LGM_EMMC is not set
CONFIG_PHY_XILINX_ZYNQMP=m
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
CONFIG_ARM_CCN=m
CONFIG_ARM_CMN=m
CONFIG_FSL_IMX8_DDR_PMU=y
# CONFIG_ARM_DMC620_PMU is not set
CONFIG_ALIBABA_UNCORE_DRW_PMU=y
# end of Performance monitor support

# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_APPLE_EFUSES=y
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_BRCM_NVRAM=m
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MESON_MX_EFUSE=m
CONFIG_NVMEM_MICROCHIP_OTPC=m
# CONFIG_NVMEM_MTK_EFUSE is not set
CONFIG_NVMEM_MXS_OCOTP=m
# CONFIG_NVMEM_NINTENDO_OTP is not set
CONFIG_NVMEM_QCOM_QFPROM=y
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_ROCKCHIP_EFUSE=y
CONFIG_NVMEM_ROCKCHIP_OTP=y
CONFIG_NVMEM_SC27XX_EFUSE=y
# CONFIG_NVMEM_SNVS_LPGPR is not set
CONFIG_NVMEM_SPMI_SDAM=y
CONFIG_NVMEM_SPRD_EFUSE=m
CONFIG_NVMEM_STM32_ROMEM=m
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
CONFIG_NVMEM_UNIPHIER_EFUSE=y
CONFIG_NVMEM_VF610_OCOTP=y

#
# HW tracing support
#
CONFIG_STM=m
CONFIG_STM_PROTO_BASIC=m
# CONFIG_STM_PROTO_SYS_T is not set
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=m
# CONFIG_INTEL_TH_MSU is not set
# CONFIG_INTEL_TH_PTI is not set
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=y
CONFIG_FPGA_MGR_SOCFPGA_A10=y
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ZYNQ_FPGA=y
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
CONFIG_XILINX_PR_DECOUPLER=m
CONFIG_FPGA_REGION=y
CONFIG_FPGA_DFL=m
CONFIG_FPGA_DFL_FME=m
CONFIG_FPGA_DFL_FME_MGR=m
# CONFIG_FPGA_DFL_FME_BRIDGE is not set
CONFIG_FPGA_DFL_FME_REGION=m
CONFIG_FPGA_DFL_AFU=m
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=m
CONFIG_FPGA_MGR_ZYNQMP_FPGA=y
CONFIG_FPGA_MGR_VERSAL_FPGA=y
CONFIG_TEE=m
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_104_QUAD_8=m
CONFIG_INTERRUPT_CNT=y
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_TI_EQEP is not set
CONFIG_TI_ECAP_CAPTURE=y
# CONFIG_MOST is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
CONFIG_QUOTA=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QFMT_V1=y
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=m
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_DEBUG is not set
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_FS_WBUF_VERIFY=y
# CONFIG_JFFS2_SUMMARY is not set
CONFIG_JFFS2_FS_XATTR=y
CONFIG_JFFS2_FS_POSIX_ACL=y
# CONFIG_JFFS2_FS_SECURITY is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
# CONFIG_JFFS2_ZLIB is not set
CONFIG_JFFS2_LZO=y
# CONFIG_JFFS2_RTIME is not set
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_JFFS2_CMODE_NONE is not set
# CONFIG_JFFS2_CMODE_PRIORITY is not set
CONFIG_JFFS2_CMODE_SIZE=y
# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
# CONFIG_CRAMFS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=m
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=m
CONFIG_PSTORE_LZO_COMPRESS=m
# CONFIG_PSTORE_LZ4_COMPRESS is not set
CONFIG_PSTORE_LZ4HC_COMPRESS=m
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_RAM is not set
# CONFIG_NLS is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
CONFIG_TRUSTED_KEYS=y

#
# No trust source selected!
#
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITYFS=y
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
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
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
CONFIG_CRYPTO_AKCIPHER=m
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
# CONFIG_CRYPTO_RSA is not set
# CONFIG_CRYPTO_DH is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=m
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
# CONFIG_CRYPTO_ARIA is not set
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=m
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
# CONFIG_CRYPTO_TWOFISH is not set
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=m
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=y
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=m
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
CONFIG_CRYPTO_LZO=m
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=m
CONFIG_CRYPTO_ZSTD=m
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
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_ALLWINNER=y
CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
CONFIG_CRYPTO_DEV_S5P=y
CONFIG_CRYPTO_DEV_ATMEL_AUTHENC=y
CONFIG_CRYPTO_DEV_ATMEL_AES=y
CONFIG_CRYPTO_DEV_ATMEL_TDES=y
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_QCE=m
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL is not set
CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
CONFIG_CRYPTO_DEV_ZYNQMP_AES=y
CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=y
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=m
CONFIG_CRYPTO_DEV_HISI_SEC=m
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
# CONFIG_CRYPTO_DEV_ASPEED is not set
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
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
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
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=m
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=m
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=m
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
# CONFIG_XZ_DEC_POWERPC is not set
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
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
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=m
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=m
CONFIG_SG_SPLIT=y
CONFIG_STACKDEPOT=y
CONFIG_PARMAN=y
CONFIG_OBJAGG=y
# end of Library routines

CONFIG_POLYNOMIAL=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_LEB128=y
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_VMLINUX_MAP=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
# CONFIG_KGDB_SERIAL_CONSOLE is not set
# CONFIG_KGDB_TESTS is not set
# CONFIG_KGDB_KDB is not set
# CONFIG_UBSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SHRINKER_DEBUG=y
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
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
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
CONFIG_DEBUG_LOCKDEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
CONFIG_SCF_TORTURE_TEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_NOP_TRACER=y
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
CONFIG_BOOTTIME_TRACING=y
CONFIG_IRQSOFF_TRACER=y
# CONFIG_SCHED_TRACER is not set
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
CONFIG_DYNAMIC_EVENTS=y
# CONFIG_SYNTH_EVENTS is not set
CONFIG_USER_EVENTS=y
CONFIG_TRACE_EVENT_INJECT=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
CONFIG_EVENT_TRACE_STARTUP_TEST=y
# CONFIG_EVENT_TRACE_TEST_SYSCALLS is not set
CONFIG_RING_BUFFER_STARTUP_TEST=y
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
CONFIG_PREEMPTIRQ_DELAY_TEST=m
CONFIG_DA_MON_EVENTS=y
CONFIG_DA_MON_EVENTS_ID=y
CONFIG_RV=y
CONFIG_RV_MON_WWNR=y
CONFIG_RV_REACTORS=y
# CONFIG_RV_REACT_PRINTK is not set
CONFIG_RV_REACT_PANIC=y
# CONFIG_SAMPLES is not set

#
# hexagon Debugging
#
# end of hexagon Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=m
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=m
CONFIG_KUNIT_EXAMPLE_TEST=m
CONFIG_KUNIT_ALL_TESTS=m
# CONFIG_KUNIT_DEFAULT_ENABLED is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
# CONFIG_FAULT_INJECTION is not set
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

--JIHnVD6SUagaZh/P--
