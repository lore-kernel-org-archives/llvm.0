Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B0618A95A;
	Thu,  7 Nov 2024 05:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957160; cv=none; b=SUsVIl0gEtsIKSyqSMFBTNeZZh2J47JwFOimhrU/1i5oMRKXN3jVKesTOeP4lp42Jtw5KSeyicS+qfZb6hYhnhFBb7luT92rCUta9kjtTxzpfeeQu9iY/QeolPKw4HRKIKxSD3KQqGuLyzzZL9RyAOB7oNjOOJ6yEadZCPwQuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957160; c=relaxed/simple;
	bh=SOIY9J7Zb1B5q3lryl4MM6pVNgGDnBFocKgmQpvZKQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4sV+k2y2C6zgMdnC4EQLfVfxrePvMr0q3pFn7moemb2SKqkTW6vVC/i/mb7xDssnDuZFouwpXOpGvlQdXKnJS5VN/SSQEEzA0XaDkU93SmlM1ZyreJvXkpLCgbuIFCsIyrydLVZf18K61kX7870rdv1wAOFQRGtaZCjSPIBT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cw31eLTV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cw31eLTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730957158; x=1762493158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOIY9J7Zb1B5q3lryl4MM6pVNgGDnBFocKgmQpvZKQc=;
  b=cw31eLTVwbeLVlhzelmlHG74Z/yDAlLhaeQBEgbDzWa6jbetRN1C0+Yk
   HTNKQtLcf/84epwxwMZ/DHPr5sBOgUT07j2ptZd2+hEnNql6h1EEJIOnA
   41vigK9CHNkgv2iXzIpoSpUKBdAPJAEsLLUWQ6fca9qrtFdypPL+ovg7i
   cyLTC6MI/ZMn4pDlmchr4DTYUhVcyniVTQmdfoz5MJ0lgsWlfxDNuvkPf
   lXgJKk3sBASVB6sUaATGjR3NNN/n6QO7zxyf7U9OLav0lOSpJzlczrG3R
   sFSUAgzUXMCmQvv4Mz3K7+EOFixMiugADDPAtoh79W9RlETArm88QsTsz
   Q==;
X-CSE-ConnectionGUID: odCfQue9QEafDet6T4nQTA==
X-CSE-MsgGUID: qrkeQ2VsQm65zyMz9hzI+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30944003"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30944003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 21:25:57 -0800
X-CSE-ConnectionGUID: co03VzUTQOyRIxwiijP2zA==
X-CSE-MsgGUID: OrIPe1SbSLCZM5kLgaA2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84874016"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 21:25:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8v1m-000pqc-0h;
	Thu, 07 Nov 2024 05:25:54 +0000
Date: Thu, 7 Nov 2024 13:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 13/13] mm: zswap: Compress batching with Intel IAA in
 zswap_store() of large folios.
Message-ID: <202411071309.tajLPRwF-lkp@intel.com>
References: <20241106192105.6731-14-kanchana.p.sridhar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106192105.6731-14-kanchana.p.sridhar@intel.com>

