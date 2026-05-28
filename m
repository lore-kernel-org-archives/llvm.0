Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA28343888;
	Thu, 28 May 2026 05:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945012; cv=none; b=ScgLBQ9F/KWrTT9HOd1/9v2IWMUdhQqD6LLvCXE7DCyUtifAQ54zYYxKXuqypl5K8yxXNWhCqIIf5Wu5GGmVPYR70u7UnBLn48kXErS5S4P8ikoPavosdCq8JLshmi8tdkfSWgCJ14mWIFQ74wj1xaetoWIgiKNDaQV2TVa4aKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945012; c=relaxed/simple;
	bh=5DUAh/8uR09Ok1Op5lMUw9+RWLG7FHcapCEvmRbjoig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cswfFKnxitPaAWICjye9cTtEPMU1YwyKoZiBshKhYNohhhSdVtH3ENOalRvsGHbaxwRt+NQhio1o01YXDijK1GIQs4aI3QlpwcjUz/hx0F6XtTTpOK5Ne2qRHqE7El+wF88gdelXlGVv4PQcqRrX25f9759G374mtWdL3QtYOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb80UQOx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb80UQOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779945010; x=1811481010;
  h=date:from:to:cc:subject:message-id;
  bh=5DUAh/8uR09Ok1Op5lMUw9+RWLG7FHcapCEvmRbjoig=;
  b=Hb80UQOxDvJHuRGRX9T1Pqg0kg1QiZXxacz2b0BO/e31qTx8MsUre9Jt
   eYr9u6EYVWdR3kDg9hvB+f1QHwNjitBj6JWVycSbxJR2Fxf3PRM9T2nWi
   RRGIefmUATQ0TrAnyM4jhG7CFTSTR0Sm/wK71E6OLQpyJZHLo1d78MnhT
   6K9d8i4yxXuVJBsf+uZ4VM+n0Kt3ZrnrYQEfZb/Aoby8WSqqkRdLabM6q
   SPP5rk0QQdxBorwEKdBWkhBNMSEonuRtFeFcZqbrt3k5+q0ts0bhpc97X
   RKgRAsSKMi+C1aEP96IiTD/YWEpMOv0Fez5uV70QXOdDL40STr6mdX4fN
   w==;
X-CSE-ConnectionGUID: RD3ZiE9qRBilXleOK8FY2A==
X-CSE-MsgGUID: Zep6BOtiQKiQGrubB8Ks8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106234737"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="106234737"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 22:10:10 -0700
X-CSE-ConnectionGUID: 4K6nKA5CT3SQAiul0mNV5w==
X-CSE-MsgGUID: 0ZwynyZjTzuVdwWVk55k5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="247395720"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 May 2026 22:10:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wST0P-000000000I9-2PMS;
	Thu, 28 May 2026 05:10:05 +0000
Date: Thu, 28 May 2026 07:09:58 +0200
From: kernel test robot <lkp@intel.com>
To: tao <tao.wangtao@honor.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/debug.c:260:14: warning: format specifies type 'void *'
 but the argument has type 'anon_vma_tree_t' (aka 'unsigned long')
Message-ID: <202605280750.e5zhc9OW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/tao/mm-rmap-introduce-anon_rmap-APIs-for-anonymous-folios/20260527-191029
head:   d6b84c27ac44f1ad64e0c96150f128acfc1be38e
commit: 21dbb148d564b75be29efcaaae4152e27a0a5f91 mm: switch to anon_vma_tree_t APIs in preparation for ANON_VMA_LAZY
date:   18 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260528/202605280750.e5zhc9OW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280750.e5zhc9OW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280750.e5zhc9OW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/debug.c:260:14: warning: format specifies type 'void *' but the argument has type 'anon_vma_tree_t' (aka 'unsigned long') [-Wformat]
     248 |                 "file %px anon_vma %px policy %px\n"
         |                                    ~~
         |                                    %lu
     249 |                 "uffd_ctx %px\n"
     250 |                 "anon_name %px\n"
     251 |                 "state %x\n"
     252 |                 "just_expand %d\n"
     253 |                 "__adjust_middle_start %d __adjust_next_start %d\n"
     254 |                 "__remove_middle %d __remove_next %d\n",
     255 |                 vmg, vmg->mm, vmg->pgoff,
     256 |                 vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
     257 |                 vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
     258 |                 vmg->prev, vmg->middle, vmg->next, vmg->target,
     259 |                 vmg->start, vmg->end, vmg->vm_flags,
     260 |                 vmg->file, vmg->anon_vma, vmg->policy,
         |                            ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +260 mm/debug.c

