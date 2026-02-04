Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82034B661;
	Wed,  4 Feb 2026 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226775; cv=none; b=lWtgT6TQ3JW/u6OIdBwHHnjr7QBJOc47ueipLItMM/bFZ1eWArfVKkJgaHBjnRvBsGccbAqZmCPslOf/88j+leLEAf0n+/dxZRdECPdlI2ZvwkArSCVwesRuvz6PaRgeTtS7MXsca88/Bl6wW6cEEysAIj5pmtSdpk6PKF907No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226775; c=relaxed/simple;
	bh=9EeruU/E3pFcRhaPNPuK2egLsVQDjOlIcPs4vn+OxnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqNK5d02GkAFhX2qjVwp5uNfS2uyVarygCZOik+4jMS/jHDVcjxQW5YvRwC6L7dY/LpEKIbEbOjliKoHWjZiV0g08/C2oEm/Ci0sBzdQG79QVbNlK9UilHDph0n1AOWU2n+x1I006/oiQVQP5H+40LKxgxEVlnAE5X+RhDffXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEp4CAqG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEp4CAqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770226774; x=1801762774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9EeruU/E3pFcRhaPNPuK2egLsVQDjOlIcPs4vn+OxnQ=;
  b=LEp4CAqG+2LQgqk+P+U/L/ssCtGATuv/tF8vmgI1NyqaeZ3IFkcmOM+u
   fbPVpLKw10wVrg/mx67C+e2GrdMxooPlCpQiPOhEjZRdkQCjL4EfR09N0
   JfS1a5lSrW9oyGMVmL84ifc5/dMUikhqZz8Nm5opPImCnyq0MNjjoTjDX
   GL7PmF2bQeKWmMEL3CIyOcMuPHazCsSNQjCzdSJpZINrfd/e6/DgB1/RG
   4LzZCShsn4+XTtmYcRlzH9XuBAobkN/lZ4+/xL5Orvx/Gzsay3iYno+cZ
   R4HKvIyu4bjSdpMPsSWCEN8FIjxa6vl4w8Zigxw8Dy1c4/N6PJZJtO6mW
   g==;
X-CSE-ConnectionGUID: ApdEzV/MRlWzfFDgJX6KMA==
X-CSE-MsgGUID: JnYTAL4uRm6b9e23nfm49A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71315595"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71315595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 09:39:33 -0800
X-CSE-ConnectionGUID: dW5c26LURVKDXlhxNPP56A==
X-CSE-MsgGUID: lkzJNtSQSmuoRlYuMc7WKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214756248"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2026 09:39:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vngqe-00000000j3o-1GF3;
	Wed, 04 Feb 2026 17:39:28 +0000
Date: Thu, 5 Feb 2026 01:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fsverity tree
Message-ID: <202602050150.l5k1WBpY-lkp@intel.com>
References: <aYH54qJee85qLLkN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYH54qJee85qLLkN@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev]
[cannot apply to linus/master v6.19-rc8 next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-fsverity-tree/20260203-214224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/aYH54qJee85qLLkN%40sirena.org.uk
patch subject: linux-next: build failure after merge of the fsverity tree
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260205/202602050150.l5k1WBpY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050150.l5k1WBpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050150.l5k1WBpY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:2523:34: error: too many arguments to function call, expected single argument 'page', have 2 arguments
    2523 |                             !fsverity_verify_page(vi, folio_file_page(folio,
         |                              ~~~~~~~~~~~~~~~~~~~~     ^~~~~~~~~~~~~~~~~~~~~~
    2524 |                                                                 index))) {
         |                                                                 ~~~~~~
   include/linux/fsverity.h:298:20: note: 'fsverity_verify_page' declared here
     298 | static inline bool fsverity_verify_page(struct page *page)
         |                    ^                    ~~~~~~~~~~~~~~~~~
>> fs/f2fs/data.c:2558:13: error: too many arguments to function call, expected 6, have 7
    2555 |                         bio = f2fs_grab_read_bio(inode, vi, block_nr,
         |                               ~~~~~~~~~~~~~~~~~~
    2556 |                                         max_nr_pages,
    2557 |                                         f2fs_ra_op_flags(rac),
    2558 |                                         index, false);
         |                                                ^~~~~
   fs/f2fs/data.c:1097:20: note: 'f2fs_grab_read_bio' declared here
    1097 | static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
         |                    ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1098 |                                       unsigned nr_pages, blk_opf_t op_flag,
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1099 |                                       pgoff_t first_idx, bool for_write)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/data.c:2629:44: error: use of undeclared identifier 'vi'
    2629 |                 return f2fs_read_data_large_folio(inode, vi, rac, folio);
         |                                                          ^
   3 errors generated.


