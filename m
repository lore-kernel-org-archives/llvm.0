Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB6322A;
	Fri, 13 Mar 2026 00:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773360314; cv=none; b=Y2GQmn9WjjR634DOxebJi/NWQOZxIJGlKel+rUPLAFoCeKxiZgSbwOvF16fkcakKP0LtU5imBuINKqEEg7/8dXjprT/c8wwpFMoCi0bVKaZTjSZaWsXPHlOb4GYE7sQVyd50ZnP6wPNDO4LKT1+3n7HY/nU9JtEhi+i3tvQtXvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773360314; c=relaxed/simple;
	bh=ht25SO2lQR4RWDV6nO8iTTtQHwQDLSSYg1sx7xxuGu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MH4LGiuUt7JYXrhV1UqAhm8KuFDTK6qUOsloSCiOjIemvnHOC6IcUSC+CaA9GaLF8AXeTeZIo4uNhUzqB5AuEIK0IOSgEyCGMrXq5fqCSSoMSyIbS+jgVl2rtbXEVRV9dlqEmPUNwOMAob0w3tk3PzIkoCNHKzt/u9AVBImW9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoXP02Z4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoXP02Z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773360312; x=1804896312;
  h=date:from:to:cc:subject:message-id;
  bh=ht25SO2lQR4RWDV6nO8iTTtQHwQDLSSYg1sx7xxuGu4=;
  b=YoXP02Z4cjB2gWsf8YeikPrGx4RFrJoUO6Zc2wDx8mYwPD37R/hyH7ZX
   R0q3qyZXA2+RtTqNOEIaun8mx4995xKK6gXDSQDXsTbr1wwzApPqmkdTj
   N/7jyVw1n+AHyX57BB8LAZKJbVH+ljQGpFasZgUBw6jRCBMGxX9oQ3vp/
   3Vh64crbxkzz9afZtLIffeAihF5O2CtiMnPuPB579bnBkBThobc9b+4Am
   dAcFKf/1Rz25hcz0yJyNYwKtPSkkkzTAbxxR4eVjRxGWLjrAHKCgiYOOz
   Y8Jwz/qA4GL6qS+R2Izd1FogFBLPfgWXRRuuRNmJYofWziFU0T0Mm98+A
   w==;
X-CSE-ConnectionGUID: /YTXVC+6RY6u20v0Un29gQ==
X-CSE-MsgGUID: 4c3WEeTSSN+/JTebmMwCMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78319266"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="78319266"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:05:11 -0700
X-CSE-ConnectionGUID: grWrRY0uRu+YkCOpLlJ+sg==
X-CSE-MsgGUID: roLwFfzZROacqiApXr9gHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="217470327"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2026 17:05:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0q1b-000000003bR-0Ih0;
	Fri, 13 Mar 2026 00:05:07 +0000
Date: Fri, 13 Mar 2026 01:04:23 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 20/20]
 fs/netfs/buffered_read.c:317:9: warning: unused variable 'prepare_read'
Message-ID: <202603130055.0oM8Vetd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   95f1c009252ea97d0a39f9359b55d1d844f58f60
commit: 95f1c009252ea97d0a39f9359b55d1d844f58f60 [20/20] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/202603130055.0oM8Vetd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130055.0oM8Vetd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130055.0oM8Vetd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:317:9: warning: unused variable 'prepare_read' [-Wunused-variable]
     317 |                 int (*prepare_read)(struct netfs_io_subrequest *subreq) = NULL;
         |                       ^~~~~~~~~~~~
   1 warning generated.


vim +/prepare_read +317 fs/netfs/buffered_read.c

