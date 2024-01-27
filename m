Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99DA2907;
	Sat, 27 Jan 2024 00:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706317136; cv=none; b=KwCUK7nWWjcs0WWJF3QaR91HdLu2P6MAgJlkaeSr+jE32CWVaOoyomfcnAhnYoKDkBSic4PTqWvAL54Z+UzBjIeiufKXiQQAaY/PlSdW6ZOXJ48/8JWCPM+EzjOiL8ynMU4VT2fVnYMObgfgwC6QwfEYYP50fO+H5j8bkDajDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706317136; c=relaxed/simple;
	bh=zWEEo9EifmOwjxjJBVNy+QtE8lIbHVahqW4GnIUZyrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rlo1gHVCiDo97c8qY2+zKlGZctJrjZx9DWV+6fSeFeoc2RPD6Iq2nXwXFp6RidBV3Ds98washoiAvPPSYoSaId+OJJSXLj3Ol+j+ZYLPlrkFu/s7Od2nVuiLzjUUTqwl2waJ6J9vZtO+5NMwLPOj5fI1xJaIojFMH5ZrGgqDn1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNawL3/b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNawL3/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706317133; x=1737853133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zWEEo9EifmOwjxjJBVNy+QtE8lIbHVahqW4GnIUZyrk=;
  b=XNawL3/bN6q+DIlPHP6/of/KrY8tse76TrEsLFXJpr1kccBnMWfQs6ci
   SG4XGMhahllh8cnCoFYiGy1iD6AToysJ8dqxRL5qzhjQv5FZI9spEpc9g
   eZK6rAXdmlYvHTnmuqlz+6aEon7pycmht5VaQIavzDhg/Hq5LP3WKqcv8
   XuvEBWqtILzTHSM7AQDchcdHprokqHEAPxKcqmDQz1FDiqhtyZhk6tjlf
   XNdUUnmpmyWkEttwdUOZZFvXHTWhbE9FAxvNQps9C7CrZ+UPo+ukeOj8t
   sgeDI+fLXxG3NmQO7PgDTczxiyR6HtXNZ8EBvDm5DBZKYj+lHJ3PyRa/y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24080939"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="24080939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 16:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="35585164"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2024 16:58:51 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTX20-0001VA-2j;
	Sat, 27 Jan 2024 00:58:48 +0000
Date: Sat, 27 Jan 2024 08:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] btrfs: convert relocate_one_page() to
 relocate_one_folio()
Message-ID: <202401270800.NyZlHGxV-lkp@intel.com>
References: <0ad1a3b7098c852f6e0d41770fae5daea70ea8d1.1706037337.git.rgoldwyn@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ad1a3b7098c852f6e0d41770fae5daea70ea8d1.1706037337.git.rgoldwyn@suse.com>

