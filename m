Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126341C726D;
	Sat, 29 Mar 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743256779; cv=none; b=AH6xZpQM3ZaRWPiJ/9fbnwox1ljF5wytbx0vTfEcpLLG5ynif+Kc8bbd0RnZArmE6scWsIlDR640pK0y0wvcKrHKQhFdH8MOEr0tEcgIO4Z65HLxalTw6tMbeeB6931OZsCApUWnubJcmGsPcUUIiqZsXtx4eKjPcnJKVgKh32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743256779; c=relaxed/simple;
	bh=cEda95NqDNZjXPgue2Gp3hasGnBx8dCzYXE9/5wwWmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/bsWlAhe6+olWiLPb6YT8m9euLyvQ6Fi5PYhxVpkb2MYxfrP2wz9YlCtHDvNWCuvkQHRb5I8Q97C+UbaVkg5JKyBNDSKMEe7+sroI7BEZ0JrE1LaUYRfOL41LDI1Vx8jcWKm42eoks61IL5omV0YY+Unqw0w1ecuxeOeZ0QCok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVwDqGQN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVwDqGQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743256777; x=1774792777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEda95NqDNZjXPgue2Gp3hasGnBx8dCzYXE9/5wwWmM=;
  b=GVwDqGQNfF9zoNHIOyU5EQ/ZfONLibUzqT01ipqFGYhIeynrbp/8fNqf
   dyyyWayumsyWajolQNcAsi/iSbwM0aoI92ckFb/Y1/021Xx59JGK/k25U
   eD5y046awKpkNOv/p7OoAOSCHkLEPfhCAHUuKgro1bgoocyJwjlXREP8k
   lxRUxLmZar4GIDfERWibSpKdfsy2tbXIGpUvnW9BYBNGWR/zb7uQ+I0e+
   crt2wo+UEhO+AL+Ie2S5K9vViTeibqBveq37cR7Qfmy+FBh4R3HF/3n3g
   wgULIlxzy0zHT7YEJnE/mdhdZKSlJ4eWj9pPQv2uPb0QJje/r5oYK9o4b
   A==;
X-CSE-ConnectionGUID: eAMjL+3kTryPsg2Hp6ap4w==
X-CSE-MsgGUID: g4W5dWTFQnymbtJ+01aQkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="62136979"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="62136979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 06:59:36 -0700
X-CSE-ConnectionGUID: 65b7cnBdT7K6chN6SRvfMg==
X-CSE-MsgGUID: Tn3uKAB+Q/WQK3IDLHquSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="162938653"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Mar 2025 06:59:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyWii-00089K-1y;
	Sat, 29 Mar 2025 13:59:32 +0000
Date: Sat, 29 Mar 2025 21:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] zsmalloc: let callers select NUMA node to store
 the compressed objects
Message-ID: <202503292135.ZBvAK1oY-lkp@intel.com>
References: <20250329110230.2459730-2-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329110230.2459730-2-nphamcs@gmail.com>

Hi Nhat,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4135040c342ba080328891f1b7e523c8f2f04c58]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/zsmalloc-let-callers-select-NUMA-node-to-store-the-compressed-objects/20250329-190441
base:   4135040c342ba080328891f1b7e523c8f2f04c58
patch link:    https://lore.kernel.org/r/20250329110230.2459730-2-nphamcs%40gmail.com
patch subject: [RFC PATCH 1/2] zsmalloc: let callers select NUMA node to store the compressed objects
config: hexagon-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503292135.ZBvAK1oY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292135.ZBvAK1oY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503292135.ZBvAK1oY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zsmalloc.c:1354:9: error: call to undeclared function 'zs_malloc_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1354 |         return zs_malloc_node(pool, size, gfp, NULL);
         |                ^
>> mm/zsmalloc.c:1357:22: error: static declaration of 'zs_malloc_node' follows non-static declaration
    1357 | static unsigned long zs_malloc_node(struct zs_pool *pool, size_t size,
         |                      ^
   mm/zsmalloc.c:1354:9: note: previous implicit declaration is here
    1354 |         return zs_malloc_node(pool, size, gfp, NULL);
         |                ^
   2 errors generated.


vim +/zs_malloc_node +1354 mm/zsmalloc.c

  1340	
  1341	
  1342	/**
  1343	 * zs_malloc - Allocate block of given size from pool.
  1344	 * @pool: pool to allocate from
  1345	 * @size: size of block to allocate
  1346	 * @gfp: gfp flags when allocating object
  1347	 *
  1348	 * On success, handle to the allocated object is returned,
  1349	 * otherwise an ERR_PTR().
  1350	 * Allocation requests with size > ZS_MAX_ALLOC_SIZE will fail.
  1351	 */
  1352	unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
  1353	{
> 1354		return zs_malloc_node(pool, size, gfp, NULL);
  1355	}
  1356	
> 1357	static unsigned long zs_malloc_node(struct zs_pool *pool, size_t size,
  1358					gfp_t gfp, int *nid)
  1359	{
  1360		unsigned long handle;
  1361		struct size_class *class;
  1362		int newfg;
  1363		struct zspage *zspage;
  1364	
  1365		if (unlikely(!size))
  1366			return (unsigned long)ERR_PTR(-EINVAL);
  1367	
  1368		if (unlikely(size > ZS_MAX_ALLOC_SIZE))
  1369			return (unsigned long)ERR_PTR(-ENOSPC);
  1370	
  1371		handle = cache_alloc_handle(pool, gfp);
  1372		if (!handle)
  1373			return (unsigned long)ERR_PTR(-ENOMEM);
  1374	
  1375		/* extra space in chunk to keep the handle */
  1376		size += ZS_HANDLE_SIZE;
  1377		class = pool->size_class[get_size_class_index(size)];
  1378	
  1379		/* class->lock effectively protects the zpage migration */
  1380		spin_lock(&class->lock);
  1381		zspage = find_get_zspage(class);
  1382		if (likely(zspage)) {
  1383			obj_malloc(pool, zspage, handle);
  1384			/* Now move the zspage to another fullness group, if required */
  1385			fix_fullness_group(class, zspage);
  1386			class_stat_add(class, ZS_OBJS_INUSE, 1);
  1387	
  1388			goto out;
  1389		}
  1390	
  1391		spin_unlock(&class->lock);
  1392	
  1393		zspage = alloc_zspage(pool, class, gfp, nid);
  1394		if (!zspage) {
  1395			cache_free_handle(pool, handle);
  1396			return (unsigned long)ERR_PTR(-ENOMEM);
  1397		}
  1398	
  1399		spin_lock(&class->lock);
  1400		obj_malloc(pool, zspage, handle);
  1401		newfg = get_fullness_group(class, zspage);
  1402		insert_zspage(class, zspage, newfg);
  1403		atomic_long_add(class->pages_per_zspage, &pool->pages_allocated);
  1404		class_stat_add(class, ZS_OBJS_ALLOCATED, class->objs_per_zspage);
  1405		class_stat_add(class, ZS_OBJS_INUSE, 1);
  1406	
  1407		/* We completely set up zspage so mark them as movable */
  1408		SetZsPageMovable(pool, zspage);
  1409	out:
  1410		spin_unlock(&class->lock);
  1411	
  1412		return handle;
  1413	}
  1414	EXPORT_SYMBOL_GPL(zs_malloc);
  1415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
