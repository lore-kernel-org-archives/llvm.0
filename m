Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26725564;
	Wed, 13 Dec 2023 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/CqlRj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702506620; x=1734042620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IH2bgUadoX835YZS32Nu3sBkzvFM1nM6t3B/WQS7jYE=;
  b=g/CqlRj1aPObzOvGpIFsY/2ldCVIXB2QZCZuz0w7aujWIObgnKHuMeBF
   VJRPjQJ7sZjDnteFt8CtwU+MrUdHUdcDtu2gKM3LrZaH8sAPm9p7Y9prL
   grnXaIZLsNITZiW1vxwtBcByCy8JtQ95QS876Mq7aGxveBT+QVXIqBkJv
   cWT35NCGFIUexFlV0to75sX+dTINzYkOew92vLdeXXlIrc3VzbSnAO+A8
   DkWEu68Ll+L0gRN3gSGpPhYF2Qg6VkUY/ynjRLIBwbZmLufsraN/qNGP4
   huD0BLUtKmt4ommxxLnwu2o0Zc0WR9adgQwZfPGv5cuZDUl072RA3Kguv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="392212239"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="392212239"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 14:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="22149655"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2023 14:30:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDXk7-000LDs-0K;
	Wed, 13 Dec 2023 22:30:15 +0000
Date: Thu, 14 Dec 2023 06:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-unstable 208/262] lib/maple_tree.c:5506:25: error: no
 member named 'end' in 'struct ma_state'
Message-ID: <202312140605.Er6kw8xG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4d9256c0c56bafd76b8b1517916451e168fae495
commit: 84bda0b24555d3fdf52b56040696ee1ee00700c9 [208/262] maple_tree: do not preallocate nodes for slot stores
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231214/202312140605.Er6kw8xG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140605.Er6kw8xG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140605.Er6kw8xG-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 4d9256c0c56bafd76b8b1517916451e168fae495 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/maple_tree.c:5506:25: error: no member named 'end' in 'struct ma_state'
           if ((node_size == mas->end) && ((!mt_in_rcu(mas->tree))
                             ~~~  ^
   1 error generated.


vim +5506 lib/maple_tree.c

  5465	
  5466	/**
  5467	 * mas_preallocate() - Preallocate enough nodes for a store operation
  5468	 * @mas: The maple state
  5469	 * @entry: The entry that will be stored
  5470	 * @gfp: The GFP_FLAGS to use for allocations.
  5471	 *
  5472	 * Return: 0 on success, -ENOMEM if memory could not be allocated.
  5473	 */
  5474	int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
  5475	{
  5476		MA_WR_STATE(wr_mas, mas, entry);
  5477		unsigned char node_size;
  5478		int request = 1;
  5479		int ret;
  5480	
  5481	
  5482		if (unlikely(!mas->index && mas->last == ULONG_MAX))
  5483			goto ask_now;
  5484	
  5485		mas_wr_store_setup(&wr_mas);
  5486		wr_mas.content = mas_start(mas);
  5487		/* Root expand */
  5488		if (unlikely(mas_is_none(mas) || mas_is_ptr(mas)))
  5489			goto ask_now;
  5490	
  5491		if (unlikely(!mas_wr_walk(&wr_mas))) {
  5492			/* Spanning store, use worst case for now */
  5493			request = 1 + mas_mt_height(mas) * 3;
  5494			goto ask_now;
  5495		}
  5496	
  5497		/* At this point, we are at the leaf node that needs to be altered. */
  5498		/* Exact fit, no nodes needed. */
  5499		if (wr_mas.r_min == mas->index && wr_mas.r_max == mas->last)
  5500			return 0;
  5501	
  5502		mas_wr_end_piv(&wr_mas);
  5503		node_size = mas_wr_new_end(&wr_mas);
  5504	
  5505		/* Slot store, does not require additional nodes */
> 5506		if ((node_size == mas->end) && ((!mt_in_rcu(mas->tree))
  5507			|| (wr_mas.offset_end - mas->offset == 1)))
  5508			return 0;
  5509	
  5510		if (node_size >= mt_slots[wr_mas.type]) {
  5511			/* Split, worst case for now. */
  5512			request = 1 + mas_mt_height(mas) * 2;
  5513			goto ask_now;
  5514		}
  5515	
  5516		/* New root needs a singe node */
  5517		if (unlikely(mte_is_root(mas->node)))
  5518			goto ask_now;
  5519	
  5520		/* Potential spanning rebalance collapsing a node, use worst-case */
  5521		if (node_size  - 1 <= mt_min_slots[wr_mas.type])
  5522			request = mas_mt_height(mas) * 2 - 1;
  5523	
  5524		/* node store, slot store needs one node */
  5525	ask_now:
  5526		mas_node_count_gfp(mas, request, gfp);
  5527		mas->mas_flags |= MA_STATE_PREALLOC;
  5528		if (likely(!mas_is_err(mas)))
  5529			return 0;
  5530	
  5531		mas_set_alloc_req(mas, 0);
  5532		ret = xa_err(mas->node);
  5533		mas_reset(mas);
  5534		mas_destroy(mas);
  5535		mas_reset(mas);
  5536		return ret;
  5537	}
  5538	EXPORT_SYMBOL_GPL(mas_preallocate);
  5539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
