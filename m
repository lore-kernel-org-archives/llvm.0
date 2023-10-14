Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6DE46BF;
	Sat, 14 Oct 2023 06:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhES/Kh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697264821; x=1728800821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4AidmBhq7hreJsU3R/ccMhDvgJjmD503zffdOBI1jeU=;
  b=nhES/Kh1dJEAzn7vNWSszuFWK6O8kdoOD0Hww1qVPcLvudip0JSpXTwf
   zUCy57cVRkxx9RVQQzqOSd/L1Nq7+fHz7NnQhP9t2mP7QRo2pKtthofH7
   NCu+tXKpGPyo5Xjd35SjNumPEkcV+daDwbPyT3U8YEVWKlqO6/QqaMSDX
   ObzMC2erK57FjSGA7K0ANAZOfPSrX2jwaYsS2dooTaClZbHnMy2OMcqux
   6WF8vm4hTW1OQfDiXuPSkFXBtA4DYXbnzVfAYn3EJkdzcsl3tTxgLZZLi
   Ctxyfi3t85X4Qq/g5CuE5m20Yw5JOcv5hyj6LiV5AGMyMpHg1pPvArKc1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370377454"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="370377454"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1002227422"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002227422"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2023 23:26:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrY6y-0005m7-09;
	Sat, 14 Oct 2023 06:26:56 +0000
Date: Sat, 14 Oct 2023 14:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Cross <ccross@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [sudeep-holla:android13-5.15/ffa 2846/4062]
 include/linux/mm.h:3292:59: warning: unused parameter 'start'
Message-ID: <202310141451.95By0DoE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: 301c56064d723b03077257ccf5281b2c36cbb2ed [2846/4062] UPSTREAM: mm: add a field to store names for private anonymous memory
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231014/202310141451.95By0DoE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141451.95By0DoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141451.95By0DoE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/fs.h:3153:67: warning: unused parameter 'inode' [-Wunused-parameter]
   static inline void lockdep_annotate_inode_mutex_key(struct inode *inode) { };
                                                                     ^
   include/linux/fs.h:3585:45: warning: unused parameter 'fmt' [-Wunused-parameter]
   void __simple_attr_check_format(const char *fmt, ...)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:727:
   include/linux/huge_mm.h:306:43: warning: unused parameter 'pud' [-Wunused-parameter]
   static inline bool is_huge_zero_pud(pud_t pud)
                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   include/linux/mm.h:1529:52: warning: unused parameter 'page' [-Wunused-parameter]
   static inline u8 page_kasan_tag(const struct page *page)
                                                      ^
   include/linux/mm.h:1534:52: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
                                                      ^
   include/linux/mm.h:1534:61: warning: unused parameter 'tag' [-Wunused-parameter]
   static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
                                                               ^
   include/linux/mm.h:1535:54: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void page_kasan_tag_reset(struct page *page) { }
                                                        ^
   include/linux/mm.h:1589:36: warning: unused parameter 'pfn' [-Wunused-parameter]
           unsigned long node, unsigned long pfn)
                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:231:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:419:15: warning: unused parameter 'migratetype' [-Wunused-parameter]
                                                int migratetype)
                                                    ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:32:
   In file included from include/linux/oom.h:11:
   include/linux/mm.h:2193:46: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool ptlock_alloc(struct page *page)
                                                ^
   include/linux/mm.h:2198:45: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void ptlock_free(struct page *page)
                                               ^
   include/linux/mm.h:2208:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2299:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2365:68: warning: unused parameter 'pud' [-Wunused-parameter]
   static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
                                                                      ^
   include/linux/mm.h:2973:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                         ^
   include/linux/mm.h:2973:65: warning: unused parameter 'nunmpages' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                                   ^
   include/linux/mm.h:2974:53: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                       ^
   include/linux/mm.h:2974:63: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                                 ^
   include/linux/mm.h:2975:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                         ^
   include/linux/mm.h:2975:65: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                                   ^
   include/linux/mm.h:3034:59: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                             ^
   include/linux/mm.h:3034:69: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                                       ^
   include/linux/mm.h:3035:61: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                               ^
   include/linux/mm.h:3035:71: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                                         ^
   include/linux/mm.h:3219:47: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool page_is_guard(struct page *page) { return false; }
                                                 ^
   include/linux/mm.h:3292:41: warning: unused parameter 'mm' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                           ^
