Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2D12C473;
	Fri, 21 Jun 2024 04:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944051; cv=none; b=A7dCILJv8BJhAz17hA72HBN37lhBFl2WBi2/bRml9/TCM5IApvg5ajslqx+xUI8uB3/cloixaBPRNFY+yQLk8Fzs4/EuEndOGG3X0PplED3+lVtWxdzEF0uV3MeJnFBgD+arcU+IQZ2avLB02mknSvs/AIT+YuoMdLTN/EXlef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944051; c=relaxed/simple;
	bh=MTtU9dN7dAU2KRI4ckab2+aKCYEZVk25H67J7K4WPbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dmsMXm/B+OzrpOmLY6fvSwln+UL1XY3Zc3iFNdU0wCbGx5qGg5LdRRPvGMPQSJ91JxLc85dbMuKyUa+i0uQq0wXebdt//E/71eY6tjUzzdKihUYmU3JQuAmALTLB7tGDcfAK+HINspwdFIap4hwB7R7kMTT/JlQH4ke8cFu67s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bltAPNrK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bltAPNrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718944049; x=1750480049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTtU9dN7dAU2KRI4ckab2+aKCYEZVk25H67J7K4WPbE=;
  b=bltAPNrKfuN5pYZCOdDzDzpr9eCD9f1u1l4FBx0Yk5rXV7jV+Aep7cej
   ICeWF20MEX7XS/ylluIj3i0Xdj0XLquoYNmkTAuD4ffsE+U/u997+KJqr
   ORLummEV/GR/oEqL4iPuxxGQkppmDsLwR2hlUAFLCaTSZzkw+f91L7Qd5
   4qxT8hUpXS2UyeVLfmpgtaaw6lPDsf2USByfCmB6d/tBUsVDVEHEZJIb1
   bBQ7PRz5QSov+AY/VbX8V/DeJeLF2UN2jWsWtPjZJ6S85ewsLc7zj3dpm
   /a5tdQIqgsNySkkEJPH9zO/i2UNOspFGiw73JS3zJPd7UEbS29gHlw97a
   w==;
X-CSE-ConnectionGUID: Si6CdEN5Qkmwp0YIJyllOA==
X-CSE-MsgGUID: ptX6uUrhT9avI7OJ1RqReA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16079683"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16079683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 21:27:25 -0700
X-CSE-ConnectionGUID: Ezi3oK+pRi+L4zTbyatcRA==
X-CSE-MsgGUID: M9ffDE0RQzynbpt8lMJ8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="43144991"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 21:27:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKVru-0008Dc-0t;
	Fri, 21 Jun 2024 04:27:22 +0000
Date: Fri, 21 Jun 2024 12:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 17/17] fs/netfs/buffered_read.c:276:7:
 warning: variable 'slice' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202406211226.JKZxYvs6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   d75f8ece3c49fa2ab1299cdabfc879952702a19a
commit: d75f8ece3c49fa2ab1299cdabfc879952702a19a [17/17] netfs: Speed up buffered reading
config: i386-buildonly-randconfig-003-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211226.JKZxYvs6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211226.JKZxYvs6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211226.JKZxYvs6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:276:7: warning: variable 'slice' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     276 |                 if (source == NETFS_INVALID_READ)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/buffered_read.c:280:11: note: uninitialized use occurs here
     280 |                 size -= slice;
         |                         ^~~~~
   fs/netfs/buffered_read.c:276:3: note: remove the 'if' if its condition is always true
     276 |                 if (source == NETFS_INVALID_READ)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     277 |                         break;
   fs/netfs/buffered_read.c:222:16: note: initialize the variable 'slice' to silence this warning
     222 |                 ssize_t slice;
         |                              ^
         |                               = 0
   fs/netfs/buffered_read.c:23:13: warning: unused function 'netfs_rreq_expand' [-Wunused-function]
      23 | static void netfs_rreq_expand(struct netfs_io_request *rreq,
         |             ^~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +276 fs/netfs/buffered_read.c

   206	
   207	/*
   208	 * Perform a read to the pagecache from a series of sources of different types,
   209	 * slicing up the region to be read according to available cache blocks and
   210	 * network rsize.
   211	 */
   212	static int netfs_read_to_pagecache(struct netfs_io_request *rreq)
   213	{
   214		struct netfs_inode *ictx = netfs_inode(rreq->inode);
   215		unsigned long long start = rreq->start;
   216		ssize_t size = rreq->len;
   217	
   218		/* Chop the readahead request up into subrequests. */
   219		do {
   220			struct netfs_io_subrequest *subreq;
   221			enum netfs_io_source source = NETFS_DOWNLOAD_FROM_SERVER;
   222			ssize_t slice;
   223	
   224			subreq = netfs_alloc_subrequest(rreq);
   225			if (!subreq)
   226				return -ENOMEM;
   227	
   228			subreq->source	= NETFS_DOWNLOAD_FROM_SERVER;
   229			subreq->start	= start;
   230			subreq->len	= size;
   231	
   232			spin_lock(&rreq->lock);
   233			list_add_tail(&subreq->rreq_link, &rreq->subrequests);
   234			subreq->prev_donated = rreq->prev_donated;
   235			rreq->prev_donated = 0;
   236			trace_netfs_sreq(subreq, netfs_sreq_trace_added);
   237			spin_unlock(&rreq->lock);
   238	
   239			source = netfs_cache_prepare_read(rreq, subreq, rreq->i_size);
   240			if (source == NETFS_DOWNLOAD_FROM_SERVER) {
   241				if (subreq->start >= ictx->zero_point) {
   242					subreq->source = source = NETFS_FILL_WITH_ZEROES;
   243					goto fill_with_zeroes;
   244				}
   245	
   246				if (subreq->len > ictx->zero_point - subreq->start)
   247					subreq->len = ictx->zero_point - subreq->start;
   248				if (subreq->len > rreq->i_size - subreq->start)
   249					subreq->len = rreq->i_size - subreq->start;
   250	
   251				netfs_stat(&netfs_n_rh_download);
   252				slice = rreq->netfs_ops->issue_read(subreq);
   253				if (slice <= 0)
   254					return slice;
   255				goto done;
   256			}
   257	
   258		fill_with_zeroes:
   259			if (source == NETFS_FILL_WITH_ZEROES) {
   260				subreq->source = NETFS_FILL_WITH_ZEROES;
   261				trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   262				netfs_stat(&netfs_n_rh_zero);
   263				slice = subreq->len;
   264				subreq->transferred = slice;
   265				__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
   266				netfs_read_subreq_progress(subreq, 0, false);
   267				goto done;
   268			}
   269	
   270			if (source == NETFS_READ_FROM_CACHE) {
   271				trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   272				slice = netfs_read_cache_to_pagecache(rreq, subreq);
   273				goto done;
   274			}
   275	
 > 276			if (source == NETFS_INVALID_READ)
   277				break;
   278	
   279		done:
   280			size -= slice;
   281			start += slice;
   282			cond_resched();
   283		} while (size > 0);
   284	
   285		return 0;
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
