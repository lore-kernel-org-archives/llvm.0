Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78027C
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648695473; x=1680231473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/WJjZChIo8N1c8iyIkTk+sLE9BhLskWf4w/kKr8E+fU=;
  b=GzfEqAgY3Q1FfX4N1+aoGdITa2+WZWG0dY3mvU9PEZ5qFvECcKbfMsFJ
   S7HhCATeVAlKqfGYyeFqAiVAPI2Fn/1gCrUTTg9RcHrEvgWf+pX6WsBmg
   7hDy0l89yUymIBgZY/BbYamKoGM+khdB/kVikg6Jb+e4pGigUgFQ0j2Zs
   rCvihTjQTkrTN+iuMEVbUsydYzqoWa/haUDP2BIScHMQQ71GaUMbIzy7s
   UCG1DmOjRmgoT4vB2GoRxj6CJuwgV+YdcXNklqjXSF9urqQLjoSz3Q9kl
   JQPU3EIrc/QAlGu6zP5aMoJ4VbUdlzaRu650SxqvAbnXJR8+i6dJXqLkU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259419525"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; 
   d="scan'208";a="259419525"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 19:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; 
   d="scan'208";a="520138912"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Mar 2022 19:57:50 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZl0P-0000mi-SJ;
	Thu, 31 Mar 2022 02:57:49 +0000
Date: Thu, 31 Mar 2022 10:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Wang <wang.yi59@zte.com.cn>, djwong@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn,
	wang.liang82@zte.com.cn, Cheng Lin <cheng.lin130@zte.com.cn>
Subject: Re: [PATCH] xfs: getattr ignore blocks beyond eof
Message-ID: <202203311017.dWBicGOM-lkp@intel.com>
References: <20220331080256.1874-1-wang.yi59@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331080256.1874-1-wang.yi59@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Yi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on v5.17 next-20220330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Wang/xfs-getattr-ignore-blocks-beyond-eof/20220331-082944
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
config: s390-randconfig-r002-20220330 (https://download.01.org/0day-ci/archive/20220331/202203311017.dWBicGOM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e560188227f8fed285a1bd736e5708de984f0596
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-Wang/xfs-getattr-ignore-blocks-beyond-eof/20220331-082944
        git checkout e560188227f8fed285a1bd736e5708de984f0596
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_bmap_util.c:756:19: error: use of undeclared identifier 'end_fsb'
           ip->i_last_fsb = end_fsb;
                            ^
   1 error generated.


vim +/end_fsb +756 fs/xfs/xfs_bmap_util.c

   710	
   711	/*
   712	 * This is called to free any blocks beyond eof. The caller must hold
   713	 * IOLOCK_EXCL unless we are in the inode reclaim path and have the only
   714	 * reference to the inode.
   715	 */
   716	int
   717	xfs_free_eofblocks(
   718		struct xfs_inode	*ip)
   719	{
   720		struct xfs_trans	*tp;
   721		struct xfs_mount	*mp = ip->i_mount;
   722		int			error;
   723	
   724		/* Attach the dquots to the inode up front. */
   725		error = xfs_qm_dqattach(ip);
   726		if (error)
   727			return error;
   728	
   729		/* Wait on dio to ensure i_size has settled. */
   730		inode_dio_wait(VFS_I(ip));
   731	
   732		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0, &tp);
   733		if (error) {
   734			ASSERT(xfs_is_shutdown(mp));
   735			return error;
   736		}
   737	
   738		xfs_ilock(ip, XFS_ILOCK_EXCL);
   739		xfs_trans_ijoin(tp, ip, 0);
   740	
   741		/*
   742		 * Do not update the on-disk file size.  If we update the on-disk file
   743		 * size and then the system crashes before the contents of the file are
   744		 * flushed to disk then the files may be full of holes (ie NULL files
   745		 * bug).
   746		 */
   747		error = xfs_itruncate_extents_flags(&tp, ip, XFS_DATA_FORK,
   748					XFS_ISIZE(ip), XFS_BMAPI_NODISCARD);
   749		if (error)
   750			goto err_cancel;
   751	
   752		error = xfs_trans_commit(tp);
   753		if (error)
   754			goto out_unlock;
   755	
 > 756		ip->i_last_fsb = end_fsb;
   757		xfs_inode_clear_eofblocks_tag(ip);
   758		goto out_unlock;
   759	
   760	err_cancel:
   761		/*
   762		 * If we get an error at this point we simply don't
   763		 * bother truncating the file.
   764		 */
   765		xfs_trans_cancel(tp);
   766	out_unlock:
   767		xfs_iunlock(ip, XFS_ILOCK_EXCL);
   768		return error;
   769	}
   770	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