>> include/linux/mm.h:3292:59: warning: unused parameter 'start' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                                             ^
>> include/linux/mm.h:3293:23: warning: unused parameter 'len_in' [-Wunused-parameter]
                         unsigned long len_in, const char *name) {
                                       ^
   include/linux/mm.h:3293:43: warning: unused parameter 'name' [-Wunused-parameter]
                         unsigned long len_in, const char *name) {
                                                           ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   include/linux/vtime.h:41:58: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
                                                            ^
   include/linux/vtime.h:41:76: warning: unused parameter 'offset' [-Wunused-parameter]
   static inline void vtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
                                                                              ^
   include/linux/vtime.h:42:62: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_account_softirq(struct task_struct *tsk) { }
                                                                ^
   include/linux/vtime.h:43:62: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_account_hardirq(struct task_struct *tsk) { }
                                                                ^
   include/linux/vtime.h:44:52: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void vtime_flush(struct task_struct *tsk) { }
                                                      ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/x86/include/asm/sections.h:7:
   include/asm-generic/sections.h:70:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int arch_is_kernel_text(unsigned long addr)
                                                       ^
   include/asm-generic/sections.h:77:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int arch_is_kernel_data(unsigned long addr)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:38:
   include/linux/interrupt.h:416:88: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void disable_irq_nosync_lockdep_irqsave(unsigned int irq, unsigned long *flags)
                                                                                          ^
   include/linux/interrupt.h:440:83: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void enable_irq_lockdep_irqrestore(unsigned int irq, unsigned long *flags)
                                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   include/linux/pci.h:1606:58: warning: unused parameter 'd' [-Wunused-parameter]
   static inline int pci_irqd_intx_xlate(struct irq_domain *d,
                                                            ^
   include/linux/pci.h:1607:31: warning: unused parameter 'node' [-Wunused-parameter]
                                         struct device_node *node,
                                                             ^
   include/linux/pci.h:1609:24: warning: unused parameter 'intsize' [-Wunused-parameter]
                                         unsigned int intsize,
                                                      ^
   include/linux/pci.h:1611:25: warning: unused parameter 'out_type' [-Wunused-parameter]
                                         unsigned int *out_type)
                                                       ^
   include/linux/pci.h:1666:50: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
                                                    ^
   include/linux/pci.h:1666:59: warning: unused parameter 'granularity' [-Wunused-parameter]
   static inline int pci_enable_ptm(struct pci_dev *dev, u8 *granularity)
                                                             ^
   include/linux/pci.h:1668:53: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline bool pcie_ptm_enabled(struct pci_dev *dev)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:1890:
   In file included from arch/x86/include/asm/pci.h:109:
   include/asm-generic/pci.h:11:58: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
                                                            ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   include/linux/pci.h:2360:47: warning: unused parameter 'bus' [-Wunused-parameter]
   pci_host_bridge_of_msi_domain(struct pci_bus *bus) { return NULL; }
                                                 ^
   include/linux/pci.h:2361:59: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline bool pci_host_of_has_msi_map(struct device *dev) { return false; }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:34:
   In file included from include/linux/pci.h:2452:
   In file included from include/linux/pci-dma-compat.h:8:
   include/linux/dma-mapping.h:83:59: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline void debug_dma_mapping_error(struct device *dev,
                                                             ^
   include/linux/dma-mapping.h:84:14: warning: unused parameter 'dma_addr' [-Wunused-parameter]
                   dma_addr_t dma_addr)
                              ^
   include/linux/dma-mapping.h:87:56: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline void debug_dma_map_single(struct device *dev, const void *addr,
                                                          ^
   include/linux/dma-mapping.h:87:73: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void debug_dma_map_single(struct device *dev, const void *addr,
                                                                           ^
   include/linux/dma-mapping.h:88:17: warning: unused parameter 'len' [-Wunused-parameter]
                   unsigned long len)
                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
--
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:231:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:419:15: warning: unused parameter 'migratetype' [-Wunused-parameter]
                                                int migratetype)
                                                    ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   include/linux/mm.h:2193:46: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool ptlock_alloc(struct page *page)
                                                ^
   include/linux/mm.h:2198:45: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void ptlock_free(struct page *page)
                                               ^
   include/linux/mm.h:2208:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2299:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
                                                           ^
   include/linux/mm.h:2365:68: warning: unused parameter 'pud' [-Wunused-parameter]
   static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
                                                                      ^
   include/linux/mm.h:2973:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                         ^
   include/linux/mm.h:2973:65: warning: unused parameter 'nunmpages' [-Wunused-parameter]
   static inline void __kernel_poison_pages(struct page *page, int nunmpages) { }
                                                                   ^
   include/linux/mm.h:2974:53: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                       ^
   include/linux/mm.h:2974:63: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_poison_pages(struct page *page, int numpages) { }
                                                                 ^
   include/linux/mm.h:2975:55: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                         ^
   include/linux/mm.h:2975:65: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void kernel_unpoison_pages(struct page *page, int numpages) { }
                                                                   ^
   include/linux/mm.h:3034:59: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                             ^
   include/linux/mm.h:3034:69: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
                                                                       ^
   include/linux/mm.h:3035:61: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                               ^
   include/linux/mm.h:3035:71: warning: unused parameter 'numpages' [-Wunused-parameter]
   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
                                                                         ^
   include/linux/mm.h:3219:47: warning: unused parameter 'page' [-Wunused-parameter]
   static inline bool page_is_guard(struct page *page) { return false; }
                                                 ^
   include/linux/mm.h:3292:41: warning: unused parameter 'mm' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                           ^
>> include/linux/mm.h:3292:59: warning: unused parameter 'start' [-Wunused-parameter]
   madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
                                                             ^
>> include/linux/mm.h:3293:23: warning: unused parameter 'len_in' [-Wunused-parameter]
                         unsigned long len_in, const char *name) {
                                       ^
   include/linux/mm.h:3293:43: warning: unused parameter 'name' [-Wunused-parameter]
                         unsigned long len_in, const char *name) {
                                                           ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:22:
   include/linux/sched/mm.h:182:55: warning: unused parameter 'ip' [-Wunused-parameter]
   static inline void __fs_reclaim_acquire(unsigned long ip) { }
                                                         ^
   include/linux/sched/mm.h:183:55: warning: unused parameter 'ip' [-Wunused-parameter]
   static inline void __fs_reclaim_release(unsigned long ip) { }
                                                         ^
   include/linux/sched/mm.h:184:45: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
   static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
                                               ^
   include/linux/sched/mm.h:185:45: warning: unused parameter 'gfp_mask' [-Wunused-parameter]
   static inline void fs_reclaim_release(gfp_t gfp_mask) { }
                                               ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   include/linux/cgroup-defs.h:720:72: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void cgroup_threadgroup_change_begin(struct task_struct *tsk)
                                                                          ^
   include/linux/cgroup-defs.h:731:70: warning: unused parameter 'tsk' [-Wunused-parameter]
   static inline void cgroup_threadgroup_change_end(struct task_struct *tsk)
                                                                        ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from arch/x86/include/asm/cacheflush.h:8:
   include/asm-generic/cacheflush.h:21:53: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void flush_cache_mm(struct mm_struct *mm)
                                                       ^
   include/asm-generic/cacheflush.h:27:57: warning: unused parameter 'mm' [-Wunused-parameter]
   static inline void flush_cache_dup_mm(struct mm_struct *mm)
                                                           ^
   include/asm-generic/cacheflush.h:33:61: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_cache_range(struct vm_area_struct *vma,
                                                               ^
   include/asm-generic/cacheflush.h:34:24: warning: unused parameter 'start' [-Wunused-parameter]
                                        unsigned long start,
                                                      ^
   include/asm-generic/cacheflush.h:35:24: warning: unused parameter 'end' [-Wunused-parameter]
                                        unsigned long end)
                                                      ^
   include/asm-generic/cacheflush.h:41:60: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_cache_page(struct vm_area_struct *vma,
                                                              ^
   include/asm-generic/cacheflush.h:42:23: warning: unused parameter 'vmaddr' [-Wunused-parameter]
                                       unsigned long vmaddr,
                                                     ^
   include/asm-generic/cacheflush.h:43:23: warning: unused parameter 'pfn' [-Wunused-parameter]
                                       unsigned long pfn)
                                                     ^
   include/asm-generic/cacheflush.h:49:51: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void flush_dcache_page(struct page *page)
                                                     ^
   include/asm-generic/cacheflush.h:57:65: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void flush_dcache_mmap_lock(struct address_space *mapping)
                                                                   ^
   include/asm-generic/cacheflush.h:63:67: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
                                                                     ^
   include/asm-generic/cacheflush.h:69:53: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void flush_icache_range(unsigned long start, unsigned long end)
                                                       ^
   include/asm-generic/cacheflush.h:69:74: warning: unused parameter 'end' [-Wunused-parameter]
   static inline void flush_icache_range(unsigned long start, unsigned long end)
                                                                            ^
   include/asm-generic/cacheflush.h:79:61: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_icache_page(struct vm_area_struct *vma,
                                                               ^
   include/asm-generic/cacheflush.h:80:23: warning: unused parameter 'page' [-Wunused-parameter]
                                        struct page *page)
                                                     ^
   include/asm-generic/cacheflush.h:86:66: warning: unused parameter 'vma' [-Wunused-parameter]
..


vim +/start +3292 include/linux/mm.h

  3208	
  3209	static inline bool page_is_guard(struct page *page)
  3210	{
  3211		if (!debug_guardpage_enabled())
  3212			return false;
  3213	
  3214		return PageGuard(page);
  3215	}
  3216	#else
  3217	static inline unsigned int debug_guardpage_minorder(void) { return 0; }
  3218	static inline bool debug_guardpage_enabled(void) { return false; }
> 3219	static inline bool page_is_guard(struct page *page) { return false; }
  3220	#endif /* CONFIG_DEBUG_PAGEALLOC */
  3221	
  3222	#if MAX_NUMNODES > 1
  3223	void __init setup_nr_node_ids(void);
  3224	#else
  3225	static inline void setup_nr_node_ids(void) {}
  3226	#endif
  3227	
  3228	extern int memcmp_pages(struct page *page1, struct page *page2);
  3229	
  3230	static inline int pages_identical(struct page *page1, struct page *page2)
  3231	{
  3232		return !memcmp_pages(page1, page2);
  3233	}
  3234	
  3235	#ifdef CONFIG_MAPPING_DIRTY_HELPERS
  3236	unsigned long clean_record_shared_mapping_range(struct address_space *mapping,
  3237							pgoff_t first_index, pgoff_t nr,
  3238							pgoff_t bitmap_pgoff,
  3239							unsigned long *bitmap,
  3240							pgoff_t *start,
  3241							pgoff_t *end);
  3242	
  3243	unsigned long wp_shared_mapping_range(struct address_space *mapping,
  3244					      pgoff_t first_index, pgoff_t nr);
  3245	#endif
  3246	
  3247	extern int sysctl_nr_trim_pages;
  3248	
  3249	#ifdef CONFIG_PRINTK
  3250	void mem_dump_obj(void *object);
  3251	#else
  3252	static inline void mem_dump_obj(void *object) {}
  3253	#endif
  3254	
  3255	/**
  3256	 * seal_check_future_write - Check for F_SEAL_FUTURE_WRITE flag and handle it
  3257	 * @seals: the seals to check
  3258	 * @vma: the vma to operate on
  3259	 *
  3260	 * Check whether F_SEAL_FUTURE_WRITE is set; if so, do proper check/handling on
  3261	 * the vma flags.  Return 0 if check pass, or <0 for errors.
  3262	 */
  3263	static inline int seal_check_future_write(int seals, struct vm_area_struct *vma)
  3264	{
  3265		if (seals & F_SEAL_FUTURE_WRITE) {
  3266			/*
  3267			 * New PROT_WRITE and MAP_SHARED mmaps are not allowed when
  3268			 * "future write" seal active.
  3269			 */
  3270			if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_WRITE))
  3271				return -EPERM;
  3272	
  3273			/*
  3274			 * Since an F_SEAL_FUTURE_WRITE sealed memfd can be mapped as
  3275			 * MAP_SHARED and read-only, take care to not allow mprotect to
  3276			 * revert protections on such mappings. Do this only for shared
  3277			 * mappings. For private mappings, don't need to mask
  3278			 * VM_MAYWRITE as we still want them to be COW-writable.
  3279			 */
  3280			if (vma->vm_flags & VM_SHARED)
  3281				vma->vm_flags &= ~(VM_MAYWRITE);
  3282		}
  3283	
  3284		return 0;
  3285	}
  3286	
  3287	#ifdef CONFIG_ANON_VMA_NAME
  3288	int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
  3289				  unsigned long len_in, const char *name);
  3290	#else
  3291	static inline int
> 3292	madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> 3293			      unsigned long len_in, const char *name) {
  3294		return 0;
  3295	}
  3296	#endif
  3297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
