Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3D32A3E5;
	Mon, 16 Mar 2026 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650027; cv=none; b=hd0lxvWFJ2bwLihZjx2e1SL7Q/9G2ntUiee2ON0oBIVobZIWvBsqLdcScapAzr3vkD6QeFnK4IsoM30a/y2/tJlFh0QYa4nmnDQqYtkss9R2+FtQIZNvvRQGke9ozZ2ct75SuZ2+JO3lZsGmoR2Zon/tRkd8S+Fxxxl56SgkPQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650027; c=relaxed/simple;
	bh=2no+8sqMIKA9HVStK3DG/TvGQBX/P6qHIPFbQ+zKvEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qrEdqMVYeIRl49wbt/yIkJsh5TDmW96k4vdY0vXQatQ+sMMF7Y2H3TH17U4HAs+7oJs9e7rW7eipuOBShH5+bEFYxFAjqOE2kOL3GrtuYutEV5ic7sWkNt5dD9CyWd1cC/vh2Ah1yhNh8IQ+SqKFZl0yjyik59ea4Z+wCrGIJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jup23EFV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jup23EFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773650026; x=1805186026;
  h=date:from:to:cc:subject:message-id;
  bh=2no+8sqMIKA9HVStK3DG/TvGQBX/P6qHIPFbQ+zKvEQ=;
  b=Jup23EFVQlLPPQGEGw9g+dHX27Ksib8Ud5oyICpYAnpTd/oxWJiymSU4
   EYusIYU0Ai5zRTcQ6kHFul7GQ5unCcfBbdVgz2VXt+poExChVDSl5TeL4
   4f2ggsrfcQqOs5u0DTmhd4RM7m10F84D37u5ih+ahYXprzZjJF0TKMKre
   7182jxeXrazUMY+s18dwcttj7+Fjye/SnvTcyHCP36DVtY/rkt9JEsxxw
   qQZG0JtKBI2Gx+ZFqa8L4VBJhSzoqPz2vHskxXUw4mhdbLArSeV6CNLyc
   HOeUCJav0BGhw8iyCl6144i5NxsxLLEs57qa8l1jzLoPs8mXafI8tcWJJ
   Q==;
X-CSE-ConnectionGUID: 3P2oehvYQ+KU4gVJJI9BlA==
X-CSE-MsgGUID: 8LNeS5W7R2iYeIReUHCQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="62227362"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="62227362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 01:33:45 -0700
X-CSE-ConnectionGUID: CX5lM8PQRMSqvma90fhWVA==
X-CSE-MsgGUID: 5Awsk04tQB23EmrHwfg+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="226838938"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Mar 2026 01:33:43 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w23OO-000000000N4-1yba;
	Mon, 16 Mar 2026 08:33:40 +0000
Date: Mon, 16 Mar 2026 16:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 5/25]
 fs/netfs/buffered_read.c:265:33: warning: variable 'subreq' is uninitialized
 when used here
Message-ID: <202603161650.MilYL5vF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   1aea2bfdfc039b008ff97eec23c755b5ac4b25a4
commit: 2b18c605a01d2114e02620507c1932f210bb7ea9 [5/25] cachefiles: Improve cache read performance by up to 3x for most use cases
config: arm64-randconfig-003-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161650.MilYL5vF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161650.MilYL5vF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161650.MilYL5vF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/buffered_read.c:363:1: warning: unused label 'stop' [-Wunused-label]
     363 | stop:
         | ^~~~~
>> fs/netfs/buffered_read.c:265:33: warning: variable 'subreq' is uninitialized when used here [-Wuninitialized]
     265 |                 _debug("rsub %llx %llx-%llx", subreq->start, hole_to, cache_to);
         |                                               ^~~~~~
   fs/netfs/buffered_read.c:232:37: note: initialize the variable 'subreq' to silence this warning
     232 |                 struct netfs_io_subrequest *subreq;
         |                                                   ^
         |                                                    = NULL
   2 warnings generated.
