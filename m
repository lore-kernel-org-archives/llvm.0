Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FB48488;
	Fri, 23 Aug 2024 04:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724388382; cv=none; b=C14FIi5+OXtW3vV0JkuAGmNsvOKnHNGxQTPUpdNMWq4fibMWJmjrrydMyJxeSzNQtUO0VrNXwa/mwyQVznua2vZ0PA3y5yllu9Z/42USSRfb4XVwLszbVDjpmtx5cxXr2DOxom7JXYOG72pfvXfVxKOX+3YdvJYEAoIF5Yq1Hdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724388382; c=relaxed/simple;
	bh=nrPGxs9P3Fd82OfvpqvMwSyYDj2EWYzXpVzIlf71A7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVQjlYJF9bC6Ll/O7RSWfVGyUfNwiWe8EG39OOD8P450GxawX57KhYBRtkrhTwlrkeJSPqFI0rMTIhbM32AWvGbi0uOqGDQGrUlygis4d4StlCl9TvcoiykN4AgHrgd6FuYVvz/6+tD6stIl3LZaiwV76zaF2qn0l7zd0/XAl8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7fSiGZ/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7fSiGZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724388379; x=1755924379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrPGxs9P3Fd82OfvpqvMwSyYDj2EWYzXpVzIlf71A7A=;
  b=S7fSiGZ/dbT6EwtBr3oKlInAMU0jCIRxovtgdcNd3ZjgTCK85uhibyKB
   M0iGPHnWFLjBx9w0zbwqMyRmLXdlCAsN7chF0Yy5L/wzhFVS6TinHPDHE
   bUjyrphI42qylN6ToVBKJlHW53qVw3iqwhV7t5rBhgSg6afHrzNXxWk0s
   f05V5FAk7BN2iH+pptgUY4R4e/xMS/sQSUjK9MzMYZHaZ5w5cidBuzDBa
   mjllxKffoQtjoVbuF8unqnR8ZihCwkgOPq8lPHe6chVfWGk4pfRIcsX+P
   P0+KdROwEyZ6B6SrN8+rKQgn+zKjyfHRZe7sVEgiNYPvBPe6pgpGrVGnH
   Q==;
X-CSE-ConnectionGUID: gTGgadRbToCA4QNUwse4AA==
X-CSE-MsgGUID: Wv+O1Z1uR9qY2StSB8+D6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33464394"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="33464394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:46:19 -0700
X-CSE-ConnectionGUID: CqjOBctXRrCyE4rP7o6HBw==
X-CSE-MsgGUID: +4h9AHYGTGObmsFHBP1wlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="84869006"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Aug 2024 21:46:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shMBj-000DVA-3D;
	Fri, 23 Aug 2024 04:46:15 +0000
Date: Fri, 23 Aug 2024 12:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [arnd-playground:mm-6.9-test-merge-for-roxell 62/421]
 mm/kmemleak.c:466:12: error: call to undeclared function
 'kmem_cache_alloc_noprof'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202408231246.Jlz6oorc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git mm-6.9-test-merge-for-roxell
head:   f6cdadcb0c9861e379739044d6e4a20911da851a
commit: de0ecc240fae03c3bb887c6265bc9a1529b600fb [62/421] mm/slub: avoid recursive loop with kmemleak
config: i386-buildonly-randconfig-005-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231246.Jlz6oorc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231246.Jlz6oorc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231246.Jlz6oorc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kmemleak.c:466:12: error: call to undeclared function 'kmem_cache_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     466 |                 object = kmem_cache_alloc_noprof(object_cache, gfp_kmemleak_mask(gfp));
         |                          ^
   mm/kmemleak.c:466:12: note: did you mean 'kmem_cache_alloc_node'?
   include/linux/slab.h:560:7: note: 'kmem_cache_alloc_node' declared here
     560 | void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node) __assume_slab_alignment
         |       ^
>> mm/kmemleak.c:466:10: error: incompatible integer to pointer conversion assigning to 'struct kmemleak_object *' from 'int' [-Wint-conversion]
     466 |                 object = kmem_cache_alloc_noprof(object_cache, gfp_kmemleak_mask(gfp));
         |                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kmemleak.c:950:10: error: call to undeclared function 'kmem_cache_alloc_noprof'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     950 |                 area = kmem_cache_alloc_noprof(scan_area_cache, gfp_kmemleak_mask(gfp));
         |                        ^
>> mm/kmemleak.c:950:8: error: incompatible integer to pointer conversion assigning to 'struct kmemleak_scan_area *' from 'int' [-Wint-conversion]
     950 |                 area = kmem_cache_alloc_noprof(scan_area_cache, gfp_kmemleak_mask(gfp));
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/kmem_cache_alloc_noprof +466 mm/kmemleak.c

   455	
   456	/*
   457	 * Memory pool allocation and freeing. kmemleak_lock must not be held.
   458	 */
   459	static struct kmemleak_object *mem_pool_alloc(gfp_t gfp)
   460	{
   461		unsigned long flags;
   462		struct kmemleak_object *object;
   463	
   464		/* try the slab allocator first */
   465		if (object_cache) {
 > 466			object = kmem_cache_alloc_noprof(object_cache, gfp_kmemleak_mask(gfp));
   467			if (object)
   468				return object;
   469		}
   470	
   471		/* slab allocation failed, try the memory pool */
   472		raw_spin_lock_irqsave(&kmemleak_lock, flags);
   473		object = list_first_entry_or_null(&mem_pool_free_list,
   474						  typeof(*object), object_list);
   475		if (object)
   476			list_del(&object->object_list);
   477		else if (mem_pool_free_count)
   478			object = &mem_pool[--mem_pool_free_count];
   479		else
   480			pr_warn_once("Memory pool empty, consider increasing CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE\n");
   481		raw_spin_unlock_irqrestore(&kmemleak_lock, flags);
   482	
   483		return object;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
