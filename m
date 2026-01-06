Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212AF2DA775;
	Tue,  6 Jan 2026 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691848; cv=none; b=GimPNMQXxg+HBvZAXVGMu643RBMtjybdhxW3vR1hOwQDNcMmSAvCawDi9OKOXoi99SCwoZK3fMBtzB+kDH4VCjDslKyfZGZghc/SQQC82vVVeqCEqVKMS5Y9kFE3ozVmYL+s2GUoGaEtM3tdRIJ8XjAwYqZjtRDEBTQzFLlo0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691848; c=relaxed/simple;
	bh=9A84fjymSv9Vu+C9GDOc1qrBye/BZMsWGoquy16U+B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQeVoSYvvC+l6KNrjdLrdTKAreDozk1ubrPwi/1PGTA322qlBSs2HjweYNh1mqeiaCE0XyH299WGPDueTPseU3BA3SVxoTeoytAvBbi+A9djw+aaC8sno/vUJbttCGp/Z6VlAtPfBK4w3TvrJnABqowVj9ALAsCKnQAXIK+JIJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJ4Ui/9c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJ4Ui/9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767691847; x=1799227847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9A84fjymSv9Vu+C9GDOc1qrBye/BZMsWGoquy16U+B4=;
  b=DJ4Ui/9crQMiPD3LvDVYQkZMaWiJ5zJfsbeAYFcNcIXve95ZVqxBLOu4
   BT9Pk9SxFJzKJw+/jC7s9dTWBhvdbrzQ40rpN2YND6BBzeoV2SP9fZgDy
   MF2Omv/9Y3Lq4dRe+WutzeZNIvaGf5eX3OWlRbwsoCUN6zqSUSIm3fwnM
   VabidJCskO3jyED6NyPC2TNQvXm9Dh3aAuBhO6pAg06u16jpnsaYhGGPU
   J6r34f3bxjR8JgkXDvNqOactdKQ70/3NSa/b2xMWAuSwwK8L8JqnMY4pq
   kJXr0EQQDBL1GPFGJvvYIwyVV8zZdSaym5OZFodXnMLnZLlLbhsO1/hV7
   Q==;
X-CSE-ConnectionGUID: kS5zcw5VQZmd4bgV04cPJw==
X-CSE-MsgGUID: 40Na7mFpR5amQ4IKG0hvUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56620744"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="56620744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:30:47 -0800
X-CSE-ConnectionGUID: r/8mLZ1LStq9ZEC7RXKUoA==
X-CSE-MsgGUID: PX6EmKYIRXyWUnSIWIPfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203578511"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2026 01:30:44 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd3Ok-000000001ID-37KG;
	Tue, 06 Jan 2026 09:30:42 +0000
Date: Tue, 6 Jan 2026 10:30:01 +0100
From: kernel test robot <lkp@intel.com>
To: Nanzhe Zhao <nzzhao@126.com>, Kim Jaegeuk <jaegeuk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v1 3/5] f2fs: add f2fs_block_needs_zeroing() to handle
 hole blocks
Message-ID: <202601061013.MBnRTOrG-lkp@intel.com>
References: <20260105153101.152892-4-nzzhao@126.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105153101.152892-4-nzzhao@126.com>

Hi Nanzhe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 48b5439e04ddf4508ecaf588219012dc81d947c0]

url:    https://github.com/intel-lab-lkp/linux/commits/Nanzhe-Zhao/f2fs-Zero-f2fs_folio_state-on-allocation/20260106-005006
base:   48b5439e04ddf4508ecaf588219012dc81d947c0
patch link:    https://lore.kernel.org/r/20260105153101.152892-4-nzzhao%40126.com
patch subject: [PATCH v1 3/5] f2fs: add f2fs_block_needs_zeroing() to handle hole blocks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260106/202601061013.MBnRTOrG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061013.MBnRTOrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061013.MBnRTOrG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/data.c:2485:13: warning: variable 'block_nr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2485 |                 } else if((map.m_flags & F2FS_MAP_MAPPED)) {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2527:39: note: uninitialized use occurs here
    2527 |                 f2fs_wait_on_block_writeback(inode, block_nr);
         |                                                     ^~~~~~~~
   fs/f2fs/data.c:2485:10: note: remove the 'if' if its condition is always true
    2485 |                 } else if((map.m_flags & F2FS_MAP_MAPPED)) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2454:20: note: initialize the variable 'block_nr' to silence this warning
    2454 |                 sector_t block_nr;
         |                                  ^
         |                                   = 0
   1 warning generated.


