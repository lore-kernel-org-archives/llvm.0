Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265A7154A0;
	Thu,  3 Aug 2023 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691058142; x=1722594142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTpaN0xacLqVHMQmxjfdyudpI87J+MR3cLqw+YTqDdQ=;
  b=dBIheyNw08FmDaqsc0EJwuos2L9qHxnKIQrzztyFm++zJEnxoCLVK953
   0Z4e0V1YaWVetvTf6ePKpqmU0Z4LInYOUd8F1z136EnJV6kPriHUSPeLF
   zTPwjw4Czkk3+jx1LzQxFZ8TTgPbNTYNX8wDMa5BjO1VoOs3KSs+IeygZ
   +vTDb0y7R5A3GZqYCWRubQj9JNL6QPSOZNLOpU4O1s0pHmrEwPn98yFU5
   etc59h19A7pfpY0fkNXhHuaQ/VA+5Na1pzZ9RMQu7a9eefd3jbvsULFu+
   2p6qG7WZN7LkxCFmPArOtsUDYOcudxPPbSDT6MefFjxfZXBV9J8ewCYyf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436142121"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="436142121"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="976022638"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="976022638"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 03:22:20 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRVTH-00022Z-37;
	Thu, 03 Aug 2023 10:22:19 +0000
Date: Thu, 3 Aug 2023 18:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [palmer:timex 1/1] include/asm-generic/io.h:547:20: error: use of
 undeclared identifier 'STRUCT_PAGE_MAX_SHIFT'
Message-ID: <202308031858.AgBMeNEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git timex
head:   41c5a952f77e53bf4201296abff0132725aa19e6
commit: 41c5a952f77e53bf4201296abff0132725aa19e6 [1/1] RISC-V: Include io from timex
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230803/202308031858.AgBMeNEo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031858.AgBMeNEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031858.AgBMeNEo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:118:
>> arch/riscv/include/asm/pgtable-64.h:226:9: error: use of undeclared identifier 'mem_map'; did you mean 'memcmp'?
     226 |         return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
         |                ^
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:29: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^
   include/linux/string.h:156:12: note: 'memcmp' declared here
     156 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:118:
>> arch/riscv/include/asm/pgtable-64.h:226:9: error: incompatible pointer types returning 'int (*)(const void *, const void *, unsigned long)' from a function with result type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     226 |         return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:28: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:118:
   arch/riscv/include/asm/pgtable-64.h:333:9: error: use of undeclared identifier 'mem_map'; did you mean 'memcmp'?
     333 |         return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
         |                ^
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:29: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^
   include/linux/string.h:156:12: note: 'memcmp' declared here
     156 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:118:
   arch/riscv/include/asm/pgtable-64.h:333:9: error: incompatible pointer types returning 'int (*)(const void *, const void *, unsigned long)' from a function with result type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     333 |         return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:28: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:118:
   arch/riscv/include/asm/pgtable-64.h:396:9: error: use of undeclared identifier 'mem_map'; did you mean 'memcmp'?
     396 |         return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
         |                ^
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:29: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^
   include/linux/string.h:156:12: note: 'memcmp' declared here
     156 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:118:
   arch/riscv/include/asm/pgtable-64.h:396:9: error: incompatible pointer types returning 'int (*)(const void *, const void *, unsigned long)' from a function with result type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     396 |         return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:28: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:252:9: error: use of undeclared identifier 'mem_map'; did you mean 'memcmp'?
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:29: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^
   include/linux/string.h:156:12: note: 'memcmp' declared here
     156 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:252:9: error: incompatible pointer types returning 'int (*)(const void *, const void *, unsigned long)' from a function with result type 'struct page *' [-Werror,-Wincompatible-pointer-types]
     252 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: expanded from macro 'pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^
   include/asm-generic/memory_model.h:18:28: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:518:17: error: incomplete definition of type 'struct vm_area_struct'
     518 |                 set_pte_at(vma->vm_mm, address, ptep, entry);
         |                            ~~~^
   include/linux/mmdebug.h:9:8: note: forward declaration of 'struct vm_area_struct'
       9 | struct vm_area_struct;
         |        ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
>> include/linux/pgtable.h:161:42: error: incomplete definition of type 'struct mm_struct'
     161 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                                 ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:141:53: note: expanded from macro 'pgd_offset'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                        ~~~~^
   include/linux/mmdebug.h:10:8: note: forward declaration of 'struct mm_struct'
      10 | struct mm_struct;
         |        ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
>> include/linux/pgtable.h:166:42: error: use of undeclared identifier 'init_mm'; did you mean 'init_IRQ'?
     166 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                                 ^
   include/linux/pgtable.h:149:44: note: expanded from macro 'pgd_offset_k'
     149 | #define pgd_offset_k(address)           pgd_offset(&init_mm, (address))
         |                                                     ^
   include/linux/init.h:156:6: note: 'init_IRQ' declared here
     156 | void init_IRQ(void);
         |      ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
>> include/linux/pgtable.h:166:42: error: member reference base type 'void (void)' is not a structure or union
     166 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/pgtable.h:149:32: note: expanded from macro 'pgd_offset_k'
     149 | #define pgd_offset_k(address)           pgd_offset(&init_mm, (address))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:141:53: note: expanded from macro 'pgd_offset'
     141 | #define pgd_offset(mm, address)         pgd_offset_pgd((mm)->pgd, (address))
         |                                                        ~~~~^ ~~~
   include/linux/pgtable.h:814:38: error: unknown type name 'swp_entry_t'
     814 | static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
         |                                      ^
>> include/linux/pgtable.h:814:64: warning: declaration of 'struct folio' will not be visible outside of this function [-Wvisibility]
     814 | static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
         |                                                                ^
