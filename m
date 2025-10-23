Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F462DC344;
	Thu, 23 Oct 2025 07:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203943; cv=none; b=qkyfvj+6cNp0UoHkf7jhWOcVcvx9MWjk6anLMrPEYvhMZrEk6XpcU0fYMBP0pDyDBLUsa35JAa0Me+ZAIiKFOGQHo7ZIn5s5o7wNq3QF6rHFHqS2CbjZ0FVVP4xflKBveLUsts1DSvARjg4+TRokVJ3MFKDCv2qVBPdF9eN1vVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203943; c=relaxed/simple;
	bh=X7xPBz2NhDamE9d8hTNH4FZjM2IfUJ5eOYvRtdOtF6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QpFMvIL9bml6F6Q+HU5zM9fBltmetZYnY0F6Up5svcv0b0CPUHsiXkFXemmYKUdmZNU8lrhtx3ejbBd7EBZmdosQZ1oWVyaCXbcWBeDRHcycnRc87T/HUtkDk4mQqTtU81vT1ZV9TwRVLEMKpYc4vhOziwt7pUn9REPxA2zlYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+ZfXBi8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+ZfXBi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761203939; x=1792739939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7xPBz2NhDamE9d8hTNH4FZjM2IfUJ5eOYvRtdOtF6U=;
  b=D+ZfXBi85TgRDrocfkMzLSrnE/bGqylRabhwor6Rn9sXko0DOghreusk
   WGkhC3x13fk58fNV47UZJYtd5Nq87EQrtoZczV8YJTSpGPjAimPQJsIpK
   2w10s3uDnVGSq6t1Mo/nclGyZ2QCV2BFZYJ9NXB84/eNjR5tz5ez1NYyA
   kAL8YpoZta2HLcilnv1mtswNO/H+QlVw1+lUVKLbaJvL/zi7kFvRhBSJH
   TX0GEWlQ1wyhqEOPWSu48I/TdAqI6dQpurn0HSE9wE6pZPkcPW7CH7AZd
   P/YO0N2sU5/TgFNAE9uY7bpYjZ5ruCpIQX3JaggXqwMFxsnbjI7XbBCTm
   w==;
X-CSE-ConnectionGUID: sRLAcs2oR3GVpnQsDi6cCQ==
X-CSE-MsgGUID: JsLDUC2+RseZky9IM8Q1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63286845"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63286845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:18:58 -0700
X-CSE-ConnectionGUID: ouNGgj/zRleKHiblYl7E0A==
X-CSE-MsgGUID: eT9AI8ypRLeiVn143X+vjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="188371961"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2025 00:18:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBpb5-000D8x-0R;
	Thu, 23 Oct 2025 07:18:55 +0000
Date: Thu, 23 Oct 2025 15:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/sheaves-for-all 21/21] mm/slub.c:8749:3: error: use of
 undeclared identifier 'free_frozen_attr'
Message-ID: <202510231534.qMM3wH4Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/sheaves-for-all
head:   09faaa86a5c54214300bed64355a84c9b278cdab
commit: 09faaa86a5c54214300bed64355a84c9b278cdab [21/21] slab: remove frozen slab checks from __slab_free()
config: x86_64-buildonly-randconfig-003-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231534.qMM3wH4Q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231534.qMM3wH4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231534.qMM3wH4Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:8749:3: error: use of undeclared identifier 'free_frozen_attr'
    8749 |         &free_frozen_attr.attr,
         |          ^
   1 error generated.


vim +/free_frozen_attr +8749 mm/slub.c

