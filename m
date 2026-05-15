Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBD1DF261;
	Fri, 15 May 2026 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883800; cv=none; b=UjkNtA0dc8Op+vxegwUqRK5HHpXea89+wOHaHKg7RGhKZyYaHNXjXDAVyf5wqAIkcJTzX7uKpZBg1VF4bIFWuWzuRp6ve8jAjJz7geLcvRlnogU27Ol1mXxXhZfNuhIaO3MeYheS/PxLchm655V/phY3wXIUqr0WFcr1lnKGOg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883800; c=relaxed/simple;
	bh=kjbm9EC+Bbml0P4CtRJRFEaot9e4ulFhOYbjW5PG5Jw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E1cvc1EvW7LBMOMmef6URGgpPJOz0niFBHo3huM1u3YVaB4EXGtdPwc1hEAjdogachhYNWVONCI0zFiYECsgwkQRcaGhfROzVosJnpPz5CdBbJtF7dQrn3vZPLlWXeVdTn4U0QnNgCOphI2eiBJ4ylGgcpS5VPszxekkotIb7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEnpt/Tl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEnpt/Tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883799; x=1810419799;
  h=date:from:to:cc:subject:message-id;
  bh=kjbm9EC+Bbml0P4CtRJRFEaot9e4ulFhOYbjW5PG5Jw=;
  b=hEnpt/Tl3NkZU5en1zuu9FQ9Mns2b6QU7BJ9SmhfNa4MWa4g0dCIzxBF
   ywwn4JP7BdnuFChAWH2ULeMxj+9AxVEhM97AOQdKnkHgF6kA1P8kdnuaq
   bhXxHfvYNHd2oqas9JnCBYAZUU9GJzHfrLur7V8N/kXBXflB2S4SVtiQQ
   xboLbBHx7Sb0raq3AEtZ9mseMUQqLCcu6rJ785vuhhk62D2lHIZjzMXOo
   xtWSYpCf4g+GFa+d8y/Ch3AdrM95yBtQiGK3XbsvatMFOhzBqe6hfvuff
   E26lHD5YyUS3QtBLHfT8x2HwzK73XZgSAgiEusJbVZvLG7+SA0vVZJZjB
   w==;
X-CSE-ConnectionGUID: yqPqcOfESt6bT0tHheX/zA==
X-CSE-MsgGUID: 0dekBK98SweP2Sy1HVBEew==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78981463"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="78981463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:23:18 -0700
X-CSE-ConnectionGUID: n1Bwb9TnStmLx3W64ywznQ==
X-CSE-MsgGUID: 91nG32HDSWOcEtbY7T4E5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="262573054"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 15:23:16 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0w6-0000000097B-2uzP;
	Fri, 15 May 2026 22:23:14 +0000
Date: Sat, 16 May 2026 00:22:23 +0200
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Youngjun Park <youngjun.park@lge.com>
Subject: mm/swapfile.c:453:6: warning: unused variable 'ret'
Message-ID: <202605160059.RigLlGEw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-swap-simplify-swap-cache-allocation-helper/20260515-182232
head:   0c9b851d54d8858aefdd082f59e488eeaa4c6f6f
commit: 0c9b851d54d8858aefdd082f59e488eeaa4c6f6f mm, swap: merge zeromap into swap table
date:   12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260516/202605160059.RigLlGEw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160059.RigLlGEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160059.RigLlGEw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:453:6: warning: unused variable 'ret' [-Wunused-variable]
     453 |         int ret = 0;
         |             ^~~
   1 warning generated.


vim +/ret +453 mm/swapfile.c

16dc0672038592 Kairui Song 2026-05-15  448  
16dc0672038592 Kairui Song 2026-05-15  449  static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
16dc0672038592 Kairui Song 2026-05-15  450  {
16dc0672038592 Kairui Song 2026-05-15  451  	struct swap_table *table = NULL;
16dc0672038592 Kairui Song 2026-05-15  452  	struct folio *folio;
d029b4aa29fcfc Kairui Song 2026-05-15 @453  	int ret = 0;
16dc0672038592 Kairui Song 2026-05-15  454  
16dc0672038592 Kairui Song 2026-05-15  455  	/* The cluster must be empty and not on any list during allocation. */
16dc0672038592 Kairui Song 2026-05-15  456  	VM_WARN_ON_ONCE(ci->flags || !cluster_is_empty(ci));
16dc0672038592 Kairui Song 2026-05-15  457  	if (rcu_access_pointer(ci->table))
16dc0672038592 Kairui Song 2026-05-15  458  		return 0;
16dc0672038592 Kairui Song 2026-05-15  459  
16dc0672038592 Kairui Song 2026-05-15  460  	if (SWP_TABLE_USE_PAGE) {
16dc0672038592 Kairui Song 2026-05-15  461  		folio = folio_alloc(gfp | __GFP_ZERO, 0);
16dc0672038592 Kairui Song 2026-05-15  462  		if (folio)
16dc0672038592 Kairui Song 2026-05-15  463  			table = folio_address(folio);
16dc0672038592 Kairui Song 2026-05-15  464  	} else {
16dc0672038592 Kairui Song 2026-05-15  465  		table = kmem_cache_zalloc(swap_table_cachep, gfp);
16dc0672038592 Kairui Song 2026-05-15  466  	}
16dc0672038592 Kairui Song 2026-05-15  467  	if (!table)
16dc0672038592 Kairui Song 2026-05-15  468  		return -ENOMEM;
16dc0672038592 Kairui Song 2026-05-15  469  
16dc0672038592 Kairui Song 2026-05-15  470  	rcu_assign_pointer(ci->table, table);
d029b4aa29fcfc Kairui Song 2026-05-15  471  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
