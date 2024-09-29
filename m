Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43088F6D;
	Sun, 29 Sep 2024 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727637652; cv=none; b=MMeuo6EUyEy35sXFoeVMV38KWVujzgUci5bODdlFh03C/8tXcLhfcBLOo7n2Oc4oPsHCdkkp7TGXwBZS12102lJQ2L5Gp9ZIc3jbyeXtaTIEgU04PEedtgzH/BG7a5ecKwNXfmj3SabFwRn3sTqyBzchVFpmLjpc+Tx2MWlX78M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727637652; c=relaxed/simple;
	bh=gVcMQQV+Gpr+OQqBULQBrCz/DC30AA672n7VOQXMN6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1cTn0EonggmSRYs6NxDH6m9WQuIprNJkoQGPIhmS7MDRDlMwK7C/Hr4A8C35UpkoYB8NMGPANxPh3xaHlpKzCXGzzGfB9d8J2ncKTU9FMRSQhw2jKrYDsT8VvEyKjzafFCEposrx7ZtcQ2h8v9O2Y4k8WYfFnXvwNad0IQiJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=El991XnA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El991XnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727637651; x=1759173651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gVcMQQV+Gpr+OQqBULQBrCz/DC30AA672n7VOQXMN6c=;
  b=El991XnAc5l4I1Zx2oWPQ/fElg5IwwjIy3AgOoBRNpIKDY4ESXm4XyUF
   ZRqPCUO7j06svcFH8TiDYzboLG8R1lq7+aqXy+TGBpbAVgIBEvKS+ACoE
   4C7+M4ZeE32eHhhdv43p4gaSSip7aITvWpo1NsjuhJJn0mhmcfKGey8no
   +FDfHkgq7zFIbF1JGg4rD8xF0zw8K6lMaymkp198kLjJFXPUOjkX1NffZ
   +KAKfIx/oSj2y25HN+bFqdd2RLWsVEKDokmy+folBm5xaKHWh/UdSc60/
   gblSILbZKvbUm8jbjqTgX5ntqRn6FIob7lA9pTr2+eeHuJqEkAuNghEvr
   A==;
X-CSE-ConnectionGUID: Sk15k/VLSxuvANOxpMHjsQ==
X-CSE-MsgGUID: Cfe88d59St6GtUTilFzaCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37858462"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="37858462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 12:20:50 -0700
X-CSE-ConnectionGUID: MvJdhaR9REiQcjQrWVsKOg==
X-CSE-MsgGUID: sg4VFEm3T6OTbnHOVMGiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77476414"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2024 12:20:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suzTK-000Od7-2b;
	Sun, 29 Sep 2024 19:20:46 +0000
Date: Mon, 30 Sep 2024 03:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 215/218] fs/ext4/mballoc-test.c:90:17:
 error: incompatible pointer types passing 'struct fast_list *' to parameter
 of type 'struct list_head *'
Message-ID: <202409300345.fLnh9qN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   31dd5392c7007b3d01a4eff5179e1c27faaac8be
commit: 03b37c7d400d2b5fbe80dcb15c24a342560fb9e3 [215/218] vfs: use fast_list for superblock's inode list
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240930/202409300345.fLnh9qN3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300345.fLnh9qN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300345.fLnh9qN3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ext4/mballoc.c:7047:
>> fs/ext4/mballoc-test.c:90:17: error: incompatible pointer types passing 'struct fast_list *' to parameter of type 'struct list_head *' [-Werror,-Wincompatible-pointer-types]
      90 |         INIT_LIST_HEAD(&sb->s_inodes);
         |                        ^~~~~~~~~~~~~
   include/linux/list.h:35:53: note: passing argument to parameter 'list' here
      35 | static inline void INIT_LIST_HEAD(struct list_head *list)
         |                                                     ^
   1 error generated.


vim +90 fs/ext4/mballoc-test.c

