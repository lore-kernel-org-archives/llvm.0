Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E236492C;
	Thu, 25 Jun 2026 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406246; cv=none; b=YfvqY1xcvit+zy8Jb9yArNWT4L9pknC2Igo6JZqYT4cDUCtJH8cBwd5ptBc0Zysi8reRGL1GkaAJEDyOJDc5/FQRZKh8gLup+M/SOkcFTZFQ9tVok8kqhTn3N9D8ImI4DeudMpP5X2aijZk1nRCo+o46ogwe3PbTQ8acm2tyiiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406246; c=relaxed/simple;
	bh=BrOX+eR8WaF5JSyJ7uPTPxJq6dMCY+pgydAUvkGxYPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GNLPqZI/XGO8Clr5GPvxRUOZR/cPD7rB9P4WmMCLEK2ECsrq66pL2umX0FMzcFQ8wd7PypQrvipWlJN8+mQiMRGA0sJsRXW84m2UHxvATD+bsv218sqdQ7xLjrWeQLM/AjQN0YK6+PcP1YrB6A9PEonIgCoJYf8DuY/IrCfG8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abT6qE+l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abT6qE+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782406245; x=1813942245;
  h=date:from:to:cc:subject:message-id;
  bh=BrOX+eR8WaF5JSyJ7uPTPxJq6dMCY+pgydAUvkGxYPo=;
  b=abT6qE+l4qTtiDA8xn9w/EtPoGX7IwBLFm8RKo2RbUUTXoDJouJ6MXqH
   9hgCNn8OH80/BCxAEIawrfTwGmVvdUohXXRfiHbfZEImvCMgVqmvZ7nh8
   O83fvCGsOS6J1rZVnGdpYoOnQllb5m3D1nbDgqeO2d4UrMaj2uUrh0j0O
   B+NHbrWPsZfU2Uh9Dn5kRrsDGRMLdSoG7KHVAXStLCG6LpLl78tW5SUr1
   jzTTqe0vVYKvPdAexThWr/Mtt72mX2/BQdYQqu+37u64W+LnB36KWYvkx
   doD1HUJyJmTqnjQxa/1KCjWQGtg5aXWovzgIg1KI8B1Q1NfXyyKbVcAdx
   g==;
X-CSE-ConnectionGUID: kQod1wJTRx29FxzCesZDyg==
X-CSE-MsgGUID: l3K7TdWxSNmtP9xb3ALyQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83190496"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83190496"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 09:50:45 -0700
X-CSE-ConnectionGUID: 74u1pl0ESj+/rIGOtyyQVA==
X-CSE-MsgGUID: SJgU+TNFQaCGGuJPfkxaYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="252808702"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2026 09:50:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcnHk-000000004Jt-1Jla;
	Thu, 25 Jun 2026 16:50:40 +0000
Date: Fri, 26 Jun 2026 00:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Codex <jullanggit@proton.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 38/65]
 fs/bcachefs/alloc/buckets.c:961:5: warning: stack frame size (1464) exceeds
 limit (1024) in 'bch2_trigger_extent'
