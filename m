Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B53F54DA;
	Thu, 21 May 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370833; cv=none; b=MEkBr0QECu/NODOs/iZPBSgDOjaFJRpPPc8wQiYiKPH6CbUTXpdjHyRh2a15puyySJ0mizC53SGDJbYl+xj4oPhWf9seYP5swjcj8HBbw4WYVYjKsposkGh47i7mR6pF/ZwzQjWOC4fPz60+3c0tBw6qbKkKywLcHlhCCuVyRok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370833; c=relaxed/simple;
	bh=sgLyNFRARVWSEHSacqBFelUbiQxjUGeL003xQ75ue/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZxoERAuyAjQ50f53nAe2Uu7Ke0HJEqEUDT2Ixout0hsjbNTxsw4GVOVrfddB1HdROkNj1DG5rZk0Mlbm5HuDWFjElrXgn5zvHZIteZwswgir4WW/XW/41+pE+RyDC/MIksYCOLxmBlV9E77FJKIZNZ7XHNoO3OCgSuYKEii7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kc3MUtKq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kc3MUtKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779370831; x=1810906831;
  h=date:from:to:cc:subject:message-id;
  bh=sgLyNFRARVWSEHSacqBFelUbiQxjUGeL003xQ75ue/8=;
  b=Kc3MUtKqffJI/6DBfx1CA7VN/NbOBA2N7UAk41TDYTAZ9AZy3egevl8g
   pBZF6vS+S5q1zc8ucbzRD63tPDDC2GYbSdB/gCG5+xzRkFIUiOIrkM/eR
   s0JrFB2B1CvO7TM3BIxkXyywJTD4ry8Smj+zqOIjzsTZqlWO/OAhHFRsJ
   BDM6Q3u0Z+0CmS927+a0TEsm0Paat6GVy/e2+uW4cmoMNg7vPV7Ln3BPj
   Cc+UNudv8oK32J0Yn/TY6SPO1mYyGrJenywCyOU/nukudzu2IFSY2OLLC
   d4Y3b/rxHIBM9k4nZuCFphCMkA558TmRjKtpuoZWJ0FykHiVsYRqMn/p1
   Q==;
X-CSE-ConnectionGUID: 505tdFPeREK8XmBj7RNvZw==
X-CSE-MsgGUID: 3++XsonOQwSrsbNZnXXrDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80321682"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80321682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:40:30 -0700
X-CSE-ConnectionGUID: aJCc9cWgRJyI85uCWDR4+w==
X-CSE-MsgGUID: Ai9LKH08QMeq4HNNSHll9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239517097"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2026 06:40:28 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ3dS-000000000MZ-0FLh;
	Thu, 21 May 2026 13:40:26 +0000
Date: Thu, 21 May 2026 21:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 521/1130]
 mm/mmap.c:730:12: error: use of undeclared identifier 'ERESERVATION'
Message-ID: <202605212157.rTbHHJit-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: af9bff1748c242e5113c456afe8e54fe3e9bebe8 [521/1130] [CHERRY-PICK] mm/mmap: Handle reservations in get_unmapped_area
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605212157.rTbHHJit-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212157.rTbHHJit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212157.rTbHHJit-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mmap.c:21:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
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
>> mm/mmap.c:730:12: error: use of undeclared identifier 'ERESERVATION'
     730 |                         return -ERESERVATION;
         |                                 ^~~~~~~~~~~~
   mm/mmap.c:799:12: error: use of undeclared identifier 'ERESERVATION'
     799 |                         return -ERESERVATION;
         |                                 ^~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/ERESERVATION +730 mm/mmap.c

   681	
   682	/* Get an address range which is currently unmapped.
   683	 * For shmat() with addr=0.
   684	 *
   685	 * Ugly calling convention alert:
   686	 * Return value with the low bits set means error value,
   687	 * ie
   688	 *	if (ret & ~PAGE_MASK)
   689	 *		error = ret;
   690	 *
   691	 * This function "knows" that -ENOMEM has the bits set.
   692	 */
   693	unsigned long
   694	generic_get_unmapped_area(struct file *filp, unsigned long addr,
   695				  unsigned long len, unsigned long pgoff,
   696				  unsigned long flags, vm_flags_t vm_flags)
   697	{
   698		struct mm_struct *mm = current->mm;
   699		struct vm_area_struct *vma, *prev;
   700		struct vm_unmapped_area_info info = {};
   701		const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
   702		unsigned long aligned_len = reserv_representable_length(len);
   703	
   704		if (aligned_len > mmap_end - mmap_min_addr)
   705			return -ENOMEM;
   706	
   707		/*
   708		 * If MAP_FIXED is passed in the reservation case, the aligned range
   709		 * should be either completely contained inside an existing
   710		 * reservation, or completely outside (new reservation).
   711		 * Let this scenario fallthrough for the corresponding checks below.
   712		 */
   713		if ((flags & MAP_FIXED) && !reserv_is_supported(mm))
   714			return addr;
   715	
   716		if (addr || (flags & MAP_FIXED)) {
   717			unsigned long aligned_addr;
   718	
   719			addr = PAGE_ALIGN(addr);
   720			aligned_addr = reserv_representable_base(addr, len);
   721			vma = find_vma_prev(mm, aligned_addr, &prev);
   722			if (mmap_end - aligned_len >= aligned_addr && aligned_addr >= mmap_min_addr &&
   723			    (!vma || aligned_addr + aligned_len <= vm_start_gap(vma)) &&
   724			    (!prev || aligned_addr >= vm_end_gap(prev)))
   725				return addr;
   726			else if (flags & MAP_FIXED) {
   727				if ((vma && reserv_vma_range_within_reserv(vma, aligned_addr, aligned_len)) ||
   728				    (prev && reserv_vma_range_within_reserv(prev, aligned_addr, aligned_len)))
   729					return addr;
 > 730				return -ERESERVATION;
   731			}
   732		}
   733	
   734		info.length = len;
   735		info.low_limit = mm->mmap_base;
   736		info.high_limit = mmap_end;
   737		info.start_gap = stack_guard_placement(vm_flags);
   738		info.align_mask |= reserv_representable_alignment(len);
   739		if (filp && is_file_hugepages(filp))
   740			info.align_mask |= huge_page_mask_align(filp);
   741		return vm_unmapped_area(&info);
   742	}
   743	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
