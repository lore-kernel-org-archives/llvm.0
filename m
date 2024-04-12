Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124617BCE;
	Fri, 12 Apr 2024 05:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712898394; cv=none; b=GWjP3KQ2Zh9B59M9lpQw7GkSJ8IE4zLXHYAb9tFUjrtXBPQkWixBAOrH84tRA9gZrfYd3z49F85aii2hC4BF5KXOrgBmvhq+C7Ath2hbmSxbKkNeVqr55IUjx2UNvRxPvfm/1glG4JmBVVfsKIJqYoqwAihbvBwDtXHwUBShyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712898394; c=relaxed/simple;
	bh=ynBXrjLRP/xsZtwcdjRsgTFiONxCbSJBVFbNMKqOzGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTfs+67PlNrK5J2PrVH4Yro3gkjuJ5S2xrLI1ps67DiOGfBrgbD3o18fb1gqfAPhUYUZJzkaJIjArkpvGGWFexAwIoEIIVaA0WYNtB0t2io4HTADZEmV5QHbAeRGaMHGskjlb82n9kQZuPHKjNclHbkhRJZ464Qrk6b9rBiPLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGE1dOnF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGE1dOnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712898392; x=1744434392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynBXrjLRP/xsZtwcdjRsgTFiONxCbSJBVFbNMKqOzGw=;
  b=EGE1dOnFxEexrbdwtASJG/YR6P2E0YQkDLLzR8hQkWoHjJoy2XKh1ssH
   7SluqLMrbsdQosintiqLJ+xSD3kB4t6vQYHFoBLz3gbPsKkN9GEPJ0e/l
   HEsYn3uMXwmH22CQsDGofALrNljYYLmQRJUBe7SaVkS8MH4dmhaG8B4Dm
   eu/QlPU0W33I1BC6jc9203Y9DnOXKmsV3WV16R/YuPMdxs4wy0JOG85Mu
   ZifyeoyPP2MNpSMjN3xrjXNvaxCJ+zUSsa0J3w9sdaqADtoXV20KNT19V
   WLsPnWvGOwNO5XrdL/TeAOrAGidVb67TJTQw37jRK0VEKIi0whQscZIr1
   A==;
X-CSE-ConnectionGUID: IqigKX2BSmmabDuaJPJ74g==
X-CSE-MsgGUID: ooVdOAT4SuG9I6Asfx9lwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12128203"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="12128203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:06:31 -0700
X-CSE-ConnectionGUID: LKDtLiMOT2i/gJuE/5M3wg==
X-CSE-MsgGUID: 0Xd9sfJrQKilE5bYRWpD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25663589"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2024 22:06:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv97M-0009Of-0H;
	Fri, 12 Apr 2024 05:06:28 +0000
Date: Fri, 12 Apr 2024 13:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 129/130]
 fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in
 a function definition is a C23 extension
Message-ID: <202404121258.3OIQI78Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ecb7f8abc97ccf1ab18363dcd37591329ae42cc2
commit: 60ec285a67d2cdd4ef950a3aed690e8c7f379720 [129/130] bcachefs: Path must be locked if trans->locked && path->should_be_locked
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240412/202404121258.3OIQI78Z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121258.3OIQI78Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121258.3OIQI78Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/alloc_background.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/alloc_background.c:7:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/alloc_background.c:1768:26: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1768 |                                   BCH_WATERMARK_btree|
         |                                   ~~~~~~~~~~~~~~~~~~~^
    1769 |                                   BCH_TRANS_COMMIT_no_enospc);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/alloc_background.c:1879:25: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1879 |                                         BCH_WATERMARK_btree|
         |                                         ~~~~~~~~~~~~~~~~~~~^
    1880 |                                         BCH_TRANS_COMMIT_no_enospc,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:188:63: note: expanded from macro 'bch2_trans_do'
     188 |         bch2_trans_run(_c, commit_do(trans, _disk_res, _journal_seq, _flags, _do))
         |                                                                      ^~~~~~
   fs/bcachefs/btree_update.h:173:23: note: expanded from macro 'commit_do'
     173 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:673:11: note: expanded from macro 'lockrestart_do'
     673 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_update.h:182:14: note: expanded from macro 'bch2_trans_run'
     182 |         int _ret = (_do);                                               \
         |                     ^~~
   fs/bcachefs/alloc_background.c:1957:26: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1957 |                                   BCH_WATERMARK_btree|
         |                                   ~~~~~~~~~~~~~~~~~~~^
    1958 |                                   BCH_TRANS_COMMIT_no_enospc);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 warnings generated.
