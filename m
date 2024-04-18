Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0A11CB4;
	Thu, 18 Apr 2024 22:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713480252; cv=none; b=ZBAGMpmXUvn2AA8k+IwqofCE+OYf+4Kj/NFfOADujiB/q32c+XJNqjYv+bdgOKFgF6IwDaXI5ULtJo7L1wCnAp0Q6RB6OrtYwFca5OBlAGDo7P/dKvNtRFmTjEqprpw9B+McOt5vlqbBcIOLlKtQQj7VixrY1gWbPyJ8S/ulV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713480252; c=relaxed/simple;
	bh=I/Gn7fC4k8LNSMXDS/h0kuAXvfeDB6crjt9HLKODBLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIAvakuvx3NlZJ86AI8ANpl5XEalDBQzscVUYlOlx4WFMwNxnDcRai+dTVtbIdP+ycMYBRcQex7fatYeFKJHU1tDYmcp+8GF3jVUMtOCmxlV3tHuQIp8xrr1I6Fzb7ltCycn0/acnpBMXBRvcmBqFfZGhbSOb4ykywpnwYYcL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsY+/0Xn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsY+/0Xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713480250; x=1745016250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/Gn7fC4k8LNSMXDS/h0kuAXvfeDB6crjt9HLKODBLI=;
  b=ZsY+/0Xnf7HOsHr63AI0oEPM5G3dyO5Y+EvsPogeUX2YeI5xtHoSKGBM
   OQIkRlDsg1h73qwYgq08eBhFN5c6ejsikMcF6N6FOfqtE8nHvYTFbjIol
   CXooI+FK9M5NsO0R/sZRHezQHaAFYLAsuTmT43kF6ijTRV0EpDGr3rEqA
   5EtV91l+J9StJotR3JYBX0bN+PhIVaRwcEg39h6/LVgwnHX8fq7Zu5ao8
   TtE9QtFLaV+xnm/c3JZlLwv0IHBXOgvEHpnf5HxtRluLsN2DWjz9OBZ2O
   7yZsH9nwE8sPJr1XtH7eVba4u3I2cW8fRFM10OVc+ky2n3Agp9awELsMI
   Q==;
X-CSE-ConnectionGUID: 5w0J9d8aS/WT6KE1iIX1aw==
X-CSE-MsgGUID: qIKyTEGqQlWnrb0Yed+JtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19622857"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="19622857"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 15:44:09 -0700
X-CSE-ConnectionGUID: Xj0acnjmQDWOz0G+UeDR1Q==
X-CSE-MsgGUID: Zza/ZRrnRjGoyvgl24hIAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27595453"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2024 15:44:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxaU9-0009JI-2K;
	Thu, 18 Apr 2024 22:44:05 +0000
Date: Fri, 19 Apr 2024 06:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tdx-fixes 23/23]
 arch/x86/include/asm/pgtable.h:809:9: error: use of undeclared identifier
 'cc_mask'
