Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C03914E4;
	Thu,  2 Jul 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977527; cv=none; b=Cmfk5FdTT6GTRWcDGj4Xki7E+HGD12lh+1lbeOVYzHNnA4Uc+NhN4/o+NiKVYOgKbcG0I8FBziQwtXby8rOl3KmMiWQPHGQ1M/IKG+X9BZ5DydPNgepHgNOQwiYDUnaW+2SQgIRNSyjKLoVfnfg6s74BxxZ0yCrTdJsMPDQukN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977527; c=relaxed/simple;
	bh=B7IuFjYn6KgNLPDh8qiiijfU0cIewHwvVJY8lhNw6ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j28+3Pa27FkG+DjvP1tfSTpauzmr9TmWOytuJFnneE7b96rYMQwcL4pewhg2hBqtyXMOoYNbIaZ4p932CE8T5qA5Wjh7zeFaBhdEV09qC2rFOAyTlcMVgXzohoayhYndVqbf8fz+aW0G56CSyxsPxVL4rl6PL2ZZqBPnJZ11YFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms06hIdf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms06hIdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782977526; x=1814513526;
  h=date:from:to:cc:subject:message-id;
  bh=B7IuFjYn6KgNLPDh8qiiijfU0cIewHwvVJY8lhNw6ng=;
  b=ms06hIdfGRFOkCiOiNKmq/emwgt3cYjCjOanVHRZJh7mhvHtD0vRUkT8
   eIACznBYUtR5DzRfQCvucAHEEtHkJ9iyGPtjJR2k7LIq+pVUV/nWN7xUK
   wMAxYdFGVWb+Yi8AcG7PuiH6lfDq79i/RewUeK3WHnYNjEXUquDRjDGbb
   OGBGJIwa4MkvUtZ9kpDCq1cYfih88UVcCHZxe2e2EfCv5LutkncG+cMRg
   pOZyO7LQPyLnFbM7kTM2QMu4tx9RS6g/8aYSjecoCxEI8kQriJH9RJL3h
   vAscObtkJtU3bDXeiI0bKwWFeQBJ8k7MKnbS/zSj/Bwuv6mSmYicqJ2zk
   g==;
X-CSE-ConnectionGUID: YxjuVHZMRim2tl1nLhmL2A==
X-CSE-MsgGUID: U/gmtMjwTEOJBgrD5aNeWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83588543"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83588543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:32:03 -0700
X-CSE-ConnectionGUID: WjvOQzwQQyCbuX35pcM1pQ==
X-CSE-MsgGUID: b4REK7jTR12ok5nKsB7OnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257119233"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2026 00:32:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfBtv-00000000APx-0LK8;
	Thu, 02 Jul 2026 07:31:59 +0000
Date: Thu, 02 Jul 2026 15:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jul Lang <jullanggit@proton.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 8/9]
 fs/bcachefs/alloc/buckets.c:902:35: error: use of undeclared identifier
 'level'
Message-ID: <202607021538.bBjU2Ri4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   f74372111084f9b50dc52eaeb9e8ec40399b2609
commit: d3c3cc61c9901c4e26f719f9b905c6766e8ca06d [8/9] bcachefs: rename bch2_trigger_extent_same_backpointers to bch2_trigger_extent_reconcile_phys_update and update comments
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021538.bBjU2Ri4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021538.bBjU2Ri4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021538.bBjU2Ri4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/alloc/buckets.c:902:35: error: use of undeclared identifier 'level'
     902 |                 bch2_extent_ptr_to_bp(c, btree, level, old, p, entry, &old_bp[nr_old++]);
         |                                                 ^~~~~
   fs/bcachefs/alloc/buckets.c:908:35: error: use of undeclared identifier 'level'
     908 |                 bch2_extent_ptr_to_bp(c, btree, level, new.s_c, p, entry, &new_bp[nr_new++]);
         |                                                 ^~~~~
   2 errors generated.


vim +/level +902 fs/bcachefs/alloc/buckets.c

