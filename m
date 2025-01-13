Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38958152166;
	Mon, 13 Jan 2025 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804343; cv=none; b=JVOkp19CeZrIYgKDmSI36Kz4mDn8x9pLq1H3BVCtyJC9GxCgcUIlHBXhPSZEAHBjC8IBhbdtiQmdHGdnnlS8i9lN/lSxlKju07dY4NLMTJt3qhRWMa0nh1dr0tIqv6uDT0HLsQ09gnJWkNutWKTMGdTvhHT1GpisEKheomK2pdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804343; c=relaxed/simple;
	bh=hkCAOJ/fP67J+D+0lUtQ2mk5JPotPzPr+h0pJt1NOFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ml9Wa1TzpMAyu7fGFQSbT9GXzkVx8V6FJkrzWyeT+UI99TXpWxcZW1ux9Qf+HKpmEiSbW1e7B8iXtZ8LZ7Ja9dzTOoIQQY515tvQ2WQ4LDIUfq1BLCtDISalA78MYC5kQZ6+H0XJgM0oWEZkyAhZ/dmtMOC7LVaUHkPMn+/BTl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHEr4n5a; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHEr4n5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736804342; x=1768340342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkCAOJ/fP67J+D+0lUtQ2mk5JPotPzPr+h0pJt1NOFk=;
  b=VHEr4n5axibRCZSkyk9jR47yp4ADzGYQdzZ08FIW/4TEB+H3bLE21vdn
   HlmLrk+f7TgBEh6/JFPOhgaNQdYeXDth1ZNmW01gmpVlc9kUL/Z7FK64m
   2S1qli9LvC0EivB34H0FOzzVtbNkYBJGs4bD+PL79zpIj72wEHzBZILed
   guzmYA7h5FmKajWfct8ACYVkec3LH3cvBClBSSvF+o7ldTsDvzauS4tsu
   x7JtxxmfCPnhasCty9DhK8SMcQ3rwIun8x9RX9bBoaZw+10cXPiFt+75B
   rGMkFlIlK5orIQossdmytm9z+ZV4VvuGAchiivO92bEcahf7xAnlmT4v4
   w==;
X-CSE-ConnectionGUID: 8W+pn+UNQbWhdbll2vg/sQ==
X-CSE-MsgGUID: Lth8WPY5QuSOUr5cywF+9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47577995"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="47577995"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 13:39:01 -0800
X-CSE-ConnectionGUID: zDqCqmtZQlWBi34SkRXK+A==
X-CSE-MsgGUID: rsLFYJoHTmeDI7rOwU8uew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="109541162"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2025 13:38:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXS9A-000NiI-2Z;
	Mon, 13 Jan 2025 21:38:56 +0000
Date: Tue, 14 Jan 2025 05:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [uml:next 2/16] arch/um/include/asm/pgtable.h:225:9: error:
 incomplete definition of type 'struct mm_struct'
Message-ID: <202501140522.Kvqk6RVR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   2d2b61ae38bd91217ea7cc5bc700a2b9e75b3937
commit: 5bfc4a3a0af3dcf53516e5f0dd9a2649bcd05bad [2/16] um: Remove obsolete fixmap support
config: um-randconfig-001-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140522.Kvqk6RVR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140522.Kvqk6RVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140522.Kvqk6RVR-lkp@intel.com/

