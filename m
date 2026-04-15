Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DBB2EA47C;
	Wed, 15 Apr 2026 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263175; cv=none; b=JBW5FdfT4BkuxGqikKWnFO8wL8JPc0MJFs6cTk/BbIJJ77ShG2qvzssnF2qkT73yWWBw7sbfZyVy6VsX0JdAaraAqggw8PqYbsnhXa22k3EV+WGBSN8loLH7LlN9llqSiy7MfrN7tEbp55u7sRZcptBcqyaNZJSEfC/+YrMrkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263175; c=relaxed/simple;
	bh=kRf2ABgE+sOYcbHDWRxDYjLAFIf6M6ho+AfDIE0ItAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HVQUPwdhXULLYViqFTPlvfvETBfhWjYQf++RAg1EBZHNS7c+yFoYu9no4/AYpD0PYOfyYHI6oXhjIWF4LoFFfFypU4UKQV/Mjf8+TIWmfIUubdYNzwGrx9xQM6J4AKUcUCCApym4f/kjAYZwD3qTJe6awMZDrqj+nr/19KQUeU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ60dojD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ60dojD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776263173; x=1807799173;
  h=date:from:to:cc:subject:message-id;
  bh=kRf2ABgE+sOYcbHDWRxDYjLAFIf6M6ho+AfDIE0ItAk=;
  b=dJ60dojDzDVgyXuduhzK6WwqlT3AfnSCgJWSX5gjRw0o2NadTHPzzj1q
   rHQkVzXYYGpzNDGjgpwX028SGGUZklpjV5PlzWs/5W/ijGjB1qNRBz/u0
   Ru7svfW+uHxfjoiW9vjia4PLApCBF6XEVNEFSRdqmoRE8u/gQyUUc3eIB
   FQE8B8b+p/IhPeX6KDnmIRVbnNTnNeMCAVE6Ocf5lDGVo+RzvajQX4yXL
   oRmE4ZxEdRqm9hIWHZZ5+CD2GchK33LBQcHHhp0wJmVadjc1FjtpTT3u5
   7Zt7cdQqCPzWbYkSG02LBzIwUkzRANqbrrSkZ7lHkj7qev0uP9ro3GI8v
   g==;
X-CSE-ConnectionGUID: ecL3+0o5RkCeMgNUWlg5aA==
X-CSE-MsgGUID: 1z8DAR/GRi+DEn2Eu+vshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77423469"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77423469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 07:26:12 -0700
X-CSE-ConnectionGUID: pq74/ELGQvSbd+yr8oTjCw==
X-CSE-MsgGUID: eCceuC96R5azcW8KqezyRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234466934"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 07:26:11 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD1Bw-000000000Zf-3A9Q;
	Wed, 15 Apr 2026 14:26:08 +0000
Date: Wed, 15 Apr 2026 22:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd 4/12] mm/userfaultfd.c:427:10: error: call to
 undeclared function 'pmd_modify'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202604152204.YW3R3qP0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd
head:   bfa1e12c7a014c9ce5d1ae4b8b43dcb8e3d62965
commit: 83ce0c5a2d4e93266638ef2f1d2b58166bae1e8d [4/12] userfaultfd: UFFDIO_CONTINUE for anonymous memory
config: powerpc-randconfig-001-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152204.YW3R3qP0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152204.YW3R3qP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152204.YW3R3qP0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/userfaultfd.c:427:10: error: call to undeclared function 'pmd_modify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     427 |         entry = pmd_modify(orig_pmd, vma->vm_page_prot);
         |                 ^
   mm/userfaultfd.c:427:10: note: did you mean 'pte_modify'?
   arch/powerpc/include/asm/nohash/pgtable.h:295:21: note: 'pte_modify' declared here
     295 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                     ^
>> mm/userfaultfd.c:427:8: error: assigning to 'pmd_t' from incompatible type 'int'
     427 |         entry = pmd_modify(orig_pmd, vma->vm_page_prot);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/userfaultfd.c:428:10: error: call to undeclared function 'pmd_mkyoung'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     428 |         entry = pmd_mkyoung(entry);
         |                 ^
   mm/userfaultfd.c:428:8: error: assigning to 'pmd_t' from incompatible type 'int'
     428 |         entry = pmd_mkyoung(entry);
         |               ^ ~~~~~~~~~~~~~~~~~~
>> mm/userfaultfd.c:430:11: error: call to undeclared function 'pmd_wrprotect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |                 entry = pmd_wrprotect(entry);
         |                         ^
   mm/userfaultfd.c:430:11: note: did you mean 'pte_wrprotect'?
   arch/powerpc/include/asm/nohash/32/pte-8xx.h:87:21: note: 'pte_wrprotect' declared here
      87 | static inline pte_t pte_wrprotect(pte_t pte)
         |                     ^
   mm/userfaultfd.c:430:9: error: assigning to 'pmd_t' from incompatible type 'int'
     430 |                 entry = pmd_wrprotect(entry);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~
>> mm/userfaultfd.c:431:2: error: call to undeclared function 'set_pmd_at'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     431 |         set_pmd_at(mm, addr & HPAGE_PMD_MASK, pmd, entry);
         |         ^
>> mm/userfaultfd.c:432:2: error: call to undeclared function 'update_mmu_cache_pmd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     432 |         update_mmu_cache_pmd(vma, addr, pmd);
         |         ^
   mm/userfaultfd.c:432:2: note: did you mean 'update_mmu_cache_range'?
   arch/powerpc/include/asm/pgtable.h:136:20: note: 'update_mmu_cache_range' declared here
     136 | static inline void update_mmu_cache_range(struct vm_fault *vmf,
         |                    ^
   8 errors generated.


vim +/pmd_modify +427 mm/userfaultfd.c

   411	
   412	static int mfill_atomic_pmd_continue_anon(struct mm_struct *mm,
   413						  struct vm_area_struct *vma,
   414						  unsigned long addr,
   415						  pmd_t *pmd, pmd_t orig_pmd,
   416						  uffd_flags_t flags)
   417	{
   418		spinlock_t *ptl;
   419		pmd_t entry;
   420	
   421		ptl = pmd_lock(mm, pmd);
   422		if (unlikely(!pmd_same(pmdp_get(pmd), orig_pmd))) {
   423			spin_unlock(ptl);
   424			return -EAGAIN;
   425		}
   426	
 > 427		entry = pmd_modify(orig_pmd, vma->vm_page_prot);
 > 428		entry = pmd_mkyoung(entry);
   429		if (flags & MFILL_ATOMIC_WP)
 > 430			entry = pmd_wrprotect(entry);
 > 431		set_pmd_at(mm, addr & HPAGE_PMD_MASK, pmd, entry);
 > 432		update_mmu_cache_pmd(vma, addr, pmd);
   433		spin_unlock(ptl);
   434		return 0;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
