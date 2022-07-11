Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566134692
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657568982; x=1689104982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAQrRCaAoyg7OSWEn/wjQ1dtogV/xEGRQpxZg8AcMr8=;
  b=bo6uW2LsRc4re7yUKD+hK/7rnLVc6Jo1bWLitRdhxtMTdeXsZqVX/17s
   NlnoeL9gaIDuZfyNRCsl8nVbKOIHASDEGjo+GnuQ1YZtWmvBrTx5S3R1+
   wy0//4C55571q9PoMeLfrVaRbZgZ/tEIv0s/JL8PwykdpesBi8O1hnF8c
   YzCBCcinrb5DNaHZuqiIGMnvjri+ZFwF4neUEI2ugLvV6mY07WYH9DUay
   09JrrQDjaJZjSlXNsgHiJNYMjeASUI9JCqjQ14mFWwTNVuPefryGDAlEB
   r9MU65bwm34eWunOCDP/e/CLt8dEiwTYWOTvsgQBD9TtMgKzgidGu9lvJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285883702"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="285883702"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 12:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="622213106"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2022 12:49:40 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAzPX-0001AZ-Mj;
	Mon, 11 Jul 2022 19:49:39 +0000
Date: Tue, 12 Jul 2022 03:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <dchinner@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [linux-next:master 7625/9472] fs/xfs/scrub/repair.c:539:19: warning:
 variable 'agno' set but not used
