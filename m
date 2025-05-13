Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A331A3BD8;
	Tue, 13 May 2025 23:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747178548; cv=none; b=RPeLQ2ZWYND4fFLE65m7OoyFCNZusN2ChgetfQxt1vdTUu+2oS8aPHHLBX63Mcrm0oQon0/vScG1h3wzaPzVnk5HGMrDTJ948x4aZiLUP4o+MdseMvIkxrBbDZ2VTTSsGztI+wG4WA9KmiWUEewXTbhGfTq9k4itDdKInIw9LqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747178548; c=relaxed/simple;
	bh=DD80lgnAJgtEE17Fzouqlxmw5KRDy7CU5SNjZD28qJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvdo1K4JMcejfT+fy62TzM65aoJoM7zxmUaG6Zva1L52YYU7PCHvNVtjgPt2b2xAFe2wofIlQuQiXq6sFGkoiJ3f2ifOXGxP0rUsurfhTcEoJY8jcKnbtqCTvYAUr4F6eXjM6dx4wDGrWvLH7LeYkFiXR4XMXVIqH9CPLLXMndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifM5N6Wg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifM5N6Wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747178547; x=1778714547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DD80lgnAJgtEE17Fzouqlxmw5KRDy7CU5SNjZD28qJ8=;
  b=ifM5N6WgdJAqSbOmw9Yp8W9fuijyEZKXE9TUkYSq7WIocKrh813s0iNV
   eoH6h6N23bi2kZNL/l0VTRLDBA3jD0ibheyTkqDiUM/7nRz/PoAsiW/de
   CtV/ZySKRFs1UZP27KMrXhg1gPJEN8nOacjB9iNBHDg6cLcSoENkNVSKI
   N8UQSC/rumljeu5BN8LX6TMaj70PyO72IH0oFhBiEExcTbB1KeHh1ylGT
   t8wzK19lrGASE1Z09b3xCGXBMkMK8uvI4wHz3OzbvENzGlAx8Ac81C5wP
   FXUEwA7/AwcVvveM4Nlwc0PSmmu9ZS2FifVU8EgzMZJfgM/79hmIUpP9Y
   A==;
X-CSE-ConnectionGUID: gluykwsJQEmsuwh0h23n/A==
X-CSE-MsgGUID: k5dZeTFySuC4PhweifaS3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48305068"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48305068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 16:22:26 -0700
X-CSE-ConnectionGUID: 48bMmYhRRT2ihLCZUKQBYg==
X-CSE-MsgGUID: LM5KCJvvTmyLnbkYKIHhYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="141882623"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2025 16:22:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEyww-000GUl-2j;
	Tue, 13 May 2025 23:22:14 +0000
Date: Wed, 14 May 2025 07:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 22/22] include/linux/mm.h:2161:47:
 error: use of undeclared identifier 'PAGE_MAPPING_FLAGS'
Message-ID: <202505140705.prYAlYt7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   e21c02eb687873041b47954e3fc7b47e9d3d3675
commit: e21c02eb687873041b47954e3fc7b47e9d3d3675 [22/22] mm: rename PAGE_MAPPING_* to FOLIO_MAPPING_*
config: arm-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505140705.prYAlYt7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140705.prYAlYt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140705.prYAlYt7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/mm.h:2161:47: error: use of undeclared identifier 'PAGE_MAPPING_FLAGS'
    2161 |         } else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
         |                                                      ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:98: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2209529806
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2209529806
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2209529806
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2209529806
   make: Target 'prepare' not remade because of errors.


vim +/PAGE_MAPPING_FLAGS +2161 include/linux/mm.h

