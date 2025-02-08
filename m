Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E952451F7;
	Sat,  8 Feb 2025 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739018577; cv=none; b=pX15iiqeF99cZfavadxTYBIQtVbWF5B9fSPbSH/wGRpYBf6sHRxWD41P/XuAS+uHYDXohtGA6EOM635mmy4W9vBD/hxek4yZYO0lrDjZqhBZ9gVM9jNx9b9LOCdIHsJqs+InST17Iz5nbg7AhMuzsA5lSm0QNkZzZaj3NTzUwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739018577; c=relaxed/simple;
	bh=0JOanlffrHxL11DBrwDZqyBL8bfRjXV+wVBfDGSZhns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FMVEe6wTpW4ZMP4JbKh7iWG4zxre8/VNhQzExeLTF1ygx4R1pMzM+jirBVrYSZ9FKyg1cwfnFyisdwsnhsAjYWp6AsLV9MZWXthuAD1xhLnGkNa0Ak8HovWrp1XrhrJUcxtyLnC2JnyXn/sKJX2cVgm7SlmDk5X1/VwVlsmcp6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVd8dkBm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVd8dkBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739018575; x=1770554575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0JOanlffrHxL11DBrwDZqyBL8bfRjXV+wVBfDGSZhns=;
  b=AVd8dkBmPXYjEv3pfqhcKJz6iLmtzUkm5+MBO2xziB8gQbUPeUTiqm1c
   uxB3p4NSFnJtud6jP48Z7aJximVb9Hgal7oofI3ETQp7ZgSKkHOL8fU6G
   FAE9KilZc+MPSp8R/6dEg6/1LLKtBqMea7EruG7VKOwKCJ1Fq9GASwtdk
   z02VtAb/yeqvgJc0yK85YvXKJoqMI3InGqKP5jbv5Dl++/bpaWkiztG+Z
   6U+4JJxAsn+zwePtettDJJ/Pj4baigThhwlVWYleuQJX4bcmpFCY8cNlO
   VnvzUMrdO8AycjPCDb2a9hp5B+RsoKCwgQByMs1CJr0R/srF3zOTfV75W
   Q==;
X-CSE-ConnectionGUID: BeetOwvVQbic0ZIrT9+T1A==
X-CSE-MsgGUID: 3NakqlcfT9CeX3RppNZq0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62128318"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="62128318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:42:54 -0800
X-CSE-ConnectionGUID: bJUtIRX/QkSU0On74E3ttA==
X-CSE-MsgGUID: Gk21xIAKQuW2LWgawWyypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116368379"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 04:42:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgkAd-000zyP-14;
	Sat, 08 Feb 2025 12:42:51 +0000
Date: Sat, 8 Feb 2025 20:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 79/81]
 fs/bcachefs/alloc_background.c:2199:13: warning: stack frame size (1048)
 exceeds limit (1024) in 'bch2_do_invalidates_work'
Message-ID: <202502082057.iwBVivQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   48a8a8bcdc41b32b39f53a42f72ed2ddde60baaa
commit: ac96afa3e911b7bc8b8c2c5648076542db97d4f8 [79/81] bcachefs: Invalidate cached data by backpointers
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250208/202502082057.iwBVivQN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082057.iwBVivQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082057.iwBVivQN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_background.c:2199:13: warning: stack frame size (1048) exceeds limit (1024) in 'bch2_do_invalidates_work' [-Wframe-larger-than]
    2199 | static void bch2_do_invalidates_work(struct work_struct *work)
         |             ^
   1 warning generated.


vim +/bch2_do_invalidates_work +2199 fs/bcachefs/alloc_background.c

