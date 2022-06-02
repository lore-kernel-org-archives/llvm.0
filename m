Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA894627
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654139154; x=1685675154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5gRczfoKuL7G9zBFQQ2SXtbNbxh9vF8M0U/nuU3QH4=;
  b=YKP9OsbvUnC/MTow/RzRhbhlKqwRhcDfUoUMYfQhe81G0tNbsEA1OVYk
   kjxT15CT6SxAnJOZcf80/CAuaFxxj1IeU9D44zm72+eoWLQfxOaSpuTWF
   3oYsxZGzezDYEnZW6cTRlqjxPBntjwidE1V+HHUZyjhvQe9S0rEuqMJCl
   wPKxmQSxkQXDhuJdO7qD87fx9BKxTnKqJn18VpIXbOEPbqXnYLPVqfDfH
   fSVAIZkRGewED5b0bFlx3SInw7LHcS39oWJd6YrNZwZdK31KHRXWKVLDD
   9034BBtRv6tBLB7kgUmLyNtF7FC1QHY1WlFdMyPPOkzVLLq42I9NLE6jH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274604115"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="274604115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 20:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="606607359"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jun 2022 20:05:51 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwb9j-0004gM-7p;
	Thu, 02 Jun 2022 03:05:51 +0000
Date: Thu, 2 Jun 2022 11:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [djwong-xfs:vectorized-scrub 172/401]
 fs/xfs/libxfs/xfs_btree.c:140:9: error: call to undeclared function
 'xfs_daddr_to_xfo'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202206021050.LdxdyOWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   1fcd9cea011a657d62ee332d161966c1ec92ffd5
commit: 737a5536fdb7ee845a8a656e14ec1c4554be6dec [172/401] xfs: support in-memory btrees
config: hexagon-randconfig-r041-20220601 (https://download.01.org/0day-ci/archive/20220602/202206021050.LdxdyOWk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=737a5536fdb7ee845a8a656e14ec1c4554be6dec
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 737a5536fdb7ee845a8a656e14ec1c4554be6dec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_btree.c:140:9: error: call to undeclared function 'xfs_daddr_to_xfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   fsb = xfs_daddr_to_xfo(xfs_buf_daddr(bp));
                         ^
   fs/xfs/libxfs/xfs_btree.c:140:9: note: did you mean 'xfs_daddr_to_agno'?
   fs/xfs/xfs_mount.h:590:1: note: 'xfs_daddr_to_agno' declared here
   xfs_daddr_to_agno(struct xfs_mount *mp, xfs_daddr_t d)
   ^
   fs/xfs/libxfs/xfs_btree.c:210:11: error: call to undeclared function 'xfs_daddr_to_xfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   agbno = xfs_daddr_to_xfo(xfs_buf_daddr(bp));
                           ^
   2 errors generated.


vim +/xfs_daddr_to_xfo +140 fs/xfs/libxfs/xfs_btree.c

   103	
   104	/*
   105	 * Check a long btree block header.  Return the address of the failing check,
   106	 * or NULL if everything is ok.
   107	 */
   108	xfs_failaddr_t
   109	__xfs_btree_check_lblock(
   110		struct xfs_btree_cur	*cur,
   111		struct xfs_btree_block	*block,
   112		int			level,
   113		struct xfs_buf		*bp)
   114	{
   115		struct xfs_mount	*mp = cur->bc_mp;
   116		xfs_btnum_t		btnum = cur->bc_btnum;
   117		int			crc = xfs_has_crc(mp);
   118		xfs_failaddr_t		fa;
   119		xfs_fsblock_t		fsb = NULLFSBLOCK;
   120	
   121		if (crc) {
   122			if (!uuid_equal(&block->bb_u.l.bb_uuid, &mp->m_sb.sb_meta_uuid))
   123				return __this_address;
   124			if (block->bb_u.l.bb_blkno !=
   125			    cpu_to_be64(bp ? xfs_buf_daddr(bp) : XFS_BUF_DADDR_NULL))
   126				return __this_address;
   127			if (block->bb_u.l.bb_pad != cpu_to_be32(0))
   128				return __this_address;
   129		}
   130	
   131		if (be32_to_cpu(block->bb_magic) != xfs_btree_magic(crc, btnum))
   132			return __this_address;
   133		if (be16_to_cpu(block->bb_level) != level)
   134			return __this_address;
   135		if (be16_to_cpu(block->bb_numrecs) >
   136		    cur->bc_ops->get_maxrecs(cur, level))
   137			return __this_address;
   138	
   139		if ((cur->bc_flags & XFS_BTREE_IN_MEMORY) && bp)
 > 140			fsb = xfs_daddr_to_xfo(xfs_buf_daddr(bp));
   141		else if (bp)
   142			fsb = XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
   143	
   144		fa = xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
   145				be64_to_cpu(block->bb_u.l.bb_leftsib));
   146		if (!fa)
   147			fa = xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
   148					be64_to_cpu(block->bb_u.l.bb_rightsib));
   149		return fa;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
