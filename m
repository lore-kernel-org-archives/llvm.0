Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17937030B;
	Tue, 18 Nov 2025 20:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497635; cv=none; b=lWmyTRW4obh/Rtkbv9DGglZDoJisaC6bey/y0ZZ1JCd3b52YadFb8+Jut6ePfzKyPsPnAsutQMhq7lUF2DUxGbnO7t05/F/Ficx7USsGId29705pOewMyTLzFNuPjhjjZVbSCZXthk77pUtKy/cFB6Ho2P6TNhrsOvWkj1py4lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497635; c=relaxed/simple;
	bh=IbtV1V8rb0h0MZMenEfUJu74TCcO3TwBZgmgW34SdiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WTL+cmdCczrVKqN7X0M2xW/TOC4DfmHaObbYreXWy+RcRDCQ5BWd3SKz7wIuRVqIkpYEEBdBrYzM5lmXaUJYCYT9717RB8AxalyuXwmkZa6QngqCQJ0ZIj2n7qlnH/BJEdmUfB807hvuYWvWhYCJ+K5Nh5PVQhRUt5B8BZ9gLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3QFxnev; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3QFxnev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763497634; x=1795033634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbtV1V8rb0h0MZMenEfUJu74TCcO3TwBZgmgW34SdiU=;
  b=j3QFxnevyMbIZLHIXnMZhqpIxL1zAOQnZhrDFlXVE5lgJMu3sHaDkMrV
   b04zXskJMJoLeNh4FTk01QxsXqHojurAXY/qY9ND5vcUUtAi1nMS/CCF7
   mt1r9NL+HwoKS6GipsvXwHnqq0xB/K3axQNbcnGRMWayOCB1s7pJapvGY
   vc/EeF2OP0pczRkddD+I8+tz8+B/OfmdsMSVt9un4YpvBaCoyVoijpUA/
   uBVIWwqTWSAafE8cxC39bGEw8ApYO5FFZVpN/Ik3K5yKOx5y/BANGjJMx
   8shmMzfPWiwz2jTUh2hdmhK1mZBUd7gi8qWMpDJWk79uJHJ/ImKAoLg8p
   g==;
X-CSE-ConnectionGUID: SwuNHsv9QFS+WX6oJTMMHA==
X-CSE-MsgGUID: FbhgfDdCQCyzfqgtmh5yZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65473610"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65473610"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 12:27:14 -0800
X-CSE-ConnectionGUID: SxvaQL4+QSqmvpQSPzYWjA==
X-CSE-MsgGUID: GNEP+mM0SmWAy+iXNurQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195989795"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Nov 2025 12:27:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLSI9-00029H-2I;
	Tue, 18 Nov 2025 20:27:09 +0000
Date: Wed, 19 Nov 2025 04:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare 42/43] fs/xfs/xfs_handle.c:277:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202511190447.ZpMsjLKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare
head:   7eb06f9f7a76175a82d3c6b9d94219d7b64b6bce
commit: 82f312eed222c8b171f70ee2ee055071ba43a665 [42/43] fs: xfs
config: arm-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190447.ZpMsjLKJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190447.ZpMsjLKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190447.ZpMsjLKJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_handle.c:277:3: error: cannot jump from this goto statement to its label
                   goto out_dput;
                   ^
   fs/xfs/xfs_handle.c:283:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
           FD_PREPARE(fdprep, 0, dentry_open(&path, hreq->oflags, cred));
                      ^
   fs/xfs/xfs_handle.c:271:3: error: cannot jump from this goto statement to its label
                   goto out_dput;
                   ^
   fs/xfs/xfs_handle.c:283:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
           FD_PREPARE(fdprep, 0, dentry_open(&path, hreq->oflags, cred));
                      ^
   fs/xfs/xfs_handle.c:266:3: error: cannot jump from this goto statement to its label
                   goto out_dput;
                   ^
   fs/xfs/xfs_handle.c:283:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
           FD_PREPARE(fdprep, 0, dentry_open(&path, hreq->oflags, cred));
                      ^
   fs/xfs/xfs_handle.c:254:3: error: cannot jump from this goto statement to its label
                   goto out_dput;
                   ^
   fs/xfs/xfs_handle.c:283:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
           FD_PREPARE(fdprep, 0, dentry_open(&path, hreq->oflags, cred));
                      ^
   4 errors generated.


vim +277 fs/xfs/xfs_handle.c