Note: the uml/next HEAD 2d2b61ae38bd91217ea7cc5bc700a2b9e75b3937 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:225:9: error: incomplete definition of type 'struct mm_struct'
     225 |         if (!mm->context.sync_tlb_range_to) {
         |              ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   arch/um/include/asm/pgtable.h:226:5: error: incomplete definition of type 'struct mm_struct'
     226 |                 mm->context.sync_tlb_range_from = start;
         |                 ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   arch/um/include/asm/pgtable.h:227:5: error: incomplete definition of type 'struct mm_struct'
     227 |                 mm->context.sync_tlb_range_to = end;
         |                 ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   arch/um/include/asm/pgtable.h:229:17: error: incomplete definition of type 'struct mm_struct'
     229 |                 if (start < mm->context.sync_tlb_range_from)
         |                             ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   arch/um/include/asm/pgtable.h:230:6: error: incomplete definition of type 'struct mm_struct'
     230 |                         mm->context.sync_tlb_range_from = start;
         |                         ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   arch/um/include/asm/pgtable.h:231:15: error: incomplete definition of type 'struct mm_struct'
     231 |                 if (end > mm->context.sync_tlb_range_to)
         |                           ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:12:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   arch/um/include/asm/pgtable.h:232:6: error: incomplete definition of type 'struct mm_struct'
     232 |                         mm->context.sync_tlb_range_to = end;
         |                         ~~^
   arch/um/include/asm/processor-generic.h:20:8: note: forward declaration of 'struct mm_struct'
      20 | struct mm_struct;
         |        ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/vmcore_info.c:12:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:9:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
--
   In file included from mm/kasan/common.c:14:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:25:
   In file included from arch/um/include/asm/pgtable-4level.h:10:
   include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'; did you mean 'pid_t'?
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
         |                  pid_t
   include/linux/types.h:27:25: note: 'pid_t' declared here
      27 | typedef __kernel_pid_t          pid_t;
         |                                 ^
   In file included from mm/kasan/common.c:14:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:25:
   In file included from arch/um/include/asm/pgtable-4level.h:10:
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'
      21 | static inline int pgd_none(pgd_t pgd)           { return 0; }
         |                            ^
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                           ^
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'
      23 | static inline int pgd_present(pgd_t pgd)        { return 1; }
         |                               ^
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'
      24 | static inline void pgd_clear(pgd_t *pgd)        { }
         |                              ^
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^
   In file included from mm/kasan/common.c:14:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:25:
   arch/um/include/asm/pgtable-4level.h:75:32: error: unknown type name 'pgd_t'
      75 | static inline int pgd_needsync(pgd_t pgd)
         |                                ^
>> arch/um/include/asm/pgtable-4level.h:77:9: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         return pgd_val(pgd) & _PAGE_NEEDSYNC;
         |                ^
   arch/um/include/asm/pgtable-4level.h:77:9: note: did you mean 'pgd_bad'?
   include/asm-generic/pgtable-nop4d.h:22:19: note: 'pgd_bad' declared here
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                   ^
   In file included from mm/kasan/common.c:14:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:25:
   arch/um/include/asm/pgtable-4level.h:80:35: error: unknown type name 'pgd_t'
      80 | static inline void pgd_mkuptodate(pgd_t pgd) { pgd_val(pgd) &= ~_PAGE_NEEDSYNC; }
         |                                   ^
   arch/um/include/asm/pgtable-4level.h:80:48: error: call to undeclared function 'pgd_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 | static inline void pgd_mkuptodate(pgd_t pgd) { pgd_val(pgd) &= ~_PAGE_NEEDSYNC; }
         |                                                ^
   arch/um/include/asm/pgtable-4level.h:84:31: error: unknown type name 'pud_t'
      84 | static inline void pud_clear (pud_t *pud)
         |                               ^
>> arch/um/include/asm/pgtable-4level.h:86:15: error: call to undeclared function '__pud'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |         set_pud(pud, __pud(_PAGE_NEEDSYNC));
         |                      ^
>> arch/um/include/asm/pgtable-4level.h:91:15: error: call to undeclared function '__pgd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |         set_p4d(p4d, __p4d(_PAGE_NEEDSYNC));
         |                      ^
   include/asm-generic/pgtable-nop4d.h:41:32: note: expanded from macro '__p4d'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                            ^
   In file included from mm/kasan/common.c:14:
   In file included from include/linux/kasan.h:37:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:25:
   arch/um/include/asm/pgtable-4level.h:100:37: error: unknown type name 'pte_t'
     100 | static inline unsigned long pte_pfn(pte_t pte)
         |                                     ^
>> arch/um/include/asm/pgtable-4level.h:102:9: error: call to undeclared function 'phys_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         return phys_to_pfn(pte_val(pte));
         |                ^
>> arch/um/include/asm/pgtable-4level.h:102:21: error: call to undeclared function 'pte_val'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         return phys_to_pfn(pte_val(pte));
         |                            ^
   arch/um/include/asm/pgtable-4level.h:105:15: error: unknown type name 'pte_t'
     105 | static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
         |               ^
   arch/um/include/asm/pgtable-4level.h:105:52: error: unknown type name 'pgprot_t'
     105 | static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
         |                                                    ^
>> arch/um/include/asm/pgtable-4level.h:107:2: error: use of undeclared identifier 'pte_t'
     107 |         pte_t pte;
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +225 arch/um/include/asm/pgtable.h

08964c565b2fe4 include/asm-um/pgtable.h      Jeff Dike     2005-09-03  221  
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  222  static inline void um_tlb_mark_sync(struct mm_struct *mm, unsigned long start,
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  223  				    unsigned long end)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  224  {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03 @225  	if (!mm->context.sync_tlb_range_to) {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  226  		mm->context.sync_tlb_range_from = start;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  227  		mm->context.sync_tlb_range_to = end;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  228  	} else {
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  229  		if (start < mm->context.sync_tlb_range_from)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  230  			mm->context.sync_tlb_range_from = start;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  231  		if (end > mm->context.sync_tlb_range_to)
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  232  			mm->context.sync_tlb_range_to = end;
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  233  	}
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  234  }
bcf3d957c63d8b arch/um/include/asm/pgtable.h Benjamin Berg 2024-07-03  235  

:::::: The code at line 225 was first introduced by commit
:::::: bcf3d957c63d8b6d718b862fea18c5f14ce803e2 um: refactor TLB update handling

:::::: TO: Benjamin Berg <benjamin.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
