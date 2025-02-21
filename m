Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14811DDC3F;
	Fri, 21 Feb 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137756; cv=none; b=mK4VBjLDP5rfb6nI3C99bJamscYoslcsZ+VI4vk1fO7nptwxbIgf7Z/4/UOcdysWSSLOl1H0Fg4yKQXPhnlyzpn8fJcru3fKvopPId7VBvrLD2f6EMBrem5OOpGBX9IdakXxf6BFr3WuF8Dk2c+Pnvu54UEC6ZyLMbTQa4kcy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137756; c=relaxed/simple;
	bh=hkd/b4gOag/Mc7jsu0QTcBdxqU//TqIaBqxmQbCEktY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xt9NeWn27S7uiScYCaPBva+3nSsAqgW52vmbeRNKASZJ8Wl37AJKWxQoaNmym8XHTeUxIEPtag4E4UsHiQx1UzMezp0jhgNoHfOcgT+ZkyFdlPvQ7xseCMLwTIdR0Q8MIP3iROk8+ZcUgNSFvOtzUxOA1UplifTPu5E/e6CBlM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ea/OrEht; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea/OrEht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740137755; x=1771673755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hkd/b4gOag/Mc7jsu0QTcBdxqU//TqIaBqxmQbCEktY=;
  b=Ea/OrEhtteM5BGS00yIwhSzg35jCQFG2w6EAZavGkX1+BvxFefwCZT7i
   GzXuF7iVbnTandAdsn7LtTyOWYcaf9S0wdgvDackNSHTMI6GosBzMYDe1
   RFI2SoD6Sqva4YnELOwYfR2VztfGK1CFJwibR1vVzdL3tRG/EhtdpZ+bf
   P2bMFKom/5+BQi3oUvQV9EhqZMR7FlHUUAi3VRwQs1spguKd9fBdd36Vu
   dwts/kq5iCYqgpReUTE7vZpJ0cHkZufoG+uaQyfDrNqx94DwQ5wKG0P/E
   Y+QSKR7mPQ4MZ6xzps1jMjUH2Oo3G0gKtnblirAfwCyJCq8Pkak9nhOxl
   Q==;
X-CSE-ConnectionGUID: 1PFzArt+Si26QeGbRpik1A==
X-CSE-MsgGUID: dYmhAaA/R66z/eUqdS5WTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41220579"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="41220579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:35:54 -0800
X-CSE-ConnectionGUID: TMCclODFTLSk+RNlZtZqCQ==
X-CSE-MsgGUID: IRCtUoZAQ4y1T2YA/dBtCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115541625"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 03:35:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRJm-0005S3-23;
	Fri, 21 Feb 2025 11:35:45 +0000
Date: Fri, 21 Feb 2025 19:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] btrfs: prepare extent_io.c for future larger folio
 support
Message-ID: <202502211912.nOgvIfZ9-lkp@intel.com>
References: <19dfc0e42dce6416b66df114513d18d93b830d17.1740043233.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19dfc0e42dce6416b66df114513d18d93b830d17.1740043233.git.wqu@suse.com>

Hi Qu,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on next-20250221]
[cannot apply to linus/master v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-prepare-subpage-c-for-larger-folios-support/20250220-172912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/19dfc0e42dce6416b66df114513d18d93b830d17.1740043233.git.wqu%40suse.com
patch subject: [PATCH 4/5] btrfs: prepare extent_io.c for future larger folio support
config: arm-randconfig-004-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211912.nOgvIfZ9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211912.nOgvIfZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211912.nOgvIfZ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/extent_io.c:2327:13: error: call to '__compiletime_assert_713' declared with 'error' attribute: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
    2327 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
         |                           ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:2:1: note: expanded from here
       2 | __compiletime_assert_713
         | ^
   1 error generated.


vim +2327 fs/btrfs/extent_io.c

  2279	
  2280	/*
  2281	 * Submit the pages in the range to bio for call sites which delalloc range has
  2282	 * already been ran (aka, ordered extent inserted) and all pages are still
  2283	 * locked.
  2284	 */
  2285	void extent_write_locked_range(struct inode *inode, const struct folio *locked_folio,
  2286				       u64 start, u64 end, struct writeback_control *wbc,
  2287				       bool pages_dirty)
  2288	{
  2289		bool found_error = false;
  2290		int ret = 0;
  2291		struct address_space *mapping = inode->i_mapping;
  2292		struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
  2293		const u32 sectorsize = fs_info->sectorsize;
  2294		loff_t i_size = i_size_read(inode);
  2295		u64 cur = start;
  2296		struct btrfs_bio_ctrl bio_ctrl = {
  2297			.wbc = wbc,
  2298			.opf = REQ_OP_WRITE | wbc_to_write_flags(wbc),
  2299		};
  2300	
  2301		if (wbc->no_cgroup_owner)
  2302			bio_ctrl.opf |= REQ_BTRFS_CGROUP_PUNT;
  2303	
  2304		ASSERT(IS_ALIGNED(start, sectorsize) && IS_ALIGNED(end + 1, sectorsize));
  2305	
  2306		while (cur <= end) {
  2307			u64 cur_end;
  2308			u32 cur_len;
  2309			struct folio *folio;
  2310	
  2311			folio = filemap_get_folio(mapping, cur >> PAGE_SHIFT);
  2312	
  2313			/*
  2314			 * This shouldn't happen, the pages are pinned and locked, this
  2315			 * code is just in case, but shouldn't actually be run.
  2316			 */
  2317			if (IS_ERR(folio)) {
  2318				cur_end = min(round_down(cur, PAGE_SIZE) + PAGE_SIZE - 1, end);
  2319				cur_len = cur_end + 1 - cur;
  2320				btrfs_mark_ordered_io_finished(BTRFS_I(inode), NULL,
  2321							       cur, cur_len, false);
  2322				mapping_set_error(mapping, PTR_ERR(folio));
  2323				cur = cur_end;
  2324				continue;
  2325			}
  2326	
> 2327			cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
  2328			cur_len = cur_end + 1 - cur;
  2329	
  2330			ASSERT(folio_test_locked(folio));
  2331			if (pages_dirty && folio != locked_folio)
  2332				ASSERT(folio_test_dirty(folio));
  2333	
  2334			/*
  2335			 * Set the submission bitmap to submit all sectors.
  2336			 * extent_writepage_io() will do the truncation correctly.
  2337			 */
  2338			bio_ctrl.submit_bitmap = (unsigned long)-1;
  2339			ret = extent_writepage_io(BTRFS_I(inode), folio, cur, cur_len,
  2340						  &bio_ctrl, i_size);
  2341			if (ret == 1)
  2342				goto next_page;
  2343	
  2344			if (ret)
  2345				mapping_set_error(mapping, ret);
  2346			btrfs_folio_end_lock(fs_info, folio, cur, cur_len);
  2347			if (ret < 0)
  2348				found_error = true;
  2349	next_page:
  2350			folio_put(folio);
  2351			cur = cur_end + 1;
  2352		}
  2353	
  2354		submit_write_bio(&bio_ctrl, found_error ? ret : 0);
  2355	}
  2356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
