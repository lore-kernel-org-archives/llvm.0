Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C13EDE59;
	Tue,  4 Aug 2026 04:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816463; cv=none; b=YCCs4l8FThORQ/WuOz6SomGkMdpWfWAvifbJGgIKfnSbo2+qAkFB14lP8nEpGCxhMxqrYRjbL1b4ffOyZoLyCgSiae0pK2h2aCtutV7MvujV0D1Y7qXe7pmA8RjK5a3AK/AhR8pbFQFJnmSNADwIvVJypyyOeis9F7vf+vHNC8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816463; c=relaxed/simple;
	bh=Sdzx4cZhaGgGrMSqDN/0TbSeuiTxeAiacrwW4EAnjtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oxNLxf8pfYFD2OBFYLSkJ8hTNRyKefLmvdhFSOt+K2z+PFSPXatmQ7HRjEdh0bWhvzrF1DWCFGDhu0gL3fuqxU1Goxlf7Irc1Y3LLKMOumQbL0iUHDuw92ogPw/4LbYnAaTQp948S8LGJppZRYCkXVUgflk/w2sfZqFZFbOCZcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6pd8JDk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6pd8JDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785816462; x=1817352462;
  h=date:from:to:cc:subject:message-id;
  bh=Sdzx4cZhaGgGrMSqDN/0TbSeuiTxeAiacrwW4EAnjtA=;
  b=e6pd8JDkMyA0oRORzVEJ15s2H0GvrvuWE36FwQ7YfK0KcMOsw9QySMAm
   4jD6Lg/dbkS7+/LV5de1noInZDrCo9GzQisKPGxxI7zpLY0TmiRX6sSL6
   kAUkf3OIRb4DY9ZrXDa9mV5w301nblG60ZrAqccVi9EkHv5meulReCZnx
   mPrZVwYFgbmFiOp8pxzFTXSylNYcO7jOFKkDEs5f7DGBVPFoom0QWOPso
   Ga0Ut7IHyR24sHz7tzok7JzdBYVJoPt3pDrCfIVjXUHjA0fw41ClwO4NV
   YvWExbA5arDl2J85wTitU/ebMXlHIb+J/hr+NIrG1YyCzj+uygdkPw1Tt
   A==;
X-CSE-ConnectionGUID: ipJPeFJTSRuClJ+P4SRPjg==
X-CSE-MsgGUID: vVYAwTajRPq9s/Md6rTj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85337745"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="85337745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 21:07:41 -0700
X-CSE-ConnectionGUID: iDx2r72xS4O+T+ofbEJ5Xw==
X-CSE-MsgGUID: T7YzviZRS0KsFGAvULTRCQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 21:07:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr6RE-000000008rx-3m5c;
	Tue, 04 Aug 2026 04:07:36 +0000
Date: Tue, 04 Aug 2026 12:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 7/25] fs/netfs/bvecq.c:67:24: error:
 incomplete definition of type 'mempool_t' (aka 'struct mempool')
Message-ID: <202608041120.daXDKoj3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   aaa4a525c627a60047b4d6b0d90ae8ea6a4bbdd4
commit: 2839f517bfb007fbfccafb1e6ac2b7d858e72fb4 [7/25] netfs: Make mempool available for bvecq
config: hexagon-randconfig-002-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041120.daXDKoj3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041120.daXDKoj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041120.daXDKoj3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/bvecq.c:67:24: error: incomplete definition of type 'mempool_t' (aka 'struct mempool')
      67 |                 bq = netfs_bvecq_pool.alloc(gfp, netfs_bvecq_pool.pool_data);
         |                      ~~~~~~~~~~~~~~~~^
   include/linux/netfs.h:25:16: note: forward declaration of 'struct mempool'
      25 | typedef struct mempool mempool_t;
         |                ^
   fs/netfs/bvecq.c:67:52: error: incomplete definition of type 'mempool_t' (aka 'struct mempool')
      67 |                 bq = netfs_bvecq_pool.alloc(gfp, netfs_bvecq_pool.pool_data);
         |                                                  ~~~~~~~~~~~~~~~~^
   include/linux/netfs.h:25:16: note: forward declaration of 'struct mempool'
      25 | typedef struct mempool mempool_t;
         |                ^
