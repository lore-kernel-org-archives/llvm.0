Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298133277A8;
	Thu, 21 Aug 2025 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782146; cv=none; b=m2V2LOpkHuPqo5BZe1GgPoUJlaSxpTsRJ/XMf32bzAsM9SbofbGxk4Zg3vEt9wUPm3Ukg5GHYXJrQSWAYm6BW49Yd/XXRMj9T842E2n5BQTBPeBZGMNGpItiX4adBE8i3UG6rjwdFjCbVWXo2dfKS4QHyTDn1tprbmR4+jnHYaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782146; c=relaxed/simple;
	bh=NHpYUV7FmYgb0OTO8F6RAuYhb/Qapgmxt6ojvleaaF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3ftzH/n75vnYroC+gdNBHbnJ2sclXDen16VRKOXcNJNCPDJerQEsdvR7WkywaQaPI8OMoyP78xb/Q/859WXIKEYKOOLOLG+IP3tzpXKynXZYJeubfq2OJ7ayUAgxBLQyDSHlPFAbdzmFRC4kLLq4+tHKR3QUOesz8Zdj6sGXd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+9Zwwfo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+9Zwwfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755782144; x=1787318144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHpYUV7FmYgb0OTO8F6RAuYhb/Qapgmxt6ojvleaaF8=;
  b=A+9ZwwfotTIO9pGvBX+75L2w5tcA0ScnnCsYFQbkM1ZhjkuE1oddOqix
   HsVqvtXdRc8o5GDfFyypQPChuN9RSqCh48zkZS4Z2EN5G5leI114eXfgT
   bZeGyqWDZ9HyvkybY2+O1kB6S6XjZtqJ2hkRNymOqz9Jf6MF97stAGdD4
   GLMOnWBVZo6evRpmNsCyDQF/Ee2aTcifZghluOEtinSE8FoukCma9Wm7I
   eYjqEp/G+fK2ja04TtKAlkmJexX50PlL6axwWgjvoqBkzRVedowHSg1mL
   1v00XvoW/FmpfJj2ZmwtDwA1aCdhys82vOKmId72Q3blVNLp4ICUfl/yU
   w==;
X-CSE-ConnectionGUID: ShBSxS94Rgmwa2jaGP15gw==
X-CSE-MsgGUID: uW4ssReRSaGWSj9gDCC3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57094728"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57094728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:15:44 -0700
X-CSE-ConnectionGUID: tUdeKd01Qn+cjcmuF3WUrw==
X-CSE-MsgGUID: 0hRI4TiLQlGFj91E80rYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172659238"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2025 06:15:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up58m-000KIx-1D;
	Thu, 21 Aug 2025 13:15:40 +0000
Date: Thu, 21 Aug 2025 21:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 34/35] mm/kfence/core.c:604:14: error:
 call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202508212132.y3hkSigr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   0c11be702a67d416001abffc75378456f11e1a59
commit: cf7baa29745359f3961bb81cc0c1d1e0c29f3606 [34/35] kfence: drop nth_page() usage
config: x86_64-buildonly-randconfig-003-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212132.y3hkSigr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212132.y3hkSigr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212132.y3hkSigr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kfence/core.c:604:14: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     604 |         start_pfn = virt_to_pfn(__kfence_pool);
         |                     ^
>> mm/kfence/core.c:621:10: error: unterminated function-like macro invocation
     621 |                 slab = page_slab(pfn_to_page(pfn);
         |                        ^
   mm/kfence/../slab.h:156:9: note: macro 'page_slab' defined here
     156 | #define page_slab(p)            (_Generic((p),                          \
         |         ^
>> mm/kfence/core.c:1265:2: error: expected expression
    1265 | }
         |  ^