Message-ID: <202207120340.ToDnrawY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4112a8699ae2eac797415b9be1d7901b3f79e772
commit: 08d3e84feeb8cb8e20d54f659446b98fe17913aa [7625/9472] xfs: pass perag to xfs_alloc_read_agf()
config: x86_64-randconfig-a006-20220627 (https://download.01.org/0day-ci/archive/20220712/202207120340.ToDnrawY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=08d3e84feeb8cb8e20d54f659446b98fe17913aa
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 08d3e84feeb8cb8e20d54f659446b98fe17913aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/repair.c:539:19: warning: variable 'agno' set but not used [-Wunused-but-set-variable]
           xfs_agnumber_t                  agno;
                                           ^
   1 warning generated.


vim +/agno +539 fs/xfs/scrub/repair.c

12c6510e2ff17c Darrick J. Wong 2018-05-29  528  
86d969b425d7ec Darrick J. Wong 2018-07-30  529  /* Dispose of a single block. */
12c6510e2ff17c Darrick J. Wong 2018-05-29  530  STATIC int
86d969b425d7ec Darrick J. Wong 2018-07-30  531  xrep_reap_block(
1d8a748a8aa94a Darrick J. Wong 2018-07-19  532  	struct xfs_scrub		*sc,
12c6510e2ff17c Darrick J. Wong 2018-05-29  533  	xfs_fsblock_t			fsbno,
66e3237e724c66 Darrick J. Wong 2018-12-12  534  	const struct xfs_owner_info	*oinfo,
12c6510e2ff17c Darrick J. Wong 2018-05-29  535  	enum xfs_ag_resv_type		resv)
12c6510e2ff17c Darrick J. Wong 2018-05-29  536  {
12c6510e2ff17c Darrick J. Wong 2018-05-29  537  	struct xfs_btree_cur		*cur;
12c6510e2ff17c Darrick J. Wong 2018-05-29  538  	struct xfs_buf			*agf_bp = NULL;
12c6510e2ff17c Darrick J. Wong 2018-05-29 @539  	xfs_agnumber_t			agno;
12c6510e2ff17c Darrick J. Wong 2018-05-29  540  	xfs_agblock_t			agbno;
12c6510e2ff17c Darrick J. Wong 2018-05-29  541  	bool				has_other_rmap;
12c6510e2ff17c Darrick J. Wong 2018-05-29  542  	int				error;
12c6510e2ff17c Darrick J. Wong 2018-05-29  543  
12c6510e2ff17c Darrick J. Wong 2018-05-29  544  	agno = XFS_FSB_TO_AGNO(sc->mp, fsbno);
12c6510e2ff17c Darrick J. Wong 2018-05-29  545  	agbno = XFS_FSB_TO_AGBNO(sc->mp, fsbno);
08d3e84feeb8cb Dave Chinner    2022-07-07  546  	ASSERT(agno == sc->sa.pag->pag_agno);
12c6510e2ff17c Darrick J. Wong 2018-05-29  547  
12c6510e2ff17c Darrick J. Wong 2018-05-29  548  	/*
12c6510e2ff17c Darrick J. Wong 2018-05-29  549  	 * If we are repairing per-inode metadata, we need to read in the AGF
12c6510e2ff17c Darrick J. Wong 2018-05-29  550  	 * buffer.  Otherwise, we're repairing a per-AG structure, so reuse
12c6510e2ff17c Darrick J. Wong 2018-05-29  551  	 * the AGF buffer that the setup functions already grabbed.
12c6510e2ff17c Darrick J. Wong 2018-05-29  552  	 */
12c6510e2ff17c Darrick J. Wong 2018-05-29  553  	if (sc->ip) {
08d3e84feeb8cb Dave Chinner    2022-07-07  554  		error = xfs_alloc_read_agf(sc->sa.pag, sc->tp, 0, &agf_bp);
12c6510e2ff17c Darrick J. Wong 2018-05-29  555  		if (error)
12c6510e2ff17c Darrick J. Wong 2018-05-29  556  			return error;
12c6510e2ff17c Darrick J. Wong 2018-05-29  557  	} else {
12c6510e2ff17c Darrick J. Wong 2018-05-29  558  		agf_bp = sc->sa.agf_bp;
12c6510e2ff17c Darrick J. Wong 2018-05-29  559  	}
fa9c3c197329fd Dave Chinner    2021-06-02  560  	cur = xfs_rmapbt_init_cursor(sc->mp, sc->tp, agf_bp, sc->sa.pag);
12c6510e2ff17c Darrick J. Wong 2018-05-29  561  
12c6510e2ff17c Darrick J. Wong 2018-05-29  562  	/* Can we find any other rmappings? */
12c6510e2ff17c Darrick J. Wong 2018-05-29  563  	error = xfs_rmap_has_other_keys(cur, agbno, 1, oinfo, &has_other_rmap);
ef97ef26d263fb Darrick J. Wong 2018-07-19  564  	xfs_btree_del_cursor(cur, error);
12c6510e2ff17c Darrick J. Wong 2018-05-29  565  	if (error)
ef97ef26d263fb Darrick J. Wong 2018-07-19  566  		goto out_free;
12c6510e2ff17c Darrick J. Wong 2018-05-29  567  
12c6510e2ff17c Darrick J. Wong 2018-05-29  568  	/*
12c6510e2ff17c Darrick J. Wong 2018-05-29  569  	 * If there are other rmappings, this block is cross linked and must
12c6510e2ff17c Darrick J. Wong 2018-05-29  570  	 * not be freed.  Remove the reverse mapping and move on.  Otherwise,
12c6510e2ff17c Darrick J. Wong 2018-05-29  571  	 * we were the only owner of the block, so free the extent, which will
12c6510e2ff17c Darrick J. Wong 2018-05-29  572  	 * also remove the rmap.
12c6510e2ff17c Darrick J. Wong 2018-05-29  573  	 *
12c6510e2ff17c Darrick J. Wong 2018-05-29  574  	 * XXX: XFS doesn't support detecting the case where a single block
12c6510e2ff17c Darrick J. Wong 2018-05-29  575  	 * metadata structure is crosslinked with a multi-block structure
12c6510e2ff17c Darrick J. Wong 2018-05-29  576  	 * because the buffer cache doesn't detect aliasing problems, so we
12c6510e2ff17c Darrick J. Wong 2018-05-29  577  	 * can't fix 100% of crosslinking problems (yet).  The verifiers will
12c6510e2ff17c Darrick J. Wong 2018-05-29  578  	 * blow on writeout, the filesystem will shut down, and the admin gets
12c6510e2ff17c Darrick J. Wong 2018-05-29  579  	 * to run xfs_repair.
12c6510e2ff17c Darrick J. Wong 2018-05-29  580  	 */
12c6510e2ff17c Darrick J. Wong 2018-05-29  581  	if (has_other_rmap)
fa9c3c197329fd Dave Chinner    2021-06-02  582  		error = xfs_rmap_free(sc->tp, agf_bp, sc->sa.pag, agbno,
fa9c3c197329fd Dave Chinner    2021-06-02  583  					1, oinfo);
12c6510e2ff17c Darrick J. Wong 2018-05-29  584  	else if (resv == XFS_AG_RESV_AGFL)
b5e2196e9c7217 Darrick J. Wong 2018-07-19  585  		error = xrep_put_freelist(sc, agbno);
12c6510e2ff17c Darrick J. Wong 2018-05-29  586  	else
12c6510e2ff17c Darrick J. Wong 2018-05-29  587  		error = xfs_free_extent(sc->tp, fsbno, 1, oinfo, resv);
12c6510e2ff17c Darrick J. Wong 2018-05-29  588  	if (agf_bp != sc->sa.agf_bp)
12c6510e2ff17c Darrick J. Wong 2018-05-29  589  		xfs_trans_brelse(sc->tp, agf_bp);
12c6510e2ff17c Darrick J. Wong 2018-05-29  590  	if (error)
12c6510e2ff17c Darrick J. Wong 2018-05-29  591  		return error;
12c6510e2ff17c Darrick J. Wong 2018-05-29  592  
12c6510e2ff17c Darrick J. Wong 2018-05-29  593  	if (sc->ip)
12c6510e2ff17c Darrick J. Wong 2018-05-29  594  		return xfs_trans_roll_inode(&sc->tp, sc->ip);
b5e2196e9c7217 Darrick J. Wong 2018-07-19  595  	return xrep_roll_ag_trans(sc);
12c6510e2ff17c Darrick J. Wong 2018-05-29  596  
ef97ef26d263fb Darrick J. Wong 2018-07-19  597  out_free:
12c6510e2ff17c Darrick J. Wong 2018-05-29  598  	if (agf_bp != sc->sa.agf_bp)
12c6510e2ff17c Darrick J. Wong 2018-05-29  599  		xfs_trans_brelse(sc->tp, agf_bp);
12c6510e2ff17c Darrick J. Wong 2018-05-29  600  	return error;
12c6510e2ff17c Darrick J. Wong 2018-05-29  601  }
12c6510e2ff17c Darrick J. Wong 2018-05-29  602  

:::::: The code at line 539 was first introduced by commit
:::::: 12c6510e2ff17cf94cae08ba7b6d2355760dfd1d xfs: add helpers to dispose of old btree blocks after a repair

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
