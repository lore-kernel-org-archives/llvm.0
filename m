Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3B1EA84;
	Thu, 13 Feb 2025 05:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739424640; cv=none; b=AbQsrllU4bL8E8O9ggIrhCWtRtrRs1niTxRuqCKrgI4cBf8RJvCa2HumxAweBYTxBsFspeCkgByEcYjbeUmntVjBimFrBLOSRoe62yBoyAQuIPX8m7Xz+MBUtWU9p2O5jh2fjkgZGDnLK53K3F+lsCkZi4kM/ZsMZf24nRCQY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739424640; c=relaxed/simple;
	bh=0hvmj6b6Fm8QD6jlrjy5UtRqKpgn0YWV5u4bS5IKIUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIwgIBQRWh9ziTV/aSjGQc64Vs/eecesTP987awHgnNG0RF9IQClX83Y110aPWDQP/rBP0u491vYsC0n88z5ZDMYAvy4OQOTKU60OWEyAEYCRVXQHSiVX0RBV2TdOI7xrfhE0qb2Gvi9WqPh3unX6R+RM/keXHEyfLus+RiAXdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eba34LYC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eba34LYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739424638; x=1770960638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hvmj6b6Fm8QD6jlrjy5UtRqKpgn0YWV5u4bS5IKIUg=;
  b=eba34LYCVpq0WPyBDfSII7tkMcwajbWySKiOCgDr7R3GiTI55ZczRNVF
   GLqmqxkM+g1PIlOYMYu9JYq/OaBgRpZsWN5hEUoca0Jpgwzv7s72mBgag
   hzsU6RkqNGCUKz0pNGMm6AFjjGPwkEoQ0DhYwYL0/d7gHx9v8a5dUE/lk
   rsdmZ6CpWWbwbB0UUTWcR/YYWx9/2v0yHVD12B0VI4KWtEQnGJxjIHFmy
   e6nZtcPmiO6oEn76UTUoKDyLfrLmJh6ACypGxRoVeJEpfsE2d7+ObFInW
   cjTNq9mIdijXidMPTI0ng6mYhnrNvtfa2MITDW2Au85jepe1GXz7i8f/Z
   w==;
X-CSE-ConnectionGUID: +pdowxEfRhO3t1w43qusug==
X-CSE-MsgGUID: w4mksUXoTcORmbBfQrIjBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39811211"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39811211"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:30:38 -0800
X-CSE-ConnectionGUID: O945n1zXTky/Lrhs9sOyBw==
X-CSE-MsgGUID: kc5S9UIeQzqgk3phUIt91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150207244"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Feb 2025 21:30:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiRo2-0016ZL-2H;
	Thu, 13 Feb 2025 05:30:34 +0000
Date: Thu, 13 Feb 2025 13:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] fs: modify writeback infra to work with wb_ctx
Message-ID: <202502131305.iPwTCMke-lkp@intel.com>
References: <20250212103634.448437-3-kundan.kumar@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212103634.448437-3-kundan.kumar@samsung.com>

