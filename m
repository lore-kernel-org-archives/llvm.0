Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE2379;
	Thu, 15 Jun 2023 01:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686793540; x=1718329540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAJSjzbY+CMyAUXGmq0v25KIjAj7nWTP37TGyuZAF5o=;
  b=ZEy8GjOnSDjshEYMJu2GDO5xNW6/ffuid1DkI2aerTNUUHPPq2BT0vDu
   7kBHz8yPb467jIfS6lvdX19m77Hv+Fd6Ol1IF/3fEMX4lCM9VWt1Qshnk
   7Hc0LmbawIJzmTMBIjbwUWGXEBcO+yh7/uxyZnIULUDu3ynDf0KIiyZmc
   0nHswGMqbRtr1+Wj8WdJPhlh8k59xftBjJjhIyoIwfuJ2ye8JkZPTH3f3
   vW8I7xJye44qznevEwPJ3ZSA5Iiix7f8snBASrqoWhg/T9koAhuj5Tg+y
   Q1PjYlRfE6VX/u17abnUbuF6/OgVlf8ORxXwdEEkxQCPltgfQxUZs/kiQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="362163547"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="362163547"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 18:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712278784"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="712278784"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2023 18:45:38 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9c2l-0001HJ-2u;
	Thu, 15 Jun 2023 01:45:21 +0000
Date: Thu, 15 Jun 2023 09:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Omar Sandoval <osandov@fb.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Omar Sandoval <osandov@osandov.com>
Subject: [osandov:xfs-realtime-optimizations 1/6]
 fs/xfs/libxfs/xfs_rtbitmap.c:933:60: error: too few arguments to function
 call, expected 8, have 7
Message-ID: <202306150907.4jLeElOf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/osandov/linux.git xfs-realtime-optimizations
head:   5ba181479ccf1893587b681617fbeadd7ef8d5df
commit: fff8e989ac9a63f1c7a2e435384115bff5ba8410 [1/6] xfs: cache last bitmap block in realtime allocator
config: s390-randconfig-r032-20230614 (https://download.01.org/0day-ci/archive/20230615/202306150907.4jLeElOf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/osandov/linux/commit/fff8e989ac9a63f1c7a2e435384115bff5ba8410
        git remote add osandov https://github.com/osandov/linux.git
        git fetch --no-tags osandov xfs-realtime-optimizations
        git checkout fff8e989ac9a63f1c7a2e435384115bff5ba8410
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150907.4jLeElOf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_rtbitmap.c:933:60: error: too few arguments to function call, expected 8, have 7
     933 |         error = xfs_rtcheck_range(mp, tp, bno, len, 0, &new, &stat);
         |                 ~~~~~~~~~~~~~~~~~                                 ^
   fs/xfs/libxfs/xfs_rtbitmap.c:752:1: note: 'xfs_rtcheck_range' declared here
     752 | xfs_rtcheck_range(
         | ^
   1 error generated.


vim +933 fs/xfs/libxfs/xfs_rtbitmap.c

c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  917  
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  918  #ifdef DEBUG
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  919  /*
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  920   * Check that the given extent (block range) is allocated already.
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  921   */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  922  STATIC int				/* error */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  923  xfs_rtcheck_alloc_range(
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  924  	xfs_mount_t	*mp,		/* file system mount point */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  925  	xfs_trans_t	*tp,		/* transaction pointer */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  926  	xfs_rtblock_t	bno,		/* starting block number of extent */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  927  	xfs_extlen_t	len)		/* length of extent */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  928  {
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  929  	xfs_rtblock_t	new;		/* dummy for xfs_rtcheck_range */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  930  	int		stat;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  931  	int		error;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  932  
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15 @933  	error = xfs_rtcheck_range(mp, tp, bno, len, 0, &new, &stat);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  934  	if (error)
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  935  		return error;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  936  	ASSERT(stat);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  937  	return 0;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  938  }
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  939  #else
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  940  #define xfs_rtcheck_alloc_range(m,t,b,l)	(0)
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  941  #endif
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  942  /*
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  943   * Free an extent in the realtime subvolume.  Length is expressed in
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  944   * realtime extents, as is the block number.
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  945   */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  946  int					/* error */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  947  xfs_rtfree_extent(
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  948  	xfs_trans_t	*tp,		/* transaction pointer */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  949  	xfs_rtblock_t	bno,		/* starting block number to free */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  950  	xfs_extlen_t	len)		/* length of extent freed */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  951  {
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  952  	int		error;		/* error value */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  953  	xfs_mount_t	*mp;		/* file system mount structure */
fff8e989ac9a63 fs/xfs/libxfs/xfs_rtbitmap.c Omar Sandoval     2022-03-29  954  	struct xfs_rtbuf_cache rtbufc = {}; /* cache of realtime blocks */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  955  
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  956  	mp = tp->t_mountp;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  957  
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  958  	ASSERT(mp->m_rbmip->i_itemp != NULL);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  959  	ASSERT(xfs_isilocked(mp->m_rbmip, XFS_ILOCK_EXCL));
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  960  
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  961  	error = xfs_rtcheck_alloc_range(mp, tp, bno, len);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  962  	if (error)
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  963  		return error;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  964  
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  965  	/*
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  966  	 * Free the range of realtime blocks.
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  967  	 */
fff8e989ac9a63 fs/xfs/libxfs/xfs_rtbitmap.c Omar Sandoval     2022-03-29  968  	error = xfs_rtfree_range(mp, tp, bno, len, &rtbufc);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  969  	if (error) {
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  970  		return error;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  971  	}
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  972  	/*
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  973  	 * Mark more blocks free in the superblock.
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  974  	 */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  975  	xfs_trans_mod_sb(tp, XFS_TRANS_SB_FREXTENTS, (long)len);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  976  	/*
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  977  	 * If we've now freed all the blocks, reset the file sequence
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  978  	 * number to 0.
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  979  	 */
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  980  	if (tp->t_frextents_delta + mp->m_sb.sb_frextents ==
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  981  	    mp->m_sb.sb_rextents) {
db07349da2f564 fs/xfs/libxfs/xfs_rtbitmap.c Christoph Hellwig 2021-03-29  982  		if (!(mp->m_rbmip->i_diflags & XFS_DIFLAG_NEWRTBM))
db07349da2f564 fs/xfs/libxfs/xfs_rtbitmap.c Christoph Hellwig 2021-03-29  983  			mp->m_rbmip->i_diflags |= XFS_DIFLAG_NEWRTBM;
c8ce540db5f67d fs/xfs/libxfs/xfs_rtbitmap.c Darrick J. Wong   2017-06-16  984  		*(uint64_t *)&VFS_I(mp->m_rbmip)->i_atime = 0;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  985  		xfs_trans_log_inode(tp, mp->m_rbmip, XFS_ILOG_CORE);
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  986  	}
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  987  	return 0;
c963c6193a5ada fs/xfs/xfs_rtbitmap.c        Dave Chinner      2013-10-15  988  }
fb3c3de2f65c00 fs/xfs/libxfs/xfs_rtbitmap.c Darrick J. Wong   2017-03-28  989  

:::::: The code at line 933 was first introduced by commit
:::::: c963c6193a5adaec58044e238ef23516d04e5a74 xfs: split xfs_rtalloc.c for userspace sanity

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
