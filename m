Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40119248861;
	Sat,  2 May 2026 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745770; cv=none; b=uBoUyu7t2QYXtEBVLPCFDxIY7wC+XWTJctjsR48QdfBLbNzDx3opO/jdf6zk86CDkEUEPdWW233POct2sfaNKM5hu5kPOs5ywgn8ceJNzIao5d5ruxLDrx1eQk5PZY+zRWwR5mM1sy1FqCoiboRTCZun/MRmz6B8uZ2QdV74M2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745770; c=relaxed/simple;
	bh=IEGEhWuCphmAsh75hmIDuPEJ4p/7PNh9hHcZmpRt7Rw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FKBGnxqW306Y+xBWvI+7TViZ2zHU8OFjLf0b4AKzv0l2E9I1eQFUk/Lpou5kqYbMYYUKSVvcBWrpMAnY7DN7GzvaKelV2UE8RM98La88Aowj0MzmeFWVxm5NUIpGhl2e6jiYMQWVK31DD8EaMovKjAfKTc7a5B8/sN4D0c0FsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XM7AyU2c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XM7AyU2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777745768; x=1809281768;
  h=date:from:to:cc:subject:message-id;
  bh=IEGEhWuCphmAsh75hmIDuPEJ4p/7PNh9hHcZmpRt7Rw=;
  b=XM7AyU2cC1m2CIoivNp4NoUl2+B3Owvl23xc/aMbc/uvziyq+za+/VUM
   Og8bhNP5Noc9qfiO3hNbGx4pa7+hT0Hxa5Vori3nNr95VLsUsH2lQDslo
   pJu/qIXy/te68GLap6+MHD5MyMJuQdBuPc/8HH6IRfCFl60H31KPPMqSA
   rgnbZ6l5c4KBMLXqtWSDvlpkcM0uPEgIcCHcvIrZtsQeiT54/dDw0A32U
   JUBh61WZqXMPCkZfeAaiVwbErf6PDoFhTzmBwDbmp22zXnlx40gSeWFz3
   ZlAcJQYfW7bqWTPfOS6UuGE9k3JzuAM09kzue2rsXGmUKRaguxI2bnLU5
   w==;
X-CSE-ConnectionGUID: 8xfhyFm/Tiu8ryxoRCwedA==
X-CSE-MsgGUID: VvSli0dpSkeZa886I67KMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78723198"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="78723198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 11:16:07 -0700
X-CSE-ConnectionGUID: hWeJuCWASKGXNbXtiMctaA==
X-CSE-MsgGUID: lhYwjuc7QIWa8WhilYelbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="258492272"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 11:16:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJEsl-000000005Kf-3QkY;
	Sat, 02 May 2026 18:16:03 +0000
Date: Sat, 02 May 2026 20:15:07 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 55/68]
 fs/netfs/buffered_read.c:351:42: warning: variable 'subreq' is uninitialized
 when used here
Message-ID: <202605022023.FoK0XOXN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   390dd59a3747b71c4dcff11b2cc5240385cbfedf
commit: 7693c7841ea1917c01c8cb6ae171070f4b69102b [55/68] netfs: Set subrequest->source at alloc before trace emission
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260502/202605022023.FoK0XOXN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022023.FoK0XOXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605022023.FoK0XOXN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:351:42: warning: variable 'subreq' is uninitialized when used here [-Wuninitialized]
     351 |                                 __set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
         |                                                                      ^~~~~~
   include/linux/bitops.h:53:52: note: expanded from macro '__set_bit'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                                               ^~~~
   include/linux/bitops.h:44:37: note: expanded from macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   fs/netfs/buffered_read.c:273:37: note: initialize the variable 'subreq' to silence this warning
     273 |                 struct netfs_io_subrequest *subreq;
         |                                                   ^
         |                                                    = NULL
   1 warning generated.


vim +/subreq +351 fs/netfs/buffered_read.c

