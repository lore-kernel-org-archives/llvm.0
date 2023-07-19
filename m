Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3763417D1;
	Wed, 19 Jul 2023 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689734131; x=1721270131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDteXjRKx7NmerjEa3yZjR1TrOfJzj9AzQhufP0RH3c=;
  b=cQSP1M3xA2NRBIveWsTWMLO92yAlevv5lTHuJsbQsa5FupCfhpz/fX0b
   sZ2THWlSaYoBD9QvIJOWriCMbsvD/DpS0ktHt0nNPJLU6M+Oi0iua4grm
   IaXQGvbVtFaGXlp8EYaqbAiweVk/vbE4ai2w+azE5H6jfBMttwYCYPtWp
   t0cQUSo5GNBknLFe9hqkkHNaWO+33mYzLYx9B3UXEjVjg4d6XwUSGhOmg
   f0oxNR46HAXfO5203k0fKNKa8f0ipcguIbfe6hu1fsGliQpQ9BvRvfeq1
   AiFEBNG3ZA+DCYZAzZYVQ1Y6TNGlF3uZZ+bQtHvI8mIrXvbeaYByZUBRb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452734652"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="452734652"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717831095"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="717831095"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 19:35:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLx2C-00044R-31;
	Wed, 19 Jul 2023 02:35:24 +0000
Date: Wed, 19 Jul 2023 10:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Xu <hao.xu@linux.dev>, io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 4/5] xfs: add NOWAIT semantics for readdir
Message-ID: <202307191021.L6wiZiE6-lkp@intel.com>
References: <20230718132112.461218-5-hao.xu@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718132112.461218-5-hao.xu@linux.dev>

Hi Hao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v6.5-rc2 next-20230718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Xu/fs-split-off-vfs_getdents-function-of-getdents64-syscall/20230718-212529
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230718132112.461218-5-hao.xu%40linux.dev
patch subject: [PATCH 4/5] xfs: add NOWAIT semantics for readdir
config: x86_64-randconfig-r012-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191021.L6wiZiE6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191021.L6wiZiE6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191021.L6wiZiE6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_da_btree.c:2646:8: warning: variable 'buf_flags' set but not used [-Wunused-but-set-variable]
           int                     buf_flags = 0;
                                   ^
   1 warning generated.


vim +/buf_flags +2646 fs/xfs/libxfs/xfs_da_btree.c

  2627	
  2628	/*
  2629	 * Get a buffer for the dir/attr block, fill in the contents.
  2630	 */
  2631	int
  2632	xfs_da_read_buf(
  2633		struct xfs_trans	*tp,
  2634		struct xfs_inode	*dp,
  2635		xfs_dablk_t		bno,
  2636		unsigned int		flags,
  2637		struct xfs_buf		**bpp,
  2638		int			whichfork,
  2639		const struct xfs_buf_ops *ops)
  2640	{
  2641		struct xfs_mount	*mp = dp->i_mount;
  2642		struct xfs_buf		*bp;
  2643		struct xfs_buf_map	map, *mapp = &map;
  2644		int			nmap = 1;
  2645		int			error;
> 2646		int			buf_flags = 0;
  2647	
  2648		*bpp = NULL;
  2649		error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
  2650		if (error || !nmap)
  2651			goto out_free;
  2652	
  2653		/*
  2654		 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
  2655		 * issue IO for this buffer if it is not already in memory. Caller will
  2656		 * retry. This will return -EAGAIN if the buffer is in memory and cannot
  2657		 * be locked, and no buffer and no error if it isn't in memory.  We
  2658		 * translate both of those into a return state of -EAGAIN and *bpp =
  2659		 * NULL.
  2660		 */
  2661		if (flags & XFS_DABUF_NOWAIT)
  2662			buf_flags |= XBF_TRYLOCK | XBF_INCORE;
  2663		error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
  2664				&bp, ops);
  2665		if (error)
  2666			goto out_free;
  2667		if (!bp) {
  2668			ASSERT(flags & XFS_DABUF_NOWAIT);
  2669			error = -EAGAIN;
  2670			goto out_free;
  2671		}
  2672	
  2673		if (whichfork == XFS_ATTR_FORK)
  2674			xfs_buf_set_ref(bp, XFS_ATTR_BTREE_REF);
  2675		else
  2676			xfs_buf_set_ref(bp, XFS_DIR_BTREE_REF);
  2677		*bpp = bp;
  2678	out_free:
  2679		if (mapp != &map)
  2680			kmem_free(mapp);
  2681	
  2682		return error;
  2683	}
  2684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