Message-ID: <202606260011.MX1Hg914-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   d294b8d3e670ce73e23093e05a92747e0701bf8d
commit: 34c31c9633661a2b7901a1712d8516633f4fdbb6 [38/65] bcachefs: update reconcile-only backpointer flags in place
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260626/202606260011.MX1Hg914-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260011.MX1Hg914-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260011.MX1Hg914-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc/buckets.c:961:5: warning: stack frame size (1464) exceeds limit (1024) in 'bch2_trigger_extent' [-Wframe-larger-than]
     961 | int bch2_trigger_extent(struct btree_trans *trans,
         |     ^
   1 warning generated.


vim +/bch2_trigger_extent +961 fs/bcachefs/alloc/buckets.c

34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   960  
4f9ec59f8fd658 fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28  @961  int bch2_trigger_extent(struct btree_trans *trans,
f40d13f94df744 fs/bcachefs/buckets.c       Kent Overstreet 2024-04-07   962  			enum btree_id btree, unsigned level,
717296c34c8d9d fs/bcachefs/buckets.c       Kent Overstreet 2023-12-27   963  			struct bkey_s_c old, struct bkey_s new,
5dd8c60e1e0448 fs/bcachefs/buckets.c       Kent Overstreet 2024-04-07   964  			enum btree_iter_update_trigger_flags flags)
523f33efbf406f fs/bcachefs/buckets.c       Kent Overstreet 2023-06-22   965  {
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   966  	struct bkey_ptrs_c new_ptrs = bch2_bkey_ptrs_c(new.s_c);
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   967  	struct bkey_ptrs_c old_ptrs = bch2_bkey_ptrs_c(old);
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   968  	unsigned new_ptrs_bytes = (void *) new_ptrs.end - (void *) new_ptrs.start;
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   969  	unsigned old_ptrs_bytes = (void *) old_ptrs.end - (void *) old_ptrs.start;
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   970  
f40d13f94df744 fs/bcachefs/buckets.c       Kent Overstreet 2024-04-07   971  	if (unlikely(flags & BTREE_TRIGGER_check_repair))
f40d13f94df744 fs/bcachefs/buckets.c       Kent Overstreet 2024-04-07   972  		return bch2_check_fix_ptrs(trans, btree, level, new.s_c, flags);
f40d13f94df744 fs/bcachefs/buckets.c       Kent Overstreet 2024-04-07   973  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   974  	/*
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   975  	 * Reconcile-only updates keep the same physical pointers.  Update
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   976  	 * their backpointer flags in place so buffered delete+insert churn
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   977  	 * cannot drop the key, then let reconcile accounting/work tracking
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   978  	 * see the logical-state change.
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   979  	 */
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   980  	if (level == 0) {
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   981  		bool handled;
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   982  
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   983  		try(bch2_trigger_extent_same_backpointers(trans, btree, level, old, new, &handled));
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   984  		if (handled)
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   985  			return bch2_trigger_extent_reconcile(trans, btree, level, old, new, flags);
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   986  	}
34c31c9633661a fs/bcachefs/alloc/buckets.c Codex           2026-04-13   987  
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   988  	if (new_ptrs_bytes == old_ptrs_bytes &&
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   989  	    !memcmp(new_ptrs.start,
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   990  		    old_ptrs.start,
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   991  		    new_ptrs_bytes))
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   992  		return 0;
f5d4481c3edddf fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28   993  
49aa7830396bce fs/bcachefs/buckets.c       Kent Overstreet 2024-08-23   994  	if (flags & (BTREE_TRIGGER_transactional|BTREE_TRIGGER_gc)) {
3c16c1d9609b81 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-10-05   995  		if (old.k->type)
3c16c1d9609b81 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-10-05   996  			try(__trigger_extent(trans, btree, level, old,
3c16c1d9609b81 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-10-05   997  					     flags & ~BTREE_TRIGGER_insert));
49aa7830396bce fs/bcachefs/buckets.c       Kent Overstreet 2024-08-23   998  
3c16c1d9609b81 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-10-05   999  		if (new.k->type)
3c16c1d9609b81 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-10-05  1000  			try(__trigger_extent(trans, btree, level, new.s_c,
3c16c1d9609b81 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-10-05  1001  					     flags & ~BTREE_TRIGGER_overwrite));
49aa7830396bce fs/bcachefs/buckets.c       Kent Overstreet 2024-08-23  1002  
581f7e27bc9728 fs/bcachefs/alloc/buckets.c Kent Overstreet 2025-11-12  1003  		try(bch2_trigger_extent_reconcile(trans, btree, level, old, new, flags));
4f9ec59f8fd658 fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28  1004  	}
fb3f57bb1177ae fs/bcachefs/buckets.c       Kent Overstreet 2023-10-20  1005  
4f9ec59f8fd658 fs/bcachefs/buckets.c       Kent Overstreet 2023-12-28  1006  	return 0;
523f33efbf406f fs/bcachefs/buckets.c       Kent Overstreet 2023-06-22  1007  }
523f33efbf406f fs/bcachefs/buckets.c       Kent Overstreet 2023-06-22  1008  

:::::: The code at line 961 was first introduced by commit
:::::: 4f9ec59f8fd658d832460aa25c145bdecfdbaa2d bcachefs: unify extent trigger

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