af69d852dfe62b Darrick J. Wong   2024-04-22  260  
af69d852dfe62b Darrick J. Wong   2024-04-22  261  	permflag = hreq->oflags;
af69d852dfe62b Darrick J. Wong   2024-04-22  262  	fmode = OPEN_FMODE(permflag);
af69d852dfe62b Darrick J. Wong   2024-04-22  263  	if ((!(permflag & O_APPEND) || (permflag & O_TRUNC)) &&
af69d852dfe62b Darrick J. Wong   2024-04-22  264  	    (fmode & FMODE_WRITE) && IS_APPEND(inode)) {
af69d852dfe62b Darrick J. Wong   2024-04-22  265  		error = -EPERM;
af69d852dfe62b Darrick J. Wong   2024-04-22  266  		goto out_dput;
af69d852dfe62b Darrick J. Wong   2024-04-22  267  	}
af69d852dfe62b Darrick J. Wong   2024-04-22  268  
af69d852dfe62b Darrick J. Wong   2024-04-22  269  	if ((fmode & FMODE_WRITE) && IS_IMMUTABLE(inode)) {
af69d852dfe62b Darrick J. Wong   2024-04-22  270  		error = -EPERM;
af69d852dfe62b Darrick J. Wong   2024-04-22  271  		goto out_dput;
af69d852dfe62b Darrick J. Wong   2024-04-22  272  	}
af69d852dfe62b Darrick J. Wong   2024-04-22  273  
af69d852dfe62b Darrick J. Wong   2024-04-22  274  	/* Can't write directories. */
af69d852dfe62b Darrick J. Wong   2024-04-22  275  	if (S_ISDIR(inode->i_mode) && (fmode & FMODE_WRITE)) {
af69d852dfe62b Darrick J. Wong   2024-04-22  276  		error = -EISDIR;
af69d852dfe62b Darrick J. Wong   2024-04-22 @277  		goto out_dput;
af69d852dfe62b Darrick J. Wong   2024-04-22  278  	}
af69d852dfe62b Darrick J. Wong   2024-04-22  279  
af69d852dfe62b Darrick J. Wong   2024-04-22  280  	path.mnt = parfilp->f_path.mnt;
af69d852dfe62b Darrick J. Wong   2024-04-22  281  	path.dentry = dentry;
82f312eed222c8 Christian Brauner 2025-11-18  282  
82f312eed222c8 Christian Brauner 2025-11-18  283  	FD_PREPARE(fdprep, 0, dentry_open(&path, hreq->oflags, cred));
af69d852dfe62b Darrick J. Wong   2024-04-22  284  	dput(dentry);
82f312eed222c8 Christian Brauner 2025-11-18  285  	if (fd_prepare_failed(fdprep))
82f312eed222c8 Christian Brauner 2025-11-18  286  		return fd_prepare_error(fdprep);
af69d852dfe62b Darrick J. Wong   2024-04-22  287  
af69d852dfe62b Darrick J. Wong   2024-04-22  288  	if (S_ISREG(inode->i_mode)) {
82f312eed222c8 Christian Brauner 2025-11-18  289  		struct file *filp = fd_prepare_file(fdprep);
82f312eed222c8 Christian Brauner 2025-11-18  290  
af69d852dfe62b Darrick J. Wong   2024-04-22  291  		filp->f_flags |= O_NOATIME;
af69d852dfe62b Darrick J. Wong   2024-04-22  292  		filp->f_mode |= FMODE_NOCMTIME;
af69d852dfe62b Darrick J. Wong   2024-04-22  293  	}
af69d852dfe62b Darrick J. Wong   2024-04-22  294  
82f312eed222c8 Christian Brauner 2025-11-18  295  	return fd_publish(fdprep);
af69d852dfe62b Darrick J. Wong   2024-04-22  296  
af69d852dfe62b Darrick J. Wong   2024-04-22  297   out_dput:
af69d852dfe62b Darrick J. Wong   2024-04-22  298  	dput(dentry);
af69d852dfe62b Darrick J. Wong   2024-04-22  299  	return error;
af69d852dfe62b Darrick J. Wong   2024-04-22  300  }
af69d852dfe62b Darrick J. Wong   2024-04-22  301  

:::::: The code at line 277 was first introduced by commit
:::::: af69d852dfe62b925d0df401eafad40698c889c6 xfs: move handle ioctl code to xfs_handle.c

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
