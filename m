Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E82BDC3F;
	Thu, 31 Jul 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957595; cv=none; b=uRiuVsSpW1VrpxKLythJ9nJHBQQjTdEpLLdz3s0t9fJjDrW5GeAc/Oz9BlPLVbOU+gjpCprf85SGLdBXNcCgvjzveJotC3odZ4MfoL0KHDR5xkeSQboy+flzSu2fzNoa1Nil9lPh4HMNMxaEePhFkuSr3vM+z1FCLKBD23DxZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957595; c=relaxed/simple;
	bh=krIYSWa/F70W8VmOkDcrS2XsqXOeZgQXu7QfIp1ePMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c44X/cauIiDdcuUiCwgGpN16PanNNSN2MxfxL3kB7LTn2swi4HseJGKjem8yrKDKTZEmLaobFJJoNCvQ/m3B0/AebAHPrmppHwuFC1aIqkdRcdX9iQtQu7wvlimTUfLGIij/o2DrvXPhAPAm8SIh8ktL1Sm6NClaptGJ9+UsMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYRBg12X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYRBg12X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753957594; x=1785493594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krIYSWa/F70W8VmOkDcrS2XsqXOeZgQXu7QfIp1ePMc=;
  b=XYRBg12XWry/v0lJQyTWiDS3SMq4E9pkxHKUg1pSMbgQ/l8pMTbdZZv5
   +IWX6soOR35mS9Tz3u+0ZzuQprvPtIKG511HGYP+boruKCg500xL5UwKh
   b30HE/3QP46Y+R1oQc9aAaJxKpv5hDdFOIl0KBi2X7hQGWK6sMOrh6kBS
   tRMB1CpgCUFIZsIjpKK5ZEzXpRJUBVnRmdyfQkuijbIPAUTkzUyokT5ZS
   orcEiV5jRpfuQ2KBZE3Ih4QPf0rhyu3TeP5+Pr+DutQ9H9BzUBxjdzt/v
   u/fUKKmHfwKP07zkTFsDf3ymlIbgmTSGNi/Gsl/aMKv3oL9x9sh/9Ip1C
   w==;
X-CSE-ConnectionGUID: dm5SksnMQSO4Gkb7nzSVoA==
X-CSE-MsgGUID: 5X/eivDGSU+QjpXjOTQLUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56364019"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56364019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 03:26:33 -0700
X-CSE-ConnectionGUID: NWLrOiwiT9+hft4Yldig+g==
X-CSE-MsgGUID: 0Ctj0Dy9StG0Fln5ZNu3Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="167478050"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2025 03:26:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhQUX-0003f0-1Y;
	Thu, 31 Jul 2025 10:26:29 +0000
Date: Thu, 31 Jul 2025 18:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 233/233] fs/bcachefs/move.c:515:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202507311801.ylplDk4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   74b85025fe4d4fd02655a01d53c8b492ae4be913
commit: 947e5015082e2c444f158617ecb99e56d3ae9ada [233/233] bcachefs: Kill most bch2_bkey_get_iter() uses
config: s390-randconfig-001-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311801.ylplDk4k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311801.ylplDk4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311801.ylplDk4k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/move.c:515:3: error: cannot jump from this goto statement to its label
     515 |                 goto out;
         |                 ^
   fs/bcachefs/move.c:517:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     517 |         CLASS(btree_iter, inode_iter)(trans, BTREE_ID_inodes,
         |                           ^
   1 error generated.
--
>> fs/bcachefs/alloc_background.c:2101:7: error: cannot jump from this goto statement to its label
    2101 |                 if (fsck_err(trans, lru_entry_to_invalid_bucket,
         |                     ^
   fs/bcachefs/error.h:140:2: note: expanded from macro 'fsck_err'
     140 |         __fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/alloc_background.c:2111:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2111 |         CLASS(btree_iter, alloc_iter)(trans, BTREE_ID_alloc, bucket, BTREE_ITER_cached);
         |                           ^
   1 error generated.
--
>> fs/bcachefs/backpointers.c:391:7: error: cannot jump from this goto statement to its label
     391 |                 if (fsck_err(trans, backpointer_to_missing_device,
         |                     ^
   fs/bcachefs/error.h:140:2: note: expanded from macro 'fsck_err'
     140 |         __fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/backpointers.c:398:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     398 |         CLASS(btree_iter, alloc_iter)(trans, BTREE_ID_alloc, bucket, 0);
         |                           ^
   1 error generated.


vim +515 fs/bcachefs/move.c

8480905765c372 Kent Overstreet 2023-10-21  503  
a0bfe3b065cabc Kent Overstreet 2023-10-20  504  int bch2_move_get_io_opts_one(struct btree_trans *trans,
8480905765c372 Kent Overstreet 2023-10-21  505  			      struct bch_io_opts *io_opts,
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  506  			      struct btree_iter *extent_iter,
8480905765c372 Kent Overstreet 2023-10-21  507  			      struct bkey_s_c extent_k)
8480905765c372 Kent Overstreet 2023-10-21  508  {
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  509  	struct bch_fs *c = trans->c;
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  510  
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  511  	*io_opts = bch2_opts_to_inode_opts(c->opts);
8480905765c372 Kent Overstreet 2023-10-21  512  
8480905765c372 Kent Overstreet 2023-10-21  513  	/* reflink btree? */
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  514  	if (!extent_k.k->p.inode)
6aa0bd0fd59a1a Kent Overstreet 2024-10-19 @515  		goto out;
8480905765c372 Kent Overstreet 2023-10-21  516  
947e5015082e2c Kent Overstreet 2025-07-30  517  	CLASS(btree_iter, inode_iter)(trans, BTREE_ID_inodes,
8480905765c372 Kent Overstreet 2023-10-21  518  			       SPOS(0, extent_k.k->p.inode, extent_k.k->p.snapshot),
5dd8c60e1e0448 Kent Overstreet 2024-04-07  519  			       BTREE_ITER_cached);
947e5015082e2c Kent Overstreet 2025-07-30  520  	struct bkey_s_c inode_k = bch2_btree_iter_peek_slot(&inode_iter);
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  521  	int ret = bkey_err(inode_k);
8480905765c372 Kent Overstreet 2023-10-21  522  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
883d9701f15894 Kent Overstreet 2021-03-16  523  		return ret;
8480905765c372 Kent Overstreet 2023-10-21  524  
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  525  	if (!ret && bkey_is_inode(inode_k.k)) {
8480905765c372 Kent Overstreet 2023-10-21  526  		struct bch_inode_unpacked inode;
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  527  		bch2_inode_unpack(inode_k, &inode);
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  528  		bch2_inode_opts_get(io_opts, c, &inode);
8480905765c372 Kent Overstreet 2023-10-21  529  	}
6aa0bd0fd59a1a Kent Overstreet 2024-10-19  530  out:
161d13835e38e4 Kent Overstreet 2024-10-28  531  	return bch2_get_update_rebalance_opts(trans, io_opts, extent_iter, extent_k);
883d9701f15894 Kent Overstreet 2021-03-16  532  }
883d9701f15894 Kent Overstreet 2021-03-16  533  

:::::: The code at line 515 was first introduced by commit
:::::: 6aa0bd0fd59a1ab9ecd5c51332c29fac0d8969c8 bcachefs: get_update_rebalance_opts()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
