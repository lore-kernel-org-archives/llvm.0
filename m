Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210220E32F;
	Sat, 19 Oct 2024 04:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729313186; cv=none; b=CaD6dKBCmOPfcjx4DpUmiosz8lJPU8d7nfF6b+Bd+z/DsodAzD7JmJzhLjHavdVxMyCpT61sIV3ffpZvDs67E8Yu77asrqGDdf7PvkQfQ+SGQQarq8c+VxdDrXvmI7IyQL6Fk4q0DL7SDoc4vjEvsGmxyuVyXENFhZixw9UcLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729313186; c=relaxed/simple;
	bh=kGJ6iBjd5XlW4xfDLviqem2uDkyb1b7HEnaq7clLBMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHoyaBTcKMXCQyxh+Or8q+lm3a34ccWW8keV900bWRpzLVqk2tIkV2U+eqf7FngVubYZwd882HWd4FtPHzMsJpNRJ8e7VJ/ibnu+Kk8fXi4jRaQxFTU64Yh7gCF7gt0WdQo9k4tqmVO3ECVk5AMlFKEqHqn9EArIbbpqwAo5BZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHIopmKs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHIopmKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729313184; x=1760849184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kGJ6iBjd5XlW4xfDLviqem2uDkyb1b7HEnaq7clLBMs=;
  b=NHIopmKs7ffZ8Wfr9kyEdF8gB4yw9OMhs3m+3gA9rCT9F/Ug3XesQyt9
   41f/R0EiH4NmaFtWudrxCc03F1hX1GHJa5+GfukAmDslDKtPK00YfV9va
   5zikRF+f/Z4++eqqVmo3o8buVi2OdEoYLdEJ6qP4e/EklvrAbmUFGf0Bq
   uLfcJH4l+rD81t8MW+HXep6HXlhA0rBtjQGmy1O/yu0Ogk7fIgnAlyFOx
   4DHa/39INMuLa3tzj7+HIccIRyKe49ZiunoX/RzjE94e0XHTrpaeEbwQG
   whgDvWQMTJJXPWP4OlzieEQ9FNMyirt9isGF4AhuNDcuaF40dC87Z010b
   Q==;
X-CSE-ConnectionGUID: /YI7LuyvTM+4TWYyuowIOQ==
X-CSE-MsgGUID: hvytALXHQK+w5Y9qRpa7Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39982066"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39982066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 21:46:24 -0700
X-CSE-ConnectionGUID: b0/uQkyBRAyW/K++vZtkfg==
X-CSE-MsgGUID: KOf1K0yqTc6rnGxWtedRDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79457198"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 21:46:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t21M3-000OhV-2M;
	Sat, 19 Oct 2024 04:46:19 +0000
Date: Sat, 19 Oct 2024 12:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 13/13] mm: vmscan, swap, zswap: Compress batching
 of folios in shrink_folio_list().
Message-ID: <202410191245.1RsX8FF0-lkp@intel.com>
References: <20241018064101.336232-14-kanchana.p.sridhar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018064101.336232-14-kanchana.p.sridhar@intel.com>

Hi Kanchana,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 817952b8be34aad40e07f6832fb9d1fc08961550]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/crypto-acomp-Add-a-poll-operation-to-acomp_alg-and-acomp_req/20241018-144331
base:   817952b8be34aad40e07f6832fb9d1fc08961550
patch link:    https://lore.kernel.org/r/20241018064101.336232-14-kanchana.p.sridhar%40intel.com
patch subject: [RFC PATCH v1 13/13] mm: vmscan, swap, zswap: Compress batching of folios in shrink_folio_list().
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241019/202410191245.1RsX8FF0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191245.1RsX8FF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191245.1RsX8FF0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:484:10: note: expanded from macro '__native_word'
     484 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:484:39: note: expanded from macro '__native_word'
     484 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:485:10: note: expanded from macro '__native_word'
     485 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:485:38: note: expanded from macro '__native_word'
     485 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:473:13: note: expanded from macro '__unqual_scalar_typeof'
     473 |                 _Generic((x),                                           \
         |                           ^
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:480:15: note: expanded from macro '__unqual_scalar_typeof'
     480 |                          default: (x)))
         |                                    ^
