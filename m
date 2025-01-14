Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513B2063C1;
	Tue, 14 Jan 2025 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881892; cv=none; b=tjWUYQvEHB7soX14lVNl7+l18xfr9rmHB1BRF18la8FVNFCMHV8IhqGV/qy11e5yLVD0Ry+ezQ8bYoc7IJVb8QfPKAp3Bw3mGUQj94tJtiCp7i7bDjqtxVViRiY4FiykyUzga1CakLJOG2cAly/yIkVUQJc2wzfs2Zggsk43S54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881892; c=relaxed/simple;
	bh=Il35CpZAIVyUMgf6RBmtKGRBAz4DG0oW253pWUlglSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHN9nf4eBPWqWHE1uQrFPzjZqvizzRIv690r7NctcEGC4FmGzZpIXOLsTsvaP4UkX2uE4IPV6RaarWCVx4mAGC9ppeAfu69PxdrcVywsCzD0Xp8Zy1P8b9x4xFh/aJnrOPTPYXkYEL2ErI/GN3xWiu/SrIsisx32cBp91Yc16I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKBo4s6y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKBo4s6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736881891; x=1768417891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Il35CpZAIVyUMgf6RBmtKGRBAz4DG0oW253pWUlglSo=;
  b=MKBo4s6yayukAoGH781URY3D3YWUIk7/NmSWt40ubSR3kCWREzhEuzw1
   S1U6aqYw2N/ICj1TlQjroiCZ3E2ZdTdHyqWKwKMEYxI2VrI7bxgrz/uI0
   Ouh1TFrg0VfX6VFtX4BUIteU7k0V2e4YuQQi3FgRrQ0cIaZatcMT21Zme
   pzPXCBatpAuv5avH5X5mwyB573cVECoALCxu42pjYchPFiqRvVy16oQxm
   71+gQRua8SzOiafDxlRzAU8L7AwCrq7/8YWG0OD1qWlM8DBMyRAPw/xo6
   gvH9pb2R5B+GmZUefSUNJSDvGYrwjiFiGwzdz9g1HwvIdv4oq+R0iZA1I
   Q==;
X-CSE-ConnectionGUID: 2Oc5LirFQT6sSAQ8Df++Fw==
X-CSE-MsgGUID: zzhm//4LSVWM5g1tctKDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48196286"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="48196286"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 11:11:31 -0800
X-CSE-ConnectionGUID: gwku4mClQdSpHMbhRldPAA==
X-CSE-MsgGUID: x0Tqi6QBRs+u3JawYJbpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="105072038"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2025 11:11:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXmJz-000OvP-0h;
	Tue, 14 Jan 2025 19:11:27 +0000
Date: Wed, 15 Jan 2025 03:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] f2fs: add a sysfs entry to request donate
 file-backed pages
Message-ID: <202501150239.3M7Ho3di-lkp@intel.com>
References: <20250113183933.1268282-2-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113183933.1268282-2-jaegeuk@kernel.org>

