Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326B2DB7BA;
	Tue, 17 Feb 2026 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315531; cv=none; b=ncuAAWDqenUuHUCKpQpKsimlq/fk4wKG+syTAyLi6+rgLzlAGOS1hKCbT1XV8jh9oSPmeqJ2L4ifEremYqC+1i11mJ1xdo43jlrh9Wv/FN50gA4+33MFcKAKTZkgsXD8YBINwN8OOcLjX1/5phjINHvTqvoI7rPb0UOfGyZiV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315531; c=relaxed/simple;
	bh=MkMOKtE3KoTjX8gBeloA1msqwotLC9eRDdSUArVzYHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ppFgnZFZ5YqMRqyg4ELVRvLON068WZOrxHdcWArzWd73rbKzEiMSLtNpO9jp4tFPS8dmPfbCpzfehaw5PHd7thJEeI7vFRI4f63Y3b8aoo8sUSgFthPOi9G4HnBAiCeKleGtHRWp3bTtxwDBWyKjTmMtE9Sd+u6R0PRQdafg51o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOjdUEOV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOjdUEOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771315530; x=1802851530;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MkMOKtE3KoTjX8gBeloA1msqwotLC9eRDdSUArVzYHk=;
  b=bOjdUEOV1+yq5Vo1lMQBh9BusgIMcGqvR7tcG5Pa7keC9ZDz1obkSEmu
   serYf0/COfU0JCkc5pLTTqf2xTCqfm0WxdWfu3JKlvYBn/xmRqdtmsFYH
   zH79C4Xr5s6l951btc3jZ8yV5gl4I1enyfVXskyu0O68+hfZy+0p/LokM
   R1UU3TeOShScFZkf//BV+x7u4+1MsuA5XXhsRW8ku7tDna+PDofkBFw3E
   +N8t7djg8wJOcwdYeLikIbt4hR2ZBP2h/FK6njvupdy07a/wNhwj7blBW
   xIGX4KT6KIE/pPGrxST4WIXqwAoRIE0TAGws0f1fc+1AU5XUapwGSQB8j
   w==;
X-CSE-ConnectionGUID: vO55D5WJTdKv8uoDi+o+vQ==
X-CSE-MsgGUID: HDhNZFxSSEyDeQQg8PdWVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72371732"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72371732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:05:30 -0800
X-CSE-ConnectionGUID: XgBwZQ5BTIG2xLYhODoeYw==
X-CSE-MsgGUID: Mt0jWhDWQTykWFsFCAL4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218348934"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2026 00:05:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsG5F-000000010k4-0tX8;
	Tue, 17 Feb 2026 08:05:25 +0000
Date: Tue, 17 Feb 2026 16:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>
Subject: drivers/gpu/drm/drm_pagemap.c:459:21: warning: parameter
 'addr' set but not used
Message-ID: <202602171532.Ok6WBMK4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Francois,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: ddeda6136038b4b313bb6f9b44f2d363e1233814 drm/pagemap: Allocate foli=
os when possible
date:   7 months ago
config: x86_64-randconfig-012-20260217 (https://download.01.org/0day-ci/arc=
hive/20260217/202602171532.Ok6WBMK4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260217/202602171532.Ok6WBMK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171532.Ok6WBMK4-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:459:21: warning: parameter 'addr' set but =
not used [-Wunused-but-set-parameter]
     459 |                                                 unsigned long ad=
dr)
         |                                                               ^
   1 warning generated.


vim +/addr +459 drivers/gpu/drm/drm_pagemap.c

