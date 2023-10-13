Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE32C85C;
	Fri, 13 Oct 2023 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/72ZeVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697238929; x=1728774929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CChxoG+joF9KM8OeIcKBdBWy3YmMo6L0gdpfSFYEUI=;
  b=W/72ZeVUwqE+EPuITl8nox73ZYaUEifyqfdCyme9lS9R8ApCRRFfvTvy
   sPrLQXPXyzmaR/41M3SxqLA9+f9hXsGBQqQ9bPvaX6MTsx6TYQBNCkvHK
   f65LTbbvcJm9HKy7ZTv3VaJE9NnMdb6O6e5j3tynm9Ko71u4CYDUYY/1+
   1ZUgGQxI1CAuO0j5wRSyRYrmmu7EeiMwNK2dpPkSldFk3PZtP8w5f12D+
   z6UJX8z4FUAVsO4h/HLQtVoEgzQpPmAFp5X2KrfSqspZGBoPbi880oO+r
   77NQFH/TvNPgntzghAMUSDWC7yif4wC0SzhnMdVSG62odoSJVROTxjAjS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370352514"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="370352514"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 16:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748527542"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="748527542"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Oct 2023 16:13:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrRLF-0005VB-1H;
	Fri, 13 Oct 2023 23:13:13 +0000
Date: Sat, 14 Oct 2023 07:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Todd Kjos <tkjos@google.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [sudeep-holla:android13-5.15/ffa 2838/4062]
 include/asm-generic/io.h:83:39: warning: unused parameter 'val'
Message-ID: <202310140726.rKNe1wEn-lkp@intel.com>
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
commit: 4de51791002eb24ab7eab0f35b74c2bb9aed1b6f [2838/4062] FROMLIST: asm-generic/io: Add logging support for MMIO accessors
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231014/202310140726.rKNe1wEn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140726.rKNe1wEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140726.rKNe1wEn-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                                       ^
   include/acpi/acpixf.h:929:19: warning: unused parameter 'function_name' [-Wunused-parameter]
                                                   const char *function_name,
                                                               ^
   include/acpi/acpixf.h:930:19: warning: unused parameter 'module_name' [-Wunused-parameter]
                                                   const char *module_name,
                                                               ^
   include/acpi/acpixf.h:931:11: warning: unused parameter 'component_id' [-Wunused-parameter]
                                                   u32 component_id,
                                                       ^
   include/acpi/acpixf.h:932:19: warning: unused parameter 'format' [-Wunused-parameter]
                                                   const char *format, ...))
                                                               ^
   include/acpi/acpixf.h:935:30: warning: unused parameter 'requested_debug_level' [-Wunused-parameter]
                                   acpi_debug_print_raw(u32 requested_debug_level,
                                                            ^
   include/acpi/acpixf.h:936:16: warning: unused parameter 'line_number' [-Wunused-parameter]
                                                        u32 line_number,
                                                            ^
   include/acpi/acpixf.h:937:24: warning: unused parameter 'function_name' [-Wunused-parameter]
                                                        const char *function_name,
                                                                    ^
   include/acpi/acpixf.h:938:24: warning: unused parameter 'module_name' [-Wunused-parameter]
                                                        const char *module_name,
                                                                    ^
   include/acpi/acpixf.h:939:16: warning: unused parameter 'component_id' [-Wunused-parameter]
                                                        u32 component_id,
                                                            ^
   include/acpi/acpixf.h:940:24: warning: unused parameter 'format' [-Wunused-parameter]
                                                        const char *format, ...))
                                                                    ^
   include/acpi/acpixf.h:943:50: warning: unused parameter 'type' [-Wunused-parameter]
                                  acpi_trace_point(acpi_trace_event_type type,
                                                                         ^
   include/acpi/acpixf.h:944:10: warning: unused parameter 'begin' [-Wunused-parameter]
                                                   u8 begin,
                                                      ^
   include/acpi/acpixf.h:945:11: warning: unused parameter 'aml' [-Wunused-parameter]
                                                   u8 *aml, char *pathname))
                                                       ^
   include/acpi/acpixf.h:945:22: warning: unused parameter 'pathname' [-Wunused-parameter]
                                                   u8 *aml, char *pathname))
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:29:
   In file included from include/linux/module.h:19:
   include/linux/elf.h:70:74: warning: unused parameter 'cprm' [-Wunused-parameter]
   static inline int elf_coredump_extra_notes_write(struct coredump_params *cprm) { return 0; }
                                                                            ^
   include/linux/elf.h:89:47: warning: unused parameter 'type' [-Wunused-parameter]
   static inline int arch_parse_elf_property(u32 type, const void *data,
                                                 ^
   include/linux/elf.h:89:65: warning: unused parameter 'data' [-Wunused-parameter]
   static inline int arch_parse_elf_property(u32 type, const void *data,
                                                                   ^
   include/linux/elf.h:90:15: warning: unused parameter 'datasz' [-Wunused-parameter]
                                             size_t datasz, bool compat,
                                                    ^
   include/linux/elf.h:90:28: warning: unused parameter 'compat' [-Wunused-parameter]
                                             size_t datasz, bool compat,
                                                                 ^
   include/linux/elf.h:91:31: warning: unused parameter 'arch' [-Wunused-parameter]
                                             struct arch_elf_state *arch)
                                                                    ^
   include/linux/elf.h:105:41: warning: unused parameter 'state' [-Wunused-parameter]
                                          const struct arch_elf_state *state,
                                                                       ^
   include/linux/elf.h:106:17: warning: unused parameter 'has_interp' [-Wunused-parameter]
                                          bool has_interp, bool is_interp)
                                               ^
   include/linux/elf.h:106:34: warning: unused parameter 'is_interp' [-Wunused-parameter]
                                          bool has_interp, bool is_interp)
                                                                ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:29:
   In file included from include/linux/module.h:25:
   include/linux/rbtree_latch.h:173:33: warning: unused parameter 'ops' [-Wunused-parameter]
                    const struct latch_tree_ops *ops)
                                                 ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:29:
   include/linux/module.h:855:45: warning: unused parameter 'has_retpoline' [-Wunused-parameter]
   static inline bool retpoline_module_ok(bool has_retpoline)
                                               ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:224:
   include/asm-generic/iomap.h:107:52: warning: unused parameter 'offset' [-Wunused-parameter]
   static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
                                                      ^
   include/asm-generic/iomap.h:107:67: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