31c9afa6db122a5 Sasha Levin     2014-10-09  233  
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  234  void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  235  {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  236  	if (reason)
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  237  		pr_warn("vmg %px dumped because: %s\n", vmg, reason);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  238  
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  239  	if (!vmg) {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  240  		pr_warn("vmg %px state: (NULL)\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  241  		return;
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  242  	}
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  243  
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  244  	pr_warn("vmg %px state: mm %px pgoff %lx\n"
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  245  		"vmi %px [%lx,%lx)\n"
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  246  		"prev %px middle %px next %px target %px\n"
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  247  		"start %lx end %lx flags %lx\n"
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  248  		"file %px anon_vma %px policy %px\n"
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  249  		"uffd_ctx %px\n"
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  250  		"anon_name %px\n"
6ab2d9c7c680c0a Lorenzo Stoakes 2025-01-31  251  		"state %x\n"
fe3e9cf0d7a28d3 Lorenzo Stoakes 2025-01-31  252  		"just_expand %d\n"
fe3e9cf0d7a28d3 Lorenzo Stoakes 2025-01-31  253  		"__adjust_middle_start %d __adjust_next_start %d\n"
fe3e9cf0d7a28d3 Lorenzo Stoakes 2025-01-31  254  		"__remove_middle %d __remove_next %d\n",
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  255  		vmg, vmg->mm, vmg->pgoff,
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  256  		vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  257  		vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  258  		vmg->prev, vmg->middle, vmg->next, vmg->target,
bfbe71109fa40e8 Lorenzo Stoakes 2025-06-18  259  		vmg->start, vmg->end, vmg->vm_flags,
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03 @260  		vmg->file, vmg->anon_vma, vmg->policy,
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  261  #ifdef CONFIG_USERFAULTFD
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  262  		vmg->uffd_ctx.ctx,
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  263  #else
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  264  		(void *)0,
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  265  #endif
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  266  		vmg->anon_name,
6ab2d9c7c680c0a Lorenzo Stoakes 2025-01-31  267  		(int)vmg->state,
fe3e9cf0d7a28d3 Lorenzo Stoakes 2025-01-31  268  		vmg->just_expand,
fe3e9cf0d7a28d3 Lorenzo Stoakes 2025-01-31  269  		vmg->__adjust_middle_start, vmg->__adjust_next_start,
fe3e9cf0d7a28d3 Lorenzo Stoakes 2025-01-31  270  		vmg->__remove_middle, vmg->__remove_next);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  271  
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  272  	if (vmg->mm) {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  273  		pr_warn("vmg %px mm:\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  274  		dump_mm(vmg->mm);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  275  	} else {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  276  		pr_warn("vmg %px mm: (NULL)\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  277  	}
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  278  
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  279  	if (vmg->prev) {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  280  		pr_warn("vmg %px prev:\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  281  		dump_vma(vmg->prev);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  282  	} else {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  283  		pr_warn("vmg %px prev: (NULL)\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  284  	}
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  285  
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  286  	if (vmg->middle) {
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  287  		pr_warn("vmg %px middle:\n", vmg);
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  288  		dump_vma(vmg->middle);
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  289  	} else {
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  290  		pr_warn("vmg %px middle: (NULL)\n", vmg);
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  291  	}
3a75ccba047b11a Lorenzo Stoakes 2025-01-31  292  
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  293  	if (vmg->next) {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  294  		pr_warn("vmg %px next:\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  295  		dump_vma(vmg->next);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  296  	} else {
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  297  		pr_warn("vmg %px next: (NULL)\n", vmg);
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  298  	}
b0d66d82fce6016 Lorenzo Stoakes 2025-01-03  299  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