Hi Kundan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 57d357a7663c4025c68ae07974b679d84e2d5d1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kundan-Kumar/writeback-add-parallel-writeback-infrastructure/20250212-211021
base:   57d357a7663c4025c68ae07974b679d84e2d5d1a
patch link:    https://lore.kernel.org/r/20250212103634.448437-3-kundan.kumar%40samsung.com
patch subject: [RFC 2/3] fs: modify writeback infra to work with wb_ctx
config: s390-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131305.iPwTCMke-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131305.iPwTCMke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131305.iPwTCMke-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fs-writeback.c:1272:2: error: call to undeclared function 'wb_io_lists_depopulated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1272 |         wb_io_lists_depopulated(wb);
         |         ^
   fs/fs-writeback.c:1272:2: note: did you mean 'wb_ctx_io_lists_depopulated'?
   fs/fs-writeback.c:99:13: note: 'wb_ctx_io_lists_depopulated' declared here
      99 | static void wb_ctx_io_lists_depopulated(struct bdi_writeback *wb,
         |             ^
>> fs/fs-writeback.c:1309:3: error: call to undeclared function 'wb_queue_work'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1309 |                 wb_queue_work(&bdi->wb, base_work);
         |                 ^
   fs/fs-writeback.c:1309:3: note: did you mean 'queue_work'?
   include/linux/workqueue.h:659:20: note: 'queue_work' declared here
     659 | static inline bool queue_work(struct workqueue_struct *wq,
         |                    ^
>> fs/fs-writeback.c:1712:4: error: call to undeclared function 'inode_cgwb_move_to_attached_ctx'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1712 |                         inode_cgwb_move_to_attached_ctx(inode, wb, p_wb_ctx);
         |                         ^
   fs/fs-writeback.c:1712:4: note: did you mean 'inode_cgwb_move_to_attached'?
   fs/fs-writeback.c:1263:13: note: 'inode_cgwb_move_to_attached' declared here
    1263 | static void inode_cgwb_move_to_attached(struct inode *inode,
         |             ^
   fs/fs-writeback.c:1749:3: error: call to undeclared function 'inode_cgwb_move_to_attached_ctx'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1749 |                 inode_cgwb_move_to_attached_ctx(inode, wb, p_wb_ctx);
         |                 ^
   4 errors generated.


vim +/wb_io_lists_depopulated +1272 fs/fs-writeback.c

7fc5854f8c6efa Tejun Heo      2017-12-12  1262  
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1263  static void inode_cgwb_move_to_attached(struct inode *inode,
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1264  					struct bdi_writeback *wb)
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1265  {
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1266  	assert_spin_locked(&wb->list_lock);
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1267  	assert_spin_locked(&inode->i_lock);
a9438b44bc7015 Jan Kara       2022-12-12  1268  	WARN_ON_ONCE(inode->i_state & I_FREEING);
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1269  
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1270  	inode->i_state &= ~I_SYNC_QUEUED;
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1271  	list_del_init(&inode->i_io_list);
f3b6a6df38aa51 Roman Gushchin 2021-06-28 @1272  	wb_io_lists_depopulated(wb);
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1273  }
f3b6a6df38aa51 Roman Gushchin 2021-06-28  1274  
87e1d789bf55b1 Tejun Heo      2015-05-28  1275  static struct bdi_writeback *
87e1d789bf55b1 Tejun Heo      2015-05-28  1276  locked_inode_to_wb_and_lock_list(struct inode *inode)
87e1d789bf55b1 Tejun Heo      2015-05-28  1277  	__releases(&inode->i_lock)
87e1d789bf55b1 Tejun Heo      2015-05-28  1278  	__acquires(&wb->list_lock)
87e1d789bf55b1 Tejun Heo      2015-05-28  1279  {
87e1d789bf55b1 Tejun Heo      2015-05-28  1280  	struct bdi_writeback *wb = inode_to_wb(inode);
87e1d789bf55b1 Tejun Heo      2015-05-28  1281  
87e1d789bf55b1 Tejun Heo      2015-05-28  1282  	spin_unlock(&inode->i_lock);
87e1d789bf55b1 Tejun Heo      2015-05-28  1283  	spin_lock(&wb->list_lock);
87e1d789bf55b1 Tejun Heo      2015-05-28  1284  	return wb;
87e1d789bf55b1 Tejun Heo      2015-05-28  1285  }
87e1d789bf55b1 Tejun Heo      2015-05-28  1286  
87e1d789bf55b1 Tejun Heo      2015-05-28  1287  static struct bdi_writeback *inode_to_wb_and_lock_list(struct inode *inode)
87e1d789bf55b1 Tejun Heo      2015-05-28  1288  	__acquires(&wb->list_lock)
87e1d789bf55b1 Tejun Heo      2015-05-28  1289  {
87e1d789bf55b1 Tejun Heo      2015-05-28  1290  	struct bdi_writeback *wb = inode_to_wb(inode);
87e1d789bf55b1 Tejun Heo      2015-05-28  1291  
87e1d789bf55b1 Tejun Heo      2015-05-28  1292  	spin_lock(&wb->list_lock);
87e1d789bf55b1 Tejun Heo      2015-05-28  1293  	return wb;
87e1d789bf55b1 Tejun Heo      2015-05-28  1294  }
87e1d789bf55b1 Tejun Heo      2015-05-28  1295  
f2b65121607631 Tejun Heo      2015-05-22  1296  static long wb_split_bdi_pages(struct bdi_writeback *wb, long nr_pages)
f2b65121607631 Tejun Heo      2015-05-22  1297  {
f2b65121607631 Tejun Heo      2015-05-22  1298  	return nr_pages;
f2b65121607631 Tejun Heo      2015-05-22  1299  }
f2b65121607631 Tejun Heo      2015-05-22  1300  
db125360409fc3 Tejun Heo      2015-05-22  1301  static void bdi_split_work_to_wbs(struct backing_dev_info *bdi,
db125360409fc3 Tejun Heo      2015-05-22  1302  				  struct wb_writeback_work *base_work,
db125360409fc3 Tejun Heo      2015-05-22  1303  				  bool skip_if_busy)
db125360409fc3 Tejun Heo      2015-05-22  1304  {
db125360409fc3 Tejun Heo      2015-05-22  1305  	might_sleep();
db125360409fc3 Tejun Heo      2015-05-22  1306  
006a0973ed020a Tejun Heo      2015-08-25  1307  	if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
db125360409fc3 Tejun Heo      2015-05-22  1308  		base_work->auto_free = 0;
db125360409fc3 Tejun Heo      2015-05-22 @1309  		wb_queue_work(&bdi->wb, base_work);
db125360409fc3 Tejun Heo      2015-05-22  1310  	}
db125360409fc3 Tejun Heo      2015-05-22  1311  }
db125360409fc3 Tejun Heo      2015-05-22  1312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
