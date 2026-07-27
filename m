Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E741A518;
	Mon, 27 Jul 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158677; cv=none; b=Q4Xtvofp3lIbD7XquqianKM1MzG2fs6TQZvqye2jyUfrJ/qE58Mz7oj4FwTl65+hKA5uV9NK/uccg2RSZXsQpVJ1d7TOhBwqHWQkjAKNHjUHCEPk+ddxwmqmeTzcw5ZcuJr2NhKynf4kT363UyMVutfLgrDj3YtGZF9nIBiL2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158677; c=relaxed/simple;
	bh=jRySGSCpCGntiXIX1Cg5O4sgMoQ6xYcs+ppBuOcM4X4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hg0BlC8DicYKgEbb95P9Y9s5SqqM5gbtALN4yp6DL/YC3fhk4OsfE6PubRgB4IwaeVrl/RW5QN8LMVbjyYxMhYnKGDXpAlFpItZvoRilqTn/gDjbkmyN4/G3tZBP/1Dsnko7MFj5LqFWWEDY56RvKDyYzLoz/SSZK60/gAIzZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHNIrrXY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHNIrrXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785158676; x=1816694676;
  h=date:from:to:cc:subject:message-id;
  bh=jRySGSCpCGntiXIX1Cg5O4sgMoQ6xYcs+ppBuOcM4X4=;
  b=WHNIrrXYE7IshUHylA4IBkorEOpldv8kXsx032uxwZy0aF9jjdkoSnoH
   GvWFLlTnEvXW6tfdS5+QE5ZmqQGDnFbYLdr9mo2/lYXQNhPb1YvHlfuik
   dp4e3PXCQsTiK7DII9MySz1+SaTW9LY+wxUhDr/JjpGm/pPrmY+BzZW0k
   FJVZpUkY6kTJcZEfvkjqrYJLYfR2bsLl4pJT7eAi7tRVAdt+Cl4RAkZe+
   QAunaxZsksC3MN7j9Tf9WbORTjJCIuZn7BaDPXmXOA/50Sq42Q5DRst1k
   +CeX4m7lXN0q3lVzn5txeW/WfUpp+MOToNnpg6+kPnRllSVXZvl9MI10p
   w==;
X-CSE-ConnectionGUID: 7CtFRTkhSI6tfNJRYT36HQ==
X-CSE-MsgGUID: kqaWUPuBQXK8LS1LmJXtEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85489491"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85489491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 06:24:34 -0700
X-CSE-ConnectionGUID: ZR+klEg/Qp6pbndlrCx5Fg==
X-CSE-MsgGUID: Lr2gnpHXRxuUTkhjd10f6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="257622615"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2026 06:24:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woLJm-00000000dBA-1WXs;
	Mon, 27 Jul 2026 13:24:30 +0000
Date: Mon, 27 Jul 2026 21:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs.all 224/271] fs/bfs/inode.c:180:43:
 error: no member named 'ino' in 'struct inode'
Message-ID: <202607272132.5qdCaHxj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs.all
head:   000710393edad9c9974ee19ce0e95459137b3c3b
commit: 763d78b5dbba67952960a5f40ad15518c79fae86 [224/271] bfs: Fix data integrity writeout issues
config: s390-randconfig-001-20260727 (https://download.01.org/0day-ci/archive/20260727/202607272132.5qdCaHxj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607272132.5qdCaHxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607272132.5qdCaHxj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bfs/inode.c:180:43: error: no member named 'ino' in 'struct inode'
     180 |         di = find_inode(inode->i_sb, (u16)inode->ino, &bh);
         |                                           ~~~~~  ^
   1 error generated.


vim +180 fs/bfs/inode.c

   172	
   173	static int bfs_sync_inode_metadata(struct inode *inode,
   174					   struct writeback_control *wbc)
   175	{
   176		int err = 0;
   177		struct bfs_inode *di;
   178		struct buffer_head *bh;
   179	
 > 180		di = find_inode(inode->i_sb, (u16)inode->ino, &bh);
   181		if (IS_ERR(di))
   182			return PTR_ERR(di);
   183	
   184		sync_dirty_buffer(bh);
   185		if (buffer_write_io_error(bh)) {
   186			err = -EIO;
   187			goto out;
   188		}
   189		err = mmb_sync(&BFS_I(inode)->i_metadata_bhs);
   190	out:
   191		brelse(bh);
   192		return err;
   193	}
   194	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