Hi Kanchana,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/crypto-acomp-Define-two-new-interfaces-for-compress-decompress-batching/20241107-032310
base:   7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b
patch link:    https://lore.kernel.org/r/20241106192105.6731-14-kanchana.p.sridhar%40intel.com
patch subject: [PATCH v3 13/13] mm: zswap: Compress batching with Intel IAA in zswap_store() of large folios.
config: powerpc-randconfig-002-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071309.tajLPRwF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071309.tajLPRwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071309.tajLPRwF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/zswap.c:18:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/zswap.c:40:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/zswap.c:1660:33: error: cannot take the address of an rvalue of type 'int'
    1660 |         if (folio_test_large(folio) && READ_ONCE(compress_batching)) {
         |                                        ^         ~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^           ~
   include/asm-generic/rwonce.h:44:70: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                       ^ ~
   3 warnings and 1 error generated.


vim +/int +1660 mm/zswap.c

  1634	
  1635	/*
  1636	 * Modified to use the IAA compress batching framework implemented in
  1637	 * __zswap_store_batch_core() if sysctl vm.compress-batching is 1.
  1638	 * The batching code is intended to significantly improve folio store
  1639	 * performance over the sequential code.
  1640	 */
  1641	bool zswap_store(struct folio *folio)
  1642	{
  1643		long nr_pages = folio_nr_pages(folio);
  1644		swp_entry_t swp = folio->swap;
  1645		struct crypto_acomp_ctx *acomp_ctx;
  1646		struct obj_cgroup *objcg = NULL;
  1647		struct mem_cgroup *memcg = NULL;
  1648		struct zswap_pool *pool;
  1649		size_t compressed_bytes = 0;
  1650		bool ret = false;
  1651		long index;
  1652	
  1653		/*
  1654		 * Improve large folio zswap_store() latency with IAA compress batching,
  1655		 * if this is enabled by setting sysctl vm.compress-batching to "1".
  1656		 * If enabled, the large folio's pages are compressed in parallel in
  1657		 * batches of SWAP_CRYPTO_BATCH_SIZE pages. If disabled, every page in
  1658		 * the large folio is compressed sequentially.
  1659		 */
> 1660		if (folio_test_large(folio) && READ_ONCE(compress_batching)) {
  1661			pool = zswap_pool_current_get();
  1662			if (!pool) {
  1663				pr_err("Cannot setup acomp_batch_ctx for compress batching: no current pool found\n");
  1664				goto sequential_store;
  1665			}
  1666	
  1667			if (zswap_pool_can_batch(pool)) {
  1668				int error = -1;
  1669				bool store_batch = __zswap_store_batch_core(
  1670							folio_nid(folio),
  1671							&folio, &error, 1);
  1672	
  1673				if (store_batch) {
  1674					zswap_pool_put(pool);
  1675					if (!error)
  1676						ret = true;
  1677					return ret;
  1678				}
  1679			}
  1680			zswap_pool_put(pool);
  1681		}
  1682	
  1683	sequential_store:
  1684	
  1685		VM_WARN_ON_ONCE(!folio_test_locked(folio));
  1686		VM_WARN_ON_ONCE(!folio_test_swapcache(folio));
  1687	
  1688		if (!zswap_enabled)
  1689			goto check_old;
  1690	
  1691		objcg = get_obj_cgroup_from_folio(folio);
  1692		if (objcg && !obj_cgroup_may_zswap(objcg)) {
  1693			memcg = get_mem_cgroup_from_objcg(objcg);
  1694			if (shrink_memcg(memcg)) {
  1695				mem_cgroup_put(memcg);
  1696				goto put_objcg;
  1697			}
  1698			mem_cgroup_put(memcg);
  1699		}
  1700	
  1701		if (zswap_check_limits())
  1702			goto put_objcg;
  1703	
  1704		pool = zswap_pool_current_get();
  1705		if (!pool)
  1706			goto put_objcg;
  1707	
  1708		if (objcg) {
  1709			memcg = get_mem_cgroup_from_objcg(objcg);
  1710			if (memcg_list_lru_alloc(memcg, &zswap_list_lru, GFP_KERNEL)) {
  1711				mem_cgroup_put(memcg);
  1712				goto put_pool;
  1713			}
  1714			mem_cgroup_put(memcg);
  1715		}
  1716	
  1717		acomp_ctx = raw_cpu_ptr(pool->acomp_ctx);
  1718		mutex_lock(&acomp_ctx->mutex);
  1719	
  1720		for (index = 0; index < nr_pages; ++index) {
  1721			struct page *page = folio_page(folio, index);
  1722			ssize_t bytes;
  1723	
  1724			bytes = zswap_store_page(page, objcg, pool);
  1725			if (bytes < 0)
  1726				goto put_pool;
  1727			compressed_bytes += bytes;
  1728		}
  1729	
  1730		if (objcg) {
  1731			obj_cgroup_charge_zswap(objcg, compressed_bytes);
  1732			count_objcg_events(objcg, ZSWPOUT, nr_pages);
  1733		}
  1734	
  1735		atomic_long_add(nr_pages, &zswap_stored_pages);
  1736		count_vm_events(ZSWPOUT, nr_pages);
  1737	
  1738		ret = true;
  1739	
  1740	put_pool:
  1741		mutex_unlock(&acomp_ctx->mutex);
  1742		zswap_pool_put(pool);
  1743	put_objcg:
  1744		obj_cgroup_put(objcg);
  1745		if (!ret && zswap_pool_reached_full)
  1746			queue_work(shrink_wq, &zswap_shrink_work);
  1747	check_old:
  1748		/*
  1749		 * If the zswap store fails or zswap is disabled, we must invalidate
  1750		 * the possibly stale entries which were previously stored at the
  1751		 * offsets corresponding to each page of the folio. Otherwise,
  1752		 * writeback could overwrite the new data in the swapfile.
  1753		 */
  1754		if (!ret) {
  1755			unsigned type = swp_type(swp);
  1756			pgoff_t offset = swp_offset(swp);
  1757			struct zswap_entry *entry;
  1758			struct xarray *tree;
  1759	
  1760			for (index = 0; index < nr_pages; ++index) {
  1761				tree = swap_zswap_tree(swp_entry(type, offset + index));
  1762				entry = xa_erase(tree, offset + index);
  1763				if (entry)
  1764					zswap_entry_free(entry);
  1765			}
  1766		}
  1767	
  1768		return ret;
  1769	}
  1770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