vim +2485 fs/f2fs/data.c

  2420	
  2421	static int f2fs_read_data_large_folio(struct inode *inode,
  2422			struct readahead_control *rac, struct folio *folio)
  2423	{
  2424		struct bio *bio = NULL;
  2425		sector_t last_block_in_bio = 0;
  2426		struct f2fs_map_blocks map = {0, };
  2427		pgoff_t index, offset;
  2428		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2429					folio_nr_pages(folio);
  2430		unsigned nrpages;
  2431		struct f2fs_folio_state *ffs;
  2432		int ret = 0;
  2433	
  2434		if (!IS_IMMUTABLE(inode))
  2435			return -EOPNOTSUPP;
  2436	
  2437		if (f2fs_compressed_file(inode))
  2438			return -EOPNOTSUPP;
  2439	
  2440		map.m_seg_type = NO_CHECK_TYPE;
  2441	
  2442		if (rac)
  2443			folio = readahead_folio(rac);
  2444	next_folio:
  2445		if (!folio)
  2446			goto out;
  2447	
  2448		index = folio->index;
  2449		offset = 0;
  2450		ffs = NULL;
  2451		nrpages = folio_nr_pages(folio);
  2452	
  2453		for (; nrpages; nrpages--) {
  2454			sector_t block_nr;
  2455			/*
  2456			 * Map blocks using the previous result first.
  2457			 */
  2458			if ((map.m_flags & F2FS_MAP_MAPPED) &&
  2459					index > map.m_lblk &&
  2460					index < (map.m_lblk + map.m_len))
  2461				goto got_it;
  2462	
  2463			/*
  2464			 * Then do more f2fs_map_blocks() calls until we are
  2465			 * done with this page.
  2466			 */
  2467			memset(&map, 0, sizeof(map));
  2468			map.m_seg_type = NO_CHECK_TYPE;
  2469			map.m_lblk = index;
  2470			map.m_len = max_nr_pages;
  2471	
  2472			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2473			if (ret)
  2474				goto err_out;
  2475	got_it:
  2476			if ((f2fs_block_needs_zeroing(&map))) {
  2477				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2478				if (f2fs_need_verity(inode, index) &&
  2479				    !fsverity_verify_page(folio_file_page(folio,
  2480									index))) {
  2481					ret = -EIO;
  2482					goto err_out;
  2483				}
  2484				continue;
> 2485			} else if((map.m_flags & F2FS_MAP_MAPPED)) {
  2486				block_nr = map.m_pblk + index - map.m_lblk;
  2487				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2488							DATA_GENERIC_ENHANCE_READ)) {
  2489					ret = -EFSCORRUPTED;
  2490					goto err_out;
  2491				}
  2492			}
  2493	
  2494			/* We must increment read_pages_pending before possible BIOs submitting
  2495			 * to prevent from premature folio_end_read() call on folio
  2496			 */
  2497			if (folio_test_large(folio)) {
  2498				ffs = ffs_find_or_alloc(folio);
  2499	
  2500				/* set the bitmap to wait */
  2501				spin_lock_irq(&ffs->state_lock);
  2502				ffs->read_pages_pending++;
  2503				spin_unlock_irq(&ffs->state_lock);
  2504			}
  2505	
  2506			/*
  2507			 * This page will go to BIO.  Do we need to send this
  2508			 * BIO off first?
  2509			 */
  2510			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2511							last_block_in_bio, block_nr) ||
  2512				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2513	submit_and_realloc:
  2514				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2515				bio = NULL;
  2516			}
  2517			if (bio == NULL)
  2518				bio = f2fs_grab_read_bio(inode, block_nr,
  2519						max_nr_pages,
  2520						f2fs_ra_op_flags(rac),
  2521						index, false);
  2522	
  2523			/*
  2524			 * If the page is under writeback, we need to wait for
  2525			 * its completion to see the correct decrypted data.
  2526			 */
  2527			f2fs_wait_on_block_writeback(inode, block_nr);
  2528	
  2529			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2530						offset << PAGE_SHIFT))
  2531				goto submit_and_realloc;
  2532	
  2533			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2534			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2535					F2FS_BLKSIZE);
  2536			last_block_in_bio = block_nr;
  2537			index++;
  2538			offset++;
  2539		}
  2540		trace_f2fs_read_folio(folio, DATA);
  2541		if (rac) {
  2542			folio = readahead_folio(rac);
  2543			goto next_folio;
  2544		}
  2545	err_out:
  2546		/* Nothing was submitted. */
  2547		if (!bio) {
  2548			if (!ret)
  2549				folio_mark_uptodate(folio);
  2550			folio_unlock(folio);
  2551			return ret;
  2552		}
  2553	
  2554		if (ret) {
  2555			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2556	
  2557			/* Wait bios and clear uptodate. */
  2558			folio_lock(folio);
  2559			folio_clear_uptodate(folio);
  2560			folio_unlock(folio);
  2561		}
  2562	out:
  2563		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2564		return ret;
  2565	}
  2566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
