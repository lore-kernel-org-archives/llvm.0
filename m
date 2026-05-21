Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7D344044;
	Thu, 21 May 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379077; cv=none; b=NQF2mJ39OQ71PzDdaBNcG/MF4osRBk9b8ND/SR9DZpYHaEjqR2i2Ap4dMKjVyNBwIxfRHcctgDGP+L5SJ6w2+t+yjE19ezkYQMQ6d5p7/I3FVVSxAWHku1IdScpA0DjON+YZYpkhk7xBSs2dxvejDv1XdojpVSdLY4CEnXMqv5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379077; c=relaxed/simple;
	bh=muNcK3GoaRe3SzgbidU2qQPIT1qEYK3lvjp7SyXTFnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZTCeXNG8JmZ5ORTcrpwN/Wj5Ifnzlcx6bJrq24wxv/BvyVCWSTOKvvxMBMcr//8D6kmBycwMY2eEEqw39bC8VCqIbWXoPWHzaOy3lZOqzPN3OOZfFmg9DwGFUuuDnx/lefvXnA5WCv8uATzDlww0HpFjGBNJBA+Cytodr7hro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+IDUptC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+IDUptC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779379075; x=1810915075;
  h=date:from:to:cc:subject:message-id;
  bh=muNcK3GoaRe3SzgbidU2qQPIT1qEYK3lvjp7SyXTFnI=;
  b=I+IDUptCrgFZ1tHBQcIHwNQ44Tya2NK35/FbQysLuKVxfzbEdJkkEEb4
   gCOfelbTDgOsPViAWQtT2MbqyU5D6F0rrMdw5K2dvS82YX8lsPDeOAU63
   BxIX2P80Hbyqi/eLTbVZEvCGAW0hGZP+4BhtOgbGw7r2BlawvyMLwGjAn
   EUctu+v/sD2OJFQTNXM172213sHB96eWbPnySq55ZxPxr8Reaky5Uq2i5
   uYm5x5eJ3jr5MYzd+Valxqw8rGUVnkMsljaEMslytKIMIdGMuYVh9JnIz
   B0a8ZBrjZj3XclXoaAqH8j+dEUOsvR/4htij01STLTs1sO/S0YRiaic1s
   g==;
X-CSE-ConnectionGUID: ezx20ltPSr6Hs0k+tXenBw==
X-CSE-MsgGUID: zYmFFpfzTOGYJVAE0AFLWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="105762064"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="105762064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:57:55 -0700
X-CSE-ConnectionGUID: bORzRU83RratY6Ezy8jZkw==
X-CSE-MsgGUID: kOBbVmfaSXqDtvnPF7Fbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="236315740"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 08:57:53 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ5mR-000000000jb-1F5M;
	Thu, 21 May 2026 15:57:51 +0000
Date: Thu, 21 May 2026 23:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 524/1130]
 mm/vma.c:2982:11: error: use of undeclared identifier 'ERESERVATION'
Message-ID: <202605212349.VjWqdKUF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 134d750606527b5b0550a144e1d8012dc7ea0020 [524/1130] [CHERRY-PICK] fs/exec: Create a stack reservation in PCuABI
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605212349.VjWqdKUF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212349.VjWqdKUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212349.VjWqdKUF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vma.c:7:
   In file included from mm/vma_internal.h:37:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:28:
   In file included from include/linux/bpfptr.h:6:
   include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
>> mm/vma.c:2982:11: error: use of undeclared identifier 'ERESERVATION'
    2982 |                 return -ERESERVATION;
         |                         ^~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/ERESERVATION +2982 mm/vma.c

  2961	
  2962	/*
  2963	 * Verify that the stack growth is acceptable and
  2964	 * update accounting. This is shared with both the
  2965	 * grow-up and grow-down cases.
  2966	 */
  2967	static int acct_stack_growth(struct vm_area_struct *vma,
  2968				     unsigned long size, unsigned long grow)
  2969	{
  2970		struct mm_struct *mm = vma->vm_mm;
  2971		unsigned long new_start;
  2972	
  2973		/* address space limit tests */
  2974		if (!may_expand_vm(mm, vma->vm_flags, grow))
  2975			return -ENOMEM;
  2976	
  2977		/* Stack limit test */
  2978		if (size > rlimit(RLIMIT_STACK))
  2979			return -ENOMEM;
  2980	
  2981		if (reserv_is_supported(mm) && size > reserv_vma_reserv_len(vma))
> 2982			return -ERESERVATION;
  2983	
  2984		/* mlock limit tests */
  2985		if (!mlock_future_ok(mm, vma->vm_flags, grow << PAGE_SHIFT))
  2986			return -ENOMEM;
  2987	
  2988		/* Check to ensure the stack will not grow into a hugetlb-only region */
  2989		new_start = (vma->vm_flags & VM_GROWSUP) ? vma->vm_start :
  2990				vma->vm_end - size;
  2991		if (is_hugepage_only_range(vma->vm_mm, new_start, size))
  2992			return -EFAULT;
  2993	
  2994		/*
  2995		 * Overcommit..  This must be the final test, as it will
  2996		 * update security statistics.
  2997		 */
  2998		if (security_vm_enough_memory_mm(mm, grow))
  2999			return -ENOMEM;
  3000	
  3001		return 0;
  3002	}
  3003	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