vim +/page +2523 fs/f2fs/data.c

  2449	
  2450	static int f2fs_read_data_large_folio(struct inode *inode,
  2451			struct fsverity_info *vi,
  2452			struct readahead_control *rac, struct folio *folio)
  2453	{
  2454		struct bio *bio = NULL;
  2455		sector_t last_block_in_bio = 0;
  2456		struct f2fs_map_blocks map = {0, };
  2457		pgoff_t index, offset, next_pgofs = 0;
  2458		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2459					folio_nr_pages(folio);
  2460		unsigned nrpages;
  2461		struct f2fs_folio_state *ffs;
  2462		int ret = 0;
  2463		bool folio_in_bio;
  2464	
  2465		if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
  2466			if (folio)
  2467				folio_unlock(folio);
  2468			return -EOPNOTSUPP;
  2469		}
  2470	
  2471		map.m_seg_type = NO_CHECK_TYPE;
  2472	
  2473		if (rac)
  2474			folio = readahead_folio(rac);
  2475	next_folio:
  2476		if (!folio)
  2477			goto out;
  2478	
  2479		folio_in_bio = false;
  2480		index = folio->index;
  2481		offset = 0;
  2482		ffs = NULL;
  2483		nrpages = folio_nr_pages(folio);
  2484	
  2485		for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
  2486			sector_t block_nr;
  2487			/*
  2488			 * Map blocks using the previous result first.
  2489			 */
  2490			if (map.m_flags & F2FS_MAP_MAPPED) {
  2491				if (index > map.m_lblk &&
  2492					index < (map.m_lblk + map.m_len))
  2493					goto got_it;
  2494			} else if (index < next_pgofs) {
  2495				/* hole case */
  2496				goto got_it;
  2497			}
  2498	
  2499			/*
  2500			 * Then do more f2fs_map_blocks() calls until we are
  2501			 * done with this page.
  2502			 */
  2503			memset(&map, 0, sizeof(map));
  2504			map.m_next_pgofs = &next_pgofs;
  2505			map.m_seg_type = NO_CHECK_TYPE;
  2506			map.m_lblk = index;
  2507			map.m_len = max_nr_pages;
  2508	
  2509			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2510			if (ret)
  2511				goto err_out;
  2512	got_it:
  2513			if ((map.m_flags & F2FS_MAP_MAPPED)) {
  2514				block_nr = map.m_pblk + index - map.m_lblk;
  2515				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2516							DATA_GENERIC_ENHANCE_READ)) {
  2517					ret = -EFSCORRUPTED;
  2518					goto err_out;
  2519				}
  2520			} else {
  2521				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2522				if (f2fs_need_verity(inode, index) &&
> 2523				    !fsverity_verify_page(vi, folio_file_page(folio,
  2524									index))) {
  2525					ret = -EIO;
  2526					goto err_out;
  2527				}
  2528				continue;
  2529			}
  2530	
  2531			/* We must increment read_pages_pending before possible BIOs submitting
  2532			 * to prevent from premature folio_end_read() call on folio
  2533			 */
  2534			if (folio_test_large(folio)) {
  2535				ffs = ffs_find_or_alloc(folio);
  2536	
  2537				/* set the bitmap to wait */
  2538				spin_lock_irq(&ffs->state_lock);
  2539				ffs->read_pages_pending++;
  2540				spin_unlock_irq(&ffs->state_lock);
  2541			}
  2542	
  2543			/*
  2544			 * This page will go to BIO.  Do we need to send this
  2545			 * BIO off first?
  2546			 */
  2547			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2548							last_block_in_bio, block_nr) ||
  2549				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2550	submit_and_realloc:
  2551				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2552				bio = NULL;
  2553			}
  2554			if (bio == NULL)
  2555				bio = f2fs_grab_read_bio(inode, vi, block_nr,
  2556						max_nr_pages,
  2557						f2fs_ra_op_flags(rac),
> 2558						index, false);
  2559	
  2560			/*
  2561			 * If the page is under writeback, we need to wait for
  2562			 * its completion to see the correct decrypted data.
  2563			 */
  2564			f2fs_wait_on_block_writeback(inode, block_nr);
  2565	
  2566			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2567						offset << PAGE_SHIFT))
  2568				goto submit_and_realloc;
  2569	
  2570			folio_in_bio = true;
  2571			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2572			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2573					F2FS_BLKSIZE);
  2574			last_block_in_bio = block_nr;
  2575		}
  2576		trace_f2fs_read_folio(folio, DATA);
  2577	err_out:
  2578		if (!folio_in_bio) {
  2579			folio_end_read(folio, !ret);
  2580			if (ret)
  2581				return ret;
  2582		}
  2583		if (rac) {
  2584			folio = readahead_folio(rac);
  2585			goto next_folio;
  2586		}
  2587	out:
  2588		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2589		if (ret) {
  2590			/* Wait bios and clear uptodate. */
  2591			folio_lock(folio);
  2592			folio_clear_uptodate(folio);
  2593			folio_unlock(folio);
  2594		}
  2595		return ret;
  2596	}
  2597	
  2598	/*
  2599	 * This function was originally taken from fs/mpage.c, and customized for f2fs.
  2600	 * Major change was from block_size == page_size in f2fs by default.
  2601	 */
  2602	static int f2fs_mpage_readpages(struct inode *inode,
  2603			struct readahead_control *rac, struct folio *folio)
  2604	{
  2605		struct bio *bio = NULL;
  2606		sector_t last_block_in_bio = 0;
  2607		struct f2fs_map_blocks map;
  2608	#ifdef CONFIG_F2FS_FS_COMPRESSION
  2609		struct compress_ctx cc = {
  2610			.inode = inode,
  2611			.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
  2612			.cluster_size = F2FS_I(inode)->i_cluster_size,
  2613			.cluster_idx = NULL_CLUSTER,
  2614			.rpages = NULL,
  2615			.cpages = NULL,
  2616			.nr_rpages = 0,
  2617			.nr_cpages = 0,
  2618		};
  2619		pgoff_t nc_cluster_idx = NULL_CLUSTER;
  2620		pgoff_t index;
  2621	#endif
  2622		pgoff_t next_pgofs = 0;
  2623		unsigned nr_pages = rac ? readahead_count(rac) : 1;
  2624		struct address_space *mapping = rac ? rac->mapping : folio->mapping;
  2625		unsigned max_nr_pages = nr_pages;
  2626		int ret = 0;
  2627	
  2628		if (mapping_large_folio_support(mapping))
> 2629			return f2fs_read_data_large_folio(inode, vi, rac, folio);
  2630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
