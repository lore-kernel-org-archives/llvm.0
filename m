Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDD13ADA;
	Mon, 29 Jan 2024 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706553492; cv=none; b=UFQL6M7yO3OZ4/ok5tSJJuDZw40XQwriI/EIM1yRsiVjh/atHnNQFk3OCLeGoDETbC4Gq5KDlPVvX0tmUoZyboBJTxC7uK0coA3LzHIU2ICz++lh7L2m68xaNcbBndXU9/tVw1JrKOO3oXnFjZYzfbZ3RRPHiIeuEOYvbJLnPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706553492; c=relaxed/simple;
	bh=Vfzv3YHxyCeTpsteeAbwarRDOufw5XD1lhynvMGUqeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghsBtMhIwz/MSy4YsOos7X9Mt/0I07ws2w7/K80VVKLPF+ayQuMO+X0ovjQEnJLopv7iahy0NjqNwzXLM9cvmonEMbtP2lYnULYWALbby2DcG8ekaS2//YAj71ZEviYEBmbPt3pTGsxbQoxJs9zLgLL8fbpMizEfF4uzLFfJ2/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRLXJBZY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRLXJBZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706553490; x=1738089490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vfzv3YHxyCeTpsteeAbwarRDOufw5XD1lhynvMGUqeU=;
  b=ZRLXJBZYbNWA2Og46r3XE6nav3jc+wF02h4iQ7R3FUHtENiAyT4/q7hA
   yd4POrzdz+GAO9SvfyNdR0xzlTrBloKegxltazVjNfM1Enz8iPr5DNdEF
   9vWnrhMYEl3rVGMGaP/ehy+HoK0CbVHUyciNVFuWrn7gfWz1FlC2j9sAz
   P6M5gunbGjXeygoxZzTLvfvxYhHuO8WqPjYA9jnIaUpaSqhFaCgW6PHq4
   ioLr722+vbJaZaoiSEhTWxoRnEcvrDJpMixOfhSOkXb8veBPN7RGj5eqS
   yG1vFWGckR2+E2bGmoNKPIF96uWmnl19vxyMpfIWHee3aOt2BuWdyoVVc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10156213"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="10156213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29622679"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2024 10:38:08 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUWWD-0004Yu-1k;
	Mon, 29 Jan 2024 18:38:05 +0000
Date: Tue, 30 Jan 2024 02:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file-bd_inode 35/37]
 fs/jbd2/journal.c:1649: warning: Function parameter or struct member
 'bdev_file' not described in 'jbd2_journal_init_dev'
Message-ID: <202401300233.HpFwSXl6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file-bd_inode
head:   92279a7f8c418cb71e6fb335e4af2c7565944a11
commit: d8db7fccf2cac31fb2021ddc1dc989d2c878099d [35/37] fs & block: remove bdev->bd_inode
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240130/202401300233.HpFwSXl6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300233.HpFwSXl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300233.HpFwSXl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jbd2/journal.c:1649: warning: Function parameter or struct member 'bdev_file' not described in 'jbd2_journal_init_dev'
   fs/jbd2/journal.c:1649: warning: Excess function parameter 'bdev' description in 'jbd2_journal_init_dev'


vim +1649 fs/jbd2/journal.c

