Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60535F8B5;
	Tue, 13 Jan 2026 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768333005; cv=none; b=BfmnWWvoAYU1vGplqe7OyMsqLAjr6/LKqTSHi5uzA+RrfepETlFINha/kmyKa9GzAhDwsm6nCJTbwyKUNNmwV5Xl3FVApW5Phu0lwzzewhzJxr9UshZIUlRohmplQLisCAU8Vx85Ky9lweOVefn3Z0tMqOWvgVAApw/qATGoJfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768333005; c=relaxed/simple;
	bh=UPcHqN06F8MWu8zk+dWexBTxVC835Tko8HmFlRuwgps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b/H24NxjbGldCnmN64v+vwvKYMmvK7FSuXdqtDidBkymqy3nzw1jYZTOhGerB/etS01LvHt5gafhRwmErfXX6wBGY1+OhJKc3entUcAIpPRS/lY9xlDXIwwaPlwaHzVXhDo2GXWPQD/K9wtBjZBJh27cDmpNrO6PxEGn+mHWYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIca94FY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIca94FY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768333004; x=1799869004;
  h=date:from:to:cc:subject:message-id;
  bh=UPcHqN06F8MWu8zk+dWexBTxVC835Tko8HmFlRuwgps=;
  b=lIca94FYPcCO0AuhwEiJTGvy07sTnXiNPTrWEmZ+mBklRzUFWHciNZTq
   eh+DBhm3WfaTgQXWA1vGeJ37SyMkocFjSmbL+O54Z6vcVZyfLz+09fg91
   vt6bKGREDRn+i5+Lnfq1We0tZQUCYFZdfcsVFaJD+wJGR0tgrNgrs2il8
   jBGK4NzrQ8QzMWDkKKGFCe4lveRRxSuqNXdlI3dK5w9rQf1Q+DMlTwlIz
   qgFAXYUWFJVNqBj4uyo7QC5WYtEUPFIaq3hNVa4jW4KkQ6MxW26mbsESV
   8oMN6mOjiQ+dnx4QhkyL5rEuiMPC6U/vdRCI++RFipH1CVbO2Tr3nzevt
   w==;
X-CSE-ConnectionGUID: 8zDR4qwZRE2ihFfi568X/w==
X-CSE-MsgGUID: 1lb7URc+S/yzVCzImdMRgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80274480"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80274480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:36:41 -0800
X-CSE-ConnectionGUID: SdVpie7lQZO5iZ/5uDdTFw==
X-CSE-MsgGUID: E5J+HiJsSfGqNWaWi9wPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208931776"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2026 11:36:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkBx-00000000FHY-3cIy;
	Tue, 13 Jan 2026 19:36:37 +0000
Date: Wed, 14 Jan 2026 03:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 196/196] fs/bcachefs/fs/inode.h:146:61:
 warning: expression which evaluates to zero treated as a null pointer
 constant of type 'const char *'
Message-ID: <202601140339.12G1GVwN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   d523781cfc5e70cdb73bdc883a3271ca65e7206e
commit: d523781cfc5e70cdb73bdc883a3271ca65e7206e [196/196] bcachefs: Improve bch2_inode_peek() error message
config: loongarch-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140339.12G1GVwN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140339.12G1GVwN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140339.12G1GVwN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/init/recovery.c:21:
   In file included from fs/bcachefs/fs/dirent.h:5:
   In file included from fs/bcachefs/fs/str_hash.h:10:
>> fs/bcachefs/fs/inode.h:146:61: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
     146 |         return __bch2_inode_find_by_inum_trans(trans, inum, inode, false);
         |                                                                    ^~~~~
   1 warning generated.
--
   In file included from fs/bcachefs/data/extents.c:24:
>> fs/bcachefs/fs/inode.h:146:61: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
     146 |         return __bch2_inode_find_by_inum_trans(trans, inum, inode, false);
         |                                                                    ^~~~~
   fs/bcachefs/data/extents.c:123:19: warning: unused function 'dev_failed' [-Wunused-function]
     123 | static inline int dev_failed(struct bch_dev *ca)
         |                   ^~~~~~~~~~
   2 warnings generated.
--
   In file included from fs/bcachefs/snapshots/snapshot.c:9:
   In file included from fs/bcachefs/fs/namei.h:5:
   In file included from fs/bcachefs/fs/dirent.h:5:
   In file included from fs/bcachefs/fs/str_hash.h:10:
>> fs/bcachefs/fs/inode.h:146:61: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
     146 |         return __bch2_inode_find_by_inum_trans(trans, inum, inode, false);
         |                                                                    ^~~~~
   fs/bcachefs/snapshots/snapshot.c:378:7: warning: variable 'lock_dropped' set but not used [-Wunused-but-set-variable]
     378 |         bool lock_dropped = false;
         |              ^
   2 warnings generated.
--
   In file included from fs/bcachefs/fs/namei.c:8:
   In file included from fs/bcachefs/fs/dirent.h:5:
   In file included from fs/bcachefs/fs/str_hash.h:10:
>> fs/bcachefs/fs/inode.h:146:61: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
     146 |         return __bch2_inode_find_by_inum_trans(trans, inum, inode, false);
         |                                                                    ^~~~~
   fs/bcachefs/fs/namei.c:519:20: warning: unused function 'prt_str_reversed' [-Wunused-function]
     519 | static inline void prt_str_reversed(struct printbuf *out, const char *s)
         |                    ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +146 fs/bcachefs/fs/inode.h

1f73cb4d34e787 fs/bcachefs/inode.h    Kent Overstreet 2024-09-24  129  
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  130  #define bch2_inode_peek(_trans, _iter, _inode, _inum, _flags)			\
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  131  	__bch2_inode_peek(_trans, _iter, _inode, _inum, _flags, __func__)
4bd156c4b44ef3 fs/bcachefs/inode.h    Kent Overstreet 2023-11-02  132  
77eac89c7943a4 fs/bcachefs/inode.h    Kent Overstreet 2025-05-19  133  int bch2_inode_find_by_inum_snapshot(struct btree_trans *, u64, u32,
77eac89c7943a4 fs/bcachefs/inode.h    Kent Overstreet 2025-05-19  134  				     struct bch_inode_unpacked *, unsigned);
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  135  
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  136  int __bch2_inode_find_by_inum_trans(struct btree_trans *, subvol_inum,
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  137  				    struct bch_inode_unpacked *, const char *);
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  138  
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  139  #define bch2_inode_find_by_inum_trans(_trans, _inum, _inode)			\
d523781cfc5e70 fs/bcachefs/fs/inode.h Kent Overstreet 2026-01-13  140  	__bch2_inode_find_by_inum_trans(_trans, _inum, _inode, __func__)
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  141  
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  142  static inline int bch2_inode_find_by_inum_nowarn_trans(struct btree_trans *trans,
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  143  				  subvol_inum inum,
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  144  				  struct bch_inode_unpacked *inode)
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  145  {
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23 @146  	return __bch2_inode_find_by_inum_trans(trans, inum, inode, false);
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  147  }
b79004442bee42 fs/bcachefs/fs/inode.h Kent Overstreet 2025-11-23  148  

:::::: The code at line 146 was first introduced by commit
:::::: b79004442bee4220b66da61d8610383092925392 bcachefs: Don't warn when inode not found in bch2_fh_to_dentry()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
