Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7314D1BC2A;
	Sat, 15 Nov 2025 01:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763168582; cv=none; b=n89LLpABloh4ebTSWpZBMhF/X0+kopiWDEQrjUL0m8xRYUCFDlOGO9t6Bxc5DqkQFzSMX1RkAL9tz4v2r5g43P2HCV8ifCtOHwLJM84zUOjZASaix8yDSYucfYFUnia/4bsguzGOt3ZkOHjwmShbJ8pfpjd9xLaGqJTKxLxjfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763168582; c=relaxed/simple;
	bh=NnYJHP7u7ZlhpggsBjpqGVjFWOWFrpMT0XnC+E9hbS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJE528v0cknrfW7yhcBrdCimdv4H/qHfDCoh8DYbPZHJnlMPtcN/ncFnozyNnB6gfpi7WwFiqKkvWxTa4e+1SWSi8KjEKDKX0NULu8sRyzWHHLJGpw3YNnZOXPr4Dq2LOz6/MgcNmgOYXcb4KKt7lz0kskbbeQ4gSEgqCJ5ITFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cf3piPoM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cf3piPoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763168580; x=1794704580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnYJHP7u7ZlhpggsBjpqGVjFWOWFrpMT0XnC+E9hbS4=;
  b=Cf3piPoM4fx344EWkAY7gIIJqs4FOwzh/6rL+p5DDotN0tnqRGzuhTM0
   vd/KbQRm6Ko+FG4+Nbah6P7LN2C2eMz0bO6GzG4wviGT/rHmEddDmMRM2
   +z1P+BLqFsph5okiDZcsERKyCxv5g5YzIi4SaGYNFKzmxUZAoTmN4lamC
   EmOP9TK0rPgDXkEs/oxQ6eyzUc7+97yoa0Tt3WVk3PDPsTCHChvAY3vas
   VdY/rjQsY9XY9yNsLPdXiF827oynK2ZuZQUQL/jw/tV2l1JxGFAehmIkm
   JqmaaHYntW3hvUDAALUpG5AaONjEcbIeskk+mpwiKQMJ4eyjm+vi85H4t
   g==;
X-CSE-ConnectionGUID: 34J/Uix2Q2K6pNMA8m7sJg==
X-CSE-MsgGUID: PLwnmc76R1yKp6c7Ewglvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65422607"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65422607"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 17:03:00 -0800
X-CSE-ConnectionGUID: 5yHl/vqlSV2U/mOMjbsTUg==
X-CSE-MsgGUID: 9HhdrcOkSKOQqgDYj3TBkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190692580"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2025 17:02:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK4gp-0007Zb-2d;
	Sat, 15 Nov 2025 01:02:55 +0000
Date: Sat, 15 Nov 2025 09:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Chaitanya Kulkarni <kch@nvidia.com>, Jens Axboe <axboe@kernel.dk>
Subject: [brauner-github:vfs-6.19.iomap 39/44] fs/overlayfs/file.c:376:10:
 error: use of undeclared identifier 'IOCB_DIO_CALLER_COMP'
Message-ID: <202511150802.j5gDUnim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.iomap
head:   d9b964dbfd3e15635eae30da757e91c70f9d4628
commit: 56749ed317e256c6dc3ca83e246fc17479366f83 [39/44] fs, iomap: remove IOCB_DIO_CALLER_COMP
config: arm-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150802.j5gDUnim-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150802.j5gDUnim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150802.j5gDUnim-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/overlayfs/file.c:376:10: error: use of undeclared identifier 'IOCB_DIO_CALLER_COMP'
     376 |         ifl &= ~IOCB_DIO_CALLER_COMP;
         |                 ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/IOCB_DIO_CALLER_COMP +376 fs/overlayfs/file.c