>> fs/netfs/bvecq.c:71:8: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^
>> fs/netfs/bvecq.c:71:6: error: incompatible integer to pointer conversion assigning to 'struct bvecq *' from 'int' [-Wint-conversion]
      71 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/bvecq.c:260:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     260 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^
   5 errors generated.


vim +67 fs/netfs/bvecq.c

    40	
    41	/**
    42	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    43	 * @nr_slots: Number of slots to allocate
    44	 * @gfp: The allocation constraints.
    45	 *
    46	 * Allocate a single bvecq node and initialise the header.  A number of inline
    47	 * slots are also allocated, rounded up to fit after the header in a power-of-2
    48	 * slab object of up to 512 bytes (up to 29 slots on a 64-bit cpu).  The caller
    49	 * should be aware that the number of slots allocated may be more or less than
    50	 * the number requested.  The slot array is not initialised.
    51	 *
    52	 * Return: The node pointer or NULL on allocation failure.
    53	 */
    54	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp)
    55	{
    56		struct bvecq *bq;
    57		const size_t max_size = 512;
    58		const size_t max_slots = (max_size - sizeof(*bq)) / sizeof(bq->__bv[0]);
    59		size_t part = umin(nr_slots, max_slots);
    60		size_t size = roundup_pow_of_two(struct_size(bq, __bv, part));
    61		bool from_pool = false;
    62	
    63		gfp &= ~GFP_ZONEMASK;
    64		if (size != BVECQ_STD_SIZE) {
    65			bq = kmalloc(size, gfp);
    66		} else {
  > 67			bq = netfs_bvecq_pool.alloc(gfp, netfs_bvecq_pool.pool_data);
    68			from_pool = true;
    69		}
    70		if (!bq && gfp != GFP_KERNEL) {
  > 71			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    72			from_pool = true;
    73			size = BVECQ_STD_SIZE;
    74		}
    75		if (bq) {
    76			*bq = (struct bvecq) {
    77				.ref		= REFCOUNT_INIT(1),
    78				.bv		= bq->__bv,
    79				.inline_bv	= true,
    80				.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    81				.from_pool	= from_pool,
    82			};
    83			netfs_stat(&netfs_n_bvecq);
    84		}
    85		return bq;
    86	}
    87	EXPORT_SYMBOL(bvecq_alloc_one);
    88	
    89	/**
    90	 * bvecq_alloc_chain - Allocate an unpopulated bvecq chain
    91	 * @nr_slots: Number of slots to allocate
    92	 * @gfp: The allocation constraints.
    93	 *
    94	 * Allocate a chain of bvecq nodes providing at least the requested cumulative
    95	 * number of slots.
    96	 *
    97	 * Return: The first node pointer or NULL on allocation failure.
    98	 */
    99	struct bvecq *bvecq_alloc_chain(size_t nr_slots, gfp_t gfp)
   100	{
   101		struct bvecq *head = NULL, *tail = NULL;
   102	
   103		_enter("%zu", nr_slots);
   104	
   105		for (;;) {
   106			struct bvecq *bq;
   107	
   108			bq = bvecq_alloc_one(nr_slots, gfp);
   109			if (!bq)
   110				goto oom;
   111	
   112			if (tail)
   113				bvecq_append(tail, bq);
   114			else
   115				head = bq;
   116			tail = bq;
   117			if (tail->max_slots >= nr_slots)
   118				break;
   119			nr_slots -= tail->max_slots;
   120		}
   121	
   122		return head;
   123	oom:
   124		bvecq_put(head);
   125		return NULL;
   126	}
   127	EXPORT_SYMBOL(bvecq_alloc_chain);
   128	
   129	/**
   130	 * bvecq_alloc_buffer2 - Allocate a bvecq chain and populate with buffers
   131	 * @size: Target size of the buffer (can be 0 for an empty buffer)
   132	 * @pre_slots: Number of preamble slots to set aside
   133	 * @gfp: The allocation constraints.
   134	 *
   135	 * Allocate a chain of bvecq nodes and populate the slots with sufficient pages
   136	 * to provide at least the requested amount of space, leaving the first
   137	 * @pre_slots slots unset.  The pre-slots must all fit into the the first
   138	 * bvecq.
   139	 *
   140	 * The pages allocated may be compound pages larger than PAGE_SIZE and thus
   141	 * occupy fewer slots.  The pages have their refcounts set to 1 and can be
   142	 * passed to MSG_SPLICE_PAGES.
   143	 *
   144	 * Return: The first node pointer or NULL on allocation failure.
   145	 */
   146	struct bvecq *bvecq_alloc_buffer2(size_t size, unsigned int pre_slots, gfp_t gfp)
   147	{
   148		struct bvecq *head = NULL, *p = NULL;
   149		size_t nr_per_bq = BVECQ_STD_SLOTS;
   150		size_t count = pre_slots + DIV_ROUND_UP(size, PAGE_SIZE);
   151	
   152		_enter("%zx,%zx,%u", size, count, pre_slots);
   153	
   154		if (WARN_ON_ONCE(pre_slots > nr_per_bq))
   155			return NULL;
   156	
   157		head = bvecq_alloc_chain(count, gfp);
   158		if (!head)
   159			return NULL;
   160	
   161		p = head;
   162		do {
   163			struct page **pages;
   164			size_t unused, want, got, slot;
   165	
   166			if (!count)
   167				break;
   168			if (WARN_ON_ONCE(!p))
   169				goto oom;
   170	
   171			if (p->nr_slots == 0) {
   172				/* Need to clear pre slots and pages[], so just clear all. */
   173				memset(p->bv, 0, p->max_slots * sizeof(p->bv[0]));
   174				p->mem_type = BVECQ_MEM_ALLOCED;
   175				p->nr_slots = pre_slots;
   176				count -= pre_slots;
   177				pre_slots = 0;
   178				if (!count)
   179					break;
   180			}
   181	
   182			if (p->nr_slots >= p->max_slots) {
   183				p = p->next;
   184				continue;
   185			}
   186			unused = p->max_slots - p->nr_slots;
   187	
   188			pages = (struct page **)&p->bv[p->max_slots];
   189			pages -= unused;
   190	
   191			want = min(count, unused);
   192			got = alloc_pages_bulk(gfp, want, pages);
   193			if (!got)
   194				goto oom;
   195	
   196			slot = p->nr_slots;
   197			for (int i = 0; i < got; i++) {
   198				set_page_count(pages[i], 1);
   199				bvec_set_page(&p->bv[slot++], pages[i], PAGE_SIZE, 0);
   200			}
   201	
   202			bvecq_filled_to(p, slot);
   203			count -= got;
   204		} while (count > 0);
   205	
   206		return head;
   207	oom:
   208		bvecq_put(head);
   209		return NULL;
   210	}
   211	EXPORT_SYMBOL(bvecq_alloc_buffer2);
   212	
   213	/*
   214	 * Free the page pointed to by a slot as necessary.
   215	 */
   216	static void bvecq_free_slot(struct bvecq *bq, unsigned int slot)
   217	{
   218		struct page *page = bq->bv[slot].bv_page;
   219	
   220		if (!page)
   221			return;
   222	
   223		switch (bq->mem_type) {
   224		case BVECQ_MEM_EXTERNAL:
   225			break;
   226		case BVECQ_MEM_PAGECACHE:
   227			put_page(page);
   228			break;
   229		case BVECQ_MEM_GUP:
   230			unpin_user_page(page);
   231			break;
   232		case BVECQ_MEM_ALLOCED:
   233			__free_pages(page, compound_order(page));
   234			break;
   235		default:
   236			WARN_ON_ONCE(1);
   237			break;
   238		}
   239	}
   240	
   241	/**
   242	 * bvecq_put - Put a ref on a bvec queue
   243	 * @bq: The start of the folio queue to free
   244	 *
   245	 * Put the ref(s) on the nodes in a bvec queue, freeing up the node and the
   246	 * page fragments it points to as the refcounts become zero.
   247	 */
   248	void bvecq_put(struct bvecq *bq)
   249	{
   250		struct bvecq *next;
   251	
   252		for (; bq; bq = next) {
   253			if (!refcount_dec_and_test(&bq->ref))
   254				break;
   255			for (int slot = 0; slot < bq->nr_slots; slot++)
   256				bvecq_free_slot(bq, slot);
   257			next = bq->next;
   258			netfs_stat_d(&netfs_n_bvecq);
   259			if (bq->from_pool)
 > 260				mempool_free(bq, &netfs_bvecq_pool);
   261			else
   262				kfree(bq);
   263		}
   264	}
   265	EXPORT_SYMBOL(bvecq_put);
   266	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
