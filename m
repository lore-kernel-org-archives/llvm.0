Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C9FC0E;
	Tue, 31 Oct 2023 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SznS2zBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698777432; x=1730313432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9yU5rQjgUxzCsSLsHYw45HHl36U3p/ONu0R9HivknOs=;
  b=SznS2zBOmgp/F6eOkFArWvdl5I/7C6DhujHB6JtlFb4oWK8ibdQUpIIy
   y+yz3K0kJIy4lLYC2VlNQftOaKC1cHZIey2QiB4MCFZ2Vo6cGwKQb45ri
   NMqSW5SNvmQmqyPV8FoazzJR6rTeDTs6y29QJ3R9yRGaBCO2f4a/WH29Y
   UWZ+1rsBy0XX9GEJ2QSb8/NvnxzybfuXu55rECf88rqz4z9r4jQEyskiT
   zUr40E2UxraBZSA7jTubev8i73X7KUS32EtRtuamW9w8P6QUZqEnlqR2V
   rP8RduMn5lwRWDjcfOJ+ReW591AEfeQHjkTUefefEgQjYsKjwTdSnhx3W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388169929"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="388169929"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 11:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="754219651"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="754219651"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Oct 2023 11:37:10 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxtbv-0000Kd-1s;
	Tue, 31 Oct 2023 18:37:07 +0000
Date: Wed, 1 Nov 2023 02:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka:slub-percpu-caches-v3r0 5/6] lib/maple_tree.c:5524:20:
 error: use of undeclared identifier 'MA_STATE_PREALLOC'
Message-ID: <202311010201.ktEJKmQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v3r0
head:   dd3fcb0bdf513439374345254f4894675bc88e68
commit: bb07edc43f9f1a6119fa114f52d14df3f87e3241 [5/6] maple_tree: Remove MA_STATE_PREALLOC
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311010201.ktEJKmQ5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010201.ktEJKmQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010201.ktEJKmQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/maple_tree.c:5524:20: error: use of undeclared identifier 'MA_STATE_PREALLOC'
    5524 |         mas->mas_flags |= MA_STATE_PREALLOC;
         |                           ^
   1 error generated.


vim +/MA_STATE_PREALLOC +5524 lib/maple_tree.c