>> include/linux/pgtable.h:941:31: error: incomplete definition of type 'struct vm_area_struct'
     941 |         return ptep_get_and_clear(vma->vm_mm, addr, ptep);
         |                                   ~~~^
   include/linux/mmdebug.h:9:8: note: forward declaration of 'struct vm_area_struct'
       9 | struct vm_area_struct;
         |        ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:15:
   include/linux/pgtable.h:952:16: error: incomplete definition of type 'struct vm_area_struct'
     952 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |                    ~~~^
   include/linux/mmdebug.h:9:8: note: forward declaration of 'struct vm_area_struct'
       9 | struct vm_area_struct;
         |        ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:136:
>> include/asm-generic/io.h:547:20: error: use of undeclared identifier 'STRUCT_PAGE_MAX_SHIFT'
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ^
   arch/riscv/include/asm/io.h:30:38: note: expanded from macro 'PCI_IOBASE'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^
   arch/riscv/include/asm/pgtable.h:86:27: note: expanded from macro 'PCI_IO_START'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^
   arch/riscv/include/asm/pgtable.h:85:26: note: expanded from macro 'PCI_IO_END'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^
   arch/riscv/include/asm/pgtable.h:76:40: note: expanded from macro 'VMEMMAP_START'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^
   arch/riscv/include/asm/pgtable.h:74:26: note: expanded from macro 'VMEMMAP_SIZE'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^
   arch/riscv/include/asm/pgtable.h:73:30: note: expanded from macro 'VMEMMAP_SHIFT'
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:560:50: error: use of undeclared identifier 'STRUCT_PAGE_MAX_SHIFT'
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ^
   arch/riscv/include/asm/io.h:30:38: note: expanded from macro 'PCI_IOBASE'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^
   arch/riscv/include/asm/pgtable.h:86:27: note: expanded from macro 'PCI_IO_START'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^
   arch/riscv/include/asm/pgtable.h:85:26: note: expanded from macro 'PCI_IO_END'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^
   arch/riscv/include/asm/pgtable.h:76:40: note: expanded from macro 'VMEMMAP_START'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^
   arch/riscv/include/asm/pgtable.h:74:26: note: expanded from macro 'VMEMMAP_SIZE'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^
   arch/riscv/include/asm/pgtable.h:73:30: note: expanded from macro 'VMEMMAP_SHIFT'
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:573:50: error: use of undeclared identifier 'STRUCT_PAGE_MAX_SHIFT'
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ^
   arch/riscv/include/asm/io.h:30:38: note: expanded from macro 'PCI_IOBASE'
      30 | #define PCI_IOBASE              ((void __iomem *)PCI_IO_START)
         |                                                  ^
   arch/riscv/include/asm/pgtable.h:86:27: note: expanded from macro 'PCI_IO_START'
      86 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
         |                           ^
   arch/riscv/include/asm/pgtable.h:85:26: note: expanded from macro 'PCI_IO_END'
      85 | #define PCI_IO_END       VMEMMAP_START
         |                          ^
   arch/riscv/include/asm/pgtable.h:76:40: note: expanded from macro 'VMEMMAP_START'
      76 | #define VMEMMAP_START   (VMALLOC_START - VMEMMAP_SIZE)
         |                                          ^
   arch/riscv/include/asm/pgtable.h:74:26: note: expanded from macro 'VMEMMAP_SIZE'
      74 | #define VMEMMAP_SIZE    BIT(VMEMMAP_SHIFT)
         |                             ^
   arch/riscv/include/asm/pgtable.h:73:30: note: expanded from macro 'VMEMMAP_SHIFT'
      73 |         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
         |                                     ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/riscv/include/asm/timex.h:10:


vim +/STRUCT_PAGE_MAX_SHIFT +547 include/asm-generic/io.h

3f7e212df82ca04 Arnd Bergmann  2009-05-13  533  
9216efafc52ff99 Thierry Reding 2014-10-01  534  /*
9216efafc52ff99 Thierry Reding 2014-10-01  535   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff99 Thierry Reding 2014-10-01  536   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff99 Thierry Reding 2014-10-01  537   * take effect.
9216efafc52ff99 Thierry Reding 2014-10-01  538   */
9216efafc52ff99 Thierry Reding 2014-10-01  539  
f009c89df79abea John Garry     2020-03-28  540  #if !defined(inb) && !defined(_inb)
f009c89df79abea John Garry     2020-03-28  541  #define _inb _inb
214ba3584b2e2c5 Stafford Horne 2020-07-26  542  static inline u8 _inb(unsigned long addr)
9216efafc52ff99 Thierry Reding 2014-10-01  543  {
87fe2d543f81730 Sinan Kaya     2018-04-05  544  	u8 val;
87fe2d543f81730 Sinan Kaya     2018-04-05  545  
87fe2d543f81730 Sinan Kaya     2018-04-05  546  	__io_pbr();
87fe2d543f81730 Sinan Kaya     2018-04-05 @547  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e95 Will Deacon    2019-02-22  548  	__io_par(val);
87fe2d543f81730 Sinan Kaya     2018-04-05  549  	return val;
9216efafc52ff99 Thierry Reding 2014-10-01  550  }
9216efafc52ff99 Thierry Reding 2014-10-01  551  #endif
9216efafc52ff99 Thierry Reding 2014-10-01  552  

:::::: The code at line 547 was first introduced by commit
:::::: 87fe2d543f817300e13f0ea683f38c122737856e io: change inX() to have their own IO barrier overrides

:::::: TO: Sinan Kaya <okaya@codeaurora.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