470decc613ab20 Dave Kleikamp     2006-10-11  1622  
f7f4bccb729844 Mingming Cao      2006-10-11  1623  /* jbd2_journal_init_dev and jbd2_journal_init_inode:
470decc613ab20 Dave Kleikamp     2006-10-11  1624   *
470decc613ab20 Dave Kleikamp     2006-10-11  1625   * Create a journal structure assigned some fixed set of disk blocks to
470decc613ab20 Dave Kleikamp     2006-10-11  1626   * the journal.  We don't actually touch those disk blocks yet, but we
470decc613ab20 Dave Kleikamp     2006-10-11  1627   * need to set up all of the mapping information to tell the journaling
470decc613ab20 Dave Kleikamp     2006-10-11  1628   * system where the journal blocks are.
470decc613ab20 Dave Kleikamp     2006-10-11  1629   *
470decc613ab20 Dave Kleikamp     2006-10-11  1630   */
470decc613ab20 Dave Kleikamp     2006-10-11  1631  
470decc613ab20 Dave Kleikamp     2006-10-11  1632  /**
5648ba5b2dc0d0 Randy Dunlap      2008-04-17  1633   *  journal_t * jbd2_journal_init_dev() - creates and initialises a journal structure
470decc613ab20 Dave Kleikamp     2006-10-11  1634   *  @bdev: Block device on which to create the journal
470decc613ab20 Dave Kleikamp     2006-10-11  1635   *  @fs_dev: Device which hold journalled filesystem for this journal.
470decc613ab20 Dave Kleikamp     2006-10-11  1636   *  @start: Block nr Start of journal.
470decc613ab20 Dave Kleikamp     2006-10-11  1637   *  @len:  Length of the journal in blocks.
470decc613ab20 Dave Kleikamp     2006-10-11  1638   *  @blocksize: blocksize of journalling device
5648ba5b2dc0d0 Randy Dunlap      2008-04-17  1639   *
5648ba5b2dc0d0 Randy Dunlap      2008-04-17  1640   *  Returns: a newly created journal_t *
470decc613ab20 Dave Kleikamp     2006-10-11  1641   *
f7f4bccb729844 Mingming Cao      2006-10-11  1642   *  jbd2_journal_init_dev creates a journal which maps a fixed contiguous
470decc613ab20 Dave Kleikamp     2006-10-11  1643   *  range of blocks on an arbitrary block device.
470decc613ab20 Dave Kleikamp     2006-10-11  1644   *
470decc613ab20 Dave Kleikamp     2006-10-11  1645   */
d8db7fccf2cac3 Christian Brauner 2024-01-28  1646  journal_t *jbd2_journal_init_dev(struct file *bdev_file,
d8db7fccf2cac3 Christian Brauner 2024-01-28  1647  			struct file *fs_dev,
18eba7aae080d4 Mingming Cao      2006-10-11  1648  			unsigned long long start, int len, int blocksize)
470decc613ab20 Dave Kleikamp     2006-10-11 @1649  {
f0c9fd5458bacf Geliang Tang      2016-09-15  1650  	journal_t *journal;
470decc613ab20 Dave Kleikamp     2006-10-11  1651  
d8db7fccf2cac3 Christian Brauner 2024-01-28  1652  	journal = journal_init_common(bdev_file, fs_dev, start, len, blocksize);
8e6cf5fbb7b47d Zhang Yi          2023-08-11  1653  	if (IS_ERR(journal))
8e6cf5fbb7b47d Zhang Yi          2023-08-11  1654  		return ERR_CAST(journal);
470decc613ab20 Dave Kleikamp     2006-10-11  1655  
900d156bac2bc4 Christoph Hellwig 2022-07-13  1656  	snprintf(journal->j_devname, sizeof(journal->j_devname),
900d156bac2bc4 Christoph Hellwig 2022-07-13  1657  		 "%pg", journal->j_dev);
81ae394bdc473c Rasmus Villemoes  2015-06-25  1658  	strreplace(journal->j_devname, '/', '!');
4b905671d2ea09 Jan Kara          2009-01-06  1659  	jbd2_stats_proc_init(journal);
4b905671d2ea09 Jan Kara          2009-01-06  1660  
470decc613ab20 Dave Kleikamp     2006-10-11  1661  	return journal;
470decc613ab20 Dave Kleikamp     2006-10-11  1662  }
470decc613ab20 Dave Kleikamp     2006-10-11  1663  

:::::: The code at line 1649 was first introduced by commit
:::::: 470decc613ab2048b619a01028072d932d9086ee [PATCH] jbd2: initial copy of files from jbd

:::::: TO: Dave Kleikamp <shaggy@austin.ibm.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
