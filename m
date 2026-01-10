Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B527CB35;
	Sat, 10 Jan 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768038950; cv=none; b=fnVeVOM+S2hyQ86I+FffOVOIkVwjA5YbV00XqdCDT4eFV+/cEDMsU39uW88x24TOpFkEVj+nTBZFW0riaybow/9HZbfQR8YUVf6HoV2OeLIpdT6S1TJCTbs1fCAoZucy0WiT67Gx+BRWW5gmFG4HmRx3prh4qeJr6J1s0r9lizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768038950; c=relaxed/simple;
	bh=QruXQnlzAShVfE5o68NLPIWF1YZafFinrjIbIjGQmGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=egg93hootcBBOST2hLLdj+IKpl0KBwx2XZ0/m4H8dm+zGfeZ0ZkHo+EBp4x+o74oiFiTfqNZ99TMUKgsrz9OlbcjmnRDYk87qQNf+k2nOm7o3Ix45L6aVLaRUKC36F+ONOfXv+epK2rqhKHKhAH9dL8HTVBBWWfFKImQfc3o50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tm0cGY+O; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tm0cGY+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768038948; x=1799574948;
  h=date:from:to:cc:subject:message-id;
  bh=QruXQnlzAShVfE5o68NLPIWF1YZafFinrjIbIjGQmGg=;
  b=Tm0cGY+OXqy98sCbcSoQLqmEBMBXd43Yysu9EsbJ1yFkhggejlY8HSD9
   ECGkUstdCFZCVdSCOoPJCiqJFtgUvZw5mmxBqjKy5SFuI99ec9taHC7uN
   EfmBFEvocSymYxOPWuslf1MYImeioGXEUDpT9S4U8UTCo29Rvnbu0q6zv
   QNe4imx8xa1HND2wP9gtKGscI/wm6y2ivmHebde/0hcd3fykl+DAJ/00X
   O5mr1jff9pp1Uj2lJq6f14YyWIel1TUKm+hzZUwztStN0zkM3LLTMN91P
   I1bHfbdfkhAdPJwrj9gqHEhcLP9v4qjVk3fczGoza829L4XvYvICphKdG
   A==;
X-CSE-ConnectionGUID: ZR3Dqu5GRrCzOsivQkSP0Q==
X-CSE-MsgGUID: 3wYARB1mQgi56fZnmulC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="71975406"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="71975406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 01:55:47 -0800
X-CSE-ConnectionGUID: eBjvxPeLQWCfbiuB0TGObg==
X-CSE-MsgGUID: oRP1q3DIQO60ybVwBsPKfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="202797938"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jan 2026 01:55:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veVh9-000000008W4-1vKh;
	Sat, 10 Jan 2026 09:55:43 +0000
Date: Sat, 10 Jan 2026 17:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:setlease-6.20 31/33] fs/kernfs/file.c:1027:14:
 error: use of undeclared identifier 'generic_setlease_warn'; did you mean
 'generic_setlease'?
Message-ID: <202601101800.sSWNx9lh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git setlease-6.20
head:   598d158c60458df0f87c3f292a14fded7f5ad7d4
commit: 1bbd4ddee91090a88766298aec112a6dd4f865c4 [31/33] kernfs: add a generic_setlease_warn() function and use it
config: i386-buildonly-randconfig-004-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101800.sSWNx9lh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101800.sSWNx9lh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101800.sSWNx9lh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/kernfs/file.c:1027:14: error: use of undeclared identifier 'generic_setlease_warn'; did you mean 'generic_setlease'?
    1027 |         .setlease       = generic_setlease_warn,
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           generic_setlease
   include/linux/filelock.h:401:19: note: 'generic_setlease' declared here
     401 | static inline int generic_setlease(struct file *filp, int arg,
         |                   ^
   1 error generated.
--
>> fs/kernfs/dir.c:1932:14: error: use of undeclared identifier 'generic_setlease_warn'; did you mean 'generic_setlease'?
    1932 |         .setlease       = generic_setlease_warn,
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           generic_setlease
   include/linux/filelock.h:401:19: note: 'generic_setlease' declared here
     401 | static inline int generic_setlease(struct file *filp, int arg,
         |                   ^
   1 error generated.


vim +1027 fs/kernfs/file.c

  1015	
  1016	const struct file_operations kernfs_file_fops = {
  1017		.read_iter	= kernfs_fop_read_iter,
  1018		.write_iter	= kernfs_fop_write_iter,
  1019		.llseek		= kernfs_fop_llseek,
  1020		.mmap		= kernfs_fop_mmap,
  1021		.open		= kernfs_fop_open,
  1022		.release	= kernfs_fop_release,
  1023		.poll		= kernfs_fop_poll,
  1024		.fsync		= noop_fsync,
  1025		.splice_read	= copy_splice_read,
  1026		.splice_write	= iter_file_splice_write,
> 1027		.setlease	= generic_setlease_warn,
  1028	};
  1029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
