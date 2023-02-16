Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAAAD319;
	Thu, 16 Feb 2023 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676526139; x=1708062139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qxe5M8VuwF/sBZp8Rzdzu1IfL2SMxz40aALWfJBW38I=;
  b=Tb8VG5xFfra7tNF5Ld1TQvfCWh+D4i9f58aupB4CD3s9e9lwH1JJ6vn7
   fgI02Bv3aJheGboFAooHQUZjRmf32zYimTyJ7hzc4TwDfJAuEBymiIzQe
   FkAYjASazKxC5xe5DgeW2vfapMiGefUMpkGJ9RRA0s4NdLNHLe1tUDK19
   iqCoUN+gefFQvroMD+TiAh8fJghn61xkI8yik2ojQAN897p1E1Iw52R+Z
   vpKEydSD1ldCnStt8o9iL1y17zAViekiyKluouDKqiMf69cgTHk+cRekx
   +DW072AjcmUEgWmEIVZ5sxU5xVwaXebTsYpRCIoR29wqv+L+3gSgAnGsz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="394051944"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="394051944"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 21:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="793897430"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="793897430"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Feb 2023 21:42:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSX28-000A31-38;
	Thu, 16 Feb 2023 05:42:16 +0000
Date: Thu, 16 Feb 2023 13:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC PATCH 14/16] drm/ttm: Provide helpers for
 shrinking
Message-ID: <202302161341.EonvlLKG-lkp@intel.com>
References: <20230215161405.187368-15-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230215161405.187368-15-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc8 next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230215161405.187368-15-thomas.hellstrom%40linux.intel.com
patch subject: [Intel-gfx] [RFC PATCH 14/16] drm/ttm: Provide helpers for shrinking
config: x86_64-randconfig-a001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161341.EonvlLKG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/888719f1ca5b28696b77e89e4d365aba16053df3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
        git checkout 888719f1ca5b28696b77e89e4d365aba16053df3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161341.EonvlLKG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/swap_backup_folio.c:36:2: error: statement requires expression of scalar type ('void' invalid)
           if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_backup_folio.c:42:2: error: statement requires expression of scalar type ('void' invalid)
           if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +36 mm/swap_backup_folio.c