8ffc0cd24c2a3e Kemeng Shi 2024-03-05   69  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   70  static int mbt_mb_init(struct super_block *sb)
67d2a11b22b4d5 Kemeng Shi 2024-01-03   71  {
0ecae5410ab526 Kemeng Shi 2024-03-05   72  	ext4_fsblk_t block;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   73  	int ret;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   74  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   75  	/* needed by ext4_mb_init->bdev_nonrot(sb->s_bdev) */
67d2a11b22b4d5 Kemeng Shi 2024-01-03   76  	sb->s_bdev = kzalloc(sizeof(*sb->s_bdev), GFP_KERNEL);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   77  	if (sb->s_bdev == NULL)
67d2a11b22b4d5 Kemeng Shi 2024-01-03   78  		return -ENOMEM;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   79  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   80  	sb->s_bdev->bd_queue = kzalloc(sizeof(struct request_queue), GFP_KERNEL);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   81  	if (sb->s_bdev->bd_queue == NULL) {
67d2a11b22b4d5 Kemeng Shi 2024-01-03   82  		kfree(sb->s_bdev);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   83  		return -ENOMEM;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   84  	}
67d2a11b22b4d5 Kemeng Shi 2024-01-03   85  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   86  	/*
67d2a11b22b4d5 Kemeng Shi 2024-01-03   87  	 * needed by ext4_mb_init->ext4_mb_init_backend-> sbi->s_buddy_cache =
67d2a11b22b4d5 Kemeng Shi 2024-01-03   88  	 * new_inode(sb);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   89  	 */
67d2a11b22b4d5 Kemeng Shi 2024-01-03  @90  	INIT_LIST_HEAD(&sb->s_inodes);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   91  	sb->s_op = &mbt_sops;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   92  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   93  	ret = ext4_mb_init(sb);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   94  	if (ret != 0)
67d2a11b22b4d5 Kemeng Shi 2024-01-03   95  		goto err_out;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   96  
0ecae5410ab526 Kemeng Shi 2024-03-05   97  	block = ext4_count_free_clusters(sb);
0ecae5410ab526 Kemeng Shi 2024-03-05   98  	ret = percpu_counter_init(&EXT4_SB(sb)->s_freeclusters_counter, block,
0ecae5410ab526 Kemeng Shi 2024-03-05   99  				  GFP_KERNEL);
0ecae5410ab526 Kemeng Shi 2024-03-05  100  	if (ret != 0)
0ecae5410ab526 Kemeng Shi 2024-03-05  101  		goto err_mb_release;
0ecae5410ab526 Kemeng Shi 2024-03-05  102  
0ecae5410ab526 Kemeng Shi 2024-03-05  103  	ret = percpu_counter_init(&EXT4_SB(sb)->s_dirtyclusters_counter, 0,
0ecae5410ab526 Kemeng Shi 2024-03-05  104  				  GFP_KERNEL);
0ecae5410ab526 Kemeng Shi 2024-03-05  105  	if (ret != 0)
0ecae5410ab526 Kemeng Shi 2024-03-05  106  		goto err_freeclusters;
0ecae5410ab526 Kemeng Shi 2024-03-05  107  
67d2a11b22b4d5 Kemeng Shi 2024-01-03  108  	return 0;
67d2a11b22b4d5 Kemeng Shi 2024-01-03  109  
0ecae5410ab526 Kemeng Shi 2024-03-05  110  err_freeclusters:
0ecae5410ab526 Kemeng Shi 2024-03-05  111  	percpu_counter_destroy(&EXT4_SB(sb)->s_freeclusters_counter);
0ecae5410ab526 Kemeng Shi 2024-03-05  112  err_mb_release:
0ecae5410ab526 Kemeng Shi 2024-03-05  113  	ext4_mb_release(sb);
67d2a11b22b4d5 Kemeng Shi 2024-01-03  114  err_out:
67d2a11b22b4d5 Kemeng Shi 2024-01-03  115  	kfree(sb->s_bdev->bd_queue);
67d2a11b22b4d5 Kemeng Shi 2024-01-03  116  	kfree(sb->s_bdev);
67d2a11b22b4d5 Kemeng Shi 2024-01-03  117  	return ret;
67d2a11b22b4d5 Kemeng Shi 2024-01-03  118  }
67d2a11b22b4d5 Kemeng Shi 2024-01-03  119  

:::::: The code at line 90 was first introduced by commit
:::::: 67d2a11b22b4d520072db62620851615df13183e ext4: Add unit test of ext4_mb_generate_buddy

:::::: TO: Kemeng Shi <shikemeng@huaweicloud.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
