Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5E156CC;
	Tue, 29 Aug 2023 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693321543; x=1724857543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aKZM1SwPU3yoFEFwTv4oHrHAFJUfJsxk82js/oPsnhw=;
  b=glvUavsb8ks+hB0O8qU8J/XVDC0FnkOs53lz7gcAz0Tju+n8CO6vxSEM
   44DNrqwgGYKbuMc4wOWmP/Q/oKzJCImqy/xyUp+LCL1OLlLTNS4J89F//
   ariVaaffMVVO60RHAhYZO0xrOvMGWCNEQjMOQ5itPZgPAktr9qqwYq223
   NFA2P/kHgRUp+M4nKYYZ/lDJpzwpVmCOPh+UphE8udMFcNn4tlLWs7lxZ
   0PMiZjpguw9tmx0GB54N2szssBALa31hEVQwxkEUCg7KyWoN6cPHx3bOJ
   3LkAJXuH+wVa1fzNrUeOtKqte/p0+4zy1eNXd0Yr1CmknGHpU5VQdF5G7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379158989"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="379158989"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 08:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="808716020"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="808716020"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2023 08:03:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb0Fg-0008pd-1t;
	Tue, 29 Aug 2023 15:03:35 +0000
Date: Tue, 29 Aug 2023 23:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] xfs: reduce AGF hold times during fstrim operations
Message-ID: <202308292252.LIRc5GoQ-lkp@intel.com>
References: <20230829065710.938039-1-david@fromorbit.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829065710.938039-1-david@fromorbit.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/xfs-reduce-AGF-hold-times-during-fstrim-operations/20230829-145931
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230829065710.938039-1-david%40fromorbit.com
patch subject: [PATCH] [RFC] xfs: reduce AGF hold times during fstrim operations
config: i386-buildonly-randconfig-003-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292252.LIRc5GoQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292252.LIRc5GoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308292252.LIRc5GoQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_discard.c:93:19: warning: variable 'agf' set but not used [-Wunused-but-set-variable]
           struct xfs_agf          *agf;
                                    ^
   1 warning generated.


vim +/agf +93 fs/xfs/xfs_discard.c