e2d46f2ec33253 David Howells  2024-12-16  286  
ee4cdf7ba857a8 David Howells  2024-07-02  287  /*
ee4cdf7ba857a8 David Howells  2024-07-02  288   * Perform a read to the pagecache from a series of sources of different types,
ee4cdf7ba857a8 David Howells  2024-07-02  289   * slicing up the region to be read according to available cache blocks and
ee4cdf7ba857a8 David Howells  2024-07-02  290   * network rsize.
ee4cdf7ba857a8 David Howells  2024-07-02  291   */
3dc00bca8dc822 Max Kellermann 2025-05-19  292  static void netfs_read_to_pagecache(struct netfs_io_request *rreq,
3dc00bca8dc822 Max Kellermann 2025-05-19  293  				    struct readahead_control *ractl)
ee4cdf7ba857a8 David Howells  2024-07-02  294  {
95f1c009252ea9 David Howells  2026-02-27  295  	struct netfs_buffered_read_context rctx = {
95f1c009252ea9 David Howells  2026-02-27  296  		.cache.query_from	= rreq->start,
95f1c009252ea9 David Howells  2026-02-27  297  		.cache.query_to		= rreq->start + rreq->len,
95f1c009252ea9 David Howells  2026-02-27  298  		.cache.cached_from[0]	= 0,
95f1c009252ea9 David Howells  2026-02-27  299  		.cache.cached_to[0]	= 0,
95f1c009252ea9 David Howells  2026-02-27  300  		.cache.cached_from[1]	= ULLONG_MAX,
95f1c009252ea9 David Howells  2026-02-27  301  		.cache.cached_to[1]	= ULLONG_MAX,
95f1c009252ea9 David Howells  2026-02-27  302  		.r.start		= rreq->start,
95f1c009252ea9 David Howells  2026-02-27  303  		.r.stop			= rreq->start + rreq->len,
95f1c009252ea9 David Howells  2026-02-27  304  		.i_size			= rreq->i_size,
95f1c009252ea9 David Howells  2026-02-27  305  		.ractl			= ractl,
c70d0172f416da David Howells  2026-03-05  306  	};
95f1c009252ea9 David Howells  2026-02-27  307  	struct fscache_occupancy *occ = &rctx.cache;
ee4cdf7ba857a8 David Howells  2024-07-02  308  	struct netfs_inode *ictx = netfs_inode(rreq->inode);
ee4cdf7ba857a8 David Howells  2024-07-02  309  	int ret = 0;
7e043a80b5dae5 David Howells  2022-11-03  310  
4aa8bd77ee671d David Howells  2026-02-28  311  	_enter("R=%08x", rreq->debug_id);
4aa8bd77ee671d David Howells  2026-02-28  312  
95f1c009252ea9 David Howells  2026-02-27  313  	bvecq_pos_attach(&rctx.dispatch_cursor, &rreq->load_cursor);
95f1c009252ea9 David Howells  2026-02-27  314  	bvecq_pos_attach(&rreq->collect_cursor, &rctx.dispatch_cursor);
4aa8bd77ee671d David Howells  2026-02-28  315  
ee4cdf7ba857a8 David Howells  2024-07-02  316  	do {
c70d0172f416da David Howells  2026-03-05 @317  		int (*prepare_read)(struct netfs_io_subrequest *subreq) = NULL;
ee4cdf7ba857a8 David Howells  2024-07-02  318  		struct netfs_io_subrequest *subreq;
c70d0172f416da David Howells  2026-03-05  319  		unsigned long long hole_to, cache_to;
5e51c627c5acbc David Howells  2022-11-04  320  
c70d0172f416da David Howells  2026-03-05  321  		/* If we don't have any, find out the next couple of data
c70d0172f416da David Howells  2026-03-05  322  		 * extents from the cache, containing of following the
c70d0172f416da David Howells  2026-03-05  323  		 * specified start offset.  Holes have to be fetched from the
c70d0172f416da David Howells  2026-03-05  324  		 * server; data regions from the cache.
c70d0172f416da David Howells  2026-03-05  325  		 */
c70d0172f416da David Howells  2026-03-05  326  		hole_to = occ->cached_from[0];
c70d0172f416da David Howells  2026-03-05  327  		cache_to = occ->cached_to[0];
95f1c009252ea9 David Howells  2026-02-27  328  		if (rctx.r.start >= cache_to) {
c70d0172f416da David Howells  2026-03-05  329  			/* Extent exhausted; shuffle down. */
c70d0172f416da David Howells  2026-03-05  330  			int i;
c70d0172f416da David Howells  2026-03-05  331  
c70d0172f416da David Howells  2026-03-05  332  			for (i = 0; i < ARRAY_SIZE(occ->cached_from) - 1; i++) {
c70d0172f416da David Howells  2026-03-05  333  				occ->cached_from[i] = occ->cached_from[i + 1];
c70d0172f416da David Howells  2026-03-05  334  				occ->cached_to[i]   = occ->cached_to[i + 1];
c70d0172f416da David Howells  2026-03-05  335  				occ->cached_type[i] = occ->cached_type[i + 1];
c70d0172f416da David Howells  2026-03-05  336  			}
c70d0172f416da David Howells  2026-03-05  337  			occ->cached_from[i] = ULLONG_MAX;
c70d0172f416da David Howells  2026-03-05  338  			occ->cached_to[i]   = ULLONG_MAX;
c70d0172f416da David Howells  2026-03-05  339  
c70d0172f416da David Howells  2026-03-05  340  			if (occ->cached_from[0] != ULLONG_MAX)
c70d0172f416da David Howells  2026-03-05  341  				continue;
c70d0172f416da David Howells  2026-03-05  342  
c70d0172f416da David Howells  2026-03-05  343  			/* Get new extents */
c70d0172f416da David Howells  2026-03-05  344  			ret = netfs_read_query_cache(rreq, occ);
c70d0172f416da David Howells  2026-03-05  345  			if (ret < 0)
c70d0172f416da David Howells  2026-03-05  346  				break;
c70d0172f416da David Howells  2026-03-05  347  			continue;
c70d0172f416da David Howells  2026-03-05  348  		}
c70d0172f416da David Howells  2026-03-05  349  
c70d0172f416da David Howells  2026-03-05  350  		_debug("rsub %llx %llx-%llx", subreq->start, hole_to, cache_to);
c70d0172f416da David Howells  2026-03-05  351  
ee4cdf7ba857a8 David Howells  2024-07-02  352  		subreq = netfs_alloc_subrequest(rreq);
16211268fcb366 David Howells  2022-03-01  353  		if (!subreq) {
ee4cdf7ba857a8 David Howells  2024-07-02  354  			ret = -ENOMEM;
16211268fcb366 David Howells  2022-03-01  355  			break;
16211268fcb366 David Howells  2022-03-01  356  		}
7b589a9b45ae32 David Howells  2024-08-07  357  
95f1c009252ea9 David Howells  2026-02-27  358  		subreq->start = rctx.r.start;
95f1c009252ea9 David Howells  2026-02-27  359  
95f1c009252ea9 David Howells  2026-02-27  360  		_debug("rsub %llx %llx-%llx", subreq->start, hole_to, cache_to);
ee4cdf7ba857a8 David Howells  2024-07-02  361  
95f1c009252ea9 David Howells  2026-02-27  362  		if (rctx.r.start >= hole_to && rctx.r.start < cache_to) {
c70d0172f416da David Howells  2026-03-05  363  			/* Overlap with a cached region, where the cache may
c70d0172f416da David Howells  2026-03-05  364  			 * record a block of zeroes.
c70d0172f416da David Howells  2026-03-05  365  			 */
95f1c009252ea9 David Howells  2026-02-27  366  			_debug("cached s=%llx c=%llx l=%llx",
95f1c009252ea9 David Howells  2026-02-27  367  			       rctx.r.start, cache_to, rctx.r.stop - rctx.r.start);
95f1c009252ea9 David Howells  2026-02-27  368  			subreq->len = umin(cache_to - rctx.r.start, rctx.r.stop - rctx.r.start);
c70d0172f416da David Howells  2026-03-05  369  			subreq->len = round_up(subreq->len, occ->granularity);
c70d0172f416da David Howells  2026-03-05  370  			if (occ->cached_type[0] == FSCACHE_EXTENT_ZERO) {
c70d0172f416da David Howells  2026-03-05  371  				subreq->source = NETFS_FILL_WITH_ZEROES;
c70d0172f416da David Howells  2026-03-05  372  				netfs_stat(&netfs_n_rh_zero);
c70d0172f416da David Howells  2026-03-05  373  			} else {
c70d0172f416da David Howells  2026-03-05  374  				subreq->source = NETFS_READ_FROM_CACHE;
16211268fcb366 David Howells  2022-03-01  375  			}
95f1c009252ea9 David Howells  2026-02-27  376  		} else if (subreq->start >= ictx->zero_point &&
95f1c009252ea9 David Howells  2026-02-27  377  			   subreq->start < rctx.r.stop) {
c70d0172f416da David Howells  2026-03-05  378  			/* If this range lies beyond the zero-point, that part
c70d0172f416da David Howells  2026-03-05  379  			 * can just be cleared locally.
c70d0172f416da David Howells  2026-03-05  380  			 */
95f1c009252ea9 David Howells  2026-02-27  381  			_debug("zero %llx-%llx", rctx.r.start, rctx.r.stop);
95f1c009252ea9 David Howells  2026-02-27  382  			subreq->len = rctx.r.stop - rctx.r.start;
c70d0172f416da David Howells  2026-03-05  383  			subreq->source = NETFS_FILL_WITH_ZEROES;
c70d0172f416da David Howells  2026-03-05  384  			if (rreq->cache_resources.ops)
c70d0172f416da David Howells  2026-03-05  385  				__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
c70d0172f416da David Howells  2026-03-05  386  			netfs_stat(&netfs_n_rh_zero);
c70d0172f416da David Howells  2026-03-05  387  		} else {
c70d0172f416da David Howells  2026-03-05  388  			/* Read a cache hole from the server.  If any part of
c70d0172f416da David Howells  2026-03-05  389  			 * this range lies beyond the zero-point or the EOF,
c70d0172f416da David Howells  2026-03-05  390  			 * that part can just be cleared locally.
c70d0172f416da David Howells  2026-03-05  391  			 */
95f1c009252ea9 David Howells  2026-02-27  392  			unsigned long long zlimit = umin(rctx.i_size, ictx->zero_point);
95f1c009252ea9 David Howells  2026-02-27  393  			unsigned long long limit = min3(zlimit, rctx.r.stop, hole_to);
c70d0172f416da David Howells  2026-03-05  394  
95f1c009252ea9 David Howells  2026-02-27  395  			_debug("limit %llx %llx", rctx.i_size, ictx->zero_point);
95f1c009252ea9 David Howells  2026-02-27  396  			_debug("download %llx-%llx", rctx.r.start, rctx.r.stop);
c70d0172f416da David Howells  2026-03-05  397  			subreq->len = umin(limit - subreq->start, ULONG_MAX);
c70d0172f416da David Howells  2026-03-05  398  			subreq->source = NETFS_DOWNLOAD_FROM_SERVER;
95f1c009252ea9 David Howells  2026-02-27  399  			if (rreq->cache_resources.ops)
95f1c009252ea9 David Howells  2026-02-27  400  				__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
95f1c009252ea9 David Howells  2026-02-27  401  			netfs_stat(&netfs_n_rh_download);
c70d0172f416da David Howells  2026-03-05  402  		}
c70d0172f416da David Howells  2026-03-05  403  
95f1c009252ea9 David Howells  2026-02-27  404  		if (subreq->len == 0) {
95f1c009252ea9 David Howells  2026-02-27  405  			pr_err("ZERO-LEN READ: R=%08x[%x] l=%zx/%llx s=%llx z=%llx i=%llx",
ee4cdf7ba857a8 David Howells  2024-07-02  406  			       rreq->debug_id, subreq->debug_index,
95f1c009252ea9 David Howells  2026-02-27  407  			       subreq->len, rctx.r.stop - subreq->start,
ee4cdf7ba857a8 David Howells  2024-07-02  408  			       subreq->start, ictx->zero_point, rreq->i_size);
16211268fcb366 David Howells  2022-03-01  409  			break;
16211268fcb366 David Howells  2022-03-01  410  		}
16211268fcb366 David Howells  2022-03-01  411  
95f1c009252ea9 David Howells  2026-02-27  412  		ret = netfs_issue_read(rreq, subreq, &rctx);
95f1c009252ea9 David Howells  2026-02-27  413  		if (ret != 0 && ret != -EIOCBQUEUED) {
105549d09a539a David Howells  2024-12-13  414  			subreq->error = ret;
e2d46f2ec33253 David Howells  2024-12-16  415  			trace_netfs_sreq(subreq, netfs_sreq_trace_cancel);
e2d46f2ec33253 David Howells  2024-12-16  416  			/* Not queued - release both refs. */
20d72b00ca814d David Howells  2025-05-19  417  			netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
20d72b00ca814d David Howells  2025-05-19  418  			netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
105549d09a539a David Howells  2024-12-13  419  			break;
e2d46f2ec33253 David Howells  2024-12-16  420  		}
95f1c009252ea9 David Howells  2026-02-27  421  		ret = 0;
e2d46f2ec33253 David Howells  2024-12-16  422  
ee4cdf7ba857a8 David Howells  2024-07-02  423  		cond_resched();
95f1c009252ea9 David Howells  2026-02-27  424  	} while (rctx.r.start < rctx.r.stop);
ee4cdf7ba857a8 David Howells  2024-07-02  425  
95f1c009252ea9 David Howells  2026-02-27  426  	if (unlikely(rctx.r.start < rctx.r.stop)) {
e2d46f2ec33253 David Howells  2024-12-16  427  		smp_wmb(); /* Write lists before ALL_QUEUED. */
e2d46f2ec33253 David Howells  2024-12-16  428  		set_bit(NETFS_RREQ_ALL_QUEUED, &rreq->flags);
2b1424cd131cfa David Howells  2025-05-19  429  		netfs_wake_collector(rreq);
e2d46f2ec33253 David Howells  2024-12-16  430  	}
ee4cdf7ba857a8 David Howells  2024-07-02  431  
ee4cdf7ba857a8 David Howells  2024-07-02  432  	/* Defer error return as we may need to wait for outstanding I/O. */
ee4cdf7ba857a8 David Howells  2024-07-02  433  	cmpxchg(&rreq->error, 0, ret);
4aa8bd77ee671d David Howells  2026-02-28  434  
4aa8bd77ee671d David Howells  2026-02-28  435  	bvecq_pos_detach(&rreq->load_cursor);
95f1c009252ea9 David Howells  2026-02-27  436  	bvecq_pos_detach(&rctx.dispatch_cursor);
16211268fcb366 David Howells  2022-03-01  437  }
16211268fcb366 David Howells  2022-03-01  438  

:::::: The code at line 317 was first introduced by commit
:::::: c70d0172f416da0487589fc435320384cbd691e3 cachefiles: Improve cache read performance by up to 3x for most use cases

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