337546c404a4a7 Thomas Hellström 2023-02-15   10  
337546c404a4a7 Thomas Hellström 2023-02-15   11  /**
337546c404a4a7 Thomas Hellström 2023-02-15   12   * swap_backup_folio() - Insert an isolated folio into the swap-cache.
337546c404a4a7 Thomas Hellström 2023-02-15   13   * @folio: The folio to insert.
337546c404a4a7 Thomas Hellström 2023-02-15   14   * @writeback: Whether to perform immediate writeback.
337546c404a4a7 Thomas Hellström 2023-02-15   15   * @folio_gfp: The gfp value used when the folio was allocated. Used for
337546c404a4a7 Thomas Hellström 2023-02-15   16   *             cgroup charging only.
337546c404a4a7 Thomas Hellström 2023-02-15   17   * @alloc_fgp: The gfp value used for swap cache radix tree memory allocations.
337546c404a4a7 Thomas Hellström 2023-02-15   18   *
337546c404a4a7 Thomas Hellström 2023-02-15   19   * Insert a folio into the swap cache and get a swp_entry_t back as a reference.
337546c404a4a7 Thomas Hellström 2023-02-15   20   * If the swap cache folio should be subject of immediate writeback to
337546c404a4a7 Thomas Hellström 2023-02-15   21   * a swap device, @writeback should be set to true.
337546c404a4a7 Thomas Hellström 2023-02-15   22   * After a call to swap_backup_folio() the caller can
337546c404a4a7 Thomas Hellström 2023-02-15   23   * drop its folio reference and use swap_copy_folio() to get the folio
337546c404a4a7 Thomas Hellström 2023-02-15   24   * content back, or swap_drop_folio() to drop it completely.
337546c404a4a7 Thomas Hellström 2023-02-15   25   * Currently only PAGE_SIZE folios work, or if CONFIG_THP_SWAP is
337546c404a4a7 Thomas Hellström 2023-02-15   26   * enabled, HPAGE_PMD_NR*PAGE_SIZE may work as well, although that
337546c404a4a7 Thomas Hellström 2023-02-15   27   * needs further testing.
337546c404a4a7 Thomas Hellström 2023-02-15   28   *
337546c404a4a7 Thomas Hellström 2023-02-15   29   * Return: A swp_entry_t. If its .val field is zero, an error occurred.
337546c404a4a7 Thomas Hellström 2023-02-15   30   */
337546c404a4a7 Thomas Hellström 2023-02-15   31  swp_entry_t swap_backup_folio(struct folio *folio, bool writeback,
337546c404a4a7 Thomas Hellström 2023-02-15   32  			      gfp_t folio_gfp, gfp_t alloc_gfp)
337546c404a4a7 Thomas Hellström 2023-02-15   33  {
337546c404a4a7 Thomas Hellström 2023-02-15   34  	swp_entry_t swap = {};
337546c404a4a7 Thomas Hellström 2023-02-15   35  
337546c404a4a7 Thomas Hellström 2023-02-15  @36  	if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
337546c404a4a7 Thomas Hellström 2023-02-15   37  				  !(IS_ENABLED(CONFIG_THP_SWAP) &&
337546c404a4a7 Thomas Hellström 2023-02-15   38  				    folio_nr_pages(folio) == HPAGE_PMD_NR),
337546c404a4a7 Thomas Hellström 2023-02-15   39  				  folio))
337546c404a4a7 Thomas Hellström 2023-02-15   40  		return swap;
337546c404a4a7 Thomas Hellström 2023-02-15   41  
337546c404a4a7 Thomas Hellström 2023-02-15   42  	if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
337546c404a4a7 Thomas Hellström 2023-02-15   43  				  folio_test_lru(folio) ||
337546c404a4a7 Thomas Hellström 2023-02-15   44  				  folio_test_locked(folio), folio))
337546c404a4a7 Thomas Hellström 2023-02-15   45  		return swap;
337546c404a4a7 Thomas Hellström 2023-02-15   46  
337546c404a4a7 Thomas Hellström 2023-02-15   47  	/*
337546c404a4a7 Thomas Hellström 2023-02-15   48  	 * Typically called from reclaim so use folio_trylock. If the folio
337546c404a4a7 Thomas Hellström 2023-02-15   49  	 * is isolated with refcount == 1, then this trylock should always
337546c404a4a7 Thomas Hellström 2023-02-15   50  	 * succeed.
337546c404a4a7 Thomas Hellström 2023-02-15   51  	 */
337546c404a4a7 Thomas Hellström 2023-02-15   52  	if (!folio_trylock(folio))
337546c404a4a7 Thomas Hellström 2023-02-15   53  		return swap;
337546c404a4a7 Thomas Hellström 2023-02-15   54  
337546c404a4a7 Thomas Hellström 2023-02-15   55  	__folio_mark_uptodate(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   56  	__folio_set_swapbacked(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   57  
337546c404a4a7 Thomas Hellström 2023-02-15   58  	mem_cgroup_charge(folio, NULL, folio_gfp);
337546c404a4a7 Thomas Hellström 2023-02-15   59  
337546c404a4a7 Thomas Hellström 2023-02-15   60  	swap = folio_alloc_swap(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   61  	if (!swap.val)
337546c404a4a7 Thomas Hellström 2023-02-15   62  		goto out;
337546c404a4a7 Thomas Hellström 2023-02-15   63  
337546c404a4a7 Thomas Hellström 2023-02-15   64  	if (add_to_swap_cache(folio, swap, alloc_gfp, NULL) == 0) {
337546c404a4a7 Thomas Hellström 2023-02-15   65  		int ret = -EINVAL;
337546c404a4a7 Thomas Hellström 2023-02-15   66  
337546c404a4a7 Thomas Hellström 2023-02-15   67  		swap_shmem_alloc(swap);
337546c404a4a7 Thomas Hellström 2023-02-15   68  		folio_add_lru(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   69  		lru_add_drain();
337546c404a4a7 Thomas Hellström 2023-02-15   70  
337546c404a4a7 Thomas Hellström 2023-02-15   71  		/* Stolen from pageout(). */
337546c404a4a7 Thomas Hellström 2023-02-15   72  		if (writeback && folio_clear_dirty_for_io(folio)) {
337546c404a4a7 Thomas Hellström 2023-02-15   73  			struct writeback_control wbc = {
337546c404a4a7 Thomas Hellström 2023-02-15   74  				.sync_mode = WB_SYNC_NONE,
337546c404a4a7 Thomas Hellström 2023-02-15   75  				.nr_to_write = SWAP_CLUSTER_MAX,
337546c404a4a7 Thomas Hellström 2023-02-15   76  				.range_start = 0,
337546c404a4a7 Thomas Hellström 2023-02-15   77  				.range_end = LLONG_MAX,
337546c404a4a7 Thomas Hellström 2023-02-15   78  				.for_reclaim = 1,
337546c404a4a7 Thomas Hellström 2023-02-15   79  			};
337546c404a4a7 Thomas Hellström 2023-02-15   80  
337546c404a4a7 Thomas Hellström 2023-02-15   81  			folio_set_reclaim(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   82  			ret = swap_writepage(folio_page(folio, 0), &wbc);
337546c404a4a7 Thomas Hellström 2023-02-15   83  			if (!folio_test_writeback(folio))
337546c404a4a7 Thomas Hellström 2023-02-15   84  				folio_clear_reclaim(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   85  		}
337546c404a4a7 Thomas Hellström 2023-02-15   86  
337546c404a4a7 Thomas Hellström 2023-02-15   87  		if (ret)
337546c404a4a7 Thomas Hellström 2023-02-15   88  			folio_unlock(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   89  		return swap;
337546c404a4a7 Thomas Hellström 2023-02-15   90  	}
337546c404a4a7 Thomas Hellström 2023-02-15   91  
337546c404a4a7 Thomas Hellström 2023-02-15   92  	put_swap_folio(folio, swap);
337546c404a4a7 Thomas Hellström 2023-02-15   93  out:
337546c404a4a7 Thomas Hellström 2023-02-15   94  	folio_clear_swapbacked(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   95  	folio_mark_dirty(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   96  	folio_unlock(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   97  	mem_cgroup_uncharge(folio);
337546c404a4a7 Thomas Hellström 2023-02-15   98  
337546c404a4a7 Thomas Hellström 2023-02-15   99  	return swap;
337546c404a4a7 Thomas Hellström 2023-02-15  100  }
337546c404a4a7 Thomas Hellström 2023-02-15  101  EXPORT_SYMBOL(swap_backup_folio);
337546c404a4a7 Thomas Hellström 2023-02-15  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
