Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F333E8;
	Sun, 18 Aug 2024 00:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723940104; cv=none; b=YcC31MirrgZcHhSMnch9C/gL6CI4JDV/0wrqErbgp2IleBmUYyY2fhhGjMzgqVyY4rOCuXG8aMeHfrzNXNkPswuJQfMRDw0Jsge2zwrz5nlerFBewp/vZhVht1LBa+5dtam4N9dJIPBH4NDPL4BRTGDsCa5M1kdIuGrdiuGlUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723940104; c=relaxed/simple;
	bh=oHjiOteZUuzVVJIJ0ziqyNzRPvpwabAy5BW7kxCnFMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjs1opKaLxPwfS6e/G5iMJO4h71PQO6guoAy5V+mTKWO3WmZn6iH1YXZx8Zext6w5orCPPzJ4yl1t6nzaQX2NzGT89LMtNPa8HxBNj56bmoUFYLGNNmbYHTxUoio+SSyTYgK339aZA/Y78AZbJOyYg5uaotBpvm4kIsQKLcierE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF6+WI3b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF6+WI3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723940103; x=1755476103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oHjiOteZUuzVVJIJ0ziqyNzRPvpwabAy5BW7kxCnFMU=;
  b=dF6+WI3bEb9t7fjWtHl/ve8dgdKIBglKoXCy8eH/RACyZ4h414+upyaX
   cqgVba3IP1mf++SjxMuVqFnvHHde9GKP2peMPKL4gG0/P/9QY4sRbaE6t
   2kzr1hGNvlbrCIAHZuHcjdHxwusaii0YEYf0oFeTW3qpyuZyhyWvYdhWx
   M7sF57h/TG9oEhJPDayGtWCC/IIj49IashnpdtSpffon0XaoP4r0h9yzv
   0th+XYszcbRMgCfDCViB2/2AcecciwS2B/yNuRAhbBsBOyUjdYpREwc5D
   TUz/FyDvU0kHRfcGBrNDYp0p2IdfIN6/8oY6BxAgMOFsd0MeJIVFO7l9H
   A==;
X-CSE-ConnectionGUID: FMu1l8c0TNSTZneCuo2g9w==
X-CSE-MsgGUID: U3Cu5wtVSJizfgqT/M2q3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="25962430"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="25962430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 17:14:57 -0700
X-CSE-ConnectionGUID: kWxRO7A7Rd2kDiAIZ9hqzg==
X-CSE-MsgGUID: 1h48esCgQQG19zLyqBmVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="59858316"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2024 17:14:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfTZN-0007tc-27;
	Sun, 18 Aug 2024 00:14:53 +0000
Date: Sun, 18 Aug 2024 08:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/4] mm: zswap: zswap_store() extended to handle mTHP
 folios.
Message-ID: <202408180739.8o64wmsT-lkp@intel.com>
References: <20240817050921.18462-3-kanchana.p.sridhar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817050921.18462-3-kanchana.p.sridhar@intel.com>

Hi Kanchana,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/mm-zswap-zswap_is_folio_same_filled-takes-an-index-in-the-folio/20240817-131053
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240817050921.18462-3-kanchana.p.sridhar%40intel.com
patch subject: [PATCH v3 2/4] mm: zswap: zswap_store() extended to handle mTHP folios.
config: i386-buildonly-randconfig-002-20240818 (https://download.01.org/0day-ci/archive/20240818/202408180739.8o64wmsT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180739.8o64wmsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180739.8o64wmsT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zswap.c:1473:3: error: call to undeclared function 'obj_cgroup_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1473 |                 obj_cgroup_get(objcg);
         |                 ^
   mm/zswap.c:1473:3: note: did you mean 'obj_cgroup_put'?
   include/linux/memcontrol.h:1249:20: note: 'obj_cgroup_put' declared here
    1249 | static inline void obj_cgroup_put(struct obj_cgroup *objcg)
         |                    ^
   1 error generated.


vim +/obj_cgroup_get +1473 mm/zswap.c

  1456	
  1457	/*
  1458	 * Stores the page at specified "index" in a folio.
  1459	 */
  1460	static bool zswap_store_page(struct folio *folio, long index,
  1461				     struct obj_cgroup *objcg,
  1462				     struct zswap_pool *pool)
  1463	{
  1464		swp_entry_t swp = folio->swap;
  1465		int type = swp_type(swp);
  1466		pgoff_t offset = swp_offset(swp) + index;
  1467		struct page *page = folio_page(folio, index);
  1468		struct xarray *tree = swap_zswap_tree(swp);
  1469		struct zswap_entry *entry;
  1470		unsigned long value;
  1471	
  1472		if (objcg)
> 1473			obj_cgroup_get(objcg);
  1474	
  1475		if (zswap_check_limits())
  1476			goto reject;
  1477	
  1478		/* allocate entry */
  1479		entry = zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
  1480		if (!entry) {
  1481			zswap_reject_kmemcache_fail++;
  1482			goto reject;
  1483		}
  1484	
  1485		if (zswap_is_folio_same_filled(folio, index, &value)) {
  1486			entry->length = 0;
  1487			entry->value = value;
  1488			atomic_inc(&zswap_same_filled_pages);
  1489			goto store_entry;
  1490		}
  1491	
  1492		/* if entry is successfully added, it keeps the reference */
  1493		if (!zswap_pool_get(pool))
  1494			goto freepage;
  1495	
  1496		entry->pool = pool;
  1497	
  1498		if (!zswap_compress(page, entry))
  1499			goto put_pool;
  1500	
  1501	store_entry:
  1502		entry->swpentry = swp_entry(type, offset);
  1503		entry->objcg = objcg;
  1504	
  1505		if (!zswap_store_entry(tree, entry))
  1506			goto store_failed;
  1507	
  1508		if (objcg) {
  1509			obj_cgroup_charge_zswap(objcg, entry->length);
  1510			count_objcg_event(objcg, ZSWPOUT);
  1511		}
  1512	
  1513		/*
  1514		 * We finish initializing the entry while it's already in xarray.
  1515		 * This is safe because:
  1516		 *
  1517		 * 1. Concurrent stores and invalidations are excluded by folio lock.
  1518		 *
  1519		 * 2. Writeback is excluded by the entry not being on the LRU yet.
  1520		 *    The publishing order matters to prevent writeback from seeing
  1521		 *    an incoherent entry.
  1522		 */
  1523		if (entry->length) {
  1524			INIT_LIST_HEAD(&entry->lru);
  1525			zswap_lru_add(&zswap_list_lru, entry);
  1526		}
  1527	
  1528		/* update stats */
  1529		atomic_inc(&zswap_stored_pages);
  1530		count_vm_event(ZSWPOUT);
  1531	
  1532		return true;
  1533	
  1534	store_failed:
  1535		if (!entry->length)
  1536			atomic_dec(&zswap_same_filled_pages);
  1537		else {
  1538			zpool_free(entry->pool->zpool, entry->handle);
  1539	put_pool:
  1540			zswap_pool_put(pool);
  1541		}
  1542	freepage:
  1543		zswap_entry_cache_free(entry);
  1544	reject:
  1545		obj_cgroup_put(objcg);
  1546		if (zswap_pool_reached_full)
  1547			queue_work(shrink_wq, &zswap_shrink_work);
  1548	
  1549		return false;
  1550	}
  1551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