Hi Jaegeuk,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev]
[also build test ERROR on linus/master v6.13-rc7 next-20250114]
[cannot apply to jaegeuk-f2fs/dev-test]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaegeuk-Kim/f2fs-add-a-sysfs-entry-to-request-donate-file-backed-pages/20250114-025051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
patch link:    https://lore.kernel.org/r/20250113183933.1268282-2-jaegeuk%40kernel.org
patch subject: [PATCH 2/2] f2fs: add a sysfs entry to request donate file-backed pages
config: i386-buildonly-randconfig-003-20250114 (https://download.01.org/0day-ci/archive/20250115/202501150239.3M7Ho3di-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150239.3M7Ho3di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150239.3M7Ho3di-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/sysfs.c:11:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/f2fs/sysfs.c:815:36: error: no member named 'ndirty_inode' in 'struct f2fs_sb_info'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                             ~~~  ^
   include/linux/minmax.h:129:41: note: expanded from macro 'min'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                               ^
   include/linux/minmax.h:105:28: note: expanded from macro '__careful_cmp'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                   ^
   include/linux/minmax.h:99:42: note: expanded from macro '__careful_cmp_once'
      99 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                                                 ^
>> fs/f2fs/sysfs.c:815:36: error: no member named 'ndirty_inode' in 'struct f2fs_sb_info'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                             ~~~  ^
   include/linux/minmax.h:129:41: note: expanded from macro 'min'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                               ^
   include/linux/minmax.h:105:28: note: expanded from macro '__careful_cmp'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                   ^
   include/linux/minmax.h:100:33: note: expanded from macro '__careful_cmp_once'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                                        ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> fs/f2fs/sysfs.c:815:36: error: no member named 'ndirty_inode' in 'struct f2fs_sb_info'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                             ~~~  ^
   include/linux/minmax.h:129:41: note: expanded from macro 'min'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                               ^
   include/linux/minmax.h:105:28: note: expanded from macro '__careful_cmp'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                   ^
   include/linux/minmax.h:100:33: note: expanded from macro '__careful_cmp_once'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                                        ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:542:22: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:530:23: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:522:9: note: expanded from macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   1 warning and 3 errors generated.


vim +815 fs/f2fs/sysfs.c

   676	
   677		if (!strcmp(a->attr.name, "atgc_candidate_ratio")) {
   678			if (t > 100)
   679				return -EINVAL;
   680			sbi->am.candidate_ratio = t;
   681			return count;
   682		}
   683	
   684		if (!strcmp(a->attr.name, "atgc_age_weight")) {
   685			if (t > 100)
   686				return -EINVAL;
   687			sbi->am.age_weight = t;
   688			return count;
   689		}
   690	
   691		if (!strcmp(a->attr.name, "gc_segment_mode")) {
   692			if (t < MAX_GC_MODE)
   693				sbi->gc_segment_mode = t;
   694			else
   695				return -EINVAL;
   696			return count;
   697		}
   698	
   699		if (!strcmp(a->attr.name, "gc_pin_file_threshold")) {
   700			if (t > MAX_GC_FAILED_PINNED_FILES)
   701				return -EINVAL;
   702			sbi->gc_pin_file_threshold = t;
   703			return count;
   704		}
   705	
   706		if (!strcmp(a->attr.name, "gc_reclaimed_segments")) {
   707			if (t != 0)
   708				return -EINVAL;
   709			sbi->gc_reclaimed_segs[sbi->gc_segment_mode] = 0;
   710			return count;
   711		}
   712	
   713		if (!strcmp(a->attr.name, "seq_file_ra_mul")) {
   714			if (t >= MIN_RA_MUL && t <= MAX_RA_MUL)
   715				sbi->seq_file_ra_mul = t;
   716			else
   717				return -EINVAL;
   718			return count;
   719		}
   720	
   721		if (!strcmp(a->attr.name, "max_fragment_chunk")) {
   722			if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
   723				sbi->max_fragment_chunk = t;
   724			else
   725				return -EINVAL;
   726			return count;
   727		}
   728	
   729		if (!strcmp(a->attr.name, "max_fragment_hole")) {
   730			if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
   731				sbi->max_fragment_hole = t;
   732			else
   733				return -EINVAL;
   734			return count;
   735		}
   736	
   737		if (!strcmp(a->attr.name, "peak_atomic_write")) {
   738			if (t != 0)
   739				return -EINVAL;
   740			sbi->peak_atomic_write = 0;
   741			return count;
   742		}
   743	
   744		if (!strcmp(a->attr.name, "committed_atomic_block")) {
   745			if (t != 0)
   746				return -EINVAL;
   747			sbi->committed_atomic_block = 0;
   748			return count;
   749		}
   750	
   751		if (!strcmp(a->attr.name, "revoked_atomic_block")) {
   752			if (t != 0)
   753				return -EINVAL;
   754			sbi->revoked_atomic_block = 0;
   755			return count;
   756		}
   757	
   758		if (!strcmp(a->attr.name, "readdir_ra")) {
   759			sbi->readdir_ra = !!t;
   760			return count;
   761		}
   762	
   763		if (!strcmp(a->attr.name, "hot_data_age_threshold")) {
   764			if (t == 0 || t >= sbi->warm_data_age_threshold)
   765				return -EINVAL;
   766			if (t == *ui)
   767				return count;
   768			*ui = (unsigned int)t;
   769			return count;
   770		}
   771	
   772		if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
   773			if (t <= sbi->hot_data_age_threshold)
   774				return -EINVAL;
   775			if (t == *ui)
   776				return count;
   777			*ui = (unsigned int)t;
   778			return count;
   779		}
   780	
   781		if (!strcmp(a->attr.name, "last_age_weight")) {
   782			if (t > 100)
   783				return -EINVAL;
   784			if (t == *ui)
   785				return count;
   786			*ui = (unsigned int)t;
   787			return count;
   788		}
   789	
   790		if (!strcmp(a->attr.name, "max_read_extent_count")) {
   791			if (t > UINT_MAX)
   792				return -EINVAL;
   793			*ui = (unsigned int)t;
   794			return count;
   795		}
   796	
   797		if (!strcmp(a->attr.name, "ipu_policy")) {
   798			if (t >= BIT(F2FS_IPU_MAX))
   799				return -EINVAL;
   800			/* allow F2FS_IPU_NOCACHE only for IPU in the pinned file */
   801			if (f2fs_lfs_mode(sbi) && (t & ~BIT(F2FS_IPU_NOCACHE)))
   802				return -EINVAL;
   803			SM_I(sbi)->ipu_policy = (unsigned int)t;
   804			return count;
   805		}
   806	
   807		if (!strcmp(a->attr.name, "dir_level")) {
   808			if (t > MAX_DIR_HASH_DEPTH)
   809				return -EINVAL;
   810			sbi->dir_level = t;
   811			return count;
   812		}
   813	
   814		if (!strcmp(a->attr.name, "donate_caches")) {
 > 815			sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
   816			f2fs_donate_caches(sbi);
   817			return count;
   818		}
   819	
   820		*ui = (unsigned int)t;
   821	
   822		return count;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
