Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0D27703A;
	Fri, 28 Feb 2025 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769347; cv=none; b=Aq7hreNKyXWE17XHCQuVgIgOgN7pXS4QCnyfiowkDcxqWe+zHhdovq6DVN9cGEi9YbE/wYEJSLC+jXFE1Bx6l9mnFz+eUYfURe0XUgcvCq2FheZj6dM2JUuqC0yheKjWOBK9/BqjZCxKPTPZqrjk3108TOEq4DbJWdDzpObq3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769347; c=relaxed/simple;
	bh=d4oay2GgTodlNOGqjIq78mWWypMWMFnKxf3KxwKxBjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwTqRuo9e8r7OxZTQGwWiwH1GsQpeDPESOGpp/r9qYoAX5Gbri7Fi5M+jcstopFcNZDIvasI2tO8a/KJewYw6G6PIdE93say0HBVuXp0Kyyj4n8OvLvwLJuR8uhlVoqw+DHaDXf/xHkOyW8EJ/ZV6/6Zt5J+zOZ6QFn2kaMqOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQFO3Daa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQFO3Daa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740769346; x=1772305346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d4oay2GgTodlNOGqjIq78mWWypMWMFnKxf3KxwKxBjA=;
  b=JQFO3DaaecaNofTnGtzNdfqDcenWkHXnwuZhqAFjcM6wLvjSffO1dACS
   gctFTkNR6rQpdDD4XQDjwf/rJItEvnB4KLthiBm3VqSicP7AOZ34xmtEl
   fx0fmBOe56iMNx4f5blxJhx7OVPrZe9v75BQa25D3RHRkxpa60nVSCuij
   TFIFnc96YohFIr5hrmY/T849wfXNVYcTDL0ILN39z/Rkbg6JOZtUVvKmR
   xt6Pb5dyYwAETmEpZJpfS6WrI91OEUXUnigRWmF3iMFuZu3wxKkItnMNW
   4JF2XvVv2lQjlZw4rZRuxs/xp0CEccoRnvTpIycH7IRhd+DXOqV2aB/KI
   w==;
X-CSE-ConnectionGUID: rZ8Cj4jxRkua5/87z7E7Yg==
X-CSE-MsgGUID: vVRJUJXZTIerYxGjGO83Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="29299852"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="29299852"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 11:02:25 -0800
X-CSE-ConnectionGUID: AHAMnL0ERJapFb7B72cvzw==
X-CSE-MsgGUID: ebSgc/H9Ru6pX0TLlvdtZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117402413"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Feb 2025 11:02:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to5cH-000FNK-1V;
	Fri, 28 Feb 2025 19:01:58 +0000
Date: Sat, 1 Mar 2025 03:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 6787/7423] fs/btrfs/extent_io.c:2497:13: error:
 call to '__compiletime_assert_745' declared with 'error' attribute:
 min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
Message-ID: <202503010248.V4jXOhgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 60ee7393a44c3feb91962dc08c3a3c1f11252982 [6787/7423] btrfs: prepare extent_io.c for future larger folio support
config: i386-buildonly-randconfig-004-20250228 (https://download.01.org/0day-ci/archive/20250301/202503010248.V4jXOhgM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010248.V4jXOhgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010248.V4jXOhgM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/extent_io.c:2497:13: error: call to '__compiletime_assert_745' declared with 'error' attribute: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
    2497 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
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
   <scratch space>:24:1: note: expanded from here
      24 | __compiletime_assert_745
         | ^
   1 error generated.


vim +2497 fs/btrfs/extent_io.c

  2449	
  2450	/*
  2451	 * Submit the pages in the range to bio for call sites which delalloc range has
  2452	 * already been ran (aka, ordered extent inserted) and all pages are still
  2453	 * locked.
  2454	 */
  2455	void extent_write_locked_range(struct inode *inode, const struct folio *locked_folio,
  2456				       u64 start, u64 end, struct writeback_control *wbc,
  2457				       bool pages_dirty)
  2458	{
  2459		bool found_error = false;
  2460		int ret = 0;
  2461		struct address_space *mapping = inode->i_mapping;
  2462		struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
  2463		const u32 sectorsize = fs_info->sectorsize;
  2464		loff_t i_size = i_size_read(inode);
  2465		u64 cur = start;
  2466		struct btrfs_bio_ctrl bio_ctrl = {
  2467			.wbc = wbc,
  2468			.opf = REQ_OP_WRITE | wbc_to_write_flags(wbc),
  2469		};
  2470	
  2471		if (wbc->no_cgroup_owner)
  2472			bio_ctrl.opf |= REQ_BTRFS_CGROUP_PUNT;
  2473	
  2474		ASSERT(IS_ALIGNED(start, sectorsize) && IS_ALIGNED(end + 1, sectorsize));
  2475	
  2476		while (cur <= end) {
  2477			u64 cur_end;
  2478			u32 cur_len;
  2479			struct folio *folio;
  2480	
  2481			folio = filemap_get_folio(mapping, cur >> PAGE_SHIFT);
  2482	
  2483			/*
  2484			 * This shouldn't happen, the pages are pinned and locked, this
  2485			 * code is just in case, but shouldn't actually be run.
  2486			 */
  2487			if (IS_ERR(folio)) {
  2488				cur_end = min(round_down(cur, PAGE_SIZE) + PAGE_SIZE - 1, end);
  2489				cur_len = cur_end + 1 - cur;
  2490				btrfs_mark_ordered_io_finished(BTRFS_I(inode), NULL,
  2491							       cur, cur_len, false);
  2492				mapping_set_error(mapping, PTR_ERR(folio));
  2493				cur = cur_end;
  2494				continue;
  2495			}
  2496	
> 2497			cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
  2498			cur_len = cur_end + 1 - cur;
  2499	
  2500			ASSERT(folio_test_locked(folio));
  2501			if (pages_dirty && folio != locked_folio)
  2502				ASSERT(folio_test_dirty(folio));
  2503	
  2504			/*
  2505			 * Set the submission bitmap to submit all sectors.
  2506			 * extent_writepage_io() will do the truncation correctly.
  2507			 */
  2508			bio_ctrl.submit_bitmap = (unsigned long)-1;
  2509			ret = extent_writepage_io(BTRFS_I(inode), folio, cur, cur_len,
  2510						  &bio_ctrl, i_size);
  2511			if (ret == 1)
  2512				goto next_page;
  2513	
  2514			if (ret)
  2515				mapping_set_error(mapping, ret);
  2516			btrfs_folio_end_lock(fs_info, folio, cur, cur_len);
  2517			if (ret < 0)
  2518				found_error = true;
  2519	next_page:
  2520			folio_put(folio);
  2521			cur = cur_end + 1;
  2522		}
  2523	
  2524		submit_write_bio(&bio_ctrl, found_error ? ret : 0);
  2525	}
  2526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
