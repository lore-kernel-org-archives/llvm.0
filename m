Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14088168C4;
	Sat, 15 Jun 2024 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718473355; cv=none; b=GiI5OtVItuw/YBpgKMkkHOBGkN0lUlKtU+GEefmIme2bsa7mcN9wIykzm7SOE8xbVWGVdZ5lyE56uJL2tlpusJqPRDYGePW4vl9Ylx8H0kyGUxU7HNs0nk4yrOMGBSpqN924vSmh8tJQSO7JYgAXrpIFrWExR3KYW3t+1iSTikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718473355; c=relaxed/simple;
	bh=/SM+DixMmulK6F9J4gE3b3vsMiMD14xnvEEMwv1L34k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8ExEm6F+6+KEpRaP/X5YMAumsZWUnXLsZqExZ1GH4Sovsh1SFcnEBt9xIvP4kyHo0CbQ4mjkCQmNY2jJ2KOJ+yPKkdyI8gIY0AZ/PPoUOxFlqTBEDjxM65B0w6TvxRU9PtACqkwb8y4n+40gxwgmCiDwET2DSn3DKzfWO6EsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFpmvyBJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFpmvyBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718473353; x=1750009353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/SM+DixMmulK6F9J4gE3b3vsMiMD14xnvEEMwv1L34k=;
  b=UFpmvyBJNnWtFmUS1+5VSoQtewERVWdnP+psojhTDLh3q/XosaC2OQ2a
   icdzw5VSezf3vG9UCXBW3JSbcnuldEyHUjxF7oM6Wq+HnIzqxJ7IIsXhB
   O1+GhLtkLQgJoLha65H1EdOEjcOg+Yt3Yi/yg4189iLguodvxkSU6pizS
   rdIzTobAY49Detdg4+Zvas2uhnQc13m1sgWAuBI3qkNNfsjtY+YjlvRCF
   AxZHP7+alizGRnWIs82OZ2zhBfMMqSc5ytRsGUz0jLIXELCJH/lM0pOkn
   XoCRpfiI25LSj5fwlxFJi5Wo2eyIGMw7qTkZeBJI7EffcG0DH5ZFhqO8r
   g==;
X-CSE-ConnectionGUID: HokJtC2WQWizk3vCvWM5Hw==
X-CSE-MsgGUID: Uvf28K2URmOpHiEAYpYzaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15186196"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15186196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 10:42:32 -0700
X-CSE-ConnectionGUID: OU5mBcDYSfap4CnJuHyU0A==
X-CSE-MsgGUID: e6wJQWvPTRKcotvU9fDZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41478014"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 10:42:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIXQ5-0000LY-15;
	Sat, 15 Jun 2024 17:42:29 +0000
Date: Sun, 16 Jun 2024 01:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_table_reclaim 10/10]
 mm/pgtable_reclaim.c:437:25: error: use of undeclared identifier
 'root_mem_cgroup'; did you mean 'parent_mem_cgroup'?
Message-ID: <202406160112.AInpPKC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_table_reclaim
head:   fba6b89e0737bc078c6e7ace5a0c8718e097464d
commit: fba6b89e0737bc078c6e7ace5a0c8718e097464d [10/10] mm: page table reclaim
config: i386-buildonly-randconfig-004-20240615 (https://download.01.org/0day-ci/archive/20240616/202406160112.AInpPKC6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160112.AInpPKC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160112.AInpPKC6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/pgtable_reclaim.c:23:8: warning: no previous prototype for function 'lookup_pmdp' [-Wmissing-prototypes]
      23 | pmd_t *lookup_pmdp(struct mm_struct *mm, unsigned long address)
         |        ^
   mm/pgtable_reclaim.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      23 | pmd_t *lookup_pmdp(struct mm_struct *mm, unsigned long address)
         | ^
         | static 
>> mm/pgtable_reclaim.c:54:8: warning: no previous prototype for function 'lookup_pudp' [-Wmissing-prototypes]
      54 | pud_t *lookup_pudp(struct mm_struct *mm, unsigned long address)
         |        ^
   mm/pgtable_reclaim.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | pud_t *lookup_pudp(struct mm_struct *mm, unsigned long address)
         | ^
         | static 
   mm/pgtable_reclaim.c:175:9: warning: variable 'pmd' set but not used [-Wunused-but-set-variable]
     175 |         pmd_t *pmd;
         |                ^
   mm/pgtable_reclaim.c:395:20: warning: unused variable 'tlb' [-Wunused-variable]
     395 |         struct mmu_gather tlb;
         |                           ^~~
>> mm/pgtable_reclaim.c:437:25: error: use of undeclared identifier 'root_mem_cgroup'; did you mean 'parent_mem_cgroup'?
     437 |         if (!memcg || memcg == root_mem_cgroup)
         |                                ^~~~~~~~~~~~~~~
         |                                parent_mem_cgroup
   include/linux/memcontrol.h:1217:34: note: 'parent_mem_cgroup' declared here
    1217 | static inline struct mem_cgroup *parent_mem_cgroup(struct mem_cgroup *memcg)
         |                                  ^
>> mm/pgtable_reclaim.c:482:33: error: use of undeclared identifier 'zap_zero_pages'
     482 |         return sysfs_emit(buf, "%d\n", zap_zero_pages);
         |                                        ^
   mm/pgtable_reclaim.c:498:2: error: use of undeclared identifier 'zap_zero_pages'
     498 |         zap_zero_pages = value;
         |         ^
   4 warnings and 3 errors generated.


vim +437 mm/pgtable_reclaim.c

   434	
   435	void memcg_reclaim_pgtables(struct mem_cgroup *memcg)
   436	{
 > 437		if (!memcg || memcg == root_mem_cgroup)
   438			reclaim_pgtables();
   439		else
   440			mem_cgroup_scan_tasks(memcg, __memcg_reclaim_pgtables, NULL);
   441	}
   442	
   443	/*
   444	 * Try to reclaim page tables from all present processes.
   445	 *
   446	 * Note: must not be called with any mm_lock held.
   447	 */
   448	void reclaim_pgtables(void)
   449	{
   450		struct task_struct *p, *next_p;
   451	
   452		p = &init_task;
   453		get_task_struct(p);
   454		task_reclaim_pgtables(p);
   455	
   456		while (true) {
   457			rcu_read_lock();
   458			next_p = next_task(p);
   459			put_task_struct(p);
   460			p = next_p;
   461			get_task_struct(p);
   462			rcu_read_unlock();
   463	
   464			if (p == &init_task)
   465				break;
   466	
   467			task_reclaim_pgtables(p);
   468	
   469			if (unlikely(fatal_signal_pending(current)))
   470				break;
   471			cond_resched();
   472		}
   473	
   474		put_task_struct(p);
   475	}
   476	
   477	#ifdef CONFIG_SYSFS
   478	
   479	static ssize_t zap_zero_pages_show(struct kobject *kobj,
   480					      struct kobj_attribute *attr, char *buf)
   481	{
 > 482		return sysfs_emit(buf, "%d\n", zap_zero_pages);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
