Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864B211A28;
	Sat,  9 Aug 2025 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754708064; cv=none; b=H99Xsh1GzwslC67sNz2akqrbCov6dkE3mUcyIU/FcYuEF/ZSJg98WjsL9llhUkJjmBfgFzgXbFpCY8MK2qCV1RMNqMLZBQU7HEk9R13ofaaVWjI6Ln8Ri/YMVJKRz88qlIDSqV3qePPIDSU0R/qQdU/O4EekkyuNnvKJHJs5VgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754708064; c=relaxed/simple;
	bh=izBSlPkVOw4//9stiUNfClRL9We7Iu84Ki2pyKTNSJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9FbzdZZC4PogDpz7ReSCyPfq5iqYCwfROSb3G9czFdXWNbewNpvuCMnqO2dFKHf+qKAGB0YqBjD2gIXztSGXEBT4Z5ikJrGPC0Ay1Dm6VqM371Bjl42UHDjbQHY0tF8edUP/0d/1rYh1dEswX3oktpTBz8S/E5zU/R6bGPBI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2n6/hmT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2n6/hmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754708062; x=1786244062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izBSlPkVOw4//9stiUNfClRL9We7Iu84Ki2pyKTNSJ4=;
  b=V2n6/hmTPZeyYhantuPs/yRP3iHNAatGSISRVuh5w5akqbl5FL9nm8hY
   mt0sUQYKOUHGcqQEDhfp7txxtN/LT+LmLCsO2VVAQ1Odw6QqdZHlVlmND
   xxyw2qOoaQyn+mEK0SBqcszNKFL+XoUJcWA1UXEMtwY0RSm7MAJVYnaGC
   BK+IMgvo1FvKZ0T3p8K78yKzn5c83JVPmILUpBTiWekMhb1F+yTgyBv6z
   v46E4SNFzznxxVEYZpupu5RO256JtVsoSnDOlIVf6R+uoaNTOhVJPYjyx
   k7/BPZkCm7LtZL9vp6erWQAIz/NXXTLN0ikJqPSMacoLB4t/39oDnodI4
   A==;
X-CSE-ConnectionGUID: zt0fJC83ToeI7pV3kwb1ww==
X-CSE-MsgGUID: EJn9D6BHS9OmBPO6cWW2ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57182602"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57182602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 19:54:21 -0700
X-CSE-ConnectionGUID: +PTUsd+BR8y1viZwX0CiVw==
X-CSE-MsgGUID: M4gmgocZTYqnw8pz9v7+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164963435"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2025 19:54:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukZir-0004TU-2Q;
	Sat, 09 Aug 2025 02:54:17 +0000
Date: Sat, 9 Aug 2025 10:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 285/286]
 fs/bcachefs/backpointers.c:993:26: error: use of undeclared identifier
 'bitmap'; did you mean 'bmap'?
Message-ID: <202508091053.RatDuRNU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   f5a36d2f14aaecaa10d3534fe4628230a72f52d1
commit: 75a8c12d5cd2f2dd902a6c956d89393a449b022c [285/286] bcachefs: Fix backpointer_node_has_missing()
config: arm-randconfig-002-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091053.RatDuRNU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091053.RatDuRNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091053.RatDuRNU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/backpointers.c:2:
   In file included from fs/bcachefs/bcachefs.h:218:
   In file included from fs/bcachefs/bcachefs_format.h:524:
   fs/bcachefs/sb-counters_format.h:132:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     132 |         }
         |         ^
>> fs/bcachefs/backpointers.c:993:26: error: use of undeclared identifier 'bitmap'; did you mean 'bmap'?
     993 |                                                      find_next_bit(bitmap, ca->mi.nbuckets, bucket.offset));
         |                                                                    ^~~~~~
         |                                                                    bmap
   arch/arm/include/asm/bitops.h:205:52: note: expanded from macro 'find_next_bit'
     205 | #define find_next_bit(p,sz,off)         _find_next_bit_le(p,sz,off)
         |                                                           ^
   include/linux/minmax.h:161:52: note: expanded from macro 'min_t'
     161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                                                    ^
   include/linux/minmax.h:89:33: note: expanded from macro '__cmp_once'
      89 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                        ^
   include/linux/minmax.h:86:31: note: expanded from macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/fs.h:3050:12: note: 'bmap' declared here
    3050 | extern int bmap(struct inode *inode, sector_t *block);
         |            ^
   1 warning and 1 error generated.


vim +993 fs/bcachefs/backpointers.c