>> include/asm-generic/io.h:83:39: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                         ^
>> include/asm-generic/io.h:83:47: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                 ^
>> include/asm-generic/io.h:83:77: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                                               ^
>> include/asm-generic/io.h:84:21: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                     unsigned long caller_addr) {}
                                                   ^
   include/asm-generic/io.h:85:44: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                              ^
   include/asm-generic/io.h:85:52: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                      ^
   include/asm-generic/io.h:85:82: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                                                    ^
   include/asm-generic/io.h:86:26: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                          unsigned long caller_addr) {}
                                                        ^
   include/asm-generic/io.h:87:37: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
                                       ^
   include/asm-generic/io.h:87:73: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
                                                                           ^
   include/asm-generic/io.h:88:20: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                    unsigned long caller_addr) {}
                                                  ^
   include/asm-generic/io.h:89:43: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                             ^
   include/asm-generic/io.h:89:51: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                                     ^
   include/asm-generic/io.h:89:87: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                                                                         ^
   include/asm-generic/io.h:90:25: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                         unsigned long caller_addr) {}
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   In file included from include/asm-generic/io.h:984:
   In file included from include/linux/vmalloc.h:13:
   arch/x86/include/asm/vmalloc.h:12:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_pud_supported(pgprot_t prot)
                                                       ^
   arch/x86/include/asm/vmalloc.h:19:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   In file included from include/asm-generic/io.h:984:
   include/linux/vmalloc.h:87:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_p4d_supported(pgprot_t prot)
                                                       ^
   include/linux/vmalloc.h:108:72: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                          ^
   include/linux/vmalloc.h:108:92: warning: unused parameter 'end' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                                              ^
   include/linux/vmalloc.h:109:13: warning: unused parameter 'pfn' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                ^
   include/linux/vmalloc.h:109:31: warning: unused parameter 'max_page_shift' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                                  ^
   include/linux/vmalloc.h:116:63: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int arch_vmap_pte_supported_shift(unsigned long size)
                                                                 ^
   include/linux/vmalloc.h:211:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline bool is_vm_area_hugepages(const void *addr)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:7:
   arch/x86/include/asm/acpi.h:165:64: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
                                                                  ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:30:
   include/linux/acpi.h:175:57: warning: unused parameter 'owner' [-Wunused-parameter]
   static inline int acpi_register_debugger(struct module *owner,
                                                           ^
   include/linux/acpi.h:176:39: warning: unused parameter 'ops' [-Wunused-parameter]
                                            const struct acpi_debugger_ops *ops)
                                                                            ^
   include/linux/acpi.h:181:77: warning: unused parameter 'ops' [-Wunused-parameter]
   static inline void acpi_unregister_debugger(const struct acpi_debugger_ops *ops)
                                                                               ^
   include/linux/acpi.h:185:70: warning: unused parameter 'function' [-Wunused-parameter]
   static inline int acpi_debugger_create_thread(acpi_osd_exec_callback function,
                                                                        ^
   include/linux/acpi.h:186:18: warning: unused parameter 'context' [-Wunused-parameter]
                                                 void *context)
                                                       ^
   include/linux/acpi.h:191:55: warning: unused parameter 'msg' [-Wunused-parameter]
   static inline int acpi_debugger_write_log(const char *msg)
                                                         ^