>> mm/page_io.c:412:35: error: no member named 'zswap_writeback' in 'struct mem_cgroup'
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                                    ~~~~~~~~~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
>> mm/page_io.c:412:4: error: invalid argument type 'void' to unary expression
     412 |                         !READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 errors generated.


vim +412 mm/page_io.c

   343	
   344	/*
   345	 * zswap batching of folios with IAA:
   346	 *
   347	 * Reclaim batching note for pmd-mappable folios:
   348	 * Any pmd-mappable folio in the reclaim path will be processed in a batch
   349	 * comprising only that folio. There will be no mixed batches containing
   350	 * pmd-mappable folios for batch compression with IAA.
   351	 * There are no restrictions with other large folios: a reclaim batch
   352	 * can comprise of any-order mix of non-pmd-mappable folios.
   353	 */
   354	/*
   355	 * We may have stale swap cache pages in memory: notice
   356	 * them here and get rid of the unnecessary final write.
   357	 */
   358	int swap_writepage(struct page *page, struct writeback_control *wbc)
   359	{
   360		struct folio *folio = page_folio(page);
   361		int ret;
   362	
   363		if (folio_free_swap(folio)) {
   364			folio_unlock(folio);
   365			return 0;
   366		}
   367		/*
   368		 * Arch code may have to preserve more data than just the page
   369		 * contents, e.g. memory tags.
   370		 */
   371		ret = arch_prepare_to_swap(folio);
   372		if (ret) {
   373			folio_mark_dirty(folio);
   374			folio_unlock(folio);
   375			return ret;
   376		}
   377	
   378		/*
   379		 * Use a bitmap (zeromap) to avoid doing IO for zero-filled pages.
   380		 * The bits in zeromap are protected by the locked swapcache folio
   381		 * and atomic updates are used to protect against read-modify-write
   382		 * corruption due to other zero swap entries seeing concurrent updates.
   383		 */
   384		if (is_folio_zero_filled(folio)) {
   385			swap_zeromap_folio_set(folio);
   386			folio_unlock(folio);
   387			return 0;
   388		} else {
   389			/*
   390			 * Clear bits this folio occupies in the zeromap to prevent
   391			 * zero data being read in from any previous zero writes that
   392			 * occupied the same swap entries.
   393			 */
   394			swap_zeromap_folio_clear(folio);
   395		}
   396	
   397		/*
   398		 * Batching of compressions with IAA: If reclaim path pageout has
   399		 * invoked swap_writepage with a wbc->swap_in_memory_cache_plug,
   400		 * add the page to the plug, or invoke zswap_store_batch() if
   401		 * "vm.compress-batchsize" elements have been stored in
   402		 * the plug.
   403		 *
   404		 * If swap_writepage has been called from other kernel code without
   405		 * a wbc->swap_in_memory_cache_plug, call zswap_store() with the folio
   406		 * (i.e. without adding the folio to a plug for batch processing).
   407		 */
   408		if (wbc && wbc->swap_in_memory_cache_plug) {
   409			if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio)) &&
   410				!zswap_is_enabled() &&
   411				folio_memcg(folio) &&
 > 412				!READ_ONCE(folio_memcg(folio)->zswap_writeback)) {
   413				folio_mark_dirty(folio);
   414				return AOP_WRITEPAGE_ACTIVATE;
   415			}
   416	
   417			if (swap_writepage_in_memory_cache(folio, wbc))
   418				return AOP_PAGE_BATCH_SUCCESS;
   419			else
   420				return AOP_PAGE_BATCHED;
   421		} else if (zswap_store(folio)) {
   422			count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
   423			folio_unlock(folio);
   424			return 0;
   425		}
   426		if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
   427			folio_mark_dirty(folio);
   428			return AOP_WRITEPAGE_ACTIVATE;
   429		}
   430	
   431		__swap_writepage(folio, wbc);
   432		return 0;
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
