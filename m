Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9627465C;
	Fri,  9 Jan 2026 02:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767925481; cv=none; b=pVqAGwQAO6qRaMQtsZWR1R4o7qtwGyynXNDZdQSrcVWlBBiWF8e95goGT9j4U/UOWu3YbXfPYzdK9yMaEdqmzvUA/kSoQviGF9H3xTpRYP9QWGdn/SUmE+fkxT8Me7fkUY5VonYA1Yn6mrAHKBHAc2fRrptQfI7+DWnFWhe7wfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767925481; c=relaxed/simple;
	bh=lQ4GGjt0Rj3i0mrurqMR6fqMwzGvomMJPo78swHAmzc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BjPhzsOV5ZMoALVChtPLPS8AnlOK6fO4anrX3FNf6R252WmUwND0o++QorfQS6nH5rOcu3WaXecIolbF8nE0CU6yaAkDrBNqdBATxKvXAPUCgszbk1PSMJ5+b43+62XQ3vTFBVAeg9Z43R9jFfsrnWeG5/Z8sSOe1QLQSmOGwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZIFAMX6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZIFAMX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767925479; x=1799461479;
  h=date:from:to:cc:subject:message-id;
  bh=lQ4GGjt0Rj3i0mrurqMR6fqMwzGvomMJPo78swHAmzc=;
  b=eZIFAMX6Bm6NArgPtdH39nWOvWlqxCPEejccOKtq+yGWfieP8wJ26CfT
   AbphlhYgc76YCO/J0dswATlICbuzkwwfAZ22m3rbmSTdsSgT1SXETb1/P
   DM0COgAF+MwfDgtmgiB552Nqxcqlmgroat2raklARQy8D1L7foaGrLTxF
   eh6bZ1NCAOrYELStfbt45/NxOFRGthnZ3CG/7MybY4HgBs3orn2vpONcY
   WDQLNd2z9foRICfPasa3bD9PlmG1pGfKBP68TKIornc5wrXif/XFpKrqh
   BGI8aoxSPPrpPfqhoaI9uEUOLMBKi+fyBCkwdUIMVpK5LSK4ne6pP5WWG
   g==;
X-CSE-ConnectionGUID: /AclPfunS8GtqdC4Mwiddg==
X-CSE-MsgGUID: +nhTHzVfRa+BQKa1DUL1lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69384683"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69384683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:24:39 -0800
X-CSE-ConnectionGUID: aaUwJGcGQkeQo8yW3hsZsA==
X-CSE-MsgGUID: jdjLckdMTwuSmtf3ZCoP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203387294"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 18:24:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve2Az-000000005Ka-3wjx;
	Fri, 09 Jan 2026 02:24:33 +0000
Date: Fri, 09 Jan 2026 10:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bing Jiao <bingjiao@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 259/263] mm/vmscan.c:1046:6: warning:
 variable 'target_nid' is uninitialized when used here
Message-ID: <202601091037.vUSHeJCH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   ba756a5e4580859e0b26f6679d882f81935a7b14
commit: d92027a5f30a6c5c582169114b1e56d6536ca8f8 [259/263] mm/vmscan: select the closest preferred node in demote_folio_list()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260109/202601091037.vUSHeJCH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091037.vUSHeJCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091037.vUSHeJCH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:1046:6: warning: variable 'target_nid' is uninitialized when used here [-Wuninitialized]
    1046 |         if (target_nid == NUMA_NO_NODE)
         |             ^~~~~~~~~~
   mm/vmscan.c:1026:16: note: initialize the variable 'target_nid' to silence this warning
    1026 |         int target_nid;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/target_nid +1046 mm/vmscan.c

