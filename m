Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494328F5
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649945096; x=1681481096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKQm+kUuUqino+2dW5Y03gm+/rXNyu9sTs6oih6VvXk=;
  b=AuhByxzOerlhxUH6qGOktyjaumum9Lb9XvsJglDNQLvDrZVZbDQVFkNU
   r/4n/wQRCZHHAocls2ahF1OeOadzRpY8wDr0SLVOfhhADTQsaSb6jMr0m
   IJnrkQeDKyvU5irZ23WqJ/yE2U85Q2Ay+bvFU8O8z3owSj5cjXT5BnveN
   mHB0IDLWNUU1QUG9sF+fOYBR/CYHC+RvuE41lJIKn0X1HJ7Mgatu+EWol
   D7nr1BXl50CPGWemtpcANd35MhRK/RqfJ2DWo8ju9cNDOPngSziZ7ivGD
   dZ6PrqEygeoju3tedXDLKmLGAR83Wk3w1a1T/Z5XSULAFuovnH3nWlQkU
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="287990987"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="287990987"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 07:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="624106685"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2022 07:04:53 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nf05d-000110-BZ;
	Thu, 14 Apr 2022 14:04:53 +0000
Date: Thu, 14 Apr 2022 22:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [djwong-xfs:vectorized-scrub 38/396]
 fs/xfs/scrub/agheader_repair.c:585:2: error: implicit declaration of
 function 'xbitmap_walk'
Message-ID: <202204142115.5hNAAWHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   bd756ef7af68274b79308166ee64949d288be861
commit: d8273f3634d00732c204ba1c112bf1b9efcc6e4d [38/396] xfs: make AGFL repair function avoid crosslinked blocks
config: hexagon-buildonly-randconfig-r002-20220413 (https://download.01.org/0day-ci/archive/20220414/202204142115.5hNAAWHG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=d8273f3634d00732c204ba1c112bf1b9efcc6e4d
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout d8273f3634d00732c204ba1c112bf1b9efcc6e4d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the djwong-xfs/vectorized-scrub HEAD bd756ef7af68274b79308166ee64949d288be861 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/agheader_repair.c:585:2: error: implicit declaration of function 'xbitmap_walk' [-Werror,-Wimplicit-function-declaration]
           xbitmap_walk(agfl_extents, xrep_agfl_check_extent, &ra);
           ^
   1 error generated.


vim +/xbitmap_walk +585 fs/xfs/scrub/agheader_repair.c

   525	
   526	/*
   527	 * Map out all the non-AGFL OWN_AG space in this AG so that we can deduce
   528	 * which blocks belong to the AGFL.
   529	 *
   530	 * Compute the set of old AGFL blocks by subtracting from the list of OWN_AG
   531	 * blocks the list of blocks owned by all other OWN_AG metadata (bnobt, cntbt,
   532	 * rmapbt).  These are the old AGFL blocks, so return that list and the number
   533	 * of blocks we're actually going to put back on the AGFL.
   534	 */
   535	STATIC int
   536	xrep_agfl_collect_blocks(
   537		struct xfs_scrub	*sc,
   538		struct xfs_buf		*agf_bp,
   539		struct xbitmap		*agfl_extents,
   540		xfs_agblock_t		*flcount)
   541	{
   542		struct xrep_agfl	ra;
   543		struct xfs_mount	*mp = sc->mp;
   544		struct xfs_btree_cur	*cur;
   545		int			error;
   546	
   547		ra.sc = sc;
   548		ra.freesp = agfl_extents;
   549		xbitmap_init(&ra.agmetablocks);
   550		xbitmap_init(&ra.crossed);
   551	
   552		/* Find all space used by the free space btrees & rmapbt. */
   553		cur = xfs_rmapbt_init_cursor(mp, sc->tp, agf_bp, sc->sa.pag);
   554		error = xfs_rmap_query_all(cur, xrep_agfl_walk_rmap, &ra);
   555		xfs_btree_del_cursor(cur, error);
   556		if (error)
   557			goto out_bmp;
   558	
   559		/* Find all blocks currently being used by the bnobt. */
   560		cur = xfs_allocbt_init_cursor(mp, sc->tp, agf_bp,
   561				sc->sa.pag, XFS_BTNUM_BNO);
   562		error = xbitmap_set_btblocks(&ra.agmetablocks, cur);
   563		xfs_btree_del_cursor(cur, error);
   564		if (error)
   565			goto out_bmp;
   566	
   567		/* Find all blocks currently being used by the cntbt. */
   568		cur = xfs_allocbt_init_cursor(mp, sc->tp, agf_bp,
   569				sc->sa.pag, XFS_BTNUM_CNT);
   570		error = xbitmap_set_btblocks(&ra.agmetablocks, cur);
   571		xfs_btree_del_cursor(cur, error);
   572		if (error)
   573			goto out_bmp;
   574	
   575		/*
   576		 * Drop the freesp meta blocks that are in use by btrees.
   577		 * The remaining blocks /should/ be AGFL blocks.
   578		 */
   579		error = xbitmap_disunion(agfl_extents, &ra.agmetablocks);
   580		if (error)
   581			goto out_bmp;
   582	
   583		/* Strike out the blocks that are cross-linked. */
   584		ra.rmap_cur = xfs_rmapbt_init_cursor(mp, sc->tp, agf_bp, sc->sa.pag);
 > 585		xbitmap_walk(agfl_extents, xrep_agfl_check_extent, &ra);
   586		xfs_btree_del_cursor(ra.rmap_cur, 0);
   587		error = xbitmap_disunion(agfl_extents, &ra.crossed);
   588		if (error)
   589			goto out_bmp;
   590	
   591		/*
   592		 * Calculate the new AGFL size.  If we found more blocks than fit in
   593		 * the AGFL we'll free them later.
   594		 */
   595		*flcount = min_t(uint64_t, xbitmap_hweight(agfl_extents),
   596				 xfs_agfl_size(mp));
   597	
   598	out_bmp:
   599		xbitmap_destroy(&ra.crossed);
   600		xbitmap_destroy(&ra.agmetablocks);
   601		return error;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
