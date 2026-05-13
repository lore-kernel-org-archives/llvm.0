Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197731862;
	Wed, 13 May 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667859; cv=none; b=ZJPr4Mm0qO7S4HDOCj99Hb3/rV3WRpYqaz45PWxMdOR2egv2bJ4qPUTEvRvImSnL+KvU8VwM7cblmo1gdFYfnpQUBiskKb0C5lzj6iSqi9WANyqGNCCOUPm9WDx+IgJrBFunyxK0b8WH9NzJw7wLHKyD7TvCu4mtbtGobq2Fwhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667859; c=relaxed/simple;
	bh=RiS1JaO68M9vJmqLLkTOJhZNvoMHotalRBsPmysRJcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l7B2YR/o2QjpmtlcxJcJv1rxQlggbmfp2V08xlnsyuwjjvcOH5ejCmYb8D8J/KFHIU2BlrZhyjPPO+FbJAgQhCgs/h5QJCfZaWEfsB/jU5lJ/V/SUrZipoKlWPugkmme96Ocm1se2w57BFBat9fGtnF+goHbUctFnOJVY36OF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fH6p35KO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fH6p35KO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778667858; x=1810203858;
  h=date:from:to:cc:subject:message-id;
  bh=RiS1JaO68M9vJmqLLkTOJhZNvoMHotalRBsPmysRJcg=;
  b=fH6p35KOixSFXI2HkLqLoPs0WrbY5FXaCN9p6nAB0URp0I1m46GwCOHK
   92rGyiQUqbviuZiqKr+UJzE30dwBrfV6XCJC6CBtaQkBi1UPkxEZAlJA0
   /DMoOGlTtqZyD7tDuyZPHwarsl614tjyqww9BZPEMTPwnS+CP390vMPHQ
   dxoj33rZOgzTA9Nu69JxulMhqr6ro63ao7iPCfl2HlHr/3ijzVfhxoX+j
   r6vSKH1jX3lEdsNhUjcQUm6HpQfGgzujef2pQW+gN0H9NpErzjzAhCNZp
   t2Qn7GeWYFEnMZ6SU58bcD52buoitJQenX5i8UjqyquNBtPrHYlkPtmRw
   g==;
X-CSE-ConnectionGUID: SgxxPaKfSRiWCvm8LbonpQ==
X-CSE-MsgGUID: lzYXZU6aTJS7kcRrBhTJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102257676"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="102257676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:24:17 -0700
X-CSE-ConnectionGUID: 5HS18eQfRIqI3gnFVdfnUw==
X-CSE-MsgGUID: EZEiriG3R1ikEmtNJ30btA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242056391"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2026 03:24:16 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN6lB-000000003vB-2TuA;
	Wed, 13 May 2026 10:24:13 +0000
Date: Wed, 13 May 2026 18:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-allow-runtime-parameter-tuning-rfc-v1r1-wip 2/6]
 mm/slub.c:7791:39: error: use of undeclared identifier 'USHORT_MAX'
Message-ID: <202605131848.ohpPqW3E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-allow-runtime-parameter-tuning-rfc-v1r1-wip
head:   10c188407341817c6baf9dad9c788928f8387800
commit: c31e168e0f0f0b695792c4c9a82bd77ab9d94d12 [2/6] mm/slab: store sheaf capacity for all sheaves
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260513/202605131848.ohpPqW3E-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131848.ohpPqW3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131848.ohpPqW3E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:7791:39: error: use of undeclared identifier 'USHORT_MAX'
    7791 |         return max_t(unsigned int, capacity, USHORT_MAX);
         |                                              ^~~~~~~~~~
   1 error generated.


vim +/USHORT_MAX +7791 mm/slub.c

  7745	
  7746	static unsigned short calculate_sheaf_capacity(struct kmem_cache *s,
  7747						       struct kmem_cache_args *args)
  7748	
  7749	{
  7750		unsigned int capacity;
  7751		size_t size;
  7752	
  7753	
  7754		if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
  7755			return 0;
  7756	
  7757		/*
  7758		 * Bootstrap caches can't have sheaves for now (SLAB_NO_OBJ_EXT).
  7759		 * SLAB_NOLEAKTRACE caches (e.g., kmemleak's object_cache) must not
  7760		 * have sheaves to avoid recursion when sheaf allocation triggers
  7761		 * kmemleak tracking.
  7762		 */
  7763		if (s->flags & (SLAB_NO_OBJ_EXT | SLAB_NOLEAKTRACE))
  7764			return 0;
  7765	
  7766		/*
  7767		 * For now we use roughly similar formula (divided by two as there are
  7768		 * two percpu sheaves) as what was used for percpu partial slabs, which
  7769		 * should result in similar lock contention (barn or list_lock)
  7770		 */
  7771		if (s->size >= PAGE_SIZE)
  7772			capacity = 4;
  7773		else if (s->size >= 1024)
  7774			capacity = 12;
  7775		else if (s->size >= 256)
  7776			capacity = 26;
  7777		else
  7778			capacity = 60;
  7779	
  7780		/* Increment capacity to make sheaf exactly a kmalloc size bucket */
  7781		size = struct_size_t(struct slab_sheaf, objects, capacity);
  7782		size = kmalloc_size_roundup(size);
  7783		capacity = (size - struct_size_t(struct slab_sheaf, objects, 0)) / sizeof(void *);
  7784	
  7785		/*
  7786		 * Respect an explicit request for capacity that's typically motivated by
  7787		 * expected maximum size of kmem_cache_prefill_sheaf() to not end up
  7788		 * using low-performance oversize sheaves
  7789		 */
  7790		capacity = max(capacity, args->sheaf_capacity);
> 7791		return max_t(unsigned int, capacity, USHORT_MAX);
  7792	}
  7793	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