--
   include/linux/kasan.h:337:14: warning: unused parameter 'flags' [-Wunused-parameter]
                                      gfp_t flags, bool init)
                                            ^
   include/linux/kasan.h:337:26: warning: unused parameter 'init' [-Wunused-parameter]
                                      gfp_t flags, bool init)
                                                        ^
   include/linux/kasan.h:341:54: warning: unused parameter 's' [-Wunused-parameter]
   static inline void *kasan_kmalloc(struct kmem_cache *s, const void *object,
                                                        ^
   include/linux/kasan.h:342:12: warning: unused parameter 'size' [-Wunused-parameter]
                                   size_t size, gfp_t flags)
                                          ^
   include/linux/kasan.h:342:24: warning: unused parameter 'flags' [-Wunused-parameter]
                                   size_t size, gfp_t flags)
                                                      ^
   include/linux/kasan.h:346:65: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
                                                                   ^
   include/linux/kasan.h:346:77: warning: unused parameter 'flags' [-Wunused-parameter]
   static inline void *kasan_kmalloc_large(const void *ptr, size_t size, gfp_t flags)
                                                                               ^
   include/linux/kasan.h:350:63: warning: unused parameter 'new_size' [-Wunused-parameter]
   static inline void *kasan_krealloc(const void *object, size_t new_size,
                                                                 ^
   include/linux/kasan.h:351:12: warning: unused parameter 'flags' [-Wunused-parameter]
                                    gfp_t flags)
                                          ^
   include/linux/kasan.h:355:49: warning: unused parameter 'address' [-Wunused-parameter]
   static inline bool kasan_check_byte(const void *address)
                                                   ^
   include/linux/kasan.h:365:66: warning: unused parameter 'task' [-Wunused-parameter]
   static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
                                                                    ^
   include/linux/kasan.h:376:58: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
                                                            ^
   include/linux/kasan.h:377:60: warning: unused parameter 'cache' [-Wunused-parameter]
   static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
                                                              ^
   include/linux/kasan.h:378:49: warning: unused parameter 'ptr' [-Wunused-parameter]
   static inline void kasan_record_aux_stack(void *ptr) {}
                                                   ^
   include/linux/kasan.h:439:56: warning: unused parameter 'start' [-Wunused-parameter]
   static inline int kasan_populate_vmalloc(unsigned long start,
                                                          ^
   include/linux/kasan.h:440:20: warning: unused parameter 'size' [-Wunused-parameter]
                                           unsigned long size)
                                                         ^
   include/linux/kasan.h:445:53: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
                                                       ^
   include/linux/kasan.h:445:74: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
                                                                            ^
   include/linux/kasan.h:447:55: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
                                                         ^
   include/linux/kasan.h:447:76: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void kasan_unpoison_vmalloc(const void *start, unsigned long size)
                                                                              ^
   include/linux/kasan.h:449:56: warning: unused parameter 'start' [-Wunused-parameter]
   static inline void kasan_release_vmalloc(unsigned long start,
                                                          ^
   include/linux/kasan.h:450:21: warning: unused parameter 'end' [-Wunused-parameter]
                                            unsigned long end,
                                                          ^
   include/linux/kasan.h:451:21: warning: unused parameter 'free_region_start' [-Wunused-parameter]
                                            unsigned long free_region_start,
                                                          ^
   include/linux/kasan.h:452:21: warning: unused parameter 'free_region_end' [-Wunused-parameter]
                                            unsigned long free_region_end) {}
                                                          ^
   include/linux/kasan.h:469:44: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size) { return 0; }
                                              ^
   include/linux/kasan.h:469:57: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int kasan_module_alloc(void *addr, size_t size) { return 0; }
                                                           ^
   include/linux/kasan.h:470:62: warning: unused parameter 'vm' [-Wunused-parameter]
   static inline void kasan_free_shadow(const struct vm_struct *vm) {}
                                                                ^
   include/linux/kasan.h:477:59: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void kasan_non_canonical_hook(unsigned long addr) { }
                                                             ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:224:
   include/asm-generic/iomap.h:107:52: warning: unused parameter 'offset' [-Wunused-parameter]
   static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
                                                      ^
   include/asm-generic/iomap.h:107:67: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
                                                                     ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
