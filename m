Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EEF5BAF0;
	Wed,  2 Apr 2025 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599065; cv=none; b=TfbjtgLNFNG7JlD/YPcq/8MT/f9fvf0hccuph62dgWvT87IBKosh/H1y55nTJWhDMdowrLjF2hdh4IZTlqwaC2XRBdXuxSIau3zZS1mmx76vq+I9jRGG9zygeOhGWSXjqOAQxvRHbgrUFfAgrEJvdhIVcO/ZMmq20+KTEIKG5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599065; c=relaxed/simple;
	bh=Tdlq5TiqO/XE83VfPFoedqdq3+BQTGJ0oksFEq8Tkac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmD+GMvreBC0NZFJR6w/9M3uTaEOoYMeXnq/siARbC6nOGVxv7r2jSvajQaxhbx0DeOrC2aw7bFdo5vaHr3w21RDaZO+yjOPSHSD4s9XIYH0lg/6C4M3GbB72w/ajtiRtRRlZKDQKcrcM2FJaMsfHyBX9EWr0IQWu/IiXcYS1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbSt5y5Y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbSt5y5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743599064; x=1775135064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tdlq5TiqO/XE83VfPFoedqdq3+BQTGJ0oksFEq8Tkac=;
  b=IbSt5y5YJxTPpRvzio+4DaoRs7KvFVJsxPyL+TpI8w1OM/3RSGMUr6rf
   f/bg/WFDE0xWBYAqS6NFQ2ZicTkWju6dbQ8TC4K5akWRcq0vOiGe6TzU+
   /nsdXEInnGSaryYYPYis54s2TT6F3oSwkcWhOtgQi45QZzI9wt/3rkrbI
   Z7BAJtI7uNMuTCZg49dIe3yK7h7pNjQd5zaiybCYjjBMjBMoFpiRLuVDo
   53iLUY2cjkHzwbSqISU8zZpRGa7YPrY2Y/CKK53SBquBZXUJ14EzWIJtc
   aGsJtQUKFj86x+l7ULXX6sHxJ9XC6GtHijIc1S97zqejem92QT4D5tTpT
   Q==;
X-CSE-ConnectionGUID: F1Tpq2a/S7q/N8lP0ufaHw==
X-CSE-MsgGUID: h5pdGO69S+yfz+88raSQXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="67428842"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="67428842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 06:04:23 -0700
X-CSE-ConnectionGUID: qmKex5JwTMW1UzwSiae5cQ==
X-CSE-MsgGUID: hTAoWUDMQPWZBMYsH59Vjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="163920317"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2025 06:04:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzxlS-000Ai6-0q;
	Wed, 02 Apr 2025 13:04:18 +0000
