Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6D1CD3F;
	Fri, 14 Mar 2025 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741956216; cv=none; b=Uhrtou6Tghay1kKiMd+gPYq6iLlQoJ94ac0bR520UAZX2HPHECv2PHD2dFqpevKpsoFYMG9x1CIMS1tni+0kFcOh3s7uagz9A8tOt158h/r2oPCav239DMNCtcTlup53M7UQGSBnvAvqAq5DQvit/l1JlVUqhQ9nj0HOZXt1d+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741956216; c=relaxed/simple;
	bh=iSagOcLWhe6EOyCg6eg4wSb4ybj++cuDBgkbouIIKdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DywIMWhe7SHrJ/pm4UJSfaM6UIuJs51WpM8yoldcka6j6uH+9xjgXONsO6SOmO4vljiwpZKAl5vu3OozHNG9WIKEYMC9FSDyCSKSi55v8U1xltn1yYWXB0rHvjoYvWTSswp83m2qaJr+zf90epRJKymR8cR9YVR8+n7leslmOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfIh9VrN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfIh9VrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741956215; x=1773492215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSagOcLWhe6EOyCg6eg4wSb4ybj++cuDBgkbouIIKdU=;
  b=MfIh9VrNg2MRNxhSuhnRoGEFM71i5UoOE8cvp5SH0LTjiZP+6qhQWJ0W
   aexBO5WQhDDFC1M5gLTxLg26U5MyfV3ufBC75Qac3Ukcjb6BF4a3QPwZK
   zY8m9HwTOcOMgm3/MRTN38k8W+/8QxFekbGZo74qBm0CV6mA8nXFQHHVx
   RjjW/+TaKzTZ2xtB/xiC7R9jOYzDRT5tdxpaKXqmmCqKEVcBBkf262EnL
   SbA4ELvSNDw9tRIAGD3q9d0gf9hBRUu8hZDbZdsaKEoB/oGm2ogWjNKur
   sDMQqJK9HIqF3iwDrbDuBDXar7oxl/RxMH1Hqr3PjugsPk6IQxm2yWOwd
   w==;
X-CSE-ConnectionGUID: EqTcE9doR3maWcD5UX0ijA==
X-CSE-MsgGUID: ULiofKNJRze25PMThhTdFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43142156"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43142156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 05:43:34 -0700
X-CSE-ConnectionGUID: +l2o0eI1SomvIiJApV68Hw==
X-CSE-MsgGUID: AMmHf264Ri+2McJobfrZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="158418218"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Mar 2025 05:43:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4Nt-000ASO-2I;
	Fri, 14 Mar 2025 12:43:29 +0000
Date: Fri, 14 Mar 2025 20:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 9972/11207] fs/btrfs/extent_io.c:2515:13: error:
 call to '__compiletime_assert_597' declared with 'error' attribute:
 min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
Message-ID: <202503142055.Vn5odPPD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: f286b1c72175686e9bece7c8eebbcb0b824fbe1f [9972/11207] btrfs: prepare extent_io.c for future larger folio support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250314/202503142055.Vn5odPPD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142055.Vn5odPPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142055.Vn5odPPD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/extent_io.c:2515:13: error: call to '__compiletime_assert_597' declared with 'error' attribute: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
    2515 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
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
   <scratch space>:41:1: note: expanded from here
      41 | __compiletime_assert_597
         | ^
   1 error generated.


vim +2515 fs/btrfs/extent_io.c

  2467	
  2468	/*
  2469	 * Submit the pages in the range to bio for call sites which delalloc range has
  2470	 * already been ran (aka, ordered extent inserted) and all pages are still
  2471	 * locked.
  2472	 */
  2473	void extent_write_locked_range(struct inode *inode, const struct folio *locked_folio,
  2474				       u64 start, u64 end, struct writeback_control *wbc,
  2475				       bool pages_dirty)
  2476	{
  2477		bool found_error = false;
  2478		int ret = 0;
  2479		struct address_space *mapping = inode->i_mapping;
  2480		struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
  2481		const u32 sectorsize = fs_info->sectorsize;
  2482		loff_t i_size = i_size_read(inode);
  2483		u64 cur = start;
  2484		struct btrfs_bio_ctrl bio_ctrl = {
  2485			.wbc = wbc,
  2486			.opf = REQ_OP_WRITE | wbc_to_write_flags(wbc),
  2487		};
  2488	
  2489		if (wbc->no_cgroup_owner)
  2490			bio_ctrl.opf |= REQ_BTRFS_CGROUP_PUNT;
  2491	
  2492		ASSERT(IS_ALIGNED(start, sectorsize) && IS_ALIGNED(end + 1, sectorsize));
  2493	
  2494		while (cur <= end) {
  2495			u64 cur_end;
  2496			u32 cur_len;
  2497			struct folio *folio;
  2498	
  2499			folio = filemap_get_folio(mapping, cur >> PAGE_SHIFT);
  2500	
  2501			/*
  2502			 * This shouldn't happen, the pages are pinned and locked, this
  2503			 * code is just in case, but shouldn't actually be run.
  2504			 */
  2505			if (IS_ERR(folio)) {
  2506				cur_end = min(round_down(cur, PAGE_SIZE) + PAGE_SIZE - 1, end);
  2507				cur_len = cur_end + 1 - cur;
  2508				btrfs_mark_ordered_io_finished(BTRFS_I(inode), NULL,
  2509							       cur, cur_len, false);
  2510				mapping_set_error(mapping, PTR_ERR(folio));
  2511				cur = cur_end;
  2512				continue;
  2513			}
  2514	
> 2515			cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
  2516			cur_len = cur_end + 1 - cur;
  2517	
  2518			ASSERT(folio_test_locked(folio));
  2519			if (pages_dirty && folio != locked_folio)
  2520				ASSERT(folio_test_dirty(folio));
  2521	
  2522			/*
  2523			 * Set the submission bitmap to submit all sectors.
  2524			 * extent_writepage_io() will do the truncation correctly.
  2525			 */
  2526			bio_ctrl.submit_bitmap = (unsigned long)-1;
  2527			ret = extent_writepage_io(BTRFS_I(inode), folio, cur, cur_len,
  2528						  &bio_ctrl, i_size);
  2529			if (ret == 1)
  2530				goto next_page;
  2531	
  2532			if (ret)
  2533				mapping_set_error(mapping, ret);
  2534			btrfs_folio_end_lock(fs_info, folio, cur, cur_len);
  2535			if (ret < 0)
  2536				found_error = true;
  2537	next_page:
  2538			folio_put(folio);
  2539			cur = cur_end + 1;
  2540		}
  2541	
  2542		submit_write_bio(&bio_ctrl, found_error ? ret : 0);
  2543	}
  2544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