16914e6fc7e174 Miklos Szeredi    2018-07-18  344  
2a92e07edc5ede Miklos Szeredi    2018-07-18  345  static ssize_t ovl_write_iter(struct kiocb *iocb, struct iov_iter *iter)
2a92e07edc5ede Miklos Szeredi    2018-07-18  346  {
2a92e07edc5ede Miklos Szeredi    2018-07-18  347  	struct file *file = iocb->ki_filp;
2a92e07edc5ede Miklos Szeredi    2018-07-18  348  	struct inode *inode = file_inode(file);
d66907b51ba074 Amir Goldstein    2024-11-05  349  	struct file *realfile;
2a92e07edc5ede Miklos Szeredi    2018-07-18  350  	ssize_t ret;
c86243b090bc25 Vivek Goyal       2020-08-31  351  	int ifl = iocb->ki_flags;
a6293b3e285cd0 Amir Goldstein    2023-11-22  352  	struct backing_file_ctx ctx = {
a6293b3e285cd0 Amir Goldstein    2023-11-22  353  		.cred = ovl_creds(inode->i_sb),
f03b296e8b516d Amir Goldstein    2024-10-14  354  		.end_write = ovl_file_end_write,
a6293b3e285cd0 Amir Goldstein    2023-11-22  355  	};
2a92e07edc5ede Miklos Szeredi    2018-07-18  356  
2a92e07edc5ede Miklos Szeredi    2018-07-18  357  	if (!iov_iter_count(iter))
2a92e07edc5ede Miklos Szeredi    2018-07-18  358  		return 0;
2a92e07edc5ede Miklos Szeredi    2018-07-18  359  
2a92e07edc5ede Miklos Szeredi    2018-07-18  360  	inode_lock(inode);
2a92e07edc5ede Miklos Szeredi    2018-07-18  361  	/* Update mode */
2878dffc7db0b5 Christian Brauner 2022-04-04  362  	ovl_copyattr(inode);
2a92e07edc5ede Miklos Szeredi    2018-07-18  363  
d66907b51ba074 Amir Goldstein    2024-11-05  364  	realfile = ovl_real_file(file);
d66907b51ba074 Amir Goldstein    2024-11-05  365  	ret = PTR_ERR(realfile);
d66907b51ba074 Amir Goldstein    2024-11-05  366  	if (IS_ERR(realfile))
2a92e07edc5ede Miklos Szeredi    2018-07-18  367  		goto out_unlock;
2a92e07edc5ede Miklos Szeredi    2018-07-18  368  
c86243b090bc25 Vivek Goyal       2020-08-31  369  	if (!ovl_should_sync(OVL_FS(inode->i_sb)))
c86243b090bc25 Vivek Goyal       2020-08-31  370  		ifl &= ~(IOCB_DSYNC | IOCB_SYNC);
c86243b090bc25 Vivek Goyal       2020-08-31  371  
2d1b3bbc3dd56f Jens Axboe        2023-09-25  372  	/*
2d1b3bbc3dd56f Jens Axboe        2023-09-25  373  	 * Overlayfs doesn't support deferred completions, don't copy
2d1b3bbc3dd56f Jens Axboe        2023-09-25  374  	 * this property in case it is set by the issuer.
2d1b3bbc3dd56f Jens Axboe        2023-09-25  375  	 */
2d1b3bbc3dd56f Jens Axboe        2023-09-25 @376  	ifl &= ~IOCB_DIO_CALLER_COMP;
d66907b51ba074 Amir Goldstein    2024-11-05  377  	ret = backing_file_write_iter(realfile, iter, iocb, ifl, &ctx);
2a92e07edc5ede Miklos Szeredi    2018-07-18  378  
2a92e07edc5ede Miklos Szeredi    2018-07-18  379  out_unlock:
2a92e07edc5ede Miklos Szeredi    2018-07-18  380  	inode_unlock(inode);
2a92e07edc5ede Miklos Szeredi    2018-07-18  381  
2a92e07edc5ede Miklos Szeredi    2018-07-18  382  	return ret;
2a92e07edc5ede Miklos Szeredi    2018-07-18  383  }
2a92e07edc5ede Miklos Szeredi    2018-07-18  384  

:::::: The code at line 376 was first introduced by commit
:::::: 2d1b3bbc3dd56fc8364350eb93e5d67a05cb2c23 ovl: disable IOCB_DIO_CALLER_COMP

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