54a611b605901c7 Liam R. Howlett  2022-09-06  5468  
54a611b605901c7 Liam R. Howlett  2022-09-06  5469  /**
54a611b605901c7 Liam R. Howlett  2022-09-06  5470   * mas_preallocate() - Preallocate enough nodes for a store operation
54a611b605901c7 Liam R. Howlett  2022-09-06  5471   * @mas: The maple state
da0892547b101df Liam R. Howlett  2023-07-24  5472   * @entry: The entry that will be stored
54a611b605901c7 Liam R. Howlett  2022-09-06  5473   * @gfp: The GFP_FLAGS to use for allocations.
54a611b605901c7 Liam R. Howlett  2022-09-06  5474   *
54a611b605901c7 Liam R. Howlett  2022-09-06  5475   * Return: 0 on success, -ENOMEM if memory could not be allocated.
54a611b605901c7 Liam R. Howlett  2022-09-06  5476   */
da0892547b101df Liam R. Howlett  2023-07-24  5477  int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
54a611b605901c7 Liam R. Howlett  2022-09-06  5478  {
17983dc617837a5 Liam R. Howlett  2023-07-24  5479  	MA_WR_STATE(wr_mas, mas, entry);
17983dc617837a5 Liam R. Howlett  2023-07-24  5480  	unsigned char node_size;
17983dc617837a5 Liam R. Howlett  2023-07-24  5481  	int request = 1;
54a611b605901c7 Liam R. Howlett  2022-09-06  5482  	int ret;
54a611b605901c7 Liam R. Howlett  2022-09-06  5483  
17983dc617837a5 Liam R. Howlett  2023-07-24  5484  
17983dc617837a5 Liam R. Howlett  2023-07-24  5485  	if (unlikely(!mas->index && mas->last == ULONG_MAX))
17983dc617837a5 Liam R. Howlett  2023-07-24  5486  		goto ask_now;
17983dc617837a5 Liam R. Howlett  2023-07-24  5487  
17983dc617837a5 Liam R. Howlett  2023-07-24  5488  	mas_wr_store_setup(&wr_mas);
17983dc617837a5 Liam R. Howlett  2023-07-24  5489  	wr_mas.content = mas_start(mas);
17983dc617837a5 Liam R. Howlett  2023-07-24  5490  	/* Root expand */
17983dc617837a5 Liam R. Howlett  2023-07-24  5491  	if (unlikely(mas_is_none(mas) || mas_is_ptr(mas)))
17983dc617837a5 Liam R. Howlett  2023-07-24  5492  		goto ask_now;
17983dc617837a5 Liam R. Howlett  2023-07-24  5493  
17983dc617837a5 Liam R. Howlett  2023-07-24  5494  	if (unlikely(!mas_wr_walk(&wr_mas))) {
17983dc617837a5 Liam R. Howlett  2023-07-24  5495  		/* Spanning store, use worst case for now */
17983dc617837a5 Liam R. Howlett  2023-07-24  5496  		request = 1 + mas_mt_height(mas) * 3;
17983dc617837a5 Liam R. Howlett  2023-07-24  5497  		goto ask_now;
17983dc617837a5 Liam R. Howlett  2023-07-24  5498  	}
17983dc617837a5 Liam R. Howlett  2023-07-24  5499  
17983dc617837a5 Liam R. Howlett  2023-07-24  5500  	/* At this point, we are at the leaf node that needs to be altered. */
17983dc617837a5 Liam R. Howlett  2023-07-24  5501  	/* Exact fit, no nodes needed. */
17983dc617837a5 Liam R. Howlett  2023-07-24  5502  	if (wr_mas.r_min == mas->index && wr_mas.r_max == mas->last)
17983dc617837a5 Liam R. Howlett  2023-07-24  5503  		return 0;
17983dc617837a5 Liam R. Howlett  2023-07-24  5504  
17983dc617837a5 Liam R. Howlett  2023-07-24  5505  	mas_wr_end_piv(&wr_mas);
17983dc617837a5 Liam R. Howlett  2023-07-24  5506  	node_size = mas_wr_new_end(&wr_mas);
17983dc617837a5 Liam R. Howlett  2023-07-24  5507  	if (node_size >= mt_slots[wr_mas.type]) {
17983dc617837a5 Liam R. Howlett  2023-07-24  5508  		/* Split, worst case for now. */
17983dc617837a5 Liam R. Howlett  2023-07-24  5509  		request = 1 + mas_mt_height(mas) * 2;
17983dc617837a5 Liam R. Howlett  2023-07-24  5510  		goto ask_now;
17983dc617837a5 Liam R. Howlett  2023-07-24  5511  	}
17983dc617837a5 Liam R. Howlett  2023-07-24  5512  
17983dc617837a5 Liam R. Howlett  2023-07-24  5513  	/* New root needs a singe node */
17983dc617837a5 Liam R. Howlett  2023-07-24  5514  	if (unlikely(mte_is_root(mas->node)))
17983dc617837a5 Liam R. Howlett  2023-07-24  5515  		goto ask_now;
17983dc617837a5 Liam R. Howlett  2023-07-24  5516  
17983dc617837a5 Liam R. Howlett  2023-07-24  5517  	/* Potential spanning rebalance collapsing a node, use worst-case */
17983dc617837a5 Liam R. Howlett  2023-07-24  5518  	if (node_size  - 1 <= mt_min_slots[wr_mas.type])
17983dc617837a5 Liam R. Howlett  2023-07-24  5519  		request = mas_mt_height(mas) * 2 - 1;
17983dc617837a5 Liam R. Howlett  2023-07-24  5520  
17983dc617837a5 Liam R. Howlett  2023-07-24  5521  	/* node store, slot store needs one node */
17983dc617837a5 Liam R. Howlett  2023-07-24  5522  ask_now:
17983dc617837a5 Liam R. Howlett  2023-07-24  5523  	mas_node_count_gfp(mas, request, gfp);
54a611b605901c7 Liam R. Howlett  2022-09-06 @5524  	mas->mas_flags |= MA_STATE_PREALLOC;
54a611b605901c7 Liam R. Howlett  2022-09-06  5525  	if (likely(!mas_is_err(mas)))
54a611b605901c7 Liam R. Howlett  2022-09-06  5526  		return 0;
54a611b605901c7 Liam R. Howlett  2022-09-06  5527  
54a611b605901c7 Liam R. Howlett  2022-09-06  5528  	mas_set_alloc_req(mas, 0);
54a611b605901c7 Liam R. Howlett  2022-09-06  5529  	ret = xa_err(mas->node);
54a611b605901c7 Liam R. Howlett  2022-09-06  5530  	mas_reset(mas);
54a611b605901c7 Liam R. Howlett  2022-09-06  5531  	mas_destroy(mas);
54a611b605901c7 Liam R. Howlett  2022-09-06  5532  	mas_reset(mas);
54a611b605901c7 Liam R. Howlett  2022-09-06  5533  	return ret;
54a611b605901c7 Liam R. Howlett  2022-09-06  5534  }
5c63a7c32a94a7e Danilo Krummrich 2023-03-02  5535  EXPORT_SYMBOL_GPL(mas_preallocate);
54a611b605901c7 Liam R. Howlett  2022-09-06  5536  

:::::: The code at line 5524 was first introduced by commit
:::::: 54a611b605901c7d5d05b6b8f5d04a6ceb0962aa Maple Tree: add new data structure

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
