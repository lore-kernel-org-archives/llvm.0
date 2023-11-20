Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D602ED8;
	Mon, 20 Nov 2023 00:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/mmIKU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700439717; x=1731975717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m61ys6ij2lMA40cF9dqNMdfXSO3dycrKevx21VdZ2zs=;
  b=J/mmIKU5U51eEhWTg9la2f9cCjLO70b902Fi6dEkL9HuODXkx5axuVOB
   zsxBCI+6yd6oUjbKg3fSh6sNbv+3b/XCK1tfvD6mN78ehLyuFmQLgjr/B
   ZPXntvOSGOA9a/Jb6qrxJiyvlAM8IjPOZ0F54WQFkCjnnT+TLjc/Xy3Xm
   6TU9VkO9jvn8sVQ4/ylzi4kbqpcF6VUIt0/P+G5SVs3W3c6bbCDF8Tt/n
   hVhaw9M3ott1rRRkJJzKFJJQ8kmGc2S2+Ws/USfwH+BSa9yqX3mMof5oB
   U7gtwE2HBZGJ2YeERgCv7eWKDiwyomegn6gQ5fErFwuaoZGh3V4uf18Xf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390389465"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="390389465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 16:21:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="800989011"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="800989011"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Nov 2023 16:21:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4s2u-0005kS-1u;
	Mon, 20 Nov 2023 00:21:49 +0000
Date: Mon, 20 Nov 2023 08:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 06/24] swap: rework swapin_no_readahead arguments
Message-ID: <202311200826.8Nl5w3h8-lkp@intel.com>
References: <20231119194740.94101-7-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231119194740.94101-7-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.7-rc2 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-fix-a-potential-undefined-behavior-issue/20231120-035926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231119194740.94101-7-ryncsn%40gmail.com
patch subject: [PATCH 06/24] swap: rework swapin_no_readahead arguments
config: i386-buildonly-randconfig-003-20231120 (https://download.01.org/0day-ci/archive/20231120/202311200826.8Nl5w3h8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200826.8Nl5w3h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200826.8Nl5w3h8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_state.c:872: warning: Function parameter or member 'mpol' not described in 'swapin_no_readahead'
>> mm/swap_state.c:872: warning: Function parameter or member 'ilx' not described in 'swapin_no_readahead'
>> mm/swap_state.c:872: warning: Function parameter or member 'mm' not described in 'swapin_no_readahead'
>> mm/swap_state.c:872: warning: Excess function parameter 'vmf' description in 'swapin_no_readahead'


vim +872 mm/swap_state.c

d9bfcfdc41e8e5 Huang Ying  2017-09-06  859  
19f582d2684e47 Kairui Song 2023-11-20  860  /**
19f582d2684e47 Kairui Song 2023-11-20  861   * swapin_no_readahead - swap in pages skipping swap cache and readahead
19f582d2684e47 Kairui Song 2023-11-20  862   * @entry: swap entry of this memory
19f582d2684e47 Kairui Song 2023-11-20  863   * @gfp_mask: memory allocation flags
19f582d2684e47 Kairui Song 2023-11-20  864   * @vmf: fault information
19f582d2684e47 Kairui Song 2023-11-20  865   *
19f582d2684e47 Kairui Song 2023-11-20  866   * Returns the struct page for entry and addr after the swap entry is read
19f582d2684e47 Kairui Song 2023-11-20  867   * in.
19f582d2684e47 Kairui Song 2023-11-20  868   */
598f2616cde014 Kairui Song 2023-11-20  869  static struct page *swapin_no_readahead(swp_entry_t entry, gfp_t gfp_mask,
2538a5e96fe62f Kairui Song 2023-11-20  870  					struct mempolicy *mpol, pgoff_t ilx,
2538a5e96fe62f Kairui Song 2023-11-20  871  					struct mm_struct *mm)
19f582d2684e47 Kairui Song 2023-11-20 @872  {
19f582d2684e47 Kairui Song 2023-11-20  873  	struct folio *folio;
2538a5e96fe62f Kairui Song 2023-11-20  874  	struct page *page;
19f582d2684e47 Kairui Song 2023-11-20  875  	void *shadow = NULL;
19f582d2684e47 Kairui Song 2023-11-20  876  
2538a5e96fe62f Kairui Song 2023-11-20  877  	page = alloc_pages_mpol(gfp_mask, 0, mpol, ilx, numa_node_id());
2538a5e96fe62f Kairui Song 2023-11-20  878  	folio = (struct folio *)page;
19f582d2684e47 Kairui Song 2023-11-20  879  	if (folio) {
2538a5e96fe62f Kairui Song 2023-11-20  880  		if (mem_cgroup_swapin_charge_folio(folio, mm,
c2ac0dcbf9ab6a Kairui Song 2023-11-20  881  						   GFP_KERNEL, entry)) {
19f582d2684e47 Kairui Song 2023-11-20  882  			folio_put(folio);
19f582d2684e47 Kairui Song 2023-11-20  883  			return NULL;
19f582d2684e47 Kairui Song 2023-11-20  884  		}
c2ac0dcbf9ab6a Kairui Song 2023-11-20  885  
c2ac0dcbf9ab6a Kairui Song 2023-11-20  886  		__folio_set_locked(folio);
c2ac0dcbf9ab6a Kairui Song 2023-11-20  887  		__folio_set_swapbacked(folio);
c2ac0dcbf9ab6a Kairui Song 2023-11-20  888  
19f582d2684e47 Kairui Song 2023-11-20  889  		mem_cgroup_swapin_uncharge_swap(entry);
19f582d2684e47 Kairui Song 2023-11-20  890  
19f582d2684e47 Kairui Song 2023-11-20  891  		shadow = get_shadow_from_swap_cache(entry);
19f582d2684e47 Kairui Song 2023-11-20  892  		if (shadow)
19f582d2684e47 Kairui Song 2023-11-20  893  			workingset_refault(folio, shadow);
19f582d2684e47 Kairui Song 2023-11-20  894  
19f582d2684e47 Kairui Song 2023-11-20  895  		folio_add_lru(folio);
19f582d2684e47 Kairui Song 2023-11-20  896  
19f582d2684e47 Kairui Song 2023-11-20  897  		/* To provide entry to swap_readpage() */
19f582d2684e47 Kairui Song 2023-11-20  898  		folio->swap = entry;
19f582d2684e47 Kairui Song 2023-11-20  899  		swap_readpage(page, true, NULL);
19f582d2684e47 Kairui Song 2023-11-20  900  		folio->private = NULL;
19f582d2684e47 Kairui Song 2023-11-20  901  	}
19f582d2684e47 Kairui Song 2023-11-20  902  
19f582d2684e47 Kairui Song 2023-11-20  903  	return page;
19f582d2684e47 Kairui Song 2023-11-20  904  }
19f582d2684e47 Kairui Song 2023-11-20  905  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