Date: Wed, 2 Apr 2025 21:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, Vitaly Wool <vitaly.wool@konsulko.se>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH] mm: add zblock allocator
Message-ID: <202504022017.kHAz8bGB-lkp@intel.com>
References: <20250401171754.2686501-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401171754.2686501-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14]
[cannot apply to akpm-mm/mm-everything next-20250402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-add-zblock-allocator/20250402-011953
base:   linus/master
patch link:    https://lore.kernel.org/r/20250401171754.2686501-1-vitaly.wool%40konsulko.se
patch subject: [PATCH] mm: add zblock allocator
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504022017.kHAz8bGB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504022017.kHAz8bGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022017.kHAz8bGB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zblock.c:56: warning: Function parameter or struct member 'free_slots' not described in 'zblock_block'
>> mm/zblock.c:56: warning: Function parameter or struct member 'slot_info' not described in 'zblock_block'
>> mm/zblock.c:56: warning: Function parameter or struct member 'cache_idx' not described in 'zblock_block'
>> mm/zblock.c:102: warning: Function parameter or struct member 'slot_size' not described in 'block_desc'
>> mm/zblock.c:102: warning: Function parameter or struct member 'slots_per_block' not described in 'block_desc'
>> mm/zblock.c:102: warning: Function parameter or struct member 'order' not described in 'block_desc'
>> mm/zblock.c:102: warning: Function parameter or struct member 'block_desc' not described in 'block_desc'
>> mm/zblock.c:114: warning: Function parameter or struct member 'lock' not described in 'block_list'
>> mm/zblock.c:114: warning: Function parameter or struct member 'block_cache' not described in 'block_list'
>> mm/zblock.c:114: warning: Function parameter or struct member 'block_count' not described in 'block_list'
>> mm/zblock.c:249: warning: Excess function parameter 'ops' description in 'zblock_create_pool'


vim +56 mm/zblock.c

    42	
    43	/**
    44	 * struct zblock_block - block metadata
    45	 * Block consists of several (1/2/4/8) pages and contains fixed
    46	 * integer number of slots for allocating compressed pages.
    47	 *
    48	 * free_slots:	number of free slots in the block
    49	 * slot_info:	contains data about free/occupied slots
    50	 * cache_idx:	index of the block in cache
    51	 */
    52	struct zblock_block {
    53		atomic_t free_slots;
    54		u64 slot_info[1];
    55		int cache_idx;
  > 56	};
    57	
    58	/**
    59	 * struct block_desc - general metadata for block lists
    60	 * Each block list stores only blocks of corresponding type which means
    61	 * that all blocks in it have the same number and size of slots.
    62	 * All slots are aligned to size of long.
    63	 *
    64	 * slot_size:		size of slot for this list
    65	 * slots_per_block:	number of slots per block for this list
    66	 * order:		order for __get_free_pages
    67	 */
    68	static const struct block_desc {
    69		const unsigned int slot_size;
    70		const unsigned short slots_per_block;
    71		const unsigned short order;
    72	} block_desc[] = {
    73		{ SLOT_SIZE(32, 0), 32, 0 },
    74		{ SLOT_SIZE(22, 0), 22, 0 },
    75		{ SLOT_SIZE(17, 0), 17, 0 },
    76		{ SLOT_SIZE(13, 0), 13, 0 },
    77		{ SLOT_SIZE(11, 0), 11, 0 },
    78		{ SLOT_SIZE(9, 0), 9, 0 },
    79		{ SLOT_SIZE(8, 0), 8, 0 },
    80		{ SLOT_SIZE(14, 1), 14, 1 },
    81		{ SLOT_SIZE(12, 1), 12, 1 },
    82		{ SLOT_SIZE(11, 1), 11, 1 },
    83		{ SLOT_SIZE(10, 1), 10, 1 },
    84		{ SLOT_SIZE(9, 1), 9, 1 },
    85		{ SLOT_SIZE(8, 1), 8, 1 },
    86		{ SLOT_SIZE(15, 2), 15, 2 },
    87		{ SLOT_SIZE(14, 2), 14, 2 },
    88		{ SLOT_SIZE(13, 2), 13, 2 },
    89		{ SLOT_SIZE(12, 2), 12, 2 },
    90		{ SLOT_SIZE(11, 2), 11, 2 },
    91		{ SLOT_SIZE(10, 2), 10, 2 },
    92		{ SLOT_SIZE(9, 2), 9, 2 },
    93		{ SLOT_SIZE(8, 2), 8, 2 },
    94		{ SLOT_SIZE(15, 3), 15, 3 },
    95		{ SLOT_SIZE(14, 3), 14, 3 },
    96		{ SLOT_SIZE(13, 3), 13, 3 },
    97		{ SLOT_SIZE(12, 3), 12, 3 },
    98		{ SLOT_SIZE(11, 3), 11, 3 },
    99		{ SLOT_SIZE(10, 3), 10, 3 },
   100		{ SLOT_SIZE(9, 3), 9, 3 },
   101		{ SLOT_SIZE(7, 3), 7, 3 }
 > 102	};
   103	
   104	/**
   105	 * struct block_list - stores metadata of particular list
   106	 * lock:		protects block_cache
   107	 * block_cache:		blocks with free slots
   108	 * block_count:		total number of blocks in the list
   109	 */
   110	struct block_list {
   111		spinlock_t lock;
   112		struct zblock_block *block_cache[BLOCK_CACHE_SIZE];
   113		unsigned long block_count;
 > 114	};
   115	
   116	/**
   117	 * struct zblock_pool - stores metadata for each zblock pool
   118	 * @block_lists:	array of block lists
   119	 * @zpool:		zpool driver
   120	 * @alloc_flag:		protects block allocation from memory leak
   121	 *
   122	 * This structure is allocated at pool creation time and maintains metadata
   123	 * for a particular zblock pool.
   124	 */
   125	struct zblock_pool {
   126		struct block_list block_lists[ARRAY_SIZE(block_desc)];
   127		struct zpool *zpool;
   128		atomic_t alloc_flag;
   129	};
   130	
   131	/*****************
   132	 * Helpers
   133	 *****************/
   134	
   135	static int cache_insert_block(struct zblock_block *block, struct block_list *list)
   136	{
   137		unsigned int i, min_free_slots = atomic_read(&block->free_slots);
   138		int min_index = -1;
   139	
   140		if (WARN_ON(block->cache_idx != -1))
   141			return -EINVAL;
   142	
   143		min_free_slots = atomic_read(&block->free_slots);
   144		for (i = 0; i < BLOCK_CACHE_SIZE; i++) {
   145			if (!list->block_cache[i] || !atomic_read(&(list->block_cache[i])->free_slots)) {
   146				min_index = i;
   147				break;
   148			}
   149			if (atomic_read(&(list->block_cache[i])->free_slots) < min_free_slots) {
   150				min_free_slots = atomic_read(&(list->block_cache[i])->free_slots);
   151				min_index = i;
   152			}
   153		}
   154		if (min_index >= 0) {
   155			if (list->block_cache[min_index])
   156				(list->block_cache[min_index])->cache_idx = -1;
   157			list->block_cache[min_index] = block;
   158			block->cache_idx = min_index;
   159		}
   160		return min_index < 0 ? min_index : 0;
   161	}
   162	
   163	static struct zblock_block *cache_find_block(struct block_list *list)
   164	{
   165		int i;
   166		struct zblock_block *z = NULL;
   167	
   168		for (i = 0; i < BLOCK_CACHE_SIZE; i++) {
   169			if (list->block_cache[i] &&
   170			    atomic_dec_if_positive(&list->block_cache[i]->free_slots) >= 0) {
   171				z = list->block_cache[i];
   172				break;
   173			}
   174		}
   175		return z;
   176	}
   177	
   178	static int cache_remove_block(struct block_list *list, struct zblock_block *block)
   179	{
   180		int idx = block->cache_idx;
   181	
   182		block->cache_idx = -1;
   183		if (idx >= 0)
   184			list->block_cache[idx] = NULL;
   185		return idx < 0 ? idx : 0;
   186	}
   187	
   188	/*
   189	 * Encodes the handle of a particular slot in the pool using metadata
   190	 */
   191	static inline unsigned long metadata_to_handle(struct zblock_block *block,
   192								unsigned int block_type, unsigned int slot)
   193	{
   194		return (unsigned long)(block) + (block_type << SLOT_BITS) + slot;
   195	}
   196	
   197	/* Returns block, block type and slot in the pool corresponding to handle */
   198	static inline struct zblock_block *handle_to_metadata(unsigned long handle,
   199							unsigned int *block_type, unsigned int *slot)
   200	{
   201		*block_type = (handle & (PAGE_SIZE - 1)) >> SLOT_BITS;
   202		*slot = handle & SLOT_MASK;
   203		return (struct zblock_block *)(handle & PAGE_MASK);
   204	}
   205	
   206	
   207	/*
   208	 * allocate new block and add it to corresponding block list
   209	 */
   210	static struct zblock_block *alloc_block(struct zblock_pool *pool,
   211						int block_type, gfp_t gfp,
   212						unsigned long *handle)
   213	{
   214		struct zblock_block *block;
   215		struct block_list *list;
   216	
   217		block = (void *)__get_free_pages(gfp, block_desc[block_type].order);
   218		if (!block)
   219			return NULL;
   220	
   221		list = &(pool->block_lists)[block_type];
   222	
   223		/* init block data  */
   224		memset(&block->slot_info, 0, sizeof(block->slot_info));
   225		atomic_set(&block->free_slots, block_desc[block_type].slots_per_block - 1);
   226		block->cache_idx = -1;
   227		set_bit(BIT_SLOT_OCCUPIED, (unsigned long *)block->slot_info);
   228		*handle = metadata_to_handle(block, block_type, 0);
   229	
   230		spin_lock(&list->lock);
   231		cache_insert_block(block, list);
   232		list->block_count++;
   233		spin_unlock(&list->lock);
   234		return block;
   235	}
   236	
   237	/*****************
   238	 * API Functions
   239	 *****************/
   240	/**
   241	 * zblock_create_pool() - create a new zblock pool
   242	 * @gfp:	gfp flags when allocating the zblock pool structure
   243	 * @ops:	user-defined operations for the zblock pool
   244	 *
   245	 * Return: pointer to the new zblock pool or NULL if the metadata allocation
   246	 * failed.
   247	 */
   248	static struct zblock_pool *zblock_create_pool(gfp_t gfp)
 > 249	{
   250		struct zblock_pool *pool;
   251		struct block_list *list;
   252		int i, j;
   253	
   254		pool = kmalloc(sizeof(struct zblock_pool), gfp);
   255		if (!pool)
   256			return NULL;
   257	
   258		/* init each block list */
   259		for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
   260			list = &(pool->block_lists)[i];
   261			spin_lock_init(&list->lock);
   262			for (j = 0; j < BLOCK_CACHE_SIZE; j++)
   263				list->block_cache[j] = NULL;
   264			list->block_count = 0;
   265		}
   266		atomic_set(&pool->alloc_flag, 0);
   267		return pool;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
