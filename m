Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988C1B94F;
	Sun, 14 Apr 2024 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713079966; cv=none; b=q+yRT1hZorcsuSMCTJI5Fs/iDpE37ugJAc3FDxbD8bDjIdzKf98LIsz1OUQwvi6yOk3RtDH+u4LZg1G1RE4k5w7pK1hlkxqiPR6jkqhguek6noBmfiY8cEsMUwxzIFDMw3R/oURgJZh4qODQn0t0/Q203NzcqrPt3nXxP5UHY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713079966; c=relaxed/simple;
	bh=7o6sMG9MzLqOQGU4z5cPOsj2iJRdTgJ8ECqthCFSP48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIaLpOiWYHQZn6pkc5Hvt4Jm4MP80yVVVY+qPAPkUzS8W6aUp8jiGWDzliZ1jlBM+QG0rORfSZFGomCf8hfXQT0X9LPdGJ2P0F2OsjqKOlf6wwfxWId4t17/r189yxTWXsX2f77gOh9tf3LxHL7qJbDdklL8EsZmaJqRWxTBUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChXXhoYT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChXXhoYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713079964; x=1744615964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7o6sMG9MzLqOQGU4z5cPOsj2iJRdTgJ8ECqthCFSP48=;
  b=ChXXhoYTBR1LiJFv9of8XWVSHPcrx1Ab5N5E21Ej+VCpXZzaoSH+M54R
   C/aut4PaTx6mU+bwTL/TynM07UJc7XJcQ9sO/+WpmXWLT+b3KW1ZfT6ZZ
   lMOlAK2kkoaSwyzWQ2Oj09XM1fmqcDs+GRfHaEdBiq68IlTu+tZI7LAKF
   Ww5Z6AaypLXTp8xHPkJVDvKN8GBxzhF+0C0yXGmOyEW2NhVKl4VgN06WC
   whUhLsUd+GU8TE+j4E7iUkyWaHHVAvJrAdgHUFzVZ/2TyzEWY1CvD7mAY
   SdYhO5h79vxYp22xC/958sblCqSKw6UMuzQYejQ7J0EBPxTpzm3pozsX8
   g==;
X-CSE-ConnectionGUID: 1wkC5S4kRCm1sGl8mBRC/Q==
X-CSE-MsgGUID: I37wU65YS9aEwfHlI768QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="33876550"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="33876550"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 00:32:43 -0700
X-CSE-ConnectionGUID: fehebnc2RYuCnwye1tk9hQ==
X-CSE-MsgGUID: Dt/D8qEuSwaqdNQVoIcCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21713365"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2024 00:32:42 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvuLv-0003TA-30;
	Sun, 14 Apr 2024 07:32:39 +0000
Date: Sun, 14 Apr 2024 15:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 29/438] drivers/char/nwflash.c:129:40: error:
 use of undeclared identifier 'ppos'
Message-ID: <202404141542.cP2ElTE1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   4855883f3d590ecdf8f8870966dad5ca923dd6ce
commit: 55a4bb61a27afcdd2e5258639821ad6f57bdd166 [29/438] char/nwflash: convert to read/write iterators
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20240414/202404141542.cP2ElTE1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141542.cP2ElTE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141542.cP2ElTE1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/nwflash.c:22:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/char/nwflash.c:129:40: error: use of undeclared identifier 'ppos'
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                      ^
>> drivers/char/nwflash.c:129:46: error: use of undeclared identifier 'buf'
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                            ^
>> drivers/char/nwflash.c:129:51: error: use of undeclared identifier 'size'
     129 |                        "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
         |                                                                 ^
   1 warning and 3 errors generated.


vim +/ppos +129 drivers/char/nwflash.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  122  
55a4bb61a27afcd Jens Axboe     2024-04-09  123  static ssize_t flash_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f415 Linus Torvalds 2005-04-16  124  {
6ee8928d94841aa Akinobu Mita   2008-07-25  125  	ssize_t ret;
^1da177e4c3f415 Linus Torvalds 2005-04-16  126  
^1da177e4c3f415 Linus Torvalds 2005-04-16  127  	if (flashdebug)
4ef584ba84125b6 Russell King   2008-07-26  128  		printk(KERN_DEBUG "flash_read: flash_read: offset=0x%llx, "
4ef584ba84125b6 Russell King   2008-07-26 @129  		       "buffer=%p, count=0x%zx.\n", *ppos, buf, size);
^1da177e4c3f415 Linus Torvalds 2005-04-16  130  	/*
^1da177e4c3f415 Linus Torvalds 2005-04-16  131  	 * We now lock against reads and writes. --rmk
^1da177e4c3f415 Linus Torvalds 2005-04-16  132  	 */
6f87f0deebaff27 Ingo Molnar    2006-03-23  133  	if (mutex_lock_interruptible(&nwflash_mutex))
^1da177e4c3f415 Linus Torvalds 2005-04-16  134  		return -ERESTARTSYS;
^1da177e4c3f415 Linus Torvalds 2005-04-16  135  
55a4bb61a27afcd Jens Axboe     2024-04-09  136  	ret = simple_copy_to_iter((void *)FLASH_BASE, &iocb->ki_pos,
55a4bb61a27afcd Jens Axboe     2024-04-09  137  					gbFlashSize, to);
6f87f0deebaff27 Ingo Molnar    2006-03-23  138  	mutex_unlock(&nwflash_mutex);
6ee8928d94841aa Akinobu Mita   2008-07-25  139  
^1da177e4c3f415 Linus Torvalds 2005-04-16  140  	return ret;
^1da177e4c3f415 Linus Torvalds 2005-04-16  141  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  142  

:::::: The code at line 129 was first introduced by commit
:::::: 4ef584ba84125b67c17b5aded38e7783cd8cdef0 [ARM] fix nwflash.c: 6ee8928d94841aa764aeaf645ad16daff811dc26

:::::: TO: Russell King <rmk@dyn-67.arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
