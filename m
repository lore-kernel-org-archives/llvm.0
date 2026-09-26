Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A6377A92;
	Sat, 26 Sep 2026 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457104; cv=none; b=ILQ8TT51taHLLSeObT32WA4egk9sT2eW6b1XFP4A+QLT0dVK7H3Q5iMjygChxiCP+xsNNudDVt20lSam8PSTrR1hbnc5FAaz5h7hyqwf/GdZe0CIi+vpjs8Dvf0bHuggWyU0pYbHjitOk7BmsL4IaeGatsf7kxjJb7aoWNVww+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457104; c=relaxed/simple;
	bh=NlvIFl67C4kBerEQ7RcTDpcxo2DASYzoXIWwiY+Nsds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LCqYgprvlWwZ7vJ0LrLRsfRrrY4gJ8UjTFdgXSTblWdAqPdmfVZaDjHR5+gqS27nD3iQ8BXqH7gACQZ6slUp7ydzfrL6hPpQpwXxGnhk5qW6jhjKcGRImmrZaFV13d6wTRaJzZfEAtucBW6Dgh1OOXdP0LwBMU+wQtubAgsRKdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOvfhS5F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOvfhS5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790457103; x=1821993103;
  h=date:from:to:cc:subject:message-id;
  bh=NlvIFl67C4kBerEQ7RcTDpcxo2DASYzoXIWwiY+Nsds=;
  b=AOvfhS5Fa6xyjIWjyw33k3no8Y+WrpobwoXww8Wc8X1pmYx5VMmgXa1i
   05sVXFBono97qsWOtlFzDDOHfP/VKUYailTITqclJHtrqqnztrnU3OHKS
   th75Tmy6/llNFc3eo/kbhQdCvrzyzfNjAQn5dzX33j4E6pXS1i9nfl7hy
   yHPQwcpHW7kNsIUZzk1iuS8htAPIXJ6o2OGKCmqH6OvdofpIY49It6FFe
   lPKXCD3uAvLclAHnAfidWKxj+niKn6SLgCVd7y+sA8kGQzK4Mrj16VJ8n
   PpuJcsE49m/zFOaFG1sU/t7Op6DFdCc38YavkSSSZ65YNc2UP6Sc+sg3w
   Q==;
X-CSE-ConnectionGUID: 24FbY+taTaixSi6ON0naNQ==
X-CSE-MsgGUID: YeqXrAXlQ+G0GhTYu1rOcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101867517"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="101867517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 14:11:42 -0700
X-CSE-ConnectionGUID: N/854vINR6iafS/Qa5CYqQ==
X-CSE-MsgGUID: 8K11oxGMQKG9HFP1VGX9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274731600"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2026 14:11:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAZgI-00000000MCH-0hNI;
	Sat, 26 Sep 2026 21:11:38 +0000
Date: Sun, 27 Sep 2026 05:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-3 13/26] fs/netfs/bvecq.c:79:8:
 error: call to undeclared function 'mempool_alloc_noreserve'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202609270500.givpbBlA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   65d1ffcb408ea16b3a4a497269da871c62b7faa3
commit: 217cce19dbecd925c96842bf3b15c0b45e19a930 [13/26] netfs: Add some tools for managing bvecq chains
config: i386-randconfig-1013-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270500.givpbBlA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270500.givpbBlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270500.givpbBlA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/bvecq.c:79:8: error: call to undeclared function 'mempool_alloc_noreserve'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                 bq = mempool_alloc_noreserve(&netfs_bvecq_pool, gfp);
         |                      ^
   fs/netfs/bvecq.c:79:6: error: incompatible integer to pointer conversion assigning to 'struct bvecq *' from 'int' [-Wint-conversion]
      79 |                 bq = mempool_alloc_noreserve(&netfs_bvecq_pool, gfp);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/bvecq.c:277:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^
   3 errors generated.


vim +/mempool_alloc_noreserve +79 fs/netfs/bvecq.c

    38	
    39	/**
    40	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    41	 * @nr_slots: Number of slots to allocate
    42	 * @gfp: The allocation constraints.
    43	 * @for_writeback: True if allocating for writeback
    44	 *
    45	 * Allocate a single bvecq node and initialise the header.  The allocation is
    46	 * rounded up to the size of the smallest slab granule that will accommodate it
    47	 * and all the remaining space is set as an inline slot array with max_slots
    48	 * set to the number of slots.  The slot array is not initialised.
    49	 *
    50	 * If @for_writeback is set, then the emergency mempool may be used for
    51	 * allocation.  If it does allocate from that pool, the maximum number of slots
    52	 * available will be BVECQ_POOL_SLOTS which may be less than requested.  Also,
    53	 * if @for_writeback is set, the function will not fail - though it may have to
    54	 * wait.
    55	 *
    56	 * Return: The node pointer or NULL on allocation failure.
    57	 */
    58	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    59	{
    60		struct bvecq *bq;
    61		const size_t pool_size = struct_size_t(struct bvecq, __bv, BVECQ_POOL_SLOTS);
    62		size_t size;
    63		bool from_pool = false;
    64	
    65		size = kmalloc_size_roundup(struct_size(bq, __bv, nr_slots));
    66		gfp &= ~(GFP_ZONEMASK | __GFP_THISNODE);
    67	
    68		if (for_writeback) {
    69			if (size != pool_size) {
    70				gfp_t gfp_temp = gfp;
    71	
    72				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    73				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    74				bq = kmalloc(size, gfp_temp);
    75				if (bq)
    76					goto success;
    77			}
    78	
  > 79			bq = mempool_alloc_noreserve(&netfs_bvecq_pool, gfp);
    80			if (!bq)
    81				return bq;
    82			from_pool = true;
    83			size = pool_size;
    84		} else {
    85			bq = kmalloc(size, gfp);
    86			if (!bq)
    87				return bq;
    88		}
    89	
    90	success:
    91		*bq = (struct bvecq) {
    92			.ref		= REFCOUNT_INIT(1),
    93			.bv		= bq->__bv,
    94			.inline_bv	= true,
    95			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    96			.from_pool	= from_pool,
    97		};
    98		netfs_stat(&netfs_n_bvecq);
    99		return bq;
   100	}
   101	EXPORT_SYMBOL(bvecq_alloc_one);
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