--
>> fs/cachefiles/io.c:759:55: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     759 |                 trace_cachefiles_io_error(object, file_inode(file), ret,
         |                                                                     ^~~
   fs/cachefiles/io.c:751:9: note: initialize the variable 'ret' to silence this warning
     751 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/subreq +265 fs/netfs/buffered_read.c

   207	
   208	/*
   209	 * Perform a read to the pagecache from a series of sources of different types,
   210	 * slicing up the region to be read according to available cache blocks and
   211	 * network rsize.
   212	 */
   213	static void netfs_read_to_pagecache(struct netfs_io_request *rreq,
   214					    struct readahead_control *ractl)
   215	{
   216		struct fscache_occupancy _occ = {
   217			.query_from	= rreq->start,
   218			.query_to	= rreq->start + rreq->len,
   219			.cached_from[0]	= 0,
   220			.cached_to[0]	= 0,
   221			.cached_from[1]	= ULLONG_MAX,
   222			.cached_to[1]	= ULLONG_MAX,
   223		};
   224		struct fscache_occupancy *occ = &_occ;
   225		struct netfs_inode *ictx = netfs_inode(rreq->inode);
   226		unsigned long long start = rreq->start;
   227		ssize_t size = rreq->len;
   228		int ret = 0;
   229	
   230		do {
   231			int (*prepare_read)(struct netfs_io_subrequest *subreq) = NULL;
   232			struct netfs_io_subrequest *subreq;
   233			unsigned long long hole_to, cache_to;
   234			ssize_t slice;
   235	
   236			/* If we don't have any, find out the next couple of data
   237			 * extents from the cache, containing of following the
   238			 * specified start offset.  Holes have to be fetched from the
   239			 * server; data regions from the cache.
   240			 */
   241			hole_to = occ->cached_from[0];
   242			cache_to = occ->cached_to[0];
   243			if (start >= cache_to) {
   244				/* Extent exhausted; shuffle down. */
   245				int i;
   246	
   247				for (i = 0; i < ARRAY_SIZE(occ->cached_from) - 1; i++) {
   248					occ->cached_from[i] = occ->cached_from[i + 1];
   249					occ->cached_to[i]   = occ->cached_to[i + 1];
   250					occ->cached_type[i] = occ->cached_type[i + 1];
   251				}
   252				occ->cached_from[i] = ULLONG_MAX;
   253				occ->cached_to[i]   = ULLONG_MAX;
   254	
   255				if (occ->cached_from[0] != ULLONG_MAX)
   256					continue;
   257	
   258				/* Get new extents */
   259				ret = netfs_read_query_cache(rreq, occ);
   260				if (ret < 0)
   261					break;
   262				continue;
   263			}
   264	
 > 265			_debug("rsub %llx %llx-%llx", subreq->start, hole_to, cache_to);
   266	
   267			subreq = netfs_alloc_subrequest(rreq);
   268			if (!subreq) {
   269				ret = -ENOMEM;
   270				break;
   271			}
   272	
   273			subreq->start	= start;
   274			subreq->len	= size;
   275	
   276			if (start >= hole_to && start < cache_to) {
   277				/* Overlap with a cached region, where the cache may
   278				 * record a block of zeroes.
   279				 */
   280				_debug("cached s=%llx c=%llx l=%zx", start, cache_to, size);
   281				subreq->len = umin(cache_to - start, size);
   282				subreq->len = round_up(subreq->len, occ->granularity);
   283				if (occ->cached_type[0] == FSCACHE_EXTENT_ZERO) {
   284					subreq->source = NETFS_FILL_WITH_ZEROES;
   285					netfs_stat(&netfs_n_rh_zero);
   286				} else {
   287					subreq->source = NETFS_READ_FROM_CACHE;
   288					prepare_read = rreq->cache_resources.ops->prepare_read;
   289				}
   290	
   291				trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
   292	
   293			} else if (subreq->start >= ictx->zero_point && size > 0) {
   294				/* If this range lies beyond the zero-point, that part
   295				 * can just be cleared locally.
   296				 */
   297				_debug("zero %llx-%llx", start, start + size);
   298				subreq->len = size;
   299				subreq->source = NETFS_FILL_WITH_ZEROES;
   300				if (rreq->cache_resources.ops)
   301					__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
   302				netfs_stat(&netfs_n_rh_zero);
   303			} else {
   304				/* Read a cache hole from the server.  If any part of
   305				 * this range lies beyond the zero-point or the EOF,
   306				 * that part can just be cleared locally.
   307				 */
   308				unsigned long long zlimit = umin(rreq->i_size, ictx->zero_point);
   309				unsigned long long limit = min3(zlimit, start + size, hole_to);
   310	
   311				_debug("limit %llx %llx", rreq->i_size, ictx->zero_point);
   312				_debug("download %llx-%llx", start, start + size);
   313				subreq->len = umin(limit - subreq->start, ULONG_MAX);
   314				subreq->source = NETFS_DOWNLOAD_FROM_SERVER;
   315				if (rreq->cache_resources.ops)
   316					__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
   317				netfs_stat(&netfs_n_rh_download);
   318			}
   319	
   320			if (size == 0) {
   321				pr_err("ZERO-LEN READ: R=%08x[%x] l=%zx/%zx s=%llx z=%llx i=%llx",
   322				       rreq->debug_id, subreq->debug_index,
   323				       subreq->len, size,
   324				       subreq->start, ictx->zero_point, rreq->i_size);
   325				break;
   326			}
   327	
   328			rreq->io_streams[0].sreq_max_len = MAX_RW_COUNT;
   329			rreq->io_streams[0].sreq_max_segs = INT_MAX;
   330	
   331			if (prepare_read) {
   332				ret = prepare_read(subreq);
   333				if (ret < 0) {
   334					subreq->error = ret;
   335					/* Not queued - release both refs. */
   336					netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
   337					netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
   338					break;
   339				}
   340				trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
   341			}
   342	
   343			slice = netfs_prepare_read_iterator(subreq, ractl);
   344			if (slice < 0) {
   345				ret = slice;
   346				subreq->error = ret;
   347				trace_netfs_sreq(subreq, netfs_sreq_trace_cancel);
   348				/* Not queued - release both refs. */
   349				netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
   350				netfs_put_subrequest(subreq, netfs_sreq_trace_put_cancel);
   351				break;
   352			}
   353			size -= slice;
   354			start += slice;
   355	
   356			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   357	
   358			netfs_queue_read(rreq, subreq, size <= 0);
   359			netfs_issue_read(rreq, subreq);
   360			cond_resched();
   361		} while (size > 0);
   362	
   363	stop:
   364		if (unlikely(size > 0)) {
   365			smp_wmb(); /* Write lists before ALL_QUEUED. */
   366			set_bit(NETFS_RREQ_ALL_QUEUED, &rreq->flags);
   367			netfs_wake_collector(rreq);
   368		}
   369	
   370		/* Defer error return as we may need to wait for outstanding I/O. */
   371		cmpxchg(&rreq->error, 0, ret);
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