fa4e3f5ffa5e6e Vishal Moola (Oracle  2023-01-30  2116) 
e6f83630b79ed4 Shivank Garg          2025-04-30  2117  /**
e6f83630b79ed4 Shivank Garg          2025-04-30  2118   * folio_expected_ref_count - calculate the expected folio refcount
e6f83630b79ed4 Shivank Garg          2025-04-30  2119   * @folio: the folio
e6f83630b79ed4 Shivank Garg          2025-04-30  2120   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2121   * Calculate the expected folio refcount, taking references from the pagecache,
e6f83630b79ed4 Shivank Garg          2025-04-30  2122   * swapcache, PG_private and page table mappings into account. Useful in
e6f83630b79ed4 Shivank Garg          2025-04-30  2123   * combination with folio_ref_count() to detect unexpected references (e.g.,
e6f83630b79ed4 Shivank Garg          2025-04-30  2124   * GUP or other temporary references).
e6f83630b79ed4 Shivank Garg          2025-04-30  2125   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2126   * Does currently not consider references from the LRU cache. If the folio
e6f83630b79ed4 Shivank Garg          2025-04-30  2127   * was isolated from the LRU (which is the case during migration or split),
e6f83630b79ed4 Shivank Garg          2025-04-30  2128   * the LRU cache does not apply.
e6f83630b79ed4 Shivank Garg          2025-04-30  2129   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2130   * Calling this function on an unmapped folio -- !folio_mapped() -- that is
e6f83630b79ed4 Shivank Garg          2025-04-30  2131   * locked will return a stable result.
e6f83630b79ed4 Shivank Garg          2025-04-30  2132   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2133   * Calling this function on a mapped folio will not result in a stable result,
e6f83630b79ed4 Shivank Garg          2025-04-30  2134   * because nothing stops additional page table mappings from coming (e.g.,
e6f83630b79ed4 Shivank Garg          2025-04-30  2135   * fork()) or going (e.g., munmap()).
e6f83630b79ed4 Shivank Garg          2025-04-30  2136   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2137   * Calling this function without the folio lock will also not result in a
e6f83630b79ed4 Shivank Garg          2025-04-30  2138   * stable result: for example, the folio might get dropped from the swapcache
e6f83630b79ed4 Shivank Garg          2025-04-30  2139   * concurrently.
e6f83630b79ed4 Shivank Garg          2025-04-30  2140   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2141   * However, even when called without the folio lock or on a mapped folio,
e6f83630b79ed4 Shivank Garg          2025-04-30  2142   * this function can be used to detect unexpected references early (for example,
e6f83630b79ed4 Shivank Garg          2025-04-30  2143   * if it makes sense to even lock the folio and unmap it).
e6f83630b79ed4 Shivank Garg          2025-04-30  2144   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2145   * The caller must add any reference (e.g., from folio_try_get()) it might be
e6f83630b79ed4 Shivank Garg          2025-04-30  2146   * holding itself to the result.
e6f83630b79ed4 Shivank Garg          2025-04-30  2147   *
e6f83630b79ed4 Shivank Garg          2025-04-30  2148   * Returns the expected folio refcount.
e6f83630b79ed4 Shivank Garg          2025-04-30  2149   */
e6f83630b79ed4 Shivank Garg          2025-04-30  2150  static inline int folio_expected_ref_count(const struct folio *folio)
e6f83630b79ed4 Shivank Garg          2025-04-30  2151  {
e6f83630b79ed4 Shivank Garg          2025-04-30  2152  	const int order = folio_order(folio);
e6f83630b79ed4 Shivank Garg          2025-04-30  2153  	int ref_count = 0;
e6f83630b79ed4 Shivank Garg          2025-04-30  2154  
e6f83630b79ed4 Shivank Garg          2025-04-30  2155  	if (WARN_ON_ONCE(folio_test_slab(folio)))
e6f83630b79ed4 Shivank Garg          2025-04-30  2156  		return 0;
e6f83630b79ed4 Shivank Garg          2025-04-30  2157  
e6f83630b79ed4 Shivank Garg          2025-04-30  2158  	if (folio_test_anon(folio)) {
e6f83630b79ed4 Shivank Garg          2025-04-30  2159  		/* One reference per page from the swapcache. */
e6f83630b79ed4 Shivank Garg          2025-04-30  2160  		ref_count += folio_test_swapcache(folio) << order;
e6f83630b79ed4 Shivank Garg          2025-04-30 @2161  	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
e6f83630b79ed4 Shivank Garg          2025-04-30  2162  		/* One reference per page from the pagecache. */
e6f83630b79ed4 Shivank Garg          2025-04-30  2163  		ref_count += !!folio->mapping << order;
e6f83630b79ed4 Shivank Garg          2025-04-30  2164  		/* One reference from PG_private. */
e6f83630b79ed4 Shivank Garg          2025-04-30  2165  		ref_count += folio_test_private(folio);
e6f83630b79ed4 Shivank Garg          2025-04-30  2166  	}
e6f83630b79ed4 Shivank Garg          2025-04-30  2167  
e6f83630b79ed4 Shivank Garg          2025-04-30  2168  	/* One reference per page table mapping. */
e6f83630b79ed4 Shivank Garg          2025-04-30  2169  	return ref_count + folio_mapcount(folio);
e6f83630b79ed4 Shivank Garg          2025-04-30  2170  }
e6f83630b79ed4 Shivank Garg          2025-04-30  2171  

:::::: The code at line 2161 was first introduced by commit
:::::: e6f83630b79ed43763cd19a20f80885f568b8991 mm: add folio_expected_ref_count() for reference count calculation

:::::: TO: Shivank Garg <shivankg@amd.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
