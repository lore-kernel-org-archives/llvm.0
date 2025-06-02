Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76221324E;
	Mon,  2 Jun 2025 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748866381; cv=none; b=sf/G6pCLm9JyRhC363EPzL5/4VlBihBUd/3GmSh77r7cGRdRlgJj8H8EjAXdamG9yiMX7C18ZQH/2f7Hx4gFnaiNwLz5zt/6ukZZR8Vu8l0SDLciVFJxol9IbEqvN+0hIARoUHmQLHYmE8UPuaq9djss7NGOxxsw7E4HyMXNEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748866381; c=relaxed/simple;
	bh=Jo64iV/4gXiTT97vjDq4726vJZuWjbN2EciNaPwMyoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQi4QWdYf5yRqilnwwcq8/BZ8vcoY/8U/37t7Ainz2i1AbSJOje3sm1gdhZkvt6DK6+aF6uEyiIcu55ycsLpr6h+zf8mDjuMfjBHX7GDVvZ34JKSBTNqkW/1N7cbJbmLwt65P0yabMnzzFC2yb+iklb+OdeU/nbHSOJxSGHI0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+jFlMjJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+jFlMjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748866379; x=1780402379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jo64iV/4gXiTT97vjDq4726vJZuWjbN2EciNaPwMyoE=;
  b=O+jFlMjJUS64eHDJy9baq26TuyzTb+XgZUDJEc3R6eS49MmYrqNHnTyr
   J/cvjlpxzolenY7FprjXKq2uvHcqZRJGCu8d36OQ2y8Ga+1NU+ASO/aXf
   tUHvFEdxwgc7mdm45AP2g9005XDjIOvXwYsbm5bXH9q4ZB0ylDwMobcMN
   e/LM0m0Qrxii9l3HjmiFycDFmveaNmVg8OppP+5RHF4V3xHJPX2/+WB/k
   +QiNk+qKrBC1Uh20nlWakWcE2u8H7HqiDy8zZDwN3qHK4RmnGgPmbsJaA
   4MPd6/eI8ZL6vDBEbpDTryUg4lJ6a0FDwsrUFk3YZeyHnZ7S6v3WfL2Ox
   A==;
X-CSE-ConnectionGUID: ei1WipvwQVKD4m1PZQHilw==
X-CSE-MsgGUID: zYx/pQU5TyeyYQPWiv+Ugg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68420475"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="68420475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 05:12:58 -0700
X-CSE-ConnectionGUID: lGiT9YjAQHi4baBqdPvRTw==
X-CSE-MsgGUID: sYu1/T92RcWFkpWnbliGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144485623"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 05:12:57 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uM42A-0001JO-2D;
	Mon, 02 Jun 2025 12:12:54 +0000
Date: Mon, 2 Jun 2025 20:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-stable 290/329] lib/iov_iter.c:474:7: error: call to
 undeclared function 'folio_test_partial_kmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202506022027.IYQzZghL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   0b43b8bc8ef88bb45b018b2d4853d38bfc5ce2a7
commit: d9736929445e7f4c60f0093af61ff0b52e2d4412 [290/329] iov: remove copy_page_from_iter_atomic()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250602/202506022027.IYQzZghL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506022027.IYQzZghL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506022027.IYQzZghL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/iov_iter.c:474:7: error: call to undeclared function 'folio_test_partial_kmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     474 |                 if (folio_test_partial_kmap(folio) &&
         |                     ^
   lib/iov_iter.c:474:7: note: did you mean 'folio_test_partially_mapped'?
   include/linux/page-flags.h:901:1: note: 'folio_test_partially_mapped' declared here
     901 | FOLIO_FLAG(partially_mapped, FOLIO_SECOND_PAGE)
         | ^
   include/linux/page-flags.h:440:37: note: expanded from macro 'FOLIO_FLAG'
     440 | #define FOLIO_FLAG(name, page)                                          \
         |                                                                         ^
   include/linux/page-flags.h:413:29: note: expanded from macro '\
   FOLIO_TEST_FLAG'
     413 | static __always_inline bool folio_test_##name(const struct folio *folio) \
         |                             ^
   <scratch space>:128:1: note: expanded from here
     128 | folio_test_partially_mapped
         | ^
   1 error generated.


vim +/folio_test_partial_kmap +474 lib/iov_iter.c

   459	
   460	size_t copy_folio_from_iter_atomic(struct folio *folio, size_t offset,
   461			size_t bytes, struct iov_iter *i)
   462	{
   463		size_t n, copied = 0;
   464	
   465		if (!page_copy_sane(&folio->page, offset, bytes))
   466			return 0;
   467		if (WARN_ON_ONCE(!i->data_source))
   468			return 0;
   469	
   470		do {
   471			char *to = kmap_local_folio(folio, offset);
   472	
   473			n = bytes - copied;
 > 474			if (folio_test_partial_kmap(folio) &&
   475			    n > PAGE_SIZE - offset_in_page(offset))
   476				n = PAGE_SIZE - offset_in_page(offset);
   477	
   478			pagefault_disable();
   479			n = __copy_from_iter(to, n, i);
   480			pagefault_enable();
   481			kunmap_local(to);
   482			copied += n;
   483			offset += n;
   484		} while (copied != bytes && n > 0);
   485	
   486		return copied;
   487	}
   488	EXPORT_SYMBOL(copy_folio_from_iter_atomic);
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