f86ad0ed620cb3 Matthew Brost   2025-06-19  435 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  436  /**
f86ad0ed620cb3 Matthew Brost   2025-06-19  437   * drm_pagemap_migrate_popu=
late_ram_pfn() - Populate RAM PFNs for a VM area
f86ad0ed620cb3 Matthew Brost   2025-06-19  438   * @vas: Pointer to the VM =
area structure, can be NULL
f86ad0ed620cb3 Matthew Brost   2025-06-19  439   * @fault_page: Fault page
f86ad0ed620cb3 Matthew Brost   2025-06-19  440   * @npages: Number of pages=
 to populate
f86ad0ed620cb3 Matthew Brost   2025-06-19  441   * @mpages: Number of pages=
 to migrate
f86ad0ed620cb3 Matthew Brost   2025-06-19  442   * @src_mpfn: Source array =
of migrate PFNs
f86ad0ed620cb3 Matthew Brost   2025-06-19  443   * @mpfn: Array of migrate =
PFNs to populate
f86ad0ed620cb3 Matthew Brost   2025-06-19  444   * @addr: Start address for=
 PFN allocation
f86ad0ed620cb3 Matthew Brost   2025-06-19  445   *
f86ad0ed620cb3 Matthew Brost   2025-06-19  446   * This function populates =
the RAM migrate page frame numbers (PFNs) for the
f86ad0ed620cb3 Matthew Brost   2025-06-19  447   * specified VM area struct=
ure. It allocates and locks pages in the VM area for
f86ad0ed620cb3 Matthew Brost   2025-06-19  448   * RAM usage. If vas is non=
-NULL use alloc_page_vma for allocation, if NULL use
f86ad0ed620cb3 Matthew Brost   2025-06-19  449   * alloc_page for allocatio=
n.
f86ad0ed620cb3 Matthew Brost   2025-06-19  450   *
f86ad0ed620cb3 Matthew Brost   2025-06-19  451   * Return: 0 on success, ne=
gative error code on failure.
f86ad0ed620cb3 Matthew Brost   2025-06-19  452   */
f86ad0ed620cb3 Matthew Brost   2025-06-19  453  static int drm_pagemap_migr=
ate_populate_ram_pfn(struct vm_area_struct *vas,
f86ad0ed620cb3 Matthew Brost   2025-06-19  454  						struct page *fault_pa=
ge,
f86ad0ed620cb3 Matthew Brost   2025-06-19  455  						unsigned long npages,
f86ad0ed620cb3 Matthew Brost   2025-06-19  456  						unsigned long *mpages,
f86ad0ed620cb3 Matthew Brost   2025-06-19  457  						unsigned long *src_mp=
fn,
f86ad0ed620cb3 Matthew Brost   2025-06-19  458  						unsigned long *mpfn,
f86ad0ed620cb3 Matthew Brost   2025-06-19 @459  						unsigned long addr)
f86ad0ed620cb3 Matthew Brost   2025-06-19  460  {
f86ad0ed620cb3 Matthew Brost   2025-06-19  461  	unsigned long i;
f86ad0ed620cb3 Matthew Brost   2025-06-19  462 =20
ddeda6136038b4 Francois Dugast 2025-08-05  463  	for (i =3D 0; i < npages;)=
 {
ddeda6136038b4 Francois Dugast 2025-08-05  464  		struct page *page =3D NUL=
L, *src_page;
ddeda6136038b4 Francois Dugast 2025-08-05  465  		struct folio *folio;
ddeda6136038b4 Francois Dugast 2025-08-05  466  		unsigned int order =3D 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  467 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  468  		if (!(src_mpfn[i] & MIGRA=
TE_PFN_MIGRATE))
ddeda6136038b4 Francois Dugast 2025-08-05  469  			goto next;
f86ad0ed620cb3 Matthew Brost   2025-06-19  470 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  471  		src_page =3D migrate_pfn_=
to_page(src_mpfn[i]);
f86ad0ed620cb3 Matthew Brost   2025-06-19  472  		if (!src_page)
ddeda6136038b4 Francois Dugast 2025-08-05  473  			goto next;
f86ad0ed620cb3 Matthew Brost   2025-06-19  474 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  475  		if (fault_page) {
f86ad0ed620cb3 Matthew Brost   2025-06-19  476  			if (src_page->zone_devic=
e_data !=3D
f86ad0ed620cb3 Matthew Brost   2025-06-19  477  			    fault_page->zone_dev=
ice_data)
ddeda6136038b4 Francois Dugast 2025-08-05  478  				goto next;
f86ad0ed620cb3 Matthew Brost   2025-06-19  479  		}
f86ad0ed620cb3 Matthew Brost   2025-06-19  480 =20
ddeda6136038b4 Francois Dugast 2025-08-05  481  		order =3D folio_order(pag=
e_folio(src_page));
ddeda6136038b4 Francois Dugast 2025-08-05  482 =20
ddeda6136038b4 Francois Dugast 2025-08-05  483  		/* TODO: Support fallback=
 to single pages if THP allocation fails */
f86ad0ed620cb3 Matthew Brost   2025-06-19  484  		if (vas)
ddeda6136038b4 Francois Dugast 2025-08-05  485  			folio =3D vma_alloc_foli=
o(GFP_HIGHUSER, order, vas, addr);
f86ad0ed620cb3 Matthew Brost   2025-06-19  486  		else
ddeda6136038b4 Francois Dugast 2025-08-05  487  			folio =3D folio_alloc(GF=
P_HIGHUSER, order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  488 =20
ddeda6136038b4 Francois Dugast 2025-08-05  489  		if (!folio)
f86ad0ed620cb3 Matthew Brost   2025-06-19  490  			goto free_pages;
f86ad0ed620cb3 Matthew Brost   2025-06-19  491 =20
ddeda6136038b4 Francois Dugast 2025-08-05  492  		page =3D folio_page(folio=
, 0);
f86ad0ed620cb3 Matthew Brost   2025-06-19  493  		mpfn[i] =3D migrate_pfn(p=
age_to_pfn(page));
ddeda6136038b4 Francois Dugast 2025-08-05  494 =20
ddeda6136038b4 Francois Dugast 2025-08-05  495  next:
ddeda6136038b4 Francois Dugast 2025-08-05  496  		if (page)
ddeda6136038b4 Francois Dugast 2025-08-05  497  			addr +=3D page_size(page=
);
ddeda6136038b4 Francois Dugast 2025-08-05  498  		else
ddeda6136038b4 Francois Dugast 2025-08-05  499  			addr +=3D PAGE_SIZE;
ddeda6136038b4 Francois Dugast 2025-08-05  500 =20
ddeda6136038b4 Francois Dugast 2025-08-05  501  		i +=3D NR_PAGES(order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  502  	}
f86ad0ed620cb3 Matthew Brost   2025-06-19  503 =20
ddeda6136038b4 Francois Dugast 2025-08-05  504  	for (i =3D 0; i < npages;)=
 {
f86ad0ed620cb3 Matthew Brost   2025-06-19  505  		struct page *page =3D mig=
rate_pfn_to_page(mpfn[i]);
ddeda6136038b4 Francois Dugast 2025-08-05  506  		unsigned int order =3D 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  507 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  508  		if (!page)
ddeda6136038b4 Francois Dugast 2025-08-05  509  			goto next_lock;
ddeda6136038b4 Francois Dugast 2025-08-05  510 =20
ddeda6136038b4 Francois Dugast 2025-08-05  511  		WARN_ON_ONCE(!folio_trylo=
ck(page_folio(page)));
f86ad0ed620cb3 Matthew Brost   2025-06-19  512 =20
ddeda6136038b4 Francois Dugast 2025-08-05  513  		order =3D folio_order(pag=
e_folio(page));
ddeda6136038b4 Francois Dugast 2025-08-05  514  		*mpages +=3D NR_PAGES(ord=
er);
ddeda6136038b4 Francois Dugast 2025-08-05  515 =20
ddeda6136038b4 Francois Dugast 2025-08-05  516  next_lock:
ddeda6136038b4 Francois Dugast 2025-08-05  517  		i +=3D NR_PAGES(order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  518  	}
f86ad0ed620cb3 Matthew Brost   2025-06-19  519 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  520  	return 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  521 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  522  free_pages:
ddeda6136038b4 Francois Dugast 2025-08-05  523  	for (i =3D 0; i < npages;)=
 {
f86ad0ed620cb3 Matthew Brost   2025-06-19  524  		struct page *page =3D mig=
rate_pfn_to_page(mpfn[i]);
ddeda6136038b4 Francois Dugast 2025-08-05  525  		unsigned int order =3D 0;
f86ad0ed620cb3 Matthew Brost   2025-06-19  526 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  527  		if (!page)
ddeda6136038b4 Francois Dugast 2025-08-05  528  			goto next_put;
f86ad0ed620cb3 Matthew Brost   2025-06-19  529 =20
f86ad0ed620cb3 Matthew Brost   2025-06-19  530  		put_page(page);
f86ad0ed620cb3 Matthew Brost   2025-06-19  531  		mpfn[i] =3D 0;
ddeda6136038b4 Francois Dugast 2025-08-05  532 =20
ddeda6136038b4 Francois Dugast 2025-08-05  533  		order =3D folio_order(pag=
e_folio(page));
ddeda6136038b4 Francois Dugast 2025-08-05  534 =20
ddeda6136038b4 Francois Dugast 2025-08-05  535  next_put:
ddeda6136038b4 Francois Dugast 2025-08-05  536  		i +=3D NR_PAGES(order);
f86ad0ed620cb3 Matthew Brost   2025-06-19  537  	}
f86ad0ed620cb3 Matthew Brost   2025-06-19  538  	return -ENOMEM;
f86ad0ed620cb3 Matthew Brost   2025-06-19  539  }
f86ad0ed620cb3 Matthew Brost   2025-06-19  540 =20

:::::: The code at line 459 was first introduced by commit
:::::: f86ad0ed620cb3c91ec7d5468e93ac68d727539d drm/gpusvm, drm/pagemap: Mo=
ve migration functionality to drm_pagemap

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
