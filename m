Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A67B
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 02:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649815949; x=1681351949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pe87ft1aKaeKaE+04iJ1gZNdhhDhquRrnt/SIy8fEts=;
  b=T56Dj7ZKczQ+9DWGqyy9gNmlgFHnLfgwpQYFfNsElsCDl1QKSfmVqHAY
   R2xg7IK5qx97OhwY9QTUC6hW0kO+CNjr1vZNDYsmD4QndWmLMnGPU63Z3
   FVqKFqiJ+gxCEOP2px3Gul0eE9m0TI9233B/+bZCwYAkeUeGbhKWRGyzE
   rp0dtvWyRw1gJw+skH9bEZN6xunRjEjKHUvzm8PU9ws7fzf9kFe4tQZ+f
   wkkJFCKHnmAtSe1UzMhTQlHhb/ZfDbBDEI7itUvgXJ0vju5C4oNETC4t2
   ZmZAKwkYf89IIfLTNa4cK0eccIP4nf5/EM0aTvRsA8xB9DXJN39I9vggG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="322996214"
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; 
   d="scan'208";a="322996214"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 19:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,255,1643702400"; 
   d="scan'208";a="644983140"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2022 19:12:26 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neSUb-0003Mc-Se;
	Wed, 13 Apr 2022 02:12:25 +0000
Date: Wed, 13 Apr 2022 10:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [djwong-xfs:vectorized-scrub 99/396] fs/xfs/scrub/repair.c:181:1:
 warning: no previous prototype for function 'xrep_defer_finish'
Message-ID: <202204131051.6jCh5cCf-lkp@intel.com>
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
commit: 80bc1e058e807de278cc530a53694879e4f70cb3 [99/396] xfs: implement block reservation accounting for btrees we're staging
config: hexagon-buildonly-randconfig-r001-20220412 (https://download.01.org/0day-ci/archive/20220413/202204131051.6jCh5cCf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=80bc1e058e807de278cc530a53694879e4f70cb3
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 80bc1e058e807de278cc530a53694879e4f70cb3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/repair.c:181:1: warning: no previous prototype for function 'xrep_defer_finish' [-Wmissing-prototypes]
   xrep_defer_finish(
   ^
   fs/xfs/scrub/repair.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.


vim +/xrep_defer_finish +181 fs/xfs/scrub/repair.c

   178	
   179	/* Finish all deferred work attached to the repair transaction. */
   180	int
 > 181	xrep_defer_finish(
   182		struct xfs_scrub	*sc)
   183	{
   184		int			error;
   185	
   186		/* Keep the AG header buffers locked so we can keep going. */
   187		if (sc->sa.agi_bp) {
   188			xfs_ialloc_log_agi(sc->tp, sc->sa.agi_bp, XFS_AGI_MAGICNUM);
   189			xfs_trans_bhold(sc->tp, sc->sa.agi_bp);
   190		}
   191	
   192		if (sc->sa.agf_bp) {
   193			xfs_alloc_log_agf(sc->tp, sc->sa.agf_bp, XFS_AGF_MAGICNUM);
   194			xfs_trans_bhold(sc->tp, sc->sa.agf_bp);
   195		}
   196	
   197		error = xfs_defer_finish(&sc->tp);
   198		if (error)
   199			return error;
   200	
   201		/*
   202		 * The buffer log item (and hence the blf type) can detach from
   203		 * the buffer across the transaction rolls, so ensure that the
   204		 * types are still set on the AG header buffers.  Release the hold
   205		 * that we set above because defer_finish won't do that for us.
   206		 */
   207		if (sc->sa.agi_bp) {
   208			xfs_trans_bhold_release(sc->tp, sc->sa.agi_bp);
   209			xfs_trans_buf_set_type(sc->tp, sc->sa.agi_bp, XFS_BLFT_AGI_BUF);
   210		}
   211		if (sc->sa.agf_bp) {
   212			xfs_trans_bhold_release(sc->tp, sc->sa.agf_bp);
   213			xfs_trans_buf_set_type(sc->tp, sc->sa.agf_bp, XFS_BLFT_AGF_BUF);
   214		}
   215		return 0;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