Message-ID: <202404190603.lo3MpPfQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tdx-fixes
head:   64a348797e6c6e01ca7e759a23856fbf49cf8754
commit: 64a348797e6c6e01ca7e759a23856fbf49cf8754 [23/23] x86/tdx: Preserve shared bit on mprotect()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240419/202404190603.lo3MpPfQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190603.lo3MpPfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190603.lo3MpPfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
>> arch/x86/include/asm/pgtable.h:809:9: error: use of undeclared identifier 'cc_mask'
     809 |         val &= _PAGE_CHG_MASK;
         |                ^
   arch/x86/include/asm/pgtable_types.h:152:25: note: expanded from macro '_PAGE_CHG_MASK'
     152 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |                          ^
   arch/x86/include/asm/pgtable_types.h:151:21: note: expanded from macro '_COMMON_PAGE_CHG_MASK'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^
   arch/x86/include/asm/pgtable_types.h:176:34: note: expanded from macro '_PAGE_CC'
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   arch/x86/include/asm/pgtable.h:810:34: error: use of undeclared identifier 'cc_mask'
     810 |         val |= check_pgprot(newprot) & ~_PAGE_CHG_MASK;
         |                                         ^
   arch/x86/include/asm/pgtable_types.h:152:25: note: expanded from macro '_PAGE_CHG_MASK'
     152 | #define _PAGE_CHG_MASK  (_COMMON_PAGE_CHG_MASK | _PAGE_PAT)
         |                          ^
   arch/x86/include/asm/pgtable_types.h:151:21: note: expanded from macro '_COMMON_PAGE_CHG_MASK'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^
   arch/x86/include/asm/pgtable_types.h:176:34: note: expanded from macro '_PAGE_CC'
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   arch/x86/include/asm/pgtable.h:838:10: error: use of undeclared identifier 'cc_mask'
     838 |         val &= (_HPAGE_CHG_MASK & ~_PAGE_DIRTY);
         |                 ^
   arch/x86/include/asm/pgtable_types.h:153:26: note: expanded from macro '_HPAGE_CHG_MASK'
     153 | #define _HPAGE_CHG_MASK (_COMMON_PAGE_CHG_MASK | _PAGE_PSE | _PAGE_PAT_LARGE)
         |                          ^
   arch/x86/include/asm/pgtable_types.h:151:21: note: expanded from macro '_COMMON_PAGE_CHG_MASK'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^
   arch/x86/include/asm/pgtable_types.h:176:34: note: expanded from macro '_PAGE_CC'
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   arch/x86/include/asm/pgtable.h:839:34: error: use of undeclared identifier 'cc_mask'
     839 |         val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
         |                                         ^
   arch/x86/include/asm/pgtable_types.h:153:26: note: expanded from macro '_HPAGE_CHG_MASK'
     153 | #define _HPAGE_CHG_MASK (_COMMON_PAGE_CHG_MASK | _PAGE_PSE | _PAGE_PAT_LARGE)
         |                          ^
   arch/x86/include/asm/pgtable_types.h:151:21: note: expanded from macro '_COMMON_PAGE_CHG_MASK'
     151 |                                  _PAGE_DEVMAP | _PAGE_CC | _PAGE_UFFD_WP)
         |                                                 ^
   arch/x86/include/asm/pgtable_types.h:176:34: note: expanded from macro '_PAGE_CC'
     176 | #define _PAGE_CC                (_AT(pteval_t, cc_mask))
         |                                                ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
   arch/x86/include/asm/pgtable.h:869:51: error: use of undeclared identifier 'cc_mask'


vim +/cc_mask +809 arch/x86/include/asm/pgtable.h

6b28baca9b1f0d arch/x86/include/asm/pgtable.h Andi Kleen      2018-06-13  799  
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  800  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  801  {
6b28baca9b1f0d arch/x86/include/asm/pgtable.h Andi Kleen      2018-06-13  802  	pteval_t val = pte_val(pte), oldval = val;
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  803  	pte_t pte_result;
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  804  
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  805  	/*
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  806  	 * Chop off the NX bit (if present), and add the NX portion of
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  807  	 * the newprot (if present):
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  808  	 */
1c12c4cf9411eb include/asm-x86/pgtable.h      Venki Pallipadi 2008-05-14 @809  	val &= _PAGE_CHG_MASK;
fb43d6cb91ef57 arch/x86/include/asm/pgtable.h Dave Hansen     2018-04-06  810  	val |= check_pgprot(newprot) & ~_PAGE_CHG_MASK;
6b28baca9b1f0d arch/x86/include/asm/pgtable.h Andi Kleen      2018-06-13  811  	val = flip_protnone_guard(oldval, val, PTE_PFN_MASK);
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  812  
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  813  	pte_result = __pte(val);
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  814  
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  815  	/*
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  816  	 * To avoid creating Write=0,Dirty=1 PTEs, pte_modify() needs to avoid:
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  817  	 *  1. Marking Write=0 PTEs Dirty=1
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  818  	 *  2. Marking Dirty=1 PTEs Write=0
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  819  	 *
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  820  	 * The first case cannot happen because the _PAGE_CHG_MASK will filter
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  821  	 * out any Dirty bit passed in newprot. Handle the second case by
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  822  	 * going through the mksaveddirty exercise. Only do this if the old
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  823  	 * value was Write=1 to avoid doing this on Shadow Stack PTEs.
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  824  	 */
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  825  	if (oldval & _PAGE_RW)
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  826  		pte_result = pte_mksaveddirty(pte_result);
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  827  	else
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  828  		pte_result = pte_clear_saveddirty(pte_result);
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  829  
bb3aadf7d446aa arch/x86/include/asm/pgtable.h Rick Edgecombe  2023-06-12  830  	return pte_result;
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  831  }
38472311679d87 include/asm-x86/pgtable.h      Ingo Molnar     2008-01-30  832  

:::::: The code at line 809 was first introduced by commit
:::::: 1c12c4cf9411eb130b245fa8d0fbbaf989477c7b mprotect: prevent alteration of the PAT bits

:::::: TO: Venki Pallipadi <venkatesh.pallipadi@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
