Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E52288D5;
	Thu, 16 Apr 2026 04:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776312565; cv=none; b=SGvXz1Cn28+hmzTHqAHahUaHQCM7tAnKRJ7IvCy9G59JCXGr/sl+GRlytdtpQ/VsgrL/CaEohgcFEbzhrnoTjslebl/1Yc085l9ca+Bm4a43TD9IIJM2fxq70XwRYg566xmhlIFxvb61mijAg+e9qTG9JElE8iTfVKxsRcbvn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776312565; c=relaxed/simple;
	bh=1l+oQSTriQcYfYwKPm2BP0D0bOXWhiUkif9xxc3RsPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CWymoG7+y4nFCxYPR6IM15idfnkSvXPg24+PG7q/fst3mHTAFP+IC9iAQrnUOhSKHhd190owqlrSXRc3MHnchlVYzwB9eJuBNsOLt1JYvTFCtiZaD5syOifUFWFWBvBCu/EGU3LUqfZAFe0EUQRe4+CTKRnxSWm+X4wSrLPbihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOJBrz4v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOJBrz4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776312563; x=1807848563;
  h=date:from:to:cc:subject:message-id;
  bh=1l+oQSTriQcYfYwKPm2BP0D0bOXWhiUkif9xxc3RsPA=;
  b=GOJBrz4vKgjR4+VEgX/4eII26LYi++v56VKR9LA+o79snkOEr7UyhbKV
   R2Y200bt5lFpZbGIjP0bT+S6Jw7m5C0G6y9UzEB2uaLuzfsUe2AGC3ktQ
   sst9pItpYJgKqCEgNO0t2QS43ZoUh2MBqhDPXt3YzWQQFWxrPTKINFRhH
   NgbdE+x2XmO15RK326NmOPvvlCNcKdArr5IKiglaNdm6Mk1z5kSsTHqfP
   Ug9JWo//DYA1n5QNl09JrafTi2gr8vvHyz+lrw0PBQKkYI0UUWtXYFWse
   rMrpbJpoBj9gHz2tlUCZpnojNL1JDeuvxQqYHp/jdYT/tA2FG7s80qIbd
   A==;
X-CSE-ConnectionGUID: EFmNd5AMQ1Obv+xp2vz42g==
X-CSE-MsgGUID: fLeVDRTgQF+r8IwFgKtJdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87924060"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="87924060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 21:09:22 -0700
X-CSE-ConnectionGUID: xC0jJ+r5TdWtwX6V8fCYPQ==
X-CSE-MsgGUID: ciLiWfMSRa2eJpEV5pn95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235566762"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2026 21:09:21 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDE2Y-000000001GI-3VYH;
	Thu, 16 Apr 2026 04:09:18 +0000
Date: Thu, 16 Apr 2026 12:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jul Lang <jullanggit@proton.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 38/44]
 fs/bcachefs/alloc/buckets.c:961:5: warning: stack frame size (1448) exceeds
 limit (1024) in 'bch2_trigger_extent'
Message-ID: <202604161204.4WpBldFH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   1c434d4b3e42fd2cc1af8bdb1274136e1b10728a
commit: 37541c231786a29ba46ae1cec2e462b0be4edb41 [38/44] bcachefs: update reconcile-only backpointer flags in place
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260416/202604161204.4WpBldFH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161204.4WpBldFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161204.4WpBldFH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc/buckets.c:961:5: warning: stack frame size (1448) exceeds limit (1024) in 'bch2_trigger_extent' [-Wframe-larger-than]
     961 | int bch2_trigger_extent(struct btree_trans *trans,
         |     ^
   1 warning generated.


vim +/bch2_trigger_extent +961 fs/bcachefs/alloc/buckets.c

37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   960  
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
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   974  	/*
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   975  	 * Reconcile-only updates keep the same physical pointers.  Update
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   976  	 * their backpointer flags in place so buffered delete+insert churn
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   977  	 * cannot drop the key, then let reconcile accounting/work tracking
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   978  	 * see the logical-state change.
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   979  	 */
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   980  	if (level == 0) {
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   981  		bool handled;
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   982  
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   983  		try(bch2_trigger_extent_same_backpointers(trans, btree, level, old, new, &handled));
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   984  		if (handled)
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   985  			return bch2_trigger_extent_reconcile(trans, btree, level, old, new, flags);
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   986  	}
37541c231786a2 fs/bcachefs/alloc/buckets.c Jul Lang        2026-04-13   987  
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