--
   In file included from fs/bcachefs/backpointers.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/backpointers.c:9:
   In file included from fs/bcachefs/btree_update_interior.h:6:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   6 warnings generated.
--
   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/btree_io.c:7:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/btree_io.c:1884:36: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1884 |                                         BCH_WATERMARK_interior_updates|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
    1885 |                                         BCH_TRANS_COMMIT_journal_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:188:71: note: expanded from macro 'bch2_trans_do'
     188 |         bch2_trans_run(_c, commit_do(trans, _disk_res, _journal_seq, _flags, _do))
         |                                                                              ^~~
   fs/bcachefs/btree_update.h:172:25: note: expanded from macro 'commit_do'
     172 |         lockrestart_do(_trans, _do ?: bch2_trans_commit(_trans, (_disk_res),\
         |                                ^~~
   fs/bcachefs/btree_iter.h:673:11: note: expanded from macro 'lockrestart_do'
     673 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_update.h:182:14: note: expanded from macro 'bch2_trans_run'
     182 |         int _ret = (_do);                                               \
         |                     ^~~
   7 warnings generated.
--
   In file included from fs/bcachefs/btree_key_cache.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/btree_key_cache.c:7:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/btree_key_cache.c:118:7: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always true [-Wtautological-constant-out-of-range-compare]
     118 |                 if (ULONG_CMP_GE(ck->btree_trans_barrier_seq,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     119 |                                  pos->btree_trans_barrier_seq)) {
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:35:43: note: expanded from macro 'ULONG_CMP_GE'
      35 | #define ULONG_CMP_GE(a, b)      (ULONG_MAX / 2 >= (a) - (b))
         |                                  ~~~~~~~~~~~~~ ^  ~~~~~~~~~
   7 warnings generated.
--
   In file included from fs/bcachefs/btree_update_interior.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/btree_update_interior.c:11:
   In file included from fs/bcachefs/btree_update_interior.h:6:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/btree_update_interior.c:715:34: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
     715 |                         BCH_WATERMARK_interior_updates|
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
     716 |                         BCH_TRANS_COMMIT_no_enospc|
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:173:23: note: expanded from macro 'commit_do'
     173 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:673:11: note: expanded from macro 'lockrestart_do'
     673 |         _ret2 = (_do);                                                  \
         |                  ^~~
   7 warnings generated.
--
   In file included from fs/bcachefs/btree_write_buffer.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/btree_write_buffer.c:4:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/btree_write_buffer.c:386:27: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
     386 |                                         BCH_WATERMARK_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
     387 |                                         BCH_TRANS_COMMIT_no_check_rw|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:173:23: note: expanded from macro 'commit_do'
     173 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:673:11: note: expanded from macro 'lockrestart_do'
     673 |         _ret2 = (_do);                                                  \
         |                  ^~~
   7 warnings generated.
--
   In file included from fs/bcachefs/journal_io.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/journal_io.c:5:
   In file included from fs/bcachefs/btree_io.h:7:
>> fs/bcachefs/btree_locking.h:428:69: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     428 | static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
         |                                                                     ^
   fs/bcachefs/journal_io.c:1591:35: warning: unused function 'journal_last_unwritten_buf' [-Wunused-function]
    1591 | static inline struct journal_buf *journal_last_unwritten_buf(struct journal *j)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings generated.
..


vim +428 fs/bcachefs/btree_locking.h

   423	
   424	#ifdef CONFIG_BCACHEFS_DEBUG
   425	void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *);
   426	void bch2_trans_verify_locks(struct btree_trans *);
   427	#else
 > 428	static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
   429	static inline void bch2_trans_verify_locks(struct btree_trans *trans) {}
   430	#endif
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