1f34c21bc685f6 fs/bcachefs/buckets.c       Kent Overstreet 2023-12-29  880  
d3c3cc61c9901c fs/bcachefs/alloc/buckets.c Jul Lang        2026-07-01  881  /* in-place update RECONCILE_PHYS if it is the only thing that changed */
d3c3cc61c9901c fs/bcachefs/alloc/buckets.c Jul Lang        2026-07-01  882  static int bch2_trigger_extent_reconcile_phys_update(struct btree_trans *trans,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  883  						 enum btree_id btree,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  884  						 struct bkey_s_c old,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  885  						 struct bkey_s new,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  886  						 bool *handled)
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  887  {
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  888  	struct bch_fs *c = trans->c;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  889  	struct bkey_i_backpointer old_bp[BCH_REPLICAS_MAX * 2];
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  890  	struct bkey_i_backpointer new_bp[BCH_REPLICAS_MAX * 2];
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  891  	struct bkey_ptrs_c ptrs;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  892  	const union bch_extent_entry *entry;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  893  	struct extent_ptr_decoded p;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  894  	unsigned nr_old = 0, nr_new = 0;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  895  	unsigned i;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  896  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  897  	*handled = false;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  898  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  899  	ptrs = bch2_bkey_ptrs_c(old);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  900  	bkey_for_each_ptr_decode(old.k, ptrs, p, entry) {
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  901  		BUG_ON(nr_old == ARRAY_SIZE(old_bp));
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13 @902  		bch2_extent_ptr_to_bp(c, btree, level, old, p, entry, &old_bp[nr_old++]);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  903  	}
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  904  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  905  	ptrs = bch2_bkey_ptrs_c(new.s_c);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  906  	bkey_for_each_ptr_decode(new.k, ptrs, p, entry) {
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  907  		BUG_ON(nr_new == ARRAY_SIZE(new_bp));
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  908  		bch2_extent_ptr_to_bp(c, btree, level, new.s_c, p, entry, &new_bp[nr_new++]);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  909  	}
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  910  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  911  	if (nr_old != nr_new)
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  912  		return 0;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  913  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  914  	for (i = 0; i < nr_old; i++) {
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  915  		struct bch_backpointer old_v = old_bp[i].v;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  916  		struct bch_backpointer new_v = new_bp[i].v;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  917  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  918  		SET_BACKPOINTER_RECONCILE_PHYS(&old_v, 0);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  919  		SET_BACKPOINTER_RECONCILE_PHYS(&new_v, 0);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  920  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  921  		if (!bpos_eq(old_bp[i].k.p, new_bp[i].k.p) ||
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  922  		    memcmp(&old_v, &new_v, sizeof(old_v)))
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  923  			return 0;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  924  	}
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  925  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  926  	for (i = 0; i < nr_old; i++) {
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  927  		unsigned old_phys = BACKPOINTER_RECONCILE_PHYS(&old_bp[i].v);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  928  		unsigned new_phys = BACKPOINTER_RECONCILE_PHYS(&new_bp[i].v);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  929  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  930  		if (!old_phys && !new_phys)
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  931  			continue;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  932  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  933  		if (old_phys)
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  934  			try(bch2_btree_bit_mod_buffered(trans,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  935  					reconcile_work_phys_btree[old_phys],
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  936  					old_bp[i].k.p, false));
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  937  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  938  		if (new_phys)
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  939  			try(bch2_btree_bit_mod_buffered(trans,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  940  					reconcile_work_phys_btree[new_phys],
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  941  					new_bp[i].k.p, true));
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  942  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  943  		try(bch2_trans_update_buffered(trans,
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  944  				backpointer_btree(&new_bp[i].v),
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  945  				&new_bp[i].k_i));
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  946  	}
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  947  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  948  	*handled = true;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  949  	return 0;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  950  }
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13  951  

:::::: The code at line 902 was first introduced by commit
:::::: 34c31c9633661a2b7901a1712d8516633f4fdbb6 bcachefs: update reconcile-only backpointer flags in place

:::::: TO: Codex <jullanggit@proton.me>
:::::: CC: Jul Lang <jullanggit@proton.me>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