Hi Goldwyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Goldwyn-Rodrigues/btrfs-page-to-folio-conversion-prealloc_file_extent_cluster/20240124-032942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/0ad1a3b7098c852f6e0d41770fae5daea70ea8d1.1706037337.git.rgoldwyn%40suse.com
patch subject: [PATCH 2/3] btrfs: convert relocate_one_page() to relocate_one_folio()
config: i386-randconfig-011-20240127 (https://download.01.org/0day-ci/archive/20240127/202401270800.NyZlHGxV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270800.NyZlHGxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270800.NyZlHGxV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/relocation.c:3032:8: error: call to undeclared function 'set_folio_extent_mapped'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3032 |         ret = set_folio_extent_mapped(folio);
         |               ^
   fs/btrfs/relocation.c:3032:8: note: did you mean 'set_page_extent_mapped'?
   fs/btrfs/extent_io.h:234:5: note: 'set_page_extent_mapped' declared here
     234 | int set_page_extent_mapped(struct page *page);
         |     ^
   1 error generated.


vim +/set_folio_extent_mapped +3032 fs/btrfs/relocation.c

  2985	
  2986	static int relocate_one_folio(struct inode *inode, struct file_ra_state *ra,
  2987				     const struct file_extent_cluster *cluster,
  2988				     int *cluster_nr, unsigned long index)
  2989	{
  2990		struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  2991		u64 offset = BTRFS_I(inode)->index_cnt;
  2992		const unsigned long last_index = (cluster->end - offset) >> PAGE_SHIFT;
  2993		gfp_t mask = btrfs_alloc_write_mask(inode->i_mapping);
  2994		struct folio *folio;
  2995		u64 folio_start;
  2996		u64 folio_end;
  2997		u64 cur;
  2998		int ret;
  2999	
  3000		ASSERT(index <= last_index);
  3001		folio = filemap_lock_folio(inode->i_mapping, index);
  3002		if (IS_ERR(folio)) {
  3003			page_cache_sync_readahead(inode->i_mapping, ra, NULL,
  3004					index, last_index + 1 - index);
  3005			folio = __filemap_get_folio(inode->i_mapping, index,
  3006						    FGP_LOCK | FGP_ACCESSED | FGP_CREAT, mask);
  3007			if (IS_ERR(folio))
  3008				return PTR_ERR(folio);
  3009		}
  3010	
  3011		WARN_ON(folio_order(folio));
  3012	
  3013		if (folio_test_readahead(folio))
  3014			page_cache_async_readahead(inode->i_mapping, ra, NULL,
  3015					folio, index,
  3016					last_index + 1 - index);
  3017	
  3018		if (!folio_test_uptodate(folio)) {
  3019			btrfs_read_folio(NULL, folio);
  3020			folio_lock(folio);
  3021			if (!folio_test_uptodate(folio)) {
  3022				ret = -EIO;
  3023				goto release_folio;
  3024			}
  3025		}
  3026	
  3027		/*
  3028		 * We could have lost folio private when we dropped the lock to read the
  3029		 * folio above, make sure we set_page_extent_mapped here so we have any
  3030		 * of the subpage blocksize stuff we need in place.
  3031		 */
> 3032		ret = set_folio_extent_mapped(folio);
  3033		if (ret < 0)
  3034			goto release_folio;
  3035	
  3036		folio_start = folio_pos(folio);
  3037		folio_end = folio_start + PAGE_SIZE - 1;
  3038	
  3039		/*
  3040		 * Start from the cluster, as for subpage case, the cluster can start
  3041		 * inside the folio.
  3042		 */
  3043		cur = max(folio_start, cluster->boundary[*cluster_nr] - offset);
  3044		while (cur <= folio_end) {
  3045			struct extent_state *cached_state = NULL;
  3046			u64 extent_start = cluster->boundary[*cluster_nr] - offset;
  3047			u64 extent_end = get_cluster_boundary_end(cluster,
  3048							*cluster_nr) - offset;
  3049			u64 clamped_start = max(folio_start, extent_start);
  3050			u64 clamped_end = min(folio_end, extent_end);
  3051			u32 clamped_len = clamped_end + 1 - clamped_start;
  3052	
  3053			/* Reserve metadata for this range */
  3054			ret = btrfs_delalloc_reserve_metadata(BTRFS_I(inode),
  3055							      clamped_len, clamped_len,
  3056							      false);
  3057			if (ret)
  3058				goto release_folio;
  3059	
  3060			/* Mark the range delalloc and dirty for later writeback */
  3061			lock_extent(&BTRFS_I(inode)->io_tree, clamped_start, clamped_end,
  3062				    &cached_state);
  3063			ret = btrfs_set_extent_delalloc(BTRFS_I(inode), clamped_start,
  3064							clamped_end, 0, &cached_state);
  3065			if (ret) {
  3066				clear_extent_bit(&BTRFS_I(inode)->io_tree,
  3067						 clamped_start, clamped_end,
  3068						 EXTENT_LOCKED | EXTENT_BOUNDARY,
  3069						 &cached_state);
  3070				btrfs_delalloc_release_metadata(BTRFS_I(inode),
  3071								clamped_len, true);
  3072				btrfs_delalloc_release_extents(BTRFS_I(inode),
  3073							       clamped_len);
  3074				goto release_folio;
  3075			}
  3076			btrfs_folio_set_dirty(fs_info, folio, clamped_start, clamped_len);
  3077	
  3078			/*
  3079			 * Set the boundary if it's inside the folio.
  3080			 * Data relocation requires the destination extents to have the
  3081			 * same size as the source.
  3082			 * EXTENT_BOUNDARY bit prevents current extent from being merged
  3083			 * with previous extent.
  3084			 */
  3085			if (in_range(cluster->boundary[*cluster_nr] - offset, folio_start, PAGE_SIZE)) {
  3086				u64 boundary_start = cluster->boundary[*cluster_nr] -
  3087							offset;
  3088				u64 boundary_end = boundary_start +
  3089						   fs_info->sectorsize - 1;
  3090	
  3091				set_extent_bit(&BTRFS_I(inode)->io_tree,
  3092					       boundary_start, boundary_end,
  3093					       EXTENT_BOUNDARY, NULL);
  3094			}
  3095			unlock_extent(&BTRFS_I(inode)->io_tree, clamped_start, clamped_end,
  3096				      &cached_state);
  3097			btrfs_delalloc_release_extents(BTRFS_I(inode), clamped_len);
  3098			cur += clamped_len;
  3099	
  3100			/* Crossed extent end, go to next extent */
  3101			if (cur >= extent_end) {
  3102				(*cluster_nr)++;
  3103				/* Just finished the last extent of the cluster, exit. */
  3104				if (*cluster_nr >= cluster->nr)
  3105					break;
  3106			}
  3107		}
  3108		folio_unlock(folio);
  3109		folio_put(folio);
  3110	
  3111		balance_dirty_pages_ratelimited(inode->i_mapping);
  3112		btrfs_throttle(fs_info);
  3113		if (btrfs_should_cancel_balance(fs_info))
  3114			ret = -ECANCELED;
  3115		return ret;
  3116	
  3117	release_folio:
  3118		folio_unlock(folio);
  3119		folio_put(folio);
  3120		return ret;
  3121	}
  3122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