26aa2d199d6f2c Dave Hansen             2021-09-02  1017  
26aa2d199d6f2c Dave Hansen             2021-09-02  1018  /*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1019)  * Take folios on @demote_folios and attempt to demote them to another node.
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1020)  * Folios which are not demoted are left on @demote_folios.
26aa2d199d6f2c Dave Hansen             2021-09-02  1021   */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1022) static unsigned int demote_folio_list(struct list_head *demote_folios,
059c4bb2dc3b93 Bing Jiao               2026-01-08  1023  				      struct pglist_data *pgdat,
059c4bb2dc3b93 Bing Jiao               2026-01-08  1024  				      struct mem_cgroup *memcg)
26aa2d199d6f2c Dave Hansen             2021-09-02  1025  {
d92027a5f30a6c Bing Jiao               2026-01-08  1026  	int target_nid;
26aa2d199d6f2c Dave Hansen             2021-09-02  1027  	unsigned int nr_succeeded;
32008027289239 Jagdish Gediya          2022-08-18  1028  	nodemask_t allowed_mask;
d92027a5f30a6c Bing Jiao               2026-01-08  1029  	nodemask_t preferred;
32008027289239 Jagdish Gediya          2022-08-18  1030  
32008027289239 Jagdish Gediya          2022-08-18  1031  	struct migration_target_control mtc = {
32008027289239 Jagdish Gediya          2022-08-18  1032  		/*
32008027289239 Jagdish Gediya          2022-08-18  1033  		 * Allocate from 'node', or fail quickly and quietly.
32008027289239 Jagdish Gediya          2022-08-18  1034  		 * When this happens, 'page' will likely just be discarded
32008027289239 Jagdish Gediya          2022-08-18  1035  		 * instead of migrated.
32008027289239 Jagdish Gediya          2022-08-18  1036  		 */
bd63d0fde2a2c3 Fushuai Wang            2025-10-06  1037  		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
32008027289239 Jagdish Gediya          2022-08-18  1038  			__GFP_NOMEMALLOC | GFP_NOWAIT,
e42dfe4e0a51b4 Baolin Wang             2024-03-06  1039  		.nmask = &allowed_mask,
e42dfe4e0a51b4 Baolin Wang             2024-03-06  1040  		.reason = MR_DEMOTION,
32008027289239 Jagdish Gediya          2022-08-18  1041  	};
26aa2d199d6f2c Dave Hansen             2021-09-02  1042  
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1043) 	if (list_empty(demote_folios))
26aa2d199d6f2c Dave Hansen             2021-09-02  1044  		return 0;
26aa2d199d6f2c Dave Hansen             2021-09-02  1045  
26aa2d199d6f2c Dave Hansen             2021-09-02 @1046  	if (target_nid == NUMA_NO_NODE)
059c4bb2dc3b93 Bing Jiao               2026-01-08  1047  		/* No lower-tier nodes or nodes were hot-unplugged. */
26aa2d199d6f2c Dave Hansen             2021-09-02  1048  		return 0;
26aa2d199d6f2c Dave Hansen             2021-09-02  1049  
32008027289239 Jagdish Gediya          2022-08-18  1050  	node_get_allowed_targets(pgdat, &allowed_mask);
059c4bb2dc3b93 Bing Jiao               2026-01-08  1051  	mem_cgroup_node_filter_allowed(memcg, &allowed_mask);
059c4bb2dc3b93 Bing Jiao               2026-01-08  1052  	if (nodes_empty(allowed_mask))
059c4bb2dc3b93 Bing Jiao               2026-01-08  1053  		return 0;
059c4bb2dc3b93 Bing Jiao               2026-01-08  1054  
d92027a5f30a6c Bing Jiao               2026-01-08  1055  	target_nid = next_demotion_node(pgdat->node_id, &preferred);
d92027a5f30a6c Bing Jiao               2026-01-08  1056  	while (target_nid != NUMA_NO_NODE &&
d92027a5f30a6c Bing Jiao               2026-01-08  1057  	       !node_isset(target_nid, allowed_mask)) {
d92027a5f30a6c Bing Jiao               2026-01-08  1058  		/* Filter out preferred nodes that are not in allowed. */
d92027a5f30a6c Bing Jiao               2026-01-08  1059  		nodes_and(preferred, preferred, allowed_mask);
d92027a5f30a6c Bing Jiao               2026-01-08  1060  		if (!nodes_empty(preferred)) {
d92027a5f30a6c Bing Jiao               2026-01-08  1061  			/* Randomly select one node from preferred. */
d92027a5f30a6c Bing Jiao               2026-01-08  1062  			target_nid = node_random(&preferred);
d92027a5f30a6c Bing Jiao               2026-01-08  1063  			break;
d92027a5f30a6c Bing Jiao               2026-01-08  1064  		}
d92027a5f30a6c Bing Jiao               2026-01-08  1065  		/*
d92027a5f30a6c Bing Jiao               2026-01-08  1066  		 * Preferred nodes in the lower tier are not set in allowed.
d92027a5f30a6c Bing Jiao               2026-01-08  1067  		 * Recursively get preferred from the next lower tier.
d92027a5f30a6c Bing Jiao               2026-01-08  1068  		 */
d92027a5f30a6c Bing Jiao               2026-01-08  1069  		target_nid = next_demotion_node(target_nid, &preferred);
d92027a5f30a6c Bing Jiao               2026-01-08  1070  	}
d92027a5f30a6c Bing Jiao               2026-01-08  1071  
d92027a5f30a6c Bing Jiao               2026-01-08  1072  	if (target_nid == NUMA_NO_NODE)
d92027a5f30a6c Bing Jiao               2026-01-08  1073  		/* Nodes are gone (e.g., hot-unplugged). */
d92027a5f30a6c Bing Jiao               2026-01-08  1074  		return 0;
059c4bb2dc3b93 Bing Jiao               2026-01-08  1075  	mtc.nid = target_nid;
32008027289239 Jagdish Gediya          2022-08-18  1076  
26aa2d199d6f2c Dave Hansen             2021-09-02  1077  	/* Demotion ignores all cpuset and mempolicy settings */
29ea04095b9697 SeongJae Park           2025-06-16  1078  	migrate_pages(demote_folios, alloc_demote_folio, NULL,
32008027289239 Jagdish Gediya          2022-08-18  1079  		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DEMOTION,
26aa2d199d6f2c Dave Hansen             2021-09-02  1080  		      &nr_succeeded);
26aa2d199d6f2c Dave Hansen             2021-09-02  1081  
26aa2d199d6f2c Dave Hansen             2021-09-02  1082  	return nr_succeeded;
26aa2d199d6f2c Dave Hansen             2021-09-02  1083  }
26aa2d199d6f2c Dave Hansen             2021-09-02  1084  

:::::: The code at line 1046 was first introduced by commit
:::::: 26aa2d199d6f2cfa6f2ef2a5dfe891f2250e71a0 mm/migrate: demote pages during reclaim

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
