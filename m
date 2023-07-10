Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B189156D5;
	Mon, 10 Jul 2023 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689024811; x=1720560811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kb2rc3LY9QiBnaOXj6f06OeidL9rzaYUAi7KLEwieJc=;
  b=mQ/FqykBmwpHbQdLpDebsf/uxygpuQdpYUSr4BxGIBC5Y06OYghhECpZ
   38ObY/x3yy/90vsQGIpqwz+liBtMXCNbZXDEKD11SfpvRVxB9qpT/to13
   qBvFsV+kNn57Qc3MFugBG4O7zVzgxmCZKhG6tL+O3AzyQHUNmjg353FtN
   fBFh0+lrVHCQLR9M3s20wbKdFnuQo7wst1IA8411Z8OGLb7ME35NUe0CF
   rQtHh9HN7d0tmT+SVY4UGO+ydjfUEIvINnFdPTKLJ+wAiBlHqQh1Ohvyn
   EgnU1utCcwzoiPDh2zB4GwHNPLsXarnb4OR/z7bufZ15JBYwRX8yUGKfM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367958144"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="367958144"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="671121006"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="671121006"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2023 14:33:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIyVc-00041M-1S;
	Mon, 10 Jul 2023 21:33:28 +0000
Date: Tue, 11 Jul 2023 05:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 5/6] fs/f2fs/super.c:1563:17: error: no
 member named 'blkz_seq' in 'struct f2fs_dev_info'
Message-ID: <202307110542.NBAMyZxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   d73b38253cda925126fc85e32277fbe2f1b100bf
commit: 2031cbae1532cadb0838ebc1fecbfd14698b5a0a [5/6] f2fs: don't reopen the main block device in f2fs_scan_devices
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230711/202307110542.NBAMyZxE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110542.NBAMyZxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110542.NBAMyZxE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/super.c:1563:17: error: no member named 'blkz_seq' in 'struct f2fs_dev_info'
           kvfree(FDEV(0).blkz_seq);
                  ~~~~~~~ ^
   1 error generated.


vim +1563 fs/f2fs/super.c

  1558	
  1559	static void destroy_device_list(struct f2fs_sb_info *sbi)
  1560	{
  1561		int i;
  1562	
> 1563		kvfree(FDEV(0).blkz_seq);
  1564		for (i = 1; i < sbi->s_ndevs; i++) {
  1565			blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
  1566	#ifdef CONFIG_BLK_DEV_ZONED
  1567			kvfree(FDEV(i).blkz_seq);
  1568	#endif
  1569		}
  1570		kvfree(sbi->devs);
  1571	}
  1572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