c738866e47ef2e4 Kent Overstreet 2024-11-15   963  
c738866e47ef2e4 Kent Overstreet 2024-11-15   964  static bool backpointer_node_has_missing(struct bch_fs *c, struct bkey_s_c k)
c738866e47ef2e4 Kent Overstreet 2024-11-15   965  {
c738866e47ef2e4 Kent Overstreet 2024-11-15   966  	switch (k.k->type) {
c738866e47ef2e4 Kent Overstreet 2024-11-15   967  	case KEY_TYPE_btree_ptr_v2: {
c738866e47ef2e4 Kent Overstreet 2024-11-15   968  		bool ret = false;
c738866e47ef2e4 Kent Overstreet 2024-11-15   969  
18dad454cd16cbb Kent Overstreet 2025-05-24   970  		guard(rcu)();
c738866e47ef2e4 Kent Overstreet 2024-11-15   971  		struct bpos pos = bkey_s_c_to_btree_ptr_v2(k).v->min_key;
c738866e47ef2e4 Kent Overstreet 2024-11-15   972  		while (pos.inode <= k.k->p.inode) {
c738866e47ef2e4 Kent Overstreet 2024-11-15   973  			if (pos.inode >= c->sb.nr_devices)
c738866e47ef2e4 Kent Overstreet 2024-11-15   974  				break;
c738866e47ef2e4 Kent Overstreet 2024-11-15   975  
c738866e47ef2e4 Kent Overstreet 2024-11-15   976  			struct bch_dev *ca = bch2_dev_rcu_noerror(c, pos.inode);
c738866e47ef2e4 Kent Overstreet 2024-11-15   977  			if (!ca)
c738866e47ef2e4 Kent Overstreet 2024-11-15   978  				goto next;
c738866e47ef2e4 Kent Overstreet 2024-11-15   979  
c738866e47ef2e4 Kent Overstreet 2024-11-15   980  			struct bpos bucket = bp_pos_to_bucket(ca, pos);
13ffcbae86dadbf Kent Overstreet 2025-05-09   981  			u64 next = ca->mi.nbuckets;
13ffcbae86dadbf Kent Overstreet 2025-05-09   982  
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   983  			unsigned long *mismatch = READ_ONCE(ca->bucket_backpointer_mismatch.buckets);
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   984  			unsigned long *empty = READ_ONCE(ca->bucket_backpointer_empty.buckets);
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   985  			if (mismatch) {
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   986  				/* Find the first bucket with mismatches - but
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   987  				 * not empty buckets; we don't need to pin those
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   988  				 * because we just recreate all backpointers in
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   989  				 * those buckets
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   990  				 */
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   991  				do {
13ffcbae86dadbf Kent Overstreet 2025-05-09   992  					next = min_t(u64, next,
15f969326ee296f Kent Overstreet 2025-05-17  @993  						     find_next_bit(bitmap, ca->mi.nbuckets, bucket.offset));
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   994  				} while (next < ca->mi.nbuckets &&
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   995  					 (empty && test_bit(next, empty)));
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   996  
75a8c12d5cd2f2d Kent Overstreet 2025-08-08   997  			}
13ffcbae86dadbf Kent Overstreet 2025-05-09   998  
13ffcbae86dadbf Kent Overstreet 2025-05-09   999  			bucket.offset = next;
c738866e47ef2e4 Kent Overstreet 2024-11-15  1000  			if (bucket.offset == ca->mi.nbuckets)
c738866e47ef2e4 Kent Overstreet 2024-11-15  1001  				goto next;
c738866e47ef2e4 Kent Overstreet 2024-11-15  1002  
c738866e47ef2e4 Kent Overstreet 2024-11-15  1003  			ret = bpos_le(bucket_pos_to_bp_end(ca, bucket), k.k->p);
c738866e47ef2e4 Kent Overstreet 2024-11-15  1004  			if (ret)
c738866e47ef2e4 Kent Overstreet 2024-11-15  1005  				break;
c738866e47ef2e4 Kent Overstreet 2024-11-15  1006  next:
c738866e47ef2e4 Kent Overstreet 2024-11-15  1007  			pos = SPOS(pos.inode + 1, 0, 0);
c738866e47ef2e4 Kent Overstreet 2024-11-15  1008  		}
c738866e47ef2e4 Kent Overstreet 2024-11-15  1009  
c738866e47ef2e4 Kent Overstreet 2024-11-15  1010  		return ret;
c738866e47ef2e4 Kent Overstreet 2024-11-15  1011  	}
c738866e47ef2e4 Kent Overstreet 2024-11-15  1012  	case KEY_TYPE_btree_ptr:
c738866e47ef2e4 Kent Overstreet 2024-11-15  1013  		return true;
c738866e47ef2e4 Kent Overstreet 2024-11-15  1014  	default:
c738866e47ef2e4 Kent Overstreet 2024-11-15  1015  		return false;
c738866e47ef2e4 Kent Overstreet 2024-11-15  1016  	}
c738866e47ef2e4 Kent Overstreet 2024-11-15  1017  }
c738866e47ef2e4 Kent Overstreet 2024-11-15  1018  

:::::: The code at line 993 was first introduced by commit
:::::: 15f969326ee296f7b7faf7704105a99fa02c288d bcachefs: Improve bucket_bitmap code

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