2e9940d4a19507 Kent Overstreet 2024-06-17  2198  
caece7fe3f1199 Kent Overstreet 2022-02-10 @2199  static void bch2_do_invalidates_work(struct work_struct *work)
caece7fe3f1199 Kent Overstreet 2022-02-10  2200  {
64ee1431cc7d11 Kent Overstreet 2024-06-23  2201  	struct bch_dev *ca = container_of(work, struct bch_dev, invalidate_work);
64ee1431cc7d11 Kent Overstreet 2024-06-23  2202  	struct bch_fs *c = ca->fs;
6bd68ec266ad71 Kent Overstreet 2023-09-12  2203  	struct btree_trans *trans = bch2_trans_get(c);
caece7fe3f1199 Kent Overstreet 2022-02-10  2204  	int ret = 0;
caece7fe3f1199 Kent Overstreet 2022-02-10  2205  
ac96afa3e911b7 Kent Overstreet 2025-02-07  2206  	struct bkey_buf last_flushed;
ac96afa3e911b7 Kent Overstreet 2025-02-07  2207  	bch2_bkey_buf_init(&last_flushed);
ac96afa3e911b7 Kent Overstreet 2025-02-07  2208  	bkey_init(&last_flushed.k->k);
ac96afa3e911b7 Kent Overstreet 2025-02-07  2209  
cb13f471390ce6 Kent Overstreet 2023-11-02  2210  	ret = bch2_btree_write_buffer_tryflush(trans);
1b30ed5fd87828 Kent Overstreet 2023-02-06  2211  	if (ret)
1b30ed5fd87828 Kent Overstreet 2023-02-06  2212  		goto err;
1b30ed5fd87828 Kent Overstreet 2023-02-06  2213  
822835ffeae411 Kent Overstreet 2022-04-01  2214  	s64 nr_to_invalidate =
822835ffeae411 Kent Overstreet 2022-04-01  2215  		should_invalidate_buckets(ca, bch2_dev_usage_read(ca));
2e9940d4a19507 Kent Overstreet 2024-06-17  2216  	struct btree_iter iter;
2e9940d4a19507 Kent Overstreet 2024-06-17  2217  	bool wrapped = false;
2e9940d4a19507 Kent Overstreet 2024-06-17  2218  
2e9940d4a19507 Kent Overstreet 2024-06-17  2219  	bch2_trans_iter_init(trans, &iter, BTREE_ID_lru,
2e9940d4a19507 Kent Overstreet 2024-06-17  2220  			     lru_pos(ca->dev_idx, 0,
2e9940d4a19507 Kent Overstreet 2024-06-17  2221  				     ((bch2_current_io_time(c, READ) + U32_MAX) &
2e9940d4a19507 Kent Overstreet 2024-06-17  2222  				      LRU_TIME_MAX)), 0);
2e9940d4a19507 Kent Overstreet 2024-06-17  2223  
2e9940d4a19507 Kent Overstreet 2024-06-17  2224  	while (true) {
2e9940d4a19507 Kent Overstreet 2024-06-17  2225  		bch2_trans_begin(trans);
822835ffeae411 Kent Overstreet 2022-04-01  2226  
2e9940d4a19507 Kent Overstreet 2024-06-17  2227  		struct bkey_s_c k = next_lru_key(trans, &iter, ca, &wrapped);
2e9940d4a19507 Kent Overstreet 2024-06-17  2228  		ret = bkey_err(k);
2e9940d4a19507 Kent Overstreet 2024-06-17  2229  		if (ret)
7ee4be9c621e4c Kent Overstreet 2024-10-15  2230  			goto restart_err;
2e9940d4a19507 Kent Overstreet 2024-06-17  2231  		if (!k.k)
2e9940d4a19507 Kent Overstreet 2024-06-17  2232  			break;
2e9940d4a19507 Kent Overstreet 2024-06-17  2233  
ac96afa3e911b7 Kent Overstreet 2025-02-07  2234  		ret = invalidate_one_bucket(trans, ca, &iter, k, &last_flushed, &nr_to_invalidate);
7ee4be9c621e4c Kent Overstreet 2024-10-15  2235  restart_err:
7ee4be9c621e4c Kent Overstreet 2024-10-15  2236  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
7ee4be9c621e4c Kent Overstreet 2024-10-15  2237  			continue;
2e9940d4a19507 Kent Overstreet 2024-06-17  2238  		if (ret)
2e9940d4a19507 Kent Overstreet 2024-06-17  2239  			break;
2e9940d4a19507 Kent Overstreet 2024-06-17  2240  
2e9940d4a19507 Kent Overstreet 2024-06-17  2241  		bch2_btree_iter_advance(&iter);
2e9940d4a19507 Kent Overstreet 2024-06-17  2242  	}
2e9940d4a19507 Kent Overstreet 2024-06-17  2243  	bch2_trans_iter_exit(trans, &iter);
1b30ed5fd87828 Kent Overstreet 2023-02-06  2244  err:
6bd68ec266ad71 Kent Overstreet 2023-09-12  2245  	bch2_trans_put(trans);
64ee1431cc7d11 Kent Overstreet 2024-06-23  2246  	percpu_ref_put(&ca->io_ref);
ac96afa3e911b7 Kent Overstreet 2025-02-07  2247  	bch2_bkey_buf_exit(&last_flushed, c);
5a6e43af1e5341 Kent Overstreet 2024-09-04  2248  	bch2_write_ref_put(c, BCH_WRITE_REF_invalidate);
caece7fe3f1199 Kent Overstreet 2022-02-10  2249  }
caece7fe3f1199 Kent Overstreet 2022-02-10  2250  

:::::: The code at line 2199 was first introduced by commit
:::::: caece7fe3f1199f0da42b4537434166f99f0c11f bcachefs: New bucket invalidate path

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
