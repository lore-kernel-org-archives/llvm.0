Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F012CA7;
	Sat, 18 May 2024 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716047227; cv=none; b=obt2Vqd/Qr0ckl0W5VoBcHA9hUxgAHFhHCGipqvX8B3UvNmCkiHkpN9xfMWCtQ0poKYOZEf26HutwmUHHX/g3sUAuXJR1bJMtf5Byu2cUyzSZ6IOlBnM6YUtfdXqBMdjuO+Fwz87hB7gpZQ6FtbftJrEOpwUQ56S/DEiedmkMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716047227; c=relaxed/simple;
	bh=fkdPGw7IOOtRvXaP89FYOQOVybsTq/0RrQr0n3N2x0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTd8JcHcwccUKFF6L2jwCGJdz7H24jtevGtiV0rvu8TNGhXIQot25DVBUq/WyW1fcpldmfcdDfEMdT63ZzGpsK4DHnLBij20SECdCaj/FOxC2WSXuK7o7dDaFgyc5wOAHgHuqeYt31Ttm/k/SjN5Ey9Yt9NM9x33BGfoA55rReo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vw8IZsw0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vw8IZsw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716047225; x=1747583225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkdPGw7IOOtRvXaP89FYOQOVybsTq/0RrQr0n3N2x0s=;
  b=Vw8IZsw0xA7SB3QGAr1Ko2a52KT/7Wehjsj8zVNtBKz5hYWnkCKn1HdZ
   k7CnnTQ7/PiUwz6wekGn3kVpP9OK2CGPQpo87y1zfu6sLmeTRbhVaD4pH
   y2YuJlWDE+AZK1gqsJav/SMDYBiajTxi6caApd8f6tXlUQPtpaqcjXxAJ
   iDrri05XH5qi6NJWAiRkA+Fx1iR+T56BZ1otXtTScPvvez68CNv3N45Ql
   M0QjDIngjsFId+9LYOPUirglwRtjL35rvcC2zzM4wOSXMfg1nAJ1oTEY0
   mVANVbS96CqVt+hp6orAbChIKwqKxiPm8schc12CpKtE13ALAH13IdvdG
   Q==;
X-CSE-ConnectionGUID: +8Oj7xhqRUOITSoXnHqMQA==
X-CSE-MsgGUID: 6vyxpmlOTMywLDpZraPwWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="34733265"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="34733265"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:47:04 -0700
X-CSE-ConnectionGUID: hcN5vAo5SLu2yiZt1+4IwQ==
X-CSE-MsgGUID: hpjuT+/FQ9StPYzLVqURXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="62927921"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2024 08:47:04 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8MGx-0002Ku-1t;
	Sat, 18 May 2024 15:47:00 +0000
Date: Sat, 18 May 2024 23:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v5 14/14] mm/page_frag_cache.c:291:24:
 warning: variable 'remaining' is uninitialized when used here
Message-ID: <202405182348.NZ2WqUhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v5
head:   e6543161a8d13e28e244803a755a007021b9dea7
commit: e6543161a8d13e28e244803a755a007021b9dea7 [14/14] add alloc_pg api and refactor alloc_va api
config: arm-clps711x_defconfig (https://download.01.org/0day-ci/archive/20240518/202405182348.NZ2WqUhQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182348.NZ2WqUhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182348.NZ2WqUhQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_frag_cache.c:17:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   mm/page_frag_cache.c:289:15: warning: unused variable 'page' [-Wunused-variable]
     289 |         struct page *page;
         |                      ^~~~
>> mm/page_frag_cache.c:291:24: warning: variable 'remaining' is uninitialized when used here [-Wuninitialized]
     291 |         if (unlikely(fragsz > remaining)) {
         |                               ^~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/page_frag_cache.c:288:24: note: initialize the variable 'remaining' to silence this warning
     288 |         unsigned int remaining;
         |                               ^
         |                                = 0
   3 warnings generated.


vim +/remaining +291 mm/page_frag_cache.c

   269	
   270	/**
   271	 * __page_frag_alloc_va_align() - Alloc a page fragment with aligning
   272	 * requirement.
   273	 * @nc: page_frag cache from which to allocate
   274	 * @fragsz: the requested fragment size
   275	 * @gfp_mask: the allocation gfp to use when cache need to be refilled
   276	 * @align_mask: the requested aligning requirement for the 'va'
   277	 *
   278	 * Get a page fragment from page_frag cache with aligning requirement.
   279	 *
   280	 * Return:
   281	 * Return va of the page fragment, otherwise return NULL.
   282	 */
   283	void *__page_frag_alloc_va_align(struct page_frag_cache *nc,
   284					 unsigned int fragsz, gfp_t gfp_mask,
   285					 unsigned int align_mask)
   286	{
   287		struct encoded_va *encoded_va;
   288		unsigned int remaining;
   289		struct page *page;
   290	
 > 291		if (unlikely(fragsz > remaining)) {
   292			/* fragsz is not supposed to be bigger than PAGE_SIZE as we are
   293			 * allowing order 3 page allocation to fail easily under low
   294			 * memory condition.
   295			 */
   296			if (WARN_ON_ONCE(fragsz > PAGE_SIZE) ||
   297			    unlikely(!page_frag_cache_refill(nc, gfp_mask)))
   298				return NULL;
   299		}
   300	
   301		encoded_va = nc->encoded_va;
   302		remaining = nc->remaining & align_mask;
   303		nc->remaining = remaining - fragsz;
   304		nc->pagecnt_bias--;
   305	
   306		return encoded_page_address(encoded_va) +
   307			__page_frag_cache_page_offset(encoded_va, remaining);
   308	}
   309	EXPORT_SYMBOL(__page_frag_alloc_va_align);
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