>> include/asm-generic/io.h:83:39: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                         ^
>> include/asm-generic/io.h:83:47: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                 ^
>> include/asm-generic/io.h:83:77: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                                               ^
>> include/asm-generic/io.h:84:21: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                     unsigned long caller_addr) {}
                                                   ^
   include/asm-generic/io.h:85:44: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                              ^
   include/asm-generic/io.h:85:52: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                      ^
   include/asm-generic/io.h:85:82: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
                                                                                    ^
   include/asm-generic/io.h:86:26: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                          unsigned long caller_addr) {}
                                                        ^
   include/asm-generic/io.h:87:37: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
                                       ^
   include/asm-generic/io.h:87:73: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
                                                                           ^
   include/asm-generic/io.h:88:20: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                    unsigned long caller_addr) {}
                                                  ^
   include/asm-generic/io.h:89:43: warning: unused parameter 'val' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                             ^
   include/asm-generic/io.h:89:51: warning: unused parameter 'width' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                                     ^
   include/asm-generic/io.h:89:87: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
                                                                                         ^
   include/asm-generic/io.h:90:25: warning: unused parameter 'caller_addr' [-Wunused-parameter]
                                         unsigned long caller_addr) {}
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   In file included from include/asm-generic/io.h:984:
   In file included from include/linux/vmalloc.h:13:
   arch/x86/include/asm/vmalloc.h:12:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_pud_supported(pgprot_t prot)
                                                       ^
   arch/x86/include/asm/vmalloc.h:19:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:12:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:375:
   In file included from include/asm-generic/io.h:984:
   include/linux/vmalloc.h:87:53: warning: unused parameter 'prot' [-Wunused-parameter]
   static inline bool arch_vmap_p4d_supported(pgprot_t prot)
                                                       ^
   include/linux/vmalloc.h:108:72: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                          ^
   include/linux/vmalloc.h:108:92: warning: unused parameter 'end' [-Wunused-parameter]
   static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
                                                                                              ^
   include/linux/vmalloc.h:109:13: warning: unused parameter 'pfn' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                ^
   include/linux/vmalloc.h:109:31: warning: unused parameter 'max_page_shift' [-Wunused-parameter]
                                                            u64 pfn, unsigned int max_page_shift)
                                                                                  ^
   include/linux/vmalloc.h:116:63: warning: unused parameter 'size' [-Wunused-parameter]
   static inline int arch_vmap_pte_supported_shift(unsigned long size)
                                                                 ^
   include/linux/vmalloc.h:211:53: warning: unused parameter 'addr' [-Wunused-parameter]
   static inline bool is_vm_area_hugepages(const void *addr)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:26:
   In file included from arch/x86/include/asm/pkru.h:5:
   In file included from arch/x86/include/asm/fpu/xstate.h:5:
   include/linux/uaccess.h:48:51: warning: unused parameter 'oldfs' [-Wunused-parameter]
   static inline void force_uaccess_end(mm_segment_t oldfs)
                                                     ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:215:35: warning: unused parameter 'p4d' [-Wunused-parameter]
   static inline int p4d_large(p4d_t p4d)
                                     ^
   arch/x86/include/asm/pgtable.h:267:36: warning: unused parameter 'pgd' [-Wunused-parameter]
   static inline int pgd_devmap(pgd_t pgd)
                                      ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:38:
   In file included from include/linux/io-mapping.h:13:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:716:
..


vim +/val +83 include/asm-generic/io.h

    82	
  > 83	static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
  > 84					  unsigned long caller_addr) {}
    85	static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
    86					       unsigned long caller_addr) {}
    87	static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
    88					 unsigned long caller_addr) {}
    89	static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
    90					      unsigned long caller_addr) {}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