>> mm/kfence/core.c:1265:2: error: expected '}'
   mm/kfence/core.c:615:47: note: to match this '{'
     615 |         for (pfn = start_pfn; pfn != end_pfn; pfn++) {
         |                                                      ^
>> mm/kfence/core.c:1265:2: error: expected '}'
    1265 | }
         |  ^
   mm/kfence/core.c:596:1: note: to match this '{'
     596 | {
         | ^
   5 errors generated.


vim +/virt_to_pfn +604 mm/kfence/core.c

   589	
   590	/*
   591	 * Initialization of the KFENCE pool after its allocation.
   592	 * Returns 0 on success; otherwise returns the address up to
   593	 * which partial initialization succeeded.
   594	 */
   595	static unsigned long kfence_init_pool(void)
   596	{
   597		unsigned long addr, pfn, start_pfn, end_pfn;
   598		int i;
   599	
   600		if (!arch_kfence_init_pool())
   601			return (unsigned long)__kfence_pool;
   602	
   603		addr = (unsigned long)__kfence_pool;
 > 604		start_pfn = virt_to_pfn(__kfence_pool);
   605		end_pfn = start_pfn + KFENCE_POOL_SIZE / PAGE_SIZE;
   606	
   607		/*
   608		 * Set up object pages: they must have PGTY_slab set to avoid freeing
   609		 * them as real pages.
   610		 *
   611		 * We also want to avoid inserting kfence_free() in the kfree()
   612		 * fast-path in SLUB, and therefore need to ensure kfree() correctly
   613		 * enters __slab_free() slow-path.
   614		 */
   615		for (pfn = start_pfn; pfn != end_pfn; pfn++) {
   616			struct slab *slab;
   617	
   618			if (!i || (i % 2))
   619				continue;
   620	
 > 621			slab = page_slab(pfn_to_page(pfn);
   622			__folio_set_slab(slab_folio(slab));
   623	#ifdef CONFIG_MEMCG
   624			slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
   625					 MEMCG_DATA_OBJEXTS;
   626	#endif
   627		}
   628	
   629		/*
   630		 * Protect the first 2 pages. The first page is mostly unnecessary, and
   631		 * merely serves as an extended guard page. However, adding one
   632		 * additional page in the beginning gives us an even number of pages,
   633		 * which simplifies the mapping of address to metadata index.
   634		 */
   635		for (i = 0; i < 2; i++) {
   636			if (unlikely(!kfence_protect(addr)))
   637				return addr;
   638	
   639			addr += PAGE_SIZE;
   640		}
   641	
   642		for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
   643			struct kfence_metadata *meta = &kfence_metadata_init[i];
   644	
   645			/* Initialize metadata. */
   646			INIT_LIST_HEAD(&meta->list);
   647			raw_spin_lock_init(&meta->lock);
   648			meta->state = KFENCE_OBJECT_UNUSED;
   649			meta->addr = addr; /* Initialize for validation in metadata_to_pageaddr(). */
   650			list_add_tail(&meta->list, &kfence_freelist);
   651	
   652			/* Protect the right redzone. */
   653			if (unlikely(!kfence_protect(addr + PAGE_SIZE)))
   654				goto reset_slab;
   655	
   656			addr += 2 * PAGE_SIZE;
   657		}
   658	
   659		/*
   660		 * Make kfence_metadata visible only when initialization is successful.
   661		 * Otherwise, if the initialization fails and kfence_metadata is freed,
   662		 * it may cause UAF in kfence_shutdown_cache().
   663		 */
   664		smp_store_release(&kfence_metadata, kfence_metadata_init);
   665		return 0;
   666	
   667	reset_slab:
   668		for (pfn = start_pfn; pfn != end_pfn; pfn++) {
   669			struct slab *slab;
   670	
   671			if (!i || (i % 2))
   672				continue;
   673	
   674			slab = page_slab(pfn_to_page(pfn);
   675	#ifdef CONFIG_MEMCG
   676			slab->obj_exts = 0;
   677	#endif
   678			__folio_clear_slab(slab_folio(slab));
   679		}
   680	
   681		return addr;
   682	}
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
