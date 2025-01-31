Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B4158875;
	Fri, 31 Jan 2025 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317290; cv=none; b=CHxqwUALneItZnLO7+jEYBlVsRqzjt1Uonhp3c586zbzmX4FgpqmQyjAxxPaxXlA8JaqSMP08JLhyUX+/rs6WjE8LfVQhdNW2oQdaNFeu4YRChsC8PGLl90B/pMgJ1ZnriVsExc/87x0IWjcZCuhW9M2skdHruKZZ6m/HBDjeXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317290; c=relaxed/simple;
	bh=ZO3U4FjatEQbmMiZB7cITOMgXIpFvCAGyxbjuaZ11LY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqLMXBXuPb7qkTlszywlvLN6o12ZXVdN7BF7T3bo4cG4TwWUDxdfulblnvUsQgi6gPPmrlCMo+inKY4MLE58N/2LDJTwwz/GoRBxdSTD4fhqcIx2VN5Y/I/fD96ELefy6avneaIrjcKH/EckmDGKilNGTKc8bQtGQ+I9SmsNfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsZeoozL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsZeoozL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738317288; x=1769853288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZO3U4FjatEQbmMiZB7cITOMgXIpFvCAGyxbjuaZ11LY=;
  b=KsZeoozLkMWN72pKk5Vef0e5cFf/8QJZySfAq6DRUnAmOKUSKbIOnSCj
   XC4X/jFvFPBbiAv55Xo0F/B96Lvr6Ryjaa1TrNWFbBtRVoRUOsqszbuoS
   Y1kxQuhraVXX5hXWgYV79xVLG2jollXyLRtU3SDjLG4r6IYFNfOw6wIso
   F425/JPRggh1IDSe1q/Qq2YSqGRVBD2VnHaE5p9vZD/hde182QEyqJwdM
   pNqx+TkvVpFdq/92SPv2n+7iUjnLyPBXfsiQu785DN92zcOm+mdWjnNbv
   rePPEwwV8ESyDveBp7xm3ysdM0JHy3fdRSlmw6PYrntY2SD23WWPoJzFQ
   Q==;
X-CSE-ConnectionGUID: sSDcubE0QEyhmlXPzgsvQA==
X-CSE-MsgGUID: tiRMJnIXRWuledqsni8/NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="41717813"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="41717813"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:54:48 -0800
X-CSE-ConnectionGUID: XZlupioBQViIJEfTwOW96Q==
X-CSE-MsgGUID: aux74vn1QCaSm1iOLJlLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="110161579"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2025 01:54:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdnjY-000mEx-0D;
	Fri, 31 Jan 2025 09:54:44 +0000
Date: Fri, 31 Jan 2025 17:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [akpm-mm:mm-unstable 106/111] mm/debug.c:270:17: warning: invalid
 conversion specifier 'b'
Message-ID: <202501311720.ZJWcwKLY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f5604ad70091eabe663ea7106ced99449d653320
commit: 951452b2ec82d352a69f14cfffdeb7c08461eefb [106/111] mm: further refactor commit_merge()
config: arm-randconfig-002-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311720.ZJWcwKLY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311720.ZJWcwKLY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311720.ZJWcwKLY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/debug.c:270:17: warning: invalid conversion specifier 'b' [-Wformat-invalid-specifier]
                   "just_expand %b __remove_middle %b __remove_next %b\n",
                                ~^
   include/linux/printk.h:554:29: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ^~~
   include/linux/printk.h:391:21: note: expanded from macro 'pr_fmt'
   #define pr_fmt(fmt) fmt
                       ^~~
   include/linux/printk.h:501:53: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ^~~
   include/linux/printk.h:473:11: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ^~~~
   mm/debug.c:270:36: warning: invalid conversion specifier 'b' [-Wformat-invalid-specifier]
                   "just_expand %b __remove_middle %b __remove_next %b\n",
                                                   ~^
   include/linux/printk.h:554:29: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ^~~
   include/linux/printk.h:391:21: note: expanded from macro 'pr_fmt'
   #define pr_fmt(fmt) fmt
                       ^~~
   include/linux/printk.h:501:53: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ^~~
   include/linux/printk.h:473:11: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ^~~~
   mm/debug.c:270:53: warning: invalid conversion specifier 'b' [-Wformat-invalid-specifier]
                   "just_expand %b __remove_middle %b __remove_next %b\n",
                                                                    ~^
   include/linux/printk.h:554:29: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ^~~
   include/linux/printk.h:391:21: note: expanded from macro 'pr_fmt'
   #define pr_fmt(fmt) fmt
                       ^~~
   include/linux/printk.h:501:53: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ^~~
   include/linux/printk.h:473:11: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ^~~~
>> mm/debug.c:284:3: warning: data argument not used by format string [-Wformat-extra-args]
                   vmg->just_expand, vmg->__remove_middle, vmg->__remove_next);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^
   4 warnings generated.


vim +/b +270 mm/debug.c

   251	
   252	void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
   253	{
   254		if (reason)
   255			pr_warn("vmg %px dumped because: %s\n", vmg, reason);
   256	
   257		if (!vmg) {
   258			pr_warn("vmg %px state: (NULL)\n", vmg);
   259			return;
   260		}
   261	
   262		pr_warn("vmg %px state: mm %px pgoff %lx\n"
   263			"vmi %px [%lx,%lx)\n"
   264			"prev %px middle %px next %px target %px\n"
   265			"start %lx end %lx flags %lx\n"
   266			"file %px anon_vma %px policy %px\n"
   267			"uffd_ctx %px\n"
   268			"anon_name %px\n"
   269			"state %x\n"
 > 270			"just_expand %b __remove_middle %b __remove_next %b\n",
   271			vmg, vmg->mm, vmg->pgoff,
   272			vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
   273			vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
   274			vmg->prev, vmg->middle, vmg->next, vmg->target,
   275			vmg->start, vmg->end, vmg->flags,
   276			vmg->file, vmg->anon_vma, vmg->policy,
   277	#ifdef CONFIG_USERFAULTFD
   278			vmg->uffd_ctx.ctx,
   279	#else
   280			(void *)0,
   281	#endif
   282			vmg->anon_name,
   283			(int)vmg->state,
 > 284			vmg->just_expand, vmg->__remove_middle, vmg->__remove_next);
   285	
   286		if (vmg->mm) {
   287			pr_warn("vmg %px mm:\n", vmg);
   288			dump_mm(vmg->mm);
   289		} else {
   290			pr_warn("vmg %px mm: (NULL)\n", vmg);
   291		}
   292	
   293		if (vmg->prev) {
   294			pr_warn("vmg %px prev:\n", vmg);
   295			dump_vma(vmg->prev);
   296		} else {
   297			pr_warn("vmg %px prev: (NULL)\n", vmg);
   298		}
   299	
   300		if (vmg->middle) {
   301			pr_warn("vmg %px middle:\n", vmg);
   302			dump_vma(vmg->middle);
   303		} else {
   304			pr_warn("vmg %px middle: (NULL)\n", vmg);
   305		}
   306	
   307		if (vmg->next) {
   308			pr_warn("vmg %px next:\n", vmg);
   309			dump_vma(vmg->next);
   310		} else {
   311			pr_warn("vmg %px next: (NULL)\n", vmg);
   312		}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
