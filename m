Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E72AC17;
	Mon,  7 Jul 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751919327; cv=none; b=HYYciEFbhV4XYuvAnHdiTBiMtT3B7ejVeFL8hy+cFwLLQhKEosFPkzWEANdV2ScDtq06itRa+K/74SItRNduHRZNwaCxFItFyCr2+L16Htsw9lR2wgG8uw0v9E8YP0ASbGkb6zzMIL/bjxEodfVJ6hmhw5sCRhvYRcyKowL9PTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751919327; c=relaxed/simple;
	bh=brub50EoCa4pod8cvgnUIi3aRUqEyadA1T22tDh2jVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nK80L9RgIKoXxwncj7DtVINJ/nOOX4kPcbbPZxtsBMrEgSaSALA2xjGz2hxPd4FzOux3MGeuy7brkHA+4iDkyPrueX2/AjMWXHRcAiEjExYU9I3J+0nS1Al8zEYq52pONfyeHCEWFnrxyLwQX8erOcH07XsXTxa03VaMopbKuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cF84SFfr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF84SFfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751919326; x=1783455326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brub50EoCa4pod8cvgnUIi3aRUqEyadA1T22tDh2jVU=;
  b=cF84SFfrwifIC0d1aKo2wv2q/ARMYruuyz9uOtRy410R5u8MT5rTB5Sc
   BVLTyl4538K6hCJWjFK8GX2HXPLkH7Ns3AUo0ESFOKdC69p8/yJ64+7yJ
   wIvB5YhwA2d2YU8YXF98plQqH3AXbSAAV+VvWf73+N3WhwoOTMME27grl
   2Jwl2lLnvH2R/VLi9b/wZR2Jr326dszc8Af4UxqQvN6oyXccq7/648a/l
   0QC6LHKp1HtTQyw/i4z0AzfJShG6wumIIqy4ID+Z9zenV8LscCo0HqHFT
   +BhnMhjWgu/yXlyyvksHuZCAjP8kAQWVCGVdomcmrIQXqzsuf22VnUeZy
   A==;
X-CSE-ConnectionGUID: 530PHZ7FS06wRd1J4gmFpg==
X-CSE-MsgGUID: XsgWZfAFT6+gfVh4WefwaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65500542"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="65500542"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 13:15:25 -0700
X-CSE-ConnectionGUID: vznc7ddRSuSJHnPCUCWOCw==
X-CSE-MsgGUID: pvuUvX9+S0qli9eXmFVEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="159849097"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Jul 2025 13:15:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYsFF-0000iF-2n;
	Mon, 07 Jul 2025 20:15:21 +0000
Date: Tue, 8 Jul 2025 04:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:futex_percpu_ref 2/3] kernel/fork.c:1063:2: error:
 statement requires expression of scalar type ('void' invalid)
Message-ID: <202507080405.TViOt083-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_percpu_ref
head:   68087bce4b1dfad7de82a55bcc27fec3a19df65e
commit: ebfd80a39c4e2258942c2949863b316607d4700a [2/3] futex: Use RCU-based per-CPU reference counting instead of rcuref_t
config: x86_64-buildonly-randconfig-003-20250708 (https://download.01.org/0day-ci/archive/20250708/202507080405.TViOt083-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080405.TViOt083-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080405.TViOt083-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:1063:2: error: statement requires expression of scalar type ('void' invalid)
    1063 |         if (futex_mm_init(mm))
         |         ^   ~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1063 kernel/fork.c

  1024	
  1025	static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
  1026		struct user_namespace *user_ns)
  1027	{
  1028		mt_init_flags(&mm->mm_mt, MM_MT_FLAGS);
  1029		mt_set_external_lock(&mm->mm_mt, &mm->mmap_lock);
  1030		atomic_set(&mm->mm_users, 1);
  1031		atomic_set(&mm->mm_count, 1);
  1032		seqcount_init(&mm->write_protect_seq);
  1033		mmap_init_lock(mm);
  1034		INIT_LIST_HEAD(&mm->mmlist);
  1035		mm_pgtables_bytes_init(mm);
  1036		mm->map_count = 0;
  1037		mm->locked_vm = 0;
  1038		atomic64_set(&mm->pinned_vm, 0);
  1039		memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
  1040		spin_lock_init(&mm->page_table_lock);
  1041		spin_lock_init(&mm->arg_lock);
  1042		mm_init_cpumask(mm);
  1043		mm_init_aio(mm);
  1044		mm_init_owner(mm, p);
  1045		mm_pasid_init(mm);
  1046		RCU_INIT_POINTER(mm->exe_file, NULL);
  1047		mmu_notifier_subscriptions_init(mm);
  1048		init_tlb_flush_pending(mm);
  1049	#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
  1050		mm->pmd_huge_pte = NULL;
  1051	#endif
  1052		mm_init_uprobes_state(mm);
  1053		hugetlb_count_init(mm);
  1054	
  1055		if (current->mm) {
  1056			mm->flags = mmf_init_flags(current->mm->flags);
  1057			mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
  1058		} else {
  1059			mm->flags = default_dump_filter;
  1060			mm->def_flags = 0;
  1061		}
  1062	
> 1063		if (futex_mm_init(mm))
  1064			goto fail_mm_init;
  1065	
  1066		if (mm_alloc_pgd(mm))
  1067			goto fail_nopgd;
  1068	
  1069		if (mm_alloc_id(mm))
  1070			goto fail_noid;
  1071	
  1072		if (init_new_context(p, mm))
  1073			goto fail_nocontext;
  1074	
  1075		if (mm_alloc_cid(mm, p))
  1076			goto fail_cid;
  1077	
  1078		if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
  1079					     NR_MM_COUNTERS))
  1080			goto fail_pcpu;
  1081	
  1082		mm->user_ns = get_user_ns(user_ns);
  1083		lru_gen_init_mm(mm);
  1084		return mm;
  1085	
  1086	fail_pcpu:
  1087		mm_destroy_cid(mm);
  1088	fail_cid:
  1089		destroy_context(mm);
  1090	fail_nocontext:
  1091		mm_free_id(mm);
  1092	fail_noid:
  1093		mm_free_pgd(mm);
  1094	fail_nopgd:
  1095		futex_hash_free(mm);
  1096	fail_mm_init:
  1097		free_mm(mm);
  1098		return NULL;
  1099	}
  1100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
