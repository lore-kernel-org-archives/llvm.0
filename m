Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84F10942;
	Wed, 28 May 2025 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748396918; cv=none; b=DkEPE0Bf/w4kii1H6gZO0TwIPL1ukYghOAmUcnPAN6gATPT0+m260TGsEnoFlAd9i5suWAmjEKbuPCM26nl4x1nej9/yGFKysFyadchEt9+7Hp38OXC0ib99sh2aLGOQzDT6nDIaio8kx8Ral7SShyNtW1LEgCKWZmYWClluDGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748396918; c=relaxed/simple;
	bh=arRUeY7b3NS2F6bkdMCR8/r6CtZECW9jqvod3iNEEVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYPFYN9wrEeGi8sSdIHlsGC28v2JQUtiLd3V2WR90mhEemAyQp41EXsjIEQ/ZQLLQEpwlApWFQWdtyLZfHBs72ECj8TCCzYs4X2QUgJsY9OK+qu2IXowgyJxAzgIdibh6XGpVa4PKAb2bkWDsNYpdpMzxcp2As4aA3ifYVp5ruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q83xkoM5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q83xkoM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748396917; x=1779932917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=arRUeY7b3NS2F6bkdMCR8/r6CtZECW9jqvod3iNEEVk=;
  b=Q83xkoM5GeMQPvJm2s+sUuzHE+7WAGIAG9lmiQKEupQs1M8WN/yvMxeq
   Ym6i9yjH0/sND1AgzvK/RqrMRFRd+ZeekPvDb7uFdSHYkJ3QPyM3K3kh9
   kHzxO1J+/6SujVwF5tt4465iPS7AqCDvt5JTtKwgy7DwD2gvtsRHjhh75
   8FOusYuX9+wQEe2NDwXOGFqoaac+jyTS+aBEfEmZgR5MVwAA4eAWCCLUg
   B8x2OtP8+qkaJjuEzIo4iXp2yJJjP6KVpXwZfonZGu09/KozyIHfq0kN4
   4a3Ea4UAOyfx1YxD6/6VWrizMleTgW8ZbBPFQ8mb+xN0kXNba1vLypnPg
   A==;
X-CSE-ConnectionGUID: jVwDtbAHQXSw25MFqO4DuA==
X-CSE-MsgGUID: nEqWZr6/Q1W13ZuydxMWmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75797600"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="75797600"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 18:48:36 -0700
X-CSE-ConnectionGUID: N67+ZiKdRL2NvGj3468pdg==
X-CSE-MsgGUID: tz9WpcgmQ2mJhcx+ye0EQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="166246932"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2025 18:47:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK5tX-000VAX-1v;
	Wed, 28 May 2025 01:47:51 +0000
Date: Wed, 28 May 2025 09:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 303/318]
 fs/bcachefs/backpointers.c:695:8: warning: variable 'empty' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202505280902.IdRcM2ys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ad02d8684ab62f039bcf56a848b55c01bde6c4fd
commit: a47a765c7d5f490c96377bd09362faa6a9e8c213 [303/318] bcachefs: Replace rcu_read_lock() with guards
config: x86_64-buildonly-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280902.IdRcM2ys-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280902.IdRcM2ys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280902.IdRcM2ys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/backpointers.c:695:8: warning: variable 'empty' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     695 |                         if (!bch2_bucket_bitmap_test(&ca->bucket_backpointer_mismatch, b))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/backpointers.c:704:14: note: uninitialized use occurs here
     704 |                 int ret = !empty
         |                            ^~~~~
   fs/bcachefs/backpointers.c:695:4: note: remove the 'if' if its condition is always false
     695 |                         if (!bch2_bucket_bitmap_test(&ca->bucket_backpointer_mismatch, b))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     696 |                                 continue;
         |                                 ~~~~~~~~
   fs/bcachefs/backpointers.c:691:8: warning: variable 'empty' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     691 |                         if (p.ptr.cached && dev_ptr_stale_rcu(ca, &p.ptr))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/backpointers.c:704:14: note: uninitialized use occurs here
     704 |                 int ret = !empty
         |                            ^~~~~
   fs/bcachefs/backpointers.c:691:4: note: remove the 'if' if its condition is always false
     691 |                         if (p.ptr.cached && dev_ptr_stale_rcu(ca, &p.ptr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     692 |                                 continue;
         |                                 ~~~~~~~~
   fs/bcachefs/backpointers.c:688:8: warning: variable 'empty' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     688 |                         if (!ca)
         |                             ^~~
   fs/bcachefs/backpointers.c:704:14: note: uninitialized use occurs here
     704 |                 int ret = !empty
         |                            ^~~~~
   fs/bcachefs/backpointers.c:688:4: note: remove the 'if' if its condition is always false
     688 |                         if (!ca)
         |                         ^~~~~~~~
     689 |                                 continue;
         |                                 ~~~~~~~~
   fs/bcachefs/backpointers.c:685:13: note: initialize the variable 'empty' to silence this warning
     685 |                 bool empty;
         |                           ^
         |                            = 0
   3 warnings generated.


vim +695 fs/bcachefs/backpointers.c

   670	
   671	static int check_extent_to_backpointers(struct btree_trans *trans,
   672						struct extents_to_bp_state *s,
   673						enum btree_id btree, unsigned level,
   674						struct bkey_s_c k)
   675	{
   676		struct bch_fs *c = trans->c;
   677		struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
   678		const union bch_extent_entry *entry;
   679		struct extent_ptr_decoded p;
   680	
   681		bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
   682			if (p.ptr.dev == BCH_SB_MEMBER_INVALID)
   683				continue;
   684	
   685			bool empty;
   686			scoped_guard(rcu) {
   687				struct bch_dev *ca = bch2_dev_rcu_noerror(c, p.ptr.dev);
   688				if (!ca)
   689					continue;
   690	
   691				if (p.ptr.cached && dev_ptr_stale_rcu(ca, &p.ptr))
   692					continue;
   693	
   694				u64 b = PTR_BUCKET_NR(ca, &p.ptr);
 > 695				if (!bch2_bucket_bitmap_test(&ca->bucket_backpointer_mismatch, b))
   696					continue;
   697	
   698				empty = bch2_bucket_bitmap_test(&ca->bucket_backpointer_empty, b);
   699			}
   700	
   701			struct bkey_i_backpointer bp;
   702			bch2_extent_ptr_to_bp(c, btree, level, k, p, entry, &bp);
   703	
   704			int ret = !empty
   705				? check_bp_exists(trans, s, &bp, k)
   706				: bch2_bucket_backpointer_mod(trans, k, &bp, true);
   707			if (ret)
   708				return ret;
   709		}
   710	
   711		return 0;
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