b84e04f1baeebe6 Imran Khan        2022-08-15  8703  
81819f0fc8285a2 Christoph Lameter 2007-05-06  8704  static struct attribute *slab_attrs[] = {
81819f0fc8285a2 Christoph Lameter 2007-05-06  8705  	&slab_size_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8706  	&object_size_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8707  	&objs_per_slab_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8708  	&order_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8709  	&sheaf_capacity_attr.attr,
73d342b169db700 David Rientjes    2009-02-22  8710  	&min_partial_attr.attr,
49e2258586b4236 Christoph Lameter 2011-08-09  8711  	&cpu_partial_attr.attr,
205ab99dd103e3d Christoph Lameter 2008-04-14  8712  	&objects_partial_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8713  	&partial_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8714  	&cpu_slabs_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8715  	&ctor_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8716  	&aliases_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8717  	&align_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8718  	&hwcache_align_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8719  	&reclaim_account_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8720  	&destroy_by_rcu_attr.attr,
a5a84755c590041 Christoph Lameter 2010-10-05  8721  	&shrink_attr.attr,
49e2258586b4236 Christoph Lameter 2011-08-09  8722  	&slabs_cpu_partial_attr.attr,
ab4d5ed5eeda4f5 Christoph Lameter 2010-10-05  8723  #ifdef CONFIG_SLUB_DEBUG
a5a84755c590041 Christoph Lameter 2010-10-05  8724  	&total_objects_attr.attr,
81bd31793fd3be4 Xiongwei Song     2023-04-13  8725  	&objects_attr.attr,
a5a84755c590041 Christoph Lameter 2010-10-05  8726  	&slabs_attr.attr,
a5a84755c590041 Christoph Lameter 2010-10-05  8727  	&sanity_checks_attr.attr,
a5a84755c590041 Christoph Lameter 2010-10-05  8728  	&trace_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8729  	&red_zone_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8730  	&poison_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8731  	&store_user_attr.attr,
53e15af03be4fda Christoph Lameter 2007-05-06  8732  	&validate_attr.attr,
ab4d5ed5eeda4f5 Christoph Lameter 2010-10-05  8733  #endif
81819f0fc8285a2 Christoph Lameter 2007-05-06  8734  #ifdef CONFIG_ZONE_DMA
81819f0fc8285a2 Christoph Lameter 2007-05-06  8735  	&cache_dma_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8736  #endif
81819f0fc8285a2 Christoph Lameter 2007-05-06  8737  #ifdef CONFIG_NUMA
9824601ead957a2 Christoph Lameter 2008-01-07  8738  	&remote_node_defrag_ratio_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8739  #endif
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8740  #ifdef CONFIG_SLUB_STATS
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8741  	&alloc_cpu_sheaf_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8742  	&alloc_fastpath_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8743  	&alloc_slowpath_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8744  	&free_cpu_sheaf_attr.attr,
ec66e0d599520ab Vlastimil Babka   2025-09-03  8745  	&free_rcu_sheaf_attr.attr,
ec66e0d599520ab Vlastimil Babka   2025-09-03  8746  	&free_rcu_sheaf_fail_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8747  	&free_fastpath_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8748  	&free_slowpath_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07 @8749  	&free_frozen_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8750  	&free_add_partial_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8751  	&free_remove_partial_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8752  	&alloc_from_partial_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8753  	&alloc_slab_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8754  	&alloc_refill_attr.attr,
e36a2652d7d1ad9 Christoph Lameter 2011-06-01  8755  	&alloc_node_mismatch_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8756  	&free_slab_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8757  	&cpuslab_flush_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8758  	&deactivate_full_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8759  	&deactivate_empty_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8760  	&deactivate_to_head_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8761  	&deactivate_to_tail_attr.attr,
8ff12cfc009a2a3 Christoph Lameter 2008-02-07  8762  	&deactivate_remote_frees_attr.attr,
03e404af26dc2ea Christoph Lameter 2011-06-01  8763  	&deactivate_bypass_attr.attr,
65c3376aaca96c6 Christoph Lameter 2008-04-14  8764  	&order_fallback_attr.attr,
b789ef518b2a723 Christoph Lameter 2011-06-01  8765  	&cmpxchg_double_fail_attr.attr,
b789ef518b2a723 Christoph Lameter 2011-06-01  8766  	&cmpxchg_double_cpu_fail_attr.attr,
49e2258586b4236 Christoph Lameter 2011-08-09  8767  	&cpu_partial_alloc_attr.attr,
49e2258586b4236 Christoph Lameter 2011-08-09  8768  	&cpu_partial_free_attr.attr,
8028dcea8abbbd5 Alex Shi          2012-02-03  8769  	&cpu_partial_node_attr.attr,
8028dcea8abbbd5 Alex Shi          2012-02-03  8770  	&cpu_partial_drain_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8771  	&sheaf_flush_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8772  	&sheaf_refill_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8773  	&sheaf_alloc_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8774  	&sheaf_free_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8775  	&barn_get_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8776  	&barn_get_fail_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8777  	&barn_put_attr.attr,
2d517aa09bbc420 Vlastimil Babka   2025-09-03  8778  	&barn_put_fail_attr.attr,
3c1ea5c5019ff19 Vlastimil Babka   2025-09-03  8779  	&sheaf_prefill_fast_attr.attr,
3c1ea5c5019ff19 Vlastimil Babka   2025-09-03  8780  	&sheaf_prefill_slow_attr.attr,
3c1ea5c5019ff19 Vlastimil Babka   2025-09-03  8781  	&sheaf_prefill_oversize_attr.attr,
3c1ea5c5019ff19 Vlastimil Babka   2025-09-03  8782  	&sheaf_return_fast_attr.attr,
3c1ea5c5019ff19 Vlastimil Babka   2025-09-03  8783  	&sheaf_return_slow_attr.attr,
81819f0fc8285a2 Christoph Lameter 2007-05-06  8784  #endif
4c13dd3b48fcb6f Dmitry Monakhov   2010-02-26  8785  #ifdef CONFIG_FAILSLAB
4c13dd3b48fcb6f Dmitry Monakhov   2010-02-26  8786  	&failslab_attr.attr,
4c13dd3b48fcb6f Dmitry Monakhov   2010-02-26  8787  #endif
346907ceb9d11b9 Vlastimil Babka   2022-11-16  8788  #ifdef CONFIG_HARDENED_USERCOPY
8eb8284b4129061 David Windsor     2017-06-10  8789  	&usersize_attr.attr,
346907ceb9d11b9 Vlastimil Babka   2022-11-16  8790  #endif
b84e04f1baeebe6 Imran Khan        2022-08-15  8791  #ifdef CONFIG_KFENCE
b84e04f1baeebe6 Imran Khan        2022-08-15  8792  	&skip_kfence_attr.attr,
b84e04f1baeebe6 Imran Khan        2022-08-15  8793  #endif
4c13dd3b48fcb6f Dmitry Monakhov   2010-02-26  8794  
81819f0fc8285a2 Christoph Lameter 2007-05-06  8795  	NULL
81819f0fc8285a2 Christoph Lameter 2007-05-06  8796  };
81819f0fc8285a2 Christoph Lameter 2007-05-06  8797  

:::::: The code at line 8749 was first introduced by commit
:::::: 8ff12cfc009a2a38d87fa7058226fe197bb2696f SLUB: Support for performance statistics

:::::: TO: Christoph Lameter <clameter@sgi.com>
:::::: CC: Christoph Lameter <christoph@stapp.engr.sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
