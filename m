Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FD4570DC;
	Tue, 28 Jul 2026 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251343; cv=none; b=WQK8VySxd53OEgazAi/DXbr8Ef51Cshbt6Hrspgud0tiMSegKfk1T6Suwxe/wcRnwT6xjbSwYqPj/yBICJKsLy8XPON6Ym734rtah+8OvZjP8N+wwWShVmRsMFA6Kx4EJgUibU/UFrf5bl7Yb6LKwmLxpYDcLe/vifhi0J6TpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251343; c=relaxed/simple;
	bh=Hlc+ez1J6OkDztNCydKVnjxnImyyAuuKv22Ig4YL0fw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FBNnymjyFK0+MSXSFy/VeJORDwNyALke2S91GC7WuUY8JgN3hNXi+woVI5GRHDldi03ISlVzBxutjqNP35HBoPq8ZYfWycy422/5Tr+l2AJpDEahcorgwwjj0Ve7KpKMvkNqxYpmyk4uoWUrpsjnestDuLI4CA6j1iPAn4GtAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXbjYL4Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXbjYL4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785251341; x=1816787341;
  h=date:from:to:cc:subject:message-id;
  bh=Hlc+ez1J6OkDztNCydKVnjxnImyyAuuKv22Ig4YL0fw=;
  b=eXbjYL4Z8HWJ5pmVyPxVtCAZORjAfG61E+LgjSHfpP6Zvq5cS7HGXmLf
   mYVPnISwPQEpyh1E6YAmIIUw2JCzxQq7Lqtx/HrzVgdsE0x3cZjDRdytY
   HCVb5LSSK07E9Om+AfkD+fPBohebnEp5GyJhSRSIUpaD1awkWmQIi7WmH
   gB4dkaKB4yFS9baVGuqCXQWPaFNUcBH0vgwIUe8zyhgTCtu4AEABezTOE
   uk5/GC6nI0IHaWPG4YpyyNCZ1Q2Z05YeR9Ecg4u+sFASbY8TEl0n5dbEn
   hVYxI4UxdsF0QeGxLZlRbYZsyZg7kijatoB4YGiCy1q3zdNJsIwNbwpJf
   Q==;
X-CSE-ConnectionGUID: amaf6WjAQhmaYMhB3loNmA==
X-CSE-MsgGUID: 2iFpIaYDQoSEbgVUOxN5xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84818719"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84818719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:09:00 -0700
X-CSE-ConnectionGUID: 8ZH7zDuuTcSWD9cvkO438A==
X-CSE-MsgGUID: ZNDQH+XCQ9CLswVWhOqJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264028451"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 08:08:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wojQO-00000000eTD-2vwL;
	Tue, 28 Jul 2026 15:08:56 +0000
Date: Tue, 28 Jul 2026 23:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 6/9] block/ioctl.c:958:8: error:
 call to undeclared function 'blk_uring_cmd_alloc_iobuf'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202607282211.C9sCcdUM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 37ff77d98dbfae93b246dadfe1d25b768b9e8798 [6/9] block: add a uring command for pool-backed fixed buffers
config: arm-pxa168_defconfig (https://download.01.org/0day-ci/archive/20260728/202607282211.C9sCcdUM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282211.C9sCcdUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282211.C9sCcdUM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/ioctl.c:958:8: error: call to undeclared function 'blk_uring_cmd_alloc_iobuf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     958 |         ret = blk_uring_cmd_alloc_iobuf(cmd, pool, buf_index, len, issue_flags);
         |               ^
   block/ioctl.c:958:8: note: did you mean 'blkdev_cmd_alloc_iobuf'?
   block/ioctl.c:948:12: note: 'blkdev_cmd_alloc_iobuf' declared here
     948 | static int blkdev_cmd_alloc_iobuf(struct io_uring_cmd *cmd,
         |            ^
     949 |                                   struct block_device *bdev, u64 buf_index,
     950 |                                   u64 len, unsigned int issue_flags)
     951 | {
     952 |         struct blk_iobuf_pool *pool;
     953 |         int ret;
     954 | 
     955 |         pool = blk_queue_get_iobuf_pool(bdev_get_queue(bdev));
     956 |         if (!pool)
     957 |                 return -EOPNOTSUPP;
     958 |         ret = blk_uring_cmd_alloc_iobuf(cmd, pool, buf_index, len, issue_flags);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~
         |               blkdev_cmd_alloc_iobuf
   1 error generated.


vim +/blk_uring_cmd_alloc_iobuf +958 block/ioctl.c

   947	
   948	static int blkdev_cmd_alloc_iobuf(struct io_uring_cmd *cmd,
   949					  struct block_device *bdev, u64 buf_index,
   950					  u64 len, unsigned int issue_flags)
   951	{
   952		struct blk_iobuf_pool *pool;
   953		int ret;
   954	
   955		pool = blk_queue_get_iobuf_pool(bdev_get_queue(bdev));
   956		if (!pool)
   957			return -EOPNOTSUPP;
 > 958		ret = blk_uring_cmd_alloc_iobuf(cmd, pool, buf_index, len, issue_flags);
   959		blk_iobuf_pool_put(pool);
   960		return ret;
   961	}
   962	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