99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29   80  
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29   81  static int
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29   82  xfs_trim_gather_extents(
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13   83  	struct xfs_perag	*pag,
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22   84  	xfs_daddr_t		start,
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22   85  	xfs_daddr_t		end,
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22   86  	xfs_daddr_t		minlen,
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29   87  	xfs_extlen_t		*longest,
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29   88  	struct xfs_trim_work	*twork)
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   89  {
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13   90  	struct xfs_mount	*mp = pag->pag_mount;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   91  	struct xfs_btree_cur	*cur;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   92  	struct xfs_buf		*agbp;
9798f615ad2be4 fs/xfs/xfs_discard.c           Christoph Hellwig 2020-03-10  @93  	struct xfs_agf		*agf;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   94  	int			error;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   95  	int			i;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29   96  	int			batch = 100;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   97  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   98  	/*
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07   99  	 * Force out the log.  This means any transactions that might have freed
8c81dd46ef3c41 fs/xfs/xfs_discard.c           Carlos Maiolino   2018-04-10  100  	 * space before we take the AGF buffer lock are now on disk, and the
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  101  	 * volatile disk cache is flushed.
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  102  	 */
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  103  	xfs_log_force(mp, XFS_LOG_SYNC);
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  104  
08d3e84feeb8cb fs/xfs/xfs_discard.c           Dave Chinner      2022-07-07  105  	error = xfs_alloc_read_agf(pag, NULL, 0, &agbp);
706b8c5bc70391 fs/xfs/xfs_discard.c           Darrick J. Wong   2020-01-23  106  	if (error)
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  107  		return error;
9798f615ad2be4 fs/xfs/xfs_discard.c           Christoph Hellwig 2020-03-10  108  	agf = agbp->b_addr;
8c81dd46ef3c41 fs/xfs/xfs_discard.c           Carlos Maiolino   2018-04-10  109  
289d38d22cd889 fs/xfs/xfs_discard.c           Dave Chinner      2021-06-02  110  	cur = xfs_allocbt_init_cursor(mp, NULL, agbp, pag, XFS_BTNUM_CNT);
8c81dd46ef3c41 fs/xfs/xfs_discard.c           Carlos Maiolino   2018-04-10  111  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  112  	/*
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  113  	 * Look up the extent length requested in the AGF and start with it.
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  114  	 *
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  115  	 * XXX: continuations really want a lt lookup here, so we get the
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  116  	 * largest extent adjacent to the size finished off in the last batch.
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  117  	 * The ge search here results in the extent discarded in the last batch
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  118  	 * being discarded again before we move on to the smaller size...
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  119  	 */
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  120  	error = xfs_alloc_lookup_ge(cur, 0, *longest, &i);
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  121  	if (error)
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  122  		goto out_del_cursor;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  123  	if (i == 0) {
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  124  		/* nothing of that length left in the AG, we are done */
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  125  		*longest = 0;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  126  		goto out_del_cursor;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  127  	}
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  128  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  129  	/*
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  130  	 * Loop until we are done with all extents that are large
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  131  	 * enough to be worth discarding or we hit batch limits.
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  132  	 */
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  133  	while (i && batch-- > 0) {
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  134  		xfs_agblock_t	fbno;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  135  		xfs_extlen_t	flen;
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  136  		xfs_daddr_t	dbno;
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  137  		xfs_extlen_t	dlen;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  138  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  139  		error = xfs_alloc_get_rec(cur, &fbno, &flen, &i);
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  140  		if (error)
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  141  			break;
f9e0370648b9f9 fs/xfs/xfs_discard.c           Darrick J. Wong   2019-11-11  142  		if (XFS_IS_CORRUPT(mp, i != 1)) {
f9e0370648b9f9 fs/xfs/xfs_discard.c           Darrick J. Wong   2019-11-11  143  			error = -EFSCORRUPTED;
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  144  			break;
f9e0370648b9f9 fs/xfs/xfs_discard.c           Darrick J. Wong   2019-11-11  145  		}
9798f615ad2be4 fs/xfs/xfs_discard.c           Christoph Hellwig 2020-03-10  146  		ASSERT(flen <= be32_to_cpu(agf->agf_longest));
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  147  
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  148  		/*
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  149  		 * Keep going on this batch until we hit the record size
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  150  		 * changes. That way we will start the next batch with the new
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  151  		 * extent size and we don't get stuck on an extent size when
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  152  		 * there are more extents of that size than the batch size.
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  153  		 */
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  154  		if (batch == 0) {
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  155  			if (flen != *longest)
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  156  				break;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  157  			batch++;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  158  		} else {
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  159  			*longest = flen;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  160  		}
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  161  
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  162  		/*
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  163  		 * use daddr format for all range/len calculations as that is
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  164  		 * the format the range/len variables are supplied in by
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  165  		 * userspace.
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  166  		 */
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  167  		dbno = XFS_AGB_TO_DADDR(mp, pag->pag_agno, fbno);
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  168  		dlen = XFS_FSB_TO_BB(mp, flen);
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  169  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  170  		/*
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  171  		 * Too small?  Give up.
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  172  		 */
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  173  		if (dlen < minlen) {
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  174  			trace_xfs_discard_toosmall(mp, pag->pag_agno, fbno, flen);
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  175  			*longest = 0;
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  176  			break;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  177  		}
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  178  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  179  		/*
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  180  		 * If the extent is entirely outside of the range we are
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  181  		 * supposed to discard skip it.  Do not bother to trim
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  182  		 * down partially overlapping ranges for now.
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  183  		 */
a66d636385d621 fs/xfs/xfs_discard.c           Dave Chinner      2012-03-22  184  		if (dbno + dlen < start || dbno > end) {
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  185  			trace_xfs_discard_exclude(mp, pag->pag_agno, fbno, flen);
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  186  			goto next_extent;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  187  		}
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  188  
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  189  		/*
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  190  		 * If any blocks in the range are still busy, skip the
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  191  		 * discard and try again the next time.
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  192  		 */
45d0662117565e fs/xfs/xfs_discard.c           Dave Chinner      2021-06-02  193  		if (xfs_extent_busy_search(mp, pag, fbno, flen)) {
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  194  			trace_xfs_discard_busy(mp, pag->pag_agno, fbno, flen);
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  195  			goto next_extent;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  196  		}
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  197  
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  198  		xfs_extent_busy_insert_discard(pag, fbno, flen,
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  199  				&twork->busy_extents);
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  200  		twork->blocks_trimmed += flen;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  201  next_extent:
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  202  		error = xfs_btree_decrement(cur, 0, &i);
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  203  		if (error)
35bf2b1abc9a75 fs/xfs/xfs_discard.c           Dave Chinner      2023-02-13  204  			break;
a46db60834883c fs/xfs/linux-2.6/xfs_discard.c Christoph Hellwig 2011-01-07  205  
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  206  		/*
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  207  		 * If there's no more records in the tree, we are done. Set
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  208  		 * longest to 0 to indicate to the caller that there is no more
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  209  		 * extents to search.
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  210  		 */
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  211  		if (i == 0)
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  212  			*longest = 0;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  213  	}
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  214  
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  215  	/*
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  216  	 * If there was an error, release all the gathered busy extents because
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  217  	 * we aren't going to issue a discard on them any more. If we ran out of
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  218  	 * records, set *longest to zero to tell the caller there is nothing
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  219  	 * left in this AG.
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  220  	 */
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  221  	if (error)
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  222  		xfs_extent_busy_clear(pag->pag_mount, &twork->busy_extents,
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  223  				false);
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  224  out_del_cursor:
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  225  	xfs_btree_del_cursor(cur, error);
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  226  	xfs_buf_relse(agbp);
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  227  	return error;
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  228  }
99affa6f39376f fs/xfs/xfs_discard.c           Dave Chinner      2023-08-29  229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
