Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6D224DD;
	Wed, 19 Jun 2024 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718763777; cv=none; b=owAVafwWVeYg1IJ3q7X/7EUm8rNRWl8hZ9HJG6NmvBZetvDyWhCUDeaiR4K+UYrnjk7K1dOxftkCjE9UFXaoATN6hj9Rj0QjaZlklwjbJmrvvrBMD4XKcHuj+hZWVYIeILu08RDS9+CQItORHrYXHcQPrQ37p3ebZjzRRJnmsVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718763777; c=relaxed/simple;
	bh=cumVxvDyCpDGybvIjNFloLsnnrG5RJs4g9d6vPcATa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAh9FSR0ku6PywgItTRvjINvMsYEdDEF3zfDTsnLoPKpm7sDr4yONW33hNNJ9lk2w4rfNmUJBRcHQLHoJx61INgJEfjX+j1+LKkIXcSscSrGyccgsTufJltW6lP46/H5iCq7iWMJiq6/Be8gJZU04jX5B1r62sQth4Egl7ZncKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlqkvINq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlqkvINq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718763775; x=1750299775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cumVxvDyCpDGybvIjNFloLsnnrG5RJs4g9d6vPcATa0=;
  b=jlqkvINq9irDolAD9UCbtJBzv6w0Xa8/nX4CH324wF/mK5Izmvg3nYIP
   j8ZdJAClnZvqbJcVCADvWV39weicEbFpZN8uqiX2GfSV+I7jfrJCbO05V
   ACcOuNQZttQ2XTiCviKWFPQO8LSh/XL5S3028O9arCk1dHSbZkCZRFqG6
   tI6qgZH2dVAkXkLPr6IDJs51C1IxzGZmxG5hKrVQXVpu2z3593ijvs9/h
   P/1qUEzWQEzIgOdD9lVsAXHtxbv4vftrqSpaZDUET/r1NUDTgLFBlkJvX
   /ECptK+PbPcN716hxaJroywEP1kB0uOtzw6bwb9I4LzJlzQ6RtQ+tjSN7
   A==;
X-CSE-ConnectionGUID: L8cM31cbSeGH9aH42cvp7g==
X-CSE-MsgGUID: n/ChDBCkTA6v5/4puRbwTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27081911"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27081911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:22:54 -0700
X-CSE-ConnectionGUID: VJ/RhYvMR+yK80yCs3VpOQ==
X-CSE-MsgGUID: hNXR2/GdTK6atoqwwO53tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46186315"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2024 19:22:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJky2-0006Am-1n;
	Wed, 19 Jun 2024 02:22:34 +0000
Date: Wed, 19 Jun 2024 10:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 10/10] include/linux/rmap.h:653:4: error:
 call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202406191246.kwAalz2y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   28522f2898f6be45285b138912245f743d2118b5
commit: d7bf123ba843ca74ae36377c58b495264fdb3dbd [10/10] rmap_id
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240619/202406191246.kwAalz2y-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191246.kwAalz2y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191246.kwAalz2y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:40:
>> include/linux/rmap.h:653:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     653 |                         folio_large_mapcount_dup(folio, orig_nr_pages,
         |                         ^
   include/linux/rmap.h:653:4: note: did you mean 'folio_large_mapcount_sub'?
   include/linux/rmap.h:477:20: note: 'folio_large_mapcount_sub' declared here
     477 | static inline void folio_large_mapcount_sub(struct folio *folio,
         |                    ^
   include/linux/rmap.h:665:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                         folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
         |                         ^
   include/linux/rmap.h:767:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     767 |                         folio_large_mapcount_dup(folio, orig_nr_pages,
         |                         ^
   include/linux/rmap.h:785:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     785 |                         folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
         |                         ^
   4 errors generated.
--
   In file included from mm/memory.c:57:
   In file included from include/linux/ksm.h:14:
>> include/linux/rmap.h:653:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     653 |                         folio_large_mapcount_dup(folio, orig_nr_pages,
         |                         ^
   include/linux/rmap.h:653:4: note: did you mean 'folio_large_mapcount_sub'?
   include/linux/rmap.h:477:20: note: 'folio_large_mapcount_sub' declared here
     477 | static inline void folio_large_mapcount_sub(struct folio *folio,
         |                    ^
   include/linux/rmap.h:665:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                         folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
         |                         ^
   include/linux/rmap.h:767:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     767 |                         folio_large_mapcount_dup(folio, orig_nr_pages,
         |                         ^
   include/linux/rmap.h:785:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     785 |                         folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
         |                         ^
>> mm/memory.c:3593:13: error: call to undeclared function '__folio_large_mapped_shared_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3593 |                         shared = __folio_large_mapped_shared_locked(folio, vma->vm_mm);
         |                                  ^
   5 errors generated.
--
   In file included from mm/mremap.c:15:
   In file included from include/linux/ksm.h:14:
>> include/linux/rmap.h:653:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     653 |                         folio_large_mapcount_dup(folio, orig_nr_pages,
         |                         ^
   include/linux/rmap.h:653:4: note: did you mean 'folio_large_mapcount_sub'?
   include/linux/rmap.h:477:20: note: 'folio_large_mapcount_sub' declared here
     477 | static inline void folio_large_mapcount_sub(struct folio *folio,
         |                    ^
   include/linux/rmap.h:665:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                         folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
         |                         ^
   include/linux/rmap.h:767:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     767 |                         folio_large_mapcount_dup(folio, orig_nr_pages,
         |                         ^
   include/linux/rmap.h:785:4: error: call to undeclared function 'folio_large_mapcount_dup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     785 |                         folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
         |                         ^
   In file included from mm/mremap.c:16:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 4 errors generated.


vim +/folio_large_mapcount_dup +653 include/linux/rmap.h

   631	
   632	static __always_inline void __folio_dup_file_rmap(struct folio *folio,
   633			struct page *page, int nr_pages, struct vm_area_struct *dst_vma,
   634			enum rmap_level level)
   635	{
   636		const int orig_nr_pages = nr_pages;
   637	
   638		__folio_rmap_sanity_checks(folio, page, nr_pages, level);
   639	
   640		switch (level) {
   641		case RMAP_LEVEL_PTE:
   642			if (!folio_test_large(folio)) {
   643				atomic_inc(&page->_mapcount);
   644				break;
   645			}
   646	
   647			do {
   648				atomic_inc(&page->_mapcount);
   649			} while (page++, --nr_pages > 0);
   650	
   651			if (IS_ENABLED(CONFIG_RMAP_ID)) {
   652				folio_large_mapcount_lock(folio);
 > 653				folio_large_mapcount_dup(folio, orig_nr_pages,
   654							 dst_vma->vm_mm);
   655				folio_large_mapcount_unlock(folio);
   656			} else {
   657				atomic_add(orig_nr_pages, &folio->_large_mapcount);
   658			}
   659			break;
   660		case RMAP_LEVEL_PMD:
   661			if (IS_ENABLED(CONFIG_RMAP_ID)) {
   662				folio_large_mapcount_lock(folio);
   663				atomic_set(&folio->_entire_mapcount,
   664					   atomic_read(&folio->_entire_mapcount) + 1);
   665				folio_large_mapcount_dup(folio, 1, dst_vma->vm_mm);
   666				folio_large_mapcount_unlock(folio);
   667			} else {
   668				atomic_inc(&folio->_entire_mapcount);
   669				atomic_inc(&folio->_large_mapcount);
   670			}
   671			break;
   672		}
   673	}
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
