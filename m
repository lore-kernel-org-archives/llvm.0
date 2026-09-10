Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D249B5BD;
	Thu, 10 Sep 2026 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077465; cv=none; b=YHnLiwrvOp2Ohmg/9sT9h2/2PdiBVO2EEJNtJR85L+8UMMMr0dUUNvMeVJJ8y6RIwyg3Ra+XXOd4o2XZYgMWMo4sLcK1/3d1K7011yUkxGF6UYcpdZ8hycV4Zd2w9zbua+El8aAyT/DbhSdaYPbNnQrxQZnzIuwmpN6ovRYNh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077465; c=relaxed/simple;
	bh=5+OGmdkwiux2fe0Ev3Tqt1z2YmOXlu3wh6Yjazi64d8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vs7KPUp/0ucQoFQ62yNu/U/kvnrMmDLUiyQt7uTmRMwUoNQnwYQQNB1bPtlbJ1UZL/O7nwr2TKJ7YEptWyiwJZU+ei0wcDARZR2AWsPUyOZvHs6DN7xwXb+x//lCTCPb2RMHWvKVT0VuMsI3SL4B9aWgte1ybOL+QM0q74BcGtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6rvjaIb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6rvjaIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789077463; x=1820613463;
  h=date:from:to:cc:subject:message-id;
  bh=5+OGmdkwiux2fe0Ev3Tqt1z2YmOXlu3wh6Yjazi64d8=;
  b=O6rvjaIbc4lTU9fmrRI6rV/6RmYEOFgoRdC2I/cMwPnIhMCWNNd1Pn60
   k/bxWOLVYQ/kQdhGDxMqLXjXl/T2eKLID7JWNCSp/Jw1F9JFOqo82EZe2
   qEJK6zZXlVkuhZzqX5bMCGyFyTp3f/+6V3Nf521ejv2521XnnxXU/689q
   W9E1K8lJQUsJd5lKwbtM/9mjtW//vGpjg27M1X304pzfz/HT/dyTjVkEm
   FzdD+3AXOnzlSPScMGnp9nHSGVX2MgNgNRYULqpTvmcvCD5XB1633SssT
   xsuR9R3iUQlVQkWYtLytDFmoH+A/1qyUdhYyHC3WF97Hth9P5M3Y3sci5
   g==;
X-CSE-ConnectionGUID: Mt2ScGhkR8mvI1tznaB+aw==
X-CSE-MsgGUID: zLxQUCWfQ4yN/g9CvOUjaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92052048"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="92052048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:57:43 -0700
X-CSE-ConnectionGUID: tgBE3+rdRLm/YbdMWooqXA==
X-CSE-MsgGUID: JWUcLddaSByWognaPjvy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="270382084"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 14:57:40 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mlu-000000000ZB-2EwG;
	Thu, 10 Sep 2026 21:57:31 +0000
Date: Fri, 11 Sep 2026 05:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, barry.song@csr.com
Subject: [baohua:dev/kairui_scanbalance 9/9] mm/vmscan.c:1954:42:
 error: no member named 'lrugen' in 'struct lruvec'
Message-ID: <202609110517.nWCAXYeN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git dev/kairui_scanbalance
head:   c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570
commit: c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570 [9/9] mm/mglru: avoid placing rejected folios below populated gen
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260911/202609110517.nWCAXYeN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110517.nWCAXYeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110517.nWCAXYeN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:1954:42: error: no member named 'lrugen' in 'struct lruvec'
    1954 |         struct lru_gen_folio *lrugen = &lruvec->lrugen;
         |                                         ~~~~~~  ^
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:663:10: note: expanded from macro '__native_word'
     663 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:663:39: note: expanded from macro '__native_word'
     663 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:664:10: note: expanded from macro '__native_word'
     664 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:664:38: note: expanded from macro '__native_word'
     664 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:635:53: note: expanded from macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   mm/vmscan.c:1955:46: error: no member named 'lrugen' in 'struct lruvec'
    1955 |         unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                           ~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
>> mm/vmscan.c:1957:46: error: incomplete definition of type 'struct lru_gen_folio'
    1957 |         if (folio_test_unevictable(folio) || !lrugen->enabled)
         |                                               ~~~~~~^
   mm/vmscan.c:1954:9: note: forward declaration of 'struct lru_gen_folio'
    1954 |         struct lru_gen_folio *lrugen = &lruvec->lrugen;
         |                ^
>> mm/vmscan.c:1960:8: error: call to undeclared function 'lru_gen_folio_seq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1960 |         seq = lru_gen_folio_seq(lruvec, folio, false);
         |               ^
>> mm/vmscan.c:1962:8: error: call to undeclared function 'lru_gen_from_seq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1962 |         gen = lru_gen_from_seq(seq);
         |               ^
>> mm/vmscan.c:1967:2: error: call to undeclared function 'lru_gen_update_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1967 |         lru_gen_update_size(lruvec, folio, -1, gen);
         |         ^
   mm/vmscan.c:1968:31: error: incomplete definition of type 'struct lru_gen_folio'
    1968 |         list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
         |                                ~~~~~~^
   mm/vmscan.c:1954:9: note: forward declaration of 'struct lru_gen_folio'
    1954 |         struct lru_gen_folio *lrugen = &lruvec->lrugen;
         |                ^
   13 errors generated.


vim +1954 mm/vmscan.c

  1938	
  1939	/*
  1940	 * Even though we have called folio_set_active() for rejected folios
  1941	 * in evict_folios(), they may still be demoted or placed in the last
  1942	 * populated generation since we can now scan all generations.
  1943	 * Make sure these folios are neither demoted nor placed in the last
  1944	 * populated generation, unless it is also the youngest generation
  1945	 */
  1946	static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, struct folio *folio,
  1947			unsigned long scanned_seq)
  1948	{
  1949		unsigned long seq;
  1950		unsigned long flags;
  1951		int gen;
  1952		int type = folio_is_file_lru(folio);
  1953		int zone = folio_zonenum(folio);
> 1954		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  1955		unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
  1956	
> 1957		if (folio_test_unevictable(folio) || !lrugen->enabled)
  1958			return false;
  1959	
> 1960		seq = lru_gen_folio_seq(lruvec, folio, false);
  1961		seq = max(seq, min(scanned_seq + 1, max_seq));
> 1962		gen = lru_gen_from_seq(seq);
  1963		flags = (gen + 1UL) << LRU_GEN_PGOFF;
  1964		/* see the comment on MIN_NR_GENS about PG_active */
  1965		set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);
  1966	
> 1967		lru_gen_update_size(lruvec, folio, -1, gen);
  1968		list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
  1969	
  1970		return true;
  1971	}
  1972	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