e2d46f2ec33253 David Howells 2024-12-16  247  
ee4cdf7ba857a8 David Howells 2024-07-02  248  /*
ee4cdf7ba857a8 David Howells 2024-07-02  249   * Perform a read to the pagecache from a series of sources of different types,
ee4cdf7ba857a8 David Howells 2024-07-02  250   * slicing up the region to be read according to available cache blocks and
ee4cdf7ba857a8 David Howells 2024-07-02  251   * network rsize.
ee4cdf7ba857a8 David Howells 2024-07-02  252   */
5454216af502c6 David Howells 2026-03-13  253  static void netfs_read_to_pagecache(struct netfs_io_request *rreq)
ee4cdf7ba857a8 David Howells 2024-07-02  254  {
4cbdfd0da8d2d5 David Howells 2026-04-09  255  	struct fscache_occupancy _occ = {
4cbdfd0da8d2d5 David Howells 2026-04-09  256  		.query_from	= rreq->start,
4cbdfd0da8d2d5 David Howells 2026-04-09  257  		.query_to	= rreq->start + rreq->len,
4cbdfd0da8d2d5 David Howells 2026-04-09  258  		.cached_from[0]	= 0,
4cbdfd0da8d2d5 David Howells 2026-04-09  259  		.cached_to[0]	= 0,
4cbdfd0da8d2d5 David Howells 2026-04-09  260  		.cached_from[1]	= ULLONG_MAX,
4cbdfd0da8d2d5 David Howells 2026-04-09  261  		.cached_to[1]	= ULLONG_MAX,
4cbdfd0da8d2d5 David Howells 2026-04-09  262  	};
4cbdfd0da8d2d5 David Howells 2026-04-09  263  	struct fscache_occupancy *occ = &_occ;
e192187e9d3cdb David Howells 2026-04-09  264  	struct netfs_io_stream *stream = &rreq->io_streams[0];
ee4cdf7ba857a8 David Howells 2024-07-02  265  	int ret = 0;
7e043a80b5dae5 David Howells 2022-11-03  266  
615fc17c41427e David Howells 2026-04-09  267  	_enter("R=%08x", rreq->debug_id);
615fc17c41427e David Howells 2026-04-09  268  
e192187e9d3cdb David Howells 2026-04-09  269  	bvecq_pos_set(&stream->dispatch_cursor, &rreq->load_cursor);
e192187e9d3cdb David Howells 2026-04-09  270  	bvecq_pos_set(&rreq->collect_cursor, &rreq->load_cursor);
615fc17c41427e David Howells 2026-04-09  271  
ee4cdf7ba857a8 David Howells 2024-07-02  272  	do {
ee4cdf7ba857a8 David Howells 2024-07-02  273  		struct netfs_io_subrequest *subreq;
7693c7841ea191 David Howells 2026-03-19  274  		enum netfs_io_source source;
7693c7841ea191 David Howells 2026-03-19  275  		unsigned long long hole_to, cache_to, start, stop;
7693c7841ea191 David Howells 2026-03-19  276  		size_t len;
7693c7841ea191 David Howells 2026-03-19  277  		bool copy;
5e51c627c5acbc David Howells 2022-11-04  278  
4cbdfd0da8d2d5 David Howells 2026-04-09  279  		/* If we don't have any, find out the next couple of data
4cbdfd0da8d2d5 David Howells 2026-04-09  280  		 * extents from the cache, containing of following the
4cbdfd0da8d2d5 David Howells 2026-04-09  281  		 * specified start offset.  Holes have to be fetched from the
4cbdfd0da8d2d5 David Howells 2026-04-09  282  		 * server; data regions from the cache.
4cbdfd0da8d2d5 David Howells 2026-04-09  283  		 */
4cbdfd0da8d2d5 David Howells 2026-04-09  284  		hole_to = occ->cached_from[0];
4cbdfd0da8d2d5 David Howells 2026-04-09  285  		cache_to = occ->cached_to[0];
e192187e9d3cdb David Howells 2026-04-09  286  		if (stream->issue_from >= cache_to) {
4cbdfd0da8d2d5 David Howells 2026-04-09  287  			/* Extent exhausted; shuffle down. */
4cbdfd0da8d2d5 David Howells 2026-04-09  288  			int i;
4cbdfd0da8d2d5 David Howells 2026-04-09  289  
4cbdfd0da8d2d5 David Howells 2026-04-09  290  			for (i = 0; i < ARRAY_SIZE(occ->cached_from) - 1; i++) {
4cbdfd0da8d2d5 David Howells 2026-04-09  291  				occ->cached_from[i] = occ->cached_from[i + 1];
4cbdfd0da8d2d5 David Howells 2026-04-09  292  				occ->cached_to[i]   = occ->cached_to[i + 1];
4cbdfd0da8d2d5 David Howells 2026-04-09  293  				occ->cached_type[i] = occ->cached_type[i + 1];
4cbdfd0da8d2d5 David Howells 2026-04-09  294  			}
4cbdfd0da8d2d5 David Howells 2026-04-09  295  			occ->cached_from[i] = ULLONG_MAX;
4cbdfd0da8d2d5 David Howells 2026-04-09  296  			occ->cached_to[i]   = ULLONG_MAX;
4cbdfd0da8d2d5 David Howells 2026-04-09  297  
4cbdfd0da8d2d5 David Howells 2026-04-09  298  			if (occ->cached_from[0] != ULLONG_MAX)
4cbdfd0da8d2d5 David Howells 2026-04-09  299  				continue;
4cbdfd0da8d2d5 David Howells 2026-04-09  300  
4cbdfd0da8d2d5 David Howells 2026-04-09  301  			/* Get new extents */
e192187e9d3cdb David Howells 2026-04-09  302  			netfs_read_query_cache(rreq, occ);
4cbdfd0da8d2d5 David Howells 2026-04-09  303  			continue;
4cbdfd0da8d2d5 David Howells 2026-04-09  304  		}
4cbdfd0da8d2d5 David Howells 2026-04-09  305  
7693c7841ea191 David Howells 2026-03-19  306  		start = stream->issue_from;
e192187e9d3cdb David Howells 2026-04-09  307  		stop = stream->issue_from + stream->buffered;
4986700e02d674 David Howells 2026-04-27  308  
09f608d47661d0 David Howells 2026-04-20  309  		unsigned long long zero_point = netfs_read_zero_point(rreq->inode);
4cbdfd0da8d2d5 David Howells 2026-04-09  310  		unsigned long long zlimit = umin(zero_point, rreq->i_size);
4cbdfd0da8d2d5 David Howells 2026-04-09  311  
7693c7841ea191 David Howells 2026-03-19  312  		_debug("rsub %llx %llx-%llx", start, hole_to, cache_to);
4cbdfd0da8d2d5 David Howells 2026-04-09  313  
e192187e9d3cdb David Howells 2026-04-09  314  		if (stream->issue_from >= hole_to && stream->issue_from < cache_to) {
4cbdfd0da8d2d5 David Howells 2026-04-09  315  			/* Overlap with a cached region, where the cache may
4cbdfd0da8d2d5 David Howells 2026-04-09  316  			 * record a block of zeroes.
4cbdfd0da8d2d5 David Howells 2026-04-09  317  			 */
e192187e9d3cdb David Howells 2026-04-09  318  			_debug("cached s=%llx c=%llx l=%zx",
e192187e9d3cdb David Howells 2026-04-09  319  			       stream->issue_from, cache_to, stream->buffered);
7693c7841ea191 David Howells 2026-03-19  320  			len = umin(cache_to - stream->issue_from, stream->buffered);
7693c7841ea191 David Howells 2026-03-19  321  			len = round_up(len, occ->granularity);
4cbdfd0da8d2d5 David Howells 2026-04-09  322  			if (occ->cached_type[0] == FSCACHE_EXTENT_ZERO) {
7693c7841ea191 David Howells 2026-03-19  323  				source = NETFS_FILL_WITH_ZEROES;
4cbdfd0da8d2d5 David Howells 2026-04-09  324  				netfs_stat(&netfs_n_rh_zero);
4cbdfd0da8d2d5 David Howells 2026-04-09  325  			} else {
7693c7841ea191 David Howells 2026-03-19  326  				source = NETFS_READ_FROM_CACHE;
16211268fcb366 David Howells 2022-03-01  327  			}
7693c7841ea191 David Howells 2026-03-19  328  		} else if (start >= zlimit &&
7693c7841ea191 David Howells 2026-03-19  329  			   start < stop) {
4cbdfd0da8d2d5 David Howells 2026-04-09  330  			/* If this range lies beyond the zero-point, that part
4cbdfd0da8d2d5 David Howells 2026-04-09  331  			 * can just be cleared locally.
4cbdfd0da8d2d5 David Howells 2026-04-09  332  			 */
7693c7841ea191 David Howells 2026-03-19  333  			_debug("zero %llx-%llx", start, stop);
7693c7841ea191 David Howells 2026-03-19  334  			len = stream->buffered;
7693c7841ea191 David Howells 2026-03-19  335  			source = NETFS_FILL_WITH_ZEROES;
4cbdfd0da8d2d5 David Howells 2026-04-09  336  			if (rreq->cache_resources.ops)
7693c7841ea191 David Howells 2026-03-19  337  				copy = true;
4cbdfd0da8d2d5 David Howells 2026-04-09  338  			netfs_stat(&netfs_n_rh_zero);
4cbdfd0da8d2d5 David Howells 2026-04-09  339  		} else {
4cbdfd0da8d2d5 David Howells 2026-04-09  340  			/* Read a cache hole from the server.  If any part of
4cbdfd0da8d2d5 David Howells 2026-04-09  341  			 * this range lies beyond the zero-point or the EOF,
4cbdfd0da8d2d5 David Howells 2026-04-09  342  			 * that part can just be cleared locally.
4cbdfd0da8d2d5 David Howells 2026-04-09  343  			 */
e192187e9d3cdb David Howells 2026-04-09  344  			unsigned long long limit = min3(zlimit, stop, hole_to);
4cbdfd0da8d2d5 David Howells 2026-04-09  345  
4cbdfd0da8d2d5 David Howells 2026-04-09  346  			_debug("limit %llx %llx", rreq->i_size, zero_point);
7693c7841ea191 David Howells 2026-03-19  347  			_debug("download %llx-%llx", start, stop);
7693c7841ea191 David Howells 2026-03-19  348  			len = umin(limit - start, ULONG_MAX);
7693c7841ea191 David Howells 2026-03-19  349  			source = NETFS_DOWNLOAD_FROM_SERVER;
4cbdfd0da8d2d5 David Howells 2026-04-09  350  			if (rreq->cache_resources.ops)
4cbdfd0da8d2d5 David Howells 2026-04-09 @351  				__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
4cbdfd0da8d2d5 David Howells 2026-04-09  352  			netfs_stat(&netfs_n_rh_download);
4cbdfd0da8d2d5 David Howells 2026-04-09  353  		}
4cbdfd0da8d2d5 David Howells 2026-04-09  354  
7693c7841ea191 David Howells 2026-03-19  355  		if (len == 0) {
7693c7841ea191 David Howells 2026-03-19  356  			pr_err("ZERO-LEN READ: R=%08x l=%zx/%zx s=%llx z=%llx i=%llx",
7693c7841ea191 David Howells 2026-03-19  357  			       rreq->debug_id, len, stream->buffered,
7693c7841ea191 David Howells 2026-03-19  358  			       start, zero_point, rreq->i_size);
16211268fcb366 David Howells 2022-03-01  359  			break;
16211268fcb366 David Howells 2022-03-01  360  		}
16211268fcb366 David Howells 2022-03-01  361  
7693c7841ea191 David Howells 2026-03-19  362  		subreq = netfs_alloc_read_subrequest(rreq, source);
7693c7841ea191 David Howells 2026-03-19  363  		if (!subreq) {
7693c7841ea191 David Howells 2026-03-19  364  			ret = -ENOMEM;
7693c7841ea191 David Howells 2026-03-19  365  			break;
7693c7841ea191 David Howells 2026-03-19  366  		}
7693c7841ea191 David Howells 2026-03-19  367  
7693c7841ea191 David Howells 2026-03-19  368  		subreq->start = start;
7693c7841ea191 David Howells 2026-03-19  369  		subreq->len   = len;
7693c7841ea191 David Howells 2026-03-19  370  		if (copy)
7693c7841ea191 David Howells 2026-03-19  371  			__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
7693c7841ea191 David Howells 2026-03-19  372  
e2d46f2ec33253 David Howells 2024-12-16  373  		netfs_issue_read(rreq, subreq);
5454216af502c6 David Howells 2026-03-13  374  		netfs_maybe_bulk_drop_ra_refs(rreq);
6b43bbe7fa2c53 David Howells 2026-04-27  375  
6b43bbe7fa2c53 David Howells 2026-04-27  376  		if (test_bit(NETFS_RREQ_PAUSE, &rreq->flags))
6b43bbe7fa2c53 David Howells 2026-04-27  377  			netfs_wait_for_paused_read(rreq);
6b43bbe7fa2c53 David Howells 2026-04-27  378  		if (test_bit(NETFS_RREQ_FAILED, &rreq->flags))
6b43bbe7fa2c53 David Howells 2026-04-27  379  			break;
ee4cdf7ba857a8 David Howells 2024-07-02  380  		cond_resched();
e192187e9d3cdb David Howells 2026-04-09  381  	} while (stream->buffered > 0);
ee4cdf7ba857a8 David Howells 2024-07-02  382  
e192187e9d3cdb David Howells 2026-04-09  383  	if (unlikely(!netfs_are_all_subreqs_queued(rreq))) {
e192187e9d3cdb David Howells 2026-04-09  384  		netfs_all_subreqs_queued(rreq);
2b1424cd131cfa David Howells 2025-05-19  385  		netfs_wake_collector(rreq);
e2d46f2ec33253 David Howells 2024-12-16  386  	}
ee4cdf7ba857a8 David Howells 2024-07-02  387  
ee4cdf7ba857a8 David Howells 2024-07-02  388  	/* Defer error return as we may need to wait for outstanding I/O. */
e192187e9d3cdb David Howells 2026-04-09  389  	if (ret < 0)
ee4cdf7ba857a8 David Howells 2024-07-02  390  		cmpxchg(&rreq->error, 0, ret);
615fc17c41427e David Howells 2026-04-09  391  
615fc17c41427e David Howells 2026-04-09  392  	bvecq_pos_unset(&rreq->load_cursor);
e192187e9d3cdb David Howells 2026-04-09  393  	bvecq_pos_unset(&stream->dispatch_cursor);
16211268fcb366 David Howells 2022-03-01  394  }
16211268fcb366 David Howells 2022-03-01  395  

:::::: The code at line 351 was first introduced by commit
:::::: 4cbdfd0da8d2d5220304b2df6260465f6cc50c7c cachefiles: Don't rely on backing fs storage map for most use cases

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
